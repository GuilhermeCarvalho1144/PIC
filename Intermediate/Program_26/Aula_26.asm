
_main:

;Aula_26.c,38 :: 		void main() {
;Aula_26.c,40 :: 		CMCON = 0x07;                  //DESABILITAS OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_26.c,41 :: 		TRISA.RA0 = 0x00;              //DEFINE RA0 E RA1 COMO ENTRADAS
	BCF        TRISA+0, 0
;Aula_26.c,42 :: 		TRISA.RA1 = 0x00;
	BCF        TRISA+0, 1
;Aula_26.c,43 :: 		TRISB = 0x00;                  //DEFINE O PORTB COMO SAIDA
	CLRF       TRISB+0
;Aula_26.c,44 :: 		PORTA = 0b01100;               //INICIA O PORTA EM LOW
	MOVLW      12
	MOVWF      PORTA+0
;Aula_26.c,45 :: 		PORTB = 0x00;                  //INICIA O PORTB EM LOW
	CLRF       PORTB+0
;Aula_26.c,47 :: 		leEEPROM();                    //LE O VALOR DA EEPROM NO ENDEREÇO CORRETO E ATRIBUI A COUNTER (VALOR QUE É MOSTRADO NO DISPLAY)
	CALL       _leEEPROM+0
;Aula_26.c,49 :: 		while(1){
L_main0:
;Aula_26.c,50 :: 		update();
	CALL       _update+0
;Aula_26.c,51 :: 		if(!S1){
	BTFSC      RA2_bit+0, 2
	GOTO       L_main2
;Aula_26.c,52 :: 		gravarEEPROM();
	CALL       _gravarEEPROM+0
;Aula_26.c,53 :: 		}
L_main2:
;Aula_26.c,54 :: 		valor = segmento[counter];
	MOVF       _counter+0, 0
	ADDLW      _segmento+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
;Aula_26.c,55 :: 		PORTB = valor;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_26.c,56 :: 		delay_ms(150);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;Aula_26.c,57 :: 		}
	GOTO       L_main0
;Aula_26.c,58 :: 		}
	GOTO       $+0
; end of _main

_update:

;Aula_26.c,66 :: 		void update(){
;Aula_26.c,67 :: 		if(!S2){
	BTFSC      RA3_bit+0, 3
	GOTO       L_update4
;Aula_26.c,68 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Aula_26.c,69 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_update5:
	DECFSZ     R13+0, 1
	GOTO       L_update5
	DECFSZ     R12+0, 1
	GOTO       L_update5
	NOP
	NOP
;Aula_26.c,70 :: 		if(counter > 0x09) counter = 0x00;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update14
	MOVF       _counter+0, 0
	SUBLW      9
L__update14:
	BTFSC      STATUS+0, 0
	GOTO       L_update6
	CLRF       _counter+0
	CLRF       _counter+1
L_update6:
;Aula_26.c,71 :: 		}
L_update4:
;Aula_26.c,72 :: 		}
	RETURN
; end of _update

_gravarEEPROM:

;Aula_26.c,80 :: 		void gravarEEPROM(){
;Aula_26.c,82 :: 		aux1 = EEPROM_Read(end1);                //LEITURA DA EEPROM
	MOVF       _end1+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;Aula_26.c,83 :: 		if(aux1 == 0xFF){                        //VERIFICA SE A EERPOM ESTÁ LIMPA....QUANDO A EEPROM ESTA LIMPA TODOS OS ENDEREÇOS SÃO 0xFF
	MOVF       R0+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_gravarEEPROM7
;Aula_26.c,84 :: 		EEPROM_Write(0x00, end1);        //ESCREVE O VALOR DE END1 NO ENDEREÇO 0x00
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _end1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Aula_26.c,85 :: 		delay_ms(10);                    //TEMPO DE ESCRITA
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_gravarEEPROM8:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM8
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM8
	NOP
	NOP
;Aula_26.c,86 :: 		}
L_gravarEEPROM7:
;Aula_26.c,87 :: 		armazena = EEPROM_Read(0x00);            //ARMAZENAMOS O VALOR DE STORE
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _armazena+0
	CLRF       _armazena+1
;Aula_26.c,88 :: 		delay_ms(10);                            //DELAY PARA QUE A OPERAÇÃO SEJA CONCLUIDA
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_gravarEEPROM9:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM9
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM9
	NOP
	NOP
;Aula_26.c,89 :: 		aux2 = armazena;                         //AUX2 RECEBE O VALOR QUE ESTA ARMAZENADO NO ENDEREÇO 0x00 DA EEPROM
	MOVF       _armazena+0, 0
	MOVWF      gravarEEPROM_aux2_L0+0
;Aula_26.c,90 :: 		EEPROM_Write(armazena, counter);         //GRAVA NO ENDEREÇO CONRESPONDE A VARIÁVEL ARMAZENA O VALOR ATUAL DE COUNTER(VALOR QUE ESTÁ NO DISPLAY)
	MOVF       _armazena+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _counter+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Aula_26.c,91 :: 		delay_ms(10);                            //TEMPO PARA A ESCRITA
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_gravarEEPROM10:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM10
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM10
	NOP
	NOP
;Aula_26.c,92 :: 		aux2++;                                  //INCREMNETA AUX2
	INCF       gravarEEPROM_aux2_L0+0, 1
;Aula_26.c,93 :: 		if(aux2 > 0x80) aux2=0x00;               //TESTA SE CEHGAMOS AO FIM DA EEPROM..SE SIM VOLTAMOS AO COMEÇO
	MOVF       gravarEEPROM_aux2_L0+0, 0
	SUBLW      128
	BTFSC      STATUS+0, 0
	GOTO       L_gravarEEPROM11
	CLRF       gravarEEPROM_aux2_L0+0
L_gravarEEPROM11:
;Aula_26.c,94 :: 		EEPROM_Write(0x00,aux2);                 //O ENDEREÇO 0x00 DA EEPROM IRA CONTER O ENDEREÇO ONDE O ULTIMO VALOR SALVO NA EEPROM ESTÁ
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       gravarEEPROM_aux2_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Aula_26.c,95 :: 		delay_ms(10);                            //DELAY PARA A ESCRITA
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_gravarEEPROM12:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM12
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM12
	NOP
	NOP
;Aula_26.c,96 :: 		LED1 = 0x01;                             //LED1 RECEBE NIVEL ALTO PARA INDICAR QUE A ESCRITA FOI FEITA
	BSF        RA0_bit+0, 0
;Aula_26.c,97 :: 		delay_ms(500);                           //DELAY
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_gravarEEPROM13:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM13
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM13
	DECFSZ     R11+0, 1
	GOTO       L_gravarEEPROM13
	NOP
	NOP
;Aula_26.c,98 :: 		LED1 = 0x00;                             //LED1 RECEBE NIVEL BAIXO
	BCF        RA0_bit+0, 0
;Aula_26.c,99 :: 		}
	RETURN
; end of _gravarEEPROM

_leEEPROM:

;Aula_26.c,105 :: 		void leEEPROM(){
;Aula_26.c,107 :: 		partida = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;Aula_26.c,108 :: 		counter = EEPROM_Read(0x00+(partida-1));
	DECF       R0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _counter+0
	CLRF       _counter+1
;Aula_26.c,109 :: 		}
	RETURN
; end of _leEEPROM
