
.data // use data section for non constant variables
input:  .word 0 // input string
.text // text section for constant strings
guess: .string "%s" // constant input string
startmsg1: .string "Hello %s!\nWelcome to Mastermind!\nThis is a game where you try to guess a hidden code.\nThe code will contain the first C (your sixth cmd argument) Letters in the alphabet, all capital.\n" // part of starting message
startmsg2: .string "Simply enter all your Letters without spaces to guess\nThe number under the letter B will tell you how many characters are correct, and in the correct position\n" // part of starting message
startmsg3: .string "The number under the letter W will tell you how many characters are correct but in the Wrong position\nThe number under S is your Score, and your remaining Time is under T\nEnter $ to Quit\nGood luck!\n" // part of starting message
cmd_error: .string "Wrong number of cmd arguments\n Remember, you need your name, the number of rows in the hidden code, the number of Letters per row in the hidden code, the number of Letters, and the number of Trials, and the mode you are in.\n" // wrong number of cmd message
codeLoading: .string "Code is being generated....\n" // message as the user waits
wrong_len: .string "There are %d Letters in the code." // wrong size message
invalid_char: .string "The letter range is %c to %c inclusive" // // inavalid character message
testMode: .string "Running Mastermind in test mode\nHidden code is: " // message for test mode
playMode: .string "Running Mastermind in play mode\n" // message for play mode
printchar: .string "%c" // message for test mode
number: .string " %d  " // debug
float: .string " %f  " // debug
wonGame: .string "Cracked!\nFinal Score:%.2f\nPlay again?\n" // message when player wins
lostonTime: .string "Lost on time.\nFinal Score: %.2f\nPlay again?\n" // message when player loses on time
lostonTrials: .string "Ran out of Trials.\nFinal Score: %.2f\nPlay again?\n" // message when player runs out of trials
lostonQuit: .string "Game exited.\nFinal Score: %.2f\nPlay again?\n" // message when player quits game
continuePrompt: .string "\nEnter any key to continue...\n" // prompts user to enter something 
guessPrompt: .string " \n Enter your guess \n"
C_lessthan_five: .string "Cannot play with less than 5 letters\n" // C < 5 string
R_lessthan_one: .string "Cannot play without any trials\n" // R < 1 string
C_lessthan_M: .string "The second number(number of letters per row) in the cmd args must be less than or equal to the third(number of letters) \n" // C< M string
N_lessthan_one: .string "Cannot play without any letters in the code\n"// N < 1 string
clear: .string "clear" // string for clear screen
endline: .string "\n" // endline string

define(temp1,x19) // temp variable for closed subroutines
define(temp2,x20) // temp variable for closed subroutines
define(temp3,x21) // temp variable for closed subroutines
define(temp4,x22) // temp variable for closed subroutines
define(temp5,x23) // temp variable for closed subroutines
define(temp6,x24) // temp variable for closed subroutines
define(temp7,x25) // temp variable for closed subroutines
define(temp8,x26) // temp variable for closed subroutines
define(temp9,x27) // temp variable for closed subroutines
define(temp10,x28) // temp variable for closed subroutines
define(ws_temp1,w19) // w register variable for storing bytes in closed subroutines
define(ws_temp2,w20) // w register variable for storing bytes in closed subroutines
define(ws_temp3,w21) // w register variable for storing bytes in closed subroutines
define(ws_temp4,w22) // w register variable for storing bytes in closed subroutines
define(ws_temp5,w23) // w register variable for storing bytes in closed subroutines
define(ws_temp6,w24) // w register variable for storing bytes in closed subroutines
define(ws_temp7,w25) // w register variable for storing bytes in closed subroutines
define(ws_temp8,w26) // w register variable for storing bytes in closed subroutines
define(ws_temp9,w27) // w register variable for storing bytes in closed subroutines
define(ws_temp10,w28) // w register variable for storing bytes in closed subroutines

define(m_temp1,x9) // temp variable for main function
define(m_temp2,x10) // temp variable for main function
define(m_temp3,x11) // temp variable for main function
define(m_temp4,x12) // temp variable for main function
define(m_temp5,x13) // temp variable for main function
define(m_temp6,x14) // temp variable for main function
define(m_temp7,x15) // temp variable for main function
define(w_temp1,w9) // w register variable for storing bytes in main function
define(w_temp2,w10) // w register variable for storing bytes in main function
define(w_temp3,w11) // w register variable for storing bytes in main function
define(w_temp4,w12) // w register variable for storing bytes in main function
define(w_temp5,w13) // w register variable for storing bytes in main function
define(w_temp6,w14) // w register variable for storing bytes in main function
define(w_temp7,w15) // w register variable for storing bytes in main function

define(game_values_ptr,x19) // array of all important game values
define(realcode,x20) // array of the real code
define(guesscode,x21) // array of the input
define(board,x22) // main string output
define(trial_number,x23) // register for trial number
define(argv,x24) // array of cmd args
define(codespace,x25) // register that stores the size of the code
define(initial_time,x26) // register for the time of the initial guess
define(current_time,x27) // register for the time of the last guess
temp1_offset = 16 // offset of temp1 in the stack for closed subroutines
temp2_offset = 24 // offset of temp2 in the stack for closed subroutines
temp3_offset = 32 // offset of temp3 in the stack for closed subroutines
temp4_offset = 40 // offset of temp1 in the stack for closed subroutines
temp5_offset = 48 // offset of temp1 in the stack for closed subroutines
temp6_offset = 56 // offset of temp1 in the stack for closed subroutines
temp7_offset = 64 // offset of temp1 in the stack for closed subroutines
temp8_offset = 72 // offset of temp1 in the stack for closed subroutines
temp9_offset = 80 // offset of temp1 in the stack for closed subroutines
temp10_offset = 88 // offset of temp1 in the stack for closed subroutines

