#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 7/Aula_7.c"




int cont = 0xFF;

void main() {
 CMCON = 0x07;

 TRISB = 0x00;
 PORTB = 0xFF;

 while(1){
 if(cont == 0x00)cont = 0xFF;
 PORTB = cont;
 cont = cont << 1;
 delay_ms(200);
 }


}
