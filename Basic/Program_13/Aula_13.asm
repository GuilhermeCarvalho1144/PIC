
_main:

;Aula_13.c,5 :: 		void main() {
;Aula_13.c,7 :: 		unsigned char num, cont = 0x00; //CONTADOR INICIA NO 0
	CLRF       main_cont_L0+0
	MOVLW      63
	MOVWF      main_numcod_L0+0
	MOVLW      6
	MOVWF      main_numcod_L0+1
	MOVLW      91
	MOVWF      main_numcod_L0+2
	MOVLW      79
	MOVWF      main_numcod_L0+3
	MOVLW      102
	MOVWF      main_numcod_L0+4
	MOVLW      109
	MOVWF      main_numcod_L0+5
	MOVLW      125
	MOVWF      main_numcod_L0+6
	MOVLW      7
	MOVWF      main_numcod_L0+7
	MOVLW      127
	MOVWF      main_numcod_L0+8
	MOVLW      103
	MOVWF      main_numcod_L0+9
;Aula_13.c,10 :: 		CMCON = 0x07; //DESABILITANDO OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_13.c,11 :: 		TRISB = 0x00; //CONFIGURANDO O PORTB COMO SAIDA DIGITAL
	CLRF       TRISB+0
;Aula_13.c,12 :: 		PORTB = 0x00; //INICIANDO O PORTB COM NIVEL BAIXO (CURRENT SOURCING)
	CLRF       PORTB+0
;Aula_13.c,14 :: 		while(1){
L_main0:
;Aula_13.c,15 :: 		PORTB = numcod[cont];
	MOVF       main_cont_L0+0, 0
	ADDLW      main_numcod_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Aula_13.c,16 :: 		cont++;
	INCF       main_cont_L0+0, 1
;Aula_13.c,17 :: 		if(cont == 10) cont = 0x00;
	MOVF       main_cont_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	CLRF       main_cont_L0+0
L_main2:
;Aula_13.c,18 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Aula_13.c,19 :: 		}
	GOTO       L_main0
;Aula_13.c,22 :: 		}
	GOTO       $+0
; end of _main