N = 0 // offset of variable N in the stack in the main
M = 8 // offset of variable M in the stack in the main
letters = 16 // offset of variable letters in the stack in the main
trials = 24 // offset of variable trials in the stack in the main
right = 32 // offset of variable right (black pegs) in the stack in the main
wrong = 40 // offset of variable wrong (white pegs) in the stack in the main
time_left = 48 // offset of variable time remaining in the stack in the main
code_size = 64 // offset of the code size in the stack in the main
player_name = 56 // offset of the name size in the stack in the main
result = 72 // offset of the game result in the stack in the main

won = 1 // constant game result value 
lost_on_trials = 2 // constant game result value 
lost_on_time = 3 // constant game result value 
lost_on_quit = 4 // constant game result value 
quit = '$' // constant char value
newline = '\n' // constant char value
dash = '-' // constant char value
space = ' ' // constant char value
NULL = 0 // constant char value

initializeAlloc = -96 // used to allocate memory in the stack for initializeGame function
initializeDealloc = 96 // used to deallocate memory in the stack for initializeGame function
displayAlloc = -48 // used to allocate memory in the stack for displayCode function
displayDealloc = 48 // used to deallocate memory in the stack for displayCode function
rightandwrongAlloc = -96 // used to allocate memory in the stack for getRightandWrong function
rightandwrongDealloc = 96 // used to deallocate memory in the stack for getRightandWrong functio
appendValuesAlloc = -96 // used to allocate memory in the stack for append_values function
appendValuesDealloc = 96 // used to deallocate memory in the stack for append_values function
appendTimeAlloc = -80 // used to allocate memory in the stack for append_time function
appendTimeDealloc = 80 // used to deallocate memory in the stack for append_time function
boardAlloc = -48 // used to allocate memory in the stack for printBoard function
boardDealloc = 48 // used to allocate memory in the stack for printBoard function
inputAlloc = -80 // used to allocate memory in the stack for get_input function
inputDealloc = 80 // used to deallocate memory in the stack for get_input function
game_values_alloc = -128 // used to allocate memory in the stack for the game variables
game_values_dealloc = 128 // used to deallocate memory in the stack for the game variables
boardStringAlloc = -1600 // used to allocate memory in the stack for board string
boardStringDealloc = 1600 // used to deallocate memory in the stack for board string
inputStringAlloc = -160 // used to allocate memory in the stack for input string
inputStringDealloc = 160 // used to deallocate memory in the stack for input string
inputlen = 152 // location of input length in the string


.balign 4 // quad word align everything


