program in9hi296ou4;

var
input:array[0..9]of char;
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

begin

end.