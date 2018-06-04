//CURDO DE PIC
//PROGRAMA 18...ESSE PROGRMA FOI DESENVOLVIDO PARA QUE OS VARIOS TIPOS DE CLOCK
//DO PIC SEJAM TESTADOS
//1 -> CRISTAL OSCILADOR EXTERNO
//2 -> CRYSTAL OSCILADOR INTERNO
//3 -> CIRCIUITO RC
//4 -> CI OSCILADOR EXTERNO (TIMER 555)
// *******IMPORTANTE**************
//VER DATASHEET PARA CONFIGURACAO ADEQUADA DOS FUSES
//MAIS INFORMACOES NO CANAL WRKITS
//LINK : https://www.youtube.com/watch?v=aB2v1YVRpFE&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh&index=18
//GUILHERME CARVALHO

//CONSTANTES
#define OUTPUT RB7_bit

//MAIN PROGRAM
void main() {
     //CONFIGURACOES
     CMCON = 0x07;
     TRISB7_bit = 0x00;
     //INICIANDO AS VARIAVEIS
     OUTPUT = 0x00;
     //LOOP PRINCIPAL
     while(1){
              OUTPUT = 0x01;
              delay_ms(100);
              OUTPUT = 0x00;
              delay_ms(100);
     }
}