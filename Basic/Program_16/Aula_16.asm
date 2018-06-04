
_main:

;Aula_16.c,21 :: 		void main() {
;Aula_16.c,23 :: 		CMCON = 0x07; //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_16.c,24 :: 		TRISA = 0x03; //CONFIGURA RA0E RA1 COMO ENTRADA DIGITAIS E OS DEMAIS COMO SAIDA
	MOVLW      3
	MOVWF      TRISA+0
;Aula_16.c,25 :: 		TRISB = 0X00; //CONFIGURA O PORT B COMO SAIDA DIGITAL
	CLRF       TRISB+0
;Aula_16.c,26 :: 		DIG2 = 0;     //INICIALIZA O DIGITO DAS DEZENAS
	BCF        RA2_bit+0, 2
;Aula_16.c,27 :: 		DIG3 = 0;     //INICIALIZA O DIGITO DAS CENTENAS
	BCF        RA3_bit+0, 3
;Aula_16.c,30 :: 		while(1){
L_main0:
;Aula_16.c,32 :: 		ChangeCounter();
	CALL       _ChangeCounter+0
;Aula_16.c,34 :: 		cent = (cont/100) - ((cont%100)/100);   //EX -> 253/100=2.53......253%100=53......53/100=0.53......2.53-0.53 = 2
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cont+0, 0
	MOVWF      R0+0
	MOVF       _cont+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cont+0, 0
	MOVWF      R0+0
	MOVF       _cont+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _cent+0
	MOVF       R0+1, 0
	MOVWF      _cent+1
;Aula_16.c,35 :: 		PORTB = Display(cent);                  //ATUALIZA O VALOR DA CENTENA NO DISPLAY
	MOVF       R0+0, 0
	MOVWF      FARG_Display_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_Display_num+1
	CALL       _Display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_16.c,36 :: 		DIG1 = 0x01;                            //HABILTA O DISPLAY DAS CENTENAS
	BSF        RB7_bit+0, 7
;Aula_16.c,37 :: 		delay_ms(5);                            //DELAY PARA A MULTIPLEXACAO
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
;Aula_16.c,38 :: 		DIG1 = 0x00;                            //DESABILITA O DISPLAY DAS CENTENAS
	BCF        RB7_bit+0, 7
;Aula_16.c,40 :: 		dez = cont%100;                         //TIRA A CENTENA DO NUMERO
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cont+0, 0
	MOVWF      R0+0
	MOVF       _cont+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _dez+0
	MOVF       R0+1, 0
	MOVWF      _dez+1
;Aula_16.c,41 :: 		dez = (dez/10) - ((cont%10)/10);        //EX -> 53/10=5.3......53%10=3......3/10=0.3......5.3-0.3 = 5
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cont+0, 0
	MOVWF      R0+0
	MOVF       _cont+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _dez+0
	MOVF       R0+1, 0
	MOVWF      _dez+1
;Aula_16.c,42 :: 		PORTB = Display(dez);                   //ATUALIZA O VALOR DA DEZENA NO DISPLAY
	MOVF       R0+0, 0
	MOVWF      FARG_Display_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_Display_num+1
	CALL       _Display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_16.c,43 :: 		DIG2 = 0x01;                            //HABILITA O DISPLAY DAS DEZENAS
	BSF        RA2_bit+0, 2
;Aula_16.c,44 :: 		delay_ms(5);                            //DELAY DA MULTIPLEXACAO
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;Aula_16.c,45 :: 		DIG2 = 0x00;                            //DESABILITA O DISPLAY DAS DEZENAS
	BCF        RA2_bit+0, 2
;Aula_16.c,47 :: 		uni = cont%10;                          // EX -> 253%10=3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cont+0, 0
	MOVWF      R0+0
	MOVF       _cont+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	MOVWF      _uni+1
;Aula_16.c,48 :: 		PORTB = Display(uni);                   //ATUALIZA O VALOR DA UNIDADE NO DISLAY
	MOVF       R0+0, 0
	MOVWF      FARG_Display_num+0
	MOVF       R0+1, 0
	MOVWF      FARG_Display_num+1
	CALL       _Display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_16.c,49 :: 		DIG3 = 0x01;                            //HABILITA O DISPLAY DAS UNIDADES
	BSF        RA3_bit+0, 3
;Aula_16.c,50 :: 		delay_ms(5);                            //DELAY PARA A MULTIPLEXACAO
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;Aula_16.c,51 :: 		DIG3 = 0x00;                            //DESABILITA O DISPLAY DAS UNIDADES
	BCF        RA3_bit+0, 3
;Aula_16.c,53 :: 		}
	GOTO       L_main0
;Aula_16.c,55 :: 		}
	GOTO       $+0
; end of _main

_Display:

;Aula_16.c,63 :: 		int Display(int num){
;Aula_16.c,65 :: 		int SegCod[] = {0x3F , 0x06 , 0x5B , 0x4F, 0x66 , 0x6D , 0x7D , 0x07 , 0x7F , 0x67};          //VETOR DE CONERSAO
	MOVLW      63
	MOVWF      Display_SegCod_L0+0
	MOVLW      0
	MOVWF      Display_SegCod_L0+1
	MOVLW      6
	MOVWF      Display_SegCod_L0+2
	MOVLW      0
	MOVWF      Display_SegCod_L0+3
	MOVLW      91
	MOVWF      Display_SegCod_L0+4
	MOVLW      0
	MOVWF      Display_SegCod_L0+5
	MOVLW      79
	MOVWF      Display_SegCod_L0+6
	MOVLW      0
	MOVWF      Display_SegCod_L0+7
	MOVLW      102
	MOVWF      Display_SegCod_L0+8
	MOVLW      0
	MOVWF      Display_SegCod_L0+9
	MOVLW      109
	MOVWF      Display_SegCod_L0+10
	MOVLW      0
	MOVWF      Display_SegCod_L0+11
	MOVLW      125
	MOVWF      Display_SegCod_L0+12
	MOVLW      0
	MOVWF      Display_SegCod_L0+13
	MOVLW      7
	MOVWF      Display_SegCod_L0+14
	MOVLW      0
	MOVWF      Display_SegCod_L0+15
	MOVLW      127
	MOVWF      Display_SegCod_L0+16
	MOVLW      0
	MOVWF      Display_SegCod_L0+17
	MOVLW      103
	MOVWF      Display_SegCod_L0+18
	MOVLW      0
	MOVWF      Display_SegCod_L0+19
;Aula_16.c,66 :: 		parametro = SegCod[num];
	MOVF       FARG_Display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_Display_num+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      Display_SegCod_L0+0
	MOVWF      FSR
;Aula_16.c,67 :: 		return(parametro);                                                                          //RETORNO DA FUNCAO
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
;Aula_16.c,68 :: 		}
	RETURN
; end of _Display

_ChangeCounter:

;Aula_16.c,72 :: 		void ChangeCounter(){
;Aula_16.c,73 :: 		if(MAIS == 1){  //BUTAO MAIS ATIVO
	BTFSS      RA0_bit+0, 0
	GOTO       L_ChangeCounter5
;Aula_16.c,74 :: 		cont++; //INCREMENTO DE CONTADOR
	INCF       _cont+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cont+1, 1
;Aula_16.c,75 :: 		delay_ms(180);//DELAY PARA EVITAR DUPLO CLICK
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_ChangeCounter6:
	DECFSZ     R13+0, 1
	GOTO       L_ChangeCounter6
	DECFSZ     R12+0, 1
	GOTO       L_ChangeCounter6
;Aula_16.c,76 :: 		if(cont >= 999) cont = 999; //LIMITE SUPERIOR DA CONTAGEM
	MOVLW      128
	XORWF      _cont+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ChangeCounter11
	MOVLW      231
	SUBWF      _cont+0, 0
L__ChangeCounter11:
	BTFSS      STATUS+0, 0
	GOTO       L_ChangeCounter7
	MOVLW      231
	MOVWF      _cont+0
	MOVLW      3
	MOVWF      _cont+1
L_ChangeCounter7:
;Aula_16.c,77 :: 		}
L_ChangeCounter5:
;Aula_16.c,78 :: 		if(MENOS == 1){ //BOTAO MENOS ATIVO
	BTFSS      RA1_bit+0, 1
	GOTO       L_ChangeCounter8
;Aula_16.c,79 :: 		cont--; //DECREMENTO DO CONTADOR
	MOVLW      1
	SUBWF      _cont+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cont+1, 1
;Aula_16.c,80 :: 		delay_ms(180); //DELAY PARA EVITAR DUPLO CLICK
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_ChangeCounter9:
	DECFSZ     R13+0, 1
	GOTO       L_ChangeCounter9
	DECFSZ     R12+0, 1
	GOTO       L_ChangeCounter9
;Aula_16.c,81 :: 		if(cont <= 0) cont = 0; //LIMITE INFERIOR DA CONTAGEM
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cont+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ChangeCounter12
	MOVF       _cont+0, 0
	SUBLW      0
L__ChangeCounter12:
	BTFSS      STATUS+0, 0
	GOTO       L_ChangeCounter10
	CLRF       _cont+0
	CLRF       _cont+1
L_ChangeCounter10:
;Aula_16.c,82 :: 		}
L_ChangeCounter8:
;Aula_16.c,84 :: 		}
	RETURN
; end of _ChangeCounter
