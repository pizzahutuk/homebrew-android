<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sdk="http://schemas.android.com/sdk/android/addon/7">
    <xsl:param name="vendor" />
    <xsl:param name="path" />
    <xsl:output method="text" />
    <xsl:template match="sdk:sdk-addon">
        <xsl:for-each select="sdk:extra">
            <xsl:if test="sdk:vendor-id = $vendor and sdk:path = $path">
                <xsl:apply-templates select="." />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:key name="kExtraKey" match="sdk:extra" use="concat(sdk:vendor-id, '|', sdk:path)" />
    <xsl:template match="sdk:extra[
        not(generate-id() = generate-id(key('kExtraKey', concat(sdk:vendor-id, '|', sdk:path))[last()]))
    ]" />

    <xsl:template match="sdk:extra">
        <xsl:variable name="archive" select="./sdk:archives/sdk:archive" />
        <xsl:if test="sdk:description != ''">
            <xsl:text>  desc "</xsl:text>
            <xsl:value-of select="sdk:description" />
            <xsl:text>"&#10;</xsl:text>
        </xsl:if>
        
        <xsl:text>  url "</xsl:text>
        <xsl:if test="not(contains($archive/sdk:url, '://'))">
            <xsl:text>https://dl.google.com/android/repository/</xsl:text>
        </xsl:if>
        <xsl:value-of select="$archive/sdk:url" />
        <xsl:text>"&#10;</xsl:text>

        <xsl:text>  version "</xsl:text>
        <xsl:value-of select="./sdk:revision/sdk:major" />
        <xsl:if test="./sdk:revision/sdk:minor">
            <xsl:text>.</xsl:text>
            <xsl:value-of select="./sdk:revision/sdk:minor" />
            <xsl:if test="./sdk:revision/sdk:micro">
                <xsl:text>.</xsl:text>
                <xsl:value-of select="./sdk:revision/sdk:micro" />
            </xsl:if>
        </xsl:if>
        <xsl:text>"&#10;</xsl:text>

        <xsl:text>  </xsl:text>
        <xsl:value-of select="$archive/sdk:checksum/@type" />
        <xsl:text> "</xsl:text>
        <xsl:value-of select="$archive/sdk:checksum" />
        <xsl:text>"</xsl:text>
    </xsl:template>
</xsl:stylesheet>
