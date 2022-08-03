﻿#language: ru

@tree

Функционал: Секция переменных

Переменные:
	//Импорт секции переменных из внешнего сценария
	//импорт "Переменные.feature"
	//Проверка открытия списка поступлений в разных языках интерфейса
	ЗаголовокФормыСпискаПоступления = '{!Metadata.Documents.PurchaseInvoice.ListPresentation}'
	ЗаголовокПодсистемаЗакупок = '{!Metadata.Subsystems.PurchaseAP.Synonym}'

*ПроверяемыеЗначения
	| 'Имя'                       | 'Представление'               | 'Значение' |
	| 'СуммаДокументаПоступления' | 'Сумма документа поступления' | '400,00'   |
			
	ИтоговаяСуммаОтчетаЗакупки = 'R16C3'

	СообщениеШтрихКодНеНайден = '{!R().S_019}'
	//Сообщение = '{NStr("en=""Barcode %1 not found.""; ru=""Шштрихкод %1 не найден.""")}'

//	МногострочнаяСтрока =
//	"""
//	ЧастьСтроки1
//	ЧастьСтроки2
//	"""

//Сценарий: Открытие формы списка ПТУ
//	И В командном интерфейсе я выбираю "ЗаголовокПодсистемаЗакупок" "ЗаголовокФормыСпискаПоступления"
	
//Сценарий: Проверка суммы ПТУ
//	И у элемента формы с именем "ItemListTotalTotalAmount" текст редактирования стал равен 'ПроверяемыеЗначения.СуммаДокументаПоступления.Значение'

//Сценарий: Проверка итоговой суммы отчета закупки
//	И в табличном документе 'Result' я перехожу к ячейке "ИтоговаяСуммаОтчетаЗакупки"

Сценарий: Проверка сообщения
	И Я запоминаю значение выражения 'StrTemplate($СообщениеШтрихКодНеНайден$, "123")' в переменную "ИмяПеременной2"
	Дано В последнем сообщении TestClient есть строка "$ИмяПеременной2$"
	
	