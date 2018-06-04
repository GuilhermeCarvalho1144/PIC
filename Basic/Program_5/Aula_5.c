//CURSO DE PIC
//PROGRAMA 5 OSCILADORES EXTERNOS COM A PIC12F675
//GUILHERME CARVALHO

void main() {
     ANSEL = 0;   //DESABILITA AS ENTRADAS ANALOGICAS
     CMCON = 7;   //DESABILITA OS COMPARADORES
     //DEFININDO AS SAIDAS DIGITAIS
     TRISIO0_bit = 0;
     TRISIO1_bit = 0;

     while(1){
              GPIO.F0 = 1;    //TENNADO FAZER UM OSCILADOR DE 50HZ
              delay_ms(10);
              GPIO.F0 = 0;
              delay_ms(10);
              
              GPIO.F1 = 1;    //TENTANDO FAZER UM OSCILADOR DE 500HZ
              delay_ms(1);
              GPIO.F1 = 0;
              delay_ms(1);
              
     }

}  /*OBS NAO SE É POSSÍVEL SE FAZER DOIS OSCILADORES INDEPENDENTES USANDO DELAYS
    O PROGRAMA SEGUE A ORDEM DE EXECUÇÃO FAZENDO COM QUE AMBOS OS OSCILADORES
    TENHAM A MESMA FREQUÊNCIA*/