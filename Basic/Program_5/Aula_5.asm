
_main:

;Aula_5.c,5 :: 		void main() {
;Aula_5.c,6 :: 		ANSEL = 0;   //DESABILITA AS ENTRADAS ANALOGICAS
	CLRF       ANSEL+0
;Aula_5.c,7 :: 		CMCON = 7;   //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_5.c,9 :: 		TRISIO0_bit = 0;
	BCF        TRISIO0_bit+0, 0
;Aula_5.c,10 :: 		TRISIO1_bit = 0;
	BCF        TRISIO1_bit+0, 1
;Aula_5.c,12 :: 		while(1){
L_main0:
;Aula_5.c,13 :: 		GPIO.F0 = 1;    //TENNADO FAZER UM OSCILADOR DE 50HZ
	BSF        GPIO+0, 0
;Aula_5.c,14 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula_5.c,15 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;Aula_5.c,16 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula_5.c,18 :: 		GPIO.F1 = 1;    //TENTANDO FAZER UM OSCILADOR DE 500HZ
	BSF        GPIO+0, 1
;Aula_5.c,19 :: 		delay_ms(1);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
;Aula_5.c,20 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;Aula_5.c,21 :: 		delay_ms(1);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;Aula_5.c,23 :: 		}
	GOTO       L_main0
;Aula_5.c,27 :: 		TENHAM A MESMA FREQUÊNCIA*/
	GOTO       $+0
; end of _main
