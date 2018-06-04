#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 32/Aula_32.c"









unsigned short duty_per = 70;
unsigned feedback;


void main() {

 CMCON = 0X07;
 ADCON0 = 0x01;
 ADCON1 = 0x0E;

 PWM1_Init(1000);
 PWM1_Set_Duty((duty_per*255)/100);
 PWM1_Start();

 while(1){
 feedback = ADC_Read(0);
 PWM1_Set_Duty((duty_per*255)/100);
 if(feedback < 2){
 duty_per++;
 if(duty_per > 90) duty_per = 90;
 }
 else duty_per = 70;
 }
}
