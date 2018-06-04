#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 10/Aula_10.c"
#line 16 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 10/Aula_10.c"
void servo_centro();
void servo_horario();
void servo_anti_horario();

void main() {
 CMCON = 0x007;
 TRISA = 0x03;
 TRISB = 0x00;
 PORTA = 0x03;
 PORTB = 0x00;

 while(1){
 if( RA0_bit  == 0x00 &&  RA1_bit  == 0x01){
 servo_horario;
 }
 else if( RA1_bit  == 0x00 &&  RA0_bit  == 0x01){
 servo_anti_horario();
 }
 else if ( RA1_bit  == 0x00 &&  RA0_bit  == 0x00) {
 servo_centro;
 }
 }

}

void servo_horario(){
  RA2_bit  = 0x01;
  RA3_bit = 0x00 ;
  RA4_bit  = 0x00;
  RB0_bit  = 0x00;
 delay_us(17700);
  RB0_bit  = 0x01;
 delay_us(2300);
}

void servo_anti_horario(){
  RA2_bit  = 0x00;
  RA3_bit = 0x01 ;
  RA4_bit  = 0x00;
  RB0_bit  = 0x00;
 delay_us(19200);
  RB0_bit  = 0x01;
 delay_us(800);
}

void servo_centro(){
  RA2_bit  = 0x00;
  RA3_bit = 0x00 ;
  RA4_bit  = 0x01;
  RB0_bit  = 0x00;
 delay_us(18500);
  RB0_bit  = 0x01;
 delay_us(1500);
}
