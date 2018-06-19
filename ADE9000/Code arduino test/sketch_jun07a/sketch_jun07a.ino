// P04 S6E18 code arduino pour tester le ADE9000

// !!!!!  3.3 V tolerant !!!!

#include <SPI.h>

//  Les constantes,variables et registres pour le ADE9000
#define READ_PF_CMD  0x2168
#define READ_THD_CMD 0x2178
float THD=0;  //en %
float PF=0;

//Les constantes et variables pour le arduino
#define chipSelect 6

#define TIMER_LECTURE 1000  //en ms
long last_millis=0; //permet de faire comme un timer qui ne bloque pas le code (voir fonction millis() d'arduino)


//Les prototypes
void lecture_PF();
void lecture_THD();
void afficher_resultats();

void setup() {
  Serial.begin(9600); //pour la console avec arduino
  SPI.begin();
  pinMode(chipSelect,OUTPUT);
}

void loop() {
  if (millis()>last_millis+TIMER_LECTURE)
  {
    lecture_PF();
    delay(1);
    lecture_THD();
    afficher_resultats();
    last_millis=millis();
  }
}
void lecture_PF() // il faut lire 4 bytes
{
  short bytetoread=4;
  unsigned int result=0;
  byte newbyte=0;
  digitalWrite(chipSelect,LOW);
  SPI.transfer(READ_PF_CMD);

  result=SPI.transfer(0x00);  //écriture bidon pour lire
  bytetoread--;

  while (bytetoread>0)
  {
    result=result<<8; //decale tout d'un byte
    newbyte=SPI.transfer(0x00);
    result=result | newbyte;  //combine le vieux stock avec le newbyte
    bytetoread--;
  }
  digitalWrite(chipSelect,HIGH);
  PF=(float)result/(float)134217728;  //conformément au fichier .cpp du code du shield de l'ADE9000
}
void lecture_THD()  // il faut lire 4 bytes
{
  short bytetoread=4;
  unsigned int result=0;
  byte newbyte=0;
  digitalWrite(chipSelect,LOW);
  SPI.transfer(READ_THD_CMD);

  result=SPI.transfer(0x00);  //écriture bidon pour lire
  bytetoread--;

  while (bytetoread>0)
  {
    result=result<<8; //decale tout d'un byte
    newbyte=SPI.transfer(0x00);
    result=result | newbyte;  //combine le vieux stock avec le newbyte
    bytetoread--;
  }
  digitalWrite(chipSelect,HIGH);
  THD=(float)result*100/(float)134217728;  //conformément au fichier .cpp du code du shield de l'ADE9000
}
void afficher_resultats()
{
  Serial.print('\n');
  Serial.print("Le taux de distorsion harmonique (%): ");
  Serial.print(THD,3);
  Serial.print('\n');
  Serial.print("Le facteur de puissance: ");
  Serial.print(PF,3);
  Serial.print('\n');
  
}


