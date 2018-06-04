// CURSO DE PIC
// PROGRAMA 13 DISPLAY DE 7 SEGMENTOS COM A PIC16F628A
// GUILHERME CARVALHO

void main() {
     //VARIAVEIS
     unsigned char cont = 0x00; //CONTADOR INICIA NO 0
     unsigned char numcod[] = {0x3F , 0x06 , 0x5B , 0x4F , 0x66 , 0x6D , 0x7D , 0x07 , 0x7F , 0x67}; //VETOR DE NUMROS CODIFICADOS NO DISPLAY DE 7 SEG
     //CONFIGURANDO
     CMCON = 0x07; //DESABILITANDO OS COMPARADORES
     TRISB = 0x00; //CONFIGURANDO O PORTB COMO SAIDA DIGITAL
     PORTB = 0x00; //INICIANDO O PORTB COM NIVEL BAIXO (CURRENT SOURCING)
     
     while(1){
              PORTB = numcod[cont]; //PORTB TERA O VALOR DO VETOR NA POSICAO DETERMINADA SO CONTADOR
              cont++;  //INCREMENTO DO CONTADOR
              if(cont == 10) cont = 0x00; //RESETA O CONTADOR
              delay_ms(500);
     }
     
     
}