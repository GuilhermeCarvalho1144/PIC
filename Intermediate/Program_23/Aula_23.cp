#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 23/Aula_23.c"









int count = 0;
#line 15 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 23/Aula_23.c"
 void interrupt(){
 if(T0IF_bit){
 count++;
 TMR0 = 0x06;
 T0IF_bit = 0x00;
 }
 }


void main() {

 OPTION_REG = 0x81;

 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 T0IE_bit = 0x01;

 TMR0 = 0x06;



 TRISB.RB4 = 0x00;
 PORTB = 0x00;


 while(1){
 if(count == 500){
  RB4_bit  = ~ RB4_bit ;
 count = 0;
 }
 }
}
