
_main:

;Aula_15.c,9 :: 		void main() {
;Aula_15.c,11 :: 		CMCON = 0x07;//DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_15.c,12 :: 		TRISA = 0x00;//CONFIGURA O PORTA COMO SAIDA DIGITAL
	CLRF       TRISA+0
;Aula_15.c,13 :: 		PORTA = 0x00;//INICIALIZA O PORTA COM NIVEL BAIXO
	CLRF       PORTA+0
;Aula_15.c,15 :: 		while(1){//MULTIPLEXACAO DE LEDS EH FAZER COM QUE OS LEDS PISQUEM EM UMA FREQUECIA ALTA FAZENDO COM QUE APARENTEM QUE ESTAJAM SEMPRE LIGADOS
L_main0:
;Aula_15.c,16 :: 		LED1 = 0x01;
	BSF        RA0_bit+0, 0
;Aula_15.c,17 :: 		LED2 = 0x00;
	BCF        RA1_bit+0, 1
;Aula_15.c,18 :: 		delay_ms(100/50);//PERIODO = 1/FREQUENCIA
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula_15.c,19 :: 		LED1 = 0x00;
	BCF        RA0_bit+0, 0
;Aula_15.c,20 :: 		LED2 = 0x01;
	BSF        RA1_bit+0, 1
;Aula_15.c,21 :: 		delay_ms(100/50);//PERIDO = 1/FREQUENCIA
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula_15.c,22 :: 		}
	GOTO       L_main0
;Aula_15.c,24 :: 		}
	GOTO       $+0
; end of _main
