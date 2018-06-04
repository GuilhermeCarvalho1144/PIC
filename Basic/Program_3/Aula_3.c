//CURSO DE PIC
//PROGRAMA 3 UTILIZANDO OS GPIO COM PIC12F675
//GUILHERME CARVALHO

void main() {
     CMCON = 7; //DESABILITANDO OS COMPARADORES
     ANSEL = 0; //DESABILITANDO AS PORTAS ANALOGICAS
     //DEFININDO OS BITS 0 E 1 COMO SAIDA DIGITAL
     TRISIO0_bit = 0;
     TRISIO1_bit = 0;
     //INICIALIZANDO O GPIO
     GPIO = 0;
     
     while(1){
              GPIO.F0 = 1;
              GPIO.F1 = 0;
              delay_ms(200);
              GPIO.F0 = 0;
              GPIO.F1 = 1;
              delay_ms(200);
     }

}