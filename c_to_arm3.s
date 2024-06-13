;int example( int g, int h, int I, int j)
;{ int f;
; f= (g+h)-(i+j);
;return f;
;}
.TEXT
    LDR R4, =F     ; Load the address of variable F into R4
    MOV R0, #5     ; Assign value 5 to variable g (G)
    MOV R1, #10    ; Assign value 10 to variable h (H)
    MOV R2, #1     ; Assign value 1 to variable I
    MOV R3, #4     ; Assign value 4 to variable j (J)

    ; PASS PARAMETERS TO STACK
    SUB R13, R13, #16  ; Allocate space for parameters on the stack
    STR R0, [R13, #12]  ; Store the value of R0 (G) on the stack
    STR R1, [R13, #8]   ; Store the value of R1 (H) on the stack
    STR R2, [R13, #4]   ; Store the value of R2 (I) on the stack
    STR R3, [R13, #0]   ; Store the value of R3 (J) on the stack

    BL example     ; Call the function example

    STR R0, [R4]   ; Store the result (F) in memory at address F

    SWI 0X011      ; Software Interrupt to end the program

example:
    LDR R5, [R13, #0]   ; Load the value of J from the stack into R5
    LDR R6, [R13, #4]   ; Load the value of I from the stack into R6
    LDR R7, [R13, #8]   ; Load the value of H from the stack into R7
    LDR R8, [R13, #12]  ; Load the value of G from the stack into R8

    ADD R9, R7, R8   ; Calculate G + H
    ADD R10, R5, R6  ; Calculate I + J
    SUB R11, R9, R10 ; Calculate (G + H) - (I + J) and store the result in R11 (F)

    MOV R0, R11      ; Move the result (F) to R0 for returning

    ADD R13, R13, #16  ; Deallocate space for parameters on the stack
    MOV PC, LR        ; Return from the function

.DATA 
    F: .WORD 0           ; Define variable F with initial value 0
