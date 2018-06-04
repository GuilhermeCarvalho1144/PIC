//CURSO DE PIC
//PROGRAMA 24...ESSE PROGRAMA FOI DESENVOLVIDO PARA QUE COMPARACEMOS POLLING E INTERRUP��ES
//POLLING S�O QUANDO UTLIZAMOS DELAYS EM NOSSO CODIGO...N�O S�O METODOS MUITO ACONCELHADOS
//INTERRUP��ES S�O AS OPERA��ES DE MAIS ALTA IMPOTANCIA EM UM MICROCONTROLADOR...ELAS TEM PRIORIDADE SOBRE QUALQUER OUTRA OPERA��O
//MAIS INFORMA��ES NO LINK: https://www.youtube.com/watch?v=L_c0s2OpNtM&index=24&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh
//GUILHERME CARVALHO
//VARI�VEIS
int count = 0x00;
//FUN��O DE INTERRUP��O
void interrupt(){
     if(T0IF_bit){
              count++;
              TMR0 = 0x06;
              if(count == 500){
                       RB4_bit = ~RB4_bit;
                       count = 0x00;
              }
              T0IF_bit = 0x00;
     }
}
//FUN��O MAIN
void main() {
   //CONFIGURANDO OS REGISTRADORES DA INTERRUP��O
   OPTION_REG = 0x81;                            //BIT MAIS SIGINIFICATIVO DESABILITA OS RESISTORES DE PULL UP (RBPU)
                                                 //BIT MENOS SIGNIFICATIVO DEFINE O PRESCALER EM 1:4 (PSA)
   GIE_bit  = 0x01;                              //HABILITA INTERRUP��ES GLOBAIS (GIE)
   PEIE_bit = 0x01;                              //HABILITA AS INTERRUP��ES POR PERIFERICO (PEIE)
   T0IE_bit = 0x01;                              //HABILITA AS INTERRUP��ES PELO TIMMER0 (T0IE)

   TMR0 = 0x06;                                  //INICIANDO TIMMER0
   //CONFIGURANDO E INICIANDO O PORTB
   TRISB.RB4 = 0x00;                             //CONFIGURANDO O REGISTRADOR RB4 COMO SAIDA DIGITAL
   TRISB.RB5 = 0x00;                             //CONFIGURANDO O REGISTRADOR RB3 COMO SAIDA DIGITAL
   RB4_bit = 0x00;
   RB5_bit = 0x00;                                 //INICIALIZA O RB5 EM LOW
   //LOOP PRINCIPAL
   while(1){
            RB5_bit = 0x01;
            delay_ms(500);
            RB5_bit = 0x00;
            delay_ms(500);
   }
}
//FIM DO MAIN