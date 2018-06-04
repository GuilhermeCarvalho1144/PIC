
_main:

;Aula_7.c,7 :: 		void main() {
;Aula_7.c,8 :: 		CMCON = 0x07; //DESABILITA OS COMPARADOREES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_7.c,10 :: 		TRISB = 0x00; //DEFININDO PORTB COMO SAIDA DIGITAIS
	CLRF       TRISB+0
;Aula_7.c,11 :: 		PORTB = 0xFF; //INICIALIZA O PORTB EM NIVEL ALTO (CURRENT SINKING) OBS.: 0xFF = 255 = 0b11111111
	MOVLW      255
	MOVWF      PORTB+0
;Aula_7.c,13 :: 		while(1){
L_main0:
;Aula_7.c,14 :: 		if(cont == 0x00)cont = 0xFF;
	MOVLW      0
	XORWF      _cont+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main4
	MOVLW      0
	XORWF      _cont+0, 0
L__main4:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	MOVLW      255
	MOVWF      _cont+0
	CLRF       _cont+1
L_main2:
;Aula_7.c,15 :: 		PORTB = cont;
	MOVF       _cont+0, 0
	MOVWF      PORTB+0
;Aula_7.c,16 :: 		cont = cont << 1;
	RLF        _cont+0, 1
	RLF        _cont+1, 1
	BCF        _cont+0, 0
;Aula_7.c,17 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Aula_7.c,18 :: 		}
	GOTO       L_main0
;Aula_7.c,21 :: 		}
	GOTO       $+0
; end of _main
