;Program to find the sum of N NUMBERS ( use conditional branch ). 
Store the result in memory location
.DATA
    A:    .WORD 10,20,30,40,50,60,70,80,90,100   ; Array A
    SUM:  .WORD 0                                 ; Sum variable

.TEXT
    LDR R1, =A      ; Load the base address of array A into R1
    LDR R2, =SUM    ; Load the address of SUM variable into R2
    MOV R4, #0      ; Initialize sum to 0
    MOV R5, #1      ; Initialize count register to 1

L1: 
    LDR R3, [R1]    ; Load the next element of the array into R3
    ADD R4, R4, R3  ; Add the element to the running sum in R4
    ADD R1, R1, #4  ; Move to the next element by adding 4 bytes to the address in R1
    ADD R5, R5, #1  ; Increment the count register

    CMP R5, #11     ; Compare count with the number of elements (10)
    BNE L1          ; If count is not 11 (not all elements added), repeat the loop

    STR R4, [R2]    ; Store the sum in the SUM variable
    SWI 0x011       ; End of the program
