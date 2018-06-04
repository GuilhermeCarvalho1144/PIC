//CURSO DE PIC
//PROGRAMA 28...IMPLEMENTANDO A TECLADO MATRICIAL FAZENDO A VARREDURA PELO ESTOURO DO TIMER 0 COM O PIC 16F628A
//MAIS INFORMÇÕES NO LINK : https://www.youtube.com/watch?v=ZKJ4wM3690I&index=28&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh
//GUILHERME CARVALHO PEREIRA
//INICIO

//MAPEAMENTO DE HARDWARE
#define S1 RA0_bit
#define S2 RA1_bit
#define LED1 RA2_bit
#define LED2 RA3_bit
#define col1 RB1_bit        //COLUNA 1 DO TECLADO MATRICIAL
#define col2 RB2_bit        //COLUNA 2 DO TECLADO MATRICIAL
#define col3 RB3_bit        //COLUNA 3 DO TECLADO MATRICIAL
#define rowA RB4_bit        //LINHA 1 DO TECLADO MATRICIAL
#define rowB RB5_bit        //LINHA 2 DO TECLADO MATRICIAL
#define rowC RB6_bit        //LINHA 3 DO TECLADO MATRICIAL
#define rowD RB7_bit        //LINHA 4 DO TECLADO MATRICIAL

//DECLARAÇÃO DAS FUNÇÕES
void pulsar(char n);

//VARIAVEIS
char controle = 0x01;                  //VARIVEL DE CONTROLE PARA DEFINIR QUE LINHA SERA TESTADA
char led;                              //VARIAVEL QUE DIZ QUAL LED VAI BLINKAR

/*ESSA FUNÇÃO JÁ É IMPLEMENTADA NO MIKROC...ELA AJUDA O PROGRAMADOR A TRATAR DE INTERRUPÇÕES (VEJA O HELP)....
ESSA FUNÇÃO É DO TIPO VOID, PORTANTO NAO POSSUI RETONO...TAMBÉM NÃO POSSUI NENHUM TIPO DE PARAMETRO...
*/
void interrupt(){//A VERREDURA DOS BOTÕES OCORRE APROXIMADAMENTE A CADA 20ms
     if(T0IF_bit){//TESTA SE HOUVE INTERRUPÇÃO POR ESTOURO DO TIMER 0
                  T0IF_bit = 0x00;    //LIMPA A FLAG DE INTERRUPÇÃO DO TIMER 0...***IMPORTANTE***
                  TMR0 = 0x6C;        //DEFINE O VALOR DE TIMER 0
                  if(col1 && controle == 0x01){//TESTA A COLUNA 1
                          controle = 0x02;            //SETA O CONTROLE PARA QUE A COLUNA 2 SEJA TESTADA
                          col1 = 0x00;                //DEFINE A COLUNA 1 COMO 0...RESISTORES DE PULL-UP
                          col2 = 0x01;
                          col3 = 0x01;
                          if(!rowA) pulsar(1);
                          else if(!rowB)pulsar(4);
                          else if(!rowC)pulsar(7);
                          else if(!rowD)pulsar(11);
                  }
                  else if(col2 && controle == 0x02){
                          controle  = 0x03;           //SETA O CONTROLE PARA QUE A COLUNA 3 SEJA TESTADA
                          col1 = 0x01;
                          col2 = 0x00;                //DEFINE A COLUNA 2 COMO 0...RESISTORES DE PULL-UP
                          col3 = 0x01;
                          if(!rowA) pulsar(2);
                          else if(!rowB)pulsar(5);
                          else if(!rowC)pulsar(8);
                          else if(!rowD)pulsar(10);
                  }
                  else if(col3 && controle == 0x03){
                          controle = 0x01;            //SETA O CONTROLE PARA QUE A COLUNA 1 SEJA TESTADA
                          col1 = 0x01;
                          col2 = 0x01;
                          col3 = 0x00;                //DEFINE A COLUNA 3 COMO 0...RESISTORES DE PULL-UP
                          if(!rowA) pulsar(3);
                          else if(!rowB)pulsar(6);
                          else if(!rowC)pulsar(9);
                          else if(!rowD)pulsar(12);
                  }
     }
}

//FUNÇÃO MAIN
void main() {
     //CONFIGURANDO OD REGISTRADORES
     CMCON = 0x07;                  //DESABILITA OS COMPARADORES
     //CONFIGURANDO OS REGISTRADORES DE INTERRUPÇÃO
     OPTION_REG = 0x86;             //DESABILITA OS RESISTORES DE PULL-UP
                                    //DEFINE O PRESCALER DE 1:128...
                                    //O TIMER 0 ESTOURA A CADA 128 CICLOS DE NAQUINA (1us)
     GIE_bit = 0x01;                //HABILITA AS INTERRUPÇÕES GLOBAIS
     PEIE_bit = 0x01;               //HABILITA AS INTERUPÇÕES POR PERIFERIOS
     T0IE_bit = 0x01;               //HABILITA A INTERRUPÇÃO POR ESTOURO DO TIMER 0
     TMR0 = 0x6C;                   //INICIA O TIMER 0...VALOR DEFINIDO PARA UMA VARREDURA DE 20ms
     //CONFIGURANDO OS PORTs
     TRISA = 0x03;                  //DEFINE RA0 E RA1 COMO ENTRADA DIGITAIS
     TRISB = 0xF0;                  //DEFINE NIBBLE MAIS SIGNIFICATIVO COMO ENTRADA DIGITAL
     PORTA = 0x03;                  //INICIA O PORTA
     PORTB = 0xFF;                  //INICIA O PORTB
     while(1){//NEM SEMPRE FUNCIONA POIS A INTERRUPÇÃO TOMA MTO TEMPO
              if(!S1) led = 0x00;   //BLINKA LED1
              if(!S2) led = 0x01;   //BLINKA LED2
     }
}

//IMPLEMENTAÇÃO DAS FUNÇÕES
/*ESSA É UMA FUNÇÃO QUE IMPLEMENTA UM BLINK NO LED1... A QUANTIDA DE VEZES QUE O LED BLINKA DEPENDE
DO PARAMETRO "n"...FOI DEFENIDO QUE O LED IRA BLINKAR UM NUMERO CORRESPONDE AO BOTÃO ACIONADO, SENDO
O "0" = 10 BLINKS...."*" = 11 BLINKS..."#" = 12 BLINKS
*/
void pulsar (char n){
    char i;                                //VARIAVEL DE LOCAL USADA NO FOR
    for(i = 0 ; i < n ; i++){              //LOOP FOR
             if(!led){                     //BLINKAR LED1
                      LED1 = 0x01;                  //DEFINE LED1 COM LIVEL ALTO
                      delay_ms(200);                //DELAY
                      LED1 = 0x00;                  //DEFINE O LED1 COM NIVEL BAIXO
                      delay_ms(200);                //DELAY
             }
             else if(led){                          //BLINKAR LED2
                      LED2 = 0x01;                  //DEFINE LED2 COM LIVEL ALTO
                      delay_ms(200);                //DELAY
                      LED2 = 0x00;                  //DEFINE O LED2 COM NIVEL BAIXO
                      delay_ms(200);                //DELAY
             }
    }
}
//FIM