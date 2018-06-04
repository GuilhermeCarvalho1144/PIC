
_main:

;Aula_3.c,5 :: 		void main() {
;Aula_3.c,6 :: 		CMCON = 7; //DESABILITANDO OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_3.c,7 :: 		ANSEL = 0; //DESABILITANDO AS PORTAS ANALOGICAS
	CLRF       ANSEL+0
;Aula_3.c,9 :: 		TRISIO0_bit = 0;
	BCF        TRISIO0_bit+0, 0
;Aula_3.c,10 :: 		TRISIO1_bit = 0;
	BCF        TRISIO1_bit+0, 1
;Aula_3.c,12 :: 		GPIO = 0;
	CLRF       GPIO+0
;Aula_3.c,14 :: 		while(1){
L_main0:
;Aula_3.c,15 :: 		GPIO.F0 = 1;
	BSF        GPIO+0, 0
;Aula_3.c,16 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;Aula_3.c,17 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Aula_3.c,18 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;Aula_3.c,19 :: 		GPIO.F1 = 1;
	BSF        GPIO+0, 1
;Aula_3.c,20 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Aula_3.c,21 :: 		}
	GOTO       L_main0
;Aula_3.c,23 :: 		}
	GOTO       $+0
; end of _main
