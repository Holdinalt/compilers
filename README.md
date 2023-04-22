# ВАРИАНТЫ ЗАДАНИЙ
- Во всех вариантах все переменные должны быть объявлены до начала
вычислений.
- <Буква> – буква латинского алфавита (a...z).
- <Цифра> – цифра от 0 до 9.
- Предусмотреть вывод значений переменных.
- //   ----- Комментарий ------

Порядок выполнения.
1. Определить какой язык порождает 	порождающая грамматика из варианта. Привести пример корректной программы (используя все возможные правила грамматики) и некорректной программы (с указанием типа ошибок, необходимо показать возможные ошибки для всех возможных операторов.
2. Подготовить файлы *.l для Flex в соответствии с лексическим составом языка, выполнить синтаксическое описание языка в нотации Bison (файл *.y). Учесть приоритеты бинарных операций. Представить работу лексического и синтаксического анализаторов для примеров из п. 1.
3. Разработать функции, реализующие построение и вывод АСТ (AST Abstract syntax tree). Вывод АСТ осуществить в файл.
4. По АСТ построить представление исходной программы (см. п. 1) в виде триад. По согласованию с преподавателем можно использовать другие формы линеаризации АСТ.

### Вариант номер 1

> Скратил связанные правила:
> - <Описание вычислений> ::= <Список операторов>
> - <Список операторов> ::= <Оператор> | <Оператор> <Список операторов>
> 
> Получилось
> + <Описание вычислений> ::= <Оператор> | <Оператор> <Описание вычислений>
  


+ <Буква> – буква латинского алфавита (a...z)
+ <Цифра> – цифра от 0 до 9
+ <Программа> ::= <Объявление переменных> <Описание вычислений> .
+ <Объявление переменных> ::= Var <Список переменных>
+ <Список переменных> ::= <Идент> | <Идент> , <Список переменных>
+ <Идент> ::= <Буква> <Идент> | <Буква>
+ <Описание вычислений> ::= <Оператор> | <Оператор> <Описание вычислений>
+ <Оператор>::=<Присваивание> |<Сложный оператор>
+ <Присваивание> ::= <Идент> = <Выражение>
+ <Выражение> ::= <Ун.оп.> <Подвыражение> | <Подвыражение>
+ <Ун.оп.> ::= "-"|"not"
+ <Подвыражение> :: = ( <Выражение> ) | <Операнд> | <Подвыражение> <Бин.оп.> <Подвыражение>
+ <Бин.оп.> ::= "-" | "+" | "*" | "/" |"<"|">"|"=="
+ <Операнд> ::= <Идент> | <Const> |<Сложный оператор>:: =<Оператор цикла> | <Составной оператор>
+ <Оператор цикла>:: =WHILE <Выражение> DO <Оператор>
+ <Составной оператор> ::= Begin <Список операторов> End

+ \<Const> ::= <Цифра> \<Const> | <Цифра>

# Выполнение

## Элементы языка

### Нетерминалы
- <Программа>
- <Описание вычислений>
- <Объявление переменных>
- <Список переменных>
- <Список операторов>
- <Оператор>
- <Присваивание>
- <Выражение>
- <Подвыражение>
- <Ун.оп.>
- <Бин.оп.>
- <Операнд>
- <Оператор цикла>
- <Составной оператор>
- <Идент>
- <Сonst>
- <Буква>
- <Цифра>

### Терминалы

- Var
- \-
- not
- \+
- \*
- \/
- <
- \>
- ==
- =
- WHILE
- DO
- Begin
- End
- 0...9
- a...z

## Примеры программ
### Корректная





