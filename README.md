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


+ <Буква> – буква латинского алфавита (a...z)
+ <Цифра> – цифра от 0 до 9
+ <Программа> ::= <Объявление переменных> <Описание вычислений> .


<Объявление переменных>
+ <Объявление переменных> ::= Var <Список переменных>
+ <Список переменных> ::= <Идент> | <Идент> , <Список переменных>
+ <Идент> ::= <Буква> <Идент> | <Буква>

<Описание вычислений>
+ <Описание вычислений> ::= <Список операторов>
+ <Список операторов> ::= <Оператор> | <Оператор> <Список операторов>
+ <Оператор>::=<Присваивание> |<Сложный оператор>

<Присваивание>
+ <Присваивание> ::= <Идент> = <Выражение>
+ <Выражение> ::= <Ун.оп.> <Подвыражение> | <Подвыражение>
+ <Ун.оп.> ::= "-"|"not"
+ <Подвыражение> :: = ( <Выражение> ) | <Операнд> | <Подвыражение> <Бин.оп.> <Подвыражение>
+ <Бин.оп.> ::= "-" | "+" | "*" | "/" |"<"|">"|"=="
+ <Операнд> ::= <Идент> | \<Const> 
+ \<Const> ::= <Цифра> \<Const> | <Цифра> 

<Сложный оператор>
+ <Сложный оператор>::= <Оператор цикла> | <Составной оператор>
+ <Оператор цикла>::= WHILE <Выражение> DO <Оператор>
+ <Составной оператор> ::= Begin <Список операторов> End

<Комментарий>
+ <Комментарий> ::= "/" "/" <Текст комментария> 
+ <Текст комментария> ::= <Операнд> | <Операнд> <Операнд>
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
- ,

## Примеры программ
### Корректная
> <Объявление переменных> <Описание вычислений> :
> 
> <Объявление переменных> \
> Var i &emsp; &emsp;&emsp;*<Объявление переменных> <Буква>* \
> Var io &emsp; &emsp;&nbsp;&nbsp;*<Объявление переменных> <Буква> <Буква>* \
> Var a, ab &emsp; *<Объявление переменных> <Идент>, <Идент>*
> 
> <Описание вычислений> \
> i = -12 &emsp;&emsp; *<Присваивание> &nbsp; => &nbsp; <Идент> = <Сonst>*
>
> <Сложный оператор> \
> WHILE i < 10 DO &emsp;*<Оператор цикла>  &nbsp; => &nbsp; WHILE <Выражение> DO <Оператор>* \
>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;*=> &nbsp; WHILE <Подвыражение> <Бин.оп.> <Подвыражение> DO <Оператор>* \
> Begin  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; *Begin <Список операторов> End*\
> &emsp; i = i - (not 1)&emsp;&nbsp;&emsp;*<Идент> = <Выражение> &nbsp; => &nbsp; <Идент> = <Подвыражение>*\
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;*=> &nbsp; <Идент> =  <Подвыражение> <Бин.оп.> <Подвыражение>*\
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;*=> &nbsp;<Идент> = <Операнд> <Бин.оп.> ( <Выражение> )*\
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;*=> &nbsp;<Идент> = <Операнд> <Бин.оп.> ( <Ун.оп.> <Операнд> )*\
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;*=> &nbsp;<Идент> = <Идент> <Бин.оп.> ( <Ун.оп.> \<Const> )*\
> End

### Некорректная
>Var i \
>Var ff15 &emsp;&emsp;&emsp;&emsp;*Нельзя объявлять перменные с цифрами*\
>Var ff = 20 &emsp;&emsp;&emsp;*Нельзя объявлять переменные со значением*\
>WHILE i < 10 DO \
>&emsp;Var i = i - 1&emsp;&emsp;*Нельзя объявлять новые переменные внутри блока вычислений*\
>&emsp;i = 1ff &emsp;&emsp;&emsp;&emsp;*\<Const> не может содержать буквы*

### Компиляция программы в Assembler
Результат:

```
jal x1, MAIN
i:
data 0 * 1
io:
data 0 * 1
a:
data 0 * 1
ab:
data 0 * 1
MAIN:
addi x2, x0, 12
sub x1, x0, x2
sw x0, 1, x1
START_CYCLE_0:
lw x1, x0, 1
addi x2, x0, 10
bge x1, x2, END_CYCLE_0
beq x1, x2, END_CYCLE_0
lw x2, x0, 1
addi x4, x0, 1
xori x3, x4, 4095
sub x1, x2, x3
sw x0, 1, x1
jal x1, START_CYCLE_0
END_CYCLE_0:
ebreak
```
 
Результат выполнения программы:
<br>
![image](https://github.com/Holdinalt/compilers/assets/81990607/0b5eec89-7e81-46ce-95e4-6a012812da58)





