
_main:

;Aula_20.c,16 :: 		void main() {
;Aula_20.c,18 :: 		CMCON = 0x07;//DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_20.c,19 :: 		ADCON0 = 0x00;//DESABILITA O MODULO A/D
	CLRF       ADCON0+0
;Aula_20.c,20 :: 		ADCON1 = 0x06;//CONFIGURA AS PORTAS COMO SAIDAS DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;Aula_20.c,22 :: 		UART1_Init(9600);//INICIA A COMUNICAÇÃO EM 9600 BPS
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Aula_20.c,23 :: 		Delay_ms(100);//DELAY PARA A ESTABILIZAÇÃO
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
;Aula_20.c,24 :: 		UART1_Write_Text("START");//MENSAGEM QUE MOSTRA QUE A COMUNICAÇÃO ESTA FUNCIONANDO
	MOVLW      ?lstr1_Aula_20+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_20.c,25 :: 		UART1_Write(10);//ESCREVE O ESPAÇO....10 = ESPAÇO NA TABELA ASCII
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_20.c,26 :: 		UART1_Write(13);//QUEBRA LINHA....13 = QUEBRA LINHA NA TABELA ASCII
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_20.c,28 :: 		TRISB = 0x80;//CONFIGURA RB7 COMO ENTRADA E O RESTANTE COMO SAIDAS DIGITAIS
	MOVLW      128
	MOVWF      TRISB+0
;Aula_20.c,29 :: 		PORTB = 0x00;//INICIALIZA O PORTB COM NIVEL BAIXO
	CLRF       PORTB+0
;Aula_20.c,31 :: 		while(1){
L_main1:
;Aula_20.c,32 :: 		if (UART1_Data_Ready()) {     // If data is received, //********************PARTE TIRADA DO HELP
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Aula_20.c,33 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Aula_20.c,34 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_20.c,35 :: 		}//**********************PARTE TIRADA DO HELP
L_main3:
;Aula_20.c,36 :: 		switch(uart_rd){//LOGICA PARA OS LEDS
	GOTO       L_main4
;Aula_20.c,37 :: 		case 'r': RED = 0x01; break;
L_main6:
	BSF        RB0_bit+0, 0
	GOTO       L_main5
;Aula_20.c,38 :: 		case 't': RED = 0x00; break;
L_main7:
	BCF        RB0_bit+0, 0
	GOTO       L_main5
;Aula_20.c,39 :: 		case 'g': GREEN = 0x01; break;
L_main8:
	BSF        RB1_bit+0, 1
	GOTO       L_main5
;Aula_20.c,40 :: 		case 'h': GREEN = 0x00; break;
L_main9:
	BCF        RB1_bit+0, 1
	GOTO       L_main5
;Aula_20.c,41 :: 		case 'y': YELLOW = 0x01; break;
L_main10:
	BSF        RB2_bit+0, 2
	GOTO       L_main5
;Aula_20.c,42 :: 		case 'u': YELLOW = 0x00; break;
L_main11:
	BCF        RB2_bit+0, 2
	GOTO       L_main5
;Aula_20.c,43 :: 		}
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      114
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      116
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _uart_rd+0, 0
	XORLW      103
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _uart_rd+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      121
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      117
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main5:
;Aula_20.c,44 :: 		if(!ALERTA){//LOGICA PARA O BOTAO
	BTFSC      RB7_bit+0, 7
	GOTO       L_main12
;Aula_20.c,45 :: 		UART1_Write_Text("ALERTA!!!!!");
	MOVLW      ?lstr2_Aula_20+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula_20.c,46 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_20.c,47 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula_20.c,48 :: 		}
L_main12:
;Aula_20.c,49 :: 		}
	GOTO       L_main1
;Aula_20.c,51 :: 		}
	GOTO       $+0
; end of _main
