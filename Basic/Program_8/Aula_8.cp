#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 8/Aula_8.c"
#line 14 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 8/Aula_8.c"
void main() {
 CMCON = 0x07;
 TRISA = 0X03;
 PORTA = 0x03;

 while(1){
 if( RA0_bit  == 0){
 while(1){
  RA2_bit  = 1;
  RA3_bit  = 0;
 delay_ms(200);
  RA2_bit  = 0;
  RA3_bit  = 1;
 delay_ms(200);
 }
 }
 if( RA1_bit  == 0){
 while(1){
  RA2_bit  = 1;
  RA3_bit  = 1;
 delay_ms(200);
  RA2_bit  = 0;
  RA3_bit  = 0;
 delay_ms(200);
 }
 }
 }

}
