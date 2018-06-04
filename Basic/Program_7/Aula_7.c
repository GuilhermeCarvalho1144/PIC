//CURSO DE PIC
//PROGRAMA 7 SHIFT LEFT COM A PIC16F628A
//GUILHERME CARVALHO

int cont = 0xFF; //VARIAVEL DE CONTROLE

void main() {
     CMCON = 0x07; //DESABILITA OS COMPARADOREES
     
     TRISB = 0x00; //DEFININDO PORTB COMO SAIDA DIGITAIS
     PORTB = 0xFF; //INICIALIZA O PORTB EM NIVEL ALTO (CURRENT SINKING) OBS.: 0xFF = 255 = 0b11111111
     
     while(1){
              if(cont == 0x00)cont = 0xFF;
              PORTB = cont;
              cont = cont << 1;
              delay_ms(200);
     }
     

}