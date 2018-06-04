
_main:

;Aula_8.c,14 :: 		void main() {
;Aula_8.c,15 :: 		CMCON = 0x07; //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_8.c,16 :: 		TRISA = 0X03; // 0x03 = 0b0000011 DEFINE RA0 E RA1 COMO ENTRADAS DIGITAIS E OS DEMAIS COMO SAIDA
	MOVLW      3
	MOVWF      TRISA+0
;Aula_8.c,17 :: 		PORTA = 0x03; // 0x03 = 0b0000011 DEFINE RA0 E RB1 COM NOIVEL ALTO E OS DEMAIS COM NIVEL BAIXO
	MOVLW      3
	MOVWF      PORTA+0
;Aula_8.c,19 :: 		while(1){
L_main0:
;Aula_8.c,20 :: 		if(S1 == 0){
	BTFSC      RA0_bit+0, 0
	GOTO       L_main2
;Aula_8.c,21 :: 		while(1){
L_main3:
;Aula_8.c,22 :: 		LED1 = 1;
	BSF        RA2_bit+0, 2
;Aula_8.c,23 :: 		LED2 = 0;
	BCF        RA3_bit+0, 3
;Aula_8.c,24 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Aula_8.c,25 :: 		LED1 = 0;
	BCF        RA2_bit+0, 2
;Aula_8.c,26 :: 		LED2 = 1;
	BSF        RA3_bit+0, 3
;Aula_8.c,27 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Aula_8.c,28 :: 		}
	GOTO       L_main3
;Aula_8.c,29 :: 		}
L_main2:
;Aula_8.c,30 :: 		if(S2 == 0){
	BTFSC      RA1_bit+0, 1
	GOTO       L_main7
;Aula_8.c,31 :: 		while(1){
L_main8:
;Aula_8.c,32 :: 		LED1 = 1;
	BSF        RA2_bit+0, 2
;Aula_8.c,33 :: 		LED2 = 1;
	BSF        RA3_bit+0, 3
;Aula_8.c,34 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;Aula_8.c,35 :: 		LED1 = 0;
	BCF        RA2_bit+0, 2
;Aula_8.c,36 :: 		LED2 = 0;
	BCF        RA3_bit+0, 3
;Aula_8.c,37 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;Aula_8.c,38 :: 		}
	GOTO       L_main8
;Aula_8.c,39 :: 		}
L_main7:
;Aula_8.c,40 :: 		}
	GOTO       L_main0
;Aula_8.c,42 :: 		}
	GOTO       $+0
; end of _main
