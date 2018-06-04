
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Aula_28.c,30 :: 		void interrupt(){//A VERREDURA DOS BOTÕES OCORRE APROXIMADAMENTE A CADA 20ms
;Aula_28.c,31 :: 		if(T0IF_bit){//TESTA SE HOUVE INTERRUPÇÃO POR ESTOURO DO TIMER 0
	BTFSS      T0IF_bit+0, 2
	GOTO       L_interrupt0
;Aula_28.c,32 :: 		T0IF_bit = 0x00;    //LIMPA A FLAG DE INTERRUPÇÃO DO TIMER 0...***IMPORTANTE***
	BCF        T0IF_bit+0, 2
;Aula_28.c,33 :: 		TMR0 = 0x6C;        //DEFINE O VALOR DE TIMER 0
	MOVLW      108
	MOVWF      TMR0+0
;Aula_28.c,34 :: 		if(col1 && controle == 0x01){//TESTA A COLUNA 1
	BTFSS      RB1_bit+0, 1
	GOTO       L_interrupt3
	MOVF       _controle+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
L__interrupt49:
;Aula_28.c,35 :: 		controle = 0x02;            //SETA O CONTROLE PARA QUE A COLUNA 2 SEJA TESTADA
	MOVLW      2
	MOVWF      _controle+0
;Aula_28.c,36 :: 		col1 = 0x00;                //DEFINE A COLUNA 1 COMO 0...RESISTORES DE PULL-UP
	BCF        RB1_bit+0, 1
;Aula_28.c,37 :: 		col2 = 0x01;
	BSF        RB2_bit+0, 2
;Aula_28.c,38 :: 		col3 = 0x01;
	BSF        RB3_bit+0, 3
;Aula_28.c,39 :: 		if(!rowA) pulsar(1);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt4
	MOVLW      1
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt5
L_interrupt4:
;Aula_28.c,40 :: 		else if(!rowB)pulsar(4);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt6
	MOVLW      4
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt7
L_interrupt6:
;Aula_28.c,41 :: 		else if(!rowC)pulsar(7);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt8
	MOVLW      7
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt9
L_interrupt8:
;Aula_28.c,42 :: 		else if(!rowD)pulsar(11);
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt10
	MOVLW      11
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
L_interrupt10:
L_interrupt9:
L_interrupt7:
L_interrupt5:
;Aula_28.c,43 :: 		}
	GOTO       L_interrupt11
L_interrupt3:
;Aula_28.c,44 :: 		else if(col2 && controle == 0x02){
	BTFSS      RB2_bit+0, 2
	GOTO       L_interrupt14
	MOVF       _controle+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt14
L__interrupt48:
;Aula_28.c,45 :: 		controle  = 0x03;           //SETA O CONTROLE PARA QUE A COLUNA 3 SEJA TESTADA
	MOVLW      3
	MOVWF      _controle+0
;Aula_28.c,46 :: 		col1 = 0x01;
	BSF        RB1_bit+0, 1
;Aula_28.c,47 :: 		col2 = 0x00;                //DEFINE A COLUNA 2 COMO 0...RESISTORES DE PULL-UP
	BCF        RB2_bit+0, 2
;Aula_28.c,48 :: 		col3 = 0x01;
	BSF        RB3_bit+0, 3
;Aula_28.c,49 :: 		if(!rowA) pulsar(2);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt15
	MOVLW      2
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt16
L_interrupt15:
;Aula_28.c,50 :: 		else if(!rowB)pulsar(5);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt17
	MOVLW      5
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt18
L_interrupt17:
;Aula_28.c,51 :: 		else if(!rowC)pulsar(8);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt19
	MOVLW      8
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt20
L_interrupt19:
;Aula_28.c,52 :: 		else if(!rowD)pulsar(10);
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt21
	MOVLW      10
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
L_interrupt21:
L_interrupt20:
L_interrupt18:
L_interrupt16:
;Aula_28.c,53 :: 		}
	GOTO       L_interrupt22
L_interrupt14:
;Aula_28.c,54 :: 		else if(col3 && controle == 0x03){
	BTFSS      RB3_bit+0, 3
	GOTO       L_interrupt25
	MOVF       _controle+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt25
L__interrupt47:
;Aula_28.c,55 :: 		controle = 0x01;            //SETA O CONTROLE PARA QUE A COLUNA 1 SEJA TESTADA
	MOVLW      1
	MOVWF      _controle+0
;Aula_28.c,56 :: 		col1 = 0x01;
	BSF        RB1_bit+0, 1
;Aula_28.c,57 :: 		col2 = 0x01;
	BSF        RB2_bit+0, 2
;Aula_28.c,58 :: 		col3 = 0x00;                //DEFINE A COLUNA 3 COMO 0...RESISTORES DE PULL-UP
	BCF        RB3_bit+0, 3
;Aula_28.c,59 :: 		if(!rowA) pulsar(3);
	BTFSC      RB4_bit+0, 4
	GOTO       L_interrupt26
	MOVLW      3
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt27
L_interrupt26:
;Aula_28.c,60 :: 		else if(!rowB)pulsar(6);
	BTFSC      RB5_bit+0, 5
	GOTO       L_interrupt28
	MOVLW      6
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt29
L_interrupt28:
;Aula_28.c,61 :: 		else if(!rowC)pulsar(9);
	BTFSC      RB6_bit+0, 6
	GOTO       L_interrupt30
	MOVLW      9
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
	GOTO       L_interrupt31
L_interrupt30:
;Aula_28.c,62 :: 		else if(!rowD)pulsar(12);
	BTFSC      RB7_bit+0, 7
	GOTO       L_interrupt32
	MOVLW      12
	MOVWF      FARG_pulsar_n+0
	CALL       _pulsar+0
L_interrupt32:
L_interrupt31:
L_interrupt29:
L_interrupt27:
;Aula_28.c,63 :: 		}
L_interrupt25:
L_interrupt22:
L_interrupt11:
;Aula_28.c,64 :: 		}
L_interrupt0:
;Aula_28.c,65 :: 		}
L__interrupt50:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Aula_28.c,68 :: 		void main() {
;Aula_28.c,70 :: 		CMCON = 0x07;                  //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_28.c,72 :: 		OPTION_REG = 0x86;             //DESABILITA OS RESISTORES DE PULL-UP
	MOVLW      134
	MOVWF      OPTION_REG+0
;Aula_28.c,75 :: 		GIE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES GLOBAIS
	BSF        GIE_bit+0, 7
;Aula_28.c,76 :: 		PEIE_bit = 0x01;               //HABILITA AS INTERUPÇÕES POR PERIFERIOS
	BSF        PEIE_bit+0, 6
;Aula_28.c,77 :: 		T0IE_bit = 0x01;               //HABILITA A INTERRUPÇÃO POR ESTOURO DO TIMER 0
	BSF        T0IE_bit+0, 5
;Aula_28.c,78 :: 		TMR0 = 0x6C;                   //INICIA O TIMER 0...VALOR DEFINIDO PARA UMA VARREDURA DE 20ms
	MOVLW      108
	MOVWF      TMR0+0
;Aula_28.c,80 :: 		TRISA = 0x03;                  //DEFINE RA0 E RA1 COMO ENTRADA DIGITAIS
	MOVLW      3
	MOVWF      TRISA+0
;Aula_28.c,81 :: 		TRISB = 0xF0;                  //DEFINE NIBBLE MAIS SIGNIFICATIVO COMO ENTRADA DIGITAL
	MOVLW      240
	MOVWF      TRISB+0
;Aula_28.c,82 :: 		PORTA = 0x03;                  //INICIA O PORTA
	MOVLW      3
	MOVWF      PORTA+0
;Aula_28.c,83 :: 		PORTB = 0xFF;                  //INICIA O PORTB
	MOVLW      255
	MOVWF      PORTB+0
;Aula_28.c,84 :: 		while(1){//NEM SEMPRE FUNCIONA POIS A INTERRUPÇÃO TOMA MTO TEMPO
L_main33:
;Aula_28.c,85 :: 		if(!S1) led = 0x00;   //BLINKA LED1
	BTFSC      RA0_bit+0, 0
	GOTO       L_main35
	CLRF       _led+0
L_main35:
;Aula_28.c,86 :: 		if(!S2) led = 0x01;   //BLINKA LED2
	BTFSC      RA1_bit+0, 1
	GOTO       L_main36
	MOVLW      1
	MOVWF      _led+0
L_main36:
;Aula_28.c,87 :: 		}
	GOTO       L_main33
;Aula_28.c,88 :: 		}
	GOTO       $+0
; end of _main

_pulsar:

;Aula_28.c,95 :: 		void pulsar (char n){
;Aula_28.c,97 :: 		for(i = 0 ; i < n ; i++){              //LOOP FOR
	CLRF       R1+0
L_pulsar37:
	MOVF       FARG_pulsar_n+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_pulsar38
;Aula_28.c,98 :: 		if(!led){                     //BLINKAR LED1
	MOVF       _led+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_pulsar40
;Aula_28.c,99 :: 		LED1 = 0x01;                  //DEFINE LED1 COM LIVEL ALTO
	BSF        RA2_bit+0, 2
;Aula_28.c,100 :: 		delay_ms(200);                //DELAY
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulsar41:
	DECFSZ     R13+0, 1
	GOTO       L_pulsar41
	DECFSZ     R12+0, 1
	GOTO       L_pulsar41
	DECFSZ     R11+0, 1
	GOTO       L_pulsar41
	NOP
;Aula_28.c,101 :: 		LED1 = 0x00;                  //DEFINE O LED1 COM NIVEL BAIXO
	BCF        RA2_bit+0, 2
;Aula_28.c,102 :: 		delay_ms(200);                //DELAY
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulsar42:
	DECFSZ     R13+0, 1
	GOTO       L_pulsar42
	DECFSZ     R12+0, 1
	GOTO       L_pulsar42
	DECFSZ     R11+0, 1
	GOTO       L_pulsar42
	NOP
;Aula_28.c,103 :: 		}
	GOTO       L_pulsar43
L_pulsar40:
;Aula_28.c,104 :: 		else if(led){                          //BLINKAR LED2
	MOVF       _led+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pulsar44
;Aula_28.c,105 :: 		LED2 = 0x01;                  //DEFINE LED2 COM LIVEL ALTO
	BSF        RA3_bit+0, 3
;Aula_28.c,106 :: 		delay_ms(200);                //DELAY
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulsar45:
	DECFSZ     R13+0, 1
	GOTO       L_pulsar45
	DECFSZ     R12+0, 1
	GOTO       L_pulsar45
	DECFSZ     R11+0, 1
	GOTO       L_pulsar45
	NOP
;Aula_28.c,107 :: 		LED2 = 0x00;                  //DEFINE O LED2 COM NIVEL BAIXO
	BCF        RA3_bit+0, 3
;Aula_28.c,108 :: 		delay_ms(200);                //DELAY
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_pulsar46:
	DECFSZ     R13+0, 1
	GOTO       L_pulsar46
	DECFSZ     R12+0, 1
	GOTO       L_pulsar46
	DECFSZ     R11+0, 1
	GOTO       L_pulsar46
	NOP
;Aula_28.c,109 :: 		}
L_pulsar44:
L_pulsar43:
;Aula_28.c,97 :: 		for(i = 0 ; i < n ; i++){              //LOOP FOR
	INCF       R1+0, 1
;Aula_28.c,110 :: 		}
	GOTO       L_pulsar37
L_pulsar38:
;Aula_28.c,111 :: 		}
	RETURN
; end of _pulsar
