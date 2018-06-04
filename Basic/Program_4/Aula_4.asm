
_main:

;Aula_4.c,5 :: 		void main() {
;Aula_4.c,6 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Aula_4.c,7 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Aula_4.c,8 :: 		TRISIO0_bit = 1;
	BSF        TRISIO0_bit+0, 0
;Aula_4.c,9 :: 		TRISIO1_bit = 0;
	BCF        TRISIO1_bit+0, 1
;Aula_4.c,11 :: 		GPIO = 0;
	CLRF       GPIO+0
;Aula_4.c,12 :: 		while(1){
L_main0:
;Aula_4.c,14 :: 		if(GPIO.F0){
	BTFSS      GPIO+0, 0
	GOTO       L_main2
;Aula_4.c,15 :: 		GPIO.F1 = 1;
	BSF        GPIO+0, 1
;Aula_4.c,16 :: 		delay_ms(1500);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      231
	MOVWF      R12+0
	MOVLW      0
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Aula_4.c,17 :: 		Gpio.F1 = 0;
	BCF        GPIO+0, 1
;Aula_4.c,18 :: 		}
	GOTO       L_main4
L_main2:
;Aula_4.c,20 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;Aula_4.c,21 :: 		delay_ms(200);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;Aula_4.c,22 :: 		}
L_main4:
;Aula_4.c,24 :: 		}
	GOTO       L_main0
;Aula_4.c,25 :: 		}
	GOTO       $+0
; end of _main
