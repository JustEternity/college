program CheckSquareIndices;
var
  arr: array of Integer;
  i, Size: Integer;
  allSquareIndixes, Result: Boolean;
  mainString, subString: String;

function AreAllElementsSquareOfIndixes(Size: Integer; arrayToCheck: array of Integer): Boolean;
var
  indexSquared: Integer;
  k:Integer;
  i:Integer;
begin
  AreAllElementsSquareOfIndixes := true;
  k := Size;
  for i := 0 to k - 1 do
  begin
    indexSquared := (i + 1)* (i + 1);
    if arrayToCheck[i] <> indexSquared then
    begin
      AreAllElementsSquareOfIndixes := false;
      Break;
    end;
  end;
end;

function IsSubsequence(mainString, subString: String): Boolean;
var
  m, j: Integer;
begin
  m := 1;
  j := 1;

  while (m <= Length(mainString)) and (j <= Length(subString)) do
  begin
    if mainString[m] = subString[j] then
      j := j + 1;
    m := m + 1;
  end;

  Result := (j > Length(subString));
end;

begin
  Readln(Size);
  SetLength(arr, Size);
  for i := 0 to Size - 1 do
  begin
    Readln(arr[i]);
    Write(arr[i], ' ');
  end;
  Writeln;
  
  allSquareIndixes := AreAllElementsSquareOfIndixes(Size, arr);
  if allSquareIndixes then
    Writeln('Массив параболический')
  else
    Writeln('Массив не параболический');
  
  Write('Введите исходную строку: ');
  Readln(mainString);
  
  Write('Введите подстроку для проверки: ');
  Readln(subString);

  Result := IsSubsequence(mainString, subString);

  if Result then
    Writeln(subString, ' является подпоследовательностью ', mainString)
  else
    Writeln(subString, ' не является подпоследовательностью ', mainString);
end.