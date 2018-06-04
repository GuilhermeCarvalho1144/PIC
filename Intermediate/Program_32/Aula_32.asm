
_main:

;Aula_32.c,14 :: 		void main() {
;Aula_32.c,16 :: 		CMCON = 0X07;                          //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_32.c,17 :: 		ADCON0 = 0x01;                         //LIGA OS O MODULO A/D
	MOVLW      1
	MOVWF      ADCON0+0
;Aula_32.c,18 :: 		ADCON1 = 0x0E;                         //DEFINE SOMENTE A PORTA RA0/AN0 COMO ENTRADA ANALOGICA
	MOVLW      14
	MOVWF      ADCON1+0
;Aula_32.c,20 :: 		PWM1_Init(1000);                       //DEFINE O PWM NA PORTA RC2/CPP1 COM UMA FREQUENCIA DE 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Aula_32.c,21 :: 		PWM1_Set_Duty((duty_per*255)/100);     //SET DUTY CILE DO PWM EM 70%...A FUNÇÃO ACEITA O VALOR EM BITS ESSE É O MOTIVO DA CONTA
	MOVF       _duty_per+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Aula_32.c,22 :: 		PWM1_Start();                          //INICIA O PWM NA PORTA RC2/CCP1 COM AS CARACTERISTICAS DESCRITAS NAS FUNÇÕES ACIMA
	CALL       _PWM1_Start+0
;Aula_32.c,24 :: 		while(1){
L_main0:
;Aula_32.c,25 :: 		feedback = ADC_Read(0);                //LE OS VALORES ANALOGICOS EM RA0/AN0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _feedback+0
	MOVF       R0+1, 0
	MOVWF      _feedback+1
;Aula_32.c,26 :: 		PWM1_Set_Duty((duty_per*255)/100);     //SET DUTY CILE DO PWM EM 70%...A FUNÇÃO ACEITA O VALOR EM BITS ESSE É O MOTIVO DA CONTA
	MOVF       _duty_per+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Aula_32.c,27 :: 		if(feedback < 2){
	MOVLW      0
	SUBWF      _feedback+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      2
	SUBWF      _feedback+0, 0
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;Aula_32.c,28 :: 		duty_per++;                //INCREMNETA O DUTY CICLE DO MOTOR
	INCF       _duty_per+0, 1
;Aula_32.c,29 :: 		if(duty_per > 90) duty_per = 90;//IMPEDE QUE O RESGITRADOR
	MOVF       _duty_per+0, 0
	SUBLW      90
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVLW      90
	MOVWF      _duty_per+0
L_main3:
;Aula_32.c,30 :: 		}
	GOTO       L_main4
L_main2:
;Aula_32.c,31 :: 		else duty_per = 70;                    //DUTY CICLE PADRAO
	MOVLW      70
	MOVWF      _duty_per+0
L_main4:
;Aula_32.c,32 :: 		}
	GOTO       L_main0
;Aula_32.c,33 :: 		}
	GOTO       $+0
; end of _main
