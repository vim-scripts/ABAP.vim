" Vim syntax file
" Language:	SAP/ABAP-4
" Maintainer:	Swapan Sarkar <swapan@yahoo.com>
" Last Change:	2002 July 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The ABAP reserved words, defined as keywords.

syn keyword abapSpecial 	false null true initial

syn keyword abapMacro		rp-low-high rp-provide-from-last rp-provide-from-first

syn keyword abapEvent		initialization start-of-selection get end-of-selection at top-of-page end-of-page

syn keyword abapKeyword		report tables infotypes line-size line-count 
syn keyword abapKeyword		constants data types field-symbols
syn keyword abapKeyword		ranges select-options parameters selection-screen

syn keyword abapCond		if else elseif endif 
syn keyword abapRepeat		loop endloop while endwhile do enddo

syn keyword abapOperator	not and or lt le gt ge eq ne co ca cs cn na ns cp np 	contained
syn keyword abapOperator	like for in is

syn keyword abapStatement 	write concatenate add subtract multiply divide move translate move-corresponding
syn keyword abapStatement 	delete insert select endselect update modify commit append
syn keyword abapStatement 	describe format condense message exit continue reject clear

syn region abapForm		start=/form/ end=/$/	contains=abapParam,abapComment,abapString,abapNumber
syn region abapForm		start=/perform/ end=/$/	contains=abapParam,abapComment,abapString,abapNumber
syn region abapForm		start=/call function/ end=/$/	contains=abapString,abapComment
syn keyword abapFunction	endform
syn match abapSystem		"sy-[a-z0-9]*"
syn region abapInclude		start=/include/ end=/$/ contains=abapComment 
syn region abapParen		start='(' end=')' contains=ALL transparent 

"syn keyword abapType	boolean char character date float integer long
"syn keyword abapType	mlslabel number raw rowid varchar varchar2 varray

" Strings and characters:
"syn region abapString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region abapString		start=/'/  skip=/\\\\\|\\'/  end=/'/

syn match abapIdentifier	/\<\l\+\>/

" Numbers:
syn match abapNumber		"-\=\<\d*\.\=[0-9_]\>"	contained

" Comments:
syn match abapLineComment	"\*.*" 
syn match abapComment	"\".*" 

syn sync ccomment abapComment

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_abap_syn_inits")
  if version < 508
    let did_abap_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink abapComment	Comment
  HiLink abapLineComment	Error
  HiLink abapMacro	Macro
  HiLink abapInclude	Include
  HiLink abapEvent	PreProc
  HiLink abapKeyword	abapSpecial
  HiLink abapOperator	abapStatement
  HiLink abapSpecial	Special
  HiLink abapStatement	Statement
  HiLink abapParam	String
  HiLink abapString	String
  HiLink abapType	Type
  HiLink abapNumber	Number
  HiLink abapChar	Character
  HiLink abapConstant	Constant
  HiLink abapForm	Function
  HiLink abapFunction	Function
  HiLink abapCond	Conditional
  HiLink abapRepeat	Repeat
  HiLink abapSystem	Identifier
  HiLink abapIdentifier	Identifier
  HiLink abapDebug	Debug

  delcommand HiLink
endif

let b:current_syntax = "ABAP"

" vim: ts=8
