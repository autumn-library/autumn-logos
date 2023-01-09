Перем _Префикс;

Процедура ПриРазворачиванииАннотации(ОпределениеАннотации, ПодчиненныеАннотации, ТипВладельцаСвойств, Свойство) Экспорт
	
	Если _Префикс = "" Тогда
		ИмяЛога = ТипВладельцаСвойств;
	Иначе
		ИмяЛога = _Префикс + "." + ТипВладельцаСвойств;
	КонецЕсли;

	Аннотация = РаботаСАннотациями.НайтиАннотацию(ПодчиненныеАннотации, "Пластилин");
	РаботаСАннотациями.УстановитьЗначениеПараметраАннотации(Аннотация, "Блестяшка", ИмяЛога);

КонецПроцедуры

&Аннотация("Лог")
&Пластилин(Значение = "Лог", Блестяшка = "")
Процедура ПриСозданииОбъекта(Значение = "")
	_Префикс = Значение;
КонецПроцедуры