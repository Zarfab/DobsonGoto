#include <Arduino.h>
#include "St4WiFiInterface.h"
#include "Constants.h"
#include "Locales.h"
#include "Config.h"
#include "Locale.h"
#include "Pinmap.h"

void Wst4::begin(long baudRate) {
  if(!connected()) {
    if(WiFi.status() != WL_CONNECTED) {
      DL("WiFi lost, try to reconnect");
      WiFi.begin(WIFI_NETWORK, WIFI_PASSWORD);
      while (WiFi.status() != WL_CONNECTED) {
          delay(500);
          D(".");
      }
      DL("");
      DL("WiFi connected");
    }
    DL("Server lost, try to reconnect");
    //stop();
    if (connect(WIFI_HOST, WIFI_HOST_PORT)) {
        DL("connection failed");
        return;
    }
    DL("Ready to send commands");
  }
}

void Wst4::end() {
  stop();
}

void Wst4::paused(bool state) {

}

bool Wst4::active() {
  return connected();
}

void Wst4::setTimeout(unsigned long timeOutMs) {
  unsigned long realTimeout = constrain(timeOutMs, 10000, 60000);
  WiFiClient::setTimeout(realTimeout / 1000);
}


Wst4 WiFiST4;
