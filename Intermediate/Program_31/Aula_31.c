//CURSO DE PIC
//PROGRAMA 31...ESSE CODIGO FOI DESENVOLVIDO PARA IMPLEMENTAR O PWM COM TIMER 2 COM O PIC16F877A UTILIZANDO AS FUNÇÕES
//RESERVADAS DO COMPILADOR MIKROc FOR PIC...VER O HELP PARA MAIS INFORMAÇÕES
//MAIS INFORMÇÕES NO LINK : https://www.youtube.com/watch?v=M62v8336040&list=PLZ8dBTV2_5HQ-LrS9r1dP30h8n9sh04gh&index=31
//GUILHERME CARVALHO PEREIRA
//INICIO

//MAPEAMENTO DE HARDWARE
#define S1 RB1_bit
#define S2 RB2_bit
#define S3 RB3_bit
#define S4 RB4_bit

//VARIAVEIS
unsigned short duty1, duty2;                         //VARIAVEIS PARA CONTROLAR O DUTY CICLE DOS PWM'S...UNSIGNED SHORT
                                                     //É UM TIPO DE VARIAVEL INTERIA Q POSSUI 8 BITS E SO É ATRIBUIDO A
                                                     //A ELA VALORES POSITIVOS

//FUNÇÃO MAIN
void main() {
     //CONFIGURANDO OS REGISTRADORES
     CMCON = 0x07;                                   //DESABILITA OS COMPARADORES
     TRISB = 0x1E;                                   //DEFINE DE RB1 -> RB4 COMO ENTRADAS DIGITAIS...RESTANTE SÃO SAIDAS
     TRISC = 0x00;                                   //DEFINE TODO O POTC COMO SAIDA DIGITAL
     PORTB = 0x1E;                                   //INICIALIZA DOS PINOS RB1 -> RB4 EM NIVEL ALTO...RESITORES DE PULL UP
     PORTC = 0x00;                                   //INICIALIZA O PORTC EM NIVEL BAIXO
     //NÃO É NECESSARIO CONFIGURAMOS OS REGISTRADORES DO TIMER 2 POIS AS FUNÇÕES DO MIKROC JA OS CONFIGURAM
     PWM1_Init(5000);                                //INICIA O PWM 1 (CCP1)
     PWM2_Init(5000);                                //INICIA O PWM 2 (CCP2)
     duty1 = 255/2;                                  //DEFINE O DUTY CICLE PARA 50% (127)
     duty2 = 255/2;                                  //DEFINE O DUTY CICLE PARA 50% (127)
     PWM1_Set_Duty(duty1);                           //CHAMA A FUNÇÃO QUE APLICA O DUTY CICLE NO PWM 1 (CCP1)
     PWM2_Set_Duty(duty2);                           //CHAMA A FUNÇÃO QUE APLICA O DUTY CICLE NO PWM 2 (CPP2)
     PWM1_Start();                                   //PWM COMEÇA A SER GERADO NA PORTA CCP1
     PWM2_Start();                                   //PWM COMEÇA A SER GERADO NA PORTA CCP2
     while(1){
              if(!S1){                               //SE S1 FOR PRECIONADO
                      delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
                      duty1++;                       //INCREMNETA O DUTY CICLE
                      PWM1_Set_Duty(duty1);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM1 (CCP1)
                                    }
              if(!S2){                               //SE S2 FOR PRECIONADO
                      delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
                      duty1--;                       //DECREMNETA O DUTY CICLE
                      PWM1_Set_Duty(duty1);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM1 (CCP1)
              }
              if(!S3){                               //SE S3 FOR PRECIONADO
                      delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
                      duty2++;                       //INCREMNETA O DUTY CICLE
                      PWM2_Set_Duty(duty2);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM2 (CCP2)
              }
              if(!S4){                               //SE S4 FOR PRECIONADO
                      delay_ms(40);                  //DELAY PARA ACOMADAÇÃO DO CONTATO
                      duty2--;                       //DECREMNETA O DUTY CICLE
                      PWM2_Set_Duty(duty2);          //CHAMA A FUNÇÃO QUE APLICA O NOVO DUTY CILE NO PWM2 (CCP2)
              }
     }
}

//FIM