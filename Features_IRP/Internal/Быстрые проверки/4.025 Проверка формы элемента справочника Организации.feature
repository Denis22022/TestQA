﻿#language: ru

@tree
@БыстрыеПроверки
Функционал: Проверка формы элемента справочника Организации 

Сценарий: Проверка доступности вкладок Налоги и Валюты в справочники Организации
	* Открытие элемента справочника Организации
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Установка галки и проверка наличия вкладок
		И я устанавливаю флаг с именем 'OurCompany'
		И элемент формы "Валюты" присутствует на форме
		И элемент формы "Вид налога" присутствует на форме
	* Установка галки и проверка отсутствия вкладок
		И я снимаю флаг 'Наша организация'
		И элемент формы "Валюты" существует и невидим на форме
		И элемент формы "Вид налога" существует и невидим на форме

Сценарий: Проверка опции использовать организации в заказе
	И Я устанавливаю в константу "UseCompanies" значение "False"
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы "Организация" отсутствует на форме

Сценарий: Проверка заполнения справочника Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
	И я нажимаю на кнопку с именем 'FormWrite'
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И я нажимаю на кнопку 'Записать и закрыть'
	Тогда открылось окно 'Организации'
	И в таблице "List" я перехожу к строке:
		| 'Наименование'        |
		| 'Тестовый контрагент' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И я закрываю все окна клиентского приложения
		
Сценарий: Проверка расположения элементов в форме Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	@Screenshot
	Тогда открылось окно 'Организация (создание)'
