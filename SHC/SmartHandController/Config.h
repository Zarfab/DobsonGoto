// ---------------------------------------------------------------------------------------------------------------------------------
// Configuration for OnStep Smart Hand Controller (SHC) Add-on

/*
 *          For more information on setting OnStep up see http://www.stellarjourney.com/index.php?r=site/equipment_onstep 
 *                      and join the OnStep Groups.io at https://groups.io/g/onstep
 * 
 *           *** Read the compiler warnings and errors, they are there to help guard against invalid configurations ***
*/

// ---------------------------------------------------------------------------------------------------------------------------------
// ADJUST THE FOLLOWING TO CONFIGURE YOUR ADD-ON'S FEATURES ------------------------------------------------------------------------
// <-Req'd = always must set, <-Often = usually must set, Option = optional, Adjust = adjust as req'd, Infreq = infrequently changed

//      Parameter Name              Value   Default  Notes                                                                      Hint
// DISPLAY -------------------------------------------------------------------------------------------------------------------------
#define DISPLAY_LANGUAGE             L_en //   L_en, English. Specify language with two letter country code, if supported.    Adjust
#define DISPLAY_OLED               SH1106 // SH1106, OLED 1.3" I2C display commonly used. SSD1306 is a 0.96" OLED display.    Infreq
                                          //         SSD1309 is a 2.3" I2C display (w/Reset on ESP32 Pin23 or Teensy Pin14.)

// SERIAL PORTS --------------------------------------------------------------------------------------------------------------------
#define SERIAL_INTERFACE      SerialST4 // Se..T4, SerialST4 for ST4 port sync comms, you can also use any other available  Infreq
                                          //         serial port (if pins are unused,) Serial3 for example, on the Teensy3.2
                                          //         This is the default serial interface connected to OnStep.
#define SERIAL_INTERFACE_NAME "SerialST4"
#define SERIAL_BAUD_DEFAULT          9600 //   9600, Common baud rates for these parameters are 9600,19200,57600,115200.    Infreq
                                          //         Only used for async serial communication with OnStep.
                                          
#define SERIAL_INTERFACE_ALT      WiFiST4 // Se..l2, This is the alternative serial interface connected to OnStep when      Infreq
                                          //         De+ or De- is pulled down.
                                          //         For example it can communicate over Bluetooth with a HC-05  module 
                                          //         configured as master and paired with OnStep Bluetooth module if available
                                          //         The baud rate will be set to SERIAL_BAUD_DEFAULT
#define SERIAL_INTERFACE_ALT_NAME "WiFiST4"

// WIFI SETTINGS -------------------------------------------------------------------------------------------------------------------
#define WIFI_SERIAL                    ON //
#define WIFI_NETWORK        "ONSTEP-WIFI" //
#define WIFI_PASSWORD          "password" //
#define WIFI_HOST           "192.168.0.1" //
#define WIFI_HOST_PORT               9999 //

// USER FEEDBACK -------------------------------------------------------------------------------------------------------------------
#define UTILITY_LIGHT                 OFF //    OFF, n. Where n=0..255 (0..100%) activates feature sets default brightness.   Adjust

// DISPLAY -------------------------------------------------------------------------------------------------------------------------
#define DISPLAY_AMBIENT_CONDITIONS     ON //    OFF, ON to show ambient conditions in the display rotation                    Option
#define DISPLAY_WRAP_MENUS            OFF //    OFF, ON allows menus to wrap so moving past bottom returns to top, etc.       Option
#define DISPLAY_24HR_TIME              ON //     ON, OFF to use 12 hour format for entering time.                             Option
#define DISPLAY_DIM_TIMEOUT            30 //     30, n. Where n=0..600 seconds, 0 disables timeout.                           Adjust
#define DISPLAY_BLANK_TIMEOUT         120 //    120, n. Where n=0..600 seconds, 0 disables timeout.                           Adjust

// KEYPAD --------------------------------------------------------------------------------------------------------------------------
#define KEYPAD_JOYSTICK_ANALOG        OFF //    OFF, JS1 for Jerry's analog joystick                                          Option

// ST4 INTERFACE -------------------------------------------------------------------------------------------------------------------
// *** It is up to you to verify the interface meets the electrical specifications of any connected device, use at your own risk ***
#define ST4_INTERFACE                 OFF //    OFF, ON, ON_PULLUP enables auxillary "pass-through" ST4 interface.            Option
                                          //             Note: Available only when SERIAL_INTERFACE SerialST4 is used

// CATALOGS ------------------------------------------------------------------------------------------------------------------------
// Advanced users can also customize which celestial object catalogs are included or even add new catalogs using CatalogConfig.h

// THAT'S IT FOR USER CONFIGURATION!

// ---------------------------------------------------------------------------------------------------------------------------------
