I) Um somador hin?rio de n bits ? um sistema combinacional que tem duas entradas (x e y) de n bits que

representam Os operandos da opera??o de adi??o e uma sa?da de n bits que representa O resultado. Sinais

adicionais de entrada ? sa?da. chamados de carry-in (cin) e carry-out (cout) s?o usados para facilitar implementa??o de somadores maiores.

(a) Projete com VHDI estrutural um somador completo de um bit (com Os carries), utilizando somente portas l?gicas. \[Entregar VHDI, estrutural]

(b) Elabore uma simula??o para testar o funcionamento do seu circuito. \[Entregar forma de onda

(c) Usando o circuito do item (b) implemente um somador ripple-carry adder de 4 bits O circuito deve

ter uma sa?da adicional para indicar overflow. \[Entregar VHDL]

(d) Instancie O componente ripple-carry adder do item anterior no circuito demo_setup (elaborado no

Laborat?rio 2) e fa?a as seguintes liga??es de entrada e sa?da: 8 toggle switches para as duas entradas

de 4 bits: resultado da soma no display de segmentos hexadecimal: overflow em um LED

(e) Implemente um somador ripple-carry de 8 bits.e me?a  tempo de atraso utilizando.o timing analyzer.

(f) Implemente um somador ripple-carry de 32 bits e meca 0 tempo de atraso.

(g) Implemente um somador ripple-carry de 64 bits e me?a O tempo de atraso.

(h) Crie um pacote chamado adder package contendo Os circuitos criados.

(i) Reflita sobre a rela??o entre tempo de atraso e tamanho da entrada. IEntregar arquivo txt com Os

tempos dos itens (e), (f) e (g)]

2\) Uma unidade aritm?tica l?gica (arithmetic-logic un?t. ALU) ? um m?dulo capaz de realizar um conjunto

de fun??es aritm?ticas e l?gicas. Para isto. uma ALU tem vetores de entrada/sa?da de dados. bem como

entradas e sa?das de controle. A Figura  mostra uma poss?vel especifica??o de uma Al de 4 bits.

A(3:0) B(3:0)

4



4 z

C

N

So

ST

ALU

F(3:0)

P?gina 1 de 2

Disciplina: Linguagens de Descri??o de Hardware CI?NCIA do

COMPUTAC?O

Iniversidade Federal do Tocantin

Prof.: Tiago Almeida

Figura : ALU de 4 bits

A ALU da Figura I tem entradas (A e B) de 4 bits, So sinais de controle p?r? selecionar a opera?ao. A sa?da

\+ de 4 bits mostra O resultado da opera??o. Z ?  Se ? resultado da opera??o for zero. ? Ocaso contr?rio.

Os sinais C. V e N s?o don't care para Opera??es l?gicas e t?m O seguinte significado para Operacoes

aritm?ticas: C ?  se houver um carry em opera??es de soma: V? I se houver overflow; N  igual a  se o

resultado for negativo.

Os sinais de controle e suas respectivas opera??es s?o mostrados na Tabela 1'

So S1 Opera??o (F)

0 0AtR

OA-B

O AND

OR

Tabela 1: Opera??es ALU

(a) Estenda a implementa??o do seu display de 7 segmentos para mostrar. em decimal. n?meros negativos

de quatro bits em complemento de  no formato sinal-magnitude (se O resultado for negativo ser?

necess?rio complement?-lo). Use o LED do display mais ? esquerda P?ra indicar O sinal negativo.

\[Entregar VHDLI

(b) Usando 0 somador de 4 bits do pacote adder package (quest?o 1). implemente uma ALI] de quatro

bits com as opera??es descritas pela Tabela . IEntregar VHDL.I

(c) Simule O funcionamento da sua ALU para verificar Se sua implementa??o est? correta.

(d) Faca a simula??o funcional para alguns casos extremos (i.e. overflow).

(e) Instancie o circuito obtido no demo_setup. Fa?a as seguintes liga?oes: 8 toggle switches para as duas

entradas de 4 bits: resultado f no display de 7 segmentos hexadecimal: overflow em um I ED: 2 toggle

switches para selecionar a opera??o da ALU: 4 LEDs vermelhos para Os sinais de status da ALU (Z,

C. V.N. IEntregar VHDLI

P?gina 2 de 2
