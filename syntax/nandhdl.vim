"Vim syntax file
"Language: nand2tetris Hardware Description Language
"Maintainer: Christopher Noussis
"Latest Revision: 14 January 2015
"TODO: Fix syntax names to work with accepted style convention
"syn keyword [languageName][SyntaxElementName]

if exists("b:current_syntax")
    finish
endif

"Comments.
syn match hdlComment "\/\/.*$"
syn region hdlComment start='\/\*' end='\*\/'
syn region hdlComment start='\/\*\*' end='\*\/'

"The all-caps basic language keywords.
syn keyword basicKeywords CHIP PARTS IN OUT BUILTIN CLOCKED

"Builtin chips.
syn keyword builtInChips Nand Not And Or Xor Mux DMux
syn keyword builtInChips Not16 And16 Or16 Mux16
syn keyword builtInChips Or8Way Mux4Way16 Mux8Way16 DMux4Way DMux8Way
syn keyword builtInChips HalfAdder FullAdder Add16 ALU Inc16
syn keyword builtInChips DFF Bit Register ARegister DRegister
syn keyword builtInChips RAM8 RAM64 RAM512 RAM4K RAM16K
syn keyword builtInChips PC ROM32K Screen Keyboard

"External 
syn keyword extPin in out nextgroup=busNumber 
syn match busNumber '\[\d*\]' "TODO: Make it so the braces are not matched.
syn region hdlInterface start='{' end='}' fold transparent 

"Internal
syn region hdlImplementation start=':' end='}' fold transparent
syn region partInterface start='(' end=')' contains=connection, extPin
"syn match connection '\w\+(\[\d+\])\*=\w\+(\[\d+\])\*' 
syn match connection '\w\+=\@=' contained
syn match connection '=\@<=\w\+' contained

let b:current_syntax = 'chip'
"Syntax Highlighting
hi def link hdlComment Comment
hi def link basicKeywords Statement
hi def link builtInChips Special
hi def link extPin Type
hi def link busNumber Constant
hi def link connection Identifier
