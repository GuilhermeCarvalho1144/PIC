#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 4/Aula_4.c"




void main() {
 ANSEL = 0;
 CMCON = 7;
 TRISIO0_bit = 1;
 TRISIO1_bit = 0;

 GPIO = 0;
 while(1){

 if(GPIO.F0){
 GPIO.F1 = 1;
 delay_ms(1500);
 Gpio.F1 = 0;
 }
 else{
 GPIO.F0 = 0;
 delay_ms(200);
 }

 }
}
