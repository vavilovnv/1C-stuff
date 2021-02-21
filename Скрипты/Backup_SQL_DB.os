Перем ПутьКПлатформе;
Перем ИмяСервера;
Перем КаталогАрхивов;
Перем ПараметрыВыгрузки;
Перем ДополнятьЛог;
Перем ПрефиксФайлаАрхива;

Процедура ЗадатьНачальныеНастройки()
    
    ПутьКПлатформе = """C:\Program Files\1cv8\8.3.15.2107\bin\1cv8.exe""";
    ИмяСервера = "***";
    ИмяБазы = "***";
    КаталогАрхивов = "D:\***\";
    ПрефиксФайлаАрхива = "БП_***_";
    Логин = "***";
    Пароль = "***";
    ДополнятьЛог = Ложь;
    
    ПараметрыВыгрузки = Новый Массив;
    ПараметрыВыгрузки.Добавить("DESIGNER");
    ПараметрыВыгрузки.Добавить("/S """ + ИмяСервера + "\" + ИмяБазы + """");
    ПараметрыВыгрузки.Добавить("/DisableStartupMessages");
    ПараметрыВыгрузки.Добавить("/N" + Логин);
    ПараметрыВыгрузки.Добавить("/P" + Пароль);
    ПараметрыВыгрузки.Добавить("/DumpIB"+ ИмяФайлаВыгрузки());
    ПараметрыВыгрузки.Добавить("/LOG " + ИмяЛога());
 
 КонецПроцедуры

Функция ЗапуститьВыгрузкуИПодождать()

	СтрокаЗапуска = "";
	Для Каждого Параметр Из ПараметрыВыгрузки Цикл
	
		СтрокаЗапуска = СтрокаЗапуска + " " + Параметр;
	
	КонецЦикла;

	КодВозврата = 0;
	ЗапуститьПриложение(ПутьКПлатформе + СтрокаЗапуска, , Истина, КодВозврата);
	
	Возврат КодВозврата;

КонецФункции

Функция ИмяЛога()

    Возврат """" + КаталогАрхивов + "\backup_log.txt""" + ?(ДополнятьЛог, " -NoT_runcate", "");

КонецФункции

Функция ИмяФайлаВыгрузки()

    ИмяФайлаВыгрузки = ПрефиксФайлаАрхива + Формат(ТекущаяДата(),"ДФ=yyyy_MM_dd");

	Возврат КаталогАрхивов + ИмяФайлаВыгрузки + ".dt";

КонецФункции

Процедура ВыполнитьВыгрузкуБазы()
    
    Если ЗапуститьВыгрузкуИПодождать() = 0 Тогда
        Сообщить("Выгрузка завершена");
        Иначе
        Сообщить("Не удалось создать выгрузку");
        ЗавершитьРаботу(1);
    КонецЕсли;

КонецПроцедуры   

ЗадатьНачальныеНастройки();
ВыполнитьВыгрузкуБазы();