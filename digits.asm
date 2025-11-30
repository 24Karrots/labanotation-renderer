; function to be called by led.cpp
; to return the number of decimal digits in n

; Original function:
; int digits(int n)
;    int k;
;    int tens;
;    k = 0;
;    for (tens = 1; tens < n; tens = tens * 10) {
;        k++;
;    }
;    return k;
;


global digits
section .text

digits:
    push rbp
    mov rbp, rsp    ; set up stack frame, push rbp to start the function

    ; parameter n in edi
    xor eax, eax    ; so that k = 0
    mov ecx, 1      ; tens = 1

.loop:
    ; while (tens < n)
    cmp ecx, edi    ; n is already in edi when fn starts
    jge .fin

    ; k++ increment
    inc eax

    ; tens *= 10
    imul ecx, ecx, 10

    jmp .loop

.fin:
    pop rbp
    ret

