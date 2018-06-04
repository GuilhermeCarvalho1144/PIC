//CURSO DE PIC
//PROGRAMA 25...ESSE PROGRAMA FOI DESENVOLVIDO PARA SALVAR DADOS NA EEPROM COM O PIC16F628A
//MAIS INFORMA��ES NO LINK: https://www.youtube.com/watch?v=0rlgIs1EUe0&index=25&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh
//GUILHERME CARVALHO
//INICIO

//MAPEAMENTO DE HARDWARE
#define LED1 RA0_bit
#define LED2 RA1_bit
#define S1 RA2_bit
#define S2 RA3_bit

//VARI�VEIS............****UNSIGNED VARIAVEIS SO PODEM SER POSISTIVAS****
int counter = 0x00;
unsigned char valor;
unsigned char segmento[] = {
                           0x3F,//DISPLAY MOSTRA 0
                           0x06,//DISPLAY MOSTRA 1
                           0x5B,//DISPLAY MOSTRA 2
                           0x4F,//DISPLAY MOSTRA 3
                           0x66,//DISPLAY MOSTRA 4
                           0x6D,//DISPLAY MOSTRA 5
                           0x7D,//DISPLAY MOSTRA 6
                           0x07,//DISPLAY MOSTRA 7
                           0x7F,//DISPLAY MOSTRA 8
                           0x67 //DISPLAY MOSTRA 9
                           };

//DECLARA��O DAS FUN��ES
void update();
void gravarEEPROM();

//FUN��O MAIN
void main() {
     //CONFIGURANDO OS REGISTRADORES
     CMCON = 0x07;                  //DESABILITAS OS COMPARADORES
     TRISA.RA0 = 0x00;                  //DEFINE RA0 E RA1 COMO ENTRADAS
     TRISA.RA1 = 0x00;
     TRISB = 0x00;                  //DEFINE O PORTB COMO SAIDA
     PORTA = 0b01100;                  //INICIA O PORTA EM LOW
     PORTB = 0x00;                  //INICIA O PORTB EM LOW
     //LENDO DA EEPROM
     counter = EEPROM_Read(0x00);             //LE O VALOR DA EEPROM NO ENDERE�O 0x00 E ATRIBUI A COUNTER (VALOR QUE � MOSTRADO NO DISPLAY)
     //LOOP PRINCIPAL
     while(1){
              update();                       //ATUALIZA O VALOR DE COUNTER
              if(!S1){                        //CONDI��O PARA GRAVAR A EEPROM
                       gravarEEPROM();        //GRAVA NA EEPROM
              }
              valor = segmento[counter];      //VALOR RECEBE O HEXADECIANL CORESPONDE AO N�MERO DE CONTER NO DISPLAY DE 7-SEGMENTOS
              PORTB = valor;                  //ATRIBUI O HEXADECIMAL AO PORTB ONDE EST� LIGADO O ISPLAY DE 7-SEGMENTOS
              delay_ms(150);                  //DELAY PARA ESTABILIZA��O
     }
}

//IMPLEMENTA��O DAS FUN��ES

/*ESSA FUN��O TEM COMO UNICO TRABALHO INCRMENTAR O VALOR DE COUNTER
O VALOR DE COUNTER DEVE SER INCREMENTADO TODAS AS VEZES QUE S2 FOR APERTAD(RESITOR DE PULL-UP)
ESSA FUN��O � DO TIPO VOID PORTANTO N�O POSSUI PARAMETROS NEM RETORNO
*/
void update(){
     if(!S2){
            counter++;
            delay_ms(100);
            if(counter > 0x09) counter = 0x00;
     }
}

/*ESSA FUN��O GRAVA O VALOR DE COUNTER NA EEPROM DO PIC 16F628A
ELA DEVE SER CHAMADA TODAS AS VEZES QUE O BOT�O S1 FOR ACIONADO (PULL-UP)
ESSA FUN��O � DO TIPO VOID PORTANTO NAO POSSUI RETORNO, ENTRETANTO O LED1 INDICA QUE A GRAVA��O FOI EXECUTADO
SEGUNDO O DATASHEET DO PIC16F628A S�O NECESS�RIOS PELO MENOS 5us PARA QUE A GRAVA��O SEJA COMPELTADA COM SUCESSO
ESSA FUN��O AGUARDA 10us PARA O VALOR DE COUNTER SER GRAVADO NA EEPROM
*/
void gravarEEPROM(){
     EEPROM_Write(0x00, counter);        //GRAVA O VALOR DE COUNTER NA EEPROM NO ENDERE�O 0x00(EERPOM_WRITE ESTA NO HELP)
     delay_ms(10);                       //TEMPO PARA A GRAVA��O SER CONCLUIDA
     LED1 = 0x01;                        //LED1 RECEBE NIVEL AUTO PARA INDICAR QUE A GRAVA��O FOI CONCLUIDA
     delay_ms(500);                      //DELAY
     LED1 = 0x00;                        //LED1 RECEBE NIVEL BAIXO
}
//FIM