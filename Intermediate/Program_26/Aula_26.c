//CURSO DE PIC
//PROGRAMA 26...ESSE PROGRAMA � UMA OTIMIZA��O DO PROGRAMA 25
//TEM COMO FUN��O UM MELHOR GERENCIAMENTO DA EEPROM DO PIC16F628A
//MAIS INFORM��ES NO LINK : https://www.youtube.com/watch?v=h5DSg5gVhuE&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh&index=26
//GUILHERME CARVALHO PEREIRA
//INICIO

//MAPEAMENTO DE HARDWARE
#define LED1 RA0_bit
#define LED2 RA1_bit
#define S1 RA2_bit
#define S2 RA3_bit

//VARI�VEIS............****UNSIGNED VARIAVEIS SO PODEM SER POSISTIVAS****
int counter = 0x00;
unsigned char valor;
unsigned char end1 = 0x01;
unsigned armazena;                  //QUANDO DECLARAMOS VARI�VEIS DO TIPO UNSIGNED INT N�O PRECISAMOS COLOCAR O INT
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
void leEEPROM();

//FUN��O MAIN
void main() {
     //CONFIGURANDO OS REGISTRADORES
     CMCON = 0x07;                  //DESABILITAS OS COMPARADORES
     TRISA.RA0 = 0x00;              //DEFINE RA0 E RA1 COMO ENTRADAS
     TRISA.RA1 = 0x00;
     TRISB = 0x00;                  //DEFINE O PORTB COMO SAIDA
     PORTA = 0b01100;               //INICIA O PORTA EM LOW
     PORTB = 0x00;                  //INICIA O PORTB EM LOW
     //LENDO DA EEPROM
     leEEPROM();                    //LE O VALOR DA EEPROM NO ENDERE�O CORRETO E ATRIBUI A COUNTER (VALOR QUE � MOSTRADO NO DISPLAY)
     //LOOP PRINCIPAL
     while(1){
              update();
              if(!S1){
                       gravarEEPROM();
                       }
              valor = segmento[counter];
              PORTB = valor;
              delay_ms(150);
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

/*ESSA FUN��O TEM COMO OBJETIVO GRAVAR O VALOR MOSTRADO NO DISPLAY NA EEPROM DO PIC16F628A
PARA UM MELHOR APROVEITAMENTO DA MEMOMERIA EEPROM, TENDO EM VISTA QUE ESSA SE DETERIORA COM O TEMPO
A FUN��O FAZ UM "RODIZIO" DE ENDERE�OS ONDE O DADO � GRAVADO. ESSE "RODIZIO" VAI DO ENDERE�O 0x01 -> 0x80
O ENDERE�O DA EEPROM 0x00 � RESPONS�VEL POR CONTER O ENDERE�O ATUAL ONDE O DADO EST� GRAVADO
NO FIM DA FUN��O LED1 IRA EFETUAR UM BLINK PARA INDICAR QUE A ESCRITA FOI FEITA COM SUCESSO
*/
void gravarEEPROM(){
     unsigned char aux1, aux2;                 //DECLARANDO VARIAAVEIS LOCAIS DE AUXILIO
     aux1 = EEPROM_Read(end1);                //LEITURA DA EEPROM
     if(aux1 == 0xFF){                        //VERIFICA SE A EERPOM EST� LIMPA....QUANDO A EEPROM ESTA LIMPA TODOS OS ENDERE�OS S�O 0xFF
             EEPROM_Write(0x00, end1);        //ESCREVE O VALOR DE END1 NO ENDERE�O 0x00
             delay_ms(10);                    //TEMPO DE ESCRITA
     }
     armazena = EEPROM_Read(0x00);            //ARMAZENAMOS O VALOR DE STORE
     delay_ms(10);                            //DELAY PARA QUE A OPERA��O SEJA CONCLUIDA
     aux2 = armazena;                         //AUX2 RECEBE O VALOR QUE ESTA ARMAZENADO NO ENDERE�O 0x00 DA EEPROM
     EEPROM_Write(armazena, counter);         //GRAVA NO ENDERE�O CONRESPONDE A VARI�VEL ARMAZENA O VALOR ATUAL DE COUNTER(VALOR QUE EST� NO DISPLAY)
     delay_ms(10);                            //TEMPO PARA A ESCRITA
     aux2++;                                  //INCREMNETA AUX2
     if(aux2 > 0x80) aux2=0x00;               //TESTA SE CEHGAMOS AO FIM DA EEPROM..SE SIM VOLTAMOS AO COME�O
     EEPROM_Write(0x00,aux2);                 //O ENDERE�O 0x00 DA EEPROM IRA CONTER O ENDERE�O ONDE O ULTIMO VALOR SALVO NA EEPROM EST�
     delay_ms(10);                            //DELAY PARA A ESCRITA
     LED1 = 0x01;                             //LED1 RECEBE NIVEL ALTO PARA INDICAR QUE A ESCRITA FOI FEITA
     delay_ms(500);                           //DELAY
     LED1 = 0x00;                             //LED1 RECEBE NIVEL BAIXO
}

/*ESSA FUN��O TEM COMO OBJETIVO LER O ENDERE�O DE MEMORIA ONDE O ULTIMO DADO GRAVADO ESTA CONTIDO
A VARIAVEL PARTIDA RECEBE O ENDERE�O DA EEPROM ONDE O DADOD ESTA GUARDADO POREM DEVEMOS DESCONTAR O 0
QUE TAMB�M ENTRA NA CONTAGEM
*/
void leEEPROM(){
     unsigned char partida;
     partida = EEPROM_Read(0x00);
     counter = EEPROM_Read(0x00+(partida-1));
}
//FIM