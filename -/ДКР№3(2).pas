program KP3;
uses Crt;

function F(x: Real): Real;
begin
  F := 2*x*x*x - x*x + x + 11;
end;

function MidpointRectanglesIntegration(a, b: Real; n: Integer): Real;
var
  h, x, sum: Real;
  i: Integer;
begin
  h := (b - a) / n;
  sum := 0;
  for i := 0 to n - 1 do
  begin
    x := a + h * (i + 0.5);
    sum := sum + F(x);
  end;
  MidpointRectanglesIntegration := h * sum;
end;

var
  a, b, S: Real;
  n: Integer;
  res: Char;
  option: Integer;

begin
  repeat
    Writeln('Выберите действие:');
    Writeln('1. Рассчитать площадь фигуры');
    Writeln('2. Выйти из программы');
    Readln(option);
    ClrScr;

    case option of
      1:
      begin
        Writeln('Введите пределы интегрирования a и b через пробел:');
        Readln(a, b);
        Writeln('Введите количество отрезков для деления:');
        Readln(n);
        ClrScr;
        S := MidpointRectanglesIntegration(a, b, n);
        Writeln('Площадь фигуры, ограниченной кривой, равна: ', S:0:10);

        Writeln('Хотите оценить погрешность полученного результата? (y/n)');
        Readln(res);
        if (res = 'y') or (res = 'Y') then
        begin
          if n = 1 then
          begin
            Writeln('Нельзя оценить погрешность, если используется 1 отрезок.');
          end
          else
          begin
            S := MidpointRectanglesIntegration(a, b, n);
            Writeln('Площадь фигуры равна: ', S:0:10);
            Writeln('Вычисленная погрешность: ', Abs(S - MidpointRectanglesIntegration(a, b, n*2)));
          end;
        end;
      end;
      2: Writeln('До свидания!');
    end;
  until option = 2;
end.