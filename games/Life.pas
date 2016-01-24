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
{set the terminal width and height here}
var grid  : array[1..20, 1..20] of char;

procedure fillGrid(g : array of char)
var i : 1..size;
var j : 1..size; 
begin
   for i := 1 to size do
   begin
      for j := 1 to size do
      begin
	 writeln("ayy ");
      end
   end
end
		      
begin
   writeln ('Hello, world.');
   clrscr;
end.
