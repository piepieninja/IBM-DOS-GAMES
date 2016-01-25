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
var isDOS  : boolean;
var cont   : char;
{this will randomly give live to this percentage of cells each step. if 0.0 then it is off and 0.04 would be 4%}
var randomLife : real;
{set the terminal width and height here... the grid must always be square!}
var width  : integer; {default}
var height : integer; {default}
{var grid   : array of array of boolean;}
{var temp   : array of array of boolean;}
var grid : array[1..60, 1..30] of boolean;
var temp : array[1..60, 1..30] of boolean;
{set the loop num}
var x      : integer;
{the population iteration variable}
var iter   : integer;
{for old pascal}
var passer : integer;

procedure fillGrid(var pass : integer);
var i : integer;
var j : integer;
begin
   {writeln('entered fill grid');}
   {writeln('testing random: ', Random);}
   for i := 1 to height do
   begin
      for j := 1 to width do
      begin
	 if Random > 0.65 then {make a good number of cells}
	 begin
	    grid[i][j] := true;
	    temp[i][j] := true;
	 end
	 else
	 begin
	    grid[i][j] := false;
	    temp[i][j] := false;
	 end
      end;
   end;
end;

procedure printGrid(var pass : integer);
var i :  integer;
var j :  integer;
begin
   for i := 1 to height do
   begin
      for j := 1 to width do
      begin
	 {woot print the thing!}
	 if j = width then
	    if grid[i][j] then
	       writeln('X')
	    else
	       writeln(' ')
	 else
	    if grid[i][j] then
	       write('X')
	    else
	       write(' ')
      end;
   end;
end;

function countNeighbors(i,j : integer): integer;
var count : integer;
begin
   count := 0;
   if ((i < height + 1) and (j < width + 1) and (i > 1) and (j > 1)) then
   begin
      if grid[i-1][j-1] then Inc(count);
      if grid[i][j-1]   then Inc(count);
      if grid[i+1][j-1] then Inc(count);
      if grid[i-1][j]   then Inc(count);
      if grid[i][j]     then Inc(count);
      if grid[i+1][j]   then Inc(count);
      if grid[i-1][j+1] then Inc(count);
      if grid[i][j+1]   then Inc(count);
      if grid[i+1][j+1] then Inc(count);
   end;
   {the edge cases could be added}
   countNeighbors := count;
end;

procedure step(var pass : integer);
var i :   integer;
var j :   integer;
var c :   integer;
begin
   {calculate next step}
   for i := 1 to height do
   begin
      for j := 1 to width do
      begin
	 c := countNeighbors(i,j);
	 if c <= 2 then
	 begin
	    temp[i][j] := false;
	 end
	 else if (c = 2) or (c = 3) and (grid[i][j]) then
	 begin
	    temp[i][j] := true;
	 end
	 else if (c > 3) then
	 begin
	    temp[i][j] := false;
	 end
	 else if (c = 3) then
	 begin
	    temp[i][j] := true;
	 end
      end;
   end;
   {fill from temp grid}
   for i := 1 to height do
   begin
      for j := 1 to width do
      begin
	 if Random < randomLife then
	    grid[i][j] := true
	 else
	    grid[i][j] := temp[i][j]
      end
   end;
end;

begin
   {take care of variable assignments here}
   isDOS := true;
   cont := 'y';
   randomLife := 0.04;
   width := 72;
   height := 23;
   x := 1;
   passer := 0;

   writeln('#==============================#');
   writeln('#  _      _____ ______ ______  #');
   writeln('# | |    |_   _|  ____|  ____| #');
   writeln('# | |      | | | |__  | |__    #');
   writeln('# | |      | | |  __| |  __|   #');
   writeln('# | |____ _| |_| |    | |____  #');
   writeln('# |______|_____|_|    |______| #');
   writeln('#                              #');
   writeln('#==============================#');
   while cont = 'y' do
   begin
      writeln('How many itterations would you like? note, 100 iterations is subtsantial.');
      write('>> ');
      readln(iter);

      writeln('What would you like the random population generation percentage');
      writeln('to be? (in decemal format XXX.XXX). note, that 0.04 is substantial.');
      write('>> ');
      readln(randomLife);
      (*
      writeln('Enter the width of the grid. Default is 60');
      write('>> ');
      readln(width);

      writeln('Enter the height of the grid. Default is 60');
      write('>> ');
      readln(height);

      writeln('array size: ',width*height);

      setlength(grid,width,height);
      setlength(temp,width,height);
      *)

      Randomize;
      fillGrid(passer);
      while x < iter do {don't do it forever because I can't find out how to sig kill it}
      begin
         clrscr;
	 x := x + 1;
	 printGrid(passer);
	 write('step: ',x);
	 step(passer);
	 {Delay(100);} {the computer prints plenty slow without this}
      end;

      writeln('');
      x := 1; {reset clock}
      write('Life ran ', iter);
      write(' iterations. Do you want to run Life again? (y/n)');
      writeln('');
      write('>> ');
      readln(cont);

   end;
end.
