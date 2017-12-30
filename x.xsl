<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                indent="yes" />
    <xsl:template match="outline:outline">
        <html>
            <head>
                <title>目录</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <style>
                    h1 {
                    text-align: center;
                    font-size: 20px;
                    font-family: arial;
                    }
                    span {right:0;position: absolute; display:block;font-size:12px;padding-left:5px;}
                    li {list-style: none;}
                    ul {
                    font-size: 18px;
                    font-family: "\5b8b\4f53", Helvetica, Tahoma, arial, sans-serif;;
                    }
                    ul ul {font-size: 80%; }
                    ul {padding-left: 0em;}
                    ul ul {padding-left: 1em;}
                    a {
                       text-decoration:none;
                       color: black;
                       position: absolute;
                       background: #fff;
                       display:block;
                       font-size:12px;
                    padding-right:5px;
                    }
                    hr{
                       position: absolute;left:10px;right:10px;top:0;
                    font-size:12px;
                       height:1px;border:none;border-top:1px dotted #000;
                    }
                    div{
                       position: relative;
                    width:100%;
                    height:30px;
                    }
                </style>
            </head>
            <body>
                <h1>目录</h1>
                <ul><xsl:apply-templates select="outline:item/outline:item"/></ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="outline:item">
        <li>
            <xsl:if test="@title!=''">
                <div>
                    <hr></hr>
                    <a>
                        <xsl:if test="@link">
                            <xsl:attribute name="href"><xsl:value-of select="@link"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@backLink">
                            <xsl:attribute name="name"><xsl:value-of select="@backLink"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="@title" />
                    </a>
                    <span> <xsl:value-of select="@page" /> </span>
                </div>
            </xsl:if>
            <ul>
                <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
                <xsl:apply-templates select="outline:item"/>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>