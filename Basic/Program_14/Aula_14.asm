
_main:

;Aula_14.c,13 :: 		void main() {
;Aula_14.c,15 :: 		CMCON = 0x07;//DESABILITA OS COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;Aula_14.c,16 :: 		TRISB = 0x00;//CONFIGURA O PORTB COMO SAIDA DIGITAL
	CLRF       TRISB+0
;Aula_14.c,17 :: 		PORTB = 0x00;//INICIALIZA O PORTB EM NIVEL BAIXO
	CLRF       PORTB+0
;Aula_14.c,19 :: 		while(1){
L_main0:
;Aula_14.c,20 :: 		contuni++;
	INCF       _contuni+0, 1
;Aula_14.c,21 :: 		bitsmenos(contuni);
	MOVF       _contuni+0, 0
	MOVWF      FARG_bitsmenos_num+0
	CALL       _bitsmenos+0
;Aula_14.c,22 :: 		bitsmais(contdez);
	MOVF       _contdez+0, 0
	MOVWF      FARG_bitsmais_num+0
	CALL       _bitsmais+0
;Aula_14.c,23 :: 		if(contuni == 10){
	MOVF       _contuni+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Aula_14.c,24 :: 		contdez++;
	INCF       _contdez+0, 1
;Aula_14.c,25 :: 		contuni = 0;
	CLRF       _contuni+0
;Aula_14.c,26 :: 		bitsmenos(contuni);
	CLRF       FARG_bitsmenos_num+0
	CALL       _bitsmenos+0
;Aula_14.c,27 :: 		bitsmais(contdez);
	MOVF       _contdez+0, 0
	MOVWF      FARG_bitsmais_num+0
	CALL       _bitsmais+0
;Aula_14.c,28 :: 		if(contdez == 10){
	MOVF       _contdez+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Aula_14.c,29 :: 		contdez = 0;
	CLRF       _contdez+0
;Aula_14.c,30 :: 		bitsmais(contdez);
	CLRF       FARG_bitsmais_num+0
	CALL       _bitsmais+0
;Aula_14.c,31 :: 		}
L_main3:
;Aula_14.c,33 :: 		}
L_main2:
;Aula_14.c,34 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;Aula_14.c,35 :: 		}
	GOTO       L_main0
;Aula_14.c,37 :: 		}
	GOTO       $+0
; end of _main

_bitsmenos:

;Aula_14.c,41 :: 		void bitsmenos(char num){
;Aula_14.c,42 :: 		switch(num){
	GOTO       L_bitsmenos5
;Aula_14.c,43 :: 		case 0:
L_bitsmenos7:
;Aula_14.c,44 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_14.c,45 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,46 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,47 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,48 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,49 :: 		case 1:
L_bitsmenos8:
;Aula_14.c,50 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_14.c,51 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,52 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,53 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,54 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,55 :: 		case 2:
L_bitsmenos9:
;Aula_14.c,56 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_14.c,57 :: 		RB1_bit = 0x01;
	BSF        RB1_bit+0, 1
;Aula_14.c,58 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,59 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,60 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,61 :: 		case 3:
L_bitsmenos10:
;Aula_14.c,62 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_14.c,63 :: 		RB1_bit = 0x01;
	BSF        RB1_bit+0, 1
;Aula_14.c,64 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,65 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,66 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,67 :: 		case 4:
L_bitsmenos11:
;Aula_14.c,68 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_14.c,69 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,70 :: 		RB2_bit = 0x01;
	BSF        RB2_bit+0, 2
;Aula_14.c,71 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,72 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,73 :: 		case 5:
L_bitsmenos12:
;Aula_14.c,74 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_14.c,75 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,76 :: 		RB2_bit = 0x01;
	BSF        RB2_bit+0, 2
;Aula_14.c,77 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,78 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,79 :: 		case 6:
L_bitsmenos13:
;Aula_14.c,80 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_14.c,81 :: 		RB1_bit = 0x01;
	BSF        RB1_bit+0, 1
;Aula_14.c,82 :: 		RB2_bit = 0x01;
	BSF        RB2_bit+0, 2
;Aula_14.c,83 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,84 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,85 :: 		case 7:
L_bitsmenos14:
;Aula_14.c,86 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_14.c,87 :: 		RB1_bit = 0x01;
	BSF        RB1_bit+0, 1
;Aula_14.c,88 :: 		RB2_bit = 0x01;
	BSF        RB2_bit+0, 2
;Aula_14.c,89 :: 		RB3_bit = 0x00;
	BCF        RB3_bit+0, 3
;Aula_14.c,90 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,91 :: 		case 8:
L_bitsmenos15:
;Aula_14.c,92 :: 		RB0_bit = 0x00;
	BCF        RB0_bit+0, 0
;Aula_14.c,93 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,94 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,95 :: 		RB3_bit = 0x01;
	BSF        RB3_bit+0, 3
;Aula_14.c,96 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,97 :: 		case 9:
L_bitsmenos16:
;Aula_14.c,98 :: 		RB0_bit = 0x01;
	BSF        RB0_bit+0, 0
;Aula_14.c,99 :: 		RB1_bit = 0x00;
	BCF        RB1_bit+0, 1
;Aula_14.c,100 :: 		RB2_bit = 0x00;
	BCF        RB2_bit+0, 2
;Aula_14.c,101 :: 		RB3_bit = 0x01;
	BSF        RB3_bit+0, 3
;Aula_14.c,102 :: 		break;
	GOTO       L_bitsmenos6
;Aula_14.c,103 :: 		}
L_bitsmenos5:
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos7
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos8
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos9
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos10
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos11
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos12
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos13
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos14
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos15
	MOVF       FARG_bitsmenos_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmenos16
L_bitsmenos6:
;Aula_14.c,104 :: 		}
	RETURN
; end of _bitsmenos

_bitsmais:

;Aula_14.c,106 :: 		void bitsmais(char num){
;Aula_14.c,107 :: 		switch(num){
	GOTO       L_bitsmais17
;Aula_14.c,108 :: 		case 0:
L_bitsmais19:
;Aula_14.c,109 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_14.c,110 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,111 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,112 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,113 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,114 :: 		case 1:
L_bitsmais20:
;Aula_14.c,115 :: 		RB4_bit = 0x01;
	BSF        RB4_bit+0, 4
;Aula_14.c,116 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,117 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,118 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,119 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,120 :: 		case 2:
L_bitsmais21:
;Aula_14.c,121 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_14.c,122 :: 		RB5_bit = 0x01;
	BSF        RB5_bit+0, 5
;Aula_14.c,123 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,124 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,125 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,126 :: 		case 3:
L_bitsmais22:
;Aula_14.c,127 :: 		RB4_bit = 0x01;
	BSF        RB4_bit+0, 4
;Aula_14.c,128 :: 		RB5_bit = 0x01;
	BSF        RB5_bit+0, 5
;Aula_14.c,129 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,130 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,131 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,132 :: 		case 4:
L_bitsmais23:
;Aula_14.c,133 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_14.c,134 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,135 :: 		RB6_bit = 0x01;
	BSF        RB6_bit+0, 6
;Aula_14.c,136 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,137 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,138 :: 		case 5:
L_bitsmais24:
;Aula_14.c,139 :: 		RB4_bit = 0x01;
	BSF        RB4_bit+0, 4
;Aula_14.c,140 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,141 :: 		RB6_bit = 0x01;
	BSF        RB6_bit+0, 6
;Aula_14.c,142 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,143 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,144 :: 		case 6:
L_bitsmais25:
;Aula_14.c,145 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_14.c,146 :: 		RB5_bit = 0x01;
	BSF        RB5_bit+0, 5
;Aula_14.c,147 :: 		RB6_bit = 0x01;
	BSF        RB6_bit+0, 6
;Aula_14.c,148 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,149 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,150 :: 		case 7:
L_bitsmais26:
;Aula_14.c,151 :: 		RB4_bit = 0x01;
	BSF        RB4_bit+0, 4
;Aula_14.c,152 :: 		RB5_bit = 0x01;
	BSF        RB5_bit+0, 5
;Aula_14.c,153 :: 		RB6_bit = 0x01;
	BSF        RB6_bit+0, 6
;Aula_14.c,154 :: 		RB7_bit = 0x00;
	BCF        RB7_bit+0, 7
;Aula_14.c,155 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,156 :: 		case 8:
L_bitsmais27:
;Aula_14.c,157 :: 		RB4_bit = 0x00;
	BCF        RB4_bit+0, 4
;Aula_14.c,158 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,159 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,160 :: 		RB7_bit = 0x01;
	BSF        RB7_bit+0, 7
;Aula_14.c,161 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,162 :: 		case 9:
L_bitsmais28:
;Aula_14.c,163 :: 		RB4_bit = 0x01;
	BSF        RB4_bit+0, 4
;Aula_14.c,164 :: 		RB5_bit = 0x00;
	BCF        RB5_bit+0, 5
;Aula_14.c,165 :: 		RB6_bit = 0x00;
	BCF        RB6_bit+0, 6
;Aula_14.c,166 :: 		RB7_bit = 0x01;
	BSF        RB7_bit+0, 7
;Aula_14.c,167 :: 		break;
	GOTO       L_bitsmais18
;Aula_14.c,168 :: 		}
L_bitsmais17:
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais19
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais20
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais21
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais22
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais23
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais24
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais25
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais26
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais27
	MOVF       FARG_bitsmais_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_bitsmais28
L_bitsmais18:
;Aula_14.c,169 :: 		}
	RETURN
; end of _bitsmais
