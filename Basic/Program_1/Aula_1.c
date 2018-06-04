//CURSO DE PIC
//PROGRAMA 1 BLINCK COM A PIC16F84A
//GUILHERME CARVALHO

void main() {
          //RB 76543210
     TRISB = 0b00000000;   //INICIANDO O PORTB COMO SAIDA DIGITA
     PORTB = 0b00000000;   //INICIANDO OS VALORES DO PORTB
     
     while(1){
                 RB1_bit = 1;    //DEFINDO RB1 EM NIVEL ALTO
                 delay_ms(1000);
                 RB1_bit = 0;    //DEFININDO RB1 EM NIVEL BAIXO
                 delay_ms(1000);
     }
}