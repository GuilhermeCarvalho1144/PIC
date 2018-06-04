#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 29/Aula_29.c"
#line 10 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 29/Aula_29.c"
void interrupt(){
 if(TMR2IF_bit){
 TMR2IF_bit = 0x00;
 TMR2 = 0x7D;
 PORTB = ~PORTB;
 }
}


void main() {

 CMCON = 0x07;

 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 TMR2IE_bit = 0x01;
 T2CON = 0b01111111;



 TMR2 = 0xC3;


 TRISB = 0x00;
 PORTB = 0x00;

}
