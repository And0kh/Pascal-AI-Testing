uses graphabc;

procedure CircleDraw(x1,y1,c1: integer);
begin
clearwindow;
circle(x1,y1,c1);
floodfill(x1,y1,clblack);
end;

procedure Mouse(x,y,mb: integer);
begin
MoveTo(x,y);
end;

procedure MouseMove(x,y,mb: integer);
begin
clearwindow;
if mb=0 then CircleDraw(x,y,10);
end;

begin
onMouseDown := Mouse;
OnMouseMove := MouseMove;
end.