
_main:

;Aula_19.c,14 :: 		void main() {
;Aula_19.c,16 :: 		CMCON = 0x07;  //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_19.c,17 :: 		TRISA0_bit = 0x01; //RA0, RA1, RA2 SÃO ENTRADAS DIGITAIS
	BSF        TRISA0_bit+0, 0
;Aula_19.c,18 :: 		TRISA1_bit = 0x01;
	BSF        TRISA1_bit+0, 1
;Aula_19.c,19 :: 		TRISA2_bit = 0x01;
	BSF        TRISA2_bit+0, 2
;Aula_19.c,20 :: 		TRISB = 0x00; //DEFINE O PORTB COMO SAIDA DIGITAL
	CLRF       TRISB+0
;Aula_19.c,21 :: 		TRISC = 0x00; //DEFINE O PORTC COMO SAIDA DIGITAL
	CLRF       TRISC+0
;Aula_19.c,22 :: 		TRISD = 0x00; //DEFINE O PORTD COMO SAIDA DIGITAL
	CLRF       TRISD+0
;Aula_19.c,24 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Aula_19.c,25 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Aula_19.c,26 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Aula_19.c,27 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Aula_19.c,29 :: 		while(1){
L_main0:
;Aula_19.c,30 :: 		if(RA0_bit == 1){
	BTFSS      RA0_bit+0, 0
	GOTO       L_main2
;Aula_19.c,31 :: 		LED1 = 0x01;//LIGA LED1
	BSF        RB0_bit+0, 0
;Aula_19.c,32 :: 		delay_ms(180);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      212
	MOVWF      R12+0
	MOVLW      133
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;Aula_19.c,33 :: 		}
L_main2:
;Aula_19.c,34 :: 		if(S2 == 1)LED2 = 0x01;//;IGA LED2
	BTFSS      RA1_bit+0, 1
	GOTO       L_main4
	BSF        RC0_bit+0, 0
L_main4:
;Aula_19.c,35 :: 		if(S3 == 1)LED3 = 0x01;//LIGA LED3
	BTFSS      RA2_bit+0, 2
	GOTO       L_main5
	BSF        RD0_bit+0, 0
L_main5:
;Aula_19.c,36 :: 		}
	GOTO       L_main0
;Aula_19.c,37 :: 		}
	GOTO       $+0
; end of _main
