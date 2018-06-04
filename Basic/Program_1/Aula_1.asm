
_main:

;Aula_1.c,5 :: 		void main() {
;Aula_1.c,7 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;Aula_1.c,8 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Aula_1.c,10 :: 		while(1){
L_main0:
;Aula_1.c,11 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, 1
;Aula_1.c,12 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula_1.c,13 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, 1
;Aula_1.c,14 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula_1.c,15 :: 		}
	GOTO       L_main0
;Aula_1.c,16 :: 		}
	GOTO       $+0
; end of _main
