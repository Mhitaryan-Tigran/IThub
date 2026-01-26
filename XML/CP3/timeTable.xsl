<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Анализ расписания занятий</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; }
          .stat { margin: 10px 0; padding: 10px; background-color: #f0f0f0; border-radius: 5px; }
          .stat-label { font-weight: bold; color: #333; }
          .stat-value { color: #0066cc; font-size: 1.1em; }
        </style>
      </head>
      <body>
        <h1>Анализ расписания занятий</h1>
        
        <div class="stat">
          <span class="stat-label">Комплекс Курская: всего занятий </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[@complex='КУ'])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Комплекс ВДНХ: всего занятий </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[@complex='ВТ'])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Занятий в 10:00 </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[time='10:00'])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Занятий в 15:30 </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[time='15:30'])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Занятий в 17:20 </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[time='17:20'])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Первое занятие: </span>
          <span class="stat-value">
            <xsl:value-of select="//lesson[1]/thema"/>
            <xsl:text> состоялось </xsl:text>
            <xsl:value-of select="//lesson[1]/date"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Последнее занятие: </span>
          <span class="stat-value">
            <xsl:value-of select="//lesson[last()]/thema"/>
            <xsl:text> состоялось </xsl:text>
            <xsl:value-of select="//lesson[last()]/date"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Занятий по DTD </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[contains(thema, 'DTD')])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Чётных занятий на Курской </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[@complex='КУ' and (@no mod 2 = 0)])"/>
          </span>
        </div>
        
        <div class="stat">
          <span class="stat-label">Нечётных занятий на ВДНХ </span>
          <span class="stat-value">
            <xsl:value-of select="count(//lesson[@complex='ВТ' and (@no mod 2 = 1)])"/>
          </span>
        </div>
        
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
