//CURSO DE PIC
//PROGRAMA 17..ESSE EH UM PRORAMA FOI FEITO COM O INTUITO DE SE TESTAR O DEBUDG DO MIKROC E TAMBEM DO ISIS
//VER AULA 17 DO CANAL WRKITS PARA MAIS INFORMACOES
//LINK : https://www.youtube.com/watch?v=SUTRodHKYPs&index=17&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh
//GUILHERME CARVALHO

//CONSTANTES
#define LED RB0_bit;
#define S1 RA0_bit;

//PROGRAMA MAIN
void main() {
     //CONFIGURANDO
     CMCON = 0x07;//DESABILITA OS COMPARADORES
     TRISA0_bit = 0x01;//DEFINE RA0 COMO ENTRADA DIGITAL
     TRISB0_bit = 0x00;//DEFINE RB0 COMO SAIDA DIGITAL
     PORTA = 0x00;
     PORTB = 0x00;
     //LOOP PRINCIPAL
     while(1){
              if(RA0_bit == 1){
                     RB0_bit = 0x01;
                     delay_ms(500);
                     RB0_bit = 0x00;
                     delay_ms(500);
              }
     }

}