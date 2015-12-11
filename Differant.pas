uses graphabc;

const n=0.00000000000000000001;

var
  input:array[1..783]of real;output:array[0..9]of real;
  finput:array[1..49999,1..783]of real;finputn:array[1..49999]of byte;
  witoh1:array[1..784, 1..1000]of real;wh1toh2:array[1..1000, 1..500]of real;wh2too:array[1..500, 0..9]of real;
  h1net, h1out:array[1..1000]of real;h2net, h2out:array[1..500]of real;
  onet, oout:array[0..9]of real;
  wh2tooe:array[1..500, 0..9]of real;wh1toh2e:array[1..1000, 1..500]of real;witoh1e:array[1..784,1..1000]of real;
  nh1e:array[1..1000]of real;nh2e:array[1..500]of real;dEerror:array[0..9]of real;
  a,b,d: integer;c:real;
  infl:text;

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

function Sigmoid(x: real): real;
begin
  Result:=1/(1+exp(-x));
end;

function Derivative(x: real): real;
begin
  Result:=x*(1-x);
end;

procedure RandomWeights;
begin
  //randomize(1);
  var node,w:integer;
  for node:=1 to 783 do
    for w:=1 to 1000 do
      witoh1[node,w]:=random();
  for node:=1 to 1000 do
    for w:=1 to 500 do
      wh1toh2[node,w]:=random();
  for node:=1 to 500 do
    for w:=0 to 9 do
      wh2too[node,w]:=random();
end;

procedure fitoh1;
begin
  var node,w: integer;
  for node:=1 to 1000 do
    for w:=1 to 783 do
      h1net[node]:=h1net[node]+input[w]/witoh1[w,node];
  for node:=1 to 1000 do h1net[node]:=h1net[node]/100000;
   //for node:=1 to 1000 do writeln(h1net[node]);
end;

procedure sh1n;
begin
  var node: integer;
  for node:=1 to 1000 do h1out[node]:=sigmoid(h1net[node]);
end;

procedure fh1toh2;
begin
  var node,w: integer;
  for node:=1 to 500 do
    for w:=1 to 1000 do
      h2net[node]:=h2net[node]+h1out[w]*wh1toh2[w,node];
      for node:=1 to 500 do h2net[node]:=h2net[node]/10000;
end;

procedure sh2n;
begin
  var node: integer;
  for node:=1 to 500 do h2out[node]:=sigmoid(h2net[node]);
end;

procedure fh2too;
begin
  var node,w: integer;
  for node:=0 to 9 do
    for w:=1 to 500 do
      onet[node]:=onet[node]+h2out[w]*wh2too[w, node];
      for node:=0 to 9 do onet[node]:=onet[node]/1000;
end;

procedure sonet;
begin
  var node: integer;
  for node:=0 to 9 do oout[node]:=sigmoid(onet[node]);
end;

procedure forwardpropagate;
begin
  fitoh1;
  sh1n;
  fh1toh2;
  sh2n;
  fh2too;
  sonet;
end;

procedure BackPropagate;
begin
  var node, w: integer;
  for node:=0 to 9 do dEerror[node]:=sqr(output[node]-oout[node])/2;
  for node:=1 to 500 do
    for w:=0 to 9 do
      wh2tooe[node, w]:=dEerror[w]*Derivative(oout[w])*0.00001*wh2too[node,w];  
  for node:=1 to 500 do
    for w:=0 to 9 do
      nh2e[node]:=nh2e[node]+wh2tooe[node,w];  
  for node:=1 to 1000 do
    for w:=1 to 50 do
      wh1toh2e[node,w]:=nh2e[w]*Derivative(h2out[w])*0.0001*wh1toh2[node,w];  
  for node:=1 to 1000 do
    for w:=1 to 500 do
      nh1e[node]:=nh1e[node]+wh1toh2e[node,w];
  for node:=1 to 783 do
    for w:=1 to 1000 do
      witoh1e[node,w]:=witoh1e[node,w]*Derivative(h1out[w])*0.001*witoh1[node,w];
end;

procedure UpdateWeights;
begin
  var node,w:integer;
  for node:=1 to 1000 do
    for w:= 1 to 783 do
      witoh1[w,node]:=witoh1[w,node]-n*witoh1e[w,node];
  for node:=1 to 50 do
    for w:=1 to 1000 do
      wh1toh2[w,node]:=wh1toh2[w,node]-n*wh1toh2e[w,node];
  for node:=0 to 9 do
    for w:=1 to 500 do
      wh2too[w,node]:=wh2too[w,node]-n*wh2too[w,node];
end;
procedure ResetValues;
begin
  var node:integer;
  for node:=1 to 1000 do begin h1net[node]:=0;nh1e[node]:=0;end;
  for node:=1 to 500 do begin h2net[node]:=0;nh2e[node]:=0;end;
  for node:=0 to 9 do begin onet[node]:=0;dEerror[node]:=0;end;
end;

procedure Train;
begin
  var a:integer;
  ResetValues;
  ForwardPropagate;
  //for a:=0 to 9 do write(onet[a]:6:2,' ');
  //for a:=0 to 9 do write(oout[a]:6:2,' ');
  //writeln();
  BackPropagate;
  UpdateWeights;
end;

begin
  lines;
  SetConsoleIO;
  OnMouseDown := MouseDown;
  OnMouseMove := MouseMove;
  assign(infl,'C:\Users\AO\Desktop\output.txt');reset(infl);
  for a:=1 to 49999 do
    begin
      for b:=1 to 783 do read(infl,finput[a,b]);
      readln(infl,finputn[a]);
    end;
  RandomWeights;
  for a:=1 to 10 do Train;
  for a:=0 to 9 do write(oout[a],' ');
  c:=oout[0];
  d:=0;
  for a:=1 to 9 do if oout[a]>c then begin c:=oout[a];d:=a;end;
  writeln(d);
  writeln;
  writeln(milliseconds/1000,'seconds');
end.