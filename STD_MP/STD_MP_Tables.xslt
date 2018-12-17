<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

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
			<td align="center" width="15%"> наружного знака пункта</td>
			<td align="center" width="15%"> центра знака </td>
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



</xsl:stylesheet>