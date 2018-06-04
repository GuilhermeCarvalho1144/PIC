//CURSO DE PIC
//PROGRAMA 2 INCREMENTO DO PORTB COM A PIC16F84A
//GUILHERME CARVALHO

void main() {
          //RB 76543210
     TRISB = 0b00000000;   //INICIANDO O PORTB COMO SAIDA DIGITA
     PORTB = 0b00000000;   //INICIANDO OS VALORES DO PORTB
     
     while(1){
              PORTB++;
              delay_ms(500);
     }
}