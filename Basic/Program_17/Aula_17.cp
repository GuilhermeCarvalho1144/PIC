#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 17/Aula_17.c"
#line 12 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 17/Aula_17.c"
void main() {

 CMCON = 0x07;
 TRISA0_bit = 0x01;
 TRISB0_bit = 0x00;
 PORTA = 0x00;
 PORTB = 0x00;

 while(1){
 if(RA0_bit == 1){
 RB0_bit = 0x01;
 delay_ms(500);
 RB0_bit = 0x00;
 delay_ms(500);
 }
 }

}
