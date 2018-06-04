#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 24/Aula_24.c"







int count = 0x00;

void interrupt(){
 if(T0IF_bit){
 count++;
 TMR0 = 0x06;
 if(count == 500){
 RB4_bit = ~RB4_bit;
 count = 0x00;
 }
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
 TRISB.RB5 = 0x00;
 RB4_bit = 0x00;
 RB5_bit = 0x00;

 while(1){
 RB5_bit = 0x01;
 delay_ms(500);
 RB5_bit = 0x00;
 delay_ms(500);
 }
}
