#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 5/Aula_5.c"




void main() {
 ANSEL = 0;
 CMCON = 7;

 TRISIO0_bit = 0;
 TRISIO1_bit = 0;

 while(1){
 GPIO.F0 = 1;
 delay_ms(10);
 GPIO.F0 = 0;
 delay_ms(10);

 GPIO.F1 = 1;
 delay_ms(1);
 GPIO.F1 = 0;
 delay_ms(1);

 }
#line 27 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 5/Aula_5.c"
}
