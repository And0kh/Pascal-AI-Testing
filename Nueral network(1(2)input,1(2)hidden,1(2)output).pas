program in2h12iou2;

var w1, w2, w3, w4, w5, w6, w7, w8, b1, b2, i1, i2, h1, h2, o1, o2, h1net, h2net, o1net, o2net, oh1, oh2:real;

//The logistics function(sigmoid function)
function logisticsFunction(x:real):real;
begin
  Result:=(1/(1 + exp(-x)));
end;

begin

//Assigning all variables
w1:=0.15;w2:=0.2;w3:=0.25;w4:=0.3;w5:=0.4;w6:=0.45;w7:=0.5;w8:=0.55;
b1:=0.35;b2:=0.6;
i1:=0.05;i2:=0.1;

h1net:=w1 * i1 + w2 * i2 + b1 * 1;
oh1:=(logisticsFunction(h1net));
h2net:=w3 * i1 + w4 * i2 + b1 * 1;
oh2:=(logisticsFunction(h2net));

end.