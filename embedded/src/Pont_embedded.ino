
#include <PN532_HSU.h>
#include <PN532.h>
#include "emulatetag.h"
#include "NdefMessage.h"
#include <UTFT.h>  


#define SCREEN_TYPE TFT32MEGA_2
#define RS_PIN 38
#define WR_PIN 39
#define CS_PIN 40
#define RST_PIN 41

#define UID_SIZE 3
#define UID_PARAM_1 0x12
#define UID_PARAM_2 0x34
#define UID_PARAM_3 0x56

#define IMG_BUF_SIZE 20000
#define IMG_LENGTH 100
#define IMG_WIDTH  100
#define IMG_START_POS_X 0
#define IMG_START_POS_Y 0

PN532_HSU pn532hsu(Serial1);
EmulateTag nfc(pn532hsu);
UTFT myGLCD(TFT32MEGA_2, RS_PIN,WR_PIN,CS_PIN,RST_PIN);

uint8_t uid[UID_SIZE] = { UID_PARAM_1, UID_PARAM_2, UID_PARAM_3 };

uint16_t imgBuf[IMG_BUF_SIZE] = {0};

void setup()
{
    nfc.setUid(uid);
    nfc.init();

    myGLCD.InitLCD();
    myGLCD.clrScr();
}

void loop()
{
    uint32_t prevPaylLen = 0;
    uint32_t currPaylLen = 0;
    nfc.emulate();
    if(nfc.writeOccured())
    {
        memset(imgBuf,0,sizeof(imgBuf));
        uint8_t* tagBuf;
        uint16_t tagLen;

        nfc.getContent(&tagBuf, &tagLen);
        NdefMessage msg = NdefMessage(tagBuf, tagLen);
        uint16_t rec_cnt =  msg.getRecordCount();
        for (uint8_t i = 0; i < rec_cnt; i++)
        {
            NdefRecord record = msg.getRecord(i);
            currPaylLen = record.getPayloadLength();
            byte payload[currPaylLen];
            record.getPayload(payload);
            memcpy(imgBuf+prevPaylLen,payload,currPaylLen);
            prevPaylLen += currPaylLen; 
        }
        myGLCD.drawBitmap(IMG_START_POS_X,IMG_START_POS_Y,IMG_LENGTH,IMG_WIDTH,imgBuf);
    }
    delay(1000);
}

