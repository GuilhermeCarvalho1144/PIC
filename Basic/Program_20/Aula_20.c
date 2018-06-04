//CURSO DE PIC
//PROGRAMA 20..TESTE DA COMUNICAÇÃO UART (UNIVERSAL ASYNCHRONOUS RECEIVER/TRANSMITTER) COM O PIC16F877A
//MAI9S INFORMAÇÕES NO LINK : https://www.youtube.com/watch?v=9qd1QAmp9zM&index=20&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh
//GUILHERME CARVALHO

//MAPEAMENTO DE HARDWARE
#define RED RB0_bit
#define GREEN RB1_bit
#define YELLOW RB2_bit
#define ALERTA RB7_bit

//VARIAVEIS
char uart_rd;//VARIAVEIS PARA O ENVIO DE DADOS

//FUÇÃO MAIN
void main() {
     //CONFIGURANDO OS REGISTRADORES
     CMCON = 0x07;//DESABILITA OS COMPARADORES
     ADCON0 = 0x00;//DESABILITA O MODULO A/D
     ADCON1 = 0x06;//CONFIGURA AS PORTAS COMO SAIDAS DIGITAIS
     //INICIANDO A COMUNICAÇÃO UART
     UART1_Init(9600);//INICIA A COMUNICAÇÃO EM 9600 BPS
     Delay_ms(100);//DELAY PARA A ESTABILIZAÇÃO
     UART1_Write_Text("START");//MENSAGEM QUE MOSTRA QUE A COMUNICAÇÃO ESTA FUNCIONANDO
     UART1_Write(10);//ESCREVE O ESPAÇO....10 = ESPAÇO NA TABELA ASCII
     UART1_Write(13);//QUEBRA LINHA....13 = QUEBRA LINHA NA TABELA ASCII
     //CONFIGURANDO O PORTB
     TRISB = 0x80;//CONFIGURA RB7 COMO ENTRADA E O RESTANTE COMO SAIDAS DIGITAIS
     PORTB = 0x00;//INICIALIZA O PORTB COM NIVEL BAIXO
     //LOOP PRINCIPAL
     while(1){
               if (UART1_Data_Ready()) {     // If data is received, //********************PARTE TIRADA DO HELP
                                       uart_rd = UART1_Read();     // read the received data,
                                       UART1_Write(uart_rd);       // and send data via UART
               }//**********************PARTE TIRADA DO HELP
              switch(uart_rd){//LOGICA PARA OS LEDS
                                       case 'r': RED = 0x01; break;
                                       case 't': RED = 0x00; break;
                                       case 'g': GREEN = 0x01; break;
                                       case 'h': GREEN = 0x00; break;
                                       case 'y': YELLOW = 0x01; break;
                                       case 'u': YELLOW = 0x00; break;
              }
              if(!ALERTA){//LOGICA PARA O BOTAO
                                       UART1_Write_Text("ALERTA!!!!!");
                                       UART1_Write(10);
                                       UART1_Write(13);
              }
     }

}