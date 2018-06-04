//CURSO DE PIC
//PROGRAMA 7  PIC16F628A
//GUILHERME CARVALHO

//CONSTANTES

#define S1 RA0_bit
#define S2 RA1_bit
#define LED1 RA2_bit
#define LED2 RA3_bit

//PROGRAMA PRINCIPAL

void main() {
     CMCON = 0x07; //DESABILITA OS COMPARADORES
     TRISA = 0X03; // 0x03 = 0b0000011 DEFINE RA0 E RA1 COMO ENTRADAS DIGITAIS E OS DEMAIS COMO SAIDA
     PORTA = 0x03; // 0x03 = 0b0000011 DEFINE RA0 E RB1 COM NOIVEL ALTO E OS DEMAIS COM NIVEL BAIXO
     
     while(1){
              if(S1 == 0){
                    while(1){
                             LED1 = 1;
                             LED2 = 0;
                             delay_ms(200);
                             LED1 = 0;
                             LED2 = 1;
                             delay_ms(200);
                             }
              }
              if(S2 == 0){
                    while(1){
                             LED1 = 1;
                             LED2 = 1;
                             delay_ms(200);
                             LED1 = 0;
                             LED2 = 0;
                             delay_ms(200);
                             }
              }
     }

}