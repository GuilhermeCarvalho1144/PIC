
_main:

;Aula_17.c,12 :: 		void main() {
;Aula_17.c,14 :: 		CMCON = 0x07;//DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_17.c,15 :: 		TRISA0_bit = 0x01;//DEFINE RA0 COMO ENTRADA DIGITAL
	BSF        TRISA0_bit+0, 0
;Aula_17.c,16 :: 		TRISB0_bit = 0x00;//DEFINE RB0 COMO SAIDA DIGITAL
	BCF        TRISB0_bit+0, 0
;Aula_17.c,17 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Aula_17.c,18 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Aula_17.c,20 :: 		while(1){
L_main0:
;Aula_17.c,21 :: 		if(RA0_bit == 1){
	BTFSS      RA0_bit+0, 0
	GOTO       L_main2
;Aula_17.c,22 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_17.c,23 :: 		delay_ms(500);
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
;Aula_17.c,24 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_17.c,25 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Aula_17.c,26 :: 		}
L_main2:
;Aula_17.c,27 :: 		}
	GOTO       L_main0
;Aula_17.c,29 :: 		}
	GOTO       $+0
; end of _main
