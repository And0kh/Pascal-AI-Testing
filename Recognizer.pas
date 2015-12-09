program digitrecognizer;

const n=0.01;

var
  input:array[1..783]of real;output:array[0..9]of real;
  witoh1:array[1..784, 1..1000]of real;wh1toh2:array[1..1000, 1..500]of real;wh2too:array[1..500, 0..9]of real;
  h1net, h1out:array[1..1000]of real;h2net, h2out:array[1..500]of real;
  onet, oout:array[0..9]of real;
  wh2tooe:array[1..500, 0..9]of real;wh1toh2e:array[1..1000, 1..500]of real;witoh1e:array[1..784,1..1000]of real;
  nh1e:array[1..1000]of real;nh2e:array[1..500]of real;dEerror:array[0..9]of real;
  a,b: integer;
  infl:text;

function Sigmoid(x: real): real;
begin
  Result:=(1/(1+exp(-x)));
end;

function Derivative(x: real): real;
begin
  Result:=(x*(1-x));
end;

procedure RandomWeights;
begin
  //randomize(1);
  var node,w:integer;
  for node:=1 to 783 do
    for w:=1 to 1000 do
      witoh1[node,w]:=random;
  for node:=1 to 1000 do
    for w:=1 to 500 do
      wh1toh2[node,w]:=random;
  for node:=1 to 500 do
    for w:=0 to 9 do
      wh2too[node,w]:=random;
end;

procedure ResetValues;
begin
  var node:integer;
  for node:=1 to 1000 do begin h1net[node]:=0;nh1e[node]:=0;end;
  for node:=1 to 500 do begin h2net[node]:=0;nh2e[node]:=0;end;
  for node:=0 to 9 do begin onet[node]:=0;dEerror[node]:=0;end;
end;

procedure ForwardPropagate;
begin
  var node,w: integer;
  for node:=1 to 1000 do
    for w:=1 to 783 do
      h1net[node]:=h1net[node]+input[w]*witoh1[w,node];
  for node:=1 to 1000 do h1out[node]:=Sigmoid(h1net[node]);
  for node:=1 to 500 do
    for w:=1 to 1000 do
      h2net[node]:=h2net[node]+h1out[w]*wh1toh2[w,node];
  for node:=1 to 500 do h2out[node]:=Sigmoid(h2net[node]);
  for node:=0 to 9 do
    for w:=1 to 500 do
      onet[node]:=onet[node]+h2out[w]*wh2too[w, node];
  for node:=0 to 9 do oout[node]:=Sigmoid(onet[node]);
end;

procedure BackPropagate;
begin
  var node, w: integer;
  for node:=0 to 9 do dEerror[node]:=sqr(output[node]-oout[node])/2;
  for node:=1 to 500 do
    for w:=0 to 9 do
      wh2tooe[node, w]:=dEerror[w]*Derivative(oout[w])*wh2too[node,w];  
  for node:=1 to 500 do
    for w:=0 to 9 do
      nh2e[node]:=nh2e[node]+wh2tooe[node,w];  
  for node:=1 to 1000 do
    for w:=1 to 50 do
      wh1toh2e[node,w]:=nh2e[w]*Derivative(h2out[w])*wh1toh2[node,w];  
  for node:=1 to 1000 do
    for w:=1 to 500 do
      nh1e[node]:=nh1e[node]+wh1toh2e[node,w];
  for node:=1 to 783 do
    for w:=1 to 1000 do
      witoh1e[node,w]:=witoh1e[node,w]*Derivative(h1out[w])*witoh1[node,w];
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

procedure Train;
begin
  var a:integer;
  ResetValues;
  ForwardPropagate;
  for a:=0 to 9 do write(oout[a],' ');
  BackPropagate;
  UpdateWeights;
end;

begin
  assign(infl,'output(1).txt');reset(infl);
  for a:=1 to 783 do read(infl, input[a]);
  readln(infl, b);
  for a:=0 to 9 do output[a]:=0.01;
  output[b]:=1-0.01;
  for a:=0 to 9 do write(output[a],' ');
  writeln;
  RandomWeights;
  for a:=1 to 10 do Train;
  writeln(milliseconds/1000,'seconds');
end.