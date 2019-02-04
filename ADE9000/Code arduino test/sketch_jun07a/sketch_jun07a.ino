// P04 S6E18 code arduino pour tester le ADE9000

// !!!!!  3.3 V tolerant !!!!
//le code est utilisé sur un arduino pro mini fonctionnant à 3.3 V
//Un arduino à 5V ne peut pas fonctionner même avec un diviseur de tension. Il y à un mismatch entre le Voh du ADE et le Vih du arduino alimenté à 5V.

#include <SPI.h>

//  Les constantes,variables et registres pour le ADE9000

#define PF_CMD 0x2168
#define THD_CMD 0x2178
#define AV_CMD 0x20B8
#define AI_CMD 0x20A8
#define AVRMS_CMD 0x20D8
#define AIRMS_CMD 0x20C8
#define RUN_CMD 0x4808  //pour enable le DSP
#define LAST_CMD  0x4AE8
#define ACCMODE_CMD_WRITE 0x4920  //pour set la fréquence fondammentale
#define ACCMODE_CMD_READ 0x4928
#define VLEVEL_CMD  0x40F0  //pour set niveau nominal tension

#define EP_CFG_CMD_WRITE  0x4B00  //pour disable le no load timer et enable power accumulation
#define EP_CFG_CMD_READ 0x4B08 

#define CONFIG0_CMD_READ  0x0608
#define CONFIG0_CMD_WRITE 0x0600
#define ZX_LP_SEL_CMD_READ  0x49A8 //pour set la mesure de periode sur 1 seule phase
#define ZX_LP_SEL_CMD_WRITE 0x49A0  
#define WFB_CFG_READ 0x4A08 // Registre de config du waveform buffer
#define WFB_CFG_WRITE 0x4A00 
#define MASK0_CFG_READ 0x4058 // Registre des masques des interruptions
#define MASK0_CFG_WRITE 0x4050
#define CONFIG1_CFG_READ 0x4818 // Configuration générale
#define CONFIG1_CFG_WRITE 0x4810

#define STATUS0_CMD 0x4028

#define CONV_PF_THD 0.000000007450580597
#define FULL_SCALE_I_V_RMS  52702092 // Datasheet p.28
#define FULL_SCALE_I_V  74532013 // Datasheet p.31
#define V_NOMINAL 120
#define V_CORR  1.188 //facteur correction pour que la "tension nominal" soit lu avec le condo de 10uF
#define I_NOMINAL 5
#define I_CORR  1.1 //facteur correction pour que le "courant nominal" soit lu avec le condo de 10uF

float THD=0.0f;  //en %
float PF=0.0f;
float I=0.0f;
float V=0.0f;
float IRMS=0.0f;
float VRMS=0.0f;

//Les constantes et variables pour le arduino
#define chipSelect 6
#define TIMER_LECTURE 1000  //en ms
unsigned long last_millis=0; //permet de faire comme un timer qui ne bloque pas le code (voir fonction millis() d'arduino)
unsigned long temp=0;
unsigned short temp16=0;

//Les prototypes
void afficher_resultats();  //propre au arduino
unsigned long lecture_registre(short nb_bytes,unsigned short cmd_hdr); //dequoi de similaire pour notre application Atmel
void enable_dsp();  //enable le dsp (RUN=1)
void ecriture_registre(short nb_bytes,unsigned short cmd_hdr,unsigned long val);
void lire_pf();
void lire_thd();
void lire_av();
void lire_ai();
void lire_avrms();
void lire_airms();

void setup() {
  Serial.begin(115200); //pour la console avec arduino
  
  delay(500); //permet le setting des registres et du crystal (50ms aurait été plus précis mais moins safe) voir p.7 userguide
  
  SPI.begin();
  SPI.setDataMode (SPI_MODE3);  //voir datasheet ADE. Clock idle high et les bits sont lues sur les fronts montants
  pinMode(chipSelect,OUTPUT);
  
  //Configuration du ADE9000
  temp16=lecture_registre(2,ACCMODE_CMD_READ);  //config fréquence
  ecriture_registre(2,ACCMODE_CMD_WRITE,(temp16|0x0100));
  
  ecriture_registre(4,VLEVEL_CMD,0x00117514);//config VLEVEL nominal (1Vp)
  
  temp16=lecture_registre(2,EP_CFG_CMD_READ);//disable no load timer
  ecriture_registre(2,EP_CFG_CMD_WRITE,(temp16|0xE000));

  temp16=lecture_registre(2,ZX_LP_SEL_CMD_READ);  //set la phase A comme référence pour la mesure de la période
  ecriture_registre(2,ZX_LP_SEL_CMD_WRITE,(temp16&0xFFC0));
  
  enable_dsp(); //dernière étape de la config du ADE9000

  temp16=lecture_registre(2,EP_CFG_CMD_READ);//enable power accumulation (ne pas faire en même temps que le no-load timer)
  ecriture_registre(2,EP_CFG_CMD_WRITE,(temp16|0x0001));

  temp16=lecture_registre(2, WFB_CFG_READ);
  temp16 |= 0x300; // WF_SRC = 11 // 8ksp/s avec dsp
  temp16 &= ~0x20; // WF_CAP_SEL = 0 // 128 pts/cycle
  temp16 |= 0x10; // WF_CAP_EN = 0 // Pas de capture
  ecriture_registre(2, WFB_CFG_WRITE, temp16); 

  temp=lecture_registre(4, MASK0_CFG_READ);
  temp |= 0x8000; // Activer l'interruption DREADY lorsqu'il y a un sample
  ecriture_registre(4, MASK0_CFG_WRITE, temp);

  temp16 = lecture_registre(2, CONFIG1_CFG_READ);
  temp16 |= 0xC; // CF4_CFG = 11 // CF4 est connecté à DREADY 
  ecriture_registre(2, CONFIG1_CFG_WRITE, temp16);
    
  //attachInterrupt(digitalPinToInterrupt(2), afficher_VI, FALLING);
}

void afficher_VI()
{
  lire_av();
  lire_ai();
  Serial.print(V,3);
  Serial.print(' ');
  Serial.print(I,3);
  Serial.print('\n');
}

void loop() {

  
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

void ecriture_registre(short nb_bytes,unsigned short cmd_hdr,unsigned long val)
{
  // cmd_hdr: 16bits non signé incluant le bit3=0 pour le write
  //val: 32 bits où les 16 msb sont des don't care si nb_bytes
  byte msb=cmd_hdr>>8;
  byte lsb=(cmd_hdr<<8)>>8;
  
  byte byte1=0;
  byte byte2=0;
  byte byte3=0;
  byte byte4=0;

  if (nb_bytes==2)
  {
    byte1=val>>8;//isole les bytes et supprime les don't care qui seraient non-nul
    byte2=(val<<8)>>8;
  }
  else
  {
    byte1=val>>24;//isole les bytes et supprime les don't care qui seraient non-nul
    byte2=(val<<8)>>24;
    byte3=(val<<16)>>24;
    byte4=(val<<24)>>24;
  }
  digitalWrite(chipSelect,LOW);
  SPI.transfer(msb);  //le command header
  SPI.transfer(lsb);

  SPI.transfer(byte1);  //la valeur à écrire
  SPI.transfer(byte2);
  if (nb_bytes==4)
  {
    SPI.transfer(byte3);
    SPI.transfer(byte4);
  }
  digitalWrite(chipSelect,HIGH);
}
unsigned long lecture_registre(short nb_bytes,unsigned short cmd_hdr)  //faire quelque chose de similaire pour notre application
{
  // cmd_hdr: 16bits non signé incluant le bit3=1 pour le read
  
  unsigned long result=0;
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

void lire_pf()
{
    temp=lecture_registre(4,PF_CMD);
    PF=(float)temp * CONV_PF_THD;
}

void lire_thd()
{
    temp=lecture_registre(4,THD_CMD);
    THD=(float)temp * 100 * CONV_PF_THD;
}

void lire_avrms()
{
    temp=lecture_registre(4,AVRMS_CMD); //lecture tension
    VRMS=((float)temp/(float)FULL_SCALE_I_V_RMS)*V_NOMINAL*V_CORR;
}

void lire_airms()
{
    temp=lecture_registre(4,AIRMS_CMD); //lecture courant
    IRMS=((float)temp/(float)FULL_SCALE_I_V_RMS)*I_NOMINAL*I_CORR;
}

void lire_av()
{
    // lecture dans un entier signé
    long temp = lecture_registre(4,AV_CMD); //lecture tension
    V = ((float)temp/(float)FULL_SCALE_I_V)*V_NOMINAL*V_CORR;
}

void lire_ai()
{
    // lecture dans un entier signé
    long temp = lecture_registre(4,AI_CMD); //lecture courant
    I = ((float)temp/(float)FULL_SCALE_I_V)*I_NOMINAL*I_CORR;
}

void afficher_resultats() //propre au arduino
{
  Serial.print('\n');
  Serial.print("Le taux de distorsion harmonique : ");
  Serial.print(THD,3);
  Serial.print(" %");
  Serial.print('\n');
  Serial.print("Le facteur de puissance: ");
  Serial.print(PF,3);
  Serial.print('\n');
  Serial.print("La tension RMS: ");
  Serial.print(VRMS,3);
  Serial.print(" V");
  Serial.print('\n');
  Serial.print("Le courant RMS: ");
  Serial.print(IRMS,3);
  Serial.print(" A");
  Serial.print('\n');
  
}
