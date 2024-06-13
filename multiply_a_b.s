;This ARM assembly code multiplies corresponding elements in two arrays A and B, and stores the result in array C
.DATA
A: .word 1, 3, 5  ; Array A with initial values
B: .word 2, 4, 6  ; Array B with initial values
C: .word          ; Array C for storing results

.TEXT
    LDR R5, =A     ; Load the address of array A into R5
    LDR R6, =B     ; Load the address of array B into R6
    LDR R7, =C     ; Load the address of array C into R7
    MOV R3, #3     ; Number of elements in the arrays
    MOV R4, #0     ; Initialize R4 to store the result

Loop:
    LDR R1, [R5], #4  ; Load the next element of array A into R1, and increment the address by 4 bytes
    LDR R2, [R6], #4  ; Load the next element of array B into R2, and increment the address by 4 bytes
    MUL R0, R1, R2    ; Multiply the elements from arrays A and B, store result in R0
    ADD R4, R4, R0    ; Add the result to the accumulator R4
    STR R4, [R7], #4  ; Store the result in array C, and increment the address by 4 bytes
    SUB R3, R3, #1    ; Decrement the loop counter R3

    TEQ R3, #0        ; Test if the loop counter is 0
    BNE Loop          ; If not zero, continue looping

    SWI 0x11          ; Software Interrupt to terminate the program
