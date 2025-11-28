; function is int loverlap(int p1j, int p2j, int p1k, int p2k)

; This function calculates the amount of overlap between two intervals (ranges) on a 1D line. In the context of your Labanotation project, this is used to check if two symbols overlap in time (vertical y-axis) or space (horizontal x-axis).

; if ((p1j > p2j)||(p1k > p2k)) { ... } ensures that start coordinates of i range and j range must be less than or equal to (<=) to the end coordinates. We assume for this assembly function tht th input starts and ends are valid.

; The core logic determines the intersection of the two ranges. The length of an intersection between two ranges [A, B] and [C, D] is found by calculating: Overlap = Minimum End - Maximum Start = min(End1, End2) - max(Start1, Start2)

; Positive Result: If lap > 0, the symbols overlap by that amount.
; Zero or Negative: If lap <= 0, the symbols do not overlap (or just touch at the edge).

; i did use an LLM for help in this.

; System V AMD64 ABI's Calling Convention dictates exactly how C/C++ functions pass arguments to Assembly functions. When your C++ code calls loverlap(p1j, p2j, p1k, p2k), the compiler automatically places the arguments into specific registers before the call instruction jumps to your Assembly code. (p1j in EDI, p2j in ESI, p1k in EDX, p2k in ECX). They are placed in 32-bit registers because type int on c/c++ on x86_64 Linux is 32 bits (4 bytes)

section .text
    global loverlap

loverlap:
    ;finding maximum start
    mov eax, edi ;moving p1j to eax (eax contains max start)
    cmp edx, edi ;cmp compares source to detination and assigns a status flag
    cmovg eax, edx ;if p1k > p1j, move p1k into eax


    ;finding minimum end
    cmp ecx, esi ;compare p2j (ESI) with p2k (ECX), ESI will hold min end value finally
    cmovl  esi, ecx ;if p2k < p2j, move p2k into ESI. ESI now holds min end value


    ; finding overlap
    sub esi, eax        ; ESI = ESI - EAX
    mov eax, esi        ; Move the final result into EAX for return

    ret