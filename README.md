# IBM-DOS-GAMES
#### games and custom programs for my old 1989 IBM PS/2

### HOW TO USE:
this requires the free pascal compiler located at:
[http://www.freepascal.org/](http://www.freepascal.org/ "free pascal")
the fpc can also be downloaded directly from: [free pascal downloads](http://www.freepascal.org/download.var "downloads")

you must add this path to your .bashrc (or .zshrc) file:

<code>export PATH=/usr/local/bin:$PATH</code>

name your files with the extension:

<code>*.pas</code>

to compile the program run:

<code>fpc filename.pas</code>

to name the executable from your program type what you want in the 'xxx' spot:

<code>fpc filename.pas -oxxx</code>

#### Convert to DOS
before the program can be run on an old IBM computer it must be converted into
a readable format by addint the carriage return character. do do this run the
convert script:

<code>./convert filename</code>

or

<code>./convert fiulepath/filename</code>


### REQUIREMENTS:
* GNU sed - brew install gsed
* the free pascal compiler - [http://www.freepascal.org/](http://www.freepascal.org/ "free pascal")