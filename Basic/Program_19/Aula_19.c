//CURSO DE PIC
//PROGRAMA 19...ESSE PROGRAMA É UMA INTRODUZAO A PIC16F877A
//GUILHERME CARVALHO

//CONSTANTES
#define S1 RA0_bit
#define S2 RA1_bit
#define S3 RA2_bit
#define LED1 RB0_bit
#define LED2 RC0_bit
#define LED3 RD0_bit


void main() {
     //CONFIGURANDO
     CMCON = 0x07;  //DESABILITA OS COMPARADORES
     ADCON0 = 0x00;//DESABILITA A CONVERÇAÕ A/D
     ADCON1 = 0x06;//TORNA TODAS AS PORTAS DIGITAIS
     TRISA0_bit = 0x01; //RA0, RA1, RA2 SÃO ENTRADAS DIGITAIS
     TRISA1_bit = 0x01;
     TRISA2_bit = 0x01;
     TRISB = 0x00; //DEFINE O PORTB COMO SAIDA DIGITAL
     TRISC = 0x00; //DEFINE O PORTC COMO SAIDA DIGITAL
     TRISD = 0x00; //DEFINE O PORTD COMO SAIDA DIGITAL
     //INICIANDO OS REGISTRADORES
     PORTA = 0x00;
     PORTB = 0x00;
     PORTC = 0x00;
     PORTD = 0x00;
     //LOOP PRINCIPAL
     while(1){
              if(RA0_bit == 1){
                         LED1 = 0x01;//LIGA LED1
                         delay_ms(180);
              }
              if(S2 == 1)LED2 = 0x01;//;IGA LED2
              if(S3 == 1)LED3 = 0x01;//LIGA LED3
     }
}