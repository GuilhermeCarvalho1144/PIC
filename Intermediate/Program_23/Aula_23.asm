
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_23.c,15 :: 		void interrupt(){
;Aula_23.c,16 :: 		if(T0IF_bit){             //QUANDO T0IF_BIT É 1 HOUVE INTERRUPÇÃO
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt0
;Aula_23.c,17 :: 		count++;         //INCREMENTO DE COUNT
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;Aula_23.c,18 :: 		TMR0 = 0x06;     //INICIALIZANDO TIMMER0
	MOVLW      6
	MOVWF      TMR0+0
;Aula_23.c,19 :: 		T0IF_bit = 0x00; //******BIT QUE DETERMINA SE HOUVE A INTERRUPÇÃO DEVE SER ZERADO VIA SOFTWARE******
	BCF        T0IF_bit+0, 2
;Aula_23.c,20 :: 		}
L_interrupt0:
;Aula_23.c,21 :: 		}
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_23.c,24 :: 		void main() {
;Aula_23.c,26 :: 		OPTION_REG = 0x81;         //DESABILITA OS RESISTORES DE PULL-UP (BIT MAIS SIGNIFICATIVO...ATIVA EM LOW RBPU)..
	MOVLW      129
	MOVWF      OPTION_REG+0
;Aula_23.c,28 :: 		GIE_bit = 0x01;            //HABILITA AS INTERRUPÇÕES GLOBAIS(BIT MAIS SIGNIFIFATIVO GIE)...
	BSF        GIE_bit+0, 7
;Aula_23.c,29 :: 		PEIE_bit = 0x01;           //...HABILITA AS INTERRUPÇÕES PELOS PERRIFERICOS(SEGUNDO BIT MAIS SIGNIFICATIVO PEIE)...
	BSF        PEIE_bit+0, 6
;Aula_23.c,30 :: 		T0IE_bit = 0x01;           //...HABILITA AS INTERRUPÇÕES POR MEIO DO TIMMER0(TERCEIRO BIT MAIS SIGNIFICATIVO T0IE)
	BSF        T0IE_bit+0, 5
;Aula_23.c,32 :: 		TMR0 = 0x06;               //INICIALIZA O TIMMER0
	MOVLW      6
	MOVWF      TMR0+0
;Aula_23.c,36 :: 		TRISB.RB4 = 0x00;          //DEFINE O PINO RB4 COMO SAIDA DIGITAL
	BCF        TRISB+0, 4
;Aula_23.c,37 :: 		PORTB = 0x00;              //INICIALIZA TODO O PORTB...O VALOR DEVE SER 0x06 PARA QUE O DELAY SEJA DE 500ms
	CLRF       PORTB+0
;Aula_23.c,40 :: 		while(1){
L_main1:
;Aula_23.c,41 :: 		if(count == 500){    //***CONTA*** -> [1/(CLOCK/4)] * 4 * 250 = 500ms......***CLOCK = 4MHz**
	MOVF       _count+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      244
	XORWF      _count+0, 0
L__main5:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Aula_23.c,42 :: 		output = ~output;
	MOVLW      16
	XORWF      RB4_bit+0, 1
;Aula_23.c,43 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;Aula_23.c,44 :: 		}
L_main3:
;Aula_23.c,45 :: 		}
	GOTO       L_main1
;Aula_23.c,46 :: 		}
	GOTO       $+0
; end of _main
