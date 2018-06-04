
_main:

;Aula_10.c,20 :: 		void main() {
;Aula_10.c,21 :: 		CMCON = 0x007; //DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_10.c,22 :: 		TRISA = 0x03; //0X003 = 0B0000011 DEFINE RA0 E RA1 COMO ENTRADA DIGITAIS....DEMAIS COMO SAIDAS DIGITAIS
	MOVLW      3
	MOVWF      TRISA+0
;Aula_10.c,23 :: 		TRISB = 0x00; //DEFINE TODOS OS PINOS DO PORTB COMO SAIDAS DIGITAIS
	CLRF       TRISB+0
;Aula_10.c,24 :: 		PORTA = 0x03; //0X003 = 0B0000011 DEFINE RA0 E RA1 EM NIVEL ALTO...RESISTORES DE PULL DOWMN
	MOVLW      3
	MOVWF      PORTA+0
;Aula_10.c,25 :: 		PORTB = 0x00; //DEFINE O PORTB B COM NIVEL BAIXO
	CLRF       PORTB+0
;Aula_10.c,27 :: 		while(1){     //RODA SENTIDO HORARIO
L_main0:
;Aula_10.c,28 :: 		if(S1 == 0x00 && S2 == 0x01){
	BTFSC      RA0_bit+0, 0
	GOTO       L_main4
	BTFSS      RA1_bit+0, 1
	GOTO       L_main4
L__main21:
;Aula_10.c,30 :: 		}
	GOTO       L_main5
L_main4:
;Aula_10.c,31 :: 		else if(S2 == 0x00 && S1 == 0x01){    //RODA SENTIDO ANTI HORARIO
	BTFSC      RA1_bit+0, 1
	GOTO       L_main8
	BTFSS      RA0_bit+0, 0
	GOTO       L_main8
L__main20:
;Aula_10.c,32 :: 		servo_anti_horario();
	CALL       _servo_anti_horario+0
;Aula_10.c,33 :: 		}
	GOTO       L_main9
L_main8:
;Aula_10.c,34 :: 		else if (S2 == 0x00 && S1 == 0x00) {
	BTFSC      RA1_bit+0, 1
	GOTO       L_main12
	BTFSC      RA0_bit+0, 0
	GOTO       L_main12
L__main19:
;Aula_10.c,36 :: 		}
L_main12:
L_main9:
L_main5:
;Aula_10.c,37 :: 		}
	GOTO       L_main0
;Aula_10.c,39 :: 		}
	GOTO       $+0
; end of _main

_servo_horario:

;Aula_10.c,41 :: 		void servo_horario(){
;Aula_10.c,42 :: 		LED1 = 0x01;
	BSF        RA2_bit+0, 2
;Aula_10.c,43 :: 		LED2= 0x00 ;
	BCF        RA3_bit+0, 3
;Aula_10.c,44 :: 		LED3 = 0x00;
	BCF        RA4_bit+0, 4
;Aula_10.c,45 :: 		servo = 0x00;
	BCF        RB0_bit+0, 0
;Aula_10.c,46 :: 		delay_us(17700);
	MOVLW      23
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_servo_horario13:
	DECFSZ     R13+0, 1
	GOTO       L_servo_horario13
	DECFSZ     R12+0, 1
	GOTO       L_servo_horario13
	NOP
	NOP
;Aula_10.c,47 :: 		servo = 0x01;
	BSF        RB0_bit+0, 0
;Aula_10.c,48 :: 		delay_us(2300);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_servo_horario14:
	DECFSZ     R13+0, 1
	GOTO       L_servo_horario14
	DECFSZ     R12+0, 1
	GOTO       L_servo_horario14
	NOP
	NOP
;Aula_10.c,49 :: 		}
	RETURN
; end of _servo_horario

_servo_anti_horario:

;Aula_10.c,51 :: 		void servo_anti_horario(){
;Aula_10.c,52 :: 		LED1 = 0x00;
	BCF        RA2_bit+0, 2
;Aula_10.c,53 :: 		LED2= 0x01 ;
	BSF        RA3_bit+0, 3
;Aula_10.c,54 :: 		LED3 = 0x00;
	BCF        RA4_bit+0, 4
;Aula_10.c,55 :: 		servo = 0x00;
	BCF        RB0_bit+0, 0
;Aula_10.c,56 :: 		delay_us(19200);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_servo_anti_horario15:
	DECFSZ     R13+0, 1
	GOTO       L_servo_anti_horario15
	DECFSZ     R12+0, 1
	GOTO       L_servo_anti_horario15
	NOP
;Aula_10.c,57 :: 		servo = 0x01;
	BSF        RB0_bit+0, 0
;Aula_10.c,58 :: 		delay_us(800);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      8
	MOVWF      R13+0
L_servo_anti_horario16:
	DECFSZ     R13+0, 1
	GOTO       L_servo_anti_horario16
	DECFSZ     R12+0, 1
	GOTO       L_servo_anti_horario16
	NOP
;Aula_10.c,59 :: 		}
	RETURN
; end of _servo_anti_horario

_servo_centro:

;Aula_10.c,61 :: 		void servo_centro(){
;Aula_10.c,62 :: 		LED1 = 0x00;
	BCF        RA2_bit+0, 2
;Aula_10.c,63 :: 		LED2= 0x00 ;
	BCF        RA3_bit+0, 3
;Aula_10.c,64 :: 		LED3 = 0x01;
	BSF        RA4_bit+0, 4
;Aula_10.c,65 :: 		servo = 0x00;
	BCF        RB0_bit+0, 0
;Aula_10.c,66 :: 		delay_us(18500);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servo_centro17:
	DECFSZ     R13+0, 1
	GOTO       L_servo_centro17
	DECFSZ     R12+0, 1
	GOTO       L_servo_centro17
;Aula_10.c,67 :: 		servo = 0x01;
	BSF        RB0_bit+0, 0
;Aula_10.c,68 :: 		delay_us(1500);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_servo_centro18:
	DECFSZ     R13+0, 1
	GOTO       L_servo_centro18
	DECFSZ     R12+0, 1
	GOTO       L_servo_centro18
	NOP
	NOP
;Aula_10.c,69 :: 		}
	RETURN
; end of _servo_centro
