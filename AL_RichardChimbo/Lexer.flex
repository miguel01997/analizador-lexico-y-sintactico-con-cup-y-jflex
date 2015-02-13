package al_richardchimbo;
import java_cup.runtime.*;

%%
%class Lexer
%line
%column
%cup

A=[a-zA-Z]
N=[0-9]+[0-9]*
WHITE=[ \t\n\r]
FINLINEA=[_]

%{
public String tipo;
private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

%}

%%
<YYINITIAL>{
{WHITE} {/**Ignore*/}
//Se declara los operadores
"Convertir"|"convertir" {return symbol(sym.OPERADOR);}

//{N} {return symbol(sym.VARIABLE);}
{N}	{ return symbol(sym.VARIABLE, new Double(yytext())); }

// FINLINEA
{FINLINEA} {return symbol(sym.FINLINEA);}
//PALABRAS RESERVADAS
"Kilogramo"|"kg"|"kilogramo" {return symbol(sym.KILOGRAMO);} 
"Libra"|"lb"|"libra" {return symbol(sym.LIBRA);}
"Onza"|"onz"|"onza" {return symbol(sym.ONZA);}
ain
[^] { throw new Error("A Ingresado un caracter ilegal ==> <"+yytext()+">"+"linea "+yyline+" Columna "+yycolumn);}
}