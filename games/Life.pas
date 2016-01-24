(* 
 Author: Caleb Adams 
 Contact: CalebAshmoreAdams@gmail.com
 REPO: https://github.com/piepieninja/IBM-DOS-GAMES
 Discription: This is conway's game of life written in the pacscal programming
 language for an IBM PS/2
 This is free software! Do whatever!
*)

program Life;
uses Crt;

{set some globals so that the program can easily toggle between DOS and OSX}
var isDOS : boolean = false;
   {set the terminal width and height here... but it also has to be ch}
var grid  : array[1..20, 1..20] of char;

procedure fillGrid();
var i : integer;
var j : integer;
begin
   for i := 1 to length(grid) do
   begin
      for j := 1 to length(grid) do
      begin
	 if Random > 0.65 then
	    grid[i][j] := 'X'
	 else
	    grid[i][j] := ' '
      end;
   end;
end;

procedure printGrid();
var i :  integer;
var j :  integer;
begin
   for i := 1 to length(grid) do
   begin
      for j := 1 to length(grid) do
      begin
	 {woot print the thing!}
	 if j = length(grid) then
	    writeln('', grid[i][j])
	 else
	    write('', grid[i][j])
      end;
   end;
end;

begin
   writeln ('Hello, world.');
   fillGrid();
   printGrid();
   {clrscr;}
end.
