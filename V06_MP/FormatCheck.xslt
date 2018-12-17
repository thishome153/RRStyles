<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="Reg">
    <xsl:param name="code"/>
    <xsl:choose>
      <xsl:when test="$code = 'nwo'">
        <xsl:value-of select="'Учет ОКС до 2012'"/>
      </xsl:when>
      <xsl:when test="$code = 'cho'">
        <xsl:value-of select="'Изменение ОКС (до 2012)'"/>
      </xsl:when>
      <xsl:when test="$code = 'sto'">
        <xsl:value-of select="'Ликвидация ОКС (до 2012)'"/>
      </xsl:when>
      <xsl:when test="$code = 'exo'">
        <xsl:value-of select="'Сведения об ОКС (до 2012)'"/>
      </xsl:when>
      <xsl:when test="$code = 'nwh'">
        <xsl:value-of select="'Учет ОКС'"/>
      </xsl:when>
      <xsl:when test="$code = 'chh'">
        <xsl:value-of select="'Изменение ОКС'"/>
      </xsl:when>
      <xsl:when test="$code = 'nwhm'">
        <xsl:value-of select="'Многокварт.дом'"/>
      </xsl:when>
      <xsl:when test="$code = 'sth'">
        <xsl:value-of select="'Акт обследования'"/>
      </xsl:when>
      <xsl:when test="$code = 'nwz'">
        <xsl:value-of select="'Учет ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'chz'">
        <xsl:value-of select="'Изменение ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'stz'">
        <xsl:value-of select="'Ликвидация ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'exh'">
        <xsl:value-of select="'Сведения об ОКС'"/>
      </xsl:when>
      <xsl:when test="$code = 'exz'">
        <xsl:value-of select="'Сведения о ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'ext'">
        <xsl:value-of select="'КПТ'"/>
      </xsl:when>
      <xsl:when test="$code = 'exr'">
        <xsl:value-of select="'Сведения ЕГРН'"/>
      </xsl:when>
      <xsl:when test="$code = 'exs'">
        <xsl:value-of select="'Кад.справка'"/>
      </xsl:when>
      <xsl:when test="$code = 'exc'">
        <xsl:value-of select="'Копии док.'"/>
      </xsl:when>
      <xsl:when test="$code = 'tst'">
        <xsl:value-of select="'Тест'"/>
      </xsl:when>
      <xsl:when test="$code = 'ArchiveRequest'">
        <xsl:value-of select="'Дубликаты'"/>
      </xsl:when>
      <xsl:when test="$code = 'add'">
        <xsl:value-of select="'Доп.документы'"/>
      </xsl:when>
      <xsl:when test="$code = 'cor'">
        <xsl:value-of select="'Тех.ошибка'"/>
      </xsl:when>
      <xsl:when test="$code = 'pra'">
        <xsl:value-of select="'Ранее учтенные'"/>
      </xsl:when>
      <xsl:when test="$code = 'kais'">
        <xsl:value-of select="'Кад.изменения'"/>
      </xsl:when>
      <xsl:when test="$code = 'cost'">
        <xsl:value-of select="'Кад.оценка'"/>
      </xsl:when>
      <xsl:when test="$code = 'zone'">
        <xsl:value-of select="'Установление границы/зоны'"/>
      </xsl:when>
      <xsl:when test="$code = 'chzone'">
        <xsl:value-of select="'Изменение границы/зоны'"/>
      </xsl:when>
      <xsl:when test="$code = 'arh'">
        <xsl:value-of select="'Архив ОТИ'"/>
      </xsl:when>
      <xsl:when test="$code = 'sign'">
        <xsl:value-of select="'Заверить ЭП'"/>
      </xsl:when>
      <xsl:when test="$code = 'schz'">
        <xsl:value-of select="'Схема ЗУ на КПТ'"/>
      </xsl:when>
      <xsl:when test="$code = 'cht'">
        <xsl:value-of select="'Карта-план территории'"/>
      </xsl:when>
      <xsl:when test="$code = 'irn'">
        <xsl:value-of select="'Сведения ФИР ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'irp'">
        <xsl:value-of select="'Сведения ФИР ЕГРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'irnp'">
        <xsl:value-of select="'Сведения ФГИС ЕГРН'"/>
      </xsl:when>
      <xsl:when test="$code = 'prjz'">
        <xsl:value-of select="'Проект межевания ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'nwr'">
        <xsl:value-of select="'Регистрация прав'"/>
      </xsl:when>
      <xsl:when test="$code = 'praf'">
        <xsl:value-of select="'Ранее учт. лесные участки'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$code"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="Pack">
    <xsl:param name="code"/>
    <xsl:choose>
      <xsl:when test="$code = 'startA'">
        <xsl:value-of select="'Запрос'"/>
      </xsl:when>
      <xsl:when test="$code = 'startO'">
        <xsl:value-of select="'Запрос в подразделение Росреестра'"/>
      </xsl:when>
      <xsl:when test="$code = 'payment'">
        <xsl:value-of select="'Подтверждение оплаты'"/>
      </xsl:when>
      <xsl:when test="$code = 'confirm-startA'">
        <xsl:value-of select="'Подтверждение оператора'"/>
      </xsl:when>
      <xsl:when test="$code = 'confirm-startO'">
        <xsl:value-of select="'Подтверждение оператора'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol'">
        <xsl:value-of select="'Служебный документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[?]'">
        <xsl:value-of select="'Протокол контроля'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[P]'">
        <xsl:value-of select="'Протокол контроля'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[N]'">
        <xsl:value-of select="'Протокол контроля'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[?]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[P]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[N]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[?]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[P]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[N]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[?]'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[P]'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[N]'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2[?]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2[P]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2[N]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2P'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2N'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'receipt'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$code"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="Doc">
    <xsl:param name="code"/>
    <xsl:choose>
      <xsl:when test="$code = 'InvalidData'">
        <xsl:value-of select="'Документ поврежден'"/>
      </xsl:when>
      <xsl:when test="$code = 'Print'">
        <xsl:value-of select="'Версия для печати'"/>
      </xsl:when>
      <xsl:when test="$code = 'Denial'">
        <xsl:value-of select="'Отправка пакета возможна ПРИ УСЛОВИИ...'"/>
      </xsl:when>
      <xsl:when test="$code = 'ArchiveRequest'">
        <xsl:value-of select="'Запрос дубликатов'"/>
      </xsl:when>
      <xsl:when test="$code = 'Test'">
        <xsl:value-of select="'Тестовый документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'Application'">
        <xsl:value-of select="'Образы документов'"/>
      </xsl:when>
      <xsl:when test="$code = 'Register_Realty'">
        <xsl:value-of select="'Технический паспорт'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_MP'">
        <xsl:value-of select="'Межевой план'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_MP01'">
        <xsl:value-of select="'Межевой план, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_MP02'">
        <xsl:value-of select="'Межевой план, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_MP03'">
        <xsl:value-of select="'Межевой план, версия 03'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_MP04'">
        <xsl:value-of select="'Межевой план, версия 04'"/>
      </xsl:when>
      <xsl:when test="$code = 'MP05'">
        <xsl:value-of select="'Межевой план, версия 05'"/>
      </xsl:when>
      <xsl:when test="$code = 'MP06'">
        <xsl:value-of select="'Межевой план, версия 06'"/>
      </xsl:when>
      <xsl:when test="$code = 'MP08'">
        <xsl:value-of select="'Межевой план, версия 08'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_TP01'">
        <xsl:value-of select="'Технический план, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_TP02'">
        <xsl:value-of select="'Технический план, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_TP03'">
        <xsl:value-of select="'Технический план, версия 03'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_TP06'">
        <xsl:value-of select="'Технический план, версия 06'"/>
      </xsl:when>
      <xsl:when test="$code = 'TPLinear'">
        <xsl:value-of select="'Технический план линейного сооружения'"/>
      </xsl:when>
      <xsl:when test="$code = 'TPLinearPart'">
        <xsl:value-of select="'Технический план условной части линейного сооружения'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_KAIS'">
        <xsl:value-of select="'Заявление: Изменение характеристик объектов, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'KAIS03'">
        <xsl:value-of select="'Заявление: Изменение характеристик объектов, версия 03'"/>
      </xsl:when>
      <xsl:when test="$code = 'KAIS05'">
        <xsl:value-of select="'Заявление: Изменение характеристик объектов, версия 05'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_Cadastral_Cost'">
        <xsl:value-of select="'Результаты кадастровой оценки'"/>
      </xsl:when>
      <xsl:when test="$code = 'Cadastral_Cost_Dictionary'">
        <xsl:value-of select="'Удельные показатели кадастровой стоимости'"/>
      </xsl:when>
      <xsl:when test="$code = 'SIGN'">
        <xsl:value-of select="'Список документов'"/>
      </xsl:when>
      <xsl:when test="$code = 'sign'">
        <xsl:value-of select="'ЭП'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_BND'">
        <xsl:value-of select="'Заявление: Границы, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'BND03'">
        <xsl:value-of select="'Заявление: Границы, версия 03'"/>
      </xsl:when>
      <xsl:when test="$code = 'STD_ZONE'">
        <xsl:value-of select="'Заявление: Зоны, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'ZONE03'">
        <xsl:value-of select="'Заявление: Зоны, версия 03'"/>
      </xsl:when>
      <xsl:when test="$code = 'ZONE05'">
        <xsl:value-of select="'Заявление: Зоны, версия 05'"/>
      </xsl:when>
      <xsl:when test="$code = 'MapPlan'">
        <xsl:value-of select="'Карта (план)'"/>
      </xsl:when>
      <xsl:when test="$code = 'Map-Plan'">
        <xsl:value-of select="'Карта-план'"/>
      </xsl:when>
      <xsl:when test="$code = 'TerritoryToGKN'">
        <xsl:value-of select="'Границы территории'"/>
      </xsl:when>
      <xsl:when test="$code = 'Archive_OTI'">
        <xsl:value-of select="'Архив ОТИ'"/>
      </xsl:when>
      <xsl:when test="$code = 'OKS'">
        <xsl:value-of select="'Акт обследования, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'OKS2'">
        <xsl:value-of select="'Акт обследования, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'ActForest'">
        <xsl:value-of select="'Акт о внесении сведений о ранее учтенных лесных участках'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty'">
        <xsl:value-of select="'Заявление'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty11'">
        <xsl:value-of select="'Заявление, версия 11'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty12'">
        <xsl:value-of select="'Заявление, версия 12'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty14'">
        <xsl:value-of select="'Заявление, версия 14'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty15'">
        <xsl:value-of select="'Заявление, версия 15'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty17'">
        <xsl:value-of select="'Заявление, версия 17'"/>
      </xsl:when>
      <xsl:when test="$code = 'Requests_GZK_Realty18'">
        <xsl:value-of select="'Заявление, версия 18'"/>
      </xsl:when>
      <xsl:when test="$code = 'Request_Reestr04'">
        <xsl:value-of select="'Заявление, версия 04'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestReestr06'">
        <xsl:value-of select="'Обращение, версия 06'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestGRP'">
        <xsl:value-of select="'Заявление, версия 1.16'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestGRP2'">
        <xsl:value-of select="'Заявление, версия 2.00'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestGKN'">
        <xsl:value-of select="'Заявление, версия 1.03'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestGKN03'">
        <xsl:value-of select="'Заявление, версия 3.09'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestGKN04'">
        <xsl:value-of select="'Заявление, версия 4.05'"/>
      </xsl:when>
      <xsl:when test="$code = 'StatementGKN'">
        <xsl:value-of select="'Заявление, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'Statement'">
        <xsl:value-of select="'Заявление (ЕГРН), версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'RequestEGRN'">
        <xsl:value-of select="'Заявление (ЕГРН), версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'ReqDescription'">
        <xsl:value-of select="'Описание пакета'"/>
      </xsl:when>
      <xsl:when test="$code = 'StatementGRP'">
        <xsl:value-of select="'Заявление, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'ChangeGRP'">
        <xsl:value-of select="'Заявление, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'SuspensionGRP'">
        <xsl:value-of select="'Заявление, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'Act'">
        <xsl:value-of select="'Акт обследования'"/>
      </xsl:when>
      <xsl:when test="$code = 'SchemeZUnaKPT'">
        <xsl:value-of select="'Схема расположения ЗУ на КПТ, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'SchemeZUnaKPT2'">
        <xsl:value-of select="'Схема расположения ЗУ на КПТ, версия 02'"/>
      </xsl:when>
      <xsl:when test="$code = 'MapPlanTer'">
        <xsl:value-of select="'Карта-план территории'"/>
      </xsl:when>
      <xsl:when test="$code = 'MapPlan01'">
        <xsl:value-of select="'Карта-план территории, версия 01'"/>
      </xsl:when>
      <xsl:when test="$code = 'ProjMZU'">
        <xsl:value-of select="'Проект межевания земельных участков'"/>
      </xsl:when>
      <xsl:when test="$code = 'startO'">
        <xsl:value-of select="'Запрос в подразделение Росреестра'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[?]'">
        <xsl:value-of select="'Протокол контроля ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[P]'">
        <xsl:value-of select="'Протокол контроля ОРП - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol[N]'">
        <xsl:value-of select="'Протокол контроля ОРП - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'proto[?]'">
        <xsl:value-of select="'Протокол контроля'"/>
      </xsl:when>
      <xsl:when test="$code = 'proto[P]'">
        <xsl:value-of select="'Протокол контроля'"/>
      </xsl:when>
      <xsl:when test="$code = 'proto[N]'">
        <xsl:value-of select="'Протокол контроля - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoR[?]'">
        <xsl:value-of select="'Протокол контроля ПК Регистратор'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoR[P]'">
        <xsl:value-of select="'Протокол контроля ПК Регистратор - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoR[N]'">
        <xsl:value-of select="'Протокол контроля ПК Регистратор - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoP[?]'">
        <xsl:value-of select="'Протокол контроля портала'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoP[P]'">
        <xsl:value-of select="'Протокол контроля портала - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protoP[N]'">
        <xsl:value-of select="'Протокол контроля портала - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolR[?]'">
        <xsl:value-of select="'Протокол загрузки заявления в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolR[P]'">
        <xsl:value-of select="'Протокол загрузки заявления в АИС ГКН - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolR[N]'">
        <xsl:value-of select="'Протокол загрузки заявления в АИС ГКН - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolOKS[?]'">
        <xsl:value-of select="'Протокол загрузки технического паспорта в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolOKS[P]'">
        <xsl:value-of select="'Протокол загрузки технического паспорта в АИС ГКН - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolOKS[N]'">
        <xsl:value-of select="'Протокол загрузки технического паспорта в АИС ГКН - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolMP[?]'">
        <xsl:value-of select="'Протокол загрузки межевого плана в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolMP[P]'">
        <xsl:value-of select="'Протокол загрузки межевого плана в АИС ГКН - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocolMP[N]'">
        <xsl:value-of select="'Протокол загрузки межевого плана в АИС ГКН - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[?]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[P]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'protocol2[N]'">
        <xsl:value-of select="'Расписка'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[?]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[P]'">
        <xsl:value-of select="'Ответ ОРП - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer[N]'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer0[?]'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer0[P]'">
        <xsl:value-of select="'Ответ - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer0[N]'">
        <xsl:value-of select="'Ответ - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[?]'">
        <xsl:value-of select="'Ответ'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[P]'">
        <xsl:value-of select="'Ответ - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer1[N]'">
        <xsl:value-of select="'Ответ - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2[P]'">
        <xsl:value-of select="'Ответ ОРП - положительный'"/>
      </xsl:when>
      <xsl:when test="$code = 'answer2[N]'">
        <xsl:value-of select="'Ответ ОРП - отрицательный'"/>
      </xsl:when>
      <xsl:when test="$code = 'decision'">
        <xsl:value-of select="'Решение ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'confirm'">
        <xsl:value-of select="'Подтверждение оператора'"/>
      </xsl:when>
      <xsl:when test="$code = 'payment'">
        <xsl:value-of select="'Подтверждение оплаты'"/>
      </xsl:when>
      <xsl:when test="$code = 'Scheme_Geodesic_Plotting'">
        <xsl:value-of select="'Схема геодезических построений'"/>
      </xsl:when>
      <xsl:when test="$code = 'Scheme_Disposition_Building'">
        <xsl:value-of select="'Схема расположения на ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'Scheme_Disposition_Parcels'">
        <xsl:value-of select="'Схема расположения земельных участков'"/>
      </xsl:when>
      <xsl:when test="$code = 'Diagram_Contour'">
        <xsl:value-of select="'Чертеж контура'"/>
      </xsl:when>
      <xsl:when test="$code = 'Diagram_Parcels_SubParcels'">
        <xsl:value-of select="'Чертеж земельных участков и их частей'"/>
      </xsl:when>
      <xsl:when test="$code = 'Agreement_Document'">
        <xsl:value-of select="'Акт согласования'"/>
      </xsl:when>
      <xsl:when test="$code = 'NodalPointSchemes'">
        <xsl:value-of select="'Абрис узловой точки границы земельного участка'"/>
      </xsl:when>
      <xsl:when test="$code = 'Appendix'">
        <xsl:value-of select="'Приложение'"/>
      </xsl:when>
      <xsl:when test="$code = 'Survey'">
        <xsl:value-of select="'Сведения об измерениях и расчетах'"/>
      </xsl:when>
      <xsl:when test="$code = 'InfoGKN'">
        <xsl:value-of select="'Запрос сведений ФИР ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'InfoEGRP'">
        <xsl:value-of select="'Запрос сведений ФИР ЕГРП'"/>
      </xsl:when>
      <xsl:when test="$code = 'InfoEGRN'">
        <xsl:value-of select="'Запрос сведений ФГИС ЕГРН'"/>
      </xsl:when>
      <xsl:when test="$code = 'docum'">
        <xsl:value-of select="'Документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'documHtml'">
        <xsl:value-of select="'Html-документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'documXml'">
        <xsl:value-of select="'Xml-документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'documMif'">
        <xsl:value-of select="'Архив c Mid/Mif-файлами'"/>
      </xsl:when>
      <xsl:when test="$code = 'documPdf'">
        <xsl:value-of select="'Документ в формате pdf'"/>
      </xsl:when>
      <xsl:when test="$code = 'documF'">
        <xsl:value-of select="'Документ, удостоверяющий личность физ. лица'"/>
      </xsl:when>
      <xsl:when test="$code = 'documJ'">
        <xsl:value-of select="'Документ юр. лица'"/>
      </xsl:when>
      <xsl:when test="$code = 'documFR'">
        <xsl:value-of select="'Документ, удостоверяющий личность правообладателя'"/>
      </xsl:when>
      <xsl:when test="$code = 'documJR'">
        <xsl:value-of select="'Документ организации-правообладателя'"/>
      </xsl:when>
      <xsl:when test="$code = 'documFD'">
        <xsl:value-of select="'Документ, удостоверяющий личность заявителя'"/>
      </xsl:when>
      <xsl:when test="$code = 'documJD'">
        <xsl:value-of select="'Документ организации-заявителя'"/>
      </xsl:when>
      <xsl:when test="$code = 'documFA'">
        <xsl:value-of select="'Документ, удостоверяющий личность доверенного лица'"/>
      </xsl:when>
      <xsl:when test="$code = 'documR'">
        <xsl:value-of select="'Документ, подтверждающий права'"/>
      </xsl:when>
      <xsl:when test="$code = 'documE'">
        <xsl:value-of select="'Документ по обременению'"/>
      </xsl:when>
      <xsl:when test="$code = 'documA'">
        <xsl:value-of select="'Прилагаемый документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'documP'">
        <xsl:value-of select="'Платежный документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'documS'">
        <xsl:value-of select="'Документ, удостоверяющий сведения'"/>
      </xsl:when>
      <xsl:when test="$code = 'documSO'">
        <xsl:value-of select="'Документ-основание'"/>
      </xsl:when>
      <xsl:when test="$code = 'planFlat'">
        <xsl:value-of select="'План помещения'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSub_Flat'">
        <xsl:value-of select="'План части помещения'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSub_Uncompleted_Construction'">
        <xsl:value-of select="'План части объекта незав.строит.'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSub_Building'">
        <xsl:value-of select="'План части здания'"/>
      </xsl:when>
      <xsl:when test="$code = 'plan'">
        <xsl:value-of select="'План'"/>
      </xsl:when>
      <xsl:when test="$code = 'planF'">
        <xsl:value-of select="'План помещения'"/>
      </xsl:when>
      <xsl:when test="$code = 'planF0'">
        <xsl:value-of select="'План помещения, не привязанного к этажу'"/>
      </xsl:when>
      <xsl:when test="$code = 'planS'">
        <xsl:value-of select="'План этажа'"/>
      </xsl:when>
      <xsl:when test="$code = 'planFB'">
        <xsl:value-of select="'План помещения в принадлежности-здании'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSB'">
        <xsl:value-of select="'План этажа в принадлежности-здании'"/>
      </xsl:when>
      <xsl:when test="$code = 'planFC'">
        <xsl:value-of select="'План помещения в принадлежности-сооружении'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSC'">
        <xsl:value-of select="'План этажа в принадлежности-сооружении'"/>
      </xsl:when>
      <xsl:when test="$code = 'planSC'">
        <xsl:value-of select="'План этажа в принадлежности-сооружении'"/>
      </xsl:when>
      <!-- Версия 14 и 15 и 17 -->
      <xsl:when test="$code = 'in558401000000'">
        <xsl:value-of select="'Правоустанавливающий документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558502020000'">
        <xsl:value-of select="'Иной документ'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558207000000'">
        <xsl:value-of select="'Документ (копия) о согласовании местоположения границ ЗУ'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558208000000'">
        <xsl:value-of
          select="'Документ (копия) о принадлежности ЗУ к определенной категории земель'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558209000000'">
        <xsl:value-of select="'Документ (копия) о разрешенном использованим земельного участка'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558401081200'">
        <xsl:value-of select="'Документ об ограничении вещных прав на объект в пользу заявителя'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558301010000'">
        <xsl:value-of select="'Доверенность'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558203000000'">
        <xsl:value-of select="'Межевой план'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558401070300'">
        <xsl:value-of select="'Декларация об объекте недвижимого имущества'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558214010000'">
        <xsl:value-of select="'Кадастровая выписка о земельном участке'"/>
      </xsl:when>
      <xsl:when test="$code = 'in558211010000'">
        <xsl:value-of select="'Технический план'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558213000000'">
        <xsl:value-of select="'Кадастровый паспорт объекта недвижимости'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558213010000'">
        <xsl:value-of select="'Кадастровый паспорт земельного участка'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558213020000'">
        <xsl:value-of select="'Кадастровый паспорт помещения'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558213030000'">
        <xsl:value-of
          select="'Кадастровый паспорт здания, сооружения, объекта незавершенного строительства'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558214000000'">
        <xsl:value-of select="'Кадастровая выписка об объекте недвижимости'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558214010000'">
        <xsl:value-of select="'Кадастровая выписка о земельном участке'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558215000000'">
        <xsl:value-of
          select="'Разрешение (копия) на ввод объекта капитального строительства в эксплуатацию'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558216000000'">
        <xsl:value-of
          select="'Документ (копия), подтверждающий изменение назначения здания или помещения'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558217000000'">
        <xsl:value-of select="'Кадастровый план территории'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558218000000'">
        <xsl:value-of select="'Кадастровая справка'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558219000000'">
        <xsl:value-of
          select="'Акт обследования, подтверждающий прекращение существования объекта недвижимости'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558220000000'">
        <xsl:value-of select="'Выписки из Реестра'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558220010000'">
        <xsl:value-of
          select="'Выписка из Реестра, содержащая сведения об объекте учета, относящиеся к информации ограниченного доступа'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558220020000'">
        <xsl:value-of select="'Выписка из реестра, содержащая сведения об объекте учета'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558220030000'">
        <xsl:value-of
          select="'Выписка из реестра, подтверждающая факт отсутствия в Реестре сведений об объекте учета'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558502020000'">
        <xsl:value-of select="'ПРОЧИЕ'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558221010000'">
        <xsl:value-of
          select="'Документы об исправлении кадастровой ошибки, направляемые в государственные органы'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558221020000'">
        <xsl:value-of select="'Иной документ, содержащий описание объекта недвижимости'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501000000'">
        <xsl:value-of select="'Документы о результатах кадастрового учета'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010000'">
        <xsl:value-of select="'Решение'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010100'">
        <xsl:value-of select="'Решение об отказе в предоставлении запрашиваемых сведений'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010200'">
        <xsl:value-of select="'Решение об отказе в исправлении кадастровой ошибки.'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010300'">
        <xsl:value-of select="'Решение об отказе в исправлении технической ошибки'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010400'">
        <xsl:value-of select="'Решение об исправлении технической и кадастровой ошибки'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010500'">
        <xsl:value-of select="'Решение об отказе в учете'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010600'">
        <xsl:value-of select="'Решение о приостановлении учета'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010700'">
        <xsl:value-of select="'Решение об отказе в снятии приостановления'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501010800'">
        <xsl:value-of
          select="'Решение о снятии с кадастрового учета земельных участков со статусом «временные» по заявлению заинтересованного лица'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501010900'">
        <xsl:value-of
          select="'Решение об отказе в выдаче кадастрового паспорта и выдаче вместо него кадастровой выписки'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501020000'">
        <xsl:value-of select="'УВЕДОМЛЕНИЯ'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501020100'">
        <xsl:value-of
          select="'Уведомление об отсутствии в государственном кадастре недвижимости запрашиваемых сведений'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501020200'">
        <xsl:value-of select="'Уведомление об осуществленном кадастровом учете'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501020300'">
        <xsl:value-of
          select="'Уведомление об отказе в приеме документов для внесения в ЕГРОКС сведений об ОКС'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501020400'">
        <xsl:value-of
          select="'Уведомление об отказе в приеме документов для предоставления из ЕГРОКС сведений об ОКС'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501020500'">
        <xsl:value-of select="'Уведомление об устранении технической ошибки в сведениях'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501020600'">
        <xsl:value-of select="'УВЕДОМЛЕНИЕ об отказе в выдаче сведений об ОКС'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501020700'">
        <xsl:value-of select="'Уведомление о приостановлении осуществления кадастрового учета'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501020800'">
        <xsl:value-of select="'Уведомление об отказе в осуществлении кадастрового учета'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501030000'">
        <xsl:value-of select="'ПРОЧИЕ'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501030100'">
        <xsl:value-of select="'Расписка в получении соответствующих документов для проведения ГКУ'"
        />
      </xsl:when>
      <xsl:when test="$code = 'out558501030200'">
        <xsl:value-of select="'Акт утверждения кадастровой стоимости'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558501030300'">
        <xsl:value-of select="'Иные документы'"/>
      </xsl:when>
      <xsl:when test="$code = 'out558401020800'">
        <xsl:value-of select="'Решение'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$code"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="ControlStage">
    <xsl:param name="code"/>
    <xsl:choose>
      <xsl:when test="$code = 'Decode'">
        <xsl:value-of select="'Расшифровка'"/>
      </xsl:when>
      <xsl:when test="$code = 'ArcUnPack'">
        <xsl:value-of select="'Распаковка архива'"/>
      </xsl:when>
      <xsl:when test="$code = 'Regulation'">
        <xsl:value-of select="'Поиск описания регламента'"/>
      </xsl:when>
      <xsl:when test="$code = 'ESign'">
        <xsl:value-of select="'Проверка корректности ЭП'"/>
      </xsl:when>
      <xsl:when test="$code = 'ESignInfo'">
        <xsl:value-of select="'Проверка корректности ЭП'"/>
      </xsl:when>
      <xsl:when test="$code = 'Docum'">
        <xsl:value-of select="'Проверка корректности документа'"/>
      </xsl:when>
      <xsl:when test="$code = 'DocumNumber'">
        <xsl:value-of select="'Проверка состава пакета'"/>
      </xsl:when>
      <xsl:when test="$code = 'OIDCheck'">
        <xsl:value-of select="'Контроль прав на доступ к виду регламента'"/>
      </xsl:when>
      <xsl:when test="$code = 'AttachFile'">
        <xsl:value-of select="'Проверка наличия вложенных файлов'"/>
      </xsl:when>
      <xsl:when test="$code = 'AttachNumber'">
        <xsl:value-of select="'Проверка количества вложенных файлов'"/>
      </xsl:when>
      <xsl:when test="$code = 'FromTo'">
        <xsl:value-of select="'Проверка заполнения полей сообщения'"/>
      </xsl:when>
      <xsl:when test="$code = 'Subject'">
        <xsl:value-of select="'Проверка корректности поля Subject'"/>
      </xsl:when>
      <xsl:when test="$code = 'AbonentBD'">
        <xsl:value-of select="'Поиск абонента в базе данных'"/>
      </xsl:when>
      <xsl:when test="$code = 'requestL'">
        <xsl:value-of select="'Автоматическая загрузка заявления в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'requestO'">
        <xsl:value-of select="'Автоматическая загрузка технического паспорта в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'requestM'">
        <xsl:value-of select="'Автоматическая загрузка межевого плана в АИС ГКН'"/>
      </xsl:when>
      <xsl:when test="$code = 'requestR'">
        <xsl:value-of select="'Прием заявления оператором ОРП'"/>
      </xsl:when>
      <!-- Портал -->
      <xsl:when test="$code = '000'">
        <xsl:value-of select="'Загрузка запроса на портал'"/>
      </xsl:when>
      <xsl:when test="$code = '001'">
        <xsl:value-of select="'Загрузка запроса на портал'"/>
      </xsl:when>
      <xsl:when test="$code = '0010'">
        <xsl:value-of select="'Проверка запроса на портале'"/>
      </xsl:when>
      <xsl:when test="$code = '002'">
        <xsl:value-of select="'Оплата'"/>
      </xsl:when>
      <xsl:when test="$code = '0021'">
        <xsl:value-of select="'Оплата'"/>
      </xsl:when>
      <xsl:when test="$code = '0045'">
        <xsl:value-of select="'Оплата'"/>
      </xsl:when>
      <xsl:when test="$code = '003'">
        <xsl:value-of select="'Проверка запроса на портале'"/>
      </xsl:when>
      <xsl:when test="$code = '004'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = '0040'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = '0041'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = '0042'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = '0043'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="$code = '0044'">
        <xsl:value-of select="'Ответ ОРП'"/>
      </xsl:when>
      <xsl:when test="substring($code,1,3) = '010'">
        <xsl:value-of select="'Обработка в подразделении Росреестра'"/>
      </xsl:when>
      <xsl:when test="substring($code,1,3) = '030'">
        <xsl:value-of select="'Обработка в ОРП'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$code"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