initializeGame: // closed subrountine to generate code
	// takes in the code array, array size, and number of letters

	stp x29, x30, [sp,initializeAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer
	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	str temp5,[x29,temp5_offset] // store temp5 in ram
	str temp6,[x29,temp6_offset] // store temp6 in ram
	str temp7,[x29,temp7_offset] // store temp7 in ram

	mov temp1,x0 // get the array
	mov temp3,x1 // array size
	mov temp4,x2 // number of letters
	mov temp2,0 // loop control
	add temp5,temp4,3 // used to store the previous value
	// the rng is based on time, and since these calculations take nanoseconds, the random number is normally the same every time
	// this will take more time to initialize the code, but will ensure that not all the letters in the code are the same

	ldr x0, =codeLoading // let user know the code is being generated
	bl printf // print string
intitializeLoop:	// loop for code generation
	
	mov x0,xzr // clears the first register
	bl time // sets the time as the seed
    bl srand  // sets the seed
    bl rand // sets a random number
	mov temp6, x0 // stores the random number
	
	
	udiv temp7,temp6,temp4 // remainder algorithm, udiv will round down
	mul temp7,temp7,temp4 // stores a number that is smaller than the original 
	sub temp6,temp6,temp7 // subtracts the two numbers leaving the remainder between 0 and number of letters-1
	

	
	cmp temp6,temp5 // make sure the value is not the same as the prev value
	b.eq intitializeLoop // if they are equal, retry until that is not the case
	mov temp5,temp6 // store the previous value
	add temp6,temp6,65 // add 65 so that value is a capital letter in ascii
	
	
	strb ws_temp6,[temp1,temp2] // store random value in the array

	add temp2, temp2, 1 // increment the inner loop control
	cmp temp2,temp3 // check to see if the loop control is equal to the length
	b.lt intitializeLoop // if not, repeat the loop, if equal, break 
	
	
	
	ldr x0,=clear // clear string
	bl system // call system("clear")


	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldr temp5,[x29,temp5_offset] // put the old value back into temp5
	ldr temp6,[x29,temp6_offset] // put the old value back into temp6
	ldr temp7,[x29,temp7_offset] // put the old value back into temp7

	ldp x29,x30,[sp],initializeDealloc // deallocate stack
	ret // return to caller





displayCode: // closed subrountine to display the hidden code
	// takes in the code array and the size of the code
	stp x29, x30, [sp,displayAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer

	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	
	
	mov temp1,x0 // put the code array in temp1
	mov temp2,x1 // store size in temp2
	mov temp3,0 // set the loop control to 0
	
	
	ldr x0, =testMode // test mode string
	bl printf // print string
	
	
displayLoop: // loop to display the characters in the code

	ldrb ws_temp4, [temp1,temp3] // load the character 
	ldr x0, =printchar // print char string
	mov x1,temp4 // put the char into x1
	bl printf // print the char
	
	
	add temp3,temp3,1 // increment loop control
	cmp temp3,temp2 // compare it to the size of the code
	b.lt displayLoop // branch back if not done
	
	
	ldr x0,=endline // load an endline
	bl printf // print the newline


	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	
	ldp x29,x30,[sp],displayDealloc // deallocate stack
	ret // return to caller

printBoard: // closed subroutine that prints the board
// takes in the board as an arg
	stp x29, x30, [sp,boardAlloc]! // setup
		mov x29, sp // save stack pointer
	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	mov temp1,x0 // get the board
	mov temp2,8 // initial offset
	ldr temp4,[temp1,0] // location of the null char(end of string)
printLoop:
	ldrb ws_temp3,[temp1,temp2] // load char

	ldr x0,=printchar // print char string
	mov x1,temp3 // pass the char
	bl printf // print the char
	add temp2,temp2,1 // increment offset
	cmp temp2,temp4 // check to if offset is at the null char
	b.ne printLoop // iterate until the null char is reached
	
	
	

	ldr x0,=endline // load an endline
	bl printf // print the endline
	
	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldp x29,x30,[sp],boardDealloc // deallocate stack
	ret // return to caller
	
	
	
get_input: // closed subrountine to get a valid input
	// takes in the board, the code size, the number of letters, and an input array

	stp x29, x30, [sp,inputAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer
	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	str temp5,[x29,temp5_offset] // store temp5 in ram
	str temp6,[x29,temp6_offset] // store temp6 in ram
	str temp7,[x29,temp7_offset] // store temp7 in ram
	str temp8,[x29,temp8_offset] // store temp8 in ram
	mov temp1,x0 // get the main string into temp1
	mov temp2,x1 // get the size of the guess into temp2
	mov temp3,x2 // get the number of letters into temp3
	mov temp4,x3 // get the input array
b try_input // try to get input
	
copy_char_loop: // loop to copy string from .data into the stack
	bl getchar // get the char from .data
	mov ws_temp7,w0 // store the char
	cmp temp7,quit // check to see if user quit
	b.eq input_quit // branch to quit scenario
	
	cmp temp7,newline // see if end of string
	b.eq copy_done // exit loop
	
copy_char: // copy from .data
	strb ws_temp7,[temp4,temp8] // store the char
	add temp8,temp8,1 // increment loop control
	
	cmp temp8,temp2 // check if length of string is too big
	b.gt wrong_size // branch to error message
	b copy_char_loop // next iteration
	
	
copy_done:	// done copying
	str temp8,[temp4,inputlen] // store the length of the input
	
	cmp temp8,temp2 // see if string is right size
	b.ne wrong_size // branch to error message
	
		mov temp5,0 // loop control
invalidcheck: // loop for invalid characters
	ldrb ws_temp6,[temp4,temp5] // load character
	cmp temp6, 0x41 // compare to 65 which in A in ascii
	b.lt illegal_char // branch to error message
	add temp7,temp3,64 // temp7 = 65(A in ascii) + letters -1
	cmp temp6,temp7 // make sure char is in range
	b.gt illegal_char // branch to error message
	add temp5,temp5,1 // increment loop control
	cmp temp5,temp2 // check to see if offset is equal to size
	b.lt invalidcheck // next iteration
	
	b input_done // input is valid
	
	
wrong_size: // input was wrong size
	ldr x0,=wrong_len // load error message
	mov x1,temp2 // pass the correct size
	bl printf // print error message
	b retry_input // get input again

illegal_char: // input had illegal characters
	ldr x0,=invalid_char // load error message
	mov x1,65 // pass the first letter in the range
	add x2,temp3,64 // pass the last letter in the range
	bl printf // print error message
	
retry_input: // get input again
	ldr x0,=guessPrompt // prompt user to guess again
	bl printf // print prompt
	ldr x0,=guess // load input string
	ldr x0,=input // load word from data section
	bl scanf // get input
	
	ldr x0,=clear // setup clear screen
	bl system // clear screen
	mov x0,temp1 // pass the board as an arg
	bl printBoard // print board
try_input: // get input
	ldr x0,=guess // load input string
	ldr x0,=input // load word from data section
	bl scanf // get input
	mov temp8,0 // loop control
	b copy_char_loop // branch to loop
	
	
input_quit: // user quits
	mov x0, -1 // return -1 to indicate user quit
	
input_done: // input is valid
	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldr temp5,[x29,temp5_offset] // put the old value back into temp5
	ldr temp6,[x29,temp6_offset] // put the old value back into temp6
	ldr temp7,[x29,temp7_offset] // put the old value back into temp7
	ldr temp8,[x29,temp8_offset] // put the old value back into temp8
	
	
	ldp x29,x30,[sp],inputDealloc // deallocate stack
	ret // return to caller
	
	
	
getRightandWrong: // gets the values of the black and white pegs
// takes in the guess, the real code, the size, and the number of letters
	stp x29, x30, [sp,rightandwrongAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer

	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	str temp5,[x29,temp5_offset] // store temp5 in ram
	str temp6,[x29,temp6_offset] // store temp6 in ram
	str temp7,[x29,temp7_offset] // store temp7 in ram
	str temp8,[x29,temp8_offset] // store temp8 in ram
	str temp9,[x29,temp9_offset] // store temp9 in ram
	str temp10,[x29,temp10_offset] // store temp10 in ram

	
	// algorithm:
	// right = number of correct characters in the correct position
	// wrong = -right
	// wrong += number of correct characters
	
	// two arrays are set to determine how many of each letters are in either array
	// {0,4,4,5,2,0} with 0-6 as the range of values would be {2,0,1,0,2,1,0}

	mov temp1,x0 // store the guess in temp1
	mov temp2,x1 // get the real code in temp2
	mov temp3,x2 // get the game values in temp2
	ldr temp4,[temp3,letters] // get the number of letters and store in temp4
	
	lsl temp5, temp4,3  // get the size of one guess profile
	neg temp5,temp5 // set to negative value
	and temp5, temp5,-16 // align
	add sp,sp,temp5 // allocate memory
	mov temp6,sp // make temp6 the guess profile
	add sp,sp,temp5 // allocate memory
	mov temp7,sp // make temp7 the real profile
	
	str xzr,[temp3,right] // set right to 0
	str xzr,[temp3,wrong] // set wrong to 0
	
	mov temp8, 0 // loop control
initprofileLoop: // intitialize loop
	lsl temp8,temp8,3 // multiply by 8
	str xzr,[temp7,temp8] // store 0 into real profile
	str xzr,[temp6,temp8] // store 0 into guess profile
	lsr temp8,temp8,3 // divide by 8
	add temp8,temp8,1 // increment loop control
	cmp temp8,temp4 // check to size of loop control
	b.lt initprofileLoop // iterate if not done
	


	mov temp8,0 // loop control
	ldr temp4,[temp3,code_size] // get code_size in temp4
createprofileLoop: // loop where profiles are created
	ldrb ws_temp9,[temp1,temp8] // load the guess value into temp 9
	ldrb ws_temp5,[temp2,temp8] // load the real value into temp 5
	
	
	cmp temp5,temp9 // check if the guess matches the real code
	b.ne not_equal // do nothing if they dont match
	ldr temp10,[temp3,right] // load right
	add temp10,temp10,1 // increment right
	str temp10,[temp3,right] // store the new value
not_equal: // not equal
	sub temp5,temp5,65 // set A = 0, B = 1 etc
	sub temp9,temp9,65 // set A = 0, B = 1, etc
	lsl temp5,temp5,3 // multiply by 8
	lsl temp9,temp9,3 // multiply by 8
	
	ldr temp10,[temp6,temp9] // load the number of times the guess value has appeared so far
	add temp10,temp10,1 // add one to that value
	str temp10,[temp6,temp9] // put the value back into the guess profile
	
	ldr temp10,[temp7,temp5] // load the number of times the real value has appeared so far
	add temp10,temp10,1 // add one to that value
	str temp10,[temp7,temp5] // put the value back into the real profile
	
	add temp8,temp8,1 // increment loop control
	cmp temp8,temp4 // see if offset is equal to code size
	b.lt createprofileLoop // next iteration


	
	
	ldr temp10,[temp3,right] // load right
	neg temp10,temp10 // flip the sign
	str temp10,[temp3,wrong] // store it in wrong
	
	mov temp8,0 // loop control
	ldr temp4,[temp3,letters] // get letters in temp4
checkprofileLoop: // loop to check the profiles created
	lsl temp8,temp8,3 // multiply by 8
	ldr temp5,[temp6,temp8] // load the guess profile
	ldr temp9,[temp7,temp8] // load the real profie
	cmp temp5,temp9 // see which is bigger
	b.gt guessGreater // the guess was bigger
	ldr temp10,[temp3,wrong] // load the wrong value
	add temp10,temp10,temp5 // increment wrong
	str temp10,[temp3,wrong] // store the new value
	b loopcheck // next iteration
guessGreater: // store the real value since guess was bigger
	ldr temp10,[temp3,wrong] // load the wrong value
	add temp10,temp10,temp9 // increment wrong
	str temp10,[temp3,wrong] // store the new value
loopcheck: // setup next iteration
	lsr temp8,temp8,3 // divide by 8
	add temp8,temp8,1 // increment loop control
	cmp temp8,temp4 // check to see if loop control is equal to profile size
	b.lt checkprofileLoop // next iteration
	
	
	lsl temp5, temp4,3  // get the size of one guess profile
	neg temp5,temp5 // set to negative
	and temp5, temp5,-16 // align
	sub sp,sp,temp5 // deallocate real profile
	sub sp,sp,temp5 // deallocate guess profile

	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldr temp5,[x29,temp5_offset] // put the old value back into temp5
	ldr temp6,[x29,temp6_offset] // put the old value back into temp6
	ldr temp7,[x29,temp7_offset] // put the old value back into temp7
	ldr temp8,[x29,temp8_offset] // put the old value back into temp8
	ldr temp9,[x29,temp9_offset] // put the old value back into temp9
	ldr temp10,[x29,temp10_offset] // put the old value back into temp10
	ldp x29,x30,[sp],rightandwrongDealloc // deallocate stack
	ret // return to caller

	
	
append_values: // closed subroutine that appends the input,right,wrong,and score
// takes the board, right,wrong,input,and score
	stp x29, x30, [sp,appendValuesAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer

	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	str temp5,[x29,temp5_offset] // store temp5 in ram
	str temp6,[x29,temp6_offset] // store temp6 in ram
	str temp7,[x29,temp7_offset] // store temp7 in ram
	str temp8,[x29,temp8_offset] // store temp8 in ram
	str temp9,[x29,temp9_offset] // store temp9 in ram

	
	
	mov temp1,x0 // get array
	mov temp2,x1 // get right
	mov temp3,x2 // get wrong
	mov temp6,x3 // get the input
	fmov d11,d0 // get the score
	
	ldr temp4,[temp1,0] // load the offset
	mov temp5,newline // setup char
	strb ws_temp5,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	mov temp7,0 // loop control
	ldr temp9,[temp6,inputlen] // size of input
appendInput: // loop to append input
	ldr temp8,[temp6,temp7] // store the char

	strb ws_temp8,[temp1,temp4] // store the char
	add temp7,temp7,1 // increment loop control
	add temp4,temp4,1 // increment the offset
	cmp temp7,temp9 // see if offset is equal to code size
	b.lt appendInput // next iteration




	mov temp5,' ' // setup char
	strb ws_temp5,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	
	
	
	cmp temp2,10 // see if right has two digits
	b.lt lastDigitRight // right only has one digit
	
	mov temp7,10 // setup for remainder
	udiv temp8,temp2,temp7 //  temp8 is the second digit
	mul temp7,temp8,temp7 // setup for remainder
	sub temp2,temp2,temp7 // make right one digit
	add temp8,temp8,48 // change the second digit to char
	strb ws_temp8,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	
lastDigitRight: // right is only one digit
	add temp2,temp2,48 // change right to char
	strb ws_temp2,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset


	mov temp5,' ' // setup char
	strb ws_temp5,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	
	
	cmp temp3,10 // see if wrong is 2 digits
	b.lt lastDigitWrong // wrong is 1 digit
	
	mov temp7,10 // setup for remainder
	udiv temp8,temp3,temp7 // temp8 is the second digit
	mul temp7,temp8,temp7 // setup for remainder
	sub temp3,temp3,temp7 // wrong is now one digit
	add temp8,temp8,48 // change digit to char
	strb ws_temp8,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	
lastDigitWrong: // wrong is one digit
	add temp3,temp3,48 // change digit to char
	strb ws_temp3,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset

	mov temp5,' ' // setup char
	strb ws_temp5,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset

	fmov d9,10.0 // setup for fmul
	fmul d9,d9,d9 // set d9 to 100
	fmul d11,d11,d9 // multiply score by 100
	fcvtns temp2,d11 // change score to int
	
	mov temp7,100 // setup for remainder
	udiv temp3,temp2,temp7 // setup for remainder
	mul temp3,temp7,temp3 // setup for remainder
	sub temp3,temp2,temp3 // temp3 is the double digit value after the decimal
	udiv temp2,temp2,temp7 // temp2 is the value before the decimal
	
	
	cmp temp2,100 // see if score is 3 digits
	b.lt doubleDigitScore // score is 2 digits
	
	mov temp7,100 // setup for remainder
	udiv temp8,temp2,temp7 // temp8 is the third digit
	mul temp7,temp8,temp7 // setup for remainder
	sub temp2,temp2,temp7 // score is now 2 digits
	add temp8,temp8,48 // change digit to char
	strb ws_temp8,[temp1,temp4] // store the char
	add temp4,temp4,1 // increment the offset
	 
	
doubleDigitScore: // score is 2 digits

	cmp temp2,10 // see if score is 2 digits
	b.lt singleDigitScore // score is 1 digit
	
	mov temp7,10 // setup for remainder
	udiv temp8,temp2,temp7 // temp8 is the second digit
	mul temp7,temp8,temp7 // setup for remainder
	sub temp2,temp2,temp7 // score is now 1 digit
	add temp8,temp8,48 // change digit to char
	strb ws_temp8,[temp1,temp4] // store the char
	add temp4,temp4,1  // increment the offset
	
	
	
singleDigitScore: // score is 1 digit

	add temp2,temp2,48 // change digit to char
	strb ws_temp2,[temp1,temp4] // store the char
	add temp4,temp4,1  // increment the offset
	
	
decimalScore: // now appending decimals
	mov temp5,'.' // setup char
	strb ws_temp5,[temp1,temp4] // store the char
	add temp4,temp4,1  // increment the offset

	
	mov temp7,10 // setup for remainder
	udiv temp8,temp3,temp7 // temp8 is the second digit
	mul temp7,temp8,temp7 // setup for remainder
	sub temp3,temp3,temp7 // the decimal is now a single digit
	add temp8,temp8,48 // change the digit to char
	strb ws_temp8,[temp1,temp4] // store the char
	add temp4,temp4,1  // increment the offset
	

	
secondDecimalScore: // last decimal in the score
	add temp3,temp3,48 // change the digit to char
	strb ws_temp3,[temp1,temp4] // store the char
	add temp4,temp4,1  // increment the offset
	
	mov temp2,NULL // setup null char
	strb ws_temp2,[temp1,temp4] // store the null char
	
	str temp4,[temp1,0] // store the new offset
	
	
	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldr temp5,[x29,temp5_offset] // put the old value back into temp5
	ldr temp6,[x29,temp6_offset] // put the old value back into temp6
	ldr temp7,[x29,temp7_offset] // put the old value back into temp7
	ldr temp8,[x29,temp8_offset] // put the old value back into temp8
	ldr temp9,[x29,temp9_offset] // put the old value back into temp9
	ldp x29,x30,[sp],appendValuesDealloc // deallocate stack
	ret // return to caller
	


append_time:// closed subrountine that appends the time to the board
// takes in the board and time
	stp x29, x30, [sp,appendTimeAlloc]! // setup stack pointer
		mov x29, sp // save stack pointer

	str temp1,[x29,temp1_offset] // store temp1 in ram
	str temp2,[x29,temp2_offset] // store temp2 in ram
	str temp3,[x29,temp3_offset] // store temp3 in ram
	str temp4,[x29,temp4_offset] // store temp4 in ram
	str temp5,[x29,temp5_offset] // store temp5 in ram
	str temp6,[x29,temp6_offset] // store temp6 in ram
	str temp7,[x29,temp7_offset] // store temp7 in ram

	
	mov temp1,x0 // get the array
	mov temp2,x1 // get the time
	
	
	cmp temp2,0 // see if time is positive
	b.ge time_positive // continue if >0
	mov temp2,0 // set time to 0 if negative
	
time_positive: // time is positive or 0
	
	
	ldr temp3,[temp1,0] // load offset of null char
	mov temp4,' ' // setup char
	strb ws_temp4,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset
	
	mov temp4,60 // setup for div and remainder
	udiv temp5,temp2,temp4 // temp5 is number of minutes
	mul temp6,temp5,temp4 // setup for remainder
	sub temp2,temp2,temp6 // temp2 is number of seconds
	
	cmp temp5,10 // see if minutes has two digits
	b.lt lastDigitMinute // minutes has one digit
	
	mov temp4,10 // setup for remainder
	udiv temp6,temp5,temp4 // temp6 is second digit
	mul temp7,temp6,temp4 // setup for remainder
	sub temp5,temp5,temp7 // last digit
	add temp6,temp6,48 // convert second digit to char
	strb ws_temp6,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset
	
lastDigitMinute: // minutes only 1 digit
	add temp5,temp5,48 // convert last digit to char
	strb ws_temp5,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset


	mov temp5,':' // setup char 
	strb ws_temp5,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset
	
	
	
	mov temp4,10 // setup for remainder
	udiv temp6,temp2,temp4 // temp6 is second digit
	mul temp7,temp6,temp4 // setup for remainder
	sub temp2,temp2,temp7 // last digit in seconds
	add temp6,temp6,48 // convert second digit to char
	strb ws_temp6,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset
	
lastDigitSecond: // second is single digit
	add temp2,temp2,48 // convert digit to char
	strb ws_temp2,[temp1,temp3] // store char
	add temp3,temp3,1  // increment the offset

	mov temp2,NULL // setup null char
	strb ws_temp2,[temp1,temp3] // store null char 
	str temp3,[temp1,0] // save the offset
	
	
	ldr temp1,[x29,temp1_offset] // put the old value back into temp1
	ldr temp2,[x29,temp2_offset] // put the old value back into temp2
	ldr temp3,[x29,temp3_offset] // put the old value back into temp3
	ldr temp4,[x29,temp4_offset] // put the old value back into temp4
	ldr temp5,[x29,temp5_offset] // put the old value back into temp5
	ldr temp6,[x29,temp6_offset] // put the old value back into temp6
	ldr temp7,[x29,temp7_offset] // put the old value back into temp7
	ldp x29,x30,[sp],appendTimeDealloc // deallocate stack
	ret // return to caller
	
.global main // setup for main
main: // main function
	stp x29, x30, [sp,-16]! // setup stack pointer
		mov x29, sp // save stack pointer
		
		
		
	cmp x0,7 // check to see if the correct number of cmd args are entered
	b.eq correct_cmd // continue program
	ldr x0,=cmd_error // load error message
	bl printf // print error message
	ldp x29, x30, [sp], 16 // deallocates the stack and frame pointers
	ret // terminates program

correct_cmd: // branched because the correct number of cmd args

	mov argv, x1 // get the cmd args
	add sp,sp,game_values_alloc // allocates memory for all the game values
	mov game_values_ptr,sp // sets a pointer to all the game values
	ldr m_temp2,[argv,8] // first arg, player_name
	str m_temp2,[game_values_ptr,player_name] // store first cmd
	ldr x0,[argv,16] // second value, N
	bl atoi // string to int
	mov m_temp2,x0 // get N
	str m_temp2,[game_values_ptr,N] // store second cmd
	ldr x0,[argv,24] // third arg, M
	bl atoi // string to int
	mov m_temp2,x0 // get M
	str m_temp2,[game_values_ptr,M] // store third cmd
	ldr x0,[argv,32] // fourth value, C(letters)
	bl atoi // string to int
	mov m_temp2,x0 // get the letters
	str m_temp2,[game_values_ptr,letters] // store fourth cmd
	ldr x0,[argv,40] // fifth value, R(trials)
	bl atoi // string to int
	mov m_temp2,x0 // get the trials
	str m_temp2,[game_values_ptr,trials] // store fifth cmd
	ldr x0,[argv,48] // sixth value, (mode)
	bl atoi // string to int
	mov temp10,x0 // get the mode
	
	ldr m_temp2,[game_values_ptr,N] // get N
	ldr m_temp3,[game_values_ptr,M] // get M
	mul m_temp4,m_temp3,m_temp2 // multiply the two values to get the size of the code
	str m_temp4,[game_values_ptr,code_size] // store the result in ram
	mov m_temp3,300 // setup for multiply
	mul m_temp4,m_temp2,m_temp3 // get the total time
	str m_temp4,[game_values_ptr,time_left] // store the time
	add sp,sp, boardStringAlloc // allocates memory for baord
	mov board,sp // saves adress of board
	add sp,sp,inputStringAlloc // allocates memory for input string
	mov guesscode,sp // saves adress of input string
	ldr codespace,[game_values_ptr,code_size] // get the size of the code
	neg codespace,codespace // set to negative value
	and codespace,codespace,-16 // make sure its divisible by 16
	add sp,sp,codespace // allocates memory for code
	mov realcode,sp // saves address of real code
	fmov d8,1.0 // setup for fsub
	fsub d8,d8,d8 // set d8 to 0
	mov trial_number,1 // set trial num to 1
	
	ldr m_temp1,[game_values_ptr,letters] // load letters (C)
	ldr m_temp2,[game_values_ptr,M] // load M
	ldr m_temp3,[game_values_ptr,N] // load N
	ldr m_temp4,[game_values_ptr,trials] // load trials (R)
	
	cmp m_temp1,5 // see if letters >= 5
	b.ge C_biggerthan_M // go to next test
	ldr x0, =C_lessthan_five // load error message
	bl printf // print error message
	b terminate // end program
	
	
C_biggerthan_M: // next cmd test
	cmp m_temp1,m_temp2 // see if letters >= M
	b.ge N_biggerthan_one // go to next test
	ldr x0,=C_lessthan_M // load error message
	bl printf // print error message
	b terminate // end program
	
N_biggerthan_one:	// next cmd test
	cmp m_temp3,1 // see if N >= 1
	b.ge R_biggerthan_one // go to next test
	ldr x0,=N_lessthan_one// load error message
	bl printf // print error message
	b terminate // end program
	
R_biggerthan_one: // next cmd test
	cmp m_temp4,1 // if trials >= 1
	b.ge starting_messages // all tests passed
	ldr x0,=R_lessthan_one // load error message
	bl printf // print error message
	b terminate // end program
	
	
starting_messages: // explain the rules to the user
	ldr x0,=startmsg1 // start message 1
	ldr x1,[game_values_ptr,player_name] // load player name
	bl printf // print start message
	ldr x0, =startmsg2 // start message 2
	bl printf // print start message
	ldr x0, =startmsg3 // start message 3
	bl printf // print start message
	ldr x0,=continuePrompt // prompt message
	bl printf // print prompt
	ldr x0,=guess // input string
	ldr x1,=input // input word
	bl scanf // get input



	mov x0,realcode // pass code as an arg
	ldr x1,[game_values_ptr,code_size] // pass code size as an arg
	ldr x2,[game_values_ptr,letters] // pass letters as an arg
	bl initializeGame // generate code
	
	
	
	cmp temp10,0 // see which mode user is in
	b.eq play_mode // dont reveal code to user

	mov x0,realcode // pass the code as an arg
	ldr x1,[game_values_ptr,code_size] // pass the code size as an arg
	bl displayCode // display the code
	
	
	b initBoard // start initializing board
play_mode: // not in test mode
	ldr x0,=playMode // load play mode message
	bl printf // print string
	

initBoard: // initializing the board
	mov m_temp1,'S' // setup char for initial board
	strb w_temp1,[board,8] // store the char
	mov m_temp1,'t' // setup char for initial board
	strb w_temp1,[board,9] // store the char
	mov m_temp1,'a' // setup char for initial board
	strb w_temp1,[board,10] // store the char
	mov m_temp1,'r' // setup char for initial board
	strb w_temp1,[board,11] // store the char
	mov m_temp1,'t' // setup char for initial board
	strb w_temp1,[board,12] // store the char
	mov m_temp1,space // setup char for initial board
	strb w_temp1,[board,13] // store the char
	mov m_temp1,'C' // setup char for initial board
	strb w_temp1,[board,14] // store the char
	mov m_temp1,'r' // setup char for initial board
	strb w_temp1,[board,15] // store the char
	mov m_temp1,'a' // setup char for initial board
	strb w_temp1,[board,16] // store the char
	mov m_temp1,'c' // setup char for initial board
	strb w_temp1,[board,17] // store the char
	mov m_temp1,'k' // setup char for initial board
	strb w_temp1,[board,18] // store the char
	mov m_temp1,'i' // setup char for initial board
	strb w_temp1,[board,19] // store the char
	mov m_temp1,'n' // setup char for initial board
	strb w_temp1,[board,20] // store the char
	mov m_temp1,'g' // setup char for initial board
	strb w_temp1,[board,21] // store the char
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,22] // store the char
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,23] // store the char
	mov m_temp1,'.' // setup char for initial board
	strb w_temp1,[board,24] // store the char
	mov m_temp1,'.' // setup char for initial board
	strb w_temp1,[board,25] // store the char
	mov m_temp1,'.' // setup char for initial board
	strb w_temp1,[board,26] // store the char
	mov m_temp1,newline // setup char for initial board
	strb w_temp1,[board,27] // store the char
	
	
	ldr m_temp3,[game_values_ptr,code_size] // load the number of dashes added
	add m_temp4,m_temp3,27 // setup the offset for after the dashes are added
	mov m_temp1,0 // set loop control to 0
appendDash: // loop to append dashes
	add m_temp1,m_temp1,28 // add 28 becuase thats where the string continued
	mov m_temp2,'-' // setup char for initial board
	strb w_temp2,[board,m_temp1] // store the dash
	sub m_temp1,m_temp1,27 // only subtract by 27 to indirectly increment loop control
	cmp m_temp1,m_temp3 // see if enough dashes are appended
	b.lt appendDash // append another dash
	
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,'B' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' '  // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,'W' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,'S' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,' ' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov m_temp1,'T' // setup char for initial board
	strb w_temp1,[board,m_temp4] // store the char
	add m_temp4,m_temp4,1 // increment the offset
	mov w_temp1,NULL // setup a null char
	strb w_temp1,[board,m_temp4] // store the null char
	str m_temp4,[board,0] // store the location of the null char
	
	
	mov x0,board // pass the board as an arg
	bl printBoard // print the board
	
game_loop: // main loop 

	
	mov x0,board // pass the board as an arg
	ldr x1,[game_values_ptr,code_size] // pass the code size as an arg
	ldr x2,[game_values_ptr,letters] // pass letters as an arg
	mov x3,guesscode // pass the guess array as an arg
	bl get_input // get a valid guess
	cmp x0,-1 // see if user quit
	b.ne compare_guess // didnt quit
	mov m_temp1,lost_on_quit // set result to quit
	str m_temp1,[game_values_ptr,result] // store result
	b gameDone // end the game

compare_guess: // process the guess

	cmp trial_number,1 // check if first guess
	b.ne init_time_taken // skip if initial time already taken
	mov x0,0 // pass Null as an arg
	bl time // get time
	mov initial_time,x0 // store initial time

init_time_taken: // initial time has been taken
	mov x0,0 // pass Null as an arg
	bl time // get time
	mov current_time,x0 // store current time


	ldr m_temp1,[game_values_ptr,N] // load N, as time is Nx5 minutes
	mov m_temp2,300 // setup for mul
	mul m_temp3,m_temp1,m_temp2 // get starting time
	
	sub m_temp4,current_time,initial_time // get time elasped
	sub m_temp3,m_temp3,m_temp4 // subtract the starting time from time elasped
	str m_temp3,[game_values_ptr,time_left] // store the time


	mov x0,guesscode // pass the guess array as an arg
	mov x1,realcode // pass the code array as an arg
	mov x2,game_values_ptr // pass the game values array as an arg
	bl getRightandWrong // get the right(black peg) and wrong(white peg) values
	
	
	ldr m_temp1,[game_values_ptr,right] // load right
	scvtf d9,m_temp1 // setup a float equal to right
	ldr m_temp2,[game_values_ptr,wrong] // load wrong
	scvtf d10,m_temp2 // setup a float equal to wrong
	scvtf d11,trial_number // setup a float equal to trial number
	fmov d12,2.0 // setup for fdiv
	
	
	fdiv d10,d10,d12 // divide wrong by 2
	fadd d9,d10,d9 // add right and wrong/2
	fdiv d9,d9,d11 // divide the sum by the trial num
	fadd d8,d9,d8 // add to current score




	
	
	mov x0,board // pass the board as an arg
	ldr x1,[game_values_ptr,right] // pass right as an arg
	ldr x2,[game_values_ptr,wrong] // pass wrong as an arg
	mov x3,guesscode // pass the input as an arg
	fmov d0,d8 // pass the score as an arg
	bl append_values // append the input,pegs,and score to the board
	
	
	
	mov x0,board // pass the board as an arg
	ldr x1,[game_values_ptr,time_left] // pass time as an arg
	bl append_time // append the time to the board
	
	
	ldr x0,=clear // setup for clear screen
	bl system // clear screen
	mov x0,board // pass the board as an arg
	bl printBoard // print the updated board
	
	ldr m_temp1,[game_values_ptr,time_left] // load the time remaining
	cmp m_temp1,0 // see if any time is remaining
	b.gt check_win // didnt lose on time, check to see if user won
	mov m_temp2,lost_on_time // set result to lost on time
	str m_temp2,[game_values_ptr,result] // store the result
	b gameDone // end the game
	
check_win: // check to see if user won
	ldr m_temp1,[game_values_ptr,right] // load the number of correct characters
	ldr m_temp2,[game_values_ptr,code_size] // load the number of characters in code

	cmp m_temp2,m_temp1 // see if all characters are right
	b.ne next_trial // didn't win, go to next trial
	
	mov m_temp3,won // set the result to win
	str m_temp3,[game_values_ptr,result] // store the result
	ldr m_temp4,[game_values_ptr,time_left] // get the remaining time
	mov m_temp5,1000 // setup for multiply
	mul m_temp4, m_temp5,m_temp4 // multiply time by 1000
	scvtf d9,m_temp4 // setup a float for fmul
	fmul d8,d9,d8 // multiply by time and 1000
	scvtf d9,trial_number // setup a float for fdiv
	fdiv d8,d8,d9 // divide by trial number
	b gameDone // end the game
	
	
next_trial: // setup for the next trial
	add trial_number, trial_number,1 // increment the trial number
	ldr m_temp1,[game_values_ptr,trials] // load the max number of trials
	cmp trial_number,m_temp1 // check to see if user has more trials
	b.le game_loop // branch to next round
	
	
	
	mov m_temp1,lost_on_trials // set result to lost on trials
	str m_temp1,[game_values_ptr,result] // store result
	

gameDone: // game is finished, just need to print message

	ldr m_temp1,[game_values_ptr,result] // get the result
	
	cmp m_temp1,lost_on_quit // check to see if user quit
	b.eq result_quit // print quit message
	cmp m_temp1,lost_on_time // check to see if user lost on time
	b.eq result_time // print time message
	cmp m_temp1,won // check to see if user won
	b.eq result_won // print won message
	cmp m_temp1,lost_on_trials // check to see if user lost on trials
	b.eq result_trials // print trial message
	
	
	
result_quit: // user quit
	ldr x0,=lostonQuit // load quit message
	fmov d0,d8 // get score
	bl printf // print message
	b terminate // end program
result_time: // user lost on time
	ldr x0,=lostonTime // load time message
	fmov d0,d8 // get score
	bl printf // print message
	b terminate // end program
result_trials: // user ran out of trials
	ldr x0,=lostonTrials // load trials message
	fmov d0,d8 // get score
	bl printf // print message
	b terminate // end program
result_won: // user guessed the code
	ldr x0,=wonGame // load won message
	fmov d0,d8 // get score
	bl printf // print message
	b terminate // end program
	
	
	
	
terminate: // end of program
	sub sp,sp,codespace // deallocate the code
	sub sp,sp,inputStringAlloc // deallocate the input string
	sub sp,sp,boardStringAlloc // deallocate the board
	sub sp,sp,game_values_alloc // deallocate the game values

	
	ldp x29, x30, [sp], 16  // deallocate stack
		ret // terminates program
		
	
	