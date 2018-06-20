// P04 S6E18 code arduino pour tester le ADE9000

// !!!!!  3.3 V tolerant !!!!
//le code est utilisé sur un arduino pro mini fonctionnant à 3.3 V
//Un arduino à 5V ne peut pas fonctionner même avec un diviseur de tension. Il y à un mismatch entre le Voh du ADE et le Vih du arduino alimenté à 5V.

#include <SPI.h>

//  Les constantes,variables et registres pour le ADE9000

#define PF_CMD 0x2168
#define THD_CMD 0x2178
#define ACCMODE_CMD 0x4928
#define RUN_CMD 0x4808
#define LAST_CMD  0x4AE8

float THD=0;  //en %
float PF=0;

//Les constantes et variables pour le arduino
#define chipSelect 6
#define TIMER_LECTURE 1000  //en ms
long last_millis=0; //permet de faire comme un timer qui ne bloque pas le code (voir fonction millis() d'arduino)
unsigned int temp=0;
unsigned short dsp_state=0;

//Les prototypes
void afficher_resultats();  //propre au arduino
unsigned int lecture_registre(short nb_bytes,unsigned short cmd_hdr); //dequoi de similaire pour notre application Atmel
void enable_dsp();  //enable le dsp (RUN=1)

void setup() {
  Serial.begin(9600); //pour la console avec arduino
  
  delay(500); //permet le setting des registres et du crystal (50ms aurait été plus précis mais moins safe) voir p.7 userguide
  
  SPI.begin();
  SPI.setDataMode (SPI_MODE3);  //voir datasheet ADE. Clock idle high et les bits sont lues sur les fronts montants
  pinMode(chipSelect,OUTPUT);
  enable_dsp();
}

void loop() {
  
  if (millis()>last_millis+TIMER_LECTURE) //vérification qui s'apparente à un Timer pour un environnement autre que Arduino
  {
    temp=lecture_registre(4,PF_CMD);
    PF=(float)temp/(float)134217728;  //conformément au fichier .cpp du code du shield de l'ADE9000
    delay(1);
    temp=lecture_registre(4,THD_CMD);
    THD=(float)temp*100/(float)134217728;  //conformément au fichier .cpp du code du shield de l'ADE9000
    delay(1);
    dsp_state=lecture_registre(2,RUN_CMD);
    delay(1);
    temp=lecture_registre(2,LAST_CMD);
    
    afficher_resultats();
    last_millis=millis();
  }
}
void enable_dsp()// (RUN=1)
{
  digitalWrite(chipSelect,LOW);
  
  SPI.transfer(0x48); //choisi RUN register pour write
  SPI.transfer(0x00);

  SPI.transfer(0x00);
  SPI.transfer(0x01); //enable DSP for mesurement
  digitalWrite(chipSelect,HIGH);
}
unsigned int lecture_registre(short nb_bytes,unsigned short cmd_hdr)  //faire quelque chose de similaire pour notre application
{
  //cmd_hdr doit inclure le bit Read, la fonction ne l'ajoute pas
  
  unsigned int result=0;
  byte newbyte=0;
  byte msb=cmd_hdr>>8;
  byte lsb=(cmd_hdr<<8)>>8;
  
  digitalWrite(chipSelect,LOW);
  SPI.transfer(msb);
  SPI.transfer(lsb);
  result=SPI.transfer(0x00);  //écriture bidon pour lire
  nb_bytes--;

  while (nb_bytes>0)
  {
    result=result<<8; //decale tout d'un byte
    newbyte=SPI.transfer(0x00);
    result=result | newbyte;  //combine le vieux stock avec le newbyte
    nb_bytes--;
  }
  digitalWrite(chipSelect,HIGH);
  return result;
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
  
  Serial.print("DSP state : ");
  Serial.print(dsp_state);
  Serial.print('\n');
}

