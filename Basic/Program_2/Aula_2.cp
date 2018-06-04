#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC16F84A/Aula 2/Aula_2.c"




void main() {

 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){
 PORTB++;
 delay_ms(500);
 }
}
