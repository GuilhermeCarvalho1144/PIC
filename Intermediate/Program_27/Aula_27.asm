
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_27.c,17 :: 		void interrupt(){//A VERREDURA DOS BOTÕES OCORRE APROXIMADAMENTE A CADA 20ms
;Aula_27.c,18 :: 		if(T0IF_bit){          //TESTA SE HOUVE INTERRUPÇÃO POR ESTOURO DO TIMER 0
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt0
;Aula_27.c,19 :: 		T0IF_bit = 0x00;       //LIMPA A FLAG DE INTERRUPÇÃO...***IMPORTANTE***
	BCF        T0IF_bit+0, 2
;Aula_27.c,20 :: 		TMR0 = 0x6C;           //INICIA NOVAMENTE O TIMER 0
	MOVLW      108
	MOVWF      TMR0+0
;Aula_27.c,21 :: 		if(!S1)LED2 = 0x01;          //CASO S1 ESTIVER PRECIONADO ACENDE O LED2
	BTFSC      RA0_bit+0, 0
	GOTO       L_interrupt1
	BSF        RA3_bit+0, 3
	GOTO       L_interrupt2
L_interrupt1:
;Aula_27.c,22 :: 		else if(!S2)LED2 = 0x00;     //CASO S2 ESTIVER PRECIONADO APAGA O LED2
	BTFSC      RA1_bit+0, 1
	GOTO       L_interrupt3
	BCF        RA3_bit+0, 3
L_interrupt3:
L_interrupt2:
;Aula_27.c,23 :: 		}
L_interrupt0:
;Aula_27.c,24 :: 		}
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_27.c,27 :: 		void main() {
;Aula_27.c,29 :: 		CMCON = 0x07;          //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_27.c,31 :: 		OPTION_REG = 0x86;              //DESABILITA OS RESISTORES DE PULL UP
	MOVLW      134
	MOVWF      OPTION_REG+0
;Aula_27.c,34 :: 		GIE_bit = 0x01;                 //HABILITA AS INTERRUPÇÕES
	BSF        GIE_bit+0, 7
;Aula_27.c,35 :: 		PEIE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES POR PERIFERICOS
	BSF        PEIE_bit+0, 6
;Aula_27.c,36 :: 		T0IE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES POR TIMER 0
	BSF        T0IE_bit+0, 5
;Aula_27.c,37 :: 		TMR0 = 0x6C;                    //INICIA O TIMER 0
	MOVLW      108
	MOVWF      TMR0+0
;Aula_27.c,39 :: 		TRISA = 0x03;                   //DEFINE RA0 E RA1 COMO ENTRADA DIGITAIS
	MOVLW      3
	MOVWF      TRISA+0
;Aula_27.c,40 :: 		PORTA = 0x03;                   //INCIANDO O PORTA
	MOVLW      3
	MOVWF      PORTA+0
;Aula_27.c,42 :: 		while(1){//FAZ UM BLINK NO LED1 DE 0,5s
L_main4:
;Aula_27.c,43 :: 		LED1 = 0x01;
	BSF        RA2_bit+0, 2
;Aula_27.c,44 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Aula_27.c,45 :: 		LED1 = 0x00;
	BCF        RA2_bit+0, 2
;Aula_27.c,46 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Aula_27.c,47 :: 		}
	GOTO       L_main4
;Aula_27.c,48 :: 		}
	GOTO       $+0
; end of _main
