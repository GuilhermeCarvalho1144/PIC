#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 13/Aula_13.c"




void main() {

 unsigned char num, cont = 0x00;
 unsigned char numcod[] = {0x3F , 0x06 , 0x5B , 0x4F , 0x66 , 0x6D , 0x7D , 0x07 , 0x7F , 0x67};

 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;

 while(1){
 PORTB = numcod[cont];
 cont++;
 if(cont == 10) cont = 0x00;
 delay_ms(500);
 }


}
