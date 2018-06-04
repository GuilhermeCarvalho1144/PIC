
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_30.c,14 :: 		void interrupt(){//VARREDURA ACONTECE A CADA 20ms APROXIMADAMENTE
;Aula_30.c,15 :: 		if(T0IF_bit){//VERIFICA SE HOUVE ESTOURO DO TIMER 0
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt0
;Aula_30.c,16 :: 		T0IF_bit = 0x00;//LIMPA A FLAG DE INTERRUPÇÃO DO TIMER 0...***IMPORTANTE***
	BCF        T0IF_bit+0, 2
;Aula_30.c,17 :: 		TMR0 = 0x6C;//REDEFINE O VALOR DE TIME
	MOVLW      108
	MOVWF      TMR0+0
;Aula_30.c,18 :: 		if(!S1) CCPR1L++;      //CASO S1 FOR PRECIONADO, ENTÃO AUMENTA O DUTY CICLE
	BTFSC      RA0_bit+0, 0
	GOTO       L_interrupt1
	INCF       CCPR1L+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
L_interrupt1:
;Aula_30.c,19 :: 		if(!S2) CCPR1L--;      //CASO S2 FOR PRECIONADO, ENTÃO DECREMENTA DUTY CICLE
	BTFSC      RA1_bit+0, 1
	GOTO       L_interrupt2
	DECF       CCPR1L+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
L_interrupt2:
;Aula_30.c,20 :: 		}
L_interrupt0:
;Aula_30.c,21 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_30.c,24 :: 		void main() {
;Aula_30.c,26 :: 		CMCON = 0x07;                  //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_30.c,28 :: 		OPTION_REG = 0x86;              //DESABILITA OS RESISTORES DE PULL-UP...SETA O PRESCALER DO TIME 0 PARA 1:126
	MOVLW      134
	MOVWF      OPTION_REG+0
;Aula_30.c,29 :: 		GIE_bit = 0x01;                 //HABILITA AS INTERRUPÇÕES GLOBAIS
	BSF        GIE_bit+0, 7
;Aula_30.c,30 :: 		PEIE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES POR PERIFERICOS
	BSF        PEIE_bit+0, 6
;Aula_30.c,31 :: 		T0IE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES POR TIMER 0
	BSF        T0IE_bit+0, 5
;Aula_30.c,32 :: 		TMR0 = 0x6C;                    //DEFINE O VALOR DE TIMER 0 PARA O ESTOURO SER APROXIMADAMENTE 20ms
	MOVLW      108
	MOVWF      TMR0+0
;Aula_30.c,38 :: 		T2CON = 0x06;                   //LIGA O TIMER 2...SETA O POSCALER DE 1:1 E PRESCALER DE 1:16
	MOVLW      6
	MOVWF      T2CON+0
;Aula_30.c,39 :: 		TMR2 = 0xFF;                    //DEFINER O VALOR INICIAL DO REGISTRADOR DE ESTOURO TIMER 2
	MOVLW      255
	MOVWF      TMR2+0
;Aula_30.c,40 :: 		CCPR1L = 0x00;                  //FAZ COM QUE O LED INICIE APAGADO... A RESOLUÇÃO DO PWM É DE 10 BITS
	CLRF       CCPR1L+0
;Aula_30.c,43 :: 		CCP1CON = 0x0C;                 //HABILITA O MODOLU PWM
	MOVLW      12
	MOVWF      CCP1CON+0
;Aula_30.c,45 :: 		TRISA = 0x03;                   //DEFINE RA0 E RA1 COMO ENTRADAS DIGITAIS
	MOVLW      3
	MOVWF      TRISA+0
;Aula_30.c,46 :: 		TRISB = 0x00;                   //DEFINE TODO O PORTB COMO SAIDA DIGITAL..PINO QUE É USADO PARA PWM É O RB3/CCP1
	CLRF       TRISB+0
;Aula_30.c,47 :: 		PORTA = 0x03;                   //RA0 E RA1 INICIAM EM NIVEL HIGH...SÃO ATIVOS EM NIVEL LOW(RESISTOR DE PULL-UP)
	MOVLW      3
	MOVWF      PORTA+0
;Aula_30.c,48 :: 		PORTB = 0x00;                   //INICIA O PORTB TODO EM NIVEL LOW
	CLRF       PORTB+0
;Aula_30.c,50 :: 		}
	GOTO       $+0
; end of _main
