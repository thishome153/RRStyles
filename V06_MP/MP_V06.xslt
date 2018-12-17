<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:xs="http://www.w3.org/2001/XMLSchema">


	<xsl:import href="common.xslt" />


	<!-- Вспомогательные действия -->


	<!-- 4. Сведения о кадастровом инженере: -->
	<xsl:template name="Contractor">
		<tr>
			<td>
				<!-- <xsl:choose> <xsl:when test="Cadastral_Engineer"> -->
				<span>
					<xsl:text>Фамиия, имя, отчество (при наличии) </xsl:text>
				</span>
				<xsl:value-of select="FamilyName " />
				<span>
					<xsl:text>  </xsl:text>
				</span>
				<xsl:value-of select="FirstName" />
				<span>
					<xsl:text>  </xsl:text>
				</span>
				<xsl:if test="Patronymic!=''">
					<xsl:value-of select="Patronymic" />
				</xsl:if>
			</td>
		</tr>

		<tr>
			<td>
				<span>
					<xsl:text>№ квалификационного аттестата кадастрового инженера  </xsl:text>
				</span>
				<xsl:value-of select="NCertificate" />
			</td>
		</tr>

		<tr>
			<td>
				<span>
					<xsl:text>Контактный телефон   </xsl:text>
				</span>
				<xsl:value-of select="Telephone" />
			</td>
		</tr>

		<tr>
			<td>
				<span>
					<xsl:text>Почтовый адрес и адрес электронной почты, по которым осуществляется связь с кадастровым инженером  </xsl:text>
				</span>

				<xsl:value-of select="Address" />
				<xsl:text>,  </xsl:text>
				<xsl:value-of select="Email" />
			</td>
		</tr>


		<tr>
			<td>
				<span>
					<xsl:text>Сокращенное наименование юридического лица, если кадастровый инженер является работником юридического лица </xsl:text>
				</span>
				<xsl:if test="Organization/Name!=''">
					<xsl:value-of select="Organization/Name" />
					<span>
						<xsl:text>,  </xsl:text>
					</span>
					<xsl:value-of select="Organization/AddressOrganization" />
				</xsl:if>
			</td>
		</tr>


		<!-- </xsl:when> <xsl:when test="Cadastral_Organization"> -->




		<!-- </xsl:when> <xsl:when test="FIO"> -->





		<!-- </xsl:when> </xsl:choose> -->
	</xsl:template>

	<!-- ******************** Client ***************************************** -->
	<xsl:template name="Client">

		<tr>
			<td>
				<!-- <span style="font-weight:bold"> <xsl:choose> <xsl:when test="Person"> Физическое лицо </xsl:when> <xsl:when test="Organization"> 
					Юридическое лицо </xsl:when> <xsl:when test="Governance"> Орган государственной власти </xsl:when> <xsl:otherwise> Иностранное 
					юридическое лицо </xsl:otherwise> </xsl:choose> </span> -->


				<xsl:for-each select="Person">
					<xsl:if test="FamilyName!='' or FirstName !=''">

						<xsl:value-of select="FamilyName" />
						<span>
							<xsl:text>  </xsl:text>
						</span>
						<xsl:value-of select="FirstName" />
						<span>
							<xsl:text>  </xsl:text>
						</span>
						<xsl:if test="Patronymic!='' ">
							<xsl:value-of select="Patronymic" />
						</xsl:if>


						<span>
							<xsl:text>, СНИЛС   </xsl:text>
						</span>
						<xsl:value-of select="SNILS" />

					</xsl:if>
				</xsl:for-each>

				<xsl:for-each select="Organization">
					<xsl:if test="Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Полное наименование </xsl:text>
								</span>
								<xsl:value-of select="Name" />
								<xsl:text>, ИНН </xsl:text>
								<xsl:value-of select="INN" />
								<xsl:text> ОГРН </xsl:text>
								<xsl:value-of select="OGRN" />
							</td>
						</tr>
					</xsl:if>
					<!-- <tr> <td> <span style="font-weight:bold"> <xsl:text>Агент</xsl:text> </span> </td> </tr> <xsl:for-each select="Agent"> 
						<xsl:if test="Surname!='' or First!=''"> <tr> <td> <span> <xsl:text>Фамилия</xsl:text> </span> </td> <td> <xsl:call-template 
						name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Surname" /> </xsl:call-template> 
						</td> <td> <span> <xsl:text>Имя</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" 
						select="25" /> <xsl:with-param name="val" select="First" /> </xsl:call-template> </td> </tr> </xsl:if> <xsl:if test="Patronymic!='' 
						or Appointment!=''"> <tr> <td> <span> <xsl:text>Отчество</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> 
						<xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Patronymic" /> </xsl:call-template> </td> <td> 
						<span> <xsl:text>Должность</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" 
						/> <xsl:with-param name="val" select="Appointment" /> </xsl:call-template> </td> </tr> </xsl:if> </xsl:for-each> -->
				</xsl:for-each>

				<xsl:for-each select="Governance">
					<xsl:if test="Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Полное наименование</xsl:text>
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
					<tr>
						<td>
							<span style="font-weight:bold">
								<xsl:text>Агент</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:for-each select="Agent">
						<xsl:if test="Surname!='' or First!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Фамилия</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Surname" />
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
										<xsl:with-param name="val" select="First" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Patronymic!='' or Appointment!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Отчество</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Patronymic" />
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
										<xsl:with-param name="val" select="Appointment" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Foreign_Organization">
					<xsl:if test="Name!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Полное наименование</xsl:text>
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
					<xsl:if test="Country!=''">
						<tr>
							<td>
								<span>
									<xsl:text>Страна регистрации</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<xsl:call-template name="TextBox">
									<xsl:with-param name="siz" select="75" />
									<xsl:with-param name="val" select="Country" />
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td>
							<span style="font-weight:bold">
								<xsl:text>Агент</xsl:text>
							</span>
						</td>
					</tr>
					<xsl:for-each select="Agent">
						<xsl:if test="Surname!='' or First!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Фамилия</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Surname" />
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
										<xsl:with-param name="val" select="First" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="Patronymic!='' or Appointment!=''">
							<tr>
								<td>
									<span>
										<xsl:text>Отчество</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="25" />
										<xsl:with-param name="val" select="Patronymic" />
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
										<xsl:with-param name="val" select="Appointment" />
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:if test="@Date">
					<tr>
						<td colspan="2">
							<span>
								<xsl:text>Дата приемки работ</xsl:text>
							</span>
						</td>
						<td colspan="2">
							<xsl:call-template name="DateBox">
								<xsl:with-param name="siz" select="50" />
								<xsl:with-param name="val" select="@Date" />
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>



	<xsl:template name="ClientContractor">
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<xsl:for-each select="//Client">
				<xsl:call-template name="Client" />
			</xsl:for-each>
			<xsl:for-each select="//Contractor">
				<xsl:call-template name="Contractor" />
			</xsl:for-each>
			<xsl:if test="//Conclusion!=''">
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Заключение !!! кадастрового инженера</xsl:text>
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
										<xsl:text>Заключение</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:call-template name="TextBox">
										<xsl:with-param name="siz" select="75" />
										<xsl:with-param name="val" select="//Conclusion" />
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<!-- Общие сведения -->
	<xsl:template name="GeneralCadastralWorks">
		<!-- <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> <xsl:attribute name="width"> <xsl:value-of 
			select="$TableWidth" /> </xsl:attribute> -->
		<!--<xsl:text> GeneralCadastralWorks.TableWidth </xsl:text> -->
		<!-- <xsl:value-of select="$TableWidth" /> -->
		<xsl:if test="//GeneralCadastralWorks!=''">
			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>Общие сведения о кадастровых работах</xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-weight:bold">
						<xsl:text>1. Межевой план подготовлен в результате выполнения кадастровых работ в связи:       </xsl:text>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<!-- <td colspan="6"> -->
					<xsl:value-of select="Reason" />
				</td>
			</tr>

			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>2. Цель кадастровых работ:</xsl:text>
					</span>
				</td>
			</tr>

			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>3. Сведения о заказчике кадастровых работ:</xsl:text>
					</span>
					<xsl:for-each select="//Clients/Client">
						<xsl:call-template name="Client" />
					</xsl:for-each>
				</td>
			</tr>



			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>4. Сведения о кадастровом инженере:</xsl:text>
					</span>
				</td>
			</tr>

			<xsl:for-each select="//Contractor">
				<xsl:call-template name="Contractor" />
			</xsl:for-each>

			<tr>
				<td>
					<span>
						<xsl:text>Дата подготовки межевого плана  </xsl:text>
					</span>
					<xsl:if test="@DateCadastral!=''">
						<xsl:value-of select="@DateCadastral" />
					</xsl:if>
				</td>
			</tr>

		</xsl:if>
		<!-- </table> -->
	</xsl:template>


	<xsl:template name="Conclusion">
		<tr>
			<td>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
					<xsl:if test="//Conclusion!=''">
						<tr>
							<td align="center">
								<span style="font-weight:bold">
									<xsl:text>Заключение кадастрового инженера</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<table style="WIDTH: 100%">
									<xsl:call-template name="Table4" />
									<tr>
										<td align="width" colspan="3">
											<xsl:value-of select="//Conclusion" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>


	<xsl:template name="Appendix">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<!-- <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> <xsl:attribute name="width"> 
					<xsl:value-of select="$TableWidth" /> </xsl:attribute> -->

				<xsl:if test="count(//Appendix/*)>0">
					<tr>
						<td align="center">
							<span style="font-weight:bold">
								<xsl:text>Приложения</xsl:text>
							</span>
						</td>
					</tr>

					<tr>
						<td>
							<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
								<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>

								<xsl:for-each select="//Appendix/AppliedFiles">
									<tr>
										<td>
											<xsl:value-of select="NumberAppendix" />
										</td>
										<td>
											<xsl:value-of select="NameAppendix" />

											<xsl:call-template name="ImageRef">
												<xsl:with-param name="part" select="$part" />
												<xsl:with-param name="type" select="$ttt" />
												<xsl:with-param name="pos" select="$pos" />
												<xsl:with-param name="pos0" select="$ppp" />
												<xsl:with-param name="pos1" select="$ppp" />
												<xsl:with-param name="pos2" select="$ppp" />
												<xsl:with-param name="val" select="AppliedFile/@Name" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:if>
			</td>
		</tr>

		<!-- </table> -->

	</xsl:template>

	<!--Универсальный заголовок Таблица с тремя колонками -->
	<xsl:template name="Table3_header">
		<xsl:param name="Column2Text" />
		<xsl:param name="Column3Text" />
		<tr>
			<td width="5%" align="center">
				<xsl:text>№ п/п</xsl:text>
			</td>
			<td width="30%" align="center">
				<xsl:value-of select="$Column2Text" />
			</td>
			<td width="65%" align="center">
				<xsl:value-of select="$Column3Text" />
			</td>
		</tr>
		<tr>
			<td align="center">
				<xsl:text>1</xsl:text>
			</td>
			<td align="center">
				<xsl:text>2</xsl:text>
			</td>
			<td align="center">
				<xsl:text>3</xsl:text>
			</td>
		</tr>
	</xsl:template>

	<!--Универсальный заголовок Таблица с 4 колонками -->
	<xsl:template name="Table41_header">
		<xsl:param name="Column2Text" />
		<xsl:param name="Column3Text" />
		<xsl:param name="Column4Text" />
		<tr>
			<td width="5%" align="center">
				<xsl:text>№ п/п</xsl:text>
			</td>
			<td width="31%" align="center">
				<xsl:value-of select="$Column2Text" />
			</td>
			<td width="32%" align="center">
				<xsl:value-of select="$Column3Text" />
			</td>
			<td width="32%" align="center">
				<xsl:value-of select="$Column4Text" />
			</td>
		</tr>
		<tr>
			<td align="center">
				<xsl:text>1</xsl:text>
			</td>
			<td align="center">
				<xsl:text>2</xsl:text>
			</td>
			<td align="center">
				<xsl:text>3</xsl:text>
			</td>
			<td align="center">
				<xsl:text>4</xsl:text>
			</td>
		</tr>
	</xsl:template>

	<!--Универсальный заголовок Таблица с 5 колонками -->
	<xsl:template name="Table5_header">
		<xsl:param name="Column2Text" />
		<xsl:param name="Column3Text" />
		<xsl:param name="Column4Text" />
		<xsl:param name="Column5Text" />
		<tr>
			<td width="5%" align="center">
				<xsl:text>№ п/п</xsl:text>
			</td>
			<td width="31%" align="center">
				<xsl:value-of select="$Column2Text" />
			</td>
			<td width="20%" align="center">
				<xsl:value-of select="$Column3Text" />
			</td>
			<td width="10%" align="center">
				<xsl:value-of select="$Column4Text" />
			</td>
			<td width="25%" align="center">
				<xsl:value-of select="$Column5Text" />
			</td>
		</tr>
		<tr>
			<td align="center">
				<xsl:text>1</xsl:text>
			</td>
			<td align="center">
				<xsl:text>2</xsl:text>
			</td>
			<td align="center">
				<xsl:text>3</xsl:text>
			</td>
			<td align="center">
				<xsl:text>4</xsl:text>
			</td>
			<td align="center">
				<xsl:text>5</xsl:text>
			</td>
		</tr>
	</xsl:template>



	<!-- Таблица "Инструменты, заголовок -->
	<xsl:template name="Table4_header">

		<tr>
			<td width="5%" align="center">
				<xsl:text>№ п/п</xsl:text>
			</td>
			<td width="30%" align="center">
				<xsl:text>Наименование прибора (инструмента, аппаратуры)</xsl:text>
			</td>
			<td width="30%" align="center">
				<xsl:text>Сведения об утверждении типа измерений</xsl:text>
			</td>

			<td align="center">
				<xsl:text>Реквизиты свидетельства о поверке прибора (инструмента,аппаратуры)</xsl:text>
			</td>
		</tr>
		<tr>
			<td align="center">
				<xsl:text>1</xsl:text>
			</td>
			<td align="center">
				<xsl:text>2</xsl:text>
			</td>
			<td align="center">
				<xsl:text>3</xsl:text>
			</td>
			<td align="center">
				<xsl:text>4</xsl:text>
			</td>
		</tr>
	</xsl:template>

	<!-- Таблица "Документы, заголовок -->
	<!-- <xsl:template name="Table5_header"> <tr> <td width="5%" align="center"> <xsl:text>№ п/п</xsl:text> </td> <td width="65%" 
		align="center"> <xsl:text>Наименование документа</xsl:text> </td> <td align="center"> <xsl:text>Реквизиты документа</xsl:text> 
		</td> </tr> <tr> <td align="center"> <xsl:text>1</xsl:text> </td> <td align="center"> <xsl:text>2</xsl:text> </td> <td align="center"> 
		<xsl:text>3</xsl:text> </td> </tr> </xsl:template> -->

	<!-- Таблица ""Пункты ОМС, заголовок -->
	<xsl:template name="Table8_header">
		<tr>
			<td width="3%" align="center" rowspan="2">
				<xsl:text>№ п/п</xsl:text>
			</td>

			<td width="15%" align="center" rowspan="2">
				<xsl:text>Название пункта и тип знака геодезической сети</xsl:text>
			</td>
			<td width="5%" align="center" rowspan="2">
				<xsl:text>Класс геодезической сети</xsl:text>
			</td>

			<td width="27%" align="center" colspan="2">
				<xsl:text>Координаты, м</xsl:text>
			</td>

			<td width="50%" align="center" colspan="3">
				<xsl:text>Сведения о состоянии на</xsl:text>
				<br />
				<xsl:text>«___» _________ ____г.</xsl:text>
			</td>

		</tr>
		<tr>
			<td align="center" width="15%"> X</td>
			<td align="center" width="15%"> Y</td>
			<td align="center" width="15%">
				наружного знака пункта</td>
			<td align="center" width="15%"> центра
				знака
			</td>
			<td align="center" width="15%"> марки</td>
		</tr>

		<tr>
			<td align="center">
				<xsl:text>1</xsl:text>
			</td>
			<td align="center">
				<xsl:text>2</xsl:text>
			</td>
			<td align="center">
				<xsl:text>3</xsl:text>
			</td>
			<td align="center">
				<xsl:text>4</xsl:text>
			</td>
			<td align="center">
				<xsl:text>5</xsl:text>
			</td>
			<td align="center">
				<xsl:text>6</xsl:text>
			</td>
			<td align="center">
				<xsl:text>7</xsl:text>
			</td>
			<td align="center">
				<xsl:text>8</xsl:text>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Table5_Item">
		<xsl:param name="docname" />
		<xsl:param name="docdate" />
		<xsl:param name="docnum" />
		<tr>
			<td width="5%" align="center">
				<xsl:value-of select="position()" />
			</td>
			<td width="65%">
				<xsl:value-of select="$docname" />
			</td>
			<td>
				<xsl:text>от </xsl:text>
				<xsl:value-of select="$docdate" />
				<xsl:text>  № </xsl:text>
				<xsl:value-of select="$docnum" />
			</td>
		</tr>
	</xsl:template>
	<!-- Заголовок таблицы 1. Сведения о характерных точках границы уточняемого земельного участка -->
	<xsl:template name="Table_ESOldNew_header">
		<tr>
			<td width="5%" align="center" rowspan="3">
				<xsl:text>  Обозначение характерных точек границ </xsl:text>
			</td>
			<td width="55%" colspan="4" align="center">
				<xsl:text>  Координаты, м </xsl:text>
			</td>
			<td width="15%" rowspan="3" align="center">
				<xsl:text>Средняя квадратическая погрешность положения характерной точки (Mt), м </xsl:text>
			</td>
			<td width="25%" rowspan="3">
				<xsl:text>	Описание закрепления точки </xsl:text>
			</td>
		</tr>
		<tr>
			<td colspan="2">Существующие
				координаты, м</td>
			<td colspan="2">Уточненные координаты,
				м</td>
		</tr>
		<tr>
			<td align="center">X </td>
			<td align="center">Y </td>
			<td align="center">X </td>
			<td align="center">Y </td>
		</tr>
		<tr>
			<td align="center">1 </td>
			<td align="center">2 </td>
			<td align="center">3 </td>
			<td align="center">4 </td>
			<td align="center">5 </td>
			<td align="center">6 </td>
			<td align="center">7 </td>
		</tr>
	</xsl:template>


	<!-- Заголовок таб 1. Сведения о характерных точках границ образуемых земельных участков -->
	<xsl:template name="Table_ES_New_header">
		<tr>
			<td width="5%" align="center" rowspan="2">
				<xsl:text>  Обозначение характерных точек границ </xsl:text>
			</td>
			<td width="50%" colspan="2" align="center">
				<xsl:text>  Координаты, м </xsl:text>
			</td>
			<td width="15%" rowspan="2" align="center">
				<xsl:text>Средняя квадратическая погрешность положения характерной точки (Mt), м </xsl:text>
			</td>
			<td width="30%" rowspan="2">
				<xsl:text>	Описание закрепления точки </xsl:text>
			</td>
		</tr>

		<tr>
			<td align="center">X </td>
			<td align="center">Y </td>

		</tr>
		<tr>
			<td align="center">1 </td>
			<td align="center">2 </td>
			<td align="center">3 </td>
			<td align="center">4 </td>
			<td align="center">5 </td>
		</tr>
	</xsl:template>


	<xsl:template name="newContour">
		<tr>
			<td align="center" colspan="5">
				<xsl:value-of select="@Definition" />
			</td>
		</tr>

		<xsl:for-each select="EntitySpatial/SpatialElement">
			<!-- <xsl:value-of select="position()" /> -->
			<xsl:for-each select="SpelementUnit">
				<xsl:call-template name="SpelementItem">
				</xsl:call-template>

			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="NewContourBorders">
		<xsl:for-each select=" EntitySpatial/Borders/Border">
			<tr>
				<td align="center">
					<xsl:value-of select="@Point1" />
				</td>
				<td align="center">
					<xsl:value-of select="@Point2" />
				</td>
				<td align="center">
					<xsl:value-of select="Edge/Length" />
				</td>
				<td align="center">-</td>
			</tr>
		</xsl:for-each>
	</xsl:template>






	<!-- ********************************* Развертка записи Точка ******************************************************** -->

	<xsl:template name="SpelementItem">
		<tr>
			<td align="center">

				<xsl:value-of select="Ordinate/@NumGeopoint" />


			</td>

			<td align="center">
				<xsl:value-of select="Ordinate/@X" />

			</td>

			<td align="center">

				<xsl:value-of select="Ordinate/@Y" />
			</td>

			<td align="center">
				<xsl:value-of select="Ordinate/@DeltaGeopoint" />
			</td>

			<td align="center">
				<xsl:value-of select="Ordinate/@GeopointZacrep">
				</xsl:value-of>
				<xsl:if test="not(Ordinate/@GeopointZacrep)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="SpelementItemOldNew">
		<tr>
			<td align="center">
				<xsl:if test="not(OldOrdinate)">
					<span style="color:red">
						<xsl:text>н</xsl:text>
						<xsl:value-of select="NewOrdinate/@NumGeopoint" />
					</span>
				</xsl:if>

				<xsl:if test="OldOrdinate and NewOrdinate">
					<xsl:value-of select="OldOrdinate/@NumGeopoint" />
				</xsl:if>

				<xsl:if test="not(NewOrdinate)">
					<span style="color:blue; font-style:italic">
						<xsl:value-of select="OldOrdinate/@NumGeopoint" />
					</span>
				</xsl:if>

			</td>
			<td align="center">
				<xsl:value-of select="OldOrdinate/@X" />
				<xsl:if test="not(OldOrdinate)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
			<td align="center">
				<xsl:if test="not(OldOrdinate)">
					<xsl:text>-</xsl:text>
				</xsl:if>
				<xsl:value-of select="OldOrdinate/@Y" />
			</td>
			<td align="center">
				<xsl:value-of select="NewOrdinate/@X" />
				<xsl:if test="not(NewOrdinate)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
			<td align="center">
				<xsl:value-of select="NewOrdinate/@Y" />
				<xsl:if test="not(NewOrdinate)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
			<td align="center">
				<xsl:value-of select="NewOrdinate/@DeltaGeopoint" />
				<xsl:if test="not(NewOrdinate)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
			<td align="center">
				<xsl:value-of select="NewOrdinate/@GeopointZacrep">
				</xsl:value-of>
				<xsl:if test="not(NewOrdinate/@GeopointZacrep)">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Заголовок таблицы 2. Сведения о частях границ уточняемого земельного участка -->
	<xsl:template name="Table_Borders_header">
		<tr>
			<td width="25%" align="center" colspan="2">
				<xsl:text>  Обозначение части границы </xsl:text>
			</td>

			<td width="15%" align="center" rowspan="2">
				<xsl:text> Горизонтальное проложение (S), м </xsl:text>
			</td>

			<td width="35%" align="center" rowspan="2">
				<xsl:text> Описание прохождения части границ </xsl:text>
			</td>
		</tr>
		<tr>
			<td align="center">от т.</td>
			<td align="center">до т.</td>
		</tr>

		<tr>
			<td align="center">1 </td>
			<td align="center">2 </td>
			<td align="center">3 </td>
			<td align="center">4 </td>
		</tr>
	</xsl:template>


	<!-- ********************************** Исходные данные ******************************************************** -->
	<xsl:template name="InputData">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<!-- <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> <xsl:attribute name="width"> <xsl:value-of 
			select="$TableWidth" /> </xsl:attribute> -->

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

					<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
						<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
						<xsl:if test="//InputData/Documents">
							<xsl:call-template name="Table3_header">
								<xsl:with-param name="Column2Text" select='"Наименование документа"' />
								<xsl:with-param name="Column3Text" select='"Реквизиты документа"' />
							</xsl:call-template>




							<xsl:for-each select="//InputData/Documents/Document">

								<xsl:call-template name="Table5_Item">
									<xsl:with-param name="docname" select="Name" />
									<xsl:with-param name="docdate" select="Date" />
									<xsl:with-param name="docnum" select="Number" />
								</xsl:call-template>
								<xsl:if test="Kind!='' or Scale!='' or Form!='' or Date_Create!='' or Date_Update!=''">
									<tr>
										<td colspan="4">
											<span>Картографическое
												произведение</span>
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
												<xsl:with-param name="val" select="Date_Create" />
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
												<xsl:with-param name="val" select="Date_Update" />
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


					<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
						<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>

						<xsl:call-template name="Table8_header" />

						<xsl:if test="//InputData/GeodesicBases">
							<xsl:for-each select="//InputData/GeodesicBases/GeodesicBase">

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
								<!-- <xsl:if test="PKind!=''"> <tr> <td> <span> <xsl:text>Тип</xsl:text> </span> </td> <td colspan="3"> <xsl:call-template 
									name="TextBox"> <xsl:with-param name="siz" select="75" /> <xsl:with-param name="val" select="PKind" /> </xsl:call-template> 
									</td> </tr> </xsl:if> <xsl:if test="PKlass!=''"> <tr> <td> <span> <xsl:text>Класс</xsl:text> </span> </td> <td colspan="3"> 
									<xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="75" /> <xsl:with-param name="val" select="PKlass" /> 
									</xsl:call-template> </td> </tr> </xsl:if> <xsl:if test="OrdX!='' or OrdY!=''"> <tr> <td> <span> <xsl:text>Координата X</xsl:text> 
									</span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" 
									select="OrdX" /> </xsl:call-template> </td> <td> <span> <xsl:text>Координата Y</xsl:text> </span> </td> <td> <xsl:call-template 
									name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="OrdY" /> </xsl:call-template> 
									</td> </tr> </xsl:if> -->
							</xsl:for-each>
						</xsl:if>


						<xsl:if test="count(//InputData/GeodesicBases/*)=0">
							<tr>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
								<td align="center">-</td>
							</tr>
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
				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table41_header">
						<xsl:with-param name="Column2Text" select='"Наименование прибора (инструмента, аппаратуры"' />
						<xsl:with-param name="Column3Text" select='"Сведения об утверждении типа измерений"' />
						<xsl:with-param name="Column4Text"
							select='"Реквизиты свидетельства о поверке прибора (инструмента,аппаратуры)"' />
					</xsl:call-template>

					<xsl:if test="//InputData/MeansSurvey">
						<xsl:for-each select="//InputData/MeansSurvey/MeanSurvey">

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

					<xsl:if test="count(//InputData/MeansSurvey/*)=0">
						<tr>
							<td align="center">-</td>
							<td align="center">-</td>
							<td align="center">-</td>
							<td align="center">-</td>

						</tr>
					</xsl:if>

				</table>
			</td>
		</tr>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>4. Сведения о наличии объектов недвижимости на исходных земельных участках </xsl:text>
				</span>
				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер земельного участка"' />
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
									<xsl:value-of select="ObjectRealty/CadastralNumberParcel" />
								</td>

								<td align="center">

									<xsl:value-of select="ObjectRealty/InnerCadastralNumbers">
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
				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер земельного участка"' />
						<xsl:with-param name="Column3Text" select='"Учетные номера частей земельного участка"' />
					</xsl:call-template>

					<xsl:for-each select="//InputData/SubParcels/SubParcel">
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
		<!-- запчасти //Survey: <xsl:if test="//Survey"> <tr> <td colspan="4"> <span style="font-weight:bold"> <xsl:text>Сведения 
			о выполненных измерениях и расчетах</xsl:text> </span> </td> </tr> <tr> <td> <table style="width:750"> <xsl:call-template 
			name="Table4" /> <xsl:for-each select="//Survey/AppliedFile"> <xsl:call-template name="ImageRef"> <xsl:with-param name="part" 
			select="$part" /> <xsl:with-param name="type" select="$ttt" /> <xsl:with-param name="pos" select="$pos" /> <xsl:with-param 
			name="pos0" select="$ppp" /> <xsl:with-param name="pos1" select="$ppp" /> <xsl:with-param name="pos2" select="$ppp" /> <xsl:with-param 
			name="val" select="@Name" /> </xsl:call-template> </xsl:for-each> </table> </td> </tr> </xsl:if> -->
		<!-- </table> -->
	</xsl:template>


	<!-- ******************** Сведения о выполненных измерениях и расчетах ***************************************** -->


	<xsl:template name="Survey">

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>Сведения о выполненных измерениях и расчетах</xsl:text>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text> 1. Метод определения координат характерных точек границ земельных участков и их частей     </xsl:text>
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text"
							select='"Кадастровый номер или обозначение земельного участка, частей земельного участка"' />
						<xsl:with-param name="Column3Text" select='"Метод определения координат"' />
					</xsl:call-template>

					<xsl:if test="//Survey/GeopointsOpred">
						<xsl:call-template name="GeopointsOpred">
						</xsl:call-template>
					</xsl:if>


				</table>
			</td>
		</tr>

		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text> 2. Точность определения положения характерных точек границ земельных участков </xsl:text>
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table3_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер или обозначение земельного участка"' />
						<xsl:with-param name="Column3Text"
							select='"Формулы, примененные для расчета средней квадратической 
									погрешности положения характерных точек границ (Мt), м"' />
					</xsl:call-template>

					<xsl:if test="//Survey/TochnGeopointsParcels">
						<xsl:call-template name="TochnGeopointsParcels">
						</xsl:call-template>
					</xsl:if>


				</table>
			</td>
		</tr>


		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text> 3. Точность определения положения характерных точек границ частей земельных участков </xsl:text>
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table41_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер или обозначение земельного участка"' />
						<xsl:with-param name="Column3Text" select='"Учетный номер или обозначение части"' />
						<xsl:with-param name="Column4Text"
							select='"Формулы, примененные для расчета средней квадратической 
									погрешности положения характерных точек границ (Мt), м"' />
					</xsl:call-template>

					<xsl:if test="//Survey/TochnGeopointsParcels">

					</xsl:if>
					<tr>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>

				</table>
			</td>
		</tr>

		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text> 4. Точность определения площади земельных участков</xsl:text>
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table41_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер или обозначение земельного участка"' />
						<xsl:with-param name="Column3Text" select='"Площадь (Р), м²"' />
						<xsl:with-param name="Column4Text"
							select='"Формулы, примененные для расчета предельной допустимой погрешности 
									определения площади земельного участка (ΔР), м²"' />
					</xsl:call-template>
					<xsl:if test="//Survey/TochnAreaParcels">
						<xsl:call-template name="TochnAreaParcels">
						</xsl:call-template>
					</xsl:if>

				</table>
			</td>
		</tr>


		<tr>
			<td>
				<span style="font-weight:bold">
					<xsl:text>5. Точность определения площади частей земельных участков</xsl:text>
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table5_header">
						<xsl:with-param name="Column2Text" select='"Кадастровый номер или обозначение земельного участка"' />
						<xsl:with-param name="Column3Text" select='"Учетный номер или обозначение части"' />
						<xsl:with-param name="Column4Text" select='"Площадь (Р), м²"' />
						<xsl:with-param name="Column5Text"
							select='"Формулы, примененные для 
											расчета предельной допустимой погрешности определения площади части 
											земельного участка (ΔР), м²"' />
					</xsl:call-template>

					<xsl:if test="//Survey/TochnAreaParcels">

					</xsl:if>

					<tr>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>


				</table>
			</td>
		</tr>
	</xsl:template>

	<!-- Метод определения координат характерных точек границ земельных участков и их частей -->
	<!-- Грузим enumeration schema dGeopointOpred_v01.xsd -->
	<xsl:template name="GeopointsOpred">
		<xsl:if test="//Survey/GeopointsOpred">

			<xsl:for-each select="//Survey/GeopointsOpred/GeopointOpred">

				<tr>
					<td align="center">
						<xsl:value-of select="position()" />
					</td>

					<td align="center">
						<xsl:if test="CadastralNumberDefinition!=''">
							<xsl:value-of select="CadastralNumberDefinition" />
						</xsl:if>
					</td>
					<td>
						<xsl:variable name="var0" select="document('schema/dGeopointOpred_v01.xsd')" />
						<xsl:variable name="kod0" select="Methods/GeopointOpred" />
						<xsl:value-of select="$var0//xs:enumeration[@value=$kod0]/xs:annotation/xs:documentation" />
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- Точность определения положения характерных точек границ земельных участков -->


	<xsl:template name="TochnGeopointsParcels">
		<xsl:if test="//Survey/TochnGeopointsParcels">

			<xsl:for-each select="//Survey/TochnGeopointsParcels/TochnGeopointsParcel">

				<tr>
					<td align="center">
						<xsl:value-of select="position()" />
					</td>

					<td align="center">
						<xsl:if test="CadastralNumberDefinition!=''">
							<xsl:value-of select="CadastralNumberDefinition" />
						</xsl:if>
					</td>
					<td>
						<xsl:value-of select="Formula" />
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template name="TochnAreaParcels">
		<xsl:if test="//Survey/TochnAreaParcels">
			<xsl:for-each select="//Survey/TochnAreaParcels/TochnAreaParcel">
				<tr>
					<td align="center">
						<xsl:value-of select="position()" />
					</td>

					<td align="center">
						<xsl:if test="CadastralNumberDefinition!=''">
							<xsl:value-of select="CadastralNumberDefinition" />
						</xsl:if>
					</td>
					<td align="center">
						<xsl:value-of select="Area/Area" />
					</td>

					<td>
						<xsl:value-of select="Formula" />
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>



	<xsl:template name="Schemas">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:param name="path" />
		<tr>
			<td>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      	</xsl:attribute>

					<xsl:if test="//SchemeGeodesicPlotting">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Схема геодезических построений</xsl:text>
								</span>

								<table style="width:750">
									<xsl:call-template name="Table4" />
									<xsl:for-each select="//SchemeGeodesicPlotting">
										<xsl:call-template name="ImageRef">
											<xsl:with-param name="part" select="$part" />
											<xsl:with-param name="type" select="$ttt" />
											<xsl:with-param name="pos" select="$pos" />
											<xsl:with-param name="pos0" select="$ppp" />
											<xsl:with-param name="pos1" select="$ppp" />
											<xsl:with-param name="pos2" select="$ppp" />
											<xsl:with-param name="val" select="@Name" />
										</xsl:call-template>
										<!--/xsl:otherwise> </xsl:choose -->
									</xsl:for-each>

								</table>
							</td>
						</tr>
					</xsl:if>

					<xsl:if test="//SchemeDisposition">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Схема расположения земельных участков</xsl:text>
								</span>

								<table style="width:750">
									<xsl:call-template name="Table4" />
									<xsl:for-each select="//SchemeDisposition">

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
								</table>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="//DiagramParcelsSubParcels">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Чертежи земельных участков и их частей</xsl:text>
								</span>

								<table style="width:750">
									<xsl:call-template name="Table4" />

									<xsl:for-each select="//DiagramParcelsSubParcels">
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

									<xsl:if test="@Scale!=''">
										<tr>
											<td>
												<span>
													<xsl:text>Масштаб</xsl:text>
												</span>
											</td>
											<td>
												<xsl:call-template name="TextBox">
													<xsl:with-param name="siz" select="25" />
													<xsl:with-param name="val" select="@Scale" />
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>

								</table>
							</td>
						</tr>
					</xsl:if>
					<!-- <xsl:if test="//Appendix"> <tr> <td colspan="4"> <span style="font-weight:bold"> <xsl:text>Приложения</xsl:text> 
						</span> </td> </tr> <tr> <td> <table style="width:750"> <xsl:call-template name="Table4" /> <xsl:for-each select="//Appendix/Document"> 
						<tr> <td> <span> <xsl:text>#</xsl:text> <xsl:value-of select="position()" /> </span> </td> </tr> <xsl:call-template name="Document_spec"> 
						<xsl:with-param name="pos" select="$pos" /> <xsl:with-param name="part" select="$part" /> <xsl:with-param name="path" select="$path" 
						/> <xsl:with-param name="type" select="$ttt" /> <xsl:with-param name="pos0" select="$ppp" /> <xsl:with-param name="pos1" 
						select="$ppp" /> <xsl:with-param name="pos2" select="$ppp" /> </xsl:call-template> </xsl:for-each> </table> </td> </tr> </xsl:if> -->
					<xsl:if test="//AgreementDocument">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Акт согласования границ</xsl:text>
								</span>

								<table style="width:750">
									<xsl:call-template name="Table4" />
									<xsl:for-each select="//AgreementDocument">
										<xsl:choose>
											<xsl:when test="$part='!Print!'">
												<xsl:call-template name="PictureInsert">
													<xsl:with-param name="path" select="$path" />
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
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:if>

					<xsl:if test="//NodalPointSchemes">
						<tr>
							<td colspan="4">
								<span style="font-weight:bold">
									<xsl:text>Абрисы узловых точек границ земельных участков</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<table style="width:750">
									<xsl:call-template name="Table4" />
									<xsl:for-each select="//NodalPointSchemes//AppliedFile">
										<xsl:choose>
											<xsl:when test="$part='!Print!'">
												<xsl:call-template name="PictureInsert">
													<xsl:with-param name="path" select="$path" />
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
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<!-- Обработка пункта меню: вызов функции DoXslt из html -->
	<xsl:template name="ParcelsItem">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:param name="cpart" />
		<xsl:param name="npart" />
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="$part = $cpart">
				<span style="font-weight:bold">
					<nobr>
						<xsl:value-of select="$npart" />
					</nobr>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<a href="#">
					<xsl:attribute name="onclick">
            <xsl:choose>
              <xsl:when test="$pos0=0">
                <xsl:text>DoXslt("</xsl:text>
                <xsl:value-of select="$cpart" />
                <xsl:text>",</xsl:text>
                <xsl:value-of select="$pos" />
                <xsl:text>)</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>DoXsltChild("</xsl:text>
                <xsl:value-of select="$cpart" />
                <xsl:text>","</xsl:text>
                <xsl:value-of select="$type" />
                <xsl:text>",</xsl:text>
                <xsl:value-of select="$pos" />
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$pos0" />
                <xsl:text>)</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
					<span>
						<nobr>
							<xsl:value-of select="$npart" />
						</nobr>
					</span>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Вид страницы в зависимости от значения part -->
	<xsl:template name="ParcelsWork">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<xsl:choose>
			<xsl:when test="$part='Register'">
				<xsl:if test="$pos0 = 0">
					<tr>
						<td align="center">
							<xsl:call-template name="BlockCadastralNumber" />
						</td>
					</tr>
				</xsl:if>
				<xsl:call-template name="Register">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
				<xsl:call-template name="Characters">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$part='Char'">
				<xsl:choose>
					<xsl:when test="Area or ExistEZParcels/Area">
						<xsl:call-template name="Area" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="Areas" />
					</xsl:otherwise>
				</xsl:choose>

				<xsl:for-each select=".//Contours/*">
					<xsl:if test=".//Providing_Pass_CadastralNumbers/Other">
						<tr>
							<td>
								<span style="font-weight:bold">
									Номер контура:
								</span>
								<span>
									<xsl:value-of select="@Definition" />
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee" width="100%">
									<tr>
										<td>
											<xsl:call-template name="Providing" />
										</td>
									</tr>
								</table>

							</td>
						</tr>

					</xsl:if>
				</xsl:for-each>
				<xsl:apply-templates select="Category">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
				<xsl:call-template name="Utilization">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="NaturalObject">
						<xsl:call-template name="NaturalObject" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="Natural_Objects">
							<xsl:with-param name="part" select="$part" />
							<xsl:with-param name="type" select="$type" />
							<xsl:with-param name="pos" select="$pos" />
							<xsl:with-param name="pos0" select="$pos0" />
							<xsl:with-param name="pos1" select="$pos1" />
							<xsl:with-param name="pos2" select="$pos2" />
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates select="Ground_Payments">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$part='Components'">
				<xsl:apply-templates select="SubParcels">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
				<xsl:for-each select="//ExistEZParcels">
					<xsl:apply-templates select="SubParcels">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
					</xsl:apply-templates>
					<xsl:apply-templates select="NewSubParcel">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
					</xsl:apply-templates>
				</xsl:for-each>
				<xsl:apply-templates select="NewSubParcel">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$part='EZParcels'">
				<xsl:for-each select=".//ExistEZEntryParcel">
					<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
						<tr>
							<td colspan="4">
								<center>
									<b>
										<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК В СОСТАВЕ ЕЗ</xsl:text>
									</b>
								</center>
							</td>
						</tr>
						<xsl:call-template name="Register">
							<xsl:with-param name="part" select="$part" />
							<xsl:with-param name="type" select="$type" />
							<xsl:with-param name="pos" select="$pos" />
							<xsl:with-param name="pos0" select="$pos0" />
							<xsl:with-param name="pos1" select="$pos1" />
							<xsl:with-param name="pos2" select="$pos2" />
						</xsl:call-template>
						<xsl:if test="Area or ExistEZParcels/Area">
							<xsl:call-template name="Area" />
						</xsl:if>
						<xsl:apply-templates select="Entity_Spatial" />
						<xsl:apply-templates select="Contours" />
						<xsl:if test="ChangeBorder">
							<xsl:call-template name="ChangeBorder" />
						</xsl:if>
					</table>
					<br />
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$part='Location'">
				<xsl:apply-templates select="Location" />
			</xsl:when>
			<xsl:when test="$part='Rights'">
				<xsl:apply-templates select="Rights">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$part='Encumbrances'">
				<xsl:apply-templates select="Encumbrances">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$part='Entity_Spatial'">
				<xsl:apply-templates select="Entity_Spatial" />
				<xsl:apply-templates select="Contours" />
				<xsl:if test="ChangeBorder">
					<xsl:call-template name="ChangeBorder" />
				</xsl:if>
			</xsl:when>
			<xsl:when test="$part='NewEntryParcels'">
				<xsl:apply-templates select="Composition_EZ/InsertEntryParcels" />
				<xsl:apply-templates select="ExistEZParcels/Composition_EZ/InsertEntryParcels" />
			</xsl:when>
			<xsl:when test="$part='Contractor'">
				<xsl:call-template name="ClientContractor">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$part='Schemas'">
				<xsl:call-template name="Schemas">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$part='Data'">
				<xsl:call-template name="InputData">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$part='EZParcelExist'">
				<xsl:for-each select=".//ExistEZEntryParcel">
					<xsl:if test="$pos=position()">
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
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</table>
							</td>
						</tr>
						<xsl:if test="Area or ExistEZParcels/Area">
							<xsl:call-template name="Area" />
						</xsl:if>
						<xsl:apply-templates select="Entity_Spatial" />
						<xsl:apply-templates select="Contours" />
						<xsl:if test="ChangeBorder">
							<xsl:call-template name="ChangeBorder" />
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$part='EZParcelNew'">
				<tr>
					<td>
						<xsl:for-each select="//InsertEntryParcels/*/NewEntryParcel">
							<xsl:if test="$pos=position()">
								<xsl:call-template name="NewEntryParcel">
									<xsl:with-param name="pos" select="position()" />
									<xsl:with-param name="part" select="$part" />
									<xsl:with-param name="pos0" select="$pos0" />
									<xsl:with-param name="pos1" select="$pos1" />
									<xsl:with-param name="pos2" select="$pos2" />
									<xsl:with-param name="type" select="$type" />
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="$part='RelatedParcels'">
				<xsl:call-template name="RelatedParcels" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- Страница "Земельный участок" -->
	<xsl:template name="Parcels">
		<xsl:param name="pos" />
		<xsl:param name="part" />
		<xsl:for-each select="//Parcel[$pos = position()]">
			<p />
			<table align="center" cellspacing="0" cellpadding="0">
				<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>

				<xsl:call-template name="ParcelsMenu">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="'P'" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="0" />
					<xsl:with-param name="pos1" select="0" />
					<xsl:with-param name="pos2" select="0" />
				</xsl:call-template>


			</table>
			<p align="center">
				<span style="font-weight:bold">
					<xsl:value-of select="$pos" />
					<xsl:text>. </xsl:text>
					<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
				</span>
			</p>
			<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
				<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
				<xsl:call-template name="ParcelsWork">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="'P'" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="0" />
					<xsl:with-param name="pos1" select="0" />
					<xsl:with-param name="pos2" select="0" />
				</xsl:call-template>
			</table>
		</xsl:for-each>
		<!-- Проверка верси для правильного вывода Сущ. участка в разных версиях МП.(Костыль)" -->
		<xsl:if test="'03' = //eDocument/@Version">
			<xsl:for-each
				select=".//*[(local-name()='NewParcel' or local-name()='ChangeParcel' or local-name()='ExistParcel' or local-name()='SpecifyRelatedParcel') and $pos = position()]">
				<p />
				<table align="center" cellspacing="0" cellpadding="0">
					<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
					<xsl:call-template name="ParcelsMenu">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
				<p align="center">
					<span style="font-weight:bold">
						<xsl:value-of select="$pos" />
						<xsl:text>. </xsl:text>
						<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
					</span>
				</p>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
          <xsl:value-of select="$TableWidth" />
        </xsl:attribute>
					<xsl:call-template name="ParcelsWork">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="'04' = //eDocument/@Version">
			<xsl:for-each
				select=".//*[(local-name()='NewParcel' or local-name()='ChangeParcel' or local-name()='SpecifyRelatedParcel') and $pos = position()]">
				<p />
				<table align="center" cellspacing="0" cellpadding="0">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsMenu">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
				<p align="center">
					<span style="font-weight:bold">
						<xsl:value-of select="$pos" />
						<xsl:text>. </xsl:text>
						<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
					</span>
				</p>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsWork">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select=".//SpecifyParcelsApproximal[$pos = position()]">
			<p />
			<xsl:for-each select="*[local-name()='ExistParcel' or local-name()='ExistEZ']">
				<table align="center" cellspacing="0" cellpadding="0">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsMenu">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
				<p align="center">
					<span style="font-weight:bold">
						<xsl:value-of select="$pos" />
						<xsl:text>. </xsl:text>
						<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
					</span>
				</p>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsWork">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:for-each select=".//SpecifyParcel">
			<p />
			<xsl:for-each select="*[local-name()='ExistParcel' or local-name()='ExistEZ'][$pos = position()]">
				<table align="center" cellspacing="0" cellpadding="0">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsMenu">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
				<p align="center">
					<span style="font-weight:bold">
						<xsl:value-of select="$pos" />
						<xsl:text>. </xsl:text>
						<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
					</span>
				</p>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsWork">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:if test="//NewSubParcel">
			<xsl:for-each select="//*[local-name()='Package'][$pos = position()]">
				<p />
				<table align="center" cellspacing="0" cellpadding="0">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsMenu">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
				<p align="center">
					<span style="font-weight:bold">
						<xsl:value-of select="$pos" />
						<xsl:text>. </xsl:text>
						<xsl:text>ЗЕМЕЛЬНЫЙ УЧАСТОК</xsl:text>
					</span>
				</p>
				<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
					<xsl:attribute name="width">
            <xsl:value-of select="$TableWidth" />
          </xsl:attribute>
					<xsl:call-template name="ParcelsWork">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="'P'" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="0" />
						<xsl:with-param name="pos1" select="0" />
						<xsl:with-param name="pos2" select="0" />
					</xsl:call-template>
				</table>
			</xsl:for-each>
		</xsl:if>


	</xsl:template>
	<!-- Меню на странице "Земельный участок" -->
	<xsl:template name="ParcelsMenu">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<tr>
			<td align="center">
				<xsl:choose>
					<xsl:when test="$pos0=0">
						<a href="#" onclick="DoXslt(&quot;Main&quot;,0)">
							<span>
								<xsl:text>Главная</xsl:text>
							</span>
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a href="#">
							<xsl:attribute name="onclick">
                <xsl:text>DoXslt("Components",</xsl:text>
                <xsl:value-of select="$pos" />
                <xsl:text>)</xsl:text>
              </xsl:attribute>
							<span>
								<xsl:text>Вверх</xsl:text>
							</span>
						</a>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="ParcelsItem">
					<xsl:with-param name="part" select="$part" />
					<xsl:with-param name="type" select="$type" />
					<xsl:with-param name="pos" select="$pos" />
					<xsl:with-param name="pos0" select="$pos0" />
					<xsl:with-param name="pos1" select="$pos1" />
					<xsl:with-param name="pos2" select="$pos2" />
					<xsl:with-param name="cpart" select="'Register'" />
					<xsl:with-param name="npart" select="'Реестровая карточка'" />
				</xsl:call-template>
				<xsl:if test="Location!=''">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Location'" />
						<xsl:with-param name="npart" select="'Местоположение'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if
					test="Areas!='' or Area!='' or .//ExistEZParcels/Area or Category or Utilization or Contours/*/Providing_Pass_CadastralNumbers">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Char'" />
						<xsl:with-param name="npart" select="'Характеристики'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="Rights!=''">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Rights'" />
						<xsl:with-param name="npart" select="'Права'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="Encumbrances!=''">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Encumbrances'" />
						<xsl:with-param name="npart" select="'Обременения'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="Entity_Spatial!='' or Contours!='' or ChangeBorder!=''">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Entity_Spatial'" />
						<xsl:with-param name="npart" select="'Границы'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="SubParcels!='' or NewSubParcel!='' or .//ExistEZParcels/SubParcels!=''">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'Components'" />
						<xsl:with-param name="npart" select="'Части участка'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if
					test="Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel or ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'NewEntryParcels'" />
						<xsl:with-param name="npart" select="'Включаемые участки'" />
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="RelatedParcels">
					<xsl:call-template name="ParcelsItem">
						<xsl:with-param name="part" select="$part" />
						<xsl:with-param name="type" select="$type" />
						<xsl:with-param name="pos" select="$pos" />
						<xsl:with-param name="pos0" select="$pos0" />
						<xsl:with-param name="pos1" select="$pos1" />
						<xsl:with-param name="pos2" select="$pos2" />
						<xsl:with-param name="cpart" select="'RelatedParcels'" />
						<xsl:with-param name="npart" select="'Смежные участки'" />
					</xsl:call-template>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="RelatedParcels">
		<xsl:param name="part" />
		<xsl:param name="type" />
		<xsl:param name="pos" />
		<xsl:param name="pos0" />
		<xsl:param name="pos1" />
		<xsl:param name="pos2" />
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">

			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<xsl:for-each select="//ParcelNeighbours">
				<p />

				<tr>
					<td>
						<p>
							<span style="font-weight:bold">
								<xsl:value-of select="position()" />
								<xsl:text>. </xsl:text>
								<xsl:text>СМЕЖНЫЙ УЧАСТОК</xsl:text>
							</span>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<table align="center" cellspacing="0" cellpadding="2">
							<xsl:if test="Definition!=''">
								<tr>
									<td>
										<span>
											<xsl:text>Номер точки или части границы</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:call-template name="TextBox">
											<xsl:with-param name="siz" select="75" />
											<xsl:with-param name="val" select="Definition" />
										</xsl:call-template>
									</td>
								</tr>
								<xsl:for-each select="ParcelNeighbour">
									<tr>
										<td>
											<span>
												<xsl:text>Кадастровый номер смежного ЗУ</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="Cadastral_Number" />
											</xsl:call-template>
										</td>
										<td>
											<span>
												<xsl:text>Вид права</xsl:text>
											</span>
										</td>
										<td>
											<xsl:call-template name="TextBox">
												<xsl:with-param name="siz" select="25" />
												<xsl:with-param name="val" select="OwnerNeighbours/NameRight" />
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<span>
												<xsl:text>
                  Правообладатели:
                </xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<table align="center" border="1">
												<xsl:for-each select="OwnerNeighbours/OwnerNeighbour">
													<tr>
														<td>
															<xsl:text>Правообладатель</xsl:text>
														</td>
														<td>
															<xsl:call-template name="TextBox">
																<xsl:with-param name="siz" select="25" />
																<xsl:with-param name="val" select="NameOwner" />
															</xsl:call-template>
														</td>
														<td>
															<xsl:text>Контактный адрес</xsl:text>
														</td>
														<td>
															<xsl:call-template name="TextBox">
																<xsl:with-param name="siz" select="25" />
																<xsl:with-param name="val" select="ContactAddress" />
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<xsl:for-each select="Documents/Document">
																<xsl:call-template name="Document" />
															</xsl:for-each>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
						</table>
					</td>
				</tr>


			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- Страница "Общие сведения" -->
	<!-- <xsl:template name="BaseData"> <xsl:param name="pos" select="0" /> <xsl:param name="part" /> <table align="center" 
		cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> <xsl:attribute name="width"> <xsl:value-of select="$TableWidth" 
		/> </xsl:attribute> <xsl:call-template name="BaseDataMenu"> <xsl:with-param name="part" select="$part" /> <xsl:with-param 
		name="type" select="'P'" /> <xsl:with-param name="pos" select="$pos" /> <xsl:with-param name="pos0" select="0" /> <xsl:with-param 
		name="pos1" select="0" /> <xsl:with-param name="pos2" select="0" /> </xsl:call-template> </table> <p /> <p /> <table align="center" 
		cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> <xsl:attribute name="width"> <xsl:value-of select="$TableWidth" 
		/> </xsl:attribute> <xsl:if test="$part=''"> <xsl:call-template name="Main_Data" /> </xsl:if> <xsl:call-template name="ParcelsWork"> 
		<xsl:with-param name="part" select="$part" /> <xsl:with-param name="type" select="'P'" /> <xsl:with-param name="pos" select="$pos" 
		/> <xsl:with-param name="pos0" select="0" /> <xsl:with-param name="pos1" select="0" /> <xsl:with-param name="pos2" select="0" 
		/> </xsl:call-template> </table> </xsl:template> -->

	<!-- Меню страницы "Общие сведения" -->
	<!-- <xsl:template name="BaseDataMenu"> <xsl:param name="part" /> <xsl:param name="type" /> <xsl:param name="pos" /> <xsl:param 
		name="pos0" /> <xsl:param name="pos1" /> <xsl:param name="pos2" /> <tr> <td align="center"> <a href="#" onclick="DoXslt(&quot;Main&quot;,0)"> 
		<span> <xsl:text>Главная</xsl:text> </span> </a> <xsl:call-template name="ParcelsItem"> <xsl:with-param name="part" select="$part" 
		/> <xsl:with-param name="type" select="$type" /> <xsl:with-param name="pos" select="$pos" /> <xsl:with-param name="pos0" 
		select="0" /> <xsl:with-param name="pos1" select="$pos1" /> <xsl:with-param name="pos2" select="$pos2" /> <xsl:with-param 
		name="cpart" select="'Contractor'" /> <xsl:with-param name="npart" select="'Заказчик и исполнитель'" /> </xsl:call-template> 
		<xsl:call-template name="ParcelsItem"> <xsl:with-param name="part" select="$part" /> <xsl:with-param name="type" select="$type" 
		/> <xsl:with-param name="pos" select="$pos" /> <xsl:with-param name="pos0" select="$pos0" /> <xsl:with-param name="pos1" 
		select="$pos1" /> <xsl:with-param name="pos2" select="$pos2" /> <xsl:with-param name="cpart" select="'Data'" /> <xsl:with-param 
		name="npart" select="'Исходные данные'" /> </xsl:call-template> <xsl:call-template name="ParcelsItem"> <xsl:with-param name="part" 
		select="$part" /> <xsl:with-param name="type" select="$type" /> <xsl:with-param name="pos" select="$pos" /> <xsl:with-param 
		name="pos0" select="$pos0" /> <xsl:with-param name="pos1" select="$pos1" /> <xsl:with-param name="pos2" select="$pos2" /> 
		<xsl:with-param name="cpart" select="'Schemas'" /> <xsl:with-param name="npart" select="'Схемы и приложения'" /> </xsl:call-template> 
		</td> </tr> </xsl:template> -->
	<!-- Страница "ЗУ в составе ЕЗ" -->

	<!-- Меню страницы "ЗУ в составе ЕЗ" -->


	<!-- На главной странице -->
	<!-- <xsl:template name="Main_Register"> <tr> <td> <span style="font-weight:bold"> <xsl:text>Объект</xsl:text> </span> </td> 
		</tr> <tr> <td> <table style="WIDTH: 100%"> <xsl:call-template name="Table4" /> <xsl:if test="@Name!=''"> <tr> <td> <span> 
		<xsl:text>Тип объекта (код)</xsl:text> </span> </td> <td colspan="3"> <xsl:call-template name="DictBox"> <xsl:with-param 
		name="dic"> <xsl:call-template name="dParcels" /> </xsl:with-param> <xsl:with-param name="siz" select="75" /> <xsl:with-param 
		name="val" select="@Name" /> </xsl:call-template> </td> </tr> </xsl:if> <xsl:if test="@CadastralNumber!=''"> <tr> <td> <span> 
		<xsl:text>Кадастровый номер</xsl:text> </span> </td> <td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param 
		name="siz" select="75" /> <xsl:with-param name="val" select="@CadastralNumber" /> </xsl:call-template> </td> </tr> </xsl:if> 
		<xsl:if test="@Definition!=''"> <tr> <td> <span> <xsl:text>Обозначение на плане</xsl:text> </span> </td> <td colspan="3"> 
		<xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="75" /> <xsl:with-param name="val" select="@Definition" 
		/> </xsl:call-template> </td> </tr> </xsl:if> <xsl:if test=".//ExistEZParcels/@CadastralNumber!=''"> <tr> <td colspan="2"> 
		<span> <xsl:text>Кадастровый номер единого землепользования</xsl:text> </span> </td> <td colspan="2"> <xsl:call-template 
		name="TextBox"> <xsl:with-param name="siz" select="50" /> <xsl:with-param name="val" select=".//ExistEZParcels/@CadastralNumber" 
		/> </xsl:call-template> </td> </tr> </xsl:if> <xsl:for-each select="ExistEZEntryParcels/ExistEZEntryParcel"> <tr> <td colspan="4"> 
		<a href="#"> <xsl:attribute name="onclick"> <xsl:text>DoXslt("EZParcelExist",</xsl:text> <xsl:value-of select="position()" 
		/> <xsl:text>)</xsl:text> </xsl:attribute> <xsl:text>Уточняемый земельный участок в составе ЕЗ (</xsl:text> <xsl:value-of 
		select="./@CadastralNumber" /> <xsl:text>)</xsl:text> </a> </td> </tr> -->
	<!--tr> <td colspan="2"> <span> <xsl:text>Кадастровый номер</xsl:text> </span> </td> <td colspan="2"> <xsl:call-template 
		name="TextBox"> <xsl:with-param name="siz" select="50"/> <xsl:with-param name="val" select="./@CadastralNumber"/> </xsl:call-template> 
		</td> </tr -->
	<!-- </xsl:for-each> <xsl:for-each select=".//ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel"> 
		<tr> <td colspan="4"> <a href="#"> <xsl:attribute name="onclick"> <xsl:text>DoXslt("EZParcelNew",</xsl:text> <xsl:value-of 
		select="position()" /> <xsl:text>)</xsl:text> </xsl:attribute> <xsl:text>Образуемый земельный участок в составе ЕЗ (</xsl:text> 
		<xsl:value-of select="@Definition" /> <xsl:text>)</xsl:text> </a> </td> </tr> -->
	<!--tr> <td colspan="2"> <span> <xsl:text>Обозначение</xsl:text> </span> </td> <td colspan="2"> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="siz" select="50"/> <xsl:with-param name="val" select="@Definition"/> </xsl:call-template> </td> </tr -->
	<!-- </xsl:for-each> </table> </td> </tr> </xsl:template> -->




	<!-- ********************* Сведения об уточняемом земельных участках ************************* -->
	<xsl:template name="ExistParcel">
		<xsl:param name="cn" />
		<!-- <br /> <xsl:text>Template Package/ExistParcel</xsl:text> <xsl:variable name="CN" select="@CadastralNumber" /> <xsl:value-of 
			select="$CN" /> -->
		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>1. Сведения о характерных точках границы уточняемого земельного участка 
					с кадастровым номером </xsl:text>
					<xsl:value-of select="@CadastralNumber" />
				</span>
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Зона № -</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
							<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
							<xsl:call-template name="Table_ESOldNew_header">
							</xsl:call-template>

							<xsl:if test="EntitySpatial!=''">
								<xsl:for-each select="EntitySpatial/SpatialElement">
									<xsl:for-each select="SpelementUnit">
										<xsl:call-template name="SpelementItemOldNew">
										</xsl:call-template>

									</xsl:for-each>
								</xsl:for-each>
							</xsl:if>

						</table>
					</td>
				</tr>
			</td>
		</tr>




		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>2. Сведения о частях границ уточняемого земельного участка 
					с кадастровым номером </xsl:text>
					<xsl:value-of select="@CadastralNumber" />
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="2">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table_Borders_header">
					</xsl:call-template>

					<xsl:if test="EntitySpatial!=''">
						<xsl:for-each select="EntitySpatial/Borders/Border">
							<tr>
								<td align="center">
									<xsl:value-of select="@Point1" />
								</td>
								<td align="center">
									<xsl:value-of select="@Point2" />
								</td>
								<td align="center">
									<xsl:value-of select="Edge/Length" />
								</td>
								<td align="center">-</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
				</table>

			</td>
		</tr>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>3. Общие сведения об уточняемом земельном участке с кадастровым номером  </xsl:text>
					<xsl:value-of select="@CadastralNumber" />
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<tr>
						<td width="5%" align="center">
							<xsl:text>№ п/п</xsl:text>
						</td>
						<td width="65%" align="center">
							<xsl:text>Наименование характеристик земельного участка</xsl:text>
						</td>
						<td width="30%" align="center">
							<xsl:text>Значение характеристики</xsl:text>

						</td>
					</tr>
					<tr>
						<td align="center">
							<xsl:text>1</xsl:text>
						</td>
						<td align="center">
							<xsl:text>2</xsl:text>
						</td>
						<td align="center">
							<xsl:text>3</xsl:text>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>1</xsl:text>
						</td>
						<td>
							<xsl:text>Площадь земельного участка ± величина погрешности определения площади (Р ± ΔР), м2 </xsl:text>
						</td>
						<td align="center">
							<xsl:value-of select="Area/Area" />
							±
							<xsl:value-of select="Area/Inaccuracy" />
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>2</xsl:text>
						</td>
						<td>
							<xsl:text>Площадь земельного участка по сведениям Единого государственного реестра недвижимости (Ркад), м2 </xsl:text>
						</td>
						<td align="center">
							<xsl:value-of select="AreaInGKN" />
							<xsl:if test="not(AreaInGKN)">
								<xsl:text>-</xsl:text>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>3</xsl:text>
						</td>
						<td>
							<xsl:text>Оценка расхождения Р и Ркад (Р - Ркад), м2 </xsl:text>
						</td>
						<td align="center">
							<xsl:value-of select="DeltaArea" />
							<xsl:if test="not(DeltaArea)">
								<xsl:text>-</xsl:text>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>4</xsl:text>
						</td>
						<td>
							<xsl:text>Предельный минимальный и максимальный размер земельного участка (Рмин и Рмакс), м2 </xsl:text>
						</td>
						<td align="center">
							<xsl:value-of select="MinArea/Area" />
							<xsl:if test="not(MinArea/Area)">
								<xsl:text>-</xsl:text>
							</xsl:if>
							<br />
							<xsl:value-of select="MaxArea/Area" />
							<xsl:if test="not(MaxArea/Area)">
								<xsl:text>-</xsl:text>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>5</xsl:text>
						</td>
						<td>
							<xsl:text>Кадастровый номер или иной номер объекта недвижимости, расположенного на земельном участке </xsl:text>
						</td>
						<td align="center">


							<xsl:value-of select="ObjectRealty/InnerCadastralNumbers">
							</xsl:value-of>


							<xsl:if test="not(ObjectRealty)">
								<xsl:text>-</xsl:text>
							</xsl:if>

						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>6</xsl:text>
						</td>
						<td>
							<xsl:text>Иные сведения </xsl:text>
						</td>
						<td align="center">-	</td>
					</tr>

				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>4. Сведения о земельных участках, смежных с уточняемым земельным участком
								с кадастровым номером  </xsl:text>
					<xsl:value-of select="@CadastralNumber" />
				</span>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">
					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
					<xsl:call-template name="Table41_header">
						<xsl:with-param name="Column2Text" select='"Обозначение характерной точки или части границы"' />
						<xsl:with-param name="Column3Text"
							select='"Кадастровые номера земельных участков, смежных с уточняемым земельным участком"' />
						<xsl:with-param name="Column4Text"
							select='"Сведения о правообладателях смежных земельных участков"' />
					</xsl:call-template>

				</table>
			</td>
		</tr>

	</xsl:template>

	<!-- ********************* Раздел "Сведения об уточняемых земельных участках" ************************* -->

	<xsl:template name="Main_SpecifyParcels">
		<xsl:param name="POS" />

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>Сведения об уточняемых земельных участках</xsl:text>
				</span>
			</td>
		</tr>

		<xsl:for-each
			select="//ExistParcel | //ExistEZ/ExistEZParcels | //ExistEZEntryParcels/ExistEZEntryParcel">
			<xsl:call-template name="ExistParcel">
				<xsl:with-param name="cn" select='@CadastralNumber' />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>


	<!-- ****** Раздел "Сведения об образуемых земельных участках" ************** -->
	<xsl:template name="FormParcels">
		<xsl:param name="POS" />

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>Сведения об образуемых земельных участках</xsl:text>
				</span>
			</td>
		</tr>

		<xsl:for-each select="//FormParcels/NewParcel">
			<xsl:call-template name="FormParcel">
				<xsl:with-param name="def" select='@Definition' />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="//FormParcels/ChangeParcel">
			<xsl:call-template name="ChangeParcel">
				<xsl:with-param name="cn" select='@CadastralNumber' />
				<xsl:with-param name="POS" select='$POS' />
			</xsl:call-template>
		</xsl:for-each>



	</xsl:template>

	<!-- ******* Сведения об образуеммом земельных участках ******************** -->
	<xsl:template name="FormParcel">
		<xsl:param name="def" />
		<!-- <br /> <xsl:text>Template Package/ExistParcel</xsl:text> <xsl:variable name="CN" select="@CadastralNumber" /> <xsl:value-of 
			select="$CN" /> -->
		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>1. Сведения о характерных точках границ образуемых земельных участков </xsl:text>

				</span>
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Обозначение земельного участка-</xsl:text>
							<xsl:value-of select="$def" />
						</span>
					</td>

				</tr>

				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Зона № -</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="1">
							<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
							<xsl:call-template name="Table_ES_New_header">
							</xsl:call-template>

							<xsl:if test="EntitySpatial!=''">
								<xsl:for-each select="EntitySpatial/SpatialElement">
									<xsl:for-each select="SpelementUnit">
										<xsl:call-template name="SpelementItemOldNew">
										</xsl:call-template>

									</xsl:for-each>
								</xsl:for-each>
							</xsl:if>

							<xsl:if test="Contours!=' '">
								<xsl:for-each select="Contours/NewContour">
									<xsl:call-template name="newContour"></xsl:call-template>
								</xsl:for-each>
							</xsl:if>

						</table>
					</td>
				</tr>
			</td>
		</tr>




		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>2. Сведения о частях границ образуемых земельных участков 
					 </xsl:text>

				</span>
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Обозначение земельного участка </xsl:text>
							<xsl:value-of select="$def" />
						</span>
					</td>

				</tr>

				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Зона № -</xsl:text>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="2">
							<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
							<xsl:call-template name="Table_Borders_header">
							</xsl:call-template>

							<xsl:if test="EntitySpatial!=''">
								<xsl:call-template name="NewContourBorders">
								</xsl:call-template>
							</xsl:if>

							<xsl:if test="Contours!=' '">
								<xsl:for-each select="Contours/NewContour">
									<tr>
										<td align="center" colspan="4">
											<xsl:value-of select="@Definition" />
										</td>

									</tr>

									<xsl:call-template name="NewContourBorders">
									</xsl:call-template>

								</xsl:for-each>
							</xsl:if>

						</table>
					</td>
				</tr>

			</td>
		</tr>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>4. Общие сведения об образуемом земельном участке</xsl:text>
					<xsl:value-of select="@CadastralNumber" />
				</span>
				<tr>
					<td>
						<span style="font-weight:bold">
							<xsl:text>Обозначение земельного участка </xsl:text>
							<xsl:value-of select="$def" />
						</span>
					</td>

				</tr>
				<tr>
					<td>
						<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">
							<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" />   </xsl:attribute>
							<tr>
								<td width="5%" align="center">
									<xsl:text>№ п/п</xsl:text>
								</td>
								<td width="65%" align="center">
									<xsl:text>Наименование характеристик земельного участка</xsl:text>
								</td>
								<td width="30%" align="center">
									<xsl:text>Значение характеристики</xsl:text>

								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>1</xsl:text>
								</td>
								<td align="center">
									<xsl:text>2</xsl:text>
								</td>
								<td align="center">
									<xsl:text>3</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>1 </xsl:text>
								</td>
								<td>Адрес земельного участка или
									описание его
									местоположения</td>
								<td>

									<xsl:variable name="AddressOrLocation" select="Address/@AddressOrLocation" />

									<xsl:if test="$AddressOrLocation=0">
										<xsl:text> - </xsl:text>
									</xsl:if>

								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>2 </xsl:text>
								</td>
								<td>Местоположение земельного
									участка в
									структурированном виде
									в
									соответствии с федеральной
									информационной
									адресной
									системой
									(при отсутствии
									адреса
									земельного участка)</td>
								<td>
									<xsl:value-of select="Address/Other" />
									,
									<xsl:variable name="var0" select="document('schema/dRegionsRF_v01.xsd')" />
									<xsl:variable name="kod0" select="Address/Region" />
									<xsl:value-of select="$var0//xs:enumeration[@value=$kod0]/xs:annotation/xs:documentation" />
									<xsl:text>, </xsl:text>
									<xsl:value-of select="Address/District/@Name" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="Address/District/@Type" />

									<xsl:text>, </xsl:text>

									<xsl:value-of select="Address/Locality/@Name" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="Address/Locality/@Type" />


								</td>
							</tr>


							<tr>
								<td>
									<xsl:text>3</xsl:text>
								</td>
								<td>Категория земель</td>
								<td>
									<xsl:variable name="var0" select="document('schema/dCategories_v01.xsd')" />
									<xsl:variable name="kod0" select="Category/@Category" />
									<xsl:value-of select="$var0//xs:enumeration[@value=$kod0]/xs:annotation/xs:documentation" />
								</td>
							</tr>

							<tr>
								<td>
									<xsl:text>4</xsl:text>
								</td>
								<td>Вид разрешенного
									использования</td>
								<td>
									<xsl:value-of select="Utilization/@ByDoc" />
								</td>
							</tr>

							<tr>
								<td>
									<xsl:text>5</xsl:text>
								</td>
								<td>
									<xsl:text>Площадь земельного участка ± величина погрешности определения площади (Р ± ΔР), м2 </xsl:text>
								</td>
								<td align="center">
									<xsl:value-of select="Area/Area" />
									±
									<xsl:value-of select="Area/Inaccuracy" />
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>6</xsl:text>
								</td>
								<td>
									<xsl:text>Предельный минимальный и максимальный размер земельного участка (Pмин) и (Pмакс), м2 </xsl:text>
								</td>
								<td align="center">
									<xsl:value-of select="AreaInGKN" />
									<xsl:if test="not(AreaInGKN)">
										<xsl:text>-</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>7</xsl:text>
								</td>
								<td>
									<xsl:text>Кадастровый или иной номер здания, сооружения, объекта незавершенного строительства,
										расположенного на земельном участке</xsl:text>
								</td>
								<td align="center">

									<xsl:text>-</xsl:text>

								</td>
							</tr>

							<tr>
								<td>
									<xsl:text>8</xsl:text>
								</td>
								<td>
									<xsl:text>Условный номер земельного участка
									Учетный номер проекта межевания территории 
									Реестровый номер границ
									
									
									 </xsl:text>
								</td>
								<td align="center">
									-
								</td>
							</tr>


							<tr>
								<td>
									<xsl:text>9</xsl:text>
								</td>
								<td>
									<xsl:text>Иные сведения </xsl:text>
								</td>
								<td align="center">
									-
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</td>
		</tr>

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>5. Сведения о земельных участках, смежных с образуемым земельным участком с обозначением  </xsl:text>
					<xsl:value-of select="$def" />

				</span>
				<tr>
					<td>
						<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">

							<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute>

							<td width="10%" align="center">
								<xsl:text>Обозначение характерной точки или части границ</xsl:text>
							</td>
							<td width="35%" align="center">
								<xsl:text>Кадастровые номера земельных участков, смежных с образуемым земельным участком</xsl:text>
							</td>
							<td width="35%" align="center">
								<xsl:text>Сведения о правообладателях смежных земельных участков</xsl:text>

							</td>

							<tr>
								<td align="center">
									<xsl:text>1</xsl:text>
								</td>
								<td align="center">
									<xsl:text>2</xsl:text>
								</td>
								<td align="center">
									<xsl:text>3</xsl:text>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</td>
		</tr>
	</xsl:template>

	<!-- ****** Сведения об измененных земельных участках и их частях ********* -->
	<xsl:template name="ChangeParcel">
		<xsl:param name="POS" />
		<xsl:param name="cn" />
		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>Сведения об измененных земельных участках и их частях</xsl:text>
				</span>
			</td>
		</tr>

		<xsl:for-each select="//FormParcels/ChangeParcel">
			<!-- <xsl:call-template name="FormParcel"> <xsl:with-param name="def" select='@Definition' /> </xsl:call-template> -->
			<tr>
				<td align="center">
					<span style="font-weight:bold">
						<xsl:text>1. Общие сведения об измененных земельных участках </xsl:text>

					</span>
					<tr>
						<td align="center">
							<span style="font-weight:bold">
								<xsl:text>Кадастровый номер земельного участка  </xsl:text>
								<xsl:value-of select="$cn" />
							</span>
						</td>
					</tr>
					<tr>
						<td>

							<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">

								<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute>

								<td width="10%" align="center">
									<xsl:text>No п/п</xsl:text>
								</td>
								<td width="60%" align="center">
									<xsl:text>Наименование характеристик земельного участка</xsl:text>
								</td>
								<td width="30%" align="center">
									<xsl:text>Значение характеристики</xsl:text>

								</td>

								<tr>
									<td align="center">
										<xsl:text>1</xsl:text>
									</td>
									<td align="center">
										<xsl:text>2</xsl:text>
									</td>
									<td align="center">
										<xsl:text>3</xsl:text>
									</td>
								</tr>
								<tr>
									<td>1
									</td>
									<td>
										<xsl:text>
									Кадастровые номера земельных участков, исключаемых из состава измененного земельного участка,
									представляющего собои единое землепользование</xsl:text>
									</td>
									<td>
										<xsl:for-each select="//DeleteEntryParcels/DeleteEntryParcel">
											<xsl:value-of select="@CadastralNumber" />
											<br />
										</xsl:for-each>
									</td>
								</tr>

								<tr>
									<td>2</td>
									<td>
										<xsl:text> Кадастровый номер входящего в состав земельного участка, 
										представляющего собой единое землепользование (номер контура многоконтурного земельного участка), 
										преобразование которого осуществляется</xsl:text>
									</td>
									<td>
										<xsl:for-each select="//TransformationEntryParcels/TransformationEntryParcel">
											<xsl:value-of select="@CadastralNumber" />
											<br />
										</xsl:for-each>
									</td>
								</tr>

								<tr>
									<td>3</td>
									<td>
										<xsl:text> Кадастровый или иной номер объекта недвижимости, 
										расположенного на земельном участке</xsl:text>
									</td>
									<td>-</td>
								</tr>
								<tr>
									<td>4</td>
									<td>
										<xsl:text> Иные сведения</xsl:text>
									</td>
									<td>-</td>
								</tr>
							</table>

						</td>
					</tr>
				</td>
			</tr>

		</xsl:for-each>
	</xsl:template>


	<xsl:template name="ProvidingPass">

		<tr>
			<td align="center">
				<span style="font-weight:bold">
					<xsl:text>Сведения об обеспечении доступа (прохода или проезда от земель общего пользования, 
					земельных участков общего пользования, территории общего пользования) к образуемым или измененным 
					земельным участкам</xsl:text>
				</span>
			</td>
		</tr>

		<tr>
			<td>

				<table style="WIDTH: 100%" border="1" cellspacing="0" padding="5" cellpadding="5">

					<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute>

					<td width="10%" align="center">
						<xsl:text>No п/п</xsl:text>
					</td>
					<td width="60%" align="center">
						<xsl:text>Кадастровый номер или обозначение земельного участка, для которого обеспечивается доступ</xsl:text>
					</td>
					<td width="30%" align="center">
						<xsl:text>Сведения о земельных участках (землях общего пользования, территории общего пользования), 
						посредством которых обеспечивается доступ</xsl:text>

					</td>

					<tr>
						<td align="center">
							<xsl:text>1</xsl:text>
						</td>
						<td align="center">
							<xsl:text>2</xsl:text>
						</td>
						<td align="center">
							<xsl:text>3</xsl:text>
						</td>
					</tr>
					<tr>
						<!-- ProvidingPassCadastralNumbers/Other <xsl:if test="Other!=''"> <xsl:text>земли общего пользования</xsl:text> </xsl:if> -->
										<tr>
						<td align="center">
							<xsl:text>-</xsl:text>
						</td>
						<td align="center">
							<xsl:text>-</xsl:text>
						</td>
						<td align="center">
							<xsl:text>-</xsl:text>
						</td>
					</tr>
					
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>

	<!-- <xsl:template name="Main_Reestr_Contractors"> <p /> <table align="center" cellspacing="0" cellpadding="2" border="1" 
		bgcolor="#eeeeee"> <xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute> <tr> <td> <p align="center"> 
		<span style="font-weight:bold"> <xsl:text>ИСПОЛНИТЕЛИ РАБОТ</xsl:text> </span> </p> </td> </tr> <xsl:for-each select="Reestr_Contractor"> 
		<tr> <td> <table style="WIDTH: 100%"> <xsl:call-template name="Table4" /> <xsl:choose> <xsl:when test="Cadastral_Engineer"> 
		<tr> <td colspan="4"> <span style="font-weight:bold"> <xsl:text>Кадастровый инженер</xsl:text> </span> </td> </tr> <tr> <td> 
		<span> <xsl:text>Идентификатор</xsl:text> </span> </td> <td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param 
		name="siz" select="75" /> <xsl:with-param name="val" select="Cadastral_Engineer/GUID_UL" /> </xsl:call-template> </td> </tr> 
		<tr> <td> <span> <xsl:text>Фамилия</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" 
		select="25" /> <xsl:with-param name="val" select="Cadastral_Engineer/FIO/Surname" /> </xsl:call-template> </td> <td> <span> 
		<xsl:text>Имя</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> 
		<xsl:with-param name="val" select="Cadastral_Engineer/FIO/First" /> </xsl:call-template> </td> </tr> <tr> <td> <span> <xsl:text>Отчество</xsl:text> 
		</span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" 
		select="Cadastral_Engineer/FIO/Patronymic" /> </xsl:call-template> </td> <td> <span> <xsl:text>Номер диплома</xsl:text> </span> 
		</td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Cadastral_Engineer/N_Certificate" 
		/> </xsl:call-template> </td> </tr> <xsl:if test="Cadastral_Engineer/Telephone or Cadastral_Engineer/E_mail"> <tr> <td> <span> 
		<xsl:text>Телефон</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" 
		/> <xsl:with-param name="val" select="Cadastral_Engineer/Telephone" /> </xsl:call-template> </td> <td> <span> <xsl:text>E-mail</xsl:text> 
		</span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" 
		select="Cadastral_Engineer/E_mail" /> </xsl:call-template> </td> </tr> </xsl:if> <xsl:if test="Cadastral_Engineer/Address 
		or Cadastral_Engineer/GUID_UL"> <tr> <td> <span> <xsl:text>Адрес</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Cadastral_Engineer/Address" /> </xsl:call-template> 
		</td> <td> <span> <xsl:text>Идентификатор кадастровой организации</xsl:text> </span> </td> <td> <xsl:call-template name="TextBox"> 
		<xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Cadastral_Engineer/GUID_UL" /> </xsl:call-template> 
		</td> </tr> </xsl:if> </xsl:when> <xsl:when test="Cadastral_Organization"> <tr> <td colspan="4"> <span style="font-weight:bold"> 
		<xsl:text>Кадастровая организация</xsl:text> </span> </td> </tr> <tr> <td> <span> <xsl:text>Идентификатор</xsl:text> </span> 
		</td> <td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="75" /> <xsl:with-param name="val" 
		select="Cadastral_Organization/GUID_UL" /> </xsl:call-template> </td> </tr> <tr> <td> <span> <xsl:text>Наименование</xsl:text> 
		</span> </td> <td> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" 
		select="Cadastral_Organization/Name" /> </xsl:call-template> </td> <td> <span> <xsl:text>ИНН</xsl:text> </span> </td> <td> 
		<xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="25" /> <xsl:with-param name="val" select="Cadastral_Organization/INN" 
		/> </xsl:call-template> </td> </tr> </xsl:when> </xsl:choose> </table> </td> </tr> </xsl:for-each> </table> </xsl:template> -->
	<!-- <xsl:template name="Main_Data"> <p /> <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee"> 
		<xsl:attribute name="width"> <xsl:value-of select="$TableWidth" /> </xsl:attribute> <tr> <td align="center"> <a href="#"> 
		<xsl:attribute name="onclick"> <xsl:text>DoXslt("Contractor",0);</xsl:text> </xsl:attribute> <span style="font-weight:bold"> 
		<xsl:text>ОБЩИЕ СВЕДЕНИЯ</xsl:text> </span> </a> </td> </tr> <tr> <td> <table style="WIDTH: 100%"> <xsl:call-template name="Table4" 
		/> <xsl:if test="//Title/Reason!=''"> <tr> <td> <span> <xsl:text>Вид кадастровых работ</xsl:text> </span> </td> <td colspan="3"> 
		<xsl:call-template name="Textarea"> <xsl:with-param name="val" select="//Title/Reason" /> </xsl:call-template> </td> </tr> 
		</xsl:if> <xsl:if test="//Title/Purpose!=''"> <tr> <td> <span> <xsl:text>Цель кадастровых работ</xsl:text> </span> </td> 
		<td colspan="3"> <xsl:call-template name="TextBox"> <xsl:with-param name="siz" select="75" /> <xsl:with-param name="val" 
		select="//Purpose" /> </xsl:call-template> </td> </tr> </xsl:if> </table> </td> </tr> </table> </xsl:template> -->

	<xsl:template name="Main_Contractor">
		<p />
		<table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
			<xsl:attribute name="width">
        <xsl:value-of select="$TableWidth" />
      </xsl:attribute>
			<xsl:call-template name="Contractor" />
		</table>
	</xsl:template>




	<!-- ************** Пакет *************** -->
	<xsl:template name="Package">
		<!-- Уточняеымые -->
		<xsl:for-each select="//SpecifyParcels | //SpecifyParcel">
			<xsl:call-template name="Main_SpecifyParcels">
				<xsl:with-param name="POS" select="position()" />
			</xsl:call-template>
		</xsl:for-each>

		<!-- Образуемые -->
		<xsl:for-each select="//FormParcels">
			<xsl:call-template name="FormParcels">
				<xsl:with-param name="POS" select="position()" />
			</xsl:call-template>
		</xsl:for-each>

	</xsl:template>


	<!-- Главная страница -->
	<xsl:template name="Main">
		<table align="center" cellspacing="0" cellpadding="2" border="4" bgcolor="#eeeeee">
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


					<xsl:for-each select="//GeneralCadastralWorks">
						<xsl:call-template name="GeneralCadastralWorks" />
					</xsl:for-each>



					<xsl:for-each select="//eDocument">
						<!--Реализовано для 1-3 форм, в 4 выводит корректно -->
						<xsl:call-template name="Main_eDocument" />
					</xsl:for-each>

					<xsl:for-each select="//InputData">

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
						<!--Реализовано для 1-4 форм <xsl:for-each select="//Package"> <xsl:call-template name="Main_NewSubParcel" /> </xsl:for-each> -->
					</xsl:if>



					<xsl:if test="'03' >= //eDocument/@Version">
						<xsl:for-each select="//Contractor">
							<!--Работает для 1-4 форм -->
							<xsl:call-template name="Main_Contractor" />
						</xsl:for-each>
						<xsl:for-each select="//CoordSystems">
							<!--Работает для 1-4 форм -->
							<xsl:call-template name="Main_Coord_Systems" />
						</xsl:for-each>
					</xsl:if>




					<xsl:call-template name="ProvidingPass">
					</xsl:call-template>


					<!--Заключение -->
					<xsl:for-each select="//Conclusion">
						<xsl:call-template name="Conclusion" />
					</xsl:for-each>

					<!-- Графическая часть -->
					<xsl:call-template name="Schemas">
						<!-- <xsl:with-param name="pos" "select="position()""/> <xsl:with-param name="path" select="/"/> <xsl:with-param name="part" 
							select="/"/> -->
					</xsl:call-template>

					<xsl:for-each select="//Appendix">
						<xsl:call-template name="Appendix" />
					</xsl:for-each>
				</td>
			</tr>
		</table>

	</xsl:template>


	<!-- Root of document -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Межевой план (c7.centos)</title>
			</head>
			<!-- Redefine variables: <xsl:variable name="TableWidth" select="250" /> <xsl:variable name="ppp" select="0" /> <xsl:variable 
				name="ttt" select="''" /> <xsl:text> TableWidth = </xsl:text> <xsl:value-of select="$TableWidth" /> -->
			<xsl:call-template name="Main" />
			<xsl:call-template name="Footer" />
		</html>
	</xsl:template>

	<!-- Unsere podval, footer -->
	<xsl:template name="Footer">
		<footer>
			<p>
				Версия V
				<xsl:value-of select="//MP/@Version" />
				<br />
				NameSoftware
				<xsl:value-of select="//MP/@NameSoftware" />
				, v
				<xsl:value-of select="//MP/@VersionSoftware" />
				<br />

				<xsl:value-of select="//MP/@GUID" />
				<br />

				MP V06 Stylesheet v1.048
				<br />

				@2018 Fixosoft
				<a href='mailto:home153@mail.ru'> Send feedback </a>
			</p>
		</footer>
	</xsl:template>

</xsl:stylesheet>




