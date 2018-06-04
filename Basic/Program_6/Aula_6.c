//CURSO DE PIC
//PROGRAMA 6 COM A PIC12F675
//GUILHERME CARVALHO

//DEFININDOS OS PINOS
#define S1 GPIO.F0
#define S2 GPIO.F1
#define LED1 GPIO.F4
#define LED2 GPIO.F5

void main() {
     ANSEL = 0;      //DESABILITA AS ENTRADAS ANALOGICAS
     CMCON = 7;      //DESABILITA OS COMPARADORES
     TRISIO0_bit = 1; TRISIO1_bit = 1;   //DEFININDO BITS 0 E 1 COMO ENTRAS DIGITAIS
     TRISIO4_bit = 0; TRISIO5_bit = 0;   //DEFININDO BITS 4 E 5 COMO SAIDAS DIGITAIS

     S1= 1; S2 = 1;  //INICIALIZANDO AS ENTRADAS DIGITAIS (RESISTOR DE PULL UP)
     LED1 = 0; LED2 = 0;              //INICIALIZANDO AS SAIDAS DIGITAIS (CURRENT SOURCING)
     
     while(1){
              if(S1==0){
                        LED1 = ~LED1;             //INVERTE O ESTADO DA SAIDA LED1
                        delay_ms(300);
              }
              if(S2==0){
                        LED2 = ~LED2;             //INVERTE O ESTADO DE SAIDA LED2
                        delay_ms(300);
              }
     }
     

}