#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC16F84A/Aula 1/Aula_1.c"




void main() {

 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){
 RB1_bit = 1;
 delay_ms(1000);
 RB1_bit = 0;
 delay_ms(1000);
 }
}
