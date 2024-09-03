unit peano_curve;

uses GraphABC;

var
startX, startY: Integer;
currentX, currentY: Integer;
currentAngle: Real;
scale: Integer;
depth: Integer;

procedure turnRight(angle: Real);
begin
  currentAngle := currentAngle - angle;
end;

procedure turnLeft(angle: Real);
begin
  currentAngle := currentAngle + angle;
end;

procedure fforward(scale: Integer);
var
newX, newY: Integer;
begin
  newX := currentX + Round(scale * Cos(currentAngle * Pi / 180));
  newY := currentY - Round(scale * Sin(currentAngle * Pi / 180));
  Line(currentX, currentY, newX, newY);
  currentX := newX;
  currentY := newY;
end;

procedure draw(n: Real; ang, scale: Integer);
begin
if n > 0 then
  begin
    n := n - 0.5;
    turnRight(ang);
    draw(n, -ang, scale);
    fforward(scale);
    draw(n, ang, scale);
    fforward(scale);
    draw(n, -ang, scale);
    turnLeft(ang);
  end;
end;

procedure init(n: Real; x, y, scale: Integer);
begin
  currentX := x;
  currentY := y;
  currentAngle := 90;
  draw(n, 90, scale);
end;
end.




