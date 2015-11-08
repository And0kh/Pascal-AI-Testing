program in2h12iou2;

var 
w1, w2, w3, w4, w5, w6, w7, w8, 
b1, b2, 
i1, i2, 
h1, h2, 
outA1, outA2, o1r, o2r, Outo1r, Outo2r, 
h1net, h2net,
E1, E2, dEtotal, dEerror1, dEerror2:real;

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
outA1:=0.01;outA2:=0.99;

//Forward propagation
h1net:=w1 * i1 + w2 * i2 + b1 * 1;
h1:=(logisticsFunction(h1net));

h2net:=w3 * i1 + w4 * i2 + b1 * 1;
h2:=(logisticsFunction(h2net));

o1r:=w5 * h1 + w6 * h2 + b2 * 1;
Outo1r:=(logisticsFunction(o1r));

o2r:=w7 * h1 + w8 * h2 + b2 * 1;
Outo2r:=(logisticsFunction(o2r));

//Error calculation
E1:=(sqr(outA1 - Outo1r)/2);
E2:=(sqr(outA2 - Outo2r)/2);
dEtotal:=E1 + E2;
dEerror1:=(-(outA1 - Outo1r));
dEerror2:=(-(outA2 - Outo2r));


end.