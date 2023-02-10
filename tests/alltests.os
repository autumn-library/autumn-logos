#Использовать autumn
#Использовать asserts
#Использовать logos
#Использовать ".."
#Использовать "."

Перем мСообщенияЛога;
Перем ИмяФайла;

Процедура ПередЗапускомТеста() Экспорт

КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры

Функция ПодготовитьПоделку()
	Поделка = Новый Поделка();
	Поделка.ПросканироватьКаталог("tests/Классы");
	Возврат Поделка;
КонецФункции

Процедура ДобавитьСебяКакОбработчикаВывода(Лог)

	мСообщенияЛога = Новый Массив;
	Лог.ДобавитьСпособВывода(ЭтотОбъект);

КонецПроцедуры

Процедура Вывести(Знач Сообщение, УровеньСообщения) Экспорт
	мСообщенияЛога.Добавить(Сообщение);
КонецПроцедуры

Процедура Закрыть() Экспорт
	мСообщенияЛога = Неопределено;
КонецПроцедуры

&Тест
Процедура Должен_ПроверитьПолучениеЛоговРазнымиПластилинами() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");
	ЭкспортныйЛог = КонтейнерЛога.ЭкспортныйЛог;
	ДобавитьСебяКакОбработчикаВывода(ЭкспортныйЛог);
	ЭкспортныйЛог.УстановитьУровень(УровниЛога.Отладка);
	ЭкспортныйЛог.Информация("Запись лога");
	СообщениеЭкспортногоЛога = мСообщенияЛога[0];

	ПриватныйЛог = КонтейнерЛога.ПриватныйЛог();
	ДобавитьСебяКакОбработчикаВывода(ПриватныйЛог);
	ПриватныйЛог.УстановитьУровень(УровниЛога.Отладка);
	ПриватныйЛог.Информация("Запись лога");
	СообщениеПриватногоЛога = мСообщенияЛога[0];

	ЛогСеттером = КонтейнерЛога.ПолучитьЛогСеттером();
	ДобавитьСебяКакОбработчикаВывода(ЛогСеттером);
	ЛогСеттером.УстановитьУровень(УровниЛога.Отладка);
	ЛогСеттером.Информация("Запись лога");
	СообщениеЛогаСеттером = мСообщенияЛога[0];

	ЛогБезПрефикса = КонтейнерЛога.ЛогБезПрефикса;
	ДобавитьСебяКакОбработчикаВывода(ЛогБезПрефикса);
	ЛогБезПрефикса.УстановитьУровень(УровниЛога.Отладка);
	ЛогБезПрефикса.Информация("Запись лога");
	СообщениеЛогаБезПрефикса = мСообщенияЛога[0];

	ЛогБезИмениКласса = КонтейнерЛога.ЛогБезИмениКласса;
	ДобавитьСебяКакОбработчикаВывода(ЛогБезИмениКласса);
	ЛогБезИмениКласса.УстановитьУровень(УровниЛога.Отладка);
	ЛогБезИмениКласса.Информация("Запись лога");
	СообщениеЛогаБезИмениКласса = мСообщенияЛога[0];

	ЛогБезИмениКлассаСДебагом = КонтейнерЛога.ЛогБезИмениКлассаСДебагом;
	ДобавитьСебяКакОбработчикаВывода(ЛогБезИмениКлассаСДебагом);
	ЛогБезИмениКлассаСДебагом.УстановитьУровень(УровниЛога.Отладка);
	ЛогБезИмениКлассаСДебагом.Информация("Запись лога");
	СообщениеЛогаБезИмениКлассаСДебагом = мСообщенияЛога[0];

	ЛогСДебагом = КонтейнерЛога.ЛогСДебагом;
	ДобавитьСебяКакОбработчикаВывода(ЛогСДебагом);
	ЛогСДебагом.УстановитьУровень(УровниЛога.Отладка);
	ЛогСДебагом.Информация("Запись лога");
	СообщениеЛогаСДебагом = мСообщенияЛога[0];

	// Тогда
	Ожидаем.Что(ЭкспортныйЛог, "тип ЭкспортныйЛог").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЭкспортногоЛога, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [1.КонтейнерЛога] - Запись лога");
	
	Ожидаем.Что(ЛогСеттером, "тип ЛогСеттером").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаСеттером, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [3.КонтейнерЛога] - Запись лога");
	Ожидаем.Что(ЛогСеттером, "Логгерны не равны").Не_().Равно(ПриватныйЛог);

	Ожидаем.Что(ЛогБезПрефикса, "тип ЛогБезПрефикса").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаБезПрефикса, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [КонтейнерЛога] - Запись лога");
	Ожидаем.Что(ЛогБезПрефикса, "Логгерны не равны").Не_().Равно(ЭкспортныйЛог);

	Ожидаем.Что(ПриватныйЛог, "тип ПриватныйЛог").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(ЭкспортныйЛог, "Логгерны не равны").Не_().Равно(ПриватныйЛог);
	Ожидаем.Что(СообщениеПриватногоЛога, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [2.КонтейнерЛога] - Запись лога");

	Ожидаем.Что(ЛогБезИмениКласса, "тип ЛогБезИмениКласса").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаБезИмениКласса, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [4] - Запись лога");
	Ожидаем.Что(ЛогБезИмениКласса, "Логгерны не равны").Не_().Равно(ЭкспортныйЛог);

	Ожидаем.Что(ЛогБезИмениКлассаСДебагом, "тип ЛогБезИмениКлассаСДебагом").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаБезИмениКлассаСДебагом, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [my.logger.DEBUG] - Запись лога");
	Ожидаем.Что(ЛогБезИмениКлассаСДебагом, "Логгерны не равны").Не_().Равно(ЭкспортныйЛог);

	Ожидаем.Что(ЛогСДебагом, "тип ЛогСДебагом").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаСДебагом, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [m.l.D.КонтейнерЛога] - Запись лога");
	Ожидаем.Что(ЛогСДебагом, "Логгерны не равны").Не_().Равно(ЭкспортныйЛог);


КонецПроцедуры

&Тест
Процедура Должен_ПроверитьИнициализациюУровнейСтандартныхЛогов() Экспорт
	
	// Дано
	Поделка = Новый Поделка();

	Лог = Логирование.ПолучитьЛог("my.logger"); 
	ЛогОшибка = Логирование.ПолучитьЛог("my.logger.ERROR");
	ЛогОтладка = Логирование.ПолучитьЛог("my.logger.DEBUG"); 
	ЛогИнформация = Логирование.ПолучитьЛог("my.logger.INFO"); 
	ЛогПредупреждение = Логирование.ПолучитьЛог("my.logger.WARN"); 
	ЛогКритическаяОшибка = Логирование.ПолучитьЛог("my.logger.CRITICALERROR"); 
	ЛогОтключено = Логирование.ПолучитьЛог("my.logger.DISABLE"); 
	ЛогПоумолчанию = Логирование.ПолучитьЛог("my.logger.DEFAULT"); 

	// Когда
	Уровень = Лог.Уровень();
	УровеньОшибка = ЛогОшибка.Уровень();
	УровеньОтладка = ЛогОтладка.Уровень();
	УровеньИнформация = ЛогИнформация.Уровень();
	УровеньПредупреждение = ЛогПредупреждение.Уровень();
	УровеньКритическаяОшибка = ЛогКритическаяОшибка.Уровень();
	УровеньОтключено = ЛогОтключено.Уровень();
	УровеньПоУмлчанию = ЛогПоумолчанию.Уровень();
	
	// Тогда
	Ожидаем.Что(Уровень, "Уровень лога подтянулся из конфига").Равно(УровниЛога.Предупреждение);
	Ожидаем.Что(УровеньОшибка, "Уровень лога подтянулся из конфига УровеньОшибка").Равно(УровниЛога.Ошибка);
	Ожидаем.Что(УровеньОтладка, "Уровень лога подтянулся из конфига УровеньОтладка").Равно(УровниЛога.Отладка);
	Ожидаем.Что(УровеньИнформация, "Уровень лога подтянулся из конфига УровеньИнформация").Равно(УровниЛога.Информация);
	Ожидаем.Что(УровеньПредупреждение, "Уровень лога подтянулся из конфига УровеньПредупреждение").Равно(УровниЛога.Предупреждение);
	Ожидаем.Что(УровеньКритическаяОшибка, "Уровень лога подтянулся из конфига УровеньКритическаяОшибка").Равно(УровниЛога.КритичнаяОшибка);
	Ожидаем.Что(УровеньОтключено, "Уровень лога подтянулся из конфига УровеньОтключено").Равно(УровниЛога.Отключить);
	Ожидаем.Что(УровеньПоУмлчанию, "Уровень лога подтянулся из конфига УровеньПоУмлчанию").Равно(УровниЛога.Предупреждение);

КонецПроцедуры

&Тест
Процедура Должен_ПроверитьАппендерВФайл() Экспорт
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");
	ЛогСАппендеромВФайл = КонтейнерЛога.ЛогСАппендеромВФайл;
	ЛогСАппендеромВФайл.Отладка("событие");
	ЛогСАппендеромВФайл.Закрыть();
	Файл = Новый Файл(ИмяФайла);

	ЧтениеТекста = Новый ЧтениеТекста(ИмяФайла);
	ТекстЛога = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();

	СтрокиЛога = СтрРазделить(ТекстЛога, Символы.ПС, Ложь);

	// Тогда

	Ожидаем.Что(Файл.Существует(), "Файл аппендер появился").Равно(Истина);
	Ожидаем.Что(СтрокиЛога[0], "Первая строка лога").Равно("ОТЛАДКА - [m.l.fileappender] - событие");
	Ожидаем.Что(СтрокиЛога.Количество(), "Количество строк лога").Равно(1);

КонецПроцедуры

&Тест
Процедура Должен_ПроверитьCтандартнуюРаскладку() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");

	Лог = КонтейнерЛога.ЛогСоСтандартнойРаскладкой;
	ДобавитьСебяКакОбработчикаВывода(Лог);
	Лог.УстановитьУровень(УровниЛога.Отладка);
	Лог.Информация("Сообщение");
	Сообщение = мСообщенияЛога[0];

	Ожидаем.Что(Сообщение, "текст сообщения").Равно("ИНФОРМАЦИЯ - [m.l.s.КонтейнерЛога] - Сообщение");

КонецПроцедуры

&Тест
Процедура Должен_ПроверитьJsonРаскладку() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");

	Лог = КонтейнерЛога.ЛогСЖсонРаскладкой;
	ДобавитьСебяКакОбработчикаВывода(Лог);
	Лог.УстановитьУровень(УровниЛога.Отладка);
	Лог.Информация("Сообщение");
	Сообщение = мСообщенияЛога[0];

	Ожидаем.Что(Сообщение, "текст сообщения")
		.Содержит("""level"":""INFO"",""msg"":""Сообщение"",""log"":""my.logger.jsonlayout.КонтейнерЛога""");

КонецПроцедуры

&Тест
Процедура Должен_ПроверитьСтроковуюРаскладку() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");

	Лог = КонтейнерЛога.ЛогСоСтроковойРаскладкой;
	ДобавитьСебяКакОбработчикаВывода(Лог);
	Лог.УстановитьУровень(УровниЛога.Отладка);
	Лог.Информация("текст в лог");
	Лог.Информация("Сообщение");
	ОжидаемоеСообщение = Строка(ТекущаяДата())+":ИНФОРМАЦИЯ - текст в лог";
	Сообщение = мСообщенияЛога[0];

	Ожидаем.Что(Сообщение, "текст сообщения").Равно(ОжидаемоеСообщение);

КонецПроцедуры

&Тест
Процедура Должен_ПроверитьКлассовуюРаскладку() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");

	Лог = КонтейнерЛога.ЛогСРасколадкойКлассом;
	ДобавитьСебяКакОбработчикаВывода(Лог);
	Лог.УстановитьУровень(УровниЛога.Отладка);
	Лог.Информация("Сообщение");
	Сообщение = мСообщенияЛога[0];

	Ожидаем.Что(Сообщение, "текст сообщения").Равно("Сообщение тест");

КонецПроцедуры

ИмяФайла = "tests/log/fileappender.log";
УдалитьФайлы(ИмяФайла);