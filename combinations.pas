// num -> digits -> mix
type
    arr = array of integer;
    
function getDigitsOfNum(num: integer): arr;
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

function factorial(num: integer): integer;
begin
    if num = 1 then begin
        factorial := 1;
    end else
        factorial := num * factorial(num - 1);
end;

function arrToInt(ar: arr): integer;
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

function mix(num: integer): arr;
var digits: arr;
    amount: integer;
    len: integer;
    shuffled: arr;
    c: integer;
    m: arr;
    a,b: integer;
    
begin
  digits := getDigitsOfNum(num);
  len := digits.length;
  amount := factorial(len);
  setLength(shuffled, amount);
  m := digits;
  c := 0;
  
  for var i := 0 to amount div (len - 1) - 1 do
  begin
    for var j := 0 to len - 2 do
    begin
        a := m[j];
        b := m[j + 1];
        m[j] := b;
        m[j + 1] := a;
        shuffled[c] := arrToInt(m);
        inc(c);
    end;
  end;
  mix := shuffled;
end;

var 
    ar: arr;
    num: integer;
begin
    readln(num);
    ar := mix(num);
    for var i := 0 to ar.length - 1 do
        write(ar[i], ' ');
end.
