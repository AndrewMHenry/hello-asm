;;; hello.asm -- Main entry point for hello-asm application.

main:
        ;; DESCRIPTION:
        ;;   Display "HELLO WORLD!" on the screen, wait for user keypress,
        ;;   then clear the screen and exit.
        ;;
        ;; INPUT:
        ;;   <keyboard> -- accepts and terminates on user keypress
        ;;
        ;; OUTPUT:
        ;;   <LCD and screen buffer> -- written to and subsequently cleared
        ;;
        ;; This routine is the main entry point for the hello-asm application.
        ;;
	PUSH	DE              ; STACK: [PC DE]
	PUSH	HL              ; STACK: [PC DE HL]
	LD	HL, fontFBF     ; set font to fontFBF
	CALL	writeSetFont    ;
	CALL	drawClearScreen ; clear screen buffer
	LD	DE, 0           ; write greeting at upper left of screen buffer
	LD	HL, helloStr    ;
	CALL	writeString     ;
	CALL	screenUpdate    ; flush buffer changes to LCD
	CALL	keyboardWait    ; wait for keypress
	CALL	drawClearScreen ; clear screen buffer
	CALL	screenUpdate    ; flush changes, clearing LCD
	POP	HL              ; STACK: [PC DE]
	POP	DE              ; STACK: [PC]
	RET                     ; return

helloStr:
        ;; This is the null-terminated string that will be printed.
        .db     "HELLO WORLD!", 0
