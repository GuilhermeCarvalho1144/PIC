
_main:

;Aula_2.c,5 :: 		void main() {
;Aula_2.c,7 :: 		TRISB = 0b00000000;   //INICIANDO O PORTB COMO SAIDA DIGITA
	CLRF       TRISB+0
;Aula_2.c,8 :: 		PORTB = 0b00000000;   //INICIANDO OS VALORES DO PORTB
	CLRF       PORTB+0
;Aula_2.c,10 :: 		while(1){
L_main0:
;Aula_2.c,11 :: 		PORTB++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_2.c,12 :: 		delay_ms(500);
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
;Aula_2.c,13 :: 		}
	GOTO       L_main0
;Aula_2.c,14 :: 		}
	GOTO       $+0
; end of _main
