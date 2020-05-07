; Preenche a memória RAM
; com um contador progresssivo. O valor
; da RAM[2] tem o tamanho total do vetor.
; O vetor deve começar em RAM[3]
;
; RAM[0] e RAM[1] podem ser usados livremente
;
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  
; RAM[1]:     | RAM[1]:  
; RAM[2]:  4  | RAM[2]:  4
; RAM[3]:  0  | RAM[3]:  0 -
; RAM[4]:  0  | RAM[4]:  1 | vetor
; RAM[5]:  0  | RAM[5]:  2 | 
; RAM[6]:  0  | RAM[6]:  3 -
; RAM[7]:  0  | RAM[7]:  0

leaw $0, %A
movw %A, (%A)

leaw $2, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)

VOLTA:
leaw $1, %A
movw (%A), %D
leaw $FIM, %A
je
nop
leaw $0, %A
movw (%A), %D
leaw $3, %A
addw %A, %D, %A
movw %D, (%A)

leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $1, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $VOLTA, %A
jmp
nop


FIM:





