# vim

## Basics
```zsh
:q # quit
:wq # save and quit
:q! # quit without saving
esc # leave current mode
u # undo last action
:set number # add line numbers
. # re-do last command
```

## Copy & Paste
```zsh
yy # copy line to vim clipboard
p # insert line from vim clipboard below
P # insert line from vim clipboard above
```

## Insert Mode
```zsh
i # enter insert mode
I # enter insert mode at the beginning of the line
a # enter insert mode on the next character
A # enter insert mode on the end of the line
o # add new line below and enter insert mode
O # add new line above and enter insert mode
```

## Other Modes
```zsh
v # enter visual mode
V # enter visual line mode
R # enter replace mode
```

## Navigation
```zsh
j # go one line down
k # go one line up
h # go to the left
l # go to the right
G # go to the end of the file
gg # to to the top of the file
0 # go to start of the line
$ # go to end of the line
:10 # go to line 10
{ # go one block up
} # go one block down
20j # go down 20 lines
4k # go up 4 lines
9{ # go up 9 paragraphs
3} # go down 3 paragraphs
w # go to next word
b # go to previous word
^ # go to first word of the line
W # go to next word after space
B # go to previous word before space
ta # go before the next a
f? # go exactly to the next ?
% # toggle between two braces
* # go to next occurence of current word
; # go to next same character
z # center cursor
```

## Deleting
```zsh
x # delete current letter
10x # delete 10 letters
dd # delete current line and copy it to clipboard
5dd # delete 5 lines
d} # delete block below
d{ # delete block above
dw # delete current word
D # delete rest of the line
C # delete rest of the line and go into insert mode
cw # delete current word and go into insert mode
```
