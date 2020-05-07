;---------------------------------------------------------
; Transcreva o pseudocódigo a seguir para assembly do Z01.1:
;
; 
;    if ( RAM[1] == 1 && RAM[2] > 2 ):
;        RAM[5] = 1
;    else
;        RAM[6] = -2
;
;---------------------------------------------------------

leaw $1, %A
movw (%A), %D
decw %D
leaw $PULO, %A
jne
nop
leaw $2, %A
movw (%A), %D
subw %D, %A, %D
leaw $PULO, %A
jle
nop
leaw $1, %A
movw %A, %D
leaw $5, %
movw %D, (%A)
leaw $FIM, %A
jmp
nop

PULO:
leaw $2, %A
movw %A, %D
negw %D
leaw $6, %A
movw %D, (%A)

FIM:
