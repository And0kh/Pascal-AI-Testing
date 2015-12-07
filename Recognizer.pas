program digitrecognizer;

var input:array[1..784]of real;output:array[0..9]of byte;
witoh1:array[0..783,1..1000]of real;wh1toh2:array[1..1000,1..500]of real;wh2too:array[1..500,0..9]of real;
h1net,h1out:array[1..1000]of real;h2net,h2out:array[1..500]of real;onet,oout:array[0..9]of real;
wh2tooe:array[1..500,0..9]of real;wh1toh2e:array[1..1000,1..500]of real;
nh1:array[1..1000]of real;nh2:array[1..500]of real;
a,b:integer;
f:text;

begin
assign(f,'output(1).txt');reset(f);
for a:=1 to 783 do read(f, input[a]);
readln(f, b);
output[b]:=1;
end.