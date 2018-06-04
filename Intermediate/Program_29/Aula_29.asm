
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_29.c,10 :: 		void interrupt(){//VARREDURA ACONTECE A CADA 50ms APROXIMADAMENTE
;Aula_29.c,11 :: 		if(TMR2IF_bit){//VERIFICA SE HOUVE ESTOURO DO TIMER 2
	BTFSS      TMR2IF_bit+0, 1
	GOTO       L_interrupt0
;Aula_29.c,12 :: 		TMR2IF_bit = 0x00;//LIMPA A FLAG DE INTERRUPÇÃO DO TIMER 2...***IMPORTANTE***
	BCF        TMR2IF_bit+0, 1
;Aula_29.c,13 :: 		TMR2 = 0x7D;//REDEFINE O VALOR DE TIMER 2
	MOVLW      125
	MOVWF      TMR2+0
;Aula_29.c,14 :: 		PORTB = ~PORTB;//INVERTE O VALOR DO PORTB
	COMF       PORTB+0, 1
;Aula_29.c,15 :: 		}
L_interrupt0:
;Aula_29.c,16 :: 		}
L__interrupt1:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_29.c,19 :: 		void main() {
;Aula_29.c,21 :: 		CMCON = 0x07;                  //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_29.c,23 :: 		GIE_bit = 0x01;                 //HABILITA AS INTERRUPÇÕES GLOBAIS
	BSF        GIE_bit+0, 7
;Aula_29.c,24 :: 		PEIE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES POR PERIFERICOS
	BSF        PEIE_bit+0, 6
;Aula_29.c,25 :: 		TMR2IE_bit = 0x01;              //HABILITA AS INTERRUPÇÕES DO TIMER 2
	BSF        TMR2IE_bit+0, 1
;Aula_29.c,26 :: 		T2CON = 0b01111111;             //CONFIGURA O TIMER 2...BIT MAIS SIGNIFICATIVO NÃO É IMPLEMENTADO
	MOVLW      127
	MOVWF      T2CON+0
;Aula_29.c,30 :: 		TMR2 = 0xC3;                    //DEFINE O VALOR DE CONTAGEM PARA QUE O TIMER 2 ESTOURE A CADA 50ms...APROXIMADAMENTE
	MOVLW      195
	MOVWF      TMR2+0
;Aula_29.c,33 :: 		TRISB = 0x00;                   //CONFIGURA TODO O PORTB COMO SAIDA DIGITAL
	CLRF       TRISB+0
;Aula_29.c,34 :: 		PORTB = 0x00;                   //INICIA O PORTB COM NIVEL BAIXO
	CLRF       PORTB+0
;Aula_29.c,36 :: 		}
	GOTO       $+0
; end of _main
