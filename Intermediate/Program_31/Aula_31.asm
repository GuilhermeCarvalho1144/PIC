
_main:

;Aula_31.c,20 :: 		void main() {
;Aula_31.c,22 :: 		CMCON = 0x07;                                   //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_31.c,23 :: 		TRISB = 0x1E;                                   //DEFINE DE RB1 -> RB4 COMO ENTRADAS DIGITAIS...RESTANTE SÃO SAIDAS
	MOVLW      30
	MOVWF      TRISB+0
;Aula_31.c,24 :: 		TRISC = 0x00;                                   //DEFINE TODO O POTC COMO SAIDA DIGITAL
	CLRF       TRISC+0
;Aula_31.c,25 :: 		PORTB = 0x1E;                                   //INICIALIZA DOS PINOS RB1 -> RB4 EM NIVEL ALTO...RESITORES DE PULL UP
	MOVLW      30
	MOVWF      PORTB+0
;Aula_31.c,26 :: 		PORTC = 0x00;                                   //INICIALIZA O PORTC EM NIVEL BAIXO
	CLRF       PORTC+0
;Aula_31.c,28 :: 		PWM1_Init(5000);                                //INICIA O PWM 1 (CCP1)
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Aula_31.c,29 :: 		PWM2_Init(5000);                                //INICIA O PWM 2 (CCP2)
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Aula_31.c,30 :: 		duty1 = 255/2;                                  //DEFINE O DUTY CICLE PARA 50% (127)
	MOVLW      127
	MOVWF      _duty1+0
;Aula_31.c,31 :: 		duty2 = 255/2;                                  //DEFINE O DUTY CICLE PARA 50% (127)
	MOVLW      127
	MOVWF      _duty2+0
;Aula_31.c,32 :: 		PWM1_Set_Duty(duty1);                           //CHAMA A FUNÇÃO QUE APLICA O DUTY CICLE NO PWM 1 (CCP1)
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Aula_31.c,33 :: 		PWM2_Set_Duty(duty2);                           //CHAMA A FUNÇÃO QUE APLICA O DUTY CICLE NO PWM 2 (CPP2)
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Aula_31.c,34 :: 		PWM1_Start();                                   //PWM COMEÇA A SER GERADO NA PORTA CCP1
	CALL       _PWM1_Start+0
;Aula_31.c,35 :: 		PWM2_Start();                                   //PWM COMEÇA A SER GERADO NA PORTA CCP2
	CALL       _PWM2_Start+0
;Aula_31.c,36 :: 		while(1){
L_main0:
;Aula_31.c,37 :: 		if(!S1){                               //SE S1 FOR PRECIONADO
	BTFSC      RB1_bit+0, 1
	GOTO       L_main2
;Aula_31.c,38 :: 		delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
	MOVLW      208
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula_31.c,39 :: 		duty1++;                       //INCREMNETA O DUTY CICLE
	INCF       _duty1+0, 1
;Aula_31.c,40 :: 		PWM1_Set_Duty(duty1);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM1 (CCP1)
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Aula_31.c,41 :: 		}
L_main2:
;Aula_31.c,42 :: 		if(!S2){                               //SE S2 FOR PRECIONADO
	BTFSC      RB2_bit+0, 2
	GOTO       L_main4
;Aula_31.c,43 :: 		delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
	MOVLW      208
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Aula_31.c,44 :: 		duty1--;                       //DECREMNETA O DUTY CICLE
	DECF       _duty1+0, 1
;Aula_31.c,45 :: 		PWM1_Set_Duty(duty1);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM1 (CCP1)
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Aula_31.c,46 :: 		}
L_main4:
;Aula_31.c,47 :: 		if(!S3){                               //SE S3 FOR PRECIONADO
	BTFSC      RB3_bit+0, 3
	GOTO       L_main6
;Aula_31.c,48 :: 		delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
	MOVLW      208
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Aula_31.c,49 :: 		duty2++;                       //INCREMNETA O DUTY CICLE
	INCF       _duty2+0, 1
;Aula_31.c,50 :: 		PWM2_Set_Duty(duty2);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM2 (CCP2)
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Aula_31.c,51 :: 		}
L_main6:
;Aula_31.c,52 :: 		if(!S4){                               //SE S4 FOR PRECIONADO
	BTFSC      RB4_bit+0, 4
	GOTO       L_main8
;Aula_31.c,53 :: 		delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
	MOVLW      208
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Aula_31.c,54 :: 		duty2--;                       //DECREMNETA O DUTY CICLE
	DECF       _duty2+0, 1
;Aula_31.c,55 :: 		PWM2_Set_Duty(duty2);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM2 (CCP2)
	MOVF       _duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Aula_31.c,56 :: 		}
L_main8:
;Aula_31.c,57 :: 		}
	GOTO       L_main0
;Aula_31.c,58 :: 		}
	GOTO       $+0
; end of _main
