uses graphabc;

procedure FollowMouseAI(mx, my : integer);
begin
  var aix, aiy : integer;
  if aix < mx then aix := aix + 1;
  if aix > mx then aix := aix - 1;
  if aiy < my then aiy := aiy + 1;
  if aiy > my then aiy := aiy - 1;
  circle(aix, aiy, 5);
end;

procedure Mouse(x, y, mb: integer);
begin
end;

procedure MouseMove(x, y, mb: integer);
begin
  //clearwindow;
  Window.Title := (IntToStr(x) + ',' + IntToStr(y));
  while(true) do
  FollowMouseAi(x, y); 
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
  onMouseDown := Mouse;
  OnMouseMove := MouseMove;
  OnKeyDown:=keyPressed;
  OnKeyPress:=KeyPress;
  //while(true) do
  //begin
  //end;
end.