program in9hi296ou4;

uses graphabc;

var
input:array[0..9]of real;
witoh1:array[1..9,1..9]of real;witoh1u:array[1..9,1..9]of real;
wh1toh2:array[1..9,1..6]of real;wh1toh2u:array[1..9,1..6]of real;
wh2too:array[1..6,1..4]of real;wh2toou:array[1..6,1..4]of real;
h1net:array[1..9]of real;h1out:array[1..9]of real;
h2net:array[1..6]of real;h2out:array[1..6]of real;
onet:array[1..4]of real;oout:array[1..4]of real;
oE:array[1..4]of real;
iteration:longint;
dEerror1,dEerror2,dEerror3,dEerror4:real;
TIn:array[1..5,1..9]of byte:=({+}(0,1,0,1,1,1,0,1,0),{-}(0,0,0,1,1,1,0,0,0),{*}(0,0,0,0,1,0,0,0,0),{x}(1,0,1,0,1,0,1,0,1),{/}(0,0,1,0,1,0,1,0,0){,{:(0,1,0,0,0,0,0,1,0)});
TrOut:array[1..5,1..4]of byte:=((1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,1,0),(0,0,0,1));


function Sigmoid(x:real):real;
begin
  Result:=(1/(1 + exp(-x)));
end;

function Derivative(x:real):real;
begin
  Result:=(x*(1-x));
end;

procedure GraphicsWindowSetup;
begin
  //Graphics set up
  SetConsoleIO;
  setwindowtitle('Math operator recognizer');
  setwindowsize(600,600);
  //Drawing grid
  setpenwidth(3);
  line(200,0,200,600);
  line(400,0,400,600);
  line(0,200,600,200);
  line(0,400,600,400);
  line(0,600,600,600);
  line(602,0,602,600);
end;

procedure MouseDown(x,y,mb: integer);
begin
  if mb = 1 then floodfill(x,y,clBlack);
  if mb = 2 then begin clearwindow;line(200,0,200,600);line(400,0,400,600);line(0,200,600,200);line(0,400,600,400);line(0,600,600,600);line(602,0,602,600);end;
end;


procedure Initiate_randweights();
begin
  var ix,node:byte;
  //Weights from input to hidden1
  for ix:=1 to 9 do
    for node:=1 to 9 do
      witoh1[ix,node]:=random;
  //Weights from hidden1 to hidden2
  for ix:=1 to 9 do
    for node:=1 to 6 do
      wh1toh2[ix,node]:=random;
  //Weights from hidden 2 to output
  for ix:=1 to 6 do
    for node:=1 to 4 do
      wh2too[ix,node]:=random;
end;

procedure Forward_in_to_hid1();
begin
  var ix,node:byte;
  for ix:=1 to 9 do
    for node:=1 to 9 do
      h1net[node]:=h1net[node]+input[ix]*witoh1[ix,node];
end;

procedure Sigmoid_hidden1_net();
begin
  var i:byte;
  for i:=1 to 9 do
    h1out[i]:=Sigmoid(h1net[i]);
end;

procedure Forward_hid1_to_hid2();
begin
  var ix,node:byte;
  for ix:=1 to 9 do
    for node:=1 to 6 do
      h2net[node]:=h2net[node]+h1out[ix]*wh1toh2[ix,node];
end;

procedure Sigmoid_hidden2_net();
begin
  var i:byte;
  for i:=1 to 6 do
    h2out[i]:=Sigmoid(h2net[i]);
end;

procedure Forward_hid2_to_out();
begin
  var ix,node:byte;
  for ix:=1 to 6 do
    for node:=1 to 4 do
      onet[node]:=onet[node]+h2out[ix]*wh2too[ix,node];
end;

procedure Sigmoid_output_out();
begin
  var i:byte;
  for I:=1 to 4 do
    oout[i]:=Sigmoid(onet[i]);
end;

procedure ForwardPropagate();
begin
  Forward_in_to_hid1;
  Sigmoid_hidden1_net;
  Forward_hid1_to_hid2;
  Sigmoid_hidden2_net;
  Forward_hid2_to_out;
  Sigmoid_output_out;
end;

procedure ResetValues();
begin
  var i:byte;
  for i:=1 to 9 do h1net[i]:=0;
  for i:=1 to 6 do h2net[i]:=0;
  for i:=1 to 4 do onet[i]:=0;
end;

procedure ErrorCalculation();
begin
  dEerror1:=(-(oE[1] - oout[1]));
  dEerror2:=(-(oE[2] - oout[2]));
  dEerror3:=(-(oE[3] - oout[3]));
  dEerror4:=(-(oE[4] - oout[4]));
end;

procedure BackPropagate();
begin
  var ix,node:integer;
end;

procedure TrainNetwork();
begin
  var i:byte;
  for i:=1 to 6 do
  begin
    ResetValues;
    ForwardPropagate;
    ErrorCalculation;
    BackPropagate;
  end;
end;

begin
  GraphicsWindowSetup;
  Initiate_randweights;
  input[1]:=0;input[2]:=1;input[3]:=0;input[4]:=1;input[5]:=1;input[6]:=1;input[7]:=0;input[8]:=1;input[9]:=0;
  for iteration:=1 to 50 do TrainNetwork;
  OnMouseDown := MouseDown;
end.