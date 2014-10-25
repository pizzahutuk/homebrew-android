######
# A script which updates the formulas for android
#!/bin/bash
REPO_URL="${REPO_URL:-http://dl-ssl.google.com/android/repository/repository-10.xml}"
SYSIMG_URL="${SYSIMG_URL:-http://dl-ssl.google.com/android/repository/sys-img/android/sys-img.xml}"

# Set up our variables
cd "$(dirname "${0}")"
BIN_DIR="$(pwd)"
XSL_DIR="${BIN_DIR}/xsl"
TEMPLATE_DIR="${BIN_DIR}/template"
cd ->/dev/null

# Set up our variables
cd "$(dirname "${0}")/../Formula"
FORMULA_DIR="$(pwd)"
cd ->/dev/null

WORK_DIR="${TMPDIR}/HomebrewAndroid.$$"
mkdir -p "${WORK_DIR}"
trap 'rm -rf "${WORK_DIR}"' EXIT


REPO_FILE="${WORK_DIR}/repo.xml"
SYSIMG_FILE="${WORK_DIR}/sysimg.xml"
curl -fsSL "${REPO_URL}" -o "${REPO_FILE}"
curl -fsSL "${SYSIMG_URL}" -o "${SYSIMG_FILE}"

function template { cat "${TEMPLATE_DIR}/${1}.tpl"; }
function apply_xsl { xsltproc ${3} "${XSL_DIR}/${1}.xsl" "${2}"; }
function do_replace { sed -e "s|%%${1}%%|$(echo -n "${2}" | tr '\n' '\a')|" | tr '\a' '\n'; }
function gen_tool {
    template ${1} | do_replace "ARCHIVE_INFO" "$(apply_xsl ${1} "${REPO_FILE}")" > "${FORMULA_DIR}/android-${1}.rb"
}
function remove_line {
    grep -v "${1}" "${2}" > "${WORK_DIR}/tempfile" && mv "${WORK_DIR}/tempfile" "${2}"
}
function sed_inplace {
    sed -e "${1}" "${2}" | tr '\a' '\n' > "${WORK_DIR}/tempfile" && mv "${WORK_DIR}/tempfile" "${2}"
}
function gen_sdk_extra {
    API_PARAM="--param api-level ${1}"
    UPPER="$(echo "${2}" | tr '[:lower:]' '[:upper:]')"
    if [ -n "$(apply_xsl has-${2} "${REPO_FILE}" "${API_PARAM}")" ]; then
        template ${2} | \
            do_replace "ARCHIVE_INFO" "$(apply_xsl ${2} "${REPO_FILE}" "${API_PARAM}")" | \
            do_replace "API_VERSION" "${plat}" \
                > "${FORMULA_DIR}/android-${plat}-${2}.rb" || return $?
        sed_inplace "s|%%${UPPER}%%|'toonetown/android/android-${plat}-${2}'|" \
                    "${FORMULA_DIR}/android-${plat}.rb"
    else
        remove_line "%%${UPPER}%%" "${FORMULA_DIR}/android-${plat}.rb"
    fi
}

# Create the SDK, platform-tools, build-tools and docs formulas
gen_tool sdk            || exit $?
gen_tool platform-tools || exit $?
gen_tool build-tools    || exit $?
gen_tool docs           || exit $?

# Generate a platform formula for each one in the repository
for plat in $(apply_xsl list-platforms "${REPO_FILE}"); do
    API_PARAM="--param api-level ${plat}"
    
    # Create the main formula for this platform
    template platform | \
        do_replace "ARCHIVE_INFO" "$(apply_xsl platform "${REPO_FILE}" "${API_PARAM}")" | \
        do_replace "API_VERSION" "${plat}" \
        > "${FORMULA_DIR}/android-${plat}.rb" || exit $?

    # Create the sources and samples formulas for this platform (if it has them)
    gen_sdk_extra ${plat} sources || exit $?
    gen_sdk_extra ${plat} samples || exit $?
    
    # Pull up the images for this platform
    for img in $(apply_xsl list-sysimgs "${SYSIMG_FILE}" "${API_PARAM}"); do
        LONG_ABI="$(echo ${img} | cut -d'|' -f1)"
        SHORT_ABI="$(echo ${img} | cut -d'|' -f2)"
        LOWER_ABI="$(echo "${SHORT_ABI}" | tr '[:upper:]' '[:lower:]')"
        NAME="android-${plat}-sysimg-${LOWER_ABI}"
        
        ABI_PARAM="${API_PARAM} --stringparam abi ${LONG_ABI}"
        template sysimg | \
            do_replace "ARCHIVE_INFO" "$(apply_xsl sysimg "${SYSIMG_FILE}" "${ABI_PARAM}")" | \
            do_replace "API_VERSION" "${plat}" | \
            do_replace "SHORT_ABI" "$(echo "${SHORT_ABI}" | tr -d '_')" | \
            do_replace "LONG_ABI" "${LONG_ABI}" \
                > "${FORMULA_DIR}/${NAME}.rb" || exit $?

        if [ -n "$(echo "${img}" | cut -d'|' -f3)" ]; then 
            sed_inplace "s|\(%%SYSIMG%%\)|    'toonetown/android/${NAME}',$(printf '\a')\1|" \
                        "${FORMULA_DIR}/android-${plat}.rb"
        fi
    done
    # Now, remove the images tag for the platform
    remove_line "%%SYSIMG%%" "${FORMULA_DIR}/android-${plat}.rb"
done
