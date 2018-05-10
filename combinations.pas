// num -> digits -> shuffle

type
    dynamic_array = array of integer;
    
// функция получает число и возвращает массив цифр этого числа в обратном порядке, например 123 -> [3, 2, 1]
function getDigitsOfNum(num: integer): dynamic_array;
var digits: array of integer;
    a, n, i: integer;
begin
  a := num;
  i := 0;
  repeat
    setLength(digits, i + 1);
    n := a mod 10;
    digits[i] := n;
    a := a div 10;
    inc(i);
  until a = 0;
  getDigitsOfNum := digits;
end;

// функций возвращает факториал числа, например - 5 -> 5! (120)
function factorial(num: integer): integer;
begin
    if num = 1 then begin
        factorial := 1;
    end else
        factorial := num * factorial(num - 1);
end;

// функция обьединят числа массива в число и возвращает его, например - [1,2,3] -> 123
function arrToInt(ar: dynamic_array): integer;
var
    len: integer;
    a: integer;
begin
    len := ar.Length;
    for var i := 0 to len - 1 do
    begin
        a := a + ar[i]*round(power(10, len - i - 1));
    end;
    arrToInt := a;
end;

// Функция на вход получает число и возвращает в массиве все комбинации из чисел в этом числе, например - 123 -> [231, 213, 123, 132, 312, 321]
function shuffle(num: integer): dynamic_array;
var digits, shuffled, d: dynamic_array;
    amount, c, len, a, b: integer;
    
begin
  digits := getDigitsOfNum(num); // получаем массив чисел из числа
  len := digits.length; // длина числа (количество цифр)
  amount := factorial(len); // количество возможных комбинаций из числа
  setLength(shuffled, amount); // задаем массиву с комбинациями длину равную количеству комбинаций
  d := digits; // копируем цифры
  
  // основной алгоритм
  for var i := 0 to amount div (len - 1) - 1 do
  begin
    for var j := 0 to len - 2 do
    begin
        a := d[j];    // |
        b := d[j + 1];// < меняем два числа местами в массиве
        d[j] := b;    // |
        d[j + 1] := a;// |
        
        shuffled[c] := arrToInt(d); // записываем в массив комбинаций новую комбинацию
        inc(c); 
    end;
  end;
 shuffle := shuffled;
end;

var 
    array_of_shuffled_digits: dynamic_array;
    num: integer;
begin
    readln(num);
    array_of_shuffled_digits := shuffle(num);
    for var i := 0 to array_of_shuffled_digits.length - 1 do
        write(array_of_shuffled_digits[i], ' ');
end.
