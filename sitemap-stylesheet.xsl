<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>XML Sitemap</title>
        <style>
          body { font-family: sans-serif; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
          a { text-decoration: none; color: #0000EE; }
          a:visited { color: #551A8B; }
        </style>
      </head>
      <body>
        <h1>XML Sitemap</h1>

        <xsl:choose>
          <!-- News Sitemap -->
          <xsl:when test="//news:news">
            <h2>News Sitemap</h2>
            <table>
              <tr>
                <th>URL</th>
                <th>Publication Name</th>
                <th>Publication Date</th>
                <th>Title</th>
              </tr>
              <xsl:for-each select="//sitemap:url">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><xsl:value-of select="news:news/news:publication/news:name"/></td>
                  <td><xsl:value-of select="news:news/news:publication_date"/></td>
                  <td><xsl:value-of select="news:news/news:title"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:when>

          <!-- Image Sitemap -->
          <xsl:when test="//image:image">
            <h2>Image Sitemap</h2>
            <table>
              <tr>
                <th>Page URL</th>
                <th>Image URL</th>
                <th>Image Title</th>
              </tr>
              <xsl:for-each select="//sitemap:url">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><a href="{image:image/image:loc}"><xsl:value-of select="image:image/image:loc"/></a></td>
                  <td><xsl:value-of select="image:image/image:title"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:when>

          <!-- Video Sitemap -->
          <xsl:when test="//video:video">
            <h2>Video Sitemap</h2>
            <table>
              <tr>
                <th>Page URL</th>
                <th>Thumbnail</th>
                <th>Title</th>
                <th>Description</th>
              </tr>
              <xsl:for-each select="//sitemap:url">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><img src="{video:video/video:thumbnail_loc}" style="max-width:100px; max-height:100px;" /></td>
                  <td><xsl:value-of select="video:video/video:title"/></td>
                  <td><xsl:value-of select="video:video/video:description"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:when>

          <!-- Sitemap Index -->
          <xsl:when test="//sitemap:sitemapindex">
            <h2>Sitemap Index</h2>
            <table>
              <tr>
                <th>Sitemap URL</th>
                <th>Last Modified</th>
              </tr>
              <xsl:for-each select="//sitemap:sitemap">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><xsl:value-of select="sitemap:lastmod"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:when>

          <!-- Standard Sitemap -->
          <xsl:otherwise>
            <h2>Standard Sitemap</h2>
            <table>
              <tr>
                <th>URL</th>
                <th>Last Modified</th>
              </tr>
              <xsl:for-each select="//sitemap:url">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><xsl:value-of select="sitemap:lastmod"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:otherwise>
        </xsl:choose>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>