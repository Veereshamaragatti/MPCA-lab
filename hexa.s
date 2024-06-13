;Convert a given 2 digit hexadecimal number to ASCII CODE and store the result in the memory location X and X+1 using ARM7TDMI – ISA.
.TEXT
  LDR R3, =X        ; Load the address of label X into register R3
  MOV R1, #0x54     ; Move the immediate value 0x54 into register R1
  AND R0, R1, #0xF0 ; Perform bitwise AND between R1 and 0xF0, store result in R0
  MOV R0, R0, LSR #4 ; Logical shift right R0 by 4 bits, store result in R0
  ORR R0, R0, #0x30 ; Perform bitwise OR between R0 and 0x30, store result in R0
  STR R0, [R3]      ; Store the value in R0 at the memory address pointed by R3
  
  AND R2, R1, #0x0F ; Perform bitwise AND between R1 and 0x0F, store result in R2
  ORR R2, R2, #0x30 ; Perform bitwise OR between R2 and 0x30, store result in R2
  ADD R3, R3, #4    ; Increment the memory address stored in R3 by 4 bytes
  STR R2, [R3]      ; Store the value in R2 at the memory address pointed by R3

.DATA
X: .WORD 0,0        ; Define label X with two 16-bit (WORD) memory locations initialized to 0
