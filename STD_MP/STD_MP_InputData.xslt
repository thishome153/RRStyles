<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="common.xslt" />
	<xsl:import href="STD_MP_Tables.xslt" />

	<!-- ********************************** Исходные данные ******************************************************** -->
	<xsl:template name="InputData">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<!-- <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> 
			<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute> -->

		<xsl:if test="count(//InputData/*)>0">
			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>Исходные  данные</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>1. Перечень документов,  использованных при подготовке межевого плана     </xsl:text>
					</span>

					<table style="WIDTH: 100%" border="1" cellspacing="0"
						padding="5" cellpadding="1">
						<xsl:attribute name="width"> <xsl:value-of
							select="$TableWidth" />   </xsl:attribute>
						<xsl:if test="//InputData/Documents">
							<xsl:call-template name="Table3_header">
								<xsl:with-param name="Column2Text"
									select='"Наименование документа"' />
								<xsl:with-param name="Column3Text"
									select='"Реквизиты документа"' />
							</xsl:call-template>




							<xsl:for-each
								select="//InputData/Documents/Document">

								<xsl:call-template name="Table5_Item">
									<xsl:with-param name="docname" select="Name" />
									<xsl:with-param name="docdate" select="Date" />
									<xsl:with-param name="docnum" select="Number" />
								</xsl:call-template>
								<xsl:if
									test="Kind!='' or Scale!='' or Form!='' or Date_Create!='' or Date_Update!=''">
									<tr>
										<td colspan="4">
											<span>Картографическое произведение</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Kind!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Наименование</xsl:text>
											</span>
										</td>
										<td colspan="3">
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="75" />
												<xsl:with-param name="val" select="Kind" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Scale!='' or Form!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Форма</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Form" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Масштаб</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Scale" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="Date_Create!='' or Date_Update!=''">
									<tr>
										<td>
											<span>
												<xsl:text>Дата создания</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="DateBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val"
													select="Date_Create" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Дата последнего обновления</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="DateBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val"
													select="Date_Update" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</table>
				</td>
			</tr>


			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>2. Сведения о геодезической основе, использованной при подготовке межевого плана     </xsl:text>
						<xsl:if test="//CoordSystems">
							<br>
							</br>
							<span style="font-weight:bold">
								<xsl:text> Система координат </xsl:text>
								<xsl:for-each select="//CoordSystems/CoordSystem">
									<xsl:value-of select="@Name" />
								</xsl:for-each>
							</span>
						</xsl:if>
					</span>


					<table style="WIDTH: 100%" border="1" cellspacing="0"
						padding="5" cellpadding="1">
						<xsl:attribute name="width"> <xsl:value-of
							select="$TableWidth" />   </xsl:attribute>

						<xsl:call-template name="Table8_header" />

						<xsl:if test="//InputData/GeodesicBases">
							<xsl:for-each
								select="//InputData/GeodesicBases/GeodesicBase">

								<tr>
									<td align="center">
										<xsl:value-of select="position()" />
									</td>

									<td align="center">
										<xsl:if test="PName!=''">
											<xsl:value-of select="PName" />
											<xsl:text> </xsl:text>
											<xsl:value-of select="PKind" />
										</xsl:if>
									</td>
									<td align="center">
										<xsl:if test="PKlass!=''">
											<xsl:value-of select="PKlass" />
										</xsl:if>
									</td>

									<td align="center">
										<xsl:if test="OrdX!=''">
											<xsl:value-of select="OrdX" />
										</xsl:if>
									</td>
									<td align="center">
										<xsl:if test="OrdY!=''">
											<xsl:value-of select="OrdY" />
										</xsl:if>
									</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</tr>
								<!-- <xsl:if test="PKind!=''"> <tr> <td> <span> <xsl:text>Тип</xsl:text> 
									</span> </td> <td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param 
									name="siz" select="75" /> <xsl:with-param name="val" select="PKind" /> </xsl:call-template> 
									</td> </tr> </xsl:if> <xsl:if test="PKlass!=''"> <tr> <td> <span> <xsl:text>Класс</xsl:text> 
									</span> </td> <td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param 
									name="siz" select="75" /> <xsl:with-param name="val" select="PKlass" /> </xsl:call-template> 
									</td> </tr> </xsl:if> <xsl:if test="OrdX!='' or OrdY!=''"> <tr> <td> <span> 
									<xsl:text>Координата X</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> 
									<xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="OrdX" 
									/> </xsl:call-template> </td> <td> <span> <xsl:text>Координата Y</xsl:text> 
									</span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" 
									select="25" /> <xsl:with-param name="val" select="OrdY" /> </xsl:call-template> 
									</td> </tr> </xsl:if> -->
							</xsl:for-each>
						</xsl:if>

					</table>


				</td>
			</tr>
		</xsl:if>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>3. Сведения о средствах измерений     </xsl:text>
				</span>
				<table style="WIDTH: 100%" border="1" cellspacing="0"
					padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of
						select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table41_header">
						<xsl:with-param name="Column2Text"
							select='"Наименование прибора (инструмента, аппаратуры"' />
						<xsl:with-param name="Column3Text"
							select='"Сведения об утверждении типа измерений"' />
						<xsl:with-param name="Column4Text"
							select='"Реквизиты свидетельства о поверке прибора (инструмента,аппаратуры)"' />
					</xsl:call-template>

					<xsl:if test="//InputData/MeansSurvey">
						<xsl:for-each
							select="//InputData/MeansSurvey/MeanSurvey">

							<tr>
								<td>

									<xsl:value-of select="position()" />

								</td>
								<td>
									<xsl:if test="Name!=''">
										<xsl:value-of select="Name" />
									</xsl:if>
								</td>
								<td>
									<xsl:if test="Registration/Number!=''">
										<xsl:value-of select="Registration/Number" />
										<xsl:text>, </xsl:text>
										<xsl:value-of select="Registration/Duration" />
									</xsl:if>
								</td>
								<td>
									<xsl:if test="CertificateVerification!=''">
										<xsl:value-of select="CertificateVerification" />
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
				</table>
			</td>
		</tr>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>4. Сведения о наличии объектов недвижимости на исходных земельных участках </xsl:text>
				</span>
				<table style="WIDTH: 100%" border="1" cellspacing="0"
					padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of
						select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text"
							select='"Кадастровый номер земельного участка"' />
						<xsl:with-param name="Column3Text"
							select='"Кадастровые или иные номера объектов недвижимости, расположенных на земельном участке"' />
					</xsl:call-template>

					<xsl:if test="//InputData/ObjectsRealty">
						<xsl:for-each select="//InputData/ObjectsRealty">

							<tr>
								<td align="center">
									<xsl:value-of select="position()" />
								</td>

								<td align="center">
									<xsl:value-of
										select="ObjectRealty/CadastralNumberParcel" />
								</td>

								<td align="center">

									<xsl:value-of
										select="ObjectRealty/InnerCadastralNumbers">
									</xsl:value-of>

								</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="not(//InputData/ObjectsRealty)">
						<tr>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<xsl:text>-</xsl:text>
					</xsl:if>

				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>5. Сведения о частях исходных или уточняемых земельных участков </xsl:text>
				</span>
				<table style="WIDTH: 100%" border="1" cellspacing="0"
					padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of
						select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text"
							select='"Кадастровый номер земельного участка"' />
						<xsl:with-param name="Column3Text"
							select='"Учетные номера частей земельного участка"' />
					</xsl:call-template>

					<xsl:for-each
						select="//InputData/SubParcels/SubParcel">
						<tr>
							<td align="center">
								<xsl:value-of select="position()" />
							</td>

							<td align="center">
								<xsl:value-of select="CadastralNumberParcel" />
							</td>

							<td align="center">
								<xsl:value-of select="NumberRecord">
									<!-- <xsl:for-each select="CadastralNumber"> </xsl:for-each> -->
								</xsl:value-of>
							</td>
						</tr>
					</xsl:for-each>

					<xsl:if test="not(//InputData/SubParcels)">
						<tr>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
					</xsl:if>


				</table>
			</td>
		</tr>
		<!-- запчасти //Survey: <xsl:if test="//Survey"> <tr> <td colspan="4"> 
			<span style="font-weight:bold"> <xsl:text>Сведения о выполненных измерениях 
			и расчетах</xsl:text> </span> </td> </tr> <tr> <td> <table style="width:750"> 
			<xsl:call-template name="Table4" /> <xsl:for-each select="//Survey/AppliedFile"> 
			<xsl:call-template name="ImageRef"> <xsl:with-param name="part" select="$part" 
			/> <xsl:with-param name="type" select="$ttt" /> <xsl:with-param name="pos" 
			select="$pos" /> <xsl:with-param name="pos0" select="$ppp" /> <xsl:with-param 
			name="pos1" select="$ppp" /> <xsl:with-param name="pos2" select="$ppp" /> 
			<xsl:with-param name="val" select="@Name" /> </xsl:call-template> </xsl:for-each> 
			</table> </td> </tr> </xsl:if> -->
		<!-- </table> -->
	</xsl:template>


</xsl:stylesheet>