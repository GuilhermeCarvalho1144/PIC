#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 27/Aula_27.c"
#line 17 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 27/Aula_27.c"
void interrupt(){
 if(T0IF_bit){
 T0IF_bit = 0x00;
 TMR0 = 0x6C;
 if(! RA0_bit ) RA3_bit  = 0x01;
 else if(! RA1_bit ) RA3_bit  = 0x00;
 }
}


void main() {

 CMCON = 0x07;

 OPTION_REG = 0x86;


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 T0IE_bit = 0x01;
 TMR0 = 0x6C;

 TRISA = 0x03;
 PORTA = 0x03;

 while(1){
  RA2_bit  = 0x01;
 delay_ms(500);
  RA2_bit  = 0x00;
 delay_ms(500);
 }
}
