
_main:

;Aula_6.c,11 :: 		void main() {
;Aula_6.c,12 :: 		ANSEL = 0;      //DESABILITA AS ENTRADAS ANALOGICAS
	CLRF       ANSEL+0
;Aula_6.c,13 :: 		CMCON = 7;      //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_6.c,14 :: 		TRISIO0_bit = 1; TRISIO1_bit = 1;   //DEFININDO BITS 0 E 1 COMO ENTRAS DIGITAIS
	BSF        TRISIO0_bit+0, 0
	BSF        TRISIO1_bit+0, 1
;Aula_6.c,15 :: 		TRISIO4_bit = 0; TRISIO5_bit = 0;   //DEFININDO BITS 4 E 5 COMO SAIDAS DIGITAIS
	BCF        TRISIO4_bit+0, 4
	BCF        TRISIO5_bit+0, 5
;Aula_6.c,17 :: 		S1= 1; S2 = 1;  //INICIALIZANDO AS ENTRADAS DIGITAIS (RESISTOR DE PULL UP)
	BSF        GPIO+0, 0
	BSF        GPIO+0, 1
;Aula_6.c,18 :: 		LED1 = 0; LED2 = 0;              //INICIALIZANDO AS SAIDAS DIGITAIS (CURRENT SOURCING)
	BCF        GPIO+0, 4
	BCF        GPIO+0, 5
;Aula_6.c,20 :: 		while(1){
L_main0:
;Aula_6.c,21 :: 		if(S1==0){
	BTFSC      GPIO+0, 0
	GOTO       L_main2
;Aula_6.c,22 :: 		LED1 = ~LED1;             //INVERTE O ESTADO DA SAIDA LED1
	MOVLW      16
	XORWF      GPIO+0, 1
;Aula_6.c,23 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;Aula_6.c,24 :: 		}
L_main2:
;Aula_6.c,25 :: 		if(S2==0){
	BTFSC      GPIO+0, 1
	GOTO       L_main4
;Aula_6.c,26 :: 		LED2 = ~LED2;             //INVERTE O ESTADO DE SAIDA LED2
	MOVLW      32
	XORWF      GPIO+0, 1
;Aula_6.c,27 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;Aula_6.c,28 :: 		}
L_main4:
;Aula_6.c,29 :: 		}
	GOTO       L_main0
;Aula_6.c,32 :: 		}
	GOTO       $+0
; end of _main
