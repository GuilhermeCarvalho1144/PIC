
_main:

;Aula_25.c,33 :: 		void main() {
;Aula_25.c,35 :: 		CMCON = 0x07;                  //DESABILITAS OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_25.c,36 :: 		TRISA.RA0 = 0x00;                  //DEFINE RA0 E RA1 COMO ENTRADAS
	BCF        TRISA+0, 0
;Aula_25.c,37 :: 		TRISA.RA1 = 0x00;
	BCF        TRISA+0, 1
;Aula_25.c,38 :: 		TRISB = 0x00;                  //DEFINE O PORTB COMO SAIDA
	CLRF       TRISB+0
;Aula_25.c,39 :: 		PORTA = 0b01100;                  //INICIA O PORTA EM LOW
	MOVLW      12
	MOVWF      PORTA+0
;Aula_25.c,40 :: 		PORTB = 0x00;                  //INICIA O PORTB EM LOW
	CLRF       PORTB+0
;Aula_25.c,42 :: 		counter = EEPROM_Read(0x00);             //LE O VALOR DA EEPROM NO ENDEREÇO 0x00 E ATRIBUI A COUNTER (VALOR QUE É MOSTRADO NO DISPLAY)
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _counter+0
	CLRF       _counter+1
;Aula_25.c,44 :: 		while(1){
L_main0:
;Aula_25.c,45 :: 		update();
	CALL       _update+0
;Aula_25.c,46 :: 		if(!S1){
	BTFSC      RA2_bit+0, 2
	GOTO       L_main2
;Aula_25.c,47 :: 		gravarEEPROM();
	CALL       _gravarEEPROM+0
;Aula_25.c,48 :: 		}
L_main2:
;Aula_25.c,49 :: 		valor = segmento[counter];
	MOVF       _counter+0, 0
	ADDLW      _segmento+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
;Aula_25.c,50 :: 		PORTB = valor;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Aula_25.c,51 :: 		delay_ms(150);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;Aula_25.c,52 :: 		}
	GOTO       L_main0
;Aula_25.c,53 :: 		}
	GOTO       $+0
; end of _main

_update:

;Aula_25.c,59 :: 		void update(){
;Aula_25.c,60 :: 		if(!S2){
	BTFSC      RA3_bit+0, 3
	GOTO       L_update4
;Aula_25.c,61 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Aula_25.c,62 :: 		delay_ms(100);
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
;Aula_25.c,63 :: 		if(counter > 0x09) counter = 0x00;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update9
	MOVF       _counter+0, 0
	SUBLW      9
L__update9:
	BTFSC      STATUS+0, 0
	GOTO       L_update6
	CLRF       _counter+0
	CLRF       _counter+1
L_update6:
;Aula_25.c,64 :: 		}
L_update4:
;Aula_25.c,65 :: 		}
	RETURN
; end of _update

_gravarEEPROM:

;Aula_25.c,70 :: 		void gravarEEPROM(){
;Aula_25.c,71 :: 		EEPROM_Write(0x00, counter);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _counter+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Aula_25.c,72 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_gravarEEPROM7:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM7
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM7
	NOP
	NOP
;Aula_25.c,73 :: 		LED1 = 0x01;
	BSF        RA0_bit+0, 0
;Aula_25.c,74 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_gravarEEPROM8:
	DECFSZ     R13+0, 1
	GOTO       L_gravarEEPROM8
	DECFSZ     R12+0, 1
	GOTO       L_gravarEEPROM8
	DECFSZ     R11+0, 1
	GOTO       L_gravarEEPROM8
	NOP
	NOP
;Aula_25.c,75 :: 		LED1 = 0x00;
	BCF        RA0_bit+0, 0
;Aula_25.c,76 :: 		}
	RETURN
; end of _gravarEEPROM
