//CURSO DE PIC
//CONTADOR INCREMENTAL DE 0 A 999 COM DISPLAYS MULTIPLEXADOS NO PIC16F628A
//GUILHERME CARVALHO

//CONSTATNTES
#define DIG1 RB7_bit
#define DIG2 RA2_bit
#define DIG3 RA3_bit
#define MAIS RA0_bit
#define MENOS RA1_bit

//VARIAVEIS
int cent, dez, uni = 0;//CENTENA....DEZENA.....UNIDADE
int cont = 0;//CONTADOR

//DECLARACAO DAS FUNCOES
int Display (int num);
void ChangeCounter();

//INICIO DO MAIN
void main() {
     //CONFIGURACOES
     CMCON = 0x07; //DESABILITA OS COMPARADORES
     TRISA = 0x03; //CONFIGURA RA0E RA1 COMO ENTRADA DIGITAIS E OS DEMAIS COMO SAIDA
     TRISB = 0X00; //CONFIGURA O PORT B COMO SAIDA DIGITAL
     DIG2 = 0;     //INICIALIZA O DIGITO DAS DEZENAS
     DIG3 = 0;     //INICIALIZA O DIGITO DAS CENTENAS
     
     //INICIO DO LOOP PRINCIPAL
     while(1){
              //ATUALIZACAO DO VALOR DE CONT
              ChangeCounter();
              //PARA AS CENTENAS
              cent = (cont/100) - ((cont%100)/100);   //EX -> 253/100=2.53......253%100=53......53/100=0.53......2.53-0.53 = 2
              PORTB = Display(cent);                  //ATUALIZA O VALOR DA CENTENA NO DISPLAY
              DIG1 = 0x01;                            //HABILTA O DISPLAY DAS CENTENAS
              delay_ms(5);                            //DELAY PARA A MULTIPLEXACAO
              DIG1 = 0x00;                            //DESABILITA O DISPLAY DAS CENTENAS
              //PARA AS DEZENAS
              dez = cont%100;                         //TIRA A CENTENA DO NUMERO
              dez = (dez/10) - ((cont%10)/10);        //EX -> 53/10=5.3......53%10=3......3/10=0.3......5.3-0.3 = 5
              PORTB = Display(dez);                   //ATUALIZA O VALOR DA DEZENA NO DISPLAY
              DIG2 = 0x01;                            //HABILITA O DISPLAY DAS DEZENAS
              delay_ms(5);                            //DELAY DA MULTIPLEXACAO
              DIG2 = 0x00;                            //DESABILITA O DISPLAY DAS DEZENAS
              //PARA AS UNIDADES
              uni = cont%10;                          // EX -> 253%10=3
              PORTB = Display(uni);                   //ATUALIZA O VALOR DA UNIDADE NO DISLAY
              DIG3 = 0x01;                            //HABILITA O DISPLAY DAS UNIDADES
              delay_ms(5);                            //DELAY PARA A MULTIPLEXACAO
              DIG3 = 0x00;                            //DESABILITA O DISPLAY DAS UNIDADES
              
     }
     //FIM DO LOOP PRINCIPAL
}
//FIM DO MAIN

//IMPLEMENTACAO DAS FUNCOES

/*ESSA FUNCAO FAZ A CONVERSAO ENTRE O NUMERO QUE DEVE SER MOSTRADO NO DISPLAY E OS LEDS QUE DEVEM SER ACIONADOS PAA QUE ESSE NUMERO SEJA REPRESENTADO.
A FUNCAO RECEBE COMO PARAMETRO O NUMERO INTERIO E RETORNA O O CODIGO BINARIO QUE DEVE SER ATRIBUIDO AO PORTB PARA QUE ESSE ALGARISMO SEJA REPRESENTADO EM UM DISPLAY DE 7
SEGMENTOS. A FUNCAO CONTEM UM VEOTR QUE POSSUI O CODIGO EM HEXADECIMAL PARA FAZER ESSA CONVERSAO*/
int Display(int num){
    int parametro;
    int SegCod[] = {0x3F , 0x06 , 0x5B , 0x4F, 0x66 , 0x6D , 0x7D , 0x07 , 0x7F , 0x67};          //VETOR DE CONERSAO
    parametro = SegCod[num];
    return(parametro);                                                                          //RETORNO DA FUNCAO
}
/*ESSA FUNCAO ATUALIZA A CONTAGEM VERIFICANDO O ESTADO DOS BOTOES MAIS E MENOS. QUANDO O BOTAO MAIS EH ATIVADO O CONTADOR EH INCREMENTADO DE UMA UNIDADE. QUANDO O BOTAO
MENOS EH ATIVADO O CONTADOR DECRESSE DE UMA UNIDADE. O LIMITE DA CONTAGEM EH DE 0 A 999 POIS SO POSSUIMOS 3 DISPLAYS DE 7 SEGMENTOS.
*/
void ChangeCounter(){
     if(MAIS == 1){  //BUTAO MAIS ATIVO
             cont++; //INCREMENTO DE CONTADOR
             delay_ms(180);//DELAY PARA EVITAR DUPLO CLICK
             if(cont >= 999) cont = 999; //LIMITE SUPERIOR DA CONTAGEM
     }
     if(MENOS == 1){ //BOTAO MENOS ATIVO
              cont--; //DECREMENTO DO CONTADOR
              delay_ms(180); //DELAY PARA EVITAR DUPLO CLICK
              if(cont <= 0) cont = 0; //LIMITE INFERIOR DA CONTAGEM
     }
     
}