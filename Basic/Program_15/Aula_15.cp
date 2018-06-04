#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 15/Aula_15.c"








void main() {

 CMCON = 0x07;
 TRISA = 0x00;
 PORTA = 0x00;

 while(1){
  RA0_bit  = 0x01;
  RA1_bit  = 0x00;
 delay_ms(100/50);
  RA0_bit  = 0x00;
  RA1_bit  = 0x01;
 delay_ms(100/50);
 }

}
