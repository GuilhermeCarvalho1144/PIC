//CURSO DE PIC
//PROGRAMA 9 JOGO DOS LEDS  PIC16F628A
//GUILHERME CARVALHO

//CONSTANTES

#define S1 RA0_bit
#define S2 RA1_bit
#define LED1 RA2_bit
#define LED2 RA3_bit

//VARIAVEIS

int num;

//PROGRAMA PRINCIPAL

void main() {
     CMCON = 0x07; //DESABILITA OS COMPORADORES
     TRISA = 0x03; //0x03 = 0b0000011 DEFINE RA0 E RA1 COMO ENTRADAS DIGITAIS
     PORTA = 0x03; //0x03 = 0b0000011 DEFINE RA0 E RB0 PARA NIVEL ALTO (RESISTORES DE PULL DOWN)
     
     while(1){
              num = rand();
              LED1 = num;
              LED2 = ~LED1;
              while(LED1){
                          if(S1==0)LED1 = 0;
                          delay_ms(100);
              }
              while(LED2){
                          if(S2==0)LED2 = 0;
                          delay_ms(100);
              }
              delay_ms(500);
     }
}