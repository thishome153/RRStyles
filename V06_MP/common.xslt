<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:gkn="urn://x-artefacts-rosreestr-gov-ru/requests/gkn/3.0.9"
	xmlns:gen="urn://x-artefacts-rosreestr-ru/commons/complex-types/general-gkn/1.0.2">

	<!-- <xsl:import href="FormatCheck.xslt" /> -->
	  <xsl:import href="Dictionary.xslt" />  <!-- Dictionary to work with files or direct -->

	<xsl:variable name="TableWidth" select="800" />
	<xsl:variable name="ppp" select="0" />
	<xsl:variable name="ttt" select="''" />

	<xsl:variable name="DocumentVersion">
		<xsl:choose>
			<xsl:when test="/Requests_GZK_Realty">
				<xsl:text>Request</xsl:text>
				<xsl:choose>
					<xsl:when test="/Requests_GZK_Realty/eDocument/@Version != ''">
						<xsl:value-of select="/Requests_GZK_Realty/eDocument/@Version" />
					</xsl:when>
					<xsl:otherwise>
						11
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="/RequestGKN">
				<xsl:text>RequestGKN</xsl:text>
			</xsl:when>
			<xsl:when test="/RequestGRP">
				<xsl:text>RequestGRP</xsl:text>
			</xsl:when>
			<xsl:when test="/Request_Reestr">
				<xsl:text>RequestReestr</xsl:text>
			</xsl:when>
			<xsl:when test="/StatementGKN">
				<xsl:text>StatementGKN</xsl:text>
			</xsl:when>
			<xsl:when test="/MapPlanTerritory">
				<xsl:text>MPTer</xsl:text>
			</xsl:when>
			<xsl:when test="/Register_Realty">
				<xsl:text>TP</xsl:text>
				<xsl:choose>
					<xsl:when test="/Requests_GZK_Realty/@Version != ''">
						<xsl:value-of select="/Requests_GZK_Realty/@Version" />
					</xsl:when>
					<xsl:otherwise>
						09
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="/STD_MP">
				<xsl:text>MP</xsl:text>
				<xsl:choose>
					<xsl:when test="/STD_MP/eDocument/@Version != ''">
						<xsl:value-of select="/STD_MP/eDocument/@Version" />
					</xsl:when>
					<xsl:otherwise>
						01
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="MP">
				<xsl:text>MP</xsl:text>
				<xsl:choose>
					<xsl:when test="/MP/@Version != ''">
						<xsl:value-of select="/MP/@Version" />
					</xsl:when>
					<xsl:otherwise>
						01
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:template name="Table4">
		<tr>
			<td style="WIDTH: 25%" />
			<td style="WIDTH: 25%" />
			<td style="WIDTH: 25%" />
			<td style="WIDTH: 25%" />
		</tr>
	</xsl:template>

	<xsl:template name="Result">
		<xsl:param name="res" />
		<table class="input" align="center">
			<td class="input">
				<xsl:choose>
					<xsl:when test="$res = 'true'">
						<span class="green">
							<xsl:text>УСПЕХ</xsl:text>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span class="red">
							<xsl:text>НЕУДАЧА</xsl:text>
						</span>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</table>
	</xsl:template>

	<xsl:template name="TextBox">
		<xsl:param name="val" />
		<xsl:param name="siz" />
		<input>
			<!--xsl:attribute name="readOnly"> <xsl:text>0</xsl:text> </xsl:attribute -->
			<xsl:attribute name="type">
        <xsl:text>text</xsl:text>
      </xsl:attribute>
			<xsl:attribute name="value">
        <xsl:value-of select="$val" />
      </xsl:attribute>
			<xsl:attribute name="size">
        <xsl:choose>
          <xsl:when test="$siz=10">
            <xsl:value-of select="5" />
          </xsl:when>
          <xsl:when test="$siz=15">
            <xsl:value-of select="11" />
          </xsl:when>
          <xsl:when test="$siz=20">
            <xsl:value-of select="18" />
          </xsl:when>
          <xsl:when test="$siz=25">
            <xsl:value-of select="24" />
          </xsl:when>
          <xsl:when test="$siz=50">
            <xsl:value-of select="55" />
          </xsl:when>
          <xsl:when test="$siz=60">
            <xsl:value-of select="67" />
          </xsl:when>
          <xsl:when test="$siz=70">
            <xsl:value-of select="86" />
          </xsl:when>
          <xsl:when test="$siz=75">
            <xsl:value-of select="87" />
          </xsl:when>
          <xsl:when test="$siz=100">
            <xsl:value-of select="117" />
          </xsl:when>
          <xsl:when test="$siz=90">
            <xsl:value-of select="107" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="24" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
		</input>
	</xsl:template>

	<xsl:template name="Textarea">
		<xsl:param name="text" />
		<xsl:param name="val" />
		<textarea readOnly="0">
			<xsl:choose>
				<xsl:when test="$text!=''">
					<xsl:value-of select="$text" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="translate($val,'$',' ')" />
				</xsl:otherwise>
			</xsl:choose>
		</textarea>
	</xsl:template>

	<xsl:template name="DateText">
		<xsl:param name="val" />
		<xsl:if test="$val!=''">
			<xsl:variable name="date">
				<xsl:choose>
					<xsl:when test="contains($val,'.')">
						<xsl:value-of select="substring-before($val,'.')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$val" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="text">
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($date,9,2)" />
				<xsl:text> </xsl:text>
				<xsl:variable name="month" select="substring($date,6,2)" />
				<xsl:choose>
					<xsl:when test="$month='01'">
						<xsl:text>января</xsl:text>
					</xsl:when>
					<xsl:when test="$month='02'">
						<xsl:text>февраля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='03'">
						<xsl:text>марта</xsl:text>
					</xsl:when>
					<xsl:when test="$month='04'">
						<xsl:text>апреля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='05'">
						<xsl:text>мая</xsl:text>
					</xsl:when>
					<xsl:when test="$month='06'">
						<xsl:text>июня</xsl:text>
					</xsl:when>
					<xsl:when test="$month='07'">
						<xsl:text>июля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='08'">
						<xsl:text>августа</xsl:text>
					</xsl:when>
					<xsl:when test="$month='09'">
						<xsl:text>сентября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='10'">
						<xsl:text>октября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='11'">
						<xsl:text>ноября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='12'">
						<xsl:text>декабря</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$month" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($date,1,4)" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring-after($date,'T')" />
			</xsl:variable>
			<xsl:value-of select="$text" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="DateBox">
		<xsl:param name="val" />
		<xsl:param name="siz" />
		<xsl:call-template name="TextBox">
			<xsl:with-param name="val">
				<xsl:call-template name="DateText">
					<xsl:with-param name="val" select="$val" />
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="siz" select="$siz" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="DateText2">
		<xsl:param name="val" />
		<xsl:if test="$val!=''">
			<xsl:variable name="text">
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($val,1,2)" />
				<xsl:text> </xsl:text>
				<xsl:variable name="month" select="substring($val,4,2)" />
				<xsl:choose>
					<xsl:when test="$month='01'">
						<xsl:text>января</xsl:text>
					</xsl:when>
					<xsl:when test="$month='02'">
						<xsl:text>февраля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='03'">
						<xsl:text>марта</xsl:text>
					</xsl:when>
					<xsl:when test="$month='04'">
						<xsl:text>апреля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='05'">
						<xsl:text>мая</xsl:text>
					</xsl:when>
					<xsl:when test="$month='06'">
						<xsl:text>июня</xsl:text>
					</xsl:when>
					<xsl:when test="$month='07'">
						<xsl:text>июля</xsl:text>
					</xsl:when>
					<xsl:when test="$month='08'">
						<xsl:text>августа</xsl:text>
					</xsl:when>
					<xsl:when test="$month='09'">
						<xsl:text>сентября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='10'">
						<xsl:text>октября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='11'">
						<xsl:text>ноября</xsl:text>
					</xsl:when>
					<xsl:when test="$month='12'">
						<xsl:text>декабря</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$month" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($val,7,4)" />
				<xsl:text> </xsl:text>
			</xsl:variable>
			<xsl:value-of select="$text" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="DateBox2">
		<xsl:param name="val" />
		<xsl:param name="siz" />
		<xsl:call-template name="TextBox">
			<xsl:with-param name="val">
				<xsl:call-template name="DateText2">
					<xsl:with-param name="val" select="$val" />
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="siz" select="$siz" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="Dicts">
		<xsl:param name="dict" />
		<xsl:param name="code" />
		<xsl:if test="$dict!='' and $code!=''">
			<xsl:variable name="BcodeB">
				<xsl:text>|</xsl:text>
				<xsl:value-of select="$code" />
				<xsl:text>|</xsl:text>
			</xsl:variable>
			<xsl:value-of select="substring-before(substring-after($dict,$BcodeB),'|')" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="DictBox">
		<xsl:param name="val" />
		<xsl:param name="siz" />
		<xsl:param name="dic" />
		<xsl:param name="noc" />
		<xsl:variable name="D">
			<xsl:call-template name="Dicts">
				<xsl:with-param name="dict" select="$dic" />
				<xsl:with-param name="code" select="$val" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="TextBox">
			<xsl:with-param name="val">
				<xsl:if test="$noc!='true'">
					<xsl:value-of select="$val" />
				</xsl:if>
				<xsl:if test="$noc!='true' and $D!=''">
					<xsl:text> - </xsl:text>
				</xsl:if>
				<xsl:if test="$D!=''">
					<xsl:value-of select="$D" />
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="siz" select="$siz" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="Dictarea">
		<xsl:param name="val" />
		<xsl:param name="siz" />
		<xsl:param name="dic" />
		<xsl:param name="noc" />
		<xsl:variable name="D">
			<xsl:call-template name="Dicts">
				<xsl:with-param name="dict" select="$dic" />
				<xsl:with-param name="code" select="$val" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="Textarea">
			<xsl:with-param name="val">
				<xsl:if test="$noc!='true'">
					<xsl:value-of select="$val" />
				</xsl:if>
				<xsl:if test="$noc!='true' and $D!=''">
					<xsl:text> - </xsl:text>
				</xsl:if>
				<xsl:if test="$D!=''">
					<xsl:value-of select="$D" />
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="siz" select="$siz" />
		</xsl:call-template>
	</xsl:template>
	<!-- <xsl:template name="RegBox"> <xsl:param name="code" /> <xsl:param name="siz" /> <xsl:variable name="text"> <xsl:call-template 
		name="Reg"> <xsl:with-param name="code" select="$code" /> </xsl:call-template> </xsl:variable> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="val" select="$text" /> <xsl:with-param name="siz" select="$siz" /> </xsl:call-template> </xsl:template> 
		<xsl:template name="PackBox"> <xsl:param name="code" /> <xsl:param name="siz" /> <xsl:variable name="text"> <xsl:call-template 
		name="Pack"> <xsl:with-param name="code" select="$code" /> </xsl:call-template> </xsl:variable> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="val" select="$text" /> <xsl:with-param name="siz" select="$siz" /> </xsl:call-template> </xsl:template> 
		<xsl:template name="DocBox"> <xsl:param name="code" /> <xsl:param name="siz" /> <xsl:variable name="text"> <xsl:call-template 
		name="Doc"> <xsl:with-param name="code" select="$code" /> </xsl:call-template> </xsl:variable> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="val" select="$text" /> <xsl:with-param name="siz" select="$siz" /> </xsl:call-template> </xsl:template> 
		<xsl:template name="ControlStageBox"> <xsl:param name="code" /> <xsl:param name="siz" /> <xsl:param name="comment" /> <xsl:variable 
		name="text"> <xsl:call-template name="ControlStage"> <xsl:with-param name="code" select="$code" /> </xsl:call-template> </xsl:variable> 
		<xsl:variable name="text1"> <xsl:choose> <xsl:when test="$comment!=''"> <xsl:value-of select="concat($text, concat(' - ',$comment))" 
		/> </xsl:when> <xsl:otherwise> <xsl:value-of select="$text" /> </xsl:otherwise> </xsl:choose> </xsl:variable> <xsl:call-template 
		name="TextBox"> <xsl:with-param name="val" select="$text1" /> <xsl:with-param name="siz" select="$siz" /> </xsl:call-template> 
		</xsl:template> -->
	<xsl:template name="Picture">
		<xsl:param name="src" />
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<p />
		<table align="center">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<tr>
				<td align="center">
					<a href="#">
						<xsl:attribute name="onclick">
              <xsl:choose>
                <xsl:when test="$pos0=0 and $pos2=0">
                  <xsl:text>DoXslt("</xsl:text>
                  <xsl:value-of select="$part" />
                  <xsl:text>",</xsl:text>
                  <xsl:value-of select="$pos" />
                  <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="$pos0!=0 and $pos2=0">
                  <xsl:text>DoXsltChild("</xsl:text>
                  <xsl:value-of select="$part" />
                  <xsl:text>","</xsl:text>
                  <xsl:value-of select="$type" />
                  <xsl:text>",</xsl:text>
                  <xsl:value-of select="$pos" />
                  <xsl:text>,</xsl:text>
                  <xsl:value-of select="$pos0" />
                  <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="$pos2!=0">
                  <xsl:text>DoXsltFlat("</xsl:text>
                  <xsl:value-of select="$part" />
                  <xsl:text>","</xsl:text>
                  <xsl:value-of select="$type" />
                  <xsl:text>",</xsl:text>
                  <xsl:value-of select="$pos" />
                  <xsl:text>,</xsl:text>
                  <xsl:value-of select="$pos0" />
                  <xsl:text>,</xsl:text>
                  <xsl:value-of select="$pos1" />
                  <xsl:text>,</xsl:text>
                  <xsl:value-of select="$pos2" />
                  <xsl:text>)</xsl:text>
                </xsl:when>
              </xsl:choose>
            </xsl:attribute>
						<span>
							<xsl:text>Вверх</xsl:text>
						</span>
					</a>
				</td>
			</tr>
		</table>
		<p align="center">
			<img>
				<xsl:attribute name="src">
          <xsl:value-of select="$src" />
        </xsl:attribute>
				<xsl:attribute name="alt">
          <xsl:value-of select="$src" />
        </xsl:attribute>
			</img>
		</p>
	</xsl:template>

	<xsl:template name="ImageRef">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:param name="val" />
		<xsl:variable name="Name">
			<xsl:choose>
				<xsl:when test="$val!=''">
					<xsl:value-of select="$val" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@Name" />
					<xsl:value-of select="@name" />
				</xsl:otherwise>
			</xsl:choose>


		</xsl:variable>
		<tr>
			<td>
				<span>
					<xsl:text>Документ (файл)</xsl:text>
				</span>
			</td>
			<td colspan="3">
				<a href="#">
					<xsl:attribute name="onclick">
            <xsl:text>DoXsltP("</xsl:text>
            <xsl:value-of select="$part" />
            <xsl:text>","</xsl:text>
            <xsl:value-of select="$type" />
            <xsl:text>",</xsl:text>
            <xsl:value-of select="$pos" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$pos0" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$pos1" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$pos2" />
            <xsl:text>,"</xsl:text>
            <xsl:value-of select="translate($Name,'\','/')" />
            <xsl:text>")</xsl:text>
          </xsl:attribute>
					<span>
						<xsl:value-of select="$Name" />
					</span>
				</a>
			</td>
		</tr>


	</xsl:template>

	<xsl:template name="PictureInsert">
		<xsl:param name="path" />
		<xsl:param name="val" />
		<xsl:variable name="Name">
			<xsl:choose>
				<xsl:when test="$val!=''">
					<xsl:value-of select="$val" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@Name" />
					<xsl:value-of select="@name" />

				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="not(contains($Name, '.zip'))">
			<tr>
				<td colspan="4">
					<span>
						<xsl:text>Документ (файл) </xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<p>
						<img>
							<xsl:attribute name="src">
                <xsl:value-of select="concat($path,translate($Name,'\','/'))" />
              </xsl:attribute>
							<xsl:attribute name="alt">
                <xsl:value-of select="concat($path,translate($Name,'\','/'))" />
              </xsl:attribute>
							<xsl:attribute name="width">
                <xsl:value-of select="$TableWidth" />
              </xsl:attribute>

						</img>
					</p>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
<!--
	<xsl:template name="Main_First">
		<xsl:param name="X1" />
		<xsl:param name="X2" />
		<xsl:param name="T2" />
		<xsl:param name="X3" />
		<xsl:param name="X4" />
		<xsl:param name="T4" />
		<xsl:param name="X5" />
		<xsl:param name="T5" />
		<xsl:param name="X6" />
		<table align="center">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<xsl:call-template name="Table4" />
			<tr>
				<td>
					<span>
						<xsl:text>Вид регламента</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="RegBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="code" select="$X1" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:value-of select="$T2" />
					</span>
				</td>
				<td>
					<xsl:call-template name="PackBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="code" select="$X2" />
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="$X3 != ''">
				<tr>
					<td colspan="1">
						<span>
							<xsl:text>Идентификатор сеанса регламента</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="$X3" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$T4 != ''">
				<tr>
					<td>
						<span>
							<xsl:value-of select="$T4" />
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="$X4" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:value-of select="$T5" />
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="$X5" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$X6 != ''">
				<tr>
					<td colspan="1">
						<span>
							<xsl:text>Получатель запроса</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="$X6" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
-->
	<!-- Кадастровый учет -->
	<xsl:template match="//Title|gkn:Title">
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Заголовок</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="Organization_OKU_BTI/Name_OKU!='' or Executive/FIO!='' or gkn:RecipientName!=''">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Отправитель</xsl:text>
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="gkn:RecipientType!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Тип организации организации</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="gkn:RecipientType" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="gkn:RecipientName!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование организации</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="gkn:RecipientName" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_OKU_BTI/Name_OKU!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование организации</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Organization_OKU_BTI/Name_OKU" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_OKU_BTI/INN_OKU!='' or Organization_OKU_BTI/KPP_OKU!=''">
						<tr>
							<td>
								<span>
									<xsl:text>ИНН организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_OKU_BTI/INN_OKU" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>КПП организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_OKU_BTI/KPP_OKU" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_OKU_BTI/OGRN_OKU!='' or Organization_OKU_BTI/Cod_OKU!=''">
						<tr>
							<td>
								<span>
									<xsl:text>ОГРН организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_OKU_BTI/OGRN_OKU!=''" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Код организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_OKU_BTI/Cod_OKU" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_RR/Name_RR!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование органа Росреестра</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Organization_RR/Name_RR" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_RR/OGRN_RR!='' or Organization_RR/Code_RR!=''">
						<tr>
							<td>
								<span>
									<xsl:text>ОГРН организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_RR/OGRN_RR" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Код организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_RR/Code_RR" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Organization_RR/KPP_RR!='' or Organization_RR/INN_RR!=''">
						<tr>
							<td>
								<span>
									<xsl:text>ИНН организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_RR/INN_RR" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>КПП организации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Organization_RR/KPP_RR" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Executive/FIO/Surname!='' or Executive/FIO/First!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Фамилия</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Executive/FIO/Surname" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Имя</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Executive/FIO/First" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Executive/FIO/Patronymic!='' or Executive/Appointment!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Отчество</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Executive/FIO/Patronymic" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Должность</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Executive/Appointment" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Executive/Telephone!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Телефон</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Executive/Telephone" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<!--xsl:if test="Rubric/Name!='' or Rubric/Code!='' or Rubric/Method!=''"> <tr> <td colspan="4"> <span style="font-weight:bold"> 
						<xsl:text>Заявление</xsl:text> </span> </td> </tr> </xsl:if -->
					<xsl:if test="Rubric/Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование ответа</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Rubric/Name" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Code!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Вид заявления</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="Dictarea">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Rubric/Code" />
									<xsl:with-param name="dic">
										<xsl:call-template name="dRequest_Type" />
										<xsl:call-template name="dAllDocuments" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Method!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Способ образования участков</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Rubric/Method" />
									<xsl:with-param name="dic">
										<xsl:call-template name="dMethod" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Visit_Purpose!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Цель обращения</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Rubric/Visit_Purpose" />
									<xsl:with-param name="dic">
										<xsl:call-template name="dAction" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Number!='' or Rubric/Date!=''">
						<tr>
							<xsl:if test="Rubric/Number!=''">
								<td>
									<span>
										<xsl:text>Номер ответа</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Rubric/Number" />
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="Rubric/Date">
								<td>
									<span>
										<xsl:text>Исходящая дата</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Rubric/Date" />
									</xsl:call-template>
								</td>
							</xsl:if>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/ReqType">
						<tr>
							<td>
								<span>
									<xsl:text>Код заявления</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dRequest_Type" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Rubric/ReqType" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Number_Request!='' or Rubric/Date_Request!=''">
						<tr>
							<xsl:if test="Rubric/Number_Request">
								<td>
									<span>
										<xsl:text>Номер заявления</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Rubric/Number_Request" />
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="Rubric/Date_Request">
								<td>
									<span>
										<xsl:text>Дата заявления</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Rubric/Date_Request" />
									</xsl:call-template>
								</td>
							</xsl:if>
						</tr>
					</xsl:if>
					<xsl:if test="Rubric/Request_Text!=''">
						<tr>
							<td colspan="4">
								<div>
									<xsl:text>Текст</xsl:text>
								</div>
								<xsl:call-template name="Textarea">
									<xsl:with-param name="text" select="Rubric/Request_Text" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="//Declarants/Declarant|//Request[Declarant]|gkn:Declarant"
		xmlns:gkn="urn://x-artefacts-rosreestr-gov-ru/requests/gkn/3.0.9"
		xmlns:del="urn://x-artefacts-rosreestr-ru/commons/complex-types/delivery/1.1.1">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Заявители</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:if test="contains(local-name(),'Declarant')">
			<tr>
				<td>
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="@declarantKind">
							<tr>
								<td>
									<span>
										<xsl:text>Тип заявителя</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@declarantKind" />
										<xsl:with-param name="dic">
											<xsl:choose>
												<xsl:when test="$DocumentVersion='RequestReestr'">
													<xsl:call-template name="dDeclarantKind" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="dDeclarantKindOKS" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="//gkn:Declarant/gkn:Delivery/del:OKU!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Способ получения запрашиваемых документов</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="//gkn:Delivery/del:OKU" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dWayReception" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="//gkn:Delivery/del:AddressMFC!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Получатель запрашиваемых документов (код)</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="//gkn:Delivery/del:AddressMFC" />
										<xsl:with-param name="dic">
											<xsl:call-template name="sRecipient" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="gkn:Delivery/del:PostAddress!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Адрес доставки</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="//gkn:Delivery/del:PostAddress" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="gkn:Delivery/del:OKU!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>ОКУ, в котором будут получены запрашиваемые документы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="gkn:Delivery/del:PostAddress" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="//gkn:Delivery/del:OKU!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>ОКУ, в котором будут получены запрашиваемые документы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="//gkn:Delivery/del:OKU" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="//gkn:Delivery/del:OKU|//gkn:Delivery/del:PostAddress|//gkn:Delivery/del:LinkE_mail">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Способ получения запрашиваемых документов</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val">
											<xsl:choose>
												<xsl:when test="//gkn:Delivery/del:OKU">
													<xsl:text>В виде бумажного документа при личном обращении</xsl:text>
												</xsl:when>
												<xsl:when test="//gkn:Delivery/del:PostAddress">
													<xsl:text>В виде бумажного документа посредством почтового отправления</xsl:text>
												</xsl:when>
												<xsl:when test="//gkn:Delivery/del:LinkE_mail">
													<xsl:text>В виде ссылки на электронный документ посредством электронной почты</xsl:text>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="../Delivery/NameOKU!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>ОКУ, в котором будут получены запрашиваемые документы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="../Delivery/NameOKU" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="../Delivery/PostAddress!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Адрес доставки</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="../Delivery/PostAddress" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td colspan="4" xmlns:gen="urn://x-artefacts-rosreestr-ru/commons/complex-types/general-gkn/1.0.2">
								<span style="font-weight:bold">
									<xsl:choose>
										<xsl:when test="gen:Person">
											<xsl:text>Заявитель - физическое лицо</xsl:text>
										</xsl:when>
										<xsl:when test="gen:Organization">
											<xsl:text>Заявитель - юридическое лицо</xsl:text>
										</xsl:when>
										<xsl:when test="gen:Governance">
											<xsl:text>Заявитель - субъект публичного права</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											Заявитель
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<xsl:for-each select="//gkn:Declarant/gen:Organization"
							xmlns:org2="urn://x-artefacts-rosreestr-ru/commons/complex-types/organization/2.0.1"
							xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1">
							<xsl:if test="org2:Name!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Название организации</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="org2:RegDate!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Дата регистрации</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:RegDate" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="org2:INN!=''">
								<tr>
									<td>
										<span>
											<xsl:text>ИНН</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:INN" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<span style="font-weight:bold">
										<xsl:text>Местоположение</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:if test="org2:Location/loc2:Region!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Регион</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="DictBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:Location/loc2:Region" />
											<xsl:with-param name="dic">
												<xsl:call-template name="Location" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="org2:Location/loc2:Note!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Адрес</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:Location/loc2:Note" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="//org2:Email or //org2:Telephone">
								<tr>
									<td>
										<span style="font-weight:bold">
											<xsl:text>Контактные данные</xsl:text>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="org2:Email!=''">
								<tr>
									<td>
										<span>
											<xsl:text>E-mail</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:Email" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="org2:Telephone!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Телефон</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="org2:Telephone" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//gkn:Declarant/gen:Governance"
							xmlns:gov2="urn://x-artefacts-rosreestr-ru/commons/complex-types/governance/2.0.1"
							xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1">
							<xsl:if test="gov2:Name!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Название организации</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gov2:GovernanceCode!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Код ведомства</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:GovernanceCode" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="//gov2:Location/loc2:Region!='' or //gov2:Location/loc2:Note!=''">
								<tr>
									<td>
										<span style="font-weight:bold">
											<xsl:text>Местоположение</xsl:text>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gov2:Location/loc2:Region!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Регион</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="DictBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:Location/loc2:Region" />
											<xsl:with-param name="dic">
												<xsl:call-template name="Location" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gov2:Location/loc2:Note!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Адрес</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:Location/loc2:Note" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="//gov2:Email or //gov2:Telephone">
								<tr>
									<td>
										<span style="font-weight:bold">
											<xsl:text>Контактные данные</xsl:text>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gov2:Email!=''">
								<tr>
									<td>
										<span>
											<xsl:text>E-mail</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:Email" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gov2:Telephone!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Телефон</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="gov2:Telephone" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//gkn:Declarant/gen:Person"
							xmlns:fl2="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/2.0.1"
							xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1">
							<xsl:if test="fio:FamilyName">
								<tr>
									<td>
										<span>
											<xsl:text>Фамилия</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fio:FamilyName" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fio:FirstName!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Имя</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fio:FirstName" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fio:Patronymic!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Отчество</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fio:Patronymic" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<span style="font-weight:bold">
										<xsl:text>Документы</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:if test="fl2:Document/fl2:CodeDocument!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Тип документа</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Document/fl2:CodeDocument" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Document/fl2:Series!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Серия</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Document/fl2:Series" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Document/fl2:Number!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Номер</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Document/fl2:Number" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Document/fl2:Date!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Дата выдачи</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Document/fl2:Date" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Document/fl2:IssueOrgan!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Выдан</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Document/fl2:IssueOrgan" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="//fl2:Email or //fl2:Telephone">
								<tr>
									<td>
										<span style="font-weight:bold">
											<xsl:text>Контактные данные</xsl:text>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Email!=''">
								<tr>
									<td>
										<span>
											<xsl:text>E-mail</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Email" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="fl2:Telephone!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Телефон</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="fl2:Telephone" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="Owner">
							<xsl:with-param name="pos" select="$pos" />
							<xsl:with-param name="part" select="$part" />
							<xsl:with-param name="path" select="$path" />
							<xsl:with-param name="pos0" select="$ppp" />
							<xsl:with-param name="pos1" select="$ppp" />
							<xsl:with-param name="pos2" select="$ppp" />
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template
		match="gkn:Declarant/gen:Person/gen:Agent|gkn:Declarant/gen:Organization/gen:Agent|gkn:Declarant/gen:Governance/gen:Agent"
		xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
		xmlns:fl2="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/2.0.1">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Доверенное лицо</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="fio:FamilyName!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Фамилия</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fio:FamilyName" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fio:FirstName!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Имя</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fio:FirstName" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fio:Patronymic!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Отчество</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fio:Patronymic" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td>
							<span style="font-weight:bold">
								<xsl:text>Документы</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:if test="fl2:Document/fl2:CodeDocument!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Тип документа</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Document/fl2:CodeDocument" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Document/fl2:Series!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Серия</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Document/fl2:Series" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Document/fl2:Number!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Номер</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Document/fl2:Number" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Document/fl2:Date!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Дата выдачи</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Document/fl2:Date" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Document/fl2:IssueOrgan!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Выдан</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Document/fl2:IssueOrgan" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="//fl2:Email or //fl2:Telephone">
						<tr>
							<td>
								<span style="font-weight:bold">
									<xsl:text>Контактные данные</xsl:text>
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Email!=''">
						<tr>
							<td>
								<span>
									<xsl:text>E-mail</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Email" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="fl2:Telephone">
						<tr>
							<td>
								<span>
									<xsl:text>Телефон</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="fl2:Telephone" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="gkn:AppliedDocuments/gkn:AppliedDocument"
		xmlns:doc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/4.0.3">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Документ</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="doc2:CodeDocument!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Тип документа</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:CodeDocument" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Название</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:Name" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:Series!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Серия</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:Series" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:Number!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Номер</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:Number" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:IssueOrgan!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Выдан</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:IssueOrgan" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:Date!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Дата выдачи</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:Date" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="doc2:Desc!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Особые отметки</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="doc2:Desc" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="gkn:PaymentDocuments/gkn:PaymentDocument"
		xmlns:pay="urn://x-artefacts-rosreestr-ru/commons/complex-types/pay-document/1.1.2">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Документ</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:if test="pay:DocType!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Тип документа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:DocType" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:Number!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:Number" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:BIC!=''">
			<tr>
				<td>
					<span>
						<xsl:text>BIC</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:BIC" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:BankName!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Банк</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:BankName" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:SettlementAccount!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Расчетный счет</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:SettlementAccount" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:Date!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Дата платежа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:Date" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:FIOPayment!=''">
			<tr>
				<td>
					<span>
						<xsl:text>ФИО платильщика</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:FIOPayment" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pay:Sum!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Сумма</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="pay:Sum" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Person" xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
		xmlns:fl2="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/2.0.1">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:if test="FIO/Surname!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Фамилия</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="FIO/Surname" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Имя</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="FIO/Surname" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="FIO/Patronymic!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Отчество</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="FIO/Patronymic" />
					</xsl:call-template>
				</td>
				<xsl:if test="INN!=''">
					<td>
						<span>
							<xsl:text>ИНН</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="INN" />
						</xsl:call-template>
					</td>
				</xsl:if>
			</tr>
		</xsl:if>
		<xsl:if test="DateBirth!='' or Place_Birth!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Дата рождения</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="DateBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="DateBirth" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Место рождения</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Place_Birth" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Citizenship!='' or IsUnderAge!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Гражданство</xsl:text>
					</span>
				</td>

				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Citizenship" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Возраст</xsl:text>
					</span>
				</td>
				<!--*1*1*1*1*1*1**1*1*1*1*1* -->
				<xsl:variable name="YN">
					<xsl:choose>
						<xsl:when test="IsUnderAge='true' or IsUnderAge='1'">
							<xsl:text>Несовершеннолетний</xsl:text>
						</xsl:when>
						<xsl:when test="IsUnderAge='false' or IsUnderAge='0'">
							<xsl:text>Совершеннолетний</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="$YN" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="FamilyStatus!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Семейное положение</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="FamilyStatus" />
					</xsl:call-template>
				</td>
			</tr>


		</xsl:if>
		<xsl:if test="E-mail!='' or Phone!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Адрес электронной почты</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="E-mail" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Телефон</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Phone" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Contact_Info">
			<tr>
				<td>
					<span>
						<xsl:text>Контактная информация</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Contact_Info" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="SNILS">
			<tr>
				<td>
					<span>
						<xsl:text>СНИЛС</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="SNILS" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="Document">
			<tr>
				<td colspan="4">
					<span style="font-weight:bold">
						<xsl:text>Документ, удостоверяющий личность</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:call-template name="Document">
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="path" select="$path" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="Location|LocationPermanent|LocationTemporary">
			<tr>
				<td colspan="4">
					<span style="font-weight:bold">
						<xsl:choose>
							<xsl:when test="local-name()='Location'">
								<xsl:text>Зарегистрированный адрес</xsl:text>
							</xsl:when>
							<xsl:when test="local-name()='LocationPermanent'">
								<xsl:text>Адрес постоянного проживания</xsl:text>
							</xsl:when>
							<xsl:when test="local-name()='LocationTemporary'">
								<xsl:text>Адрес преимущественного проживания</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Зарегистрированный адрес</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</td>
			</tr>
			<xsl:choose>
				<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
					<tr>
						<td colspan="4">
							<xsl:call-template name="Location17">
								<xsl:with-param name="vis" select="'unvis'" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="4">
							<xsl:call-template name="Location">
								<xsl:with-param name="vis" select="'unvis'" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="FactLocation">
			<tr>
				<td colspan="4">
					<span style="font-weight:bold">
						<xsl:text>Фактический адрес</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
						<tr>
							<td colspan="4">
								<xsl:call-template name="Location17">
									<xsl:with-param name="vis" select="'unvis'" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="4">
								<xsl:call-template name="Location">
									<xsl:with-param name="vis" select="'unvis'" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Owner">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:choose>
			<xsl:when test="Person">
				<xsl:for-each select="Person">
					<xsl:call-template name="Person">
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="path" select="$path" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="Organization">
				<xsl:if test="Organization/Name!='' and Organization/Code_OPF!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Наименование организации</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Name" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>ОПФ (код)</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:choose>
										<xsl:when test="$DocumentVersion='Request17'">
											<xsl:call-template name="dOPF17" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="dOPF" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Code_OPF" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Organization/Name!='' and (not (Organization/Code_OPF) or Organization/Code_OPF='')">
					<tr>
						<td>
							<span>
								<xsl:text>Наименование организации</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Organization/Name" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Organization/INN!='' or Organization/Code_CPP!=''">
					<tr>
						<td>
							<span>
								<xsl:text>ИНН</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/INN" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>КПП</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Code_CPP" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Organization/Code_OGRN!='' or Organization/E-mail!=''">
					<tr>
						<td>
							<span>
								<xsl:text>ОГРН</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Code_OGRN" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>Адрес электронной почты</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/E-mail" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Organization/Phone!='' or Organization/Country!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Телефон</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Phone" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>Страна</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Organization/Country" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Organization/Contact_Info!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Телефон</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Organization/Contact_Info" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:for-each select="Organization/Document">
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Документ организации</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:call-template name="Document">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="Organization/Location">
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Зарегистрированный адрес</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:choose>
						<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location17">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="Organization/FactLocation">
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Фактический адрес</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:choose>
						<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location17">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="Governance">
				<xsl:if test="Governance/Name!=''">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Наименование cубъекта публичного права</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="50" />
								<xsl:with-param name="val" select="Governance/Name" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/Governance_Code!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Тип субъекта публичного права (код)</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Governance/Governance_Code" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dGovernance_Code" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/GovernanceCod!=''">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Тип субъекта публичного права (код)</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="50" />
								<xsl:with-param name="val" select="Governance/GovernanceCod" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dGovernance" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/RegNumber or Governance/RegDate">
					<tr>
						<td>
							<span>
								<xsl:text>Номер государтсвенной регистрации</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Governance/RegNumber" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>Дата</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="DateBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Governance/RegDate" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/Country and (Governance/Country)!='Country0'">
					<tr>
						<td>
							<span>
								<xsl:text>Страна</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Governance/Country" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/Address">
					<tr>
						<td>
							<span>
								<xsl:text>Адрес в стране регистрации</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Governance/Address" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/E-mail or Governance/Phone">
					<tr>
						<td>
							<span>
								<xsl:text>Адрес электронной почты</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Governance/E-mail" />
							</xsl:call-template>
						</td>
						<td>
							<span>
								<xsl:text>Телефон</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="Governance/Phone" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/Contact_Info">
					<tr>
						<td>
							<span>
								<xsl:text />
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Governance/Contact_Info" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="Governance/OKATO_Code!=''">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Код ОКАТО</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="50" />
								<xsl:with-param name="val" select="Governance/OKATO_Code" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="Document">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:param name="name" />
		<xsl:if test="Name!='' and $name!='false'">
			<tr>
				<td>
					<span>
						<xsl:text>Наименование документа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="Textarea">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Name" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if
			test="Type_Document or Type_Registration or Type_Specification or Parcel_File_Doc or Code_Document or CodeDocument">
			<tr>
				<td>
					<span>
						<xsl:text>Тип документа (код)</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="Type_Document">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dCertificates" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Type_Document" />
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="Type_Registration">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dDocuments" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Type_Registration" />
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="Type_Specification">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dSpecification" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Type_Specification" />
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="Parcel_File_Doc">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dParcel_File_Doc" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Parcel_File_Doc" />
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="Code_Document">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dAllDocuments" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="Code_Document" />
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="CodeDocument">
							<xsl:call-template name="Dictarea">
								<xsl:with-param name="dic">
									<xsl:call-template name="dAllDocuments" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="CodeDocument" />
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Series!='' or Number!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Серия</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Series" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Номер</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Number" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="IssueOrgan!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Кем выдан</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="Textarea">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="IssueOrgan" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Date!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Дата выдачи</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DateBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Date" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="IssueOrgan_Code!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Код подразделения</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="IssueOrgan_Code" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="AutorDocument!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Лицо, сформировавшее документ</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="AutorDocument" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="NumberReg!='' or DateReg!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Регистрационный номер</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="NumberReg" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Дата регистрации</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="DateBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="DateReg" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Register">
			<tr>
				<td>
					<span>
						<xsl:text>Кто зарегистрировал</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Register" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Duration/Started!='' or Duration/Stopped!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Дата начала действия</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="DateBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Duration/Started" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Дата прекращения действия</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="DateBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Duration/Stopped" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Desc!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Особые отметки</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Desc" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Quantity/@Original!='' or Quantity/@Original_Sheet!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Количество документов</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Quantity/@Original" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Количество листов</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="Quantity/@Original_Sheet" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="Images/Image">
			<tr>
				<td>
					<span>
						<xsl:text>Относительный путь к файлу</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="@Name" />
					</xsl:call-template>
				</td>
			</tr>
			<!--xsl:choose> <xsl:when test="$part='!Print!'"> <xsl:call-template name="PictureInsert"> <xsl:with-param name="path" 
				select="$path"/> </xsl:call-template> </xsl:when> <xsl:otherwise> <xsl:call-template name="ImageRef"> <xsl:with-param name="part" 
				select="$part"/> <xsl:with-param name="type" select="$type"/> <xsl:with-param name="pos" select="$pos"/> <xsl:with-param 
				name="pos0" select="$pos0"/> <xsl:with-param name="pos1" select="$pos1"/> <xsl:with-param name="pos2" select="$pos2"/> </xsl:call-template> 
				</xsl:otherwise> </xsl:choose -->
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Document_spec">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<xsl:param name="type" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:if test="Name!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Наименование документа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="Textarea">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Name" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Kind!='' and not(Code_Document)">
			<tr>
				<td>
					<span>
						<xsl:text>Вид документа (код)</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="dReg_Doc_Type" />
							<xsl:call-template name="dAllDocuments" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="Kind" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:call-template name="Document">
			<xsl:with-param name="pos" select="$pos" />
			<xsl:with-param name="part" select="$part" />
			<xsl:with-param name="path" select="$path" />
			<xsl:with-param name="type" select="$type" />
			<xsl:with-param name="pos0" select="$pos0" />
			<xsl:with-param name="pos1" select="$pos1" />
			<xsl:with-param name="pos2" select="$pos2" />
			<xsl:with-param name="name" select="'false'" />
		</xsl:call-template>
		<!--/xsl:otherwise> </xsl:choose -->
	</xsl:template>

	<xsl:template name="CadastralNumber">
		<xsl:variable name="t">
			<xsl:choose>
				<xsl:when test="../../../../../../../Federal">
					<xsl:value-of select="7" />
				</xsl:when>
				<xsl:when test="../../../../../../../../../Federal">
					<xsl:value-of select="9" />
				</xsl:when>
				<xsl:when test="../../../../../../../../../../../Federal">
					<xsl:value-of select="11" />
				</xsl:when>
				<xsl:when test="../../../../../../../../../../../../../Federal">
					<xsl:value-of select="13" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="n1">
			<xsl:choose>
				<xsl:when test="$t=7">
					<xsl:value-of select="../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=9">
					<xsl:value-of select="../../../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=11">
					<xsl:value-of select="../../../../../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=13">
					<xsl:value-of select="../../../../../../../../../../@CadastralNumber" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="n2">
			<xsl:choose>
				<xsl:when test="$t=7">
					<xsl:value-of select="../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=9">
					<xsl:value-of select="../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=11">
					<xsl:value-of select="../../../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=13">
					<xsl:value-of select="../../../../../../../../@CadastralNumber" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="n3">
			<xsl:choose>
				<xsl:when test="$t=7">
					<xsl:value-of select="'!'" />
				</xsl:when>
				<xsl:when test="$t=9">
					<xsl:value-of select="../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=11">
					<xsl:value-of select="../../../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=13">
					<xsl:value-of select="../../../../../../@CadastralNumber" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="n4">
			<xsl:choose>
				<xsl:when test="$t=7">
					<xsl:value-of select="'!'" />
				</xsl:when>
				<xsl:when test="$t=9">
					<xsl:value-of select="'!'" />
				</xsl:when>
				<xsl:when test="$t=11">
					<xsl:value-of select="../../@CadastralNumber" />
				</xsl:when>
				<xsl:when test="$t=13">
					<xsl:value-of select="../../../../@CadastralNumber" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<p />
		<table style="width:100%">
			<xsl:call-template name="Table4" />
			<tr>
				<td>
					<span>
						<xsl:text>Кадастровый округ</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="$n1" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Кадастровый район</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="$n2" />
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="$t=9 and ../../Location/Code_OKATO">
				<tr>
					<td>
						<span>
							<xsl:text>Кадастровый квартал</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="$n3" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>ОКАТО</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="../../Location/Code_OKATO" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$t=9 and not(../../Location/Code_OKATO)">
				<tr>
					<td>
						<span>
							<xsl:text>Кадастровый квартал</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="$n3" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$t=11 or $t=13">
				<tr>
					<td>
						<span>
							<xsl:text>Кадастровый квартал</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="$n3" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Участок</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="$n4" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$t=13">
				<tr>
					<td>
						<span>
							<xsl:text>Часть участка</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="../../@CadastralNumber" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Номер части</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="../../@Number_PP" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="../../Area">
				<tr>
					<td>
						<span>
							<xsl:text>Общая площадь</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="../../Area/@Total" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Единица измерения (код)</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="../../Area/@Unit" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dUnit" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:apply-templates select="../../Entity_Spatial" />
	</xsl:template>

	<xsl:template name="BlockCadastralNumber">
		<xsl:variable name="BlockCadastralNumber">
			<xsl:value-of select="../../@CadastralNumber" />
			<xsl:value-of select="CadastralBlock" />
		</xsl:variable>
		<xsl:if test="$BlockCadastralNumber!=''">
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый квартал</xsl:text>
								</span>
							</td>
							<td colspan="3">

								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="$BlockCadastralNumber" />
								</xsl:call-template>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="//Rights">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Права</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="Right">
			<tr>
				<td>
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="Name!='' or Type!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Name" />
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Тип права (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dRights" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Type" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Share or ShareText!=''">
							<tr>
								<xsl:choose>
									<xsl:when test="Share">
										<td>
											<span>
												<xsl:text>Доля (отношение)</xsl:text>
											</span>
										</td>
										<td colspan="3">
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="75" />
												<xsl:with-param name="val">
													<xsl:value-of select="Share/@Numerator" />
													<xsl:text> / </xsl:text>
													<xsl:value-of select="Share/@Denominator" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:when test="ShareText">
										<td>
											<span>
												<xsl:text>Доля (текст)</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="ShareText" />
											</xsl:call-template>
										</td>
									</xsl:when>
								</xsl:choose>
							</tr>
						</xsl:if>
						<xsl:if test="Registration/OrgRegister!='' or Registration/RegNumber!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Кем зарегистрировано</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/OrgRegister" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Номер регистрационной записи</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/RegNumber" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Registration/RegDate!='' or Registration/DateClose!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Дата регистрации</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/RegDate" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Дата прекращения регистрации</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/DateClose" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Desc!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Особые отметки</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Desc" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="Documents/Document">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Регистрационная запись</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="Owner">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:choose>
											<xsl:when test="Person">
												<xsl:text>Правообладатель - физическое лицо</xsl:text>
											</xsl:when>
											<xsl:when test="Organization">
												<xsl:text>Правообладатель - организация</xsl:text>
											</xsl:when>
											<xsl:when test="Governance">
												<xsl:text>Правообладатель - cубъект публичного права</xsl:text>
											</xsl:when>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Owner">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
							<xsl:for-each select="Contact">
								<tr>
									<td colspan="4">
										<span style="font-weight:bold">
											<xsl:text>Связб с правообладателем</xsl:text>
										</span>
									</td>
								</tr>
								<xsl:if test="E_mail!='' or Phone!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Адрес электронной почты</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="E_mail" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Телефон</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Phone" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Contact_Adress">
									<tr>
										<td>
											<span>
												<xsl:text>Адрес правообладателя</xsl:text>
											</span>
										</td>
										<td colspan="3">
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="75" />
												<xsl:with-param name="val" select="Contact_Adress" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="Encumbrance">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Обременение</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Name" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="AccountNumber!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Учетный номер зоны</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="AccountNumber" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="CadastralNumberRestriction!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый номер ЗУ, в пользу которого установлен сервитут</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="CadastralNumberRestriction" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Type!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Обременение (код)</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dEncumbrances" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Type" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Duration">
						<tr>
							<td>
								<span>
									<xsl:text>Дата начала действия</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Duration/Started" />
								</xsl:call-template>
							</td>
							<xsl:choose>
								<xsl:when test="Registration/DateClose">
									<td>
										<span>
											<xsl:text>Дата прекращения действия</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DateBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Duration/Stopped" />
										</xsl:call-template>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<span>
											<xsl:text>Продолжительность</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Duration/Term" />
										</xsl:call-template>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:if>
					<xsl:if test="Registration">
						<tr>
							<td>
								<span>
									<xsl:text>Кем зарегистрировано</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Registration/OrgRegister" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Номер регистрационной записи</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Registration/RegNumber" />
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Дата регистрации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Registration/RegDate" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Дата прекращения регистрации</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Registration/DateClose" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Documents/Document">
						<xsl:for-each select="Documents/Document">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ по обременению</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="Owner_Restriction!=''">
						<tr>
							<td colspan="4">
								<span>
									<xsl:text>Лица, права которых обременяются</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="100" />
									<xsl:with-param name="val" select="Owner_Restriction" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="CadastralNumber_Restriction!=''">
						<tr>
							<td colspan="4">
								<span>
									<xsl:text>Кадастровый номер ЗУ, в пользу которого установлен сервитут</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="100" />
									<xsl:with-param name="val" select="CadastralNumber_Restriction" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Owner_Restriction_InFavorem">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Лица, в пользу которых ограничиваютcя права</xsl:text>
								</span>
							</td>
						</tr>
						<xsl:for-each select="Owner_Restriction_InFavorem">
							<xsl:call-template name="Owner">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
						</xsl:for-each>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="//Encumbrances">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Обременения</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="Encumbrance">
			<tr>
				<td>
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="Name!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Type!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Обременение (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dEncumbrances" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Type" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Duration">
							<tr>
								<td>
									<span>
										<xsl:text>Дата начала действия</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Duration/Started" />
									</xsl:call-template>
								</td>
								<xsl:choose>
									<xsl:when test="Registration/DateClose">
										<td>
											<span>
												<xsl:text>Дата прекращения действия</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="DateBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Duration/Stopped" />
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<span>
												<xsl:text>Продолжительность</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Duration/Term" />
											</xsl:call-template>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
						</xsl:if>
						<xsl:if test="Registration">
							<tr>
								<td>
									<span>
										<xsl:text>Кем зарегистрировано</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/OrgRegister" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Номер регистрационной записи</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/RegNumber" />
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Дата регистрации</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/RegDate" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Дата прекращения регистрации</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Registration/DateClose" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Documents/Document">
							<xsl:for-each select="Documents/Document">
								<tr>
									<td colspan="4">
										<span style="font-weight:bold">
											<xsl:text>Документ по обременению</xsl:text>
										</span>
									</td>
								</tr>
								<xsl:call-template name="Document">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$type" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$pos0" />
									<xsl:with-param name="pos1" select="$pos1" />
									<xsl:with-param name="pos2" select="$pos2" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="Owner_Restriction!=''">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Лица, права которых обременяются</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="Owner_Restriction" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="CadastralNumber_Restriction!=''">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Кадастровый номер ЗУ, в пользу которого установлен сервитут</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="CadastralNumber_Restriction" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Owner_Restriction_InFavorem">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Лица, в пользу которых ограничиваютcя права</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Owner_Restriction_InFavorem">
								<xsl:call-template name="Owner">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$type" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$pos0" />
									<xsl:with-param name="pos1" select="$pos1" />
									<xsl:with-param name="pos2" select="$pos2" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Register">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Учетные данные</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<xsl:if
						test="@CadastralNumber!='' or NewSubParcel/CadastralNumber_Parcel!='' or ExistEZParcels/@CadastralNumber!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый номер</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val">
										<xsl:value-of select="@CadastralNumber" />
										<xsl:value-of select="NewSubParcel/CadastralNumber_Parcel" />
										<xsl:value-of select="ExistEZParcels/@CadastralNumber" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@CadastralNumber!='' and @State!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый номер</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@CadastralNumber" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Статус объекта недвижимости</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dStates" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@State" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Name!='' or @Method!='' or (../@Method!='' and current()=../NewParcel)">
						<tr>
							<td>
								<span>
									<xsl:text>Тип объекта (код)</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dParcels" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@Name" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Способ образования</xsl:text>
								</span>
							</td>
							<xsl:if test="@Method!=''">
								<td>
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dMethod" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="@Method" />
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="../@Method!=''">
								<td>
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dMethod" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="../@Method" />
									</xsl:call-template>
								</td>
							</xsl:if>
						</tr>
					</xsl:if>
					<xsl:if test="Composition_EZ">
						<tr>
							<td>
								<span>
									<xsl:text>Тип объекта (код)</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dParcels" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="'02'" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@AdditionalName!='' or @Definition!=''">
						<xsl:choose>
							<xsl:when test="@Definition!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Обозначение</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Definition" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Дополнительное наименование</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@AdditionalName" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr>
									<td>
										<span>
											<xsl:text>Дополнительное наименование</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="@AdditionalName" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:if>
					<xsl:if test="Unified_Land_Unit/Preceding_Land_Unit">
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый номер родительского участка</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Unified_Land_Unit/Preceding_Land_Unit" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@DateCreated!='' or @DateRemoved!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Дата постановки на учет</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@DateCreated" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Дата снятия с учета</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@DateRemoved" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@DateCreatedDoc!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Дата постановки на учет по документу</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="@DateCreatedDoc" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Contactor">
						<xsl:choose>
							<xsl:when test="Contactor/@Date">
								<tr>
									<td>
										<span>
											<xsl:text>Исполнитель работ</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Contactor/*" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Дата проведения кадастровых работ</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DateBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Contactor/@Date" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr>
									<td>
										<span>
											<xsl:text>Исполнитель работ</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="Contactor/*" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="Contact_Adress!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Связь с правообладателем</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Contact_Adress" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>

		<xsl:if test="Сadastral_Record">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Кадастровая запись</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<tr>
							<td>
								<span>
									<xsl:text>Дата записи</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Сadastral_Record/DateRecord" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Лицо, удостоверяющее запись</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Сadastral_Record/Expert_Certified" />
								</xsl:call-template>
							</td>
						</tr>
						<xsl:for-each select="Сadastral_Record/CharEdit">
							<tr>
								<td>
									<span>
										<xsl:text>Характеристики изменений</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dCurrentChanges" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="." />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:if test="Сadastral_Record/DocRecord">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документы-основания</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Сadastral_Record/DocRecord">
								<xsl:call-template name="Document">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$type" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$pos0" />
									<xsl:with-param name="pos1" select="$pos1" />
									<xsl:with-param name="pos2" select="$pos2" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
						<tr>
							<td colspan="4" />
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DeleteEntryParcels">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:for-each select="DeleteEntryParcel">

			<xsl:variable name="POS" select="position()" />

			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Исключаемый участок #</xsl:text>
						<xsl:value-of select="$POS" />
					</span>
				</td>
			</tr>

			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="@CadastralNumber!=''">
							<tr>
								<td colspan="3">
									<span>
										<xsl:text>Кадастровый номер</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@CadastralNumber" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="//InsertEntryParcels">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />

		<xsl:if test="*/NewEntryParcel">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Образующиеся участки</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:for-each select="*/NewEntryParcel">
				<xsl:call-template name="NewEntryParcel">
					<xsl:with-param name="pos" select="position()" />
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
					<xsl:with-param name="type" select="$type" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="*/ExistEntryParcel">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Уточняемый участки</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:for-each select="*/ExistEntryParcel">
				<xsl:call-template name="ExistEntryParcel">
					<xsl:with-param name="pos" select="position()" />
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
					<xsl:with-param name="type" select="$type" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template name="NewEntryParcel">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:variable name="POS" select="position()" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Образующийся участок #</xsl:text>
					<xsl:value-of select="$pos" />
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="CadastralBlock!=''">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Кадастровый номер квартала</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="CadastralBlock" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td colspan="3">
							<span>
								<xsl:text>Тип объекта (код)</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="dParcels" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="@Name" />
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<span>
								<xsl:text>Обозначение</xsl:text>
							</span>
						</td>
						<td>
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="@Definition" />
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<xsl:for-each select="Area">
			<xsl:call-template name="Area" />
		</xsl:for-each>
		<xsl:apply-templates select="EntitySpatial">
			<xsl:with-param name="pos">
				<xsl:value-of select="$POS" />
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template name="ExistEntryParcel">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:variable name="POS" select="position()" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Уточняемый участок #</xsl:text>
					<xsl:value-of select="$pos" />
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="@CadastralNumber!=''">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Кадастровый номер</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="@CadastralNumber" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>

				</table>
			</td>
		</tr>

	</xsl:template>

	<xsl:template match="//OwnerNeighbours">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Правообладатели смежных земельных участков</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="OwnerNeighbour">

			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Смежный участок </xsl:text>

								</span>
							</td>
						</tr>
						<xsl:if test="@CadastralNumber!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Кадастровый номер смежного участка</xsl:text>
									</span>
								</td>

								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@CadastralNumber" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

						<xsl:for-each select="Neighbour">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Правообладатель участка</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:if test="Name!=''">
								<tr>
									<td>
										<span>
											<xsl:text>ФИО или наименование правообладателя</xsl:text>
										</span>
									</td>

									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ContactAddress!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Контактный адрес правообладателя</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="ContactAddress" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Characters">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:if
			test="Old_CadastralNumbers!='' or Prev_CadastralNumbers!='' or Providing_Pass_CadastralNumbers!='' or 
            Post_CadastralNumbers!='' or Inner_CadastralNumbers!='' or DeleteEntryParcels!='' or InsertEntryParcels!=''">
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="Old_CadastralNumbers">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Ранее присвоенные кадастровые или условные номера</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="Old_CadastralNumbers" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Prev_CadastralNumbers/CadastralNumber!=''">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Номера земельных участков, из которых образован данный участок</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Prev_CadastralNumbers/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="Providing_Pass_CadastralNumbers/CadastralNumber!=''">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Кадастровые номера частей, выделенных для обеспечения прохода и проезда</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Providing_Pass_CadastralNumbers/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="Post_CadastralNumbers">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Последующие кадастровые номера</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Post_CadastralNumbers/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="all_CadastralNumbersNewParcel">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Номера земельных участков, образованных в результате кадастровых работ</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="all_CadastralNumbersNewParcel/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="CadastralNumbersTransformationParcel">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Номера земельных участков, характеристики которых изменились в результате выдела земельных участков в счет доли в праве</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="CadastralNumbersTransformationParcel/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="CadastralNumbersRemoveParcel">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Номера земельных участков, подлежащих снятию с кадастрового учета</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="CadastralNumbersRemoveParcel/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="Inner_CadastralNumbers">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Кадастровые номера ОКС, расположенных на участке</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="Inner_CadastralNumbers/CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="DeleteEntryParcels">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Исключаемые из единого землепользования земельные участки</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="DeleteEntryParcels/DeleteEntryParcel/@CadastralNumber">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="InsertEntryParcels">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Включаемые в единое землепользование земельные участки</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:for-each select="InsertEntryParcels/InsertEntryParcel/@*">
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="." />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="SpecialNote">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Особые отметки</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="SpecialNote" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Area">
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Площадь</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:choose>
			<xsl:when
				test="$DocumentVersion='MP06' or $DocumentVersion='MP05'  or $DocumentVersion='MP08' or $DocumentVersion='MPTer'">
				<tr>
					<td>
						<table style="WIDTH: 100%">
							<xsl:call-template name="Table4" />
							<tr>
								<td>
									<span>
										<xsl:text>Площадь</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Area" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Единица измерения (код)</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Unit" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dUnit" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="Inaccuracy!=''">
								<tr>
									<td>
										<tr>
											<td>
												<span>
													<xsl:text>Погрешность</xsl:text>
												</span>
											</td>
											<td colspan="3">
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="75" />
													<xsl:with-param name="val" select="Inaccuracy" />
												</xsl:call-template>
											</td>
										</tr>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Formula!=''">
								<tr>
									<td>
										<tr>
											<td>
												<span>
													<xsl:text>Формула</xsl:text>
												</span>
											</td>
											<td colspan="3">
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="75" />
													<xsl:with-param name="val" select="Formula" />
												</xsl:call-template>
											</td>
										</tr>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="Area">
					<tr>
						<td>
							<table style="WIDTH: 100%">
								<xsl:call-template name="Table4" />
								<xsl:choose>
									<xsl:when test="not(AreaCode)">
										<tr>
											<td>
												<span>
													<xsl:text>Площадь</xsl:text>
												</span>
											</td>
											<td colspan="3">
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="Area" />
												</xsl:call-template>
											</td>
											<td>
												<span>
													<xsl:text>Единица измерения (код)</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="DictBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="Unit" />
													<xsl:with-param name="dic">
														<xsl:call-template name="dUnit" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>
												<span>
													<xsl:text>Тип площади (код)</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="DictBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="AreaCode" />
													<xsl:with-param name="dic">
														<xsl:call-template name="dArea" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<span>
													<xsl:text>Площадь</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="Area" />
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr>
									<td>
										<span>
											<xsl:text>Единица измерения (код)</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="DictBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Unit" />
											<xsl:with-param name="dic">
												<xsl:call-template name="dUnit" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Погрешность</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Innccuracy" />
										</xsl:call-template>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="ExistEZParcels/Area">
					<!-- Костыль -->
					<tr>
						<td>
							<table style="WIDTH: 100%">
								<xsl:call-template name="Table4" />
								<xsl:choose>
									<xsl:when test="not(AreaCode)">
										<tr>
											<td>
												<span>
													<xsl:text>Площадь</xsl:text>
												</span>
											</td>
											<td colspan="3">
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="75" />
													<xsl:with-param name="val" select="Area" />
												</xsl:call-template>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>
												<span>
													<xsl:text>Тип площади (код)</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="DictBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="AreaCode" />
													<xsl:with-param name="dic">
														<xsl:call-template name="dArea" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<span>
													<xsl:text>Площадь</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="Area" />
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr>
									<td>
										<span>
											<xsl:text>Единица измерения (код)</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DictBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Unit" />
											<xsl:with-param name="dic">
												<xsl:call-template name="dUnit" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Погрешность</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Innccuracy" />
										</xsl:call-template>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="Providing">
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Обеспечение доступа к участку</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<xsl:for-each select="CadastralNumber">
						<tr>
							<td>
								<span>
									<xsl:text>Кадастровый номер</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="node()" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="Definition">
						<tr>
							<td>
								<span>
									<xsl:text>Определение</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="node()" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="Other!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Другое</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Other" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>

	</xsl:template>

	<xsl:template match="//Areas">
		<xsl:call-template name="Area" />
	</xsl:template>

	<xsl:template match="//Area">
		<xsl:call-template name="Area" />
	</xsl:template>

	<xsl:template match="//Category">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Категория земель</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<tr>
						<td>
							<span>
								<xsl:text>Категория (код)</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="@Category" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dCategories" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
					<xsl:for-each select="DocCategory">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Документ, удостоверяющий сведения о категории земель</xsl:text>
								</span>
							</td>
						</tr>
						<xsl:call-template name="Document">
							<xsl:with-param name="part" select="$part" />
							<xsl:with-param name="type" select="$type" />
							<xsl:with-param name="pos" select="$pos" />
							<xsl:with-param name="pos0" select="$pos0" />
							<xsl:with-param name="pos1" select="$pos1" />
							<xsl:with-param name="pos2" select="$pos2" />
						</xsl:call-template>
						<xsl:for-each select="AppliedFilePDF">
							<xsl:call-template name="ImageRef">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$ttt" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$ppp" />
								<xsl:with-param name="pos1" select="$ppp" />
								<xsl:with-param name="pos2" select="$ppp" />
								<xsl:with-param name="val" select="@Name" />
							</xsl:call-template>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</td>
		</tr>
	</xsl:template>




	<xsl:template name="ObjectRealty">
	</xsl:template>

	<xsl:template name="Utilization">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:if
			test="Utilization/DocUtilization or Utilization/@Utilization or  Utilization/@Kind or Utilization/@ByDoc or LandPermittedUses/Utilization/DocUtilization or LandPermittedUses/Utilization/@Utilization or LandPermittedUses/Utilization/@ByDoc ">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Использование</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="Utilization/@Utilization!='' or  LandPermittedUses/Utilization/@Utilization!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Использование (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dUtilizations03" />
											<xsl:call-template name="dUtilizations" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val"
											select="Utilization/@Utilization | Utilization/@Kind | LandPermittedUses/Utilization/@Utilization" />
									</xsl:call-template>
									<!--xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="75"/> <xsl:with-param name="val"> <xsl:choose> 
										<xsl:when test="TerritorialZone">Описание территориальной зоны</xsl:when> <xsl:otherwise>Вид разрешенного использования участка</xsl:otherwise> 
										</xsl:choose> </xsl:with-param> </xsl:call-template -->
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Utilization/@ByDoc!='' or LandPermittedUses/Utilization/@ByDoc!=''">
							<tr>
								<td>
									<span>
										<xsl:text>По документам</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Utilization/@ByDoc | LandPermittedUses/Utilization/@ByDoc" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="Utilization/DocUtilization | LandPermittedUses/DocLandPermittedUses">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ, удостоверяющий сведения об использовании</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
							<xsl:for-each select="AppliedFilePDF">
								<xsl:call-template name="ImageRef">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$ttt" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$ppp" />
									<xsl:with-param name="pos1" select="$ppp" />
									<xsl:with-param name="pos2" select="$ppp" />
									<xsl:with-param name="val" select="@Name" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="LandUse">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Использование</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="LandUse/@LandUse!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Использование (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dAllowedUse" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="LandUse/@LandUse" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="CommonLand!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Состояние земельного участка</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="CommonLand" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="LandUse/DocLandUse | LandUse/DocLandPermittedUses | DocLandPermittedUses">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ, удостоверяющий сведения об использовании</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
							<xsl:for-each select="AppliedFilePDF">
								<xsl:call-template name="ImageRef">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$ttt" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$ppp" />
									<xsl:with-param name="pos1" select="$ppp" />
									<xsl:with-param name="pos2" select="$ppp" />
									<xsl:with-param name="val" select="@Name" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="PermittedUsesGradReg">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Вид (виды) разрешенного использования</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:for-each select="PermittedUsesGradReg/*">
							<tr>
								<td>
									<xsl:text># </xsl:text>
									<xsl:value-of select="position()" />
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<span>
										<xsl:text>Вид</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dAllowedUse" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="PermittedUse/@PermittedUse" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:if test="CommonLand!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Состояние земельного участка</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="CommonLand" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="LandUse/DocLandUse | LandUse/DocLandPermittedUses | DocLandPermittedUses">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ, удостоверяющий сведения об использовании</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
							<xsl:for-each select="AppliedFilePDF">
								<xsl:call-template name="ImageRef">
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="type" select="$ttt" />
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="pos0" select="$ppp" />
									<xsl:with-param name="pos1" select="$ppp" />
									<xsl:with-param name="pos2" select="$ppp" />
									<xsl:with-param name="val" select="@Name" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="NaturalObject">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Природные объекты на участке</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="Natural_Object | NaturalObject">
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="Name">
							<tr>
								<td>
									<span>
										<xsl:text>Вид объекта (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Name" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dNatural_Objects03" />
											<xsl:call-template name="dNatural_Objects" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Kind">
							<tr>
								<td>
									<span>
										<xsl:text>Вид объекта (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Kind" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dNatural_Objects03" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

						<xsl:if test="Char">
							<tr>
								<td>
									<span>
										<xsl:text>Характеристика</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Char" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Forestry">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование лесничества (лесопарка), участкового лесничества</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Forestry" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

						<xsl:if test="Type_ProtectiveForest!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Категория защитных лесов</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Type_ProtectiveForest" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Forestry!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование лесничества (лесопарка)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Forestry" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ForestUse!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Целевое назначение лесов</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="ForestUse" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dForest_Use03" />
											<xsl:call-template name="dForest_Use" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ProtectiveForest!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Категория защитных лесов</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="ProtectiveForest" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="CodeProtectiveForest!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Категория защитных лесов по классификатору</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="CodeProtectiveForest" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dForestCategoryProtective" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Type_WaterObject!='' or Name_Object!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование водного или иного объекта</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Name_Object" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Вид водного объекта</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Type_WaterObject" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Other_Char">
							<tr>
								<td>
									<span>
										<xsl:text>Характеристики для иного природного объекта</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Other_Char" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="QuarterNumbers">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text>Номера лесных кварталов</xsl:text>
									</span>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="QuarterNumbers/*">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text># </xsl:text>
										<xsl:value-of select="position()" />
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Номер</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="node()" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:if test="TaxationSeparations">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text>Номера лесотаксационных выделов</xsl:text>
									</span>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="TaxationSeparations/*">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text> # </xsl:text>
										<xsl:value-of select="position()" />
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Номер</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="node()" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:if test="ForestEncumbrances">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text> Виды разрешенного использования лесов</xsl:text>
									</span>
								</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="ForestEncumbrances/*">
							<tr>
								<td colspan="3">
									<span style="font-weight:bold">
										<xsl:text># </xsl:text>
										<xsl:value-of select="position()" />
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Номер</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="node()" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dForestEncumbrances" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:if test="CodeProtectiveForest">
							<tr>
								<td>
									<span>
										<xsl:text>Категория защитных лесов</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="CodeProtectiveForest" />
										<xsl:with-param name="dic">
											<xsl:call-template name="dForestCategoryProtective" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

						<xsl:for-each select="DocNatural">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ, удостоверяющий сведения о природном объекте</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>

	</xsl:template>

	<xsl:template match="//Natural_Objects">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:call-template name="NaturalObject">
			<xsl:with-param name="part" select="$part" />
			<xsl:with-param name="type" select="$type" />
			<xsl:with-param name="pos" select="$pos" />
			<xsl:with-param name="pos0" select="$pos0" />
			<xsl:with-param name="pos1" select="$pos1" />
			<xsl:with-param name="pos2" select="$pos2" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="//Ground_Payments">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Базовые платежи</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="Ground_Payment">
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<tr>
							<td>
								<span>
									<xsl:text>Вид платежа (код)</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="@Kind" />
									<xsl:with-param name="dic">
										<xsl:call-template name="dGroundPayments" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Значение платежа</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="@Value" />
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Единица измерения</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@Unit" />
									<xsl:with-param name="dic">
										<xsl:call-template name="dUnit" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Дата начала действия</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@Date_Starting" />
								</xsl:call-template>
							</td>
							<xsl:if test="@Date">
								<td>
									<span>
										<xsl:text>Дата</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="DateBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="@Date" />
									</xsl:call-template>
								</td>
							</xsl:if>
						</tr>
						<xsl:for-each select="DocPayment">
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ, удостоверяющий сведения о базовом платеже</xsl:text>
									</span>
								</td>
							</tr>
							<xsl:call-template name="Document">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$type" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$pos0" />
								<xsl:with-param name="pos1" select="$pos1" />
								<xsl:with-param name="pos2" select="$pos2" />
							</xsl:call-template>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="SubParcel">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>ЧАСТЬ УЧАСТКА</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="WIDTH: 100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="@Definition!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Обозначение</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="@Definition" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@NumberRecord!='' or @Number_PP!='' or @State!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Учетный номер</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@Number_PP | @NumberRecord|@Definition" />
								</xsl:call-template>
							</td>
							<xsl:choose>
								<xsl:when test="@State">
									<td>
										<span>
											<xsl:text>Статус объекта недвижимости</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DictBox">
											<xsl:with-param name="dic">
												<xsl:call-template name="dStates" />
											</xsl:with-param>
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@State" />
										</xsl:call-template>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<span>
											<xsl:text>Обозначение на плане</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Definition" />
										</xsl:call-template>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:if>
					<xsl:if test="@SubParcel_Realty">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Часть занята объектом капитального строительства</xsl:text>
								</span>
							</td>
							<td>
								<xsl:variable name="SubParcel_Realty">
									<xsl:choose>
										<xsl:when test="@SubParcel_Realty=1">
											<xsl:text>да</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="$SubParcel_Realty" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Full">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Часть совпадает с целым участком</xsl:text>
								</span>
							</td>
							<td>
								<xsl:variable name="Full">
									<xsl:choose>
										<xsl:when test="@Full='true' or @Full=true or @Full='1' or @Full=1">
											<xsl:text>да</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="$Full" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@DateCreated!='' or @DateRemoved!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Дата постановки на учет</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@DateCreated" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Дата снятия с учета</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DateBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="@DateRemoved" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
		<xsl:choose>
			<xsl:when test="Area">
				<xsl:for-each select="Area">
					<xsl:call-template name="Area">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="Areas">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="Encumbrances">
				<xsl:apply-templates select="Encumbrances">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="Encumbrance">
				<xsl:apply-templates select="Encumbrance">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>

			</xsl:when>
			<xsl:when test="Object_Entry">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Объект, входящий в состав единого землепользования</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%">
							<xsl:call-template name="Table4" />
							<tr>
								<td>
									<span>
										<xsl:text>Тип (код)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="dRealty14" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Object_Entry/@Type" />
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Кадастровый номер</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Object_Entry/@CadastralNumber" />
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="Realty">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Сведения о части, занятой объектом недвижимости</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%">
							<xsl:call-template name="Table4" />
							<xsl:if test="Realty/@CadastralNumber!='' or Realty/@ConditionalCadastralNumber!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Кадастровый номер</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/@CadastralNumber" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Условный кадастровый номер</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/@ConditionalCadastralNumber" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Realty/Using">
								<tr>
									<td colspan="2">
										<span>
											<xsl:text>Сведения об использовании объекта недвижимости</xsl:text>
										</span>
									</td>
									<td colspan="2">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Realty/Using" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Realty/Name!='' or Realty/Type!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Наименование</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Name" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Тип</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DictBox">
											<xsl:with-param name="dic">
												<xsl:call-template name="dRealty" />
											</xsl:with-param>
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Type" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td colspan="4">
									<span style="font-weight:bold">
										<xsl:text>Документ об объекте недвижимости</xsl:text>
									</span>
								</td>
							</tr>

							<xsl:if test="Realty/Registration/OrgRegister!='' or Realty/Registration/RegNumber!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Кем зарегистрировано</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Registration/OrgRegister" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Номер регистрационной записи</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Registration/RegNumber" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Realty/Registration/RegDate!='' or Realty/Registration/DateClose!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Дата регистрации</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DateBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Registration/RegDate" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Дата прекращения регистрации</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DateBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="Realty/Registration/DateClose" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="Entity_Spatial" />
		<xsl:apply-templates select="EntitySpatial" />
		<xsl:apply-templates select="Contours" />
	</xsl:template>

	<xsl:template match="ExistSubParcels">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:for-each select="ExistSubParcel">
			<tr>
				<td>
					<b>
						<xsl:text>УТОЧНЯЕМАЯ ЧАСТЬ УЧАСТКА</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="SubParcels2">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:for-each select="NewSubParcel">
			<tr>
				<td>
					<b>
						<xsl:text>ОБРАЗУЕМАЯ ЧАСТЬ УЧАСТКА</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="ExistSubParcel">
			<tr>
				<td>
					<b>
						<xsl:text>УТОЧНЯЕМАЯ ЧАСТЬ УЧАСТКА</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>

	</xsl:template>

	<xsl:template match="SubParcels">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:for-each select="NewSubParcel">

			<tr>
				<td>
					<b>
						<xsl:text>ОБРАЗУЕМАЯ ЧАСТЬ УЧАСТКА</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="ExistSubParcel">

			<tr>
				<td>
					<b>
						<xsl:text>УТОЧНЯЕМАЯ ЧАСТЬ УЧАСТКА</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select=".//InvariableSubParcel">
			<tr>
				<td>
					<b>
						<xsl:text>ЧАСТЬ УЧАСТКА, СОХРАНЯЮЩАЯСЯ БЕЗ ИЗМЕНЕНИЙ</xsl:text>
					</b>
				</td>
			</tr>
			<xsl:call-template name="SubParcel">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="//Location">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Местоположение</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:if test="inBounds!='' or Placed!='' or Elaboration!=''">
			<tr>
				<td>
					<table style="WIDTH: 100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="inBounds!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Ориентир расположен в границах участка</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="dic">
											<xsl:call-template name="inBounds" />
										</xsl:with-param>
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="inBounds" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Elaboration/ReferenceMark!='' or Placed!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование ориентира</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Elaboration/ReferenceMark" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Положение на ДКК</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Placed" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Elaboration/Distance!='' or Elaboration/Direction!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Расстояние до ориентира</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Elaboration/Distance" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Направление</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Elaboration/Direction" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="Address">
				<xsl:for-each select="Address">
					<xsl:choose>
						<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location17">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="4">
									<xsl:call-template name="Location">
										<xsl:with-param name="vis" select="'unvis'" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$DocumentVersion='Request17' or $DocumentVersion='RequestGRP'">
						<tr>
							<td colspan="4">
								<xsl:call-template name="Location17">
									<xsl:with-param name="vis" select="'unvis'" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="4">
								<xsl:call-template name="Location">
									<xsl:with-param name="vis" select="'unvis'" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="Document">
			<tr>
				<td colspan="4">
					<span style="font-weight:bold">
						<xsl:text>Реквизиты акта органа государственной власти или органа местного самоуправления, уполномоченного присваивать адреса земельным участкам</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:call-template name="Document">
				<xsl:with-param name="part" select="$part" />
				<xsl:with-param name="type" select="$type" />
				<xsl:with-param name="pos" select="$pos" />
				<xsl:with-param name="pos0" select="$pos0" />
				<xsl:with-param name="pos1" select="$pos1" />
				<xsl:with-param name="pos2" select="$pos2" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Location">
		<xsl:param name="vis" />
		<table style="width:100%">
			<xsl:attribute name="class">
        <xsl:value-of select="$vis" />
      </xsl:attribute>
			<tr>
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
			</tr>
			<xsl:if test="Code_OKATO or Code_KLADR or OKATO or KLADR">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>ОКАТО</xsl:text>
						</span>
					</td>
					<td colspan="2">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="Code_OKATO|OKATO" />
						</xsl:call-template>
					</td>
					<td colspan="2">
						<span>
							<xsl:text>КЛАДР</xsl:text>
						</span>
					</td>
					<td colspan="2">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="Code_KLADR|KLADR" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="OKTMO">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>OKTMO</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="OKTMO" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Postal_Code or PostalCode">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Индекс</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Postal_Code|PostalCode" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Region">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Регион (код)</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="dic">
								<xsl:call-template name="dRegionsRF" />
							</xsl:with-param>
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Region" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="District">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Район</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="District/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="District/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Urban_District| UrbanDistrict">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Городской район</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Urban_District/@Name | UrbanDistrict/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Urban_District/@Type | UrbanDistrict/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>

			<xsl:if test="Soviet_Village|SovietVillage">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Cельский Совет</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Soviet_Village/@Name|SovietVillage/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Soviet_Village/@Type|SovietVillage/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="City">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Город</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="City/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="City/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Locality">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Населенный пункт</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Locality/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Locality/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Locality1">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Населенный пункт (доп.1)</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Locality1/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Locality1/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Locality2">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Населенный пункт (доп.2)</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Locality2/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Locality2/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Street">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Улица</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Street/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Street/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="Level1/@Value or Level2/@Value or Level3/@Value or Apartment/@Value">
					<xsl:if test="Level1/@Value">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Дом</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="60" />
									<xsl:with-param name="val" select="Level1/@Value" />
								</xsl:call-template>
							</td>
							<td colspan="1">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dLocationLevel1Type" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Level1/@Type" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Level2/@Value">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Корпус</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="60" />
									<xsl:with-param name="val" select="Level2/@Value" />
								</xsl:call-template>
							</td>
							<td colspan="1">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dLocationLevel1Type" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Level2/@Type" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Level3/@Value">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Строение</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="60" />
									<xsl:with-param name="val" select="Level3/@Value" />
								</xsl:call-template>
							</td>
							<td colspan="1">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dLocationLevel1Type" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Level3/@Type" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Apartment/@Value">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Квартира</xsl:text>
								</span>
							</td>
							<td colspan="5">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="60" />
									<xsl:with-param name="val" select="Apartment/@Value" />
								</xsl:call-template>
							</td>
							<td colspan="1">
								<xsl:call-template name="DictBox">
									<xsl:with-param name="dic">
										<xsl:call-template name="dLocationLevel1Type" />
									</xsl:with-param>
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Apartment/@Type" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="House or Parcel or Structure or Apartment">
						<tr>
							<td>
								<span>
									<xsl:text>Дом</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="House" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Корпус</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Building" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Строение</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Structure" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Квартира</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="15" />
									<xsl:with-param name="val" select="Apartment" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="Note">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Адрес</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Note" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Other">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Иное описание местоположения</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Other" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>

		</table>
	</xsl:template>

	<xsl:template name="LocationStatementGKN01"
		xmlns:root="urn://x-artefacts-rosreestr-gov-ru/statement/gkn/1.0.9"
		xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1">
		<xsl:param name="vis" />

		<table style="width:100%">

			<xsl:attribute name="class">
        <xsl:value-of select="$vis" />
      </xsl:attribute>
			<xsl:if test="loc2:OKATO or loc2:KLADR">
				<tr>
					<td style="WIDTH: 10%" />
					<td style="WIDTH: 15%" />
					<td style="WIDTH: 10%" />
					<td style="WIDTH: 15%" />
					<td style="WIDTH: 10%" />
					<td style="WIDTH: 15%" />
					<td style="WIDTH: 10%" />
					<td style="WIDTH: 15%" />
				</tr>

				<tr>
					<xsl:if test="loc2:OKATO!=''">
						<td colspan="2">
							<span>
								<xsl:text>ОКАТО</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="loc2:OKATO" />
							</xsl:call-template>
						</td>
					</xsl:if>
					<xsl:if test="loc2:KLADR!=''">
						<td colspan="2">
							<span>
								<xsl:text>КЛАДР</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="25" />
								<xsl:with-param name="val" select="loc2:KLADR" />
							</xsl:call-template>
						</td>
					</xsl:if>
				</tr>

				<tr>
					<xsl:choose>
						<xsl:when test="loc2:OKTMO!=''">
							<td colspan="2">
								<span>
									<xsl:text>ОКТМО</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="loc2:OKTMO" />
								</xsl:call-template>
							</td>

							<td colspan="2">
								<span>
									<xsl:text>Индекс</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="loc2:PostalCode" />
								</xsl:call-template>
							</td>
						</xsl:when>

						<xsl:otherwise>
							<xsl:if test="loc2:PostalCode!=''">
								<td colspan="2">
									<span>
										<xsl:text>Индекс</xsl:text>
									</span>
								</td>
								<td colspan="6">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="loc2:PostalCode" />
									</xsl:call-template>
								</td>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
				<xsl:if test="loc2:Region!=''">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Регион</xsl:text>
							</span>
						</td>

						<td colspan="6">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="dRegionsRF" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="loc2:Region" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:District">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Район</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:District/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:District/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:City">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Город</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:City/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:City/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="loc2:UrbanDistrict">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Городской район</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:UrbanDistrict/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:UrbanDistrict/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="loc2:SovietVillage">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Cельский Совет</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:SovietVillage/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:SovietVillage/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:Locality">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Населенный пункт</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Locality/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Locality/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:Street">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Улица</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Street/@Name" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Street/@Type" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:Level1">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Дом</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Level1/@Value" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Level1/@Type" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dLocationLevel1Type" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="loc2:Level2">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Корпус</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Level2/@Value" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Level2/@Type" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dLocationLevel1Type" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="loc2:Level3">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Строение</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Level3/@Value" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Level3/@Type" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dLocationLevel1Type" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="loc2:Apartment">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Квартира</xsl:text>
							</span>
						</td>
						<td colspan="5">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="60" />
								<xsl:with-param name="val" select="loc2:Apartment/@Value" />
							</xsl:call-template>
						</td>
						<td colspan="1">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="siz" select="15" />
								<xsl:with-param name="val" select="loc2:Apartment/@Type" />
								<xsl:with-param name="dic">
									<xsl:call-template name="dLocationLevel1Type" />
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:Other">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Иное</xsl:text>
							</span>
						</td>
						<td colspan="6">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="loc2:Other" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="loc2:Note">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Неформализованное описание</xsl:text>
							</span>
						</td>
						<td colspan="6">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="loc2:Note" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td colspan="6" />
				</tr>

			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="Location17"
		xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1">

		<xsl:param name="vis" />


		<table style="width:100%">
			<xsl:attribute name="class">
        <xsl:value-of select="$vis" />
      </xsl:attribute>

			<tr>
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
			</tr>
			<xsl:if test="loc2:OKATO or loc2:KLADR">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>ОКАТО</xsl:text>
						</span>
					</td>
					<td colspan="2">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="loc2:OKATO" />
						</xsl:call-template>
					</td>
					<td colspan="2">
						<span>
							<xsl:text>КЛАДР</xsl:text>
						</span>
					</td>
					<td colspan="2">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="loc2:KLADR" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Postal_Code">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Индекс</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Postal_Code" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Region">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Регион (код)</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="dic">
								<xsl:call-template name="dRegionsRF" />
							</xsl:with-param>
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Region" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="District">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Район</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="District/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="District/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="City">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Город</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="City/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="City/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Urban_District">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Городской район</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Urban_District/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Urban_District/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dUrbanDistrict" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Soviet_Village">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Сельсовет</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Soviet_Village/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Soviet_Village/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dSovietVillage" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Locality">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Населенный пункт</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Locality/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Locality/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Street">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Улица</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Street/@Name" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Street/@Type" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Level1">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Дом</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Level1/@Value" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Level1/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dLocationLevel1Type" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Level2">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Корпус</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Level2/@Value" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Level2/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dLocationLevel2Type" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Level3">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Строение</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Level3/@Value" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Level3/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dLocationLevel3Type" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Apartment">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Квартира</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="60" />
							<xsl:with-param name="val" select="Apartment/@Value" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="siz" select="15" />
							<xsl:with-param name="val" select="Apartment/@Type" />
							<xsl:with-param name="dic">
								<xsl:call-template name="dApartmentType" />
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Other">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Иное</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Other" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Note">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Адрес</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Note" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Name_consolidation">
				<tr>
					<td colspan="2">
						<span>
							<xsl:text>Наименование некоммерческого объединения граждан</xsl:text>
						</span>
					</td>
					<td colspan="6">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="Name_consolidation" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td colspan="6" />
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="AddressStatement01" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents"
		xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons"
		xmlns:addr="http://rosreestr.ru/services/v0.1/commons/Address"
		xmlns:obj="http://rosreestr.ru/services/v0.1/commons/TObject"
		xmlns:tns="http://rosreestr.ru/services/v0.18/TStatement"
		xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects">
		<xsl:param name="vis" />

		<table style="width:100%">
			<xsl:attribute name="class">
        <xsl:value-of select="$vis" />
      </xsl:attribute>
			<tr>
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
				<td style="WIDTH: 10%" />
				<td style="WIDTH: 15%" />
			</tr>
			<xsl:if test="addr:fias">
				<tr>
					<td colspan="1">
						<span>
							<xsl:text>ФИАС</xsl:text>
						</span>
					</td>
					<td colspan="7">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="addr:fias" />
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<span>
							<xsl:text>ОКАТО</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="addr:okato" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<span>
							<xsl:text>КЛАДР</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="addr:kladr" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>

			<xsl:if test="addr:oktmo or addr:postalCode">
				<tr>
					<td colspan="1">
						<span>
							<xsl:text>ОКТМО</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="addr:oktmo" />
						</xsl:call-template>
					</td>
					<td colspan="1">
						<span>
							<xsl:text>Почтовый индекс</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="addr:postalCode" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="addr:region">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Код региона</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:district">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Район</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:city">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Город</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:urbanDistrict">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Внутригородской район</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:locality">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Населенный пункт</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:street">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Улица</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:additionalElement">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Доп. адресообразующий элемент</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:subordinateElement">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Подч. доп. адресообразующий элемент</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
			<xsl:for-each select="addr:house">
				<tr>
					<td colspan="3">
						<span style="font-weight:bold">
							<xsl:text>Информация о корпусе, здании, строении</xsl:text>
						</span>
					</td>
					<td colspan="5">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="50" />
							<xsl:with-param name="val" select="node()" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="addr:apartment">
				<tr>
					<td colspan="8">
						<span style="font-weight:bold">
							<xsl:text>Квартира</xsl:text>
						</span>
					</td>
				</tr>
				<xsl:call-template name="AddressObj" />
			</xsl:for-each>
		</table>
		<xsl:if test="addr:other">
			<tr>
				<td>
					<span>
						<xsl:text>Иное описание</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="Textarea">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="addr:other" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="addr:note">
			<tr>
				<td>
					<span>
						<xsl:text>Неформализованное описание</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="Textarea">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="addr:note" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>

	</xsl:template>

	<xsl:template name="AddressObj" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents"
		xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons"
		xmlns:addr="http://rosreestr.ru/services/v0.1/commons/Address"
		xmlns:obj="http://rosreestr.ru/services/v0.1/commons/TObject"
		xmlns:tns="http://rosreestr.ru/services/v0.18/TStatement"
		xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects">
		<tr>
			<td colspan="1">
				<span>
					<xsl:text>Код</xsl:text>
				</span>
			</td>
			<td colspan="1">
				<xsl:call-template name="TextBox">
					<xsl:with-param name="siz" select="15" />
					<xsl:with-param name="val" select="addr:code" />
				</xsl:call-template>
			</td>
			<td colspan="1">
				<span>
					<xsl:text>Тип</xsl:text>
				</span>
			</td>
			<td colspan="1">
				<xsl:call-template name="TextBox">
					<xsl:with-param name="siz" select="15" />
					<xsl:with-param name="val" select="addr:type" />
				</xsl:call-template>
			</td>
			<td colspan="1">
				<span>
					<xsl:text>Наименование</xsl:text>
				</span>
			</td>
			<td colspan="3">
				<xsl:call-template name="TextBox">
					<xsl:with-param name="siz" select="25" />
					<xsl:with-param name="val" select="addr:name" />
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="//Entity_Spatial">
		<xsl:param name="pos" />
		<xsl:variable name="Entity_Spatial" select="position()" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Границы</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="@Ent_Sys!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор системы координат</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@Ent_Sys" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@EntSys!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор системы координат</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@EntSys" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Map_Id!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор карты</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@Map_Id" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Sp_Obj_Id!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор пространственного объекта</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@Sp_Obj_Id" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Характерные точки</xsl:text>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<table class="unvis" width="100%">
								<tr>
									<td>
										<span>
											<xsl:text>Точка # (контур)</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Префикс.Номер</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата X</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата Y</xsl:text>
										</span>
									</td>
									<xsl:if test="@Delta_Geopoint">
										<td>
											<span>
												<xsl:text>Погрешность</xsl:text>
											</span>
										</td>
										<xsl:choose>
											<xsl:when test="contains(local-name(..),'Building') or contains(local-name(..),'Construction')">
												<td>
													<span>
														<xsl:text>Радиус</xsl:text>
													</span>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="@Geopoint_Zacrep">
													<td>
														<span>
															<xsl:text>Способ закрепления</xsl:text>
														</span>
													</td>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</tr>
								<xsl:for-each select="Spatial_Element">
									<xsl:variable name="Spatial_Element" select="position()-1" />
									<xsl:for-each select="Spelement_Unit/Ordinate">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:text>"</xsl:text>
														<xsl:value-of select="../@Type_Unit" />
														<xsl:if test="../@Su_Nmb!='' and ../@Type_Unit!='Точка'">
															<xsl:text> </xsl:text>
															<xsl:value-of select="../@Su_Nmb" />
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="@Ord_Nmb" />
														<xsl:text>" (</xsl:text>
														<xsl:value-of select="$pos" />
														<xsl:text>.</xsl:text>
														<xsl:value-of select="$Spatial_Element" />
														<xsl:text>)</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:if test="@Point_Pref!=''">
															<xsl:value-of select="@Point_Pref" />
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:value-of select="@Num_Geopoint" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@X" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@Y" />
												</xsl:call-template>
											</td>
											<!--<td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="15"/> <xsl:with-param name="val" 
												select="@Delta_Geopoint"/> </xsl:call-template> </td> -->
											<xsl:choose>
												<xsl:when
													test="contains(local-name(../../../..),'Building') or contains(local-name(../../../..),'Construction')">
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="@R" />
														</xsl:call-template>
													</td>
												</xsl:when>
											</xsl:choose>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="Spelement_Unit/NewOrdinate">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val">
														<xsl:text>"</xsl:text>
														<xsl:value-of select="../@Type_Unit" />
														<xsl:if test="../@Su_Nmb!='' and ../@Type_Unit!='Точка'">
															<xsl:text> </xsl:text>
															<xsl:value-of select="../@Su_Nmb" />
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="@Ord_Nmb" />
														<xsl:text>" (</xsl:text>
														<xsl:value-of select="$pos" />
														<xsl:text>.</xsl:text>
														<xsl:value-of select="$Spatial_Element" />
														<xsl:text>)</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val">
														<xsl:if test="@Point_Pref!=''">
															<xsl:value-of select="@Point_Pref" />
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:value-of select="@Num_Geopoint" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val" select="@X" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val" select="@Y" />
												</xsl:call-template>
											</td>
											<!-- <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="15"/> <xsl:with-param name="val" 
												select="@Delta_Geopoint"/> </xsl:call-template> </td> -->
											<xsl:choose>
												<xsl:when
													test="contains(local-name(../../../..),'Building') or contains(local-name(../../../..),'Construction')">
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="20" />
															<xsl:with-param name="val" select="@R" />
														</xsl:call-template>
													</td>
												</xsl:when>
												<!-- <xsl:otherwise> <td> <xsl:call-template name="DictBox"> <xsl:with-param name="dic"> <xsl:call-template name="dGeopoint_Zacrep03"/> 
													<xsl:call-template name="dGeopoint_Zacrep"/> </xsl:with-param> <xsl:with-param name="siz" select="25"/> <xsl:with-param name="val" 
													select="@Geopoint_Zacrep"/> </xsl:call-template> </td> </xsl:otherwise> -->
											</xsl:choose>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<xsl:if test="Borders">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Части границы</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<xsl:choose>
									<xsl:when test="$DocumentVersion='MP04'">
										<table class="unvis" width="100%">
											<tr>
												<td>
													<span>
														<xsl:text>Контур границы</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>От "Точки #"</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>До "Точки #"</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>Длина</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>Описание</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>Номера смежных участков</xsl:text>
													</span>
												</td>
											</tr>
											<xsl:for-each select="Borders/Border">
												<tr>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:if test="@Spatial!=''">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="@Spatial" />
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<xsl:variable name="p1">
														<xsl:value-of select="@Point1" />
													</xsl:variable>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:value-of select="$p1" />
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<xsl:variable name="p2">
														<xsl:value-of select="@Point2" />
													</xsl:variable>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:value-of select="$p2" />
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="Edge/Length" />
														</xsl:call-template>
													</td>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="Edge/Definition" />
														</xsl:call-template>
													</td>
													<td>
														<xsl:variable name="CadNum">
															<xsl:for-each select="//RelatedParcels/ParcelNeighbours">
																<xsl:variable name="Points">
																	<xsl:value-of select="Definition" />
																</xsl:variable>
																<xsl:variable name="p01">
																	<xsl:value-of select="substring-before($Points,'-')" />
																</xsl:variable>
																<xsl:variable name="p02">
																	<xsl:value-of select="substring-after($Points,'-')" />
																</xsl:variable>
																<xsl:if test="($p1=$p01 and $p02=$p2) or ($p2=$p01 and $p02=$p1)">
																	<xsl:value-of select="ParcelNeighbour/Cadastral_Number" />
																</xsl:if>
															</xsl:for-each>
														</xsl:variable>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="25" />
															<xsl:with-param name="val">
																<xsl:value-of select="$CadNum" />
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<table class="unvis" width="100%">
											<tr>
												<td>
													<span>
														<xsl:text>Контур границы</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>От "Точки #"</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>До "Точки #"</xsl:text>
													</span>
												</td>
												<!--td> <span> <xsl:text>Градус.Минута</xsl:text> </span> </td -->
												<td>
													<span>
														<xsl:text>Длина</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>Описание</xsl:text>
													</span>
												</td>
												<td>
													<span>
														<xsl:text>Номера смежных участков</xsl:text>
													</span>
												</td>
											</tr>
											<xsl:for-each select="Borders/Border">
												<tr>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:if test="@Spatial!=''">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="@Spatial" />
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:value-of select="@Point1" />
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val">
																<xsl:value-of select="@Point2" />
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<!--td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="15"/> <xsl:with-param name="val"> 
														<xsl:if test="Edge/Direction_Angle!=''"> <xsl:value-of select="Edge/Direction_Angle/Degree"/> <xsl:text>.</xsl:text> <xsl:value-of 
														select="Edge/Direction_Angle/Minute"/> </xsl:if> </xsl:with-param> </xsl:call-template> </td -->
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="Edge/Length" />
														</xsl:call-template>
													</td>
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="Edge/Definition" />
														</xsl:call-template>
													</td>

													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="25" />
															<xsl:with-param name="val">
																<xsl:for-each select="Edge/Neighbours/CadastralNumber">
																	<xsl:value-of select="." />
																	<xsl:text> </xsl:text>
																</xsl:for-each>
															</xsl:with-param>
														</xsl:call-template>
													</td>

												</tr>
											</xsl:for-each>
										</table>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="//EntitySpatial">
		<xsl:param name="pos" />
		<xsl:variable name="Entity_Spatial" select="position()" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Границы</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="@EntSys!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор системы координат</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@EntSys" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Map_Id!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор карты</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@Map_Id" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="@Sp_Obj_Id!=''">
						<tr>
							<td colspan="2">
								<span>
									<xsl:text>Идентификатор пространственного объекта</xsl:text>
								</span>
							</td>
							<td colspan="2">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="50" />
									<xsl:with-param name="val" select="@Sp_Obj_Id" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="@CsCode!='' or @Name!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Код системы координат</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="@CsCode" />
									</xsl:call-template>
								</td>
								<td>
									<span>
										<xsl:text>Наименование системы координат</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="@Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@CsCode!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Код системы координат</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@CsCode" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@Name!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Код системы координат</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:when>


					</xsl:choose>
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Характерные точки</xsl:text>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<table class="unvis" width="100%">
								<tr>
									<td>
										<span>
											<xsl:text>Точка # (контур)</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Префикс.Номер</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата X</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата Y</xsl:text>
										</span>
									</td>
									<xsl:if test="SpatialElement/@DeltaGeopoint or SpatialElement/SpelementUnit/Ordinate/@DeltaGeopoint">

										<td>
											<span>
												<xsl:text>Погрешность</xsl:text>
											</span>
										</td>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="contains(local-name(..),'Building') or contains(local-name(..),'Construction')">
											<td>
												<span>
													<xsl:text>Радиус</xsl:text>
												</span>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="SpatialElement/@GeopointZacrep or SpatialElement/SpelementUnit/Ordinate/@GeopointZacrep">
												<td>
													<span>
														<xsl:text>Способ закрепления</xsl:text>
													</span>
												</td>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
								<xsl:for-each select="SpatialElement">
									<xsl:variable name="Spatial_Element" select="position()-1" />
									<xsl:for-each select="SpelementUnit/Ordinate">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:text>"</xsl:text>
														<xsl:value-of select="../@TypeUnit" />
														<xsl:if test="../@Su_Nmb!='' and ../@TypeUnit!='Точка'">
															<xsl:text> </xsl:text>
															<xsl:value-of select="../@Su_Nmb" />
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="@OrdNmb" />
														<xsl:text>" (</xsl:text>
														<xsl:value-of select="$pos" />
														<xsl:text>.</xsl:text>
														<xsl:value-of select="$Spatial_Element" />
														<xsl:text>)</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:if test="@PointPref!=''">
															<xsl:value-of select="@PointPref" />
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:value-of select="@NumGeopoint" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@X" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@Y" />
												</xsl:call-template>
											</td>
											<xsl:if test="@DeltaGeopoint!=''">

												<td>
													<xsl:call-template name="TextBox">
														<xsl:with-param name="siz" select="15" />
														<xsl:with-param name="val" select="@DeltaGeopoint" />
													</xsl:call-template>
												</td>
											</xsl:if>

											<xsl:if test="@GeopointZacrep!=''">

												<td>
													<xsl:call-template name="TextBox">
														<xsl:with-param name="siz" select="15" />
														<xsl:with-param name="val" select="@GeopointZacrep" />
													</xsl:call-template>
												</td>
											</xsl:if>
											<xsl:choose>
												<xsl:when
													test="contains(local-name(../../../..),'Building') or contains(local-name(../../../..),'Construction')">
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="15" />
															<xsl:with-param name="val" select="@R" />
														</xsl:call-template>
													</td>
												</xsl:when>
											</xsl:choose>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="SpelementUnit/NewOrdinate">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val">
														<xsl:text>"</xsl:text>
														<xsl:value-of select="../@TypeUnit" />
														<xsl:if test="../@Su_Nmb!='' and ../@TypeUnit!='Точка'">
															<xsl:text> </xsl:text>
															<xsl:value-of select="../@Su_Nmb" />
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="@OrdNmb" />
														<xsl:text>" (</xsl:text>
														<xsl:value-of select="$pos" />
														<xsl:text>.</xsl:text>
														<xsl:value-of select="$Spatial_Element" />
														<xsl:text>)</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val">
														<xsl:if test="@PointPref!=''">
															<xsl:value-of select="@PointPref" />
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:value-of select="@NumGeopoint" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val" select="@X" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="20" />
													<xsl:with-param name="val" select="@Y" />
												</xsl:call-template>
											</td>
											<!-- <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="15"/> <xsl:with-param name="val" 
												select="@Delta_Geopoint"/> </xsl:call-template> </td> -->
											<xsl:choose>
												<xsl:when
													test="contains(local-name(../../../..),'Building') or contains(local-name(../../../..),'Construction')">
													<td>
														<xsl:call-template name="TextBox">
															<xsl:with-param name="siz" select="20" />
															<xsl:with-param name="val" select="@R" />
														</xsl:call-template>
													</td>
												</xsl:when>
												<!-- <xsl:otherwise> <td> <xsl:call-template name="DictBox"> <xsl:with-param name="dic"> <xsl:call-template name="dGeopoint_Zacrep03"/> 
													<xsl:call-template name="dGeopoint_Zacrep"/> </xsl:with-param> <xsl:with-param name="siz" select="25"/> <xsl:with-param name="val" 
													select="@Geopoint_Zacrep"/> </xsl:call-template> </td> </xsl:otherwise> -->
											</xsl:choose>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<xsl:if test="Borders">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Части границы</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<table class="unvis" width="100%">
									<tr>
										<td>
											<span>
												<xsl:text>Контур границы</xsl:text>
											</span>
										</td>
										<td>
											<span>
												<xsl:text>От "Точки #"</xsl:text>
											</span>
										</td>
										<td>
											<span>
												<xsl:text>До "Точки #"</xsl:text>
											</span>
										</td>
										<td>
											<span>
												<xsl:text>Длина</xsl:text>
											</span>
										</td>
										<xsl:if test="Edge/Definition!=''">
											<td>
												<span>
													<xsl:text>Описание</xsl:text>
												</span>
											</td>
										</xsl:if>
									</tr>
									<xsl:for-each select="Borders/Border">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:if test="@Spatial!=''">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="@Spatial" />
															<xsl:text>)</xsl:text>
														</xsl:if>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<xsl:variable name="p1">
												<xsl:value-of select="@Point1" />
											</xsl:variable>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:value-of select="$p1" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<xsl:variable name="p2">
												<xsl:value-of select="@Point2" />
											</xsl:variable>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:value-of select="$p2" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="Edge/Length" />
												</xsl:call-template>
											</td>
											<xsl:if test="Edge/Definition!=''">
												<td>
													<xsl:call-template name="TextBox">
														<xsl:with-param name="siz" select="15" />
														<xsl:with-param name="val" select="Edge/Definition" />
													</xsl:call-template>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="ChangeBorder">
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Границы</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<tr>
						<td colspan="4">
							<span style="font-weight:bold">
								<xsl:text>Характерные точки</xsl:text>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<table class="unvis" width="100%">
								<tr>
									<td>
										<span>
											<xsl:text>Точка</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Префикс.Номер</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата X</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Координата Y</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Погрешность</xsl:text>
										</span>
									</td>
									<td>
										<span>
											<xsl:text>Способ закрепления</xsl:text>
										</span>
									</td>
								</tr>
								<xsl:for-each select="ChangeBorder">
									<xsl:variable name="Spatial_Element" select="position()" />
									<xsl:for-each select="*">
										<tr>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:choose>
															<xsl:when test="local-name()='OldOrdinate'">
																<xsl:text>Существующая</xsl:text>
															</xsl:when>
															<xsl:otherwise>
																Новая
															</xsl:otherwise>
														</xsl:choose>
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val">
														<xsl:if test="@Point_Pref!=''">
															<xsl:value-of select="@Point_Pref" />
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:value-of select="@Num_Geopoint" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@X" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@Y" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="15" />
													<xsl:with-param name="val" select="@Delta_Geopoint" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:call-template name="DictBox">
													<xsl:with-param name="dic">
														<xsl:call-template name="dGeopoint_Zacrep03" />
														<xsl:call-template name="dGeopoint_Zacrep" />
													</xsl:with-param>
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="@Geopoint_Zacrep" />
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="//Contours">
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Контуры многоконтурного участка:</xsl:text>
				</span>
			</td>
		</tr>
		<xsl:for-each select="*">
			<xsl:variable name="POS" select="position()" />
			<xsl:apply-templates select="EntitySpatial">

				<xsl:with-param name="pos">
					<xsl:value-of select="$POS" />
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:if test="local-name()='Contour'">
				<tr>
					<td>
						<span style="font-weight:bold">

							<xsl:text>Внешний контур</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<xsl:call-template name="Table4" />
							<xsl:if test="@Number_PP!='' or @Definition!='' or @Number!=''">
								<xsl:if test="@Number!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Номер части участка</xsl:text>
											</span>
										</td>
										<td colspan="3">
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="75" />
												<xsl:with-param name="val" select="@Number" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<span>
											<xsl:text>Обозначение на плане</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="@Definition" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
				<xsl:apply-templates select="Areas" />
				<xsl:apply-templates select="Area" />
				<xsl:apply-templates select="Entity_Spatial">
					<xsl:with-param name="pos">
						<xsl:value-of select="$POS" />
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='NewContour'">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Новый внешний контур</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<xsl:call-template name="Table4" />
							<xsl:if test="@Number_PP!='' or @Definition!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Обозначение на плане</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="@Definition" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>

				<xsl:apply-templates select="Areas" />
				<xsl:apply-templates select="Area" />

				<xsl:apply-templates select="Entity_Spatial">
					<xsl:with-param name="pos">
						<xsl:value-of select="$POS" />
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='ExistContour'">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Существующий внешний контур</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<xsl:call-template name="Table4" />
							<xsl:if test="@Number_Record!='' or @Definition!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Обозначение на плане</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="@Definition" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
				<xsl:apply-templates select="Areas" />
				<xsl:apply-templates select="Entity_Spatial">
					<xsl:with-param name="pos">
						<xsl:value-of select="$POS" />
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="DeleteAllBorder">
			<!-- Не самая рациональная реализация, но работает корректно -->
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Исключаемая граница</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="@Number_Record!='' or @Definition!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Обозначение на плане</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@Definition" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
			<xsl:apply-templates select="Areas" />
			<tr>
				<td>
					<table style="width:100%">

						<tr>
							<td>
								<span>
									<xsl:text>Точка # (контур)</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>Префикс.Номер</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>Координата X</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>Координата Y</xsl:text>
								</span>
							</td>
							<td>
								<span>
									<xsl:text>Погрешность</xsl:text>
								</span>
							</td>


						</tr>

						<xsl:call-template name="Table4" />
						<xsl:for-each select="OldOrdinate">
							<tr>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="15" />
										<xsl:with-param name="val">
											<xsl:text>"</xsl:text>
											<xsl:value-of select="../@Type_Unit" />
											<xsl:if test="../@Su_Nmb!='' and ../@Type_Unit!='Точка'">
												<xsl:text> </xsl:text>
												<xsl:value-of select="../@Su_Nmb" />
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:value-of select="@Ord_Nmb" />
											<xsl:text>" (</xsl:text>
											<!--xsl:value-of select="$Spatial_Element"/ -->
											<xsl:text>)</xsl:text>
										</xsl:with-param>
									</xsl:call-template>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="15" />
										<xsl:with-param name="val">
											<xsl:if test="@Point_Pref!=''">
												<xsl:value-of select="@Point_Pref" />
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:value-of select="@Num_Geopoint" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="15" />
										<xsl:with-param name="val" select="@X" />
									</xsl:call-template>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="15" />
										<xsl:with-param name="val" select="@Y" />
									</xsl:call-template>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="15" />
										<xsl:with-param name="val" select="@Delta_Geopoint" />
									</xsl:call-template>
								</td>
								<xsl:choose>
									<xsl:when
										test="contains(local-name(../../../..),'Building') or contains(local-name(../../../..),'Construction')">
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="15" />
												<xsl:with-param name="val" select="@R" />
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:call-template name="DictBox">
												<xsl:with-param name="dic">
													<xsl:call-template name="dGeopoint_Zacrep03" />
													<xsl:call-template name="dGeopoint_Zacrep" />
												</xsl:with-param>
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Geopoint_Zacrep" />
											</xsl:call-template>
										</td>
									</xsl:otherwise>
								</xsl:choose>


							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>

	</xsl:template>

	<xsl:template match="//Position">
		<xsl:param name="part" />
		<xsl:param name="pos" />
		<xsl:param name="path" />
		<xsl:if test="@Number_OnPlan!=''">
			<tr>
				<td>
					<span>
						<xsl:text>Номер помещения/части ОКС на плане</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="@Number_OnPlan" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="@Description!=''">
			<tr>

				<td>
					<span>
						<xsl:text>Описание расположения</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="@Description" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="Plans">
			<tr>
				<td>
					<span>
						<xsl:text>Планы</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:for-each select="Plans/Plan">
				<tr>
					<td>
						<span>
							<xsl:text>#</xsl:text>
							<xsl:value-of select="position()" />
						</span>
					</td>
				</tr>
				<xsl:if test="@File!=''">
					<xsl:choose>
						<xsl:when test="$part='!Print!'">
							<xsl:call-template name="PictureInsert">
								<xsl:with-param name="path" select="$path" />
								<xsl:with-param name="val" select="@File" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="ImageRef">
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="type" select="$ttt" />
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="pos0" select="$ppp" />
								<xsl:with-param name="pos1" select="$ppp" />
								<xsl:with-param name="pos2" select="$ppp" />
								<xsl:with-param name="val" select="@File" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@Description!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Описание</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="@Description" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="@Scale!=''">
					<tr>
						<td>
							<span>
								<xsl:text>Масштаб</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="@Scale" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>

	</xsl:template>

	<xsl:template name="Characteristics">
		<!-- изменить -->
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>Характеристики</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<table style="width:100%">
					<xsl:call-template name="Table4" />
					<xsl:if test="Name!='' or */Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Наименование</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val">
										<xsl:value-of select="Name" />
										<xsl:value-of select="*/Name" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Feature_Building or Feature_Construction">
						<tr>
							<td>
								<span>
									<xsl:text>Тип ОНС</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val">
										<xsl:choose>
											<xsl:when test="Feature_Building">
												Здание
											</xsl:when>
											<xsl:otherwise>
												Сооружение
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Assignation_Name!='' or */Assignation_Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Назначение</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val">
										<xsl:value-of select="Assignation_Name" />
										<xsl:value-of select="*/Assignation_Name" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Assignation_Code!='' or Area!='' or */Assignation_Code!='' or */Area!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Код назначения</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val">
										<xsl:value-of select="Assignation_Code" />
										<xsl:value-of select="*/Assignation_Code" />
									</xsl:with-param>
									<xsl:with-param name="dic">
										<xsl:call-template name="dAss_b" />
										<xsl:call-template name="dAss_f" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Площадь в кв. м</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val">
										<xsl:value-of select="Area" />
										<xsl:value-of select="*/Area" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Exploitation_Char/@Year_Built!='' or Exploitation_Char/@Year_Used!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Год завершения строительства</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Exploitation_Char/@Year_Built" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Год ввода в эксплуатацию</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Exploitation_Char/@Year_Used" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Floors/@Floors!='' or Floors/@Underground_Floors!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Количество этажей</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Floors/@Floors" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>В том числе подземных</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="Floors/@Underground_Floors" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="Elements_Construct or */Elements_Construct">
						<tr>
							<td colspan="4">
								<span>
									<xsl:text>Материалы стен</xsl:text>
								</span>
							</td>
						</tr>
						<xsl:for-each select="Elements_Construct/Material/@Wall|*/Elements_Construct/Material/@Wall">
							<tr>
								<td colspan="4">
									<xsl:call-template name="DictBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="." />
										<xsl:with-param name="dic">
											<xsl:call-template name="dWall" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:if
						test="Key_Parameter/@Type!='' or Key_Parameter/@Value!='' or */Key_Parameter/@Type!='' or */Key_Parameter/@Value!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Вид параметра</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="DictBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val">
										<xsl:value-of select="Key_Parameter/@Type" />
										<xsl:value-of select="*/Key_Parameter/@Type" />
									</xsl:with-param>
									<xsl:with-param name="dic">
										<xsl:call-template name="dType_Parameter" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Величина в метрах(куб.м)</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val">
										<xsl:value-of select="Key_Parameter/@Value" />
										<xsl:value-of select="*/Key_Parameter/@Value" />
									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="TypeOTI!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Вид объекта учета</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val">
										<xsl:choose>
											<xsl:when test="TypeOTI='002002001000'">
												<xsl:text>002002001000 - Здание</xsl:text>
											</xsl:when>
											<xsl:when test="TypeOTI='002002004000'">
												<xsl:text>002002004000 - Сооружение</xsl:text>
											</xsl:when>
											<xsl:when test="TypeOTI='002002005000'">
												<xsl:text>002002005000 - Незавершенное строительство</xsl:text>
											</xsl:when>
											<xsl:when test="TypeOTI='002002002000'">
												<xsl:text>002002002000 - Помещение</xsl:text>
											</xsl:when>
										</xsl:choose>

									</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
		<xsl:if test="Levels or Position">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Расположение в пределах здания</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:if test="Position">
				<tr>
					<td>
						<table>
							<xsl:call-template name="Table4" />
							<xsl:apply-templates select="Position">
								<xsl:with-param name="pos" select="$pos" />
								<xsl:with-param name="part" select="$part" />
								<xsl:with-param name="path" select="$path" />
							</xsl:apply-templates>

						</table>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Levels">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Уровни</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<xsl:call-template name="Table4" />
							<xsl:for-each select="Levels/Level">
								<tr>
									<td>
										<span style="font-weight:bold">
											<xsl:text>Уровень #</xsl:text>
											<xsl:value-of select="position()" />
										</span>
									</td>
								</tr>


								<xsl:if test="@Number!='' or @Type!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Номер этажа</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Number" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Тип</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="DictBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Type" />
												<xsl:with-param name="dic">
													<xsl:call-template name="dType_Storey" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>

								<xsl:apply-templates select="Position">
									<xsl:with-param name="pos" select="$pos" />
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="path" select="$path" />
								</xsl:apply-templates>

							</xsl:for-each>
						</table>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template name="StatementGKN_eDocument">
		<!--<xsl:for-each select="//StatementGKN"> -->
		<p />
		<table align="center">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<tr>
				<td align="center">
					<a href="#" onclick="DoXslt(&quot;Main&quot;,0)">
						<span>
							<xsl:text>Главная</xsl:text>
						</span>
					</a>
				</td>
			</tr>
		</table>
		<tr>
			<p align="center">
				<span style="font-weight:bold">
					<xsl:text>СВЕДЕНИЯ О ПРОГРАММЕ!</xsl:text>
				</span>
			</p>
			<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
				<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
				<tr>
					<td align="center">
						<table style="width:100%">
							<tr>
								<td style="WIDTH: 50%" />
								<td style="WIDTH: 50%" />
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Наименование программы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="StatementGKN/NameSoftware" />
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Версия программы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="StatementGKN/VersionSoftware" />
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Глобальный уникальный идентификатор пакета</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="@GUID" />
									</xsl:call-template>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</tr>
		<!-- </xsl:for-each> -->
	</xsl:template>

	<xsl:template name="eDocument">
		<xsl:for-each select="//eDocument">
			<p />
			<table align="center">
				<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
				<tr>
					<td align="center">
						<a href="#" onclick="DoXslt(&quot;Main&quot;,0)">
							<span>
								<xsl:text>Главная</xsl:text>
							</span>
						</a>
					</td>
				</tr>
			</table>
			<p align="center">
				<span style="font-weight:bold">
					<xsl:text>СВЕДЕНИЯ О ДОКУМЕНТЕ</xsl:text>
				</span>
			</p>
			<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
				<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
				<tr>
					<td align="center">
						<table style="width:100%">
							<tr>
								<td style="WIDTH: 50%" />
								<td style="WIDTH: 50%" />
							</tr>
							<tr>
								<td>
									<span>
										<xsl:text>Код обрабатывающей программы</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="concat(@CodeType,../@CodeType)" />
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<tr>
						<td>
							<span style="font-weight:bold">
								<xsl:text>Отправитель</xsl:text>
							</span>
						</td>
					</tr>
					<td align="center">
						<table style="width:100%">
							<tr>
								<td style="WIDTH: 50%" />
								<td style="WIDTH: 50%" />
							</tr>
							<xsl:if test="Sender/@Kod!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Код организации отправителя</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Kod" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@Name!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Наименование отправителя</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@Date_Upload!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Дата выгрузки информации</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="DateBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Date_Upload" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@Number!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Номер исходящего документа</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Number" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@FIO!=''">
								<tr>
									<td>
										<span>
											<xsl:text>ФИО представителя отправляющей стороны</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@FIO" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@Appointment!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Должность представителя отправляющей стороны</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Appointment" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@E_Mail!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Электронный адрес представителя отправляющей стороны</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@E_Mail" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Sender/@Telephone!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Телефон представителя отправляющей стороны</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Sender/@Telephone" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Получатель</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						<table style="width:100%">
							<tr>
								<td style="WIDTH: 50%" />
								<td style="WIDTH: 50%" />
							</tr>
							<xsl:if test="Recipient/@Kod!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Код органа получателя</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Recipient/@Kod" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="Recipient/@Name!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Наименование получателя</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="Recipient/@Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</td>
				</tr>
			</table>
		</xsl:for-each>

	</xsl:template>

	<xsl:template name="Main_eDocument">
		<p />
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<tr>
				<td align="center">
					<!--xsl:if test="Sender or Recipient"> <a href="#"> <xsl:attribute name="onclick"> <xsl:text>DoXslt("eDocument",0);</xsl:text> 
						</xsl:attribute> <span style="font-weight:bold"> <xsl:text>Сведения о документе</xsl:text> </span> </a> </xsl:if -->
					<!--xsl:if test="not(Sender) and not(Recipient)" -->
					<span style="font-weight:bold">
						<xsl:text>Сведения о документе</xsl:text>
					</span>
					<!--/xsl:if -->
				</td>
			</tr>
			<tr>
				<td align="center">
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<!--tr> <td> <span> <xsl:text>Код организации отправителя</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> 
							<xsl:with-param name="siz" select="25"/> <xsl:with-param name="val" select="Sender/@Kod"/> </xsl:call-template> </td> <td> 
							<span> <xsl:text>Код органа получателя</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" 
							select="25"/> <xsl:with-param name="val" select="Recipient/@Kod"/> </xsl:call-template> </td> </tr -->
						<!--xsl:if test="@CodeType!='' or ../@CodeType!=''"> <tr> <td colspan="2"> <span> <xsl:text>Код обрабатывающей программы</xsl:text> 
							</span> </td> <td colspan="2"> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="50"/> <xsl:with-param 
							name="val" select="concat(@CodeType,../@CodeType)"/> </xsl:call-template> </td> </tr> </xsl:if -->
						<xsl:if test="Sender/@Name!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование отправителя</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Sender/@Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Recipient/@Name!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Наименование получателя</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="Recipient/@Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="@Version!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Версия xml-схемы</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="@Version" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Subjects" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents"
		xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons"
		xmlns:addr="http://rosreestr.ru/services/v0.1/commons/Address"
		xmlns:obj="http://rosreestr.ru/services/v0.1/commons/TObject"
		xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects">
		<xsl:param name="pos" />
		<xsl:if test="subj:surname or subj:firstname">
			<tr>
				<td>
					<span>
						<xsl:text>Фамилия</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:surname" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Имя</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:firstname" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="subj:patronymic">
			<tr>
				<td>
					<span>
						<xsl:text>Отчество</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:patronymic" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:name|subj:Name">
			<tr>
				<td>
					<span>
						<xsl:text>Полное наименование</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:name|subj:Name" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:kpp">
			<tr>
				<td>
					<span>
						<xsl:text>Код причины постановки на учет</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:kpp" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:nativeForeignParams">
			<xsl:variable name="nativeForeignParam">
				<xsl:choose>
					<xsl:when test="*/subj:nativeOrgParams">
						<xsl:text>Юридическое лицо</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Иностранная организация</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<td colspan="3">
					<span style="font-weight:bold">
						<xsl:value-of select="$nativeForeignParam" />
					</span>
				</td>
			</tr>
		</xsl:if>
		<xsl:if
			test="subj:nativeForeignParams/subj:nativeOrgParams/subj:ogrn or subj:nativeForeignParams/subj:nativeOrgParams/subj:inn">
			<tr>
				<td>
					<span>
						<xsl:text>ОГРН</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:nativeOrgParams/subj:ogrn" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>ИНН</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:nativeOrgParams/subj:inn" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:nativeForeignParams/subj:nativeOrgParams/subj:regDate">
			<tr>
				<td>
					<span>
						<xsl:text>Дата регистрации</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:nativeOrgParams/subj:regDate" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:nativeForeignParams/subj:foreignOrgParams/subj:countryCode">
			<tr>
				<td>
					<span>
						<xsl:text>Страна регистрации</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="DCountry" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:foreignOrgParams/subj:countryCode" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if
			test="subj:nativeForeignParams/subj:foreignOrgParams/subj:regDate or subj:nativeForeignParams/subj:foreignOrgParams/subj:regNumber">
			<tr>
				<td>
					<span>
						<xsl:text>Дата регистрации</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:foreignOrgParams/subj:regDate" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Номер регистрации</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:foreignOrgParams/subj:regNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if
			test="subj:nativeForeignParams/subj:foreignOrgParams/subj:reOrg or subj:nativeForeignParams/subj:foreignOrgParams/subj:kio">
			<tr>
				<td>
					<span>
						<xsl:text>Организация</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:foreignOrgParams/subj:reOrg" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Код организации</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:nativeForeignParams/subj:foreignOrgParams/subj:kio" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:regDocument">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Документ, подтверждающий регистрацию юридического лица</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:call-template name="Documents_Statement" />
		</xsl:if>
		<xsl:if test="subj:birthDate or subj:birthPlace">
			<tr>
				<td>
					<span>
						<xsl:text>Дата рождения</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:birthDate" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Место рождения</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:birthPlace" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:gender">
			<tr>
				<td>
					<span>
						<xsl:text>Пол</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:gender" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:inn or subj:snils">
			<tr>
				<td>
					<span>
						<xsl:text>ИНН</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:inn" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>СНИЛС</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:snils" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:call-template name="ContactInfo" />
		<xsl:if test="subj:idDocumentRef">
			<tr>
				<td>
					<span>
						<xsl:text>Идентификатор документа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:idDocumentRef/@documentID" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:address">
			<xsl:for-each select="subj:address">
				<tr>
					<td colspan="4">
						<span style="font-weight:bold">
							<xsl:text>Адрес места жительства или пребывания</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<xsl:call-template name="AddressStatement01">
							<xsl:with-param name="vis" select="'unvis'" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="subj:citizenship/subj:country">
			<tr>
				<td>
					<span>
						<xsl:text>Гражданство</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="DCountry" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:citizenship/subj:country" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:citizenship/subj:withoutCitizenship">
			<tr>
				<td>
					<span>
						<xsl:text>Лицо без гражданства</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:citizenship/subj:withoutCitizenship" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:previousData">
			<tr>
				<td colspan="3">
					<span style="font-weight:bold">
						<xsl:text>Предыдущие данные гражданина</xsl:text>
					</span>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="subj:previousData">
			<xsl:if test="subj:FIO/subj:surname or subj:FIO/subj:firstname">
				<tr>
					<td>
						<span>
							<xsl:text>Фамилия</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="subj:FIO/subj:surname" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Имя</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="subj:FIO/subj:firstname" />
						</xsl:call-template>
					</td>
				</tr>
				<xsl:if test="subj:FIO/subj:patronymic">
					<tr>
						<td colspan="3">
							<span>
								<xsl:text>Отчество</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="subj:FIO/subj:patronymic" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:if>

			<xsl:variable name="TypeDoc">
				<xsl:choose>
					<xsl:when test="subj:document">
						<xsl:text>Прочий документ</xsl:text>
					</xsl:when>
					<xsl:when test="subj:otherDocument">
						<xsl:text />
					</xsl:when>
					<xsl:when test="subj:paymentDocument">
						<xsl:text>Платежный документ</xsl:text>
					</xsl:when>
					<xsl:when test="subj:idDocument">
						<xsl:text>Документ, удостоверяющий личность</xsl:text>
					</xsl:when>
					<xsl:when test="subj:powerOfAttorney">
						<xsl:text>Доверенность</xsl:text>
					</xsl:when>
					<xsl:when test="subj:mapPlanDocument">
						<xsl:text>Тех. план/межевой план/акт обследования/карта-план</xsl:text>
					</xsl:when>
					<xsl:when test="subj:interdepDocument">
						<xsl:text>Документ сведений по МИВ</xsl:text>
					</xsl:when>
					<xsl:when test="subj:legalAct">
						<xsl:text>Правоустанавливающий документ</xsl:text>
					</xsl:when>
					<xsl:when test="subj:confirmPrivilege">
						<xsl:text>Документ, подтверждающий льготу</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>

			<tr>
				<td colspan="3">
					<span>
						<xsl:value-of select="$TypeDoc" />
					</span>
				</td>
			</tr>
			<xsl:for-each
				select="subj:document | subj:otherDocument | subj:paymentDocument | subj:idDocument | subj:powerOfAttorney | subj:mapPlanDocument | subj:interdepDocument | subj:legalAct | subj:confirmPrivilege">
				<tr>
					<td>
						<span>
							<xsl:text># </xsl:text>
							<xsl:value-of select="position()" />
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<xsl:text>Идентификатор документа</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="@_id" />
						</xsl:call-template>
					</td>
				</tr>
				<xsl:call-template name="Documents_Statement" />

			</xsl:for-each>
			<xsl:for-each select="subj:address">
				<tr>
					<td colspan="4">
						<span style="font-weight:bold">
							<xsl:text>Адрес места жительства или пребывания</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<xsl:call-template name="AddressStatement01">
							<xsl:with-param name="vis" select="'unvis'" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:if test="subj:subjectCode">
			<tr>
				<td>
					<span>
						<xsl:text>Код субъекта РФ</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="dRegionsRF" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="subj:subjectCode" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="ContactInfo" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects">
		<xsl:if test="subj:contactInfo">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Контактные данные</xsl:text>
					</span>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:contactInfo/subj:phoneNumber or subj:contactInfo/subj:email">
			<tr>
				<td>
					<span>
						<xsl:text>Номер телефона</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:contactInfo/subj:phoneNumber" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Адрес электронной почты</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="subj:contactInfo/subj:email" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="subj:contactInfo/subj:address">
			<xsl:for-each select="subj:contactInfo/subj:address">
				<tr>
					<td colspan="4">
						<span style="font-weight:bold">
							<xsl:text>Почтовый адрес</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<xsl:call-template name="AddressStatement01">
							<xsl:with-param name="vis" select="'unvis'" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>


	<xsl:template name="Main_Coord_System_KPT">
		<p />
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<tr>
				<td>
					<p align="center">
						<span style="font-weight:bold">
							<xsl:text>СИСТЕМА КООРДИНАТ</xsl:text>
						</span>
					</p>
				</td>
			</tr>

			<tr>
				<td>
					<table style="width:100%">
						<xsl:call-template name="Table4" />
						<xsl:if test="@Name!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Наименование системы координат</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="@Name" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="@Cs_Id!=''">
							<tr>
								<td colspan="2">
									<span>
										<xsl:text>Идентификатор системы координат</xsl:text>
									</span>
								</td>
								<td colspan="2">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="50" />
										<xsl:with-param name="val" select="@Cs_Id" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="@Description!=''">
							<tr>
								<td colspan="4">
									<span>
										<xsl:text>Формальное описание системы координат (WKT, определено OpenGIS)</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="100" />
										<xsl:with-param name="val" select="@Description" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>

						<xsl:for-each select="Dim">
							<xsl:if test="@Name!='' or @Tolerance!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Наименование измерения</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Name" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Точность измерения</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Tolerance" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="@Lowerbound!='' or @Upperbound!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Нижняя граница знач.изм.</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Lowerbound" />
										</xsl:call-template>
									</td>
									<td>
										<span>
											<xsl:text>Верхняя граница знач.изм.</xsl:text>
										</span>
									</td>
									<td>
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="25" />
											<xsl:with-param name="val" select="@Upperbound" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="ObjectsStatement01" xmlns:obj="http://rosreestr.ru/services/v0.1/commons/TObject">

		<xsl:if test="obj:objectTypeCode != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Объект недвижимости (ОН)</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="DObjectType" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:objectTypeCode" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:customTypeDesc != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Описание типа объекта "иное"</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:customTypeDesc" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:cadastralNumber/obj:cadastralNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Кадастровый номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:cadastralNumber/obj:cadastralNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:cadastralNumber/obj:oldCadastralNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Ранее присвоенный кадастровый номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:cadastralNumber/obj:oldCadastralNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:cadastralNumber/obj:conditionalNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Условный или инвентарный номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:cadastralNumber/obj:conditionalNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:address">
			<xsl:for-each select="obj:address">
				<tr>
					<td colspan="4">
						<span style="font-weight:bold">
							<xsl:text>Адрес объекта недвижимости</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<span>
							<xsl:text># </xsl:text>
							<xsl:value-of select="position()" />
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<xsl:call-template name="AddressStatement01">
							<xsl:with-param name="vis" select="'unvis'" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="obj:physicalProperties/*">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Физические свойства</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<span>
						<xsl:text># </xsl:text>
						<xsl:value-of select="position()" />
					</span>
				</td>
			</tr>
			<xsl:variable name="typeProp">
				<xsl:value-of select="@type" />
			</xsl:variable>
			<xsl:variable name="typePropText">
				<xsl:choose>
					<xsl:when test="$typeProp = 'area'">
						<xsl:text>Площадь</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'builtupArea'">
						<xsl:text>Площадь застройки</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'length'">
						<xsl:text>Длина</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'height'">
						<xsl:text>Высота</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'depth'">
						<xsl:text>Глубина</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'occurenceDepth'">
						<xsl:text>Глубина залегания</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'volume'">
						<xsl:text>Объем</xsl:text>
					</xsl:when>
					<xsl:when test="$typeProp = 'cost'">
						<xsl:text>Стоимость</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$typeProp != ''">
				<tr>
					<td>
						<span>
							<xsl:text>Тип</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="$typePropText" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="obj:unitType">
				<tr>
					<td>
						<span>
							<xsl:text>Единица измерения</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="DictBox">
							<xsl:with-param name="dic">
								<xsl:call-template name="DUnitType" />
							</xsl:with-param>
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="obj:unitType" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="obj:value">
				<tr>
					<td>
						<span>
							<xsl:text>Значение</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="obj:value" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</xsl:for-each>

		<xsl:if test="obj:notes/obj:noteGroup">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Доп. информация</xsl:text>
					</span>
				</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="obj:notes/obj:noteGroup/*">
			<xsl:variable name="pos" select="position()" />
			<xsl:variable name="noteType">
				<xsl:value-of select="@noteType" />
			</xsl:variable>
			<xsl:variable name="typeStr">
				<xsl:choose>
					<xsl:when test="$noteType = 'pif'">
						<xsl:text>Недвижимое имущество, составляющее паевой инвестиционный фонд (приобретаемое для включения в состав паевого инвестиционного фонда)</xsl:text>
					</xsl:when>
					<xsl:when test="$noteType = 'mortgage'">
						<xsl:text>Государственная регистрация смены залогодержателя вследствие уступки прав по основному обязательству, обеспеченному ипотекой, либо по договору об ипотеке, в том числе сделки по уступке прав требования, включая внесение в Единый государственный реестр прав на недвижимое имущество и сделок с ним записи об ипотеке, осуществляемой при смене залогодержателя</xsl:text>
					</xsl:when>
					<xsl:when test="$noteType = 'mortgageOwner'">
						<xsl:text>Государственная регистрация смены владельца закладной, в том числе сделки по уступке прав требования, включая внесение в Единый государственный реестр прав на недвижимое имущество и сделок с ним записи об ипотеке, осуществляемой при смене владельца закладной</xsl:text>
					</xsl:when>
					<xsl:when test="$noteType = 'note'">
						<xsl:text>Дополнительная информация об ОН</xsl:text>
					</xsl:when>
					<xsl:when test="$noteType = 'usagePurpose'">
						<xsl:text>Назначения объекта недвижимости и виды разрешенного иcпjльзования</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>

			<xsl:if test="$noteType != ''">
				<tr>
					<td>
						<span>
							<xsl:text># </xsl:text>
							<xsl:value-of select="$pos" />
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<xsl:text>Тип доп. сведений об объекте недвижимости</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="$typeStr" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="obj:propertNote">
				<tr>
					<td>
						<span>
							<xsl:text>Информация о назначении здания/помещения, о виде жилого помещения и виде разрешенного строительства</xsl:text>
						</span>
					</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="obj:propertNote">
				<xsl:if test="obj:objectPurpose != ''">
					<tr>
						<td>
							<span>
								<xsl:text>Назначение зданий</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="dAss_b" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="obj:objectPurpose" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="obj:roomPurpose != ''">
					<tr>
						<td>
							<span>
								<xsl:text>Назначение помещений</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="dAss_f" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="obj:roomPurpose" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="obj:housingPurpose != ''">
					<tr>
						<td>
							<span>
								<xsl:text>Вид жилого помещения</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="dAss_f" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="obj:housingPurpose" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="obj:usageType != ''">
					<tr>
						<td>
							<span>
								<xsl:text>Вид разрешенного использования</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="DictBox">
								<xsl:with-param name="dic">
									<xsl:call-template name="DUsageType" />
								</xsl:with-param>
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="obj:usageType" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="obj:mark != ''">
				<tr>
					<td>
						<span>
							<xsl:text>Информация о смене залогодержателя / владельца закладной, о ПИФ</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="obj:mark" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="obj:note != ''">
				<tr>
					<td>
						<span>
							<xsl:text>Доп. инфо об ОН</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="obj:note" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="obj:number">
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>Кадастровый квартал</xsl:text>
					</span>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:number/obj:cadastralNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Кадастровый номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:number/obj:cadastralNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:number/obj:oldCadastralNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Ранее присвоенный кадастровый номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:number/obj:oldCadastralNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:number/obj:conditionalNumber != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Условный или инвентарный номер</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:number/obj:conditionalNumber" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="obj:Orient != ''">
			<tr>
				<td>
					<span>
						<xsl:text>Ориентиры</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="obj:Orient" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Main_Coord_Systems">
		<p />
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<tr>
				<td>
					<p align="center">
						<span style="font-weight:bold">
							<xsl:text>СИСТЕМА КООРДИНАТ</xsl:text>
						</span>
					</p>
				</td>
			</tr>
			<xsl:for-each select="Coord_System">
				<tr>
					<td>
						<table style="width:100%">
							<xsl:call-template name="Table4" />
							<xsl:if test="@Name!=''">
								<tr>
									<td colspan="2">
										<span>
											<xsl:text>Наименование системы координат</xsl:text>
										</span>
									</td>
									<td colspan="2">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="@Name" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="@Cs_Id!=''">
								<tr>
									<td colspan="2">
										<span>
											<xsl:text>Идентификатор системы координат</xsl:text>
										</span>
									</td>
									<td colspan="2">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="50" />
											<xsl:with-param name="val" select="@Cs_Id" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="@Description!=''">
								<tr>
									<td colspan="4">
										<span>
											<xsl:text>Формальное описание системы координат (WKT, определено OpenGIS)</xsl:text>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="100" />
											<xsl:with-param name="val" select="@Description" />
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>

							<xsl:for-each select="Dim">
								<xsl:if test="@Name!='' or @Tolerance!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Наименование измерения</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Name" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Точность измерения</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Tolerance" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="@Lowerbound!='' or @Upperbound!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Нижняя граница знач.изм.</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Lowerbound" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Верхняя граница знач.изм.</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="@Upperbound" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template name="Documents_Statement" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents"
		xmlns:commons="http://rosreestr.ru/services/v0.1/commons/Commons">
		<xsl:for-each select="docs:documentTypes">
			<xsl:variable name="docType">
				<xsl:choose>
					<xsl:when test="docs:representativeDocTypeCode">
						<xsl:text>Тип документа представителя</xsl:text>
					</xsl:when>
					<xsl:when test="docs:documentTypeCode">
						<xsl:text>Тип документа</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<td>
					<span>
						<xsl:value-of select="$docType" />
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="DictBox">
						<xsl:with-param name="dic">
							<xsl:call-template name="DDocument" />
						</xsl:with-param>
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="node()" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="docs:number or docs:issueDate">
			<tr>
				<td>
					<span>
						<xsl:text>Номер документа</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:number" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Дата выдачи</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:issueDate" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="docs:name">
			<tr>
				<td>
					<span>
						<xsl:text>Наименование документа</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="docs:name" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="docs:attachment">
			<xsl:for-each select="docs:attachment">

				<xsl:if test="docs:desc != ''">
					<tr>
						<td>
							<span>
								<xsl:text>Описание прилагаемого файла</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:call-template name="TextBox">
								<xsl:with-param name="siz" select="75" />
								<xsl:with-param name="val" select="docs:desc" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:for-each select="docs:fileDesc">
					<xsl:for-each select="docs:file">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Атрибуты файла прикладываемого документа</xsl:text>
								</span>
							</td>
						</tr>
						<xsl:call-template name="FileSign" />
					</xsl:for-each>
					<xsl:for-each select="docs:signature">
						<tr>
							<td colspan="3">
								<span>
									<xsl:text>Атрибуты файла электронной подписи прикладываемого документа</xsl:text>
								</span>
							</td>
						</tr>
						<xsl:call-template name="FileSign" />
					</xsl:for-each>
				</xsl:for-each>

				<xsl:for-each select="docs:receivedInPaper">
					<xsl:variable name="IsCopy">
						<xsl:choose>
							<xsl:when test="docs:original">
								<xsl:text>Оригинал</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								Копия
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:if test="*/docs:pageCount or */docs:docCount">
						<tr>
							<td>
								<span>
									<xsl:value-of select="$IsCopy" />
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Количество листов</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="*/docs:pageCount" />
								</xsl:call-template>
							</td>
							<td>
								<span>
									<xsl:text>Количество экземпляров</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="25" />
									<xsl:with-param name="val" select="*/docs:docCount" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="docs:notes">
			<tr>
				<td>
					<span>
						<xsl:text>Особые отметки</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:if test="docs:notes/commons:code or docs:notes/commons:text">
				<tr>
					<td>
						<span>
							<xsl:text>Тэги дополнительных сведений (без справочного значения)</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="docs:notes/commons:code" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Доп. сведения</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="docs:notes/commons:text" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>
		<xsl:if test="docs:series">
			<tr>
				<td>
					<span>
						<xsl:text>Серия</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="docs:series" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="docs:issuer">
			<tr>
				<td>
					<span>
						<xsl:text>Организация, выдавшая документ</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="docs:issuer" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="docs:durationStart or docs:durationStop">
			<tr>
				<td>
					<span>
						<xsl:text>Срок действия С</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:durationStart" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Срок действия ПО</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:durationStop" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="docs:notaryInfo">
			<tr>
				<td>
					<span>
						<xsl:text>Реквизиты о нотариальном заверении документа</xsl:text>
					</span>
				</td>
			</tr>
			<xsl:if test="docs:notaryInfo/docs:notaryFullName">
				<tr>
					<td>
						<span>
							<xsl:text>ФИО нотариуса, который заверил документ</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="75" />
							<xsl:with-param name="val" select="docs:notaryInfo/docs:notaryFullName" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="docs:notaryInfo/docs:registryNumber or docs:notaryInfo/docs:dateOfCertification">
				<tr>
					<td>
						<span>
							<xsl:text>Номер регистрации</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="docs:notaryInfo/docs:registryNumber" />
						</xsl:call-template>
					</td>
					<td>
						<span>
							<xsl:text>Дата заверения нотариусом</xsl:text>
						</span>
					</td>
					<td>
						<xsl:call-template name="TextBox">
							<xsl:with-param name="siz" select="25" />
							<xsl:with-param name="val" select="docs:notaryInfo/docs:dateOfCertification" />
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>

		</xsl:if>
		<xsl:if test="docs:officialPublicationSource">
			<tr>
				<td>
					<span>
						<xsl:text>Источник официальной публикации</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="docs:officialPublicationSource" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>

	</xsl:template>
	<xsl:template name="FileSign" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents">
		<xsl:if test="docs:fileURI">
			<tr>
				<td>
					<span>
						<xsl:text>URI</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="75" />
						<xsl:with-param name="val" select="docs:fileURI" />
					</xsl:call-template>
				</td>
				<!--td> <span> <xsl:text>MD5 сумма</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" 
					select="25"/> <xsl:with-param name="val" select="docs:md5sum"/> </xsl:call-template> </td -->
			</tr>
		</xsl:if>
		<xsl:if test="docs:fileSize or docs:fileCreationDate">
			<tr>
				<td>
					<span>
						<xsl:text>Размер в Кбайт</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:fileSize" />
					</xsl:call-template>
				</td>
				<td>
					<span>
						<xsl:text>Дата создания</xsl:text>
					</span>
				</td>
				<td>
					<xsl:call-template name="TextBox">
						<xsl:with-param name="siz" select="25" />
						<xsl:with-param name="val" select="docs:fileCreationDate" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>