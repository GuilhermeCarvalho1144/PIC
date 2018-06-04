#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 28/Aula_28.c"
#line 21 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 28/Aula_28.c"
void pulsar(char n);


char controle = 0x01;
char led;
#line 30 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 28/Aula_28.c"
void interrupt(){
 if(T0IF_bit){
 T0IF_bit = 0x00;
 TMR0 = 0x6C;
 if( RB1_bit  && controle == 0x01){
 controle = 0x02;
  RB1_bit  = 0x00;
  RB2_bit  = 0x01;
  RB3_bit  = 0x01;
 if(! RB4_bit ) pulsar(1);
 else if(! RB5_bit )pulsar(4);
 else if(! RB6_bit )pulsar(7);
 else if(! RB7_bit )pulsar(11);
 }
 else if( RB2_bit  && controle == 0x02){
 controle = 0x03;
  RB1_bit  = 0x01;
  RB2_bit  = 0x00;
  RB3_bit  = 0x01;
 if(! RB4_bit ) pulsar(2);
 else if(! RB5_bit )pulsar(5);
 else if(! RB6_bit )pulsar(8);
 else if(! RB7_bit )pulsar(10);
 }
 else if( RB3_bit  && controle == 0x03){
 controle = 0x01;
  RB1_bit  = 0x01;
  RB2_bit  = 0x01;
  RB3_bit  = 0x00;
 if(! RB4_bit ) pulsar(3);
 else if(! RB5_bit )pulsar(6);
 else if(! RB6_bit )pulsar(9);
 else if(! RB7_bit )pulsar(12);
 }
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
 TRISB = 0xF0;
 PORTA = 0x03;
 PORTB = 0xFF;
 while(1){
 if(! RA0_bit ) led = 0x00;
 if(! RA1_bit ) led = 0x01;
 }
}
#line 95 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 28/Aula_28.c"
void pulsar (char n){
 char i;
 for(i = 0 ; i < n ; i++){
 if(!led){
  RA2_bit  = 0x01;
 delay_ms(200);
  RA2_bit  = 0x00;
 delay_ms(200);
 }
 else if(led){
  RA3_bit  = 0x01;
 delay_ms(200);
  RA3_bit  = 0x00;
 delay_ms(200);
 }
 }
}
