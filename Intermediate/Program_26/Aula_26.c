//CURSO DE PIC
//PROGRAMA 26...ESSE PROGRAMA É UMA OTIMIZAÇÃO DO PROGRAMA 25
//TEM COMO FUNÇÃO UM MELHOR GERENCIAMENTO DA EEPROM DO PIC16F628A
//MAIS INFORMÇÕES NO LINK : https://www.youtube.com/watch?v=h5DSg5gVhuE&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh&index=26
//GUILHERME CARVALHO PEREIRA
//INICIO

//MAPEAMENTO DE HARDWARE
#define LED1 RA0_bit
#define LED2 RA1_bit
#define S1 RA2_bit
#define S2 RA3_bit

//VARIÁVEIS............****UNSIGNED VARIAVEIS SO PODEM SER POSISTIVAS****
int counter = 0x00;
unsigned char valor;
unsigned char end1 = 0x01;
unsigned armazena;                  //QUANDO DECLARAMOS VARIÁVEIS DO TIPO UNSIGNED INT NÃO PRECISAMOS COLOCAR O INT
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

//DECLARAÇÃO DAS FUNÇÕES
void update();
void gravarEEPROM();
void leEEPROM();

//FUNÇÃO MAIN
void main() {
     //CONFIGURANDO OS REGISTRADORES
     CMCON = 0x07;                  //DESABILITAS OS COMPARADORES
     TRISA.RA0 = 0x00;              //DEFINE RA0 E RA1 COMO ENTRADAS
     TRISA.RA1 = 0x00;
     TRISB = 0x00;                  //DEFINE O PORTB COMO SAIDA
     PORTA = 0b01100;               //INICIA O PORTA EM LOW
     PORTB = 0x00;                  //INICIA O PORTB EM LOW
     //LENDO DA EEPROM
     leEEPROM();                    //LE O VALOR DA EEPROM NO ENDEREÇO CORRETO E ATRIBUI A COUNTER (VALOR QUE É MOSTRADO NO DISPLAY)
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

//IMPLEMENTAÇÃO DAS FUNÇÕES

/*ESSA FUNÇÃO TEM COMO UNICO TRABALHO INCRMENTAR O VALOR DE COUNTER
O VALOR DE COUNTER DEVE SER INCREMENTADO TODAS AS VEZES QUE S2 FOR APERTAD(RESITOR DE PULL-UP)
ESSA FUNÇÃO É DO TIPO VOID PORTANTO NÃO POSSUI PARAMETROS NEM RETORNO
*/
void update(){
     if(!S2){
            counter++;
            delay_ms(100);
            if(counter > 0x09) counter = 0x00;
     }
}

/*ESSA FUNÇÃO TEM COMO OBJETIVO GRAVAR O VALOR MOSTRADO NO DISPLAY NA EEPROM DO PIC16F628A
PARA UM MELHOR APROVEITAMENTO DA MEMOMERIA EEPROM, TENDO EM VISTA QUE ESSA SE DETERIORA COM O TEMPO
A FUNÇÃO FAZ UM "RODIZIO" DE ENDEREÇOS ONDE O DADO É GRAVADO. ESSE "RODIZIO" VAI DO ENDEREÇO 0x01 -> 0x80
O ENDEREÇO DA EEPROM 0x00 É RESPONSÁVEL POR CONTER O ENDEREÇO ATUAL ONDE O DADO ESTÁ GRAVADO
NO FIM DA FUNÇÃO LED1 IRA EFETUAR UM BLINK PARA INDICAR QUE A ESCRITA FOI FEITA COM SUCESSO
*/
void gravarEEPROM(){
     unsigned char aux1, aux2;                 //DECLARANDO VARIAAVEIS LOCAIS DE AUXILIO
     aux1 = EEPROM_Read(end1);                //LEITURA DA EEPROM
     if(aux1 == 0xFF){                        //VERIFICA SE A EERPOM ESTÁ LIMPA....QUANDO A EEPROM ESTA LIMPA TODOS OS ENDEREÇOS SÃO 0xFF
             EEPROM_Write(0x00, end1);        //ESCREVE O VALOR DE END1 NO ENDEREÇO 0x00
             delay_ms(10);                    //TEMPO DE ESCRITA
     }
     armazena = EEPROM_Read(0x00);            //ARMAZENAMOS O VALOR DE STORE
     delay_ms(10);                            //DELAY PARA QUE A OPERAÇÃO SEJA CONCLUIDA
     aux2 = armazena;                         //AUX2 RECEBE O VALOR QUE ESTA ARMAZENADO NO ENDEREÇO 0x00 DA EEPROM
     EEPROM_Write(armazena, counter);         //GRAVA NO ENDEREÇO CONRESPONDE A VARIÁVEL ARMAZENA O VALOR ATUAL DE COUNTER(VALOR QUE ESTÁ NO DISPLAY)
     delay_ms(10);                            //TEMPO PARA A ESCRITA
     aux2++;                                  //INCREMNETA AUX2
     if(aux2 > 0x80) aux2=0x00;               //TESTA SE CEHGAMOS AO FIM DA EEPROM..SE SIM VOLTAMOS AO COMEÇO
     EEPROM_Write(0x00,aux2);                 //O ENDEREÇO 0x00 DA EEPROM IRA CONTER O ENDEREÇO ONDE O ULTIMO VALOR SALVO NA EEPROM ESTÁ
     delay_ms(10);                            //DELAY PARA A ESCRITA
     LED1 = 0x01;                             //LED1 RECEBE NIVEL ALTO PARA INDICAR QUE A ESCRITA FOI FEITA
     delay_ms(500);                           //DELAY
     LED1 = 0x00;                             //LED1 RECEBE NIVEL BAIXO
}

/*ESSA FUNÇÃO TEM COMO OBJETIVO LER O ENDEREÇO DE MEMORIA ONDE O ULTIMO DADO GRAVADO ESTA CONTIDO
A VARIAVEL PARTIDA RECEBE O ENDEREÇO DA EEPROM ONDE O DADOD ESTA GUARDADO POREM DEVEMOS DESCONTAR O 0
QUE TAMBÉM ENTRA NA CONTAGEM
*/
void leEEPROM(){
     unsigned char partida;
     partida = EEPROM_Read(0x00);
     counter = EEPROM_Read(0x00+(partida-1));
}
//FIM