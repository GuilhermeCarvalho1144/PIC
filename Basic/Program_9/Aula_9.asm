
_main:

;Aula_9.c,18 :: 		void main() {
;Aula_9.c,19 :: 		CMCON = 0x07; //DESABILITA OS COMPORADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_9.c,20 :: 		TRISA = 0x03; //0x03 = 0b0000011 DEFINE RA0 E RA1 COMO ENTRADAS DIGITAIS
	MOVLW      3
	MOVWF      TRISA+0
;Aula_9.c,21 :: 		PORTA = 0x03; //0x03 = 0b0000011 DEFINE RA0 E RB0 PARA NIVEL ALTO (RESISTORES DE PULL DOWN)
	MOVLW      3
	MOVWF      PORTA+0
;Aula_9.c,23 :: 		while(1){
L_main0:
;Aula_9.c,24 :: 		num = rand();
	CALL       _rand+0
	MOVF       R0+0, 0
	MOVWF      _num+0
	MOVF       R0+1, 0
	MOVWF      _num+1
;Aula_9.c,25 :: 		LED1 = num;
	BTFSC      R0+0, 0
	GOTO       L__main11
	BCF        RA2_bit+0, 2
	GOTO       L__main12
L__main11:
	BSF        RA2_bit+0, 2
L__main12:
;Aula_9.c,26 :: 		LED2 = ~LED1;
	BTFSC      RA2_bit+0, 2
	GOTO       L__main13
	BSF        RA3_bit+0, 3
	GOTO       L__main14
L__main13:
	BCF        RA3_bit+0, 3
L__main14:
;Aula_9.c,27 :: 		while(LED1){
L_main2:
	BTFSS      RA2_bit+0, 2
	GOTO       L_main3
;Aula_9.c,28 :: 		if(S1==0)LED1 = 0;
	BTFSC      RA0_bit+0, 0
	GOTO       L_main4
	BCF        RA2_bit+0, 2
L_main4:
;Aula_9.c,29 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Aula_9.c,30 :: 		}
	GOTO       L_main2
L_main3:
;Aula_9.c,31 :: 		while(LED2){
L_main6:
	BTFSS      RA3_bit+0, 3
	GOTO       L_main7
;Aula_9.c,32 :: 		if(S2==0)LED2 = 0;
	BTFSC      RA1_bit+0, 1
	GOTO       L_main8
	BCF        RA3_bit+0, 3
L_main8:
;Aula_9.c,33 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Aula_9.c,34 :: 		}
	GOTO       L_main6
L_main7:
;Aula_9.c,35 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;Aula_9.c,36 :: 		}
	GOTO       L_main0
;Aula_9.c,37 :: 		}
	GOTO       $+0
; end of _main
