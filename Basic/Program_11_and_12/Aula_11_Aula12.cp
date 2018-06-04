#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 11 e Aula 12/Aula_11_Aula12.c"
#line 12 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 11 e Aula 12/Aula_11_Aula12.c"
int measure = 0x01;

void main() {

 ANSEL = 0x01;
 ADCON0 = 0x01;
 CMCON = 0x07;


 TRISIO = 0x01;
 GPIO =0x00;

 while(1){
 measure = ADC_Read(0);
 if(measure > 0){
  GPIO.F1  = 0;
  GPIO.F2  = 0;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 }
 if(measure > 204){
  GPIO.F1  = 1;
  GPIO.F2  = 0;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 }
 if(measure > 410){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 }
 if(measure > 613){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 1;
  GPIO.F5  = 0;
 }
 if(measure > 817){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 1;
  GPIO.F5  = 1;
 }
 delay_ms(100);
 }




}
