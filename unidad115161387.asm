;Israel Morgan Martinez lenguaje de interfaz
;Lo hice en ingles xd
SYS_EXIT equ 1
SYS_PRINT equ 4
STDOUT equ 1

;4(2) + 3(2)² - 2³

section .data
    message db 10,13,"The result is="
    length equ $- message

    message2 db 10,13,"--------------------------",10,13
    length2 equ $- message2
    number equ 2

segment .bss
    firstResult resb 1
    secondResult resb 1
    thirdResult resb 1
    finalResult resb 1

section  .text
    	global _start
  _start:

        ;primera operacion multiplicacion
        mov eax,4
        mov ebx,number
        mul ebx
        mov [firstResult],eax

        ;segunda operacion division despues de una multiplicacion
        mov eax,number
        mul eax
        mov ebx,3
        mul ebx
        mov ecx,2
        div ecx
        mov [secondResult], eax

        ;multiplicacion de 2*2*2 igual a 2²
        mov eax, number
        mov ebx, number
        mul ebx
        mul ebx
        mov [thirdResult],eax
        ;imprimo el resultado es:
        mov eax,SYS_PRINT
        mov ebx,STDOUT
        mov ecx,message
        mov edx,length
        int 0x80

        ;suma
        mov eax,[firstResult]
        mov ebx,[secondResult]
        mov ecx, [thirdResult]
        add eax, ebx

        ;resta final
        sub eax,ecx



        add eax,'0'
        mov [finalResult],eax
        mov eax, SYS_PRINT
      	mov ebx, STDOUT
      	mov ecx, finalResult
      	mov edx, 1
      	int 0x80

        ; para la linea final
        mov eax,SYS_PRINT
        mov ebx,STDOUT
        mov ecx,message2
        mov edx,length2
        int 0x80

        ;salida
        mov eax, SYS_EXIT
      	xor ebx, ebx
      	int 0x80
