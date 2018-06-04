#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 19/Aula_19.c"
#line 14 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 19/Aula_19.c"
void main() {

 CMCON = 0x07;
 TRISA0_bit = 0x01;
 TRISA1_bit = 0x01;
 TRISA2_bit = 0x01;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;

 PORTA = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;

 while(1){
 if(RA0_bit == 1){
  RB0_bit  = 0x01;
 delay_ms(180);
 }
 if( RA1_bit  == 1) RC0_bit  = 0x01;
 if( RA2_bit  == 1) RD0_bit  = 0x01;
 }
}
