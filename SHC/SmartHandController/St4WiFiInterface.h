// -----------------------------------------------------------------------------------
// ESP32 WiFi connection to OnStep
// Experimental

#pragma once

#ifdef ESP32 
	#include <WiFi.h>
#else
	#error "WiFiInterface can be used with ESP32 only"
#endif
#include "Stream.h"
#include "Constants.h"
#include "Locales.h"
#include "Config.h"
#include "Locale.h"
#include "Pinmap.h"


void dataClock();
void shcTone();

class Wst4 : public WiFiClient
{
  public:
    void begin(long baudRate=9600);
    void end();
    void paused(bool state);
    bool active();
	void setTimeout(unsigned long timeOutMs);

    inline size_t write(unsigned long n) { return write((uint8_t)n); }
    inline size_t write(long n) { return write((uint8_t)n); }
    inline size_t write(unsigned int n) { return write((uint8_t)n); }
    inline size_t write(int n) { return write((uint8_t)n); }
};

extern Wst4 WiFiST4;
