
_main:

;Aula_18.c,18 :: 		void main() {
;Aula_18.c,20 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Aula_18.c,21 :: 		TRISB7_bit = 0x00;
	BCF        TRISB7_bit+0, 7
;Aula_18.c,23 :: 		OUTPUT = 0x00;
	BCF        RB7_bit+0, 7
;Aula_18.c,25 :: 		while(1){
L_main0:
;Aula_18.c,26 :: 		OUTPUT = 0x01;
	BSF        RB7_bit+0, 7
;Aula_18.c,27 :: 		delay_ms(100);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      120
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
;Aula_18.c,28 :: 		OUTPUT = 0x00;
	BCF        RB7_bit+0, 7
;Aula_18.c,29 :: 		delay_ms(100);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      120
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;Aula_18.c,30 :: 		}
	GOTO       L_main0
;Aula_18.c,31 :: 		}
	GOTO       $+0
; end of _main
