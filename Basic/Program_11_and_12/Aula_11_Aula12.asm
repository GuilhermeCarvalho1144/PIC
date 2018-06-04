
_main:

;Aula_11_Aula12.c,14 :: 		void main() {
;Aula_11_Aula12.c,16 :: 		ANSEL = 0x01; //SELECIONA AN0 COMO ENTRADA ANALOGICA
	MOVLW      1
	MOVWF      ANSEL+0
;Aula_11_Aula12.c,17 :: 		ADCON0 = 0x01; //ABILITA OS MODULOS A/D
	MOVLW      1
	MOVWF      ADCON0+0
;Aula_11_Aula12.c,18 :: 		CMCON = 0x07; //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_11_Aula12.c,21 :: 		TRISIO = 0x01; //DEFINE GPIO 0 COMO ENTRADA
	MOVLW      1
	MOVWF      TRISIO+0
;Aula_11_Aula12.c,22 :: 		GPIO =0x00; //INICIALIZA TODOS OS GPIOS EM NIVEL BAIXO
	CLRF       GPIO+0
;Aula_11_Aula12.c,24 :: 		while(1){      //LOGICA -> 2^10 = 1023 (RESOLUCAO DE AMOSTRAGEM) ... DIVIDIMOS EM 5 INTERVALOS DE 204 OHMS APROXIMADAMENTE ... LEDS LIGAM DE LED1 -> LED4
L_main0:
;Aula_11_Aula12.c,25 :: 		measure = ADC_Read(0); //FUNCAO QUE FAZ A LEITURA DA ENTRADA ANALOGICA
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _measure+0
	MOVF       R0+1, 0
	MOVWF      _measure+1
;Aula_11_Aula12.c,26 :: 		if(measure > 0){    //PRIMEIRO INTERVALO
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       R0+0, 0
	SUBLW      0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;Aula_11_Aula12.c,27 :: 		LED1 = 0;
	BCF        GPIO+0, 1
;Aula_11_Aula12.c,28 :: 		LED2 = 0;
	BCF        GPIO+0, 2
;Aula_11_Aula12.c,29 :: 		LED3 = 0;
	BCF        GPIO+0, 4
;Aula_11_Aula12.c,30 :: 		LED4 = 0;
	BCF        GPIO+0, 5
;Aula_11_Aula12.c,31 :: 		}
L_main2:
;Aula_11_Aula12.c,32 :: 		if(measure > 204){    //SEGUNDO INTERVALO
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _measure+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _measure+0, 0
	SUBLW      204
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Aula_11_Aula12.c,33 :: 		LED1 = 1;
	BSF        GPIO+0, 1
;Aula_11_Aula12.c,34 :: 		LED2 = 0;
	BCF        GPIO+0, 2
;Aula_11_Aula12.c,35 :: 		LED3 = 0;
	BCF        GPIO+0, 4
;Aula_11_Aula12.c,36 :: 		LED4 = 0;
	BCF        GPIO+0, 5
;Aula_11_Aula12.c,37 :: 		}
L_main3:
;Aula_11_Aula12.c,38 :: 		if(measure > 410){    //TERCEIRO INTERVALO
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _measure+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       _measure+0, 0
	SUBLW      154
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Aula_11_Aula12.c,39 :: 		LED1 = 1;
	BSF        GPIO+0, 1
;Aula_11_Aula12.c,40 :: 		LED2 = 1;
	BSF        GPIO+0, 2
;Aula_11_Aula12.c,41 :: 		LED3 = 0;
	BCF        GPIO+0, 4
;Aula_11_Aula12.c,42 :: 		LED4 = 0;
	BCF        GPIO+0, 5
;Aula_11_Aula12.c,43 :: 		}
L_main4:
;Aula_11_Aula12.c,44 :: 		if(measure > 613){    //QUARTO INTERVALO
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _measure+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _measure+0, 0
	SUBLW      101
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Aula_11_Aula12.c,45 :: 		LED1 = 1;
	BSF        GPIO+0, 1
;Aula_11_Aula12.c,46 :: 		LED2 = 1;
	BSF        GPIO+0, 2
;Aula_11_Aula12.c,47 :: 		LED3 = 1;
	BSF        GPIO+0, 4
;Aula_11_Aula12.c,48 :: 		LED4 = 0;
	BCF        GPIO+0, 5
;Aula_11_Aula12.c,49 :: 		}
L_main5:
;Aula_11_Aula12.c,50 :: 		if(measure > 817){    //QUINTO INTERVALO
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _measure+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _measure+0, 0
	SUBLW      49
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Aula_11_Aula12.c,51 :: 		LED1 = 1;
	BSF        GPIO+0, 1
;Aula_11_Aula12.c,52 :: 		LED2 = 1;
	BSF        GPIO+0, 2
;Aula_11_Aula12.c,53 :: 		LED3 = 1;
	BSF        GPIO+0, 4
;Aula_11_Aula12.c,54 :: 		LED4 = 1;
	BSF        GPIO+0, 5
;Aula_11_Aula12.c,55 :: 		}
L_main6:
;Aula_11_Aula12.c,56 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Aula_11_Aula12.c,57 :: 		}
	GOTO       L_main0
;Aula_11_Aula12.c,62 :: 		}
	GOTO       $+0
; end of _main
