Перем ПутьКПлатформе;
Перем КаталогАрхивов;
Перем ПараметрыЗапуска;
Перем ДополнятьЛог;

Процедура ЗадатьНачальныеНастройки()
    
    //ПутьКПлатформе = """***\bin\1cv8.exe""";
    //КаталогБазы = "***";
    //КаталогАрхивов = "***";
    //Логин = "***";
    //Пароль = "***";
    ДополнятьЛог = Ложь;
    
    ПараметрыЗапуска = Новый Массив;
    ПараметрыЗапуска.Добавить("DESIGNER");
    ПараметрыЗапуска.Добавить("/F """ + КаталогБазы + """");
    ПараметрыЗапуска.Добавить("/N" + Логин);
    ПараметрыЗапуска.Добавить("/P" + Пароль);
    ПараметрыЗапуска.Добавить("/Out" + ИмяЛога());
    ПараметрыЗапуска.Добавить("/DumpIB " + ИмяФайлаВыгрузки());

КонецПроцедуры

Функция ИмяЛога()

    Возврат """" + КаталогАрхивов + "\backup_log.txt""" + ?(ДополнятьЛог, " -NoT_runcate", "");

КонецФункции

Функция ИмяФайлаВыгрузки()

    ИмяФайлаВыгрузки = Формат(ТекущаяДата(),"ДФ=yyyy_MM_dd");

	Возврат КаталогАрхивов + ИмяФайлаВыгрузки + ".dt";

КонецФункции

Функция ЗапуститьИПодождать()

	СтрокаЗапуска = "";
	Для Каждого Параметр Из ПараметрыЗапуска Цикл
	
		СтрокаЗапуска = СтрокаЗапуска + " " + Параметр;
	
	КонецЦикла;

	КодВозврата = 0;
	ЗапуститьПриложение(ПутьКПлатформе + СтрокаЗапуска, , Истина, КодВозврата);
	
	Возврат КодВозврата;

КонецФункции

Процедура ВыполнитьВыгрузкуБазы()
    
    Если ЗапуститьИПодождать() = 0 Тогда
        Сообщить("Выгрузка завершена");
    Иначе
        Сообщить("Не удалось создать выгрузку");
        ЗавершитьРаботу(1);
    КонецЕсли; 

КонецПроцедуры 

ЗадатьНачальныеНастройки();
ВыполнитьВыгрузкуБазы();