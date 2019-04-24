#Jordan Chiristian
#CS320 POCO MIPS Project


.data

greeting: .asciiz "Please enter the number of terms: "
sequence: .asciiz "Here is your Fibonacci Sequence:"
NewLine: .asciiz "\n"

#All 'NewLine' instructions are for formatting purposes. Puts each number on its own line.

.globl main
.text

# $s0 = term1, $s1 = term2, $s2 = n, $s3 = sum, $s4 = i

main:
     addi $sp, $sp, -24          #Creates Stack
     sw   $ra, 20($sp)           #Saves Return Address to Stack
     sw   $fp, 16($sp)           #Saves Frame Pointer to Stack
     move $fp, $sp

     add  $s0, $s0, $zero        #Initialize term1 to 0
     sw   $s0, 4($fp)            #Save to Stack
     addi $s1, $s1, 1            #Initialize term2 to 1
     sw   $s1, 8($fp)            #Save to Stack

     li   $v0, 4                 #Tells system we want to print a string
     la   $a0, greeting          #Inputs string
     syscall                     #Execution of string

     li   $v0, 5                 #Tells system we are taking input number from user
     syscall
     move $s2, $v0               #Free's up $v0, value now stored in $s2 (n)

     addi $s4, $s4, 1            #Initialize i to 1

     li   $v0, 4                 #Prints new line
     la   $a0, NewLine
     syscall

     li   $v0, 4                 #Prints sequence, which is declared up top
     la   $a0, sequence
     syscall

     li   $v0, 4                 #Prints new line so first number will appear below sequence string
     la   $a0, NewLine
     syscall

     li   $v0, 1                 #Prints 0, 1st in Fib Sequence
     move $a0, $s0
     syscall

     addi $s2, $s2, 1            #Increases n by 1, allows nth number to be used in for loop when we compare

     li   $v0, 4                 #Prints new line, first number of For-Loop will be printed below 0
     la   $a0, NewLine
     syscall



Loop:
     slt  $t1, $s4, $s2           #If i < n, $t1 = 1, else $t1 = 0
     beq  $t1, $zero, DONE        #Compares $t1 and $zero, if false loop coninues

     li   $v0, 1                  #Tells the system we want to print a number
     move $a0, $s1                #term1 is in $s0, we want to move it to $a0 to print
     syscall

     li   $v0, 4                  #Prints new line, the new number will be below previous
     la   $a0, NewLine
     syscall

     lw   $s0, 4($fp)             #loads term1 from Stack
     lw   $s1, 8($fp)             #loads term2 from Stack
     add  $s3, $s0, $s1           #sum = term1 + term2
     sw   $s3, 12($fp)            #Saves value of sum to Stack

     lw   $s0, 8($fp)             #term1 = term2
     sw   $s0, 4($fp)

     lw   $s1, 12($fp)            #term2 = sum
     sw   $s1, 8($fp)

     addi $s4, $s4, 1             #i++
     b Loop                       #Continues For Loop


DONE:
     li   $v0, 10                 #Terminates running of program, boom we are done.
     syscall


