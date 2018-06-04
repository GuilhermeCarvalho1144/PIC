#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 9/Aula_9.c"
#line 14 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 9/Aula_9.c"
int num;



void main() {
 CMCON = 0x07;
 TRISA = 0x03;
 PORTA = 0x03;

 while(1){
 num = rand();
  RA2_bit  = num;
  RA3_bit  = ~ RA2_bit ;
 while( RA2_bit ){
 if( RA0_bit ==0) RA2_bit  = 0;
 delay_ms(100);
 }
 while( RA3_bit ){
 if( RA1_bit ==0) RA3_bit  = 0;
 delay_ms(100);
 }
 delay_ms(500);
 }
}
