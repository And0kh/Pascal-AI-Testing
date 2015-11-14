program in9hi296ou4;

uses graphabc;

var
input:array[0..9]of real;
weights_in_to_hidden1:array[1..9,1..9]of real;
weights_hidden1_to_hidden2:array[1..9,1..6]of real;
weights_hidden2_to_output:array[1..6,1..4]of real;
hidden1_net:array[1..9]of real;
hidden1_out:array[1..9]of real;
hidden2_net:array[1..6]of real;
hidden2_out:array[1..6]of real;
output_net:array[1..4]of real;
output_out:array[1..4]of real;


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
end;

procedure Initiate_randweights();
begin
  var ix,node:integer;
  //Weights from input to hidden1
  for ix:=1 to 9 do
    for node:=1 to 9 do
      weights_in_to_hidden1[ix,node]:=random;
  //Weights from hidden1 to hidden2
  for ix:=1 to 9 do
    for node:=1 to 6 do
      weights_hidden1_to_hidden2[ix,node]:=random;
  //Weights from hidden 2 to output
  for ix:=1 to 6 do
    for node:=1 to 4 do
      weights_hidden2_to_output[ix,node]:=random;
end;

procedure Forward_in_to_hid1();
begin
  var ix,node:integer;
  for ix:=1 to 9 do
    for node:=1 to 9 do
      hidden1_net[node]:=hidden1_net[node]+input[ix]*weights_in_to_hidden1[ix,node];
end;

procedure Sigmoid_hidden1_net();
begin
  var i:integer;
  for i:=1 to 9 do
    hidden1_out[i]:=Sigmoid(hidden1_net[i]);
end;

procedure Forward_hid1_to_hid2();
begin
  var ix,node:integer;
  for ix:=1 to 9 do
    for node:=1 to 6 do
      hidden2_net[node]:=hidden2_net[node]+hidden1_out[ix]*weights_hidden1_to_hidden2[ix,node];
end;

procedure Sigmoid_hidden2_net();
begin
  var i:integer;
  for i:=1 to 6 do
    hidden2_out[i]:=Sigmoid(hidden2_net[i]);
end;

procedure Forward_hid2_to_out();
begin
  var ix,node:integer;
  for ix:=1 to 6 do
    for node:=1 to 4 do
      output_net[node]:=output_net[node]+hidden2_out[ix]*weights_hidden2_to_output[ix,node];
end;

procedure Sigmoid_output_out();
begin
  var i:integer;
  for I:=1 to 4 do
    output_out[i]:=Sigmoid(output_net[i]);
end;

begin
  GraphicsWindowSetup;
  Initiate_randweights;
  Forward_in_to_hid1;
  Sigmoid_hidden1_net;
  Forward_hid1_to_hid2;
  Sigmoid_hidden2_net;
  Forward_hid2_to_out;
  Sigmoid_output_out;
end.