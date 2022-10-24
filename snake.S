.org $8000

;--------------------------------
start:
;--------------------------------
JSR moveSnake
JSR drawSnake
JSR drawApple
JMP start

;--------------------------------
moveSnake:
;--------------------------------
LDA $4000 ; read from the keyboard
CMP #$01
BEQ up
LDA $4000 ; read from the keyboard
CMP #$02
BEQ down
LDA $4000 ; read from the keyboard
CMP #$04
BEQ left
LDA $4000 ; read from the keyboard
CMP #$08
BEQ right
LDA $4000 ; read from the keyboard
CMP #$71  ;"Q"
BEQ gameOver ;TODO: Sistemare il "Quit"
RTS

up:
JSR clearsnake
TYA
ADC #$eF
TAY
RTS

down:
JSR clearsnake
TYA
ADC #$0F
TAY
RTS

left:
JSR clearsnake
DEY
RTS

right:
JSR clearsnake
INY
RTS

;--------------------------------
clearsnake:
;--------------------------------
LDA #0
;STA $0300,Y
RTS


;--------------------------------
drawSnake:
;--------------------------------
LDA #05
STA $0200, Y
RTS



;--------------------------------
drawApple:
;--------------------------------
LDA #09
STA $0235
RTS


;--------------------------------
gameOver:
;--------------------------------

.goto $FFFA
.dw start
.dw start
.dw start