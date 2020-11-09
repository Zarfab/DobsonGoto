# DobsonGoto
Adding track/goto functionality to a [Skywatcher Heritage P130](http://www.skywatcher.com/product/heritage-p130/) Dobsonian telescope

## Software
After struggling trying to create the program myself, 
I found the wonderful work of [Howard Dutton](https://github.com/hjd1964) 
and others, [OnStep](https://github.com/hjd1964/OnStep). 
Given all the ressources they provide, no need for me to explain how it works. 
I chose to go for the [STM32 BluePill version](https://onstep.groups.io/g/main/wiki/6408) 
which looked like a good compromise between price and performance. 
My config file for version OnStep 3.16 is given as example.

Edit : I tried the Teensy 4.0 instead of the STM32 BluePill and it's waaaaay faster and more stable.
As I had the BluePill PCB at hand, I simply modified the pinmap of the MiniPCB and use dupont cables
to connect the Teensy to the headers intended for the BluePill.
I also removed the DS3231 and use the space to place a NEO6M GPS module.

## Electronics
Big THANKS to [Khalid M. Baheyeldin](https://baheyeldin.com/family/khalid/khalid-m-baheyeldin.html) and Dave Schwartz!  
https://easyeda.com/kbahey/OnStep-STM32-Blue-Pill  
https://docs.google.com/document/d/1jNq45aU0gVWZkOLagmqWJahz5HE1R3d9enh5hurSPQY/edit  
https://baheyeldin.com/astronomy/onstep-telescope-controller-stm32-pcb-kits.html  
What else?  

## CAD
Comming sooner or later...

## SHC
[ESP32 (DevKit C) version of the Smart Hand Controller for OnStep](https://baheyeldin.com/astronomy/onstep-esp32-smart-hand-controller-shc.html)

The code is forked from OnStep addons but has been modified to allow to connect to OnStep
through the ESP32 WiFi or through a HC-05 Bluetooth module connected on Serial2 (ESP32 GPIO 16 and 17).
The HC-05 has to be configured as Master and [paired with the HC-06](http://www.martyncurrey.com/connecting-2-arduinos-by-bluetooth-using-a-hc-05-and-a-hc-06-pair-bind-and-link/) module on OnStep.

## Licence
MIT License except if specified otherwise.  
The Smart Hand Controller code is forker from [OnStep addons](https://github.com/hjd1964/OnStep/tree/master/addons/SmartHandController) under GNU General Public License v3.