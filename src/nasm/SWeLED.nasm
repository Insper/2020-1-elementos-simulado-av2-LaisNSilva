; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = SW9 OFF ON ON ON OFF !SW3 !SW2 ON OFF

; Ler o que está na chave
leaw $21185, %A
movw (%A), %D 

; copia para o LED
leaw $21184, %A
movw %D, (%A) 

; inverte tudo
leaw $21184, %A
movw (%A), %D 
notw %D
movw %D, (%A) 

; desinverte o ultimo
; soma com o numero 1000000000
leaw $21184, %A
movw (%A), %D 
leaw $512, %A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)


; fazer and como o numero  1000001100
leaw $21184, %A
movw (%A), %D 
leaw $524, %A
andw %A, %D, %D
leaw $21184, %A
movw %D, (%A)

; Agora tenho SW9 00000 !SW3 !SW2 00
; vou somar com o numero 0011100010
leaw $21184, %A
movw (%A), %D 
leaw $226, %A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)
