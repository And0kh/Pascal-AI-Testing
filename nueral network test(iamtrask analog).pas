program SingleInputTest;

var
x : array[1..4, 1..3] of byte:=((0, 0, 1), (0, 1, 1), (1, 0, 1), (1, 1, 1));
y : array[1..4, 1..1] of byte:=((0), (0), (1), (1));
l0, l1, l1_error, l1_delta : byte;
i, syn0, syn1 : integer;

function nonlin(x : real; deriv : boolean): real;
begin
if(deriv=True) then Result:=(x*(1 - x)) else Result:=(1/(1 + exp(-x)));
end;

begin
//writeln(nonlin(1, False));

end.
