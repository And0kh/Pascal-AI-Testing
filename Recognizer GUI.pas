uses graphabc;
var a:integer;

procedure lines;
begin
setwindowsize(280,280);
clearwindow(clblack);
setpencolor(clwhite);
line(10,0,10,280);
line(20,0,20,280);
line(30,0,30,280);
line(40,0,40,280);
line(50,0,50,280);
line(60,0,60,280);
line(70,0,70,280);
line(80,0,80,280);
line(90,0,90,280);
line(100,0,100,280);
line(110,0,110,280);
line(120,0,120,280);
line(130,0,130,280);
line(140,0,140,280);
line(150,0,150,280);
line(160,0,160,280);
line(170,0,170,280);
line(180,0,180,280);
line(190,0,190,280);
line(200,0,200,280);
line(210,0,210,280);
line(220,0,220,280);
line(230,0,230,280);
line(240,0,240,280);
line(250,0,250,280);
line(260,0,260,280);
line(270,0,270,280);
line(280,0,280,280);
line(0,10,280,10);
line(0,20,280,20);
line(0,30,280,30);
line(0,40,280,40);
line(0,50,280,50);
line(0,60,280,60);
line(0,70,280,70);
line(0,80,280,80);
line(0,90,280,90);
line(0,100,280,100);
line(0,110,280,110);
line(0,120,280,120);
line(0,130,280,130);
line(0,140,280,140);
line(0,150,280,150);
line(0,160,280,160);
line(0,170,280,170);
line(0,180,280,180);
line(0,190,280,190);
line(0,200,280,200);
line(0,210,280,210);
line(0,220,280,220);
line(0,230,280,230);
line(0,240,280,240);
line(0,250,280,250);
line(0,260,280,260);
line(0,270,280,270);
line(0,280,280,280);
end;

procedure MouseDown(x,y,mb: integer);
begin
  MoveTo(x,y);
  if mb= 2 then lines;
end;

procedure MouseMove(x,y,mb: integer);
begin
  if mb=1 then floodfill(x,y,clwhite);
end;
begin
lines;
OnMouseDown := MouseDown;
OnMouseMove := MouseMove;
end.