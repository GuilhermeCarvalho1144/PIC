
_main:

;Aula_21.c,18 :: 		void main() {
;Aula_21.c,20 :: 		CMCON = 0x07;//DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_21.c,21 :: 		ADCON0 = 0x01;//HABILITA A CONVERÇAÕ A/D
	MOVLW      1
	MOVWF      ADCON0+0
;Aula_21.c,22 :: 		ADCON1 = 0x0E;//TORNA AN0 UMA ENTRADA ANALOGICA
	MOVLW      14
	MOVWF      ADCON1+0
;Aula_21.c,24 :: 		UART1_Init(9600);//INICIALIZA A COMUNICAÇÃO UART COM 9600 BPS
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Aula_21.c,25 :: 		Delay_ms(100);//DELAY PARA A ESTABILIZAÇÃO DA COMUNICAÇÃO UART
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;Aula_21.c,26 :: 		UART1_Write_Text("START");//MENSAGEM QUE MOSTRA QUE A COMUNICAÇÃO ESTA FUNCIONANDO
	MOVLW      ?lstr1_Aula_21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,27 :: 		UART1_Write(10);//ESCREVE O ESPAÇO....10 = ESPAÇO NA TABELA ASCII
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,28 :: 		UART1_Write(13);//QUEBRA LINHA....13 = QUEBRA LINHA NA TABELA ASCII
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,30 :: 		TRISB = 0x03;//DEFINE RB0 E RB1 COMO ENTRADAS DIGITAIS
	MOVLW      3
	MOVWF      TRISB+0
;Aula_21.c,31 :: 		PORTB = 0x00;//INICIALIZA O PORTB COM NIVEL BAIXO
	CLRF       PORTB+0
;Aula_21.c,33 :: 		while(1){
L_main1:
;Aula_21.c,35 :: 		if (UART1_Data_Ready()) {     // If data is received, //********************PARTE TIRADA DO HELP
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Aula_21.c,36 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Aula_21.c,37 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,38 :: 		}//**********************PARTE TIRADA DO HELP
L_main3:
;Aula_21.c,39 :: 		if(S1 == 1 && S2 ==0){
	BTFSS      RB0_bit+0, 0
	GOTO       L_main6
	BTFSC      RB1_bit+0, 1
	GOTO       L_main6
L__main15:
;Aula_21.c,40 :: 		valorAD = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	CLRF       _valorAD+2
	CLRF       _valorAD+3
;Aula_21.c,41 :: 		Celsius(valorAD);
	MOVF       _valorAD+0, 0
	MOVWF      FARG_Celsius_AD+0
	MOVF       _valorAD+1, 0
	MOVWF      FARG_Celsius_AD+1
	MOVF       _valorAD+2, 0
	MOVWF      FARG_Celsius_AD+2
	MOVF       _valorAD+3, 0
	MOVWF      FARG_Celsius_AD+3
	CALL       _Celsius+0
;Aula_21.c,42 :: 		}
L_main6:
;Aula_21.c,43 :: 		if(S1 == 0 && S2 ==1){
	BTFSC      RB0_bit+0, 0
	GOTO       L_main9
	BTFSS      RB1_bit+0, 1
	GOTO       L_main9
L__main14:
;Aula_21.c,44 :: 		valorAD = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	CLRF       _valorAD+2
	CLRF       _valorAD+3
;Aula_21.c,45 :: 		Fahrenheit(valorAD);
	MOVF       _valorAD+0, 0
	MOVWF      FARG_Fahrenheit_AD+0
	MOVF       _valorAD+1, 0
	MOVWF      FARG_Fahrenheit_AD+1
	MOVF       _valorAD+2, 0
	MOVWF      FARG_Fahrenheit_AD+2
	MOVF       _valorAD+3, 0
	MOVWF      FARG_Fahrenheit_AD+3
	CALL       _Fahrenheit+0
;Aula_21.c,46 :: 		}
	GOTO       L_main10
L_main9:
;Aula_21.c,48 :: 		UART1_Write_Text("AGUARDANDO");//MENSAGEM QUE MOSTRA QUE A COMUNICAÇÃO ESTA FUNCIONANDO
	MOVLW      ?lstr2_Aula_21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,49 :: 		UART1_Write(10);//ESCREVE O ESPAÇO....10 = ESPAÇO NA TABELA ASCII
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,50 :: 		UART1_Write(13);//QUEBRA LINHA....13 = QUEBRA LINHA NA TABELA ASCII
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,51 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Aula_21.c,52 :: 		}
L_main10:
;Aula_21.c,54 :: 		}
	GOTO       L_main1
;Aula_21.c,56 :: 		}
	GOTO       $+0
; end of _main

_Celsius:

;Aula_21.c,67 :: 		void Celsius(long AD){
;Aula_21.c,69 :: 		valor = AD*500/1023;///CONTA PARA A CONVERSÃO PARA CELSIUS
	MOVF       FARG_Celsius_AD+0, 0
	MOVWF      R0+0
	MOVF       FARG_Celsius_AD+1, 0
	MOVWF      R0+1
	MOVF       FARG_Celsius_AD+2, 0
	MOVWF      R0+2
	MOVF       FARG_Celsius_AD+3, 0
	MOVWF      R0+3
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
;Aula_21.c,70 :: 		IntToStr(valor , txt);//CONVERTE O LONG EM STRING
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Aula_21.c,71 :: 		UART1_Write_Text(txt);//IMPRIMI O VALOR DA MEDIÇÃO EM GRAUS CELSIUS
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,72 :: 		UART1_Write_Text(" CELSIUS");//IMPRIMI A string
	MOVLW      ?lstr3_Aula_21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,73 :: 		UART1_Write(10);//IMPRIMI O ESPAÇO
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,74 :: 		UART1_Write(13);//IMPRIMI O QUEBRA LINHA
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,75 :: 		Delay_ms(150);//DELAY PARA VISUALIZAÇÃO
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_Celsius12:
	DECFSZ     R13+0, 1
	GOTO       L_Celsius12
	DECFSZ     R12+0, 1
	GOTO       L_Celsius12
	DECFSZ     R11+0, 1
	GOTO       L_Celsius12
	NOP
	NOP
;Aula_21.c,76 :: 		}
	RETURN
; end of _Celsius

_Fahrenheit:

;Aula_21.c,85 :: 		void Fahrenheit(long AD){
;Aula_21.c,87 :: 		valor = AD*500/1023;//CONVERSÃO PARA CELCIUS
	MOVF       FARG_Fahrenheit_AD+0, 0
	MOVWF      R0+0
	MOVF       FARG_Fahrenheit_AD+1, 0
	MOVWF      R0+1
	MOVF       FARG_Fahrenheit_AD+2, 0
	MOVWF      R0+2
	MOVF       FARG_Fahrenheit_AD+3, 0
	MOVWF      R0+3
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
;Aula_21.c,88 :: 		valor = (valor*1.8)+32;//CONVERSÃO PARA FAHRENHEIT
	CALL       _Longint2Double+0
	MOVLW      102
	MOVWF      R4+0
	MOVLW      102
	MOVWF      R4+1
	MOVLW      102
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _Double2Longint+0
;Aula_21.c,89 :: 		IntToStr(valor , txt);//CONVERTE INT PARA STRING
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Aula_21.c,90 :: 		UART1_Write_Text(txt);//IMPRIMI A STRING EM GRAUS FAHRENHEIT
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,91 :: 		UART1_Write_Text(" FAHRENHEIT");//IMPRIMI A STRING
	MOVLW      ?lstr4_Aula_21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_21.c,92 :: 		UART1_Write(10);//IMPRIMIR O ESPAÇO
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,93 :: 		UART1_Write(13);//IMPRIMI O QUEBRA LINHA
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_21.c,94 :: 		delay_ms(150);//DELYA PARA VISUALIZAÇÃO
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_Fahrenheit13:
	DECFSZ     R13+0, 1
	GOTO       L_Fahrenheit13
	DECFSZ     R12+0, 1
	GOTO       L_Fahrenheit13
	DECFSZ     R11+0, 1
	GOTO       L_Fahrenheit13
	NOP
	NOP
;Aula_21.c,95 :: 		}
	RETURN
; end of _Fahrenheit
