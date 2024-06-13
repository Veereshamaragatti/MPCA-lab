; Program: Find the Largest Element in an Array

.DATA
    A: .WORD 10, 20, 30, 40, 50   ; Define array A with 5 elements

.TEXT
    LDR R1, =A       ; Load the address of array A into register R1
    LDR R0, [R1]     ; Load the first element of the array into register R0, initially set as the largest element

    MOV R3, #0       ; Initialize count register to 0

LOOP:
    LDR R2, [R1, #4]!  ; Load the next element of the array into register R2, and increment the address by 4 bytes
    CMP R0, R2          ; Compare the largest element (R0) with the current element (R2)
    BLT Less            ; Branch to Less if R0 is less than R2

    ; If R0 is greater than or equal to R2, continue looping
    ADD R3, R3, #1     ; Increment the count register
    CMP R3, #4         ; Compare the count with the total number of elements in the array
    BNE LOOP           ; If count is not 4 (not all elements compared), repeat the loop
    B EXIT             ; Branch to EXIT if all elements are compared

Less:
    MOV R0, R2         ; If R0 is less than R2, update R0 with the value of R2
    B LOOP             ; Branch back to LOOP to continue comparing remaining elements

EXIT:
    SWI 0X011          ; Software Interrupt to end the program
