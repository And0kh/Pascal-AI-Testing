program SingleInputTest;

var
x : array of integer;
y, l0, l1, l1_error, l1_delta : byte;
i, syn0, syn1 : integer;

function nonlin(x : real; deriv : boolean): real;
begin
if(deriv=True) then Result:=(x*(1 - x)) else Result:=(1/(1 + exp(-x)));
end;

begin
//writeln(nonlin(1, False));

//Giving inout and output parameters
x:=new integer[3](0,1,1);
y:=1;
end.
