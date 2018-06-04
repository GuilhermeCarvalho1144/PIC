#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/Curso de PIC/Aula 14/Aula_14.c"





void bitsmenos(char num);
void bitsmais(char num);


char contuni = 0x00, contdez = 0x00;


void main() {

 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;

 while(1){
 contuni++;
 bitsmenos(contuni);
 bitsmais(contdez);
 if(contuni == 10){
 contdez++;
 contuni = 0;
 bitsmenos(contuni);
 bitsmais(contdez);
 if(contdez == 10){
 contdez = 0;
 bitsmais(contdez);
 }

 }
 delay_ms(300);
 }

}



void bitsmenos(char num){
 switch(num){
 case 0:
 RB0_bit = 0x00;
 RB1_bit = 0x00;
 RB2_bit = 0x00;
 RB3_bit = 0x00;
 break;
 case 1:
 RB0_bit = 0x01;
 RB1_bit = 0x00;
 RB2_bit = 0x00;
 RB3_bit = 0x00;
 break;
 case 2:
 RB0_bit = 0x00;
 RB1_bit = 0x01;
 RB2_bit = 0x00;
 RB3_bit = 0x00;
 break;
 case 3:
 RB0_bit = 0x01;
 RB1_bit = 0x01;
 RB2_bit = 0x00;
 RB3_bit = 0x00;
 break;
 case 4:
 RB0_bit = 0x00;
 RB1_bit = 0x00;
 RB2_bit = 0x01;
 RB3_bit = 0x00;
 break;
 case 5:
 RB0_bit = 0x01;
 RB1_bit = 0x00;
 RB2_bit = 0x01;
 RB3_bit = 0x00;
 break;
 case 6:
 RB0_bit = 0x00;
 RB1_bit = 0x01;
 RB2_bit = 0x01;
 RB3_bit = 0x00;
 break;
 case 7:
 RB0_bit = 0x01;
 RB1_bit = 0x01;
 RB2_bit = 0x01;
 RB3_bit = 0x00;
 break;
 case 8:
 RB0_bit = 0x00;
 RB1_bit = 0x00;
 RB2_bit = 0x00;
 RB3_bit = 0x01;
 break;
 case 9:
 RB0_bit = 0x01;
 RB1_bit = 0x00;
 RB2_bit = 0x00;
 RB3_bit = 0x01;
 break;
 }
}

void bitsmais(char num){
 switch(num){
 case 0:
 RB4_bit = 0x00;
 RB5_bit = 0x00;
 RB6_bit = 0x00;
 RB7_bit = 0x00;
 break;
 case 1:
 RB4_bit = 0x01;
 RB5_bit = 0x00;
 RB6_bit = 0x00;
 RB7_bit = 0x00;
 break;
 case 2:
 RB4_bit = 0x00;
 RB5_bit = 0x01;
 RB6_bit = 0x00;
 RB7_bit = 0x00;
 break;
 case 3:
 RB4_bit = 0x01;
 RB5_bit = 0x01;
 RB6_bit = 0x00;
 RB7_bit = 0x00;
 break;
 case 4:
 RB4_bit = 0x00;
 RB5_bit = 0x00;
 RB6_bit = 0x01;
 RB7_bit = 0x00;
 break;
 case 5:
 RB4_bit = 0x01;
 RB5_bit = 0x00;
 RB6_bit = 0x01;
 RB7_bit = 0x00;
 break;
 case 6:
 RB4_bit = 0x00;
 RB5_bit = 0x01;
 RB6_bit = 0x01;
 RB7_bit = 0x00;
 break;
 case 7:
 RB4_bit = 0x01;
 RB5_bit = 0x01;
 RB6_bit = 0x01;
 RB7_bit = 0x00;
 break;
 case 8:
 RB4_bit = 0x00;
 RB5_bit = 0x00;
 RB6_bit = 0x00;
 RB7_bit = 0x01;
 break;
 case 9:
 RB4_bit = 0x01;
 RB5_bit = 0x00;
 RB6_bit = 0x00;
 RB7_bit = 0x01;
 break;
 }
}
