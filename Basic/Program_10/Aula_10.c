//CURSO DE PIC
//PROGRAMA 10 SERVO MOTORES NO PIC16F628A
//GUILHERME CARVALHO

//CONSTANTES

#define S1 RA0_bit
#define S2 RA1_bit
#define LED1 RA2_bit
#define LED2 RA3_bit
#define LED3 RA4_bit
#define servo RB0_bit

// FUNCOES

void servo_centro();
void servo_horario();
void servo_anti_horario();

void main() {
     CMCON = 0x007; //DESABILITA OS COMPARADORES
     TRISA = 0x03; //0X003 = 0B0000011 DEFINE RA0 E RA1 COMO ENTRADA DIGITAIS....DEMAIS COMO SAIDAS DIGITAIS
     TRISB = 0x00; //DEFINE TODOS OS PINOS DO PORTB COMO SAIDAS DIGITAIS
     PORTA = 0x03; //0X003 = 0B0000011 DEFINE RA0 E RA1 EM NIVEL ALTO...RESISTORES DE PULL DOWMN
     PORTB = 0x00; //DEFINE O PORTB B COM NIVEL BAIXO
     
     while(1){     //RODA SENTIDO HORARIO
              if(S1 == 0x00 && S2 == 0x01){
                    servo_horario;
              }
              else if(S2 == 0x00 && S1 == 0x01){    //RODA SENTIDO ANTI HORARIO
                   servo_anti_horario();
              }
              else if (S2 == 0x00 && S1 == 0x00) {
              servo_centro;
              }
     }

}

void servo_horario(){
     LED1 = 0x01;
     LED2= 0x00 ;
     LED3 = 0x00;
     servo = 0x00;
     delay_us(17700);
     servo = 0x01;
     delay_us(2300);
}

void servo_anti_horario(){
     LED1 = 0x00;
     LED2= 0x01 ;
     LED3 = 0x00;
     servo = 0x00;
     delay_us(19200);
     servo = 0x01;
     delay_us(800);
}

void servo_centro(){
     LED1 = 0x00;
     LED2= 0x00 ;
     LED3 = 0x01;
     servo = 0x00;
     delay_us(18500);
     servo = 0x01;
     delay_us(1500);
}