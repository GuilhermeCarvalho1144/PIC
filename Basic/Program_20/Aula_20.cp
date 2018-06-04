#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Aula 20/Aula_20.c"
#line 13 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Aula 20/Aula_20.c"
char uart_rd;


void main() {

 CMCON = 0x07;
 ADCON0 = 0x00;
 ADCON1 = 0x06;

 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("START");
 UART1_Write(10);
 UART1_Write(13);

 TRISB = 0x80;
 PORTB = 0x00;

 while(1){
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 switch(uart_rd){
 case 'r':  RB0_bit  = 0x01; break;
 case 't':  RB0_bit  = 0x00; break;
 case 'g':  RB1_bit  = 0x01; break;
 case 'h':  RB1_bit  = 0x00; break;
 case 'y':  RB2_bit  = 0x01; break;
 case 'u':  RB2_bit  = 0x00; break;
 }
 if(! RB7_bit ){
 UART1_Write_Text("ALERTA!!!!!");
 UART1_Write(10);
 UART1_Write(13);
 }
 }

}
