#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 18/Aula_18.c"
#line 18 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 18/Aula_18.c"
void main() {

 CMCON = 0x07;
 TRISB7_bit = 0x00;

  RB7_bit  = 0x00;

 while(1){
  RB7_bit  = 0x01;
 delay_ms(100);
  RB7_bit  = 0x00;
 delay_ms(100);
 }
}
