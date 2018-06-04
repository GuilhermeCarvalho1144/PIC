#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 16/Aula_16.c"
#line 13 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 16/Aula_16.c"
int cent, dez, uni = 0;
int cont = 0;


int Display (int num);
void ChangeCounter();


void main() {

 CMCON = 0x07;
 TRISA = 0x03;
 TRISB = 0X00;
  RA2_bit  = 0;
  RA3_bit  = 0;


 while(1){

 ChangeCounter();

 cent = (cont/100) - ((cont%100)/100);
 PORTB = Display(cent);
  RB7_bit  = 0x01;
 delay_ms(5);
  RB7_bit  = 0x00;

 dez = cont%100;
 dez = (dez/10) - ((cont%10)/10);
 PORTB = Display(dez);
  RA2_bit  = 0x01;
 delay_ms(5);
  RA2_bit  = 0x00;

 uni = cont%10;
 PORTB = Display(uni);
  RA3_bit  = 0x01;
 delay_ms(5);
  RA3_bit  = 0x00;

 }

}
#line 63 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 16/Aula_16.c"
int Display(int num){
 int parametro;
 int SegCod[] = {0x3F , 0x06 , 0x5B , 0x4F, 0x66 , 0x6D , 0x7D , 0x07 , 0x7F , 0x67};
 parametro = SegCod[num];
 return(parametro);
}
#line 72 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 16/Aula_16.c"
void ChangeCounter(){
 if( RA0_bit  == 1){
 cont++;
 delay_ms(180);
 if(cont >= 999) cont = 999;
 }
 if( RA1_bit  == 1){
 cont--;
 delay_ms(180);
 if(cont <= 0) cont = 0;
 }

}
