
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_24.c,10 :: 		void interrupt(){
;Aula_24.c,11 :: 		if(T0IF_bit){
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt0
;Aula_24.c,12 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;Aula_24.c,13 :: 		TMR0 = 0x06;
	MOVLW      6
	MOVWF      TMR0+0
;Aula_24.c,14 :: 		if(count == 500){
	MOVF       _count+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVLW      244
	XORWF      _count+0, 0
L__interrupt7:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;Aula_24.c,15 :: 		RB4_bit = ~RB4_bit;
	MOVLW      16
	XORWF      RB4_bit+0, 1
;Aula_24.c,16 :: 		count = 0x00;
	CLRF       _count+0
	CLRF       _count+1
;Aula_24.c,17 :: 		}
L_interrupt1:
;Aula_24.c,18 :: 		T0IF_bit = 0x00;
	BCF        T0IF_bit+0, 2
;Aula_24.c,19 :: 		}
L_interrupt0:
;Aula_24.c,20 :: 		}
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_24.c,22 :: 		void main() {
;Aula_24.c,24 :: 		OPTION_REG = 0x81;                            //BIT MAIS SIGINIFICATIVO DESABILITA OS RESISTORES DE PULL UP (RBPU)
	MOVLW      129
	MOVWF      OPTION_REG+0
;Aula_24.c,26 :: 		GIE_bit  = 0x01;                              //HABILITA INTERRUPÇÕES GLOBAIS (GIE)
	BSF        GIE_bit+0, 7
;Aula_24.c,27 :: 		PEIE_bit = 0x01;                              //HABILITA AS INTERRUPÇÕES POR PERIFERICO (PEIE)
	BSF        PEIE_bit+0, 6
;Aula_24.c,28 :: 		T0IE_bit = 0x01;                              //HABILITA AS INTERRUPÇÕES PELO TIMMER0 (T0IE)
	BSF        T0IE_bit+0, 5
;Aula_24.c,30 :: 		TMR0 = 0x06;                                  //INICIANDO TIMMER0
	MOVLW      6
	MOVWF      TMR0+0
;Aula_24.c,32 :: 		TRISB.RB4 = 0x00;                             //CONFIGURANDO O REGISTRADOR RB4 COMO SAIDA DIGITAL
	BCF        TRISB+0, 4
;Aula_24.c,33 :: 		TRISB.RB5 = 0x00;                             //CONFIGURANDO O REGISTRADOR RB3 COMO SAIDA DIGITAL
	BCF        TRISB+0, 5
;Aula_24.c,34 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_24.c,35 :: 		RB5_bit = 0x00;                                 //INICIALIZA O RB5 EM LOW
	BCF        RB5_bit+0, 5
;Aula_24.c,37 :: 		while(1){
L_main2:
;Aula_24.c,38 :: 		RB5_bit = 0x01;
	BSF        RB5_bit+0, 5
;Aula_24.c,39 :: 		delay_ms(500);
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
;Aula_24.c,40 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_24.c,41 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Aula_24.c,42 :: 		}
	GOTO       L_main2
;Aula_24.c,43 :: 		}
	GOTO       $+0
; end of _main
