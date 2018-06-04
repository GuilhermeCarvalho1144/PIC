#line 1 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 26/Aula_26.c"
#line 15 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 26/Aula_26.c"
int counter = 0x00;
unsigned char valor;
unsigned char end1 = 0x01;
unsigned armazena;
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
void leEEPROM();


void main() {

 CMCON = 0x07;
 TRISA.RA0 = 0x00;
 TRISA.RA1 = 0x00;
 TRISB = 0x00;
 PORTA = 0b01100;
 PORTB = 0x00;

 leEEPROM();

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
#line 66 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 26/Aula_26.c"
void update(){
 if(! RA3_bit ){
 counter++;
 delay_ms(100);
 if(counter > 0x09) counter = 0x00;
 }
}
#line 80 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 26/Aula_26.c"
void gravarEEPROM(){
 unsigned char aux1, aux2;
 aux1 = EEPROM_Read(end1);
 if(aux1 == 0xFF){
 EEPROM_Write(0x00, end1);
 delay_ms(10);
 }
 armazena = EEPROM_Read(0x00);
 delay_ms(10);
 aux2 = armazena;
 EEPROM_Write(armazena, counter);
 delay_ms(10);
 aux2++;
 if(aux2 > 0x80) aux2=0x00;
 EEPROM_Write(0x00,aux2);
 delay_ms(10);
  RA0_bit  = 0x01;
 delay_ms(500);
  RA0_bit  = 0x00;
}
#line 105 "D:/Desktop/Computarias/PIC/Curso de PIC/Intermediário/Aula 26/Aula_26.c"
void leEEPROM(){
 unsigned char partida;
 partida = EEPROM_Read(0x00);
 counter = EEPROM_Read(0x00+(partida-1));
}
