//CURSO DE PIC
//PROGRAMA 11 TESTE DA ENTRADA ANALOGICA COM PIC12F675
//GUILHERME CARVALHO

//CONSTANTES
#define LED1 GPIO.F1
#define LED2 GPIO.F2
#define LED3 GPIO.F4
#define LED4 GPIO.F5

//VARIAVEIS
int measure = 0x01; //VARIAVEL ANALOGICA

void main() {
     //CONFIGURANDO
     ANSEL = 0x01; //SELECIONA AN0 COMO ENTRADA ANALOGICA
     ADCON0 = 0x01; //ABILITA OS MODULOS A/D
     CMCON = 0x07; //DESABILITA OS COMPARADORES
     
     //CONFIGURANDO AS PORTAS
     TRISIO = 0x01; //DEFINE GPIO 0 COMO ENTRADA
     GPIO =0x00; //INICIALIZA TODOS OS GPIOS EM NIVEL BAIXO
     
     while(1){      //LOGICA -> 2^10 = 1023 (RESOLUCAO DE AMOSTRAGEM) ... DIVIDIMOS EM 5 INTERVALOS DE 204 OHMS APROXIMADAMENTE ... LEDS LIGAM DE LED1 -> LED4
              measure = ADC_Read(0); //FUNCAO QUE FAZ A LEITURA DA ENTRADA ANALOGICA
              if(measure > 0){    //PRIMEIRO INTERVALO
                         LED1 = 0;
                         LED2 = 0;
                         LED3 = 0;
                         LED4 = 0;
              }
              if(measure > 204){    //SEGUNDO INTERVALO
                         LED1 = 1;
                         LED2 = 0;
                         LED3 = 0;
                         LED4 = 0;
              }
              if(measure > 410){    //TERCEIRO INTERVALO
                         LED1 = 1;
                         LED2 = 1;
                         LED3 = 0;
                         LED4 = 0;
              }
              if(measure > 613){    //QUARTO INTERVALO
                         LED1 = 1;
                         LED2 = 1;
                         LED3 = 1;
                         LED4 = 0;
              }
              if(measure > 817){    //QUINTO INTERVALO
                         LED1 = 1;
                         LED2 = 1;
                         LED3 = 1;
                         LED4 = 1;
              }
              delay_ms(100);
     }
     
     
     

}