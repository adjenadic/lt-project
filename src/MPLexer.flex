import java_cup.runtime.*;

%%
%class MPLexer

%cup

%line
%column

%eofval{
	return new Symbol(sym.EOF);
%eofval}

%{
   public int getLine() { return yyline; }
%}

%state COMMENT
number = [0-9]
dec = [1-9]+{number}* | 0
hex = [0-9a-fA-F]+
int = \${hex} | {dec}

letter = [a-zA-Z]

symbol = [\!\@\#\$\%\^\&\*\(\)\"\'\+\-\,\.\/\:\;\<\=\>\?\[\]\\\_\`\{\}\|\~]
char = \'{symbol}\'

%%
\-\-			   { yybegin(COMMENT); }
<COMMENT>\-\-	{ yybegin(YYINITIAL); }

[\t\r\n ]		{ ; }

"stressin"		{ return new Symbol(sym.STRESSIN); }
"vibin"			{ return new Symbol(sym.VIBIN); }
"mf"				{ return new Symbol(sym.MF); }
"dippin"			{ return new Symbol(sym.DIPPIN); }
"lackin"			{ return new Symbol(sym.LACKIN); }

"&&"			   { return new Symbol(sym.AND); }
"||"			   { return new Symbol(sym.OR); }
"<"			   { return new Symbol(sym.LESSTHAN); }
"<="			   { return new Symbol(sym.LESSEQUAL); }
"tbh"			   { return new Symbol(sym.TBH); }
"cappin"			{ return new Symbol(sym.CAPPIN); }
">"			   { return new Symbol(sym.MORETHAN); }
">="			   { return new Symbol(sym.MOREEQUAL); }

"sussin"			{ return new Symbol(sym.SUSSIN); }
"bussin"			{ return new Symbol(sym.BUSSIN); }

"rn"				{ return new Symbol(sym.RN); }
","				{ return new Symbol(sym.COMMA); }
"be"				{ return new Symbol(sym.BE); }
"skrr"			{ return new Symbol(sym.SKRR); }
"skrrt"			{ return new Symbol(sym.SKRRT); }
"highkey"		{ return new Symbol(sym.HIGHKEY); }
"lowkey"			{ return new Symbol(sym.LOWKEY); }

"chief"		   { return new Symbol(sym.CHIEF); }
"fr"			   { return new Symbol(sym.FR); }
"rack"		   { return new Symbol(sym.RACK); }
"bag"			   { return new Symbol(sym.BAG); }
"do"			   { return new Symbol(sym.DO); }
"while"			{ return new Symbol(sym.WHILE); }
"poppin"		   { return new Symbol(sym.POPPIN); }

({letter}|"_")({letter}|{number}|"_")*    { return new Symbol(sym.ID); }

{int}|{char}	{ return new Symbol(sym.CONST); }

.				   { System.out.println("ERROR: " + yytext()); }
