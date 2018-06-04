#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 25/Aula_25.c"
#line 13 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 25/Aula_25.c"
int counter = 0x00;
unsigned char valor;
unsigned char segmento[] = {
 0x3F,
 0x06,
 0x5B,
 0x4F,
 0x66,
 0x6D,
 0x7D,
 0x07,
 0x7F,
 0x67
 };


void update();
void gravarEEPROM();


void main() {

 CMCON = 0x07;
 TRISA.RA0 = 0x00;
 TRISA.RA1 = 0x00;
 TRISB = 0x00;
 PORTA = 0b01100;
 PORTB = 0x00;

 counter = EEPROM_Read(0x00);

 while(1){
 update();
 if(! RA2_bit ){
 gravarEEPROM();
 }
 valor = segmento[counter];
 PORTB = valor;
 delay_ms(150);
 }
}
#line 59 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 25/Aula_25.c"
void update(){
 if(! RA3_bit ){
 counter++;
 delay_ms(100);
 if(counter > 0x09) counter = 0x00;
 }
}
#line 70 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 25/Aula_25.c"
void gravarEEPROM(){
 EEPROM_Write(0x00, counter);
 delay_ms(10);
  RA0_bit  = 0x01;
 delay_ms(500);
  RA0_bit  = 0x00;
}
