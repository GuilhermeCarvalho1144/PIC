#line 1 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Aula 21/Aula_21.c"










char uart_rd;
long int valorAD = 0;
char txt[7];

void Celsius(long AD);
void Fahrenheit(long AD);

void main() {

 CMCON = 0x07;
 ADCON0 = 0x01;
 ADCON1 = 0x0E;

 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("START");
 UART1_Write(10);
 UART1_Write(13);

 TRISB = 0x03;
 PORTB = 0x00;

 while(1){

 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 if( RB0_bit  == 1 &&  RB1_bit  ==0){
 valorAD = ADC_Read(0);
 Celsius(valorAD);
 }
 if( RB0_bit  == 0 &&  RB1_bit  ==1){
 valorAD = ADC_Read(0);
 Fahrenheit(valorAD);
 }
 else{
 UART1_Write_Text("AGUARDANDO");
 UART1_Write(10);
 UART1_Write(13);
 Delay_ms(150);
 }

 }

}
#line 67 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Aula 21/Aula_21.c"
void Celsius(long AD){
 long valor;
 valor = AD*500/1023;
 IntToStr(valor , txt);
 UART1_Write_Text(txt);
 UART1_Write_Text(" CELSIUS");
 UART1_Write(10);
 UART1_Write(13);
 Delay_ms(150);
}
#line 85 "C:/Users/guilh/Desktop/Desktop/Computarias/PIC/Curso de PIC/Aula 21/Aula_21.c"
void Fahrenheit(long AD){
 long valor;
 valor = AD*500/1023;
 valor = (valor*1.8)+32;
 IntToStr(valor , txt);
 UART1_Write_Text(txt);
 UART1_Write_Text(" FAHRENHEIT");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(150);
}
