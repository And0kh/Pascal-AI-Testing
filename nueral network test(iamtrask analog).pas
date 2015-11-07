program SingleInputTest;

var
x : array[1..4, 1..3] of byte:=((0, 0, 1), (0, 1, 1), (1, 0, 1), (1, 1, 1));
l0 : array[1..4, 1..3] of byte;
y : array[1..4, 1..1] of byte:=((0), (0), (1), (1));
syn0 : array[0..1, 1..3] of real;
l1, l1_error, l1_delta : byte;
i, isyn0, il01, il02, syn1, idotfunc : integer;

function nonlin(x : real; deriv : boolean): real;
begin
  if(deriv=True) then Result:=(x*(1 - x)) else Result:=(1/(1 + exp(-x)));
end;

begin
  //writeln(nonlin(1, False));
  for isyn0:=1 to 3 do syn0[1, isyn0]:=random(2);{for isyn0:=1 to 3 do writeln(syn0[1, isyn0]);}

  for i:=1 to 10000 do
  begin
    //Forward propagation
    for il01:=1 to 4 do
      for il02:=1 to 3 do
        l0[il01, il02]:=x[il01, il02];
    
    //l1

  end;
end.
