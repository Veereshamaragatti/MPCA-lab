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

    BL example     ; Call the function example
    STR R0, [R4]   ; Store the result (F) in memory at address F

    SWI 0X011      ; Software Interrupt to end the program

example:
    SUB R13, R13, #12   ; Allocate space for local variables on the stack
    STR R6, [R13, #8]   ; Store the value of R6 (used for intermediate calculation) on the stack
    STR R5, [R13, #4]   ; Store the value of R5 (used for intermediate calculation) on the stack
    STR R4, [R13, #0]   ; Store the value of R4 (used for saving the return value) on the stack

    ADD R5, R0, R1      ; Calculate (g + h)
    ADD R6, R2, R3      ; Calculate (I + j)
    SUB R4, R5, R6      ; Calculate (g + h) - (I + j) and store the result in R4 (F)

    MOV R0, R4          ; Move the result (F) to R0 for returning

    LDR R4, [R13, #0]   ; Restore the value of R4 from the stack
    LDR R5, [R13, #4]   ; Restore the value of R5 from the stack
    LDR R6, [R13, #8]   ; Restore the value of R6 from the stack

    ADD R13, R13, #12   ; Deallocate space for local variables on the stack
    MOV PC, LR          ; Return from the function

.DATA 
    F: .WORD 0           ; Define variable F with initial value 0
