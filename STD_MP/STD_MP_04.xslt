<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:import href="STD_MP_Package.xslt" />
	<xsl:import href="STD_MP_InputData.xslt" />
	<xsl:import href="common.xslt" />



	<xsl:template match="/">
		<html>
			<head>
				<title>Межевой план 4</title>
			</head>
			<!-- Redefine variables: <xsl:variable name="TableWidth" select="250" 
				/> <xsl:variable name="ppp" select="0" /> <xsl:variable name="ttt" select="''" 
				/> <xsl:text> TableWidth = </xsl:text> <xsl:value-of select="$TableWidth" 
				/> -->

			<xsl:call-template name="Main" />
		</html>
	</xsl:template>

	<!-- Главная страница -->
	<xsl:template name="Main">

		<table align="center" cellspacing="0" cellpadding="2" border="4"
			bgcolor="#eeeeee">
			<xsl:attribute name="width">
                <xsl:value-of select="$TableWidth" />
            </xsl:attribute>


			<tr>
				<td align="center">

					<h2>

						<span style="font-weight:bold">
							<xsl:text>МЕЖЕВОЙ ПЛАН</xsl:text>
						</span>

					</h2>


					<xsl:for-each select="//Title">
						<xsl:call-template name="GeneralCadastralWorks" />
					</xsl:for-each>


					<!-- <xsl:for-each select="//eDocument"> -->
					<!-- Реализовано для 1 - 3 форм, в 4 выводит корректно -->
					<!-- <xsl:call-template name="Main_eDocument" /> -->
					<!-- </xsl:for-each> -->


					<xsl:for-each select="//Input_Data">

						<xsl:call-template name="InputData">
							<xsl:with-param name="pos" select="position()" />
						</xsl:call-template>

						<!-- main_data -->
						<!-- inherited template - temporally closed -->
						<!--Работает для 1-4 форм -->
						<!-- <xsl:call-template name="Main_Data" /> -->
					</xsl:for-each>

					<xsl:for-each select="//Survey">
						<xsl:call-template name="Survey">
						</xsl:call-template>
					</xsl:for-each>

					<xsl:for-each select="//Package">
						<xsl:call-template name="Package">
						</xsl:call-template>
					</xsl:for-each>


					<xsl:for-each select="//SpecifyParcelsApproximal">
						<!--Реализовано для 4 формы -->
						<xsl:call-template name="Main_SpecifyParcels">
							<xsl:with-param name="POS" select="position()" />
						</xsl:call-template>
					</xsl:for-each>

					<xsl:if test="//NewSubParcel">
						<!--Реализовано для 1-4 форм <xsl:for-each select="//Package"> <xsl:call-template 
							name="Main_NewSubParcel" /> </xsl:for-each> -->
					</xsl:if>

					<xsl:for-each select="//Reestr_Contractors">
						<!--Реализовано для 1-3 форм, в 4 не нужно -->
						<xsl:call-template
							name="Main_Reestr_Contractors" />
					</xsl:for-each>


					<xsl:if test="'03' >= //eDocument/@Version">
						<xsl:for-each select="//Contractor">
							<!--Работает для 1-4 форм -->
							<xsl:call-template name="Main_Contractor" />
						</xsl:for-each>
						<xsl:for-each select="//STD_MP/Coord_Systems">
							<!--Работает для 1-4 форм -->
							<xsl:call-template name="Main_Coord_Systems" />
						</xsl:for-each>
					</xsl:if>

					<!--Заключение -->
					<xsl:for-each select="//Conclusion">
						<xsl:call-template name="Conclusion" />
					</xsl:for-each>

					<!-- Графическая часть -->
					<xsl:call-template name="Schemas">
						<!-- <xsl:with-param name="pos" "select="position()""/> <xsl:with-param 
							name="path" select="/"/> <xsl:with-param name="part" select="/"/> -->
					</xsl:call-template>

					<xsl:for-each select="//Appendix">
						<xsl:call-template name="Appendix" />
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<h7>
			<p>
				Версия STD_MP
				<xsl:value-of select="//STD_MP/eDocument/@Version" />
				<br />
				Дата работ
				<xsl:value-of select="//Title/Contractor/@Date" />
				GUID:
				<xsl:value-of select="//STD_MP/eDocument/@GUID" />
				<br />
				@2018 Fixosoft Stylesheet v1.001a
				<br />
				<a href='mailto:home153@mail.ru'> Send feedback </a>
			</p>
		</h7>
	</xsl:template>




</xsl:stylesheet>
