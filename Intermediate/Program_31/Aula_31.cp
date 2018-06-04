#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 31/Aula_31.c"
#line 15 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 31/Aula_31.c"
unsigned short duty1, duty2;




void main() {

 CMCON = 0x07;
 TRISB = 0x1E;
 TRISC = 0x00;
 PORTB = 0x1E;
 PORTC = 0x00;

 PWM1_Init(5000);
 PWM2_Init(5000);
 duty1 = 255/2;
 duty2 = 255/2;
 PWM1_Set_Duty(duty1);
 PWM2_Set_Duty(duty2);
 PWM1_Start();
 PWM2_Start();
 while(1){
 if(! RB1_bit ){
 delay_ms(40);
 duty1++;
 PWM1_Set_Duty(duty1);
 }
 if(! RB2_bit ){
 delay_ms(40);
 duty1--;
 PWM1_Set_Duty(duty1);
 }
 if(! RB3_bit ){
 delay_ms(40);
 duty2++;
 PWM2_Set_Duty(duty2);
 }
 if(! RB4_bit ){
 delay_ms(40);
 duty2--;
 PWM2_Set_Duty(duty2);
 }
 }
}
