;C statement:       while( save[i] == k)
;                        i+=1;

.TEXT
    LDR  R1, =K         ; Load the address of K into R1
    LDR  R0, [R1]       ; Load the value of K into R0
    LDR  R2, =SAVE      ; Load the starting address of the array SAVE into R2
    MOV  R3, #0         ; Initialize I to 0

LOOP:
    ADD  R5, R2, R3, LSL #2   ; Calculate the memory address (SAVE + I*4) and store it in R5
    LDR  R6, [R5]             ; Load the value at memory address R5 into R6 (save[i])

    CMP  R0, R6               ; Compare the value of K (R0) with the value at save[i] (R6)
    BNE  EXIT                 ; Branch to EXIT if save[i] != K

    ADD  R3, R3, #1           ; Increment I by 1
    CMP  R3, #5               ; Compare I with the size of the array (5)
    BNE  LOOP                 ; Branch to LOOP if I is less than 5 (not all elements checked)

EXIT:
    SWI  0X011                ; Software Interrupt to end the program

.DATA
    K:    .WORD 5             ; Define the value of K
    I:    .WORD 0             ; Define the value of I (initialized to 0)
SAVE:    .WORD 5, 5, 5, 50, 35, 40  ; Define array SAVE
