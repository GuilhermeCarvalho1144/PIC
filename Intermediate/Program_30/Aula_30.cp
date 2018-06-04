#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 30/Aula_30.c"
#line 14 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 30/Aula_30.c"
void interrupt(){
 if(T0IF_bit){
 T0IF_bit = 0x00;
 TMR0 = 0x6C;
 if(! RA0_bit ) CCPR1L++;
 if(! RA1_bit ) CCPR1L--;
 }
}


void main() {

 CMCON = 0x07;

 OPTION_REG = 0x86;
 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 T0IE_bit = 0x01;
 TMR0 = 0x6C;





 T2CON = 0x06;
 TMR2 = 0xFF;
 CCPR1L = 0x00;


 CCP1CON = 0x0C;

 TRISA = 0x03;
 TRISB = 0x00;
 PORTA = 0x03;
 PORTB = 0x00;

}
