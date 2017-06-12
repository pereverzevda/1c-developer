﻿
&НаКлиенте
Процедура Печать(Команда)
	ПечатьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПечатьНаСервере()
	ОбрОбъект=РеквизитФормыВЗначение("Объект");
	МассивДокументов = Новый СписокЗначений();
	МассивДокументов.Добавить(Документы.ПриходныйОрдерНаТовары.НайтиПоНомеру("00-00035969", Дата(2017,1,1, 0,0,0)));
	ТабДок=ОбрОбъект.СформироватьПечатнуюФормуБирки(МассивДокументов, ЭтаФорма, "ПриходныйОрдерНаТовары");
	
	
	//
	//УправлениеПечатьюКлиент.ВыполнитьКомандуПечати(
	//		"Обработка.ПечатьЭтикетокИЦенников",
	//		ИменаМакетов,
	//		ПараметрКоманды,
	//		ЭтаФорма,
	//		ПолучитьПараметры());
КонецПроцедуры


&НаСервере
Функция ПолучитьПараметры()
	
	Товары = Новый ТаблицаЗначений;
	Товары.Колонки.Добавить("Номенклатура", Новый ОписаниеТипов("СправочникСсылка.Номенклатура"));
	Товары.Колонки.Добавить("Характеристика", Новый ОписаниеТипов("СправочникСсылка.ХарактеристикиНоменклатуры"));
	Товары.Колонки.Добавить("Серия", Новый ОписаниеТипов("СправочникСсылка.СерииНоменклатуры"));
	
	Для Каждого СтрокаТЧ ИЗ Объект.Товары Цикл
		//Если Не СтрокаТЧ.Выбран Тогда
		//	Продолжить;
		//КонецЕсли;
		НоваяСтрока = Товары.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, СтрокаТЧ);
	КонецЦикла;
	
	ПараметрыПечати = Новый Структура;
	ПараметрыПечати.Вставить("Товары", ПоместитьВоВременноеХранилище(Товары, УникальныйИдентификатор));
	ПараметрыПечати.Вставить("СтруктураМакетаШаблона", Неопределено);
	
	Возврат ПараметрыПечати;
	
КонецФункции

