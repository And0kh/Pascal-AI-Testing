uses graphabc;

procedure UpdateAICircle(mx, my, aic, m: integer);
begin
var aix, aiy: integer;
aix:=320;
aiy:=240;
if (mx > aix) then begin 
mx:= mx + m end;
if (mx < aix) then begin 
mx:= mx - m end;
if (my > aiy) then begin 
my:= my + m end;
if (my < aiy) then begin 
my:= my - m end;
circle(aix, aiy, aic);
//floodfill(aix, aiy, clred);
end;

procedure CircleDraw(x1, y1, c1: integer);
begin
circle(x1, y1, c1);
floodfill(x1, y1, clblack);
end;

procedure Mouse(x, y, mb: integer);
begin
MoveTo(x, y);
end;

procedure MouseMove(x, y, mb: integer);
begin
clearwindow;
if mb=0 then CircleDraw(x, y, 10);
//UpdateAICircle(x, y, 10, 1);
Window.Title := (IntToStr(x) + ',' + IntToStr(y));
//redraw;
//leep(1);
end;

procedure keyPressed(Key: integer);
begin
case Key of
VK_Delete: closewindow;
end;
end;

procedure KeyPress(Ch: char);
begin
end;

begin
setwindowsize(640, 480);
//lockdrawing;
onMouseDown := Mouse;
OnMouseMove := MouseMove;
OnKeyDown:=keyPressed;
OnKeyPress:=KeyPress;
while(1<2) do
begin
//UpdateAICircle(1, 1, 5, 1);
//redraw;
end;
end.