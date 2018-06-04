#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC16F84A/Aula 3/Aula_3.c"




void main() {
 CMCON = 7;
 ANSEL = 0;

 TRISIO0_bit = 0;
 TRISIO1_bit = 0;

 GPIO = 0;

 while(1){
 GPIO.F0 = 1;
 GPIO.F1 = 0;
 delay_ms(200);
 GPIO.F0 = 0;
 GPIO.F1 = 1;
 delay_ms(200);
 }

}
