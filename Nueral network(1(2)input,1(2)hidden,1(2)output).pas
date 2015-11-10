program in2h12iou2;

var 
a,b,or1ats,or2ats,
w1, w2, w3, w4, w5, w6, w7, w8,
w1u, w2u, w3u, w4u, w5u, w6u, w7u, w8u,
b1, b2, 
i1, i2, 
h1out, h2out, 
outA1, outA2, o1r, o2r, Outo1r, Outo2r, 
h1net, h2net,
dE1, dE2, dEtotal, dEerror1, dEerror2:real;
i,c:integer;

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

writeln('How many loops do you want the program to run through?(Сколько петель вы хотите запустить программу через?)');
readln(c);

for i:=1 to c do
begin
//Forward propagation
h1net:=w1 * i1 + w2 * i2 + b1 * 1;
h1out:=(logisticsFunction(h1net));

h2net:=w3 * i1 + w4 * i2 + b1 * 1;
h2out:=(logisticsFunction(h2net));

o1r:=w5 * h1out + w6 * h2out + b2 * 1;
Outo1r:=(logisticsFunction(o1r));

o2r:=w7 * h1out + w8 * h2out + b2 * 1;
Outo2r:=(logisticsFunction(o2r));
if(i=1) then begin or1ats:=Outo1r; or2ats:=Outo2r;end;

//writeln(Outo1r,' ',Outo2r);

//Error calculation
dE1:=(sqr(outA1 - Outo1r)/2);
dE2:=(sqr(outA2 - Outo2r)/2);
dEtotal:=dE1 + dE2;
dEerror1:=(-(outA1 - Outo1r));
dEerror2:=(-(outA2 - Outo2r));
w5u:=w5-0.4*(dEerror1*(Outo1r*(1-Outo1r))*(1*h1out*power(w5,(1-1))+0+0));
//writeln(w5u);
w6u:=w6-0.4*(dEerror1*(Outo2r*(1-Outo2r))*(1*h2out*power(w6,(1-1))+0+0));
//writeln(w6u);
w7u:=w7-0.4*(dEerror2*(Outo2r*(1-Outo2r))*(1*h2out*power(w7,(1-1))+0+0));
w8u:=w8-0.4*(dEerror2*(Outo2r*(1-Outo2r))*(1*h2out*power(w8,(1-1))+0+0));
//writeln(dEerror1{or 2}*(outo1r*(1-Outo1r))*w5);
a:=dEerror1{or 2}*(outo1r*(1-Outo1r))*w5;
b:=dEerror2{or 2}*(outo1r*(1-Outo1r))*w6;
//writeln(a,' ',b);
w1u:=((a+b)*h1out*(1-h1out)*0.05);
w2u:=((a+b)*h1out*(1-h1out)*0.1);

a:=dEerror1{or 2}*(outo1r*(1-Outo1r))*w7;
b:=dEerror2{or 2}*(outo1r*(1-Outo1r))*w8;
w3u:=((a+b)*h2out*(1-h2out)*0.05);
w4u:=((a+b)*h2out*(1-h2out)*0.1);
//writeln(w1-0.5*w1u,' ',w2-0.5*w2u,' ',w3-0.5*w3u,' ',w4-0.5*w4u);
w1:=w1u;w2:=w2u;w3:=w3u;w4:=w4u;w5:=w5u;w6:=w6u;w7:=w7u;w8:=w8u;

{h1net:=w1 * i1 + w2 * i2 + b1 * 1;
h1out:=(logisticsFunction(h1net));

h2net:=w3 * i1 + w4 * i2 + b1 * 1;
h2out:=(logisticsFunction(h2net));

o1r:=w5 * h1out + w6 * h2out + b2 * 1;
Outo1r:=(logisticsFunction(o1r));

o2r:=w7 * h1out + w8 * h2out + b2 * 1;
Outo2r:=(logisticsFunction(o2r));}
end;

writeln('Output of the program on 1 loop- ',or1ats,' and ', or2ats);
writeln('And at the end of the program after the ',i,' loop- ',Outo1r,' and ',Outo2r);
writeln('Differnace between the first- ',or1ats-Outo1r);
writeln('Differnace between the second- ',or2ats-Outo2r);

end.