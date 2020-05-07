;Calcule a série de fibonacci, sendo
; RAM[0] o valor que define o tamanho da
; série e RAM[5] o seu inicio
;
; RAM[0]:  5     <--- Tamanho da série (sempre > 2)
; RAM[1]:        ---- livre para uso!     
; RAM[2]:        ---- livre para uso!
; ....
; RAM[5]:  1       -- inicio
; RAM[6]:  1       |
; RAM[7]:  2       |
; RAM[8]:  3       |
; RAM[9]:  5       v série (N=5)

; bota zero na ram 1 para percorrer as rams
leaw $0, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

; valores iniciais de fibonacci
leaw $5, %A
movw $1, (%A)
leaw $6, %A
movw $1, (%A)

; subtrai 2 da ram[0]
;leaw $2, %A
;movw %A, %D
leaw $0, %A
movw (%A), %D
decw %D
decw %D
movw %D, (%A)

VOLTA:
;zera a ram que guarda a soma
leaw $2, %A
movw $0, (%A)

leaw $0, %A
movw (%A), %D
leaw $FIM, %A
je
nop

leaw $1, %A
movw (%A), %D
leaw $6, %A
addw %A, %D, %A 

; soma = atual
movw (%A), %D
leaw $2, %A
movw %D, (%A)

;pegando o indice da anterior
leaw $1, %A
movw (%A), %D
leaw $5, %A
addw %D, %A, %A 


; D = soma + ant
movw (%A), %D
leaw $2, %A
addw (%A),%D, %D

;soma = soma + ant (D)
leaw $2, %A
movw %D, (%A)



leaw $1, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $6, %A
addw %D, %A, %D

; copia resultado no indice futuro
leaw $index, %A
movw %D, (%A)

leaw $2, %A
movw (%A), %D

leaw $index, %A
movw (%A), %A
movw %D, (%A)


leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $VOLTA, %A
jmp
nop


FIM:
