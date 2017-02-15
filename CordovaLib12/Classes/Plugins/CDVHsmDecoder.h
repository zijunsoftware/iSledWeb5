//
//  CDVHsmDecoder.h
//  HTML5Demo
//
//  Created by andy on 13-3-19.
//
//

#import <Cordova/CDV.h>

#import "Captuvo.h"

@interface CDVHsmDecoder : CDVPlugin <CaptuvoEventsProtocol>

- (void) doScan:(CDVInvokedUrlCommand*)command;

- (void)enableDecoder:(CDVInvokedUrlCommand*)command ;
- (void)disableDecoder:(CDVInvokedUrlCommand*)command;
- (void)enableAimer:(CDVInvokedUrlCommand*)command;
- (void)disableAimer:(CDVInvokedUrlCommand*)command ;
- (void)enableIllumination:(CDVInvokedUrlCommand*)command;
- (void)disableIllumination:(CDVInvokedUrlCommand*)command;
- (void)enableTrigger:(CDVInvokedUrlCommand*)command;
- (void)disableTrigger:(CDVInvokedUrlCommand*)command;
- (void)enableDecoderHardware:(CDVInvokedUrlCommand*)command;
- (void)disableDecoderHardware:(CDVInvokedUrlCommand*)command;
- (void)enableTriggerClick:(CDVInvokedUrlCommand*)command;
- (void)disableTriggerClick:(CDVInvokedUrlCommand*)command;
- (void)goodreadyDelay:(CDVInvokedUrlCommand*)command;
- (void)setTriggerTimout:(CDVInvokedUrlCommand*)command;
- (void)powerBeepOn:(CDVInvokedUrlCommand*)command;
- (void)powerBeepOff:(CDVInvokedUrlCommand*)command;
- (void)readBeepOn:(CDVInvokedUrlCommand*)command;
- (void)readBeepOff:(CDVInvokedUrlCommand*)command;
- (void)goodReadBeeperPitch:(CDVInvokedUrlCommand*)command;
- (void)errorReadBeeperPitch:(CDVInvokedUrlCommand*)command;
- (void)goodReadBeeperDuration:(CDVInvokedUrlCommand*)command;
- (void)beepsofGoodRead:(CDVInvokedUrlCommand*)command;
- (void)beepsofErrorRead:(CDVInvokedUrlCommand*)command;
- (void)passThrough:(CDVInvokedUrlCommand*)command;
- (void)dateEditing:(CDVInvokedUrlCommand*)command;

//Symbology
- (void)enableAllSymbologyOn:(CDVInvokedUrlCommand*)command;
- (void)disableAllSymbologyOn:(CDVInvokedUrlCommand*)command;
- (void)UPCAOn:(CDVInvokedUrlCommand*)command;
- (void)UPCAOff:(CDVInvokedUrlCommand*)command;
- (void)EAN13On:(CDVInvokedUrlCommand*)command;
- (void)EAN13Off:(CDVInvokedUrlCommand*)command;
- (void)UPCE0On:(CDVInvokedUrlCommand*)command;
- (void)UPCE0Off:(CDVInvokedUrlCommand*)command;
- (void)EAN8On:(CDVInvokedUrlCommand*)command ;
- (void)EAN8Off:(CDVInvokedUrlCommand*)command ;
- (void)CodabarOn:(CDVInvokedUrlCommand*)command;
- (void)CodabarOff:(CDVInvokedUrlCommand*)command;
- (void)Code39On:(CDVInvokedUrlCommand*)command;
- (void)Code39Off:(CDVInvokedUrlCommand*)command;
- (void)Interleaved2Of5On:(CDVInvokedUrlCommand*)command;
- (void)Interleaved2Of5Off:(CDVInvokedUrlCommand*)command;
- (void)NEC2Of5On:(CDVInvokedUrlCommand*)command;
- (void)NEC2Of5Off:(CDVInvokedUrlCommand*)command;
- (void)Code93On:(CDVInvokedUrlCommand*)command;
- (void)Code93Off:(CDVInvokedUrlCommand*)command;
- (void)Straight2Of5IndustrialOn:(CDVInvokedUrlCommand*)command;
- (void)Straight2Of5IndustrialOff:(CDVInvokedUrlCommand*)command;
- (void)Straight2Of5IATAOn:(CDVInvokedUrlCommand*)command;
- (void)Straight2Of5IATAOff:(CDVInvokedUrlCommand*)command;
- (void)Matrix2Of5On:(CDVInvokedUrlCommand*)command;
- (void)Matrix2Of5Off:(CDVInvokedUrlCommand*)command;
- (void)Code11On:(CDVInvokedUrlCommand*)command;
- (void)Code11Off:(CDVInvokedUrlCommand*)command;
- (void)Code128On:(CDVInvokedUrlCommand*)command;
- (void)Code128Off:(CDVInvokedUrlCommand*)command;
- (void)GS1128On:(CDVInvokedUrlCommand*)command;
- (void)GS1128Off:(CDVInvokedUrlCommand*)command;
- (void)TelepenOn:(CDVInvokedUrlCommand*)command;
- (void)TelepenOff:(CDVInvokedUrlCommand*)command;
- (void)MSIOn:(CDVInvokedUrlCommand*)command;
- (void)MSIOff:(CDVInvokedUrlCommand*)command;
- (void)GS1DataBarOmnidirectionalOn:(CDVInvokedUrlCommand*)command;
- (void)GS1DataBarOmnidirectionalOff:(CDVInvokedUrlCommand *)command;
- (void)GS1DataBarLimitedOn:(CDVInvokedUrlCommand*)command;
- (void)GS1DataBarLimitedOff:(CDVInvokedUrlCommand*)command;
- (void)GS1DataBarExpandedOn:(CDVInvokedUrlCommand*)command;
- (void)GS1DataBarExpandedOff:(CDVInvokedUrlCommand*)command;
- (void)CodablockAOn:(CDVInvokedUrlCommand*)command;
- (void)CodablockAOff:(CDVInvokedUrlCommand*)command;
- (void)CodablockFOn:(CDVInvokedUrlCommand*)command;
- (void)CodablockFOff:(CDVInvokedUrlCommand*)command;
- (void)PDF417On:(CDVInvokedUrlCommand*)command;
- (void)PDF417Off:(CDVInvokedUrlCommand*)command;
- (void)DataMatrixOn:(CDVInvokedUrlCommand*)command;
- (void)DataMatrixOff:(CDVInvokedUrlCommand*)command;
- (void)MaxiCodeOn:(CDVInvokedUrlCommand*)command;
- (void)MaxiCodeOff:(CDVInvokedUrlCommand*)command;
- (void)AztecOn:(CDVInvokedUrlCommand*)command;
- (void)AztecOff:(CDVInvokedUrlCommand*)command;
- (void)ChineseSensibleOn:(CDVInvokedUrlCommand*)command;
- (void)ChineseSensibleOff:(CDVInvokedUrlCommand*)command;
- (void)QRCodeOn:(CDVInvokedUrlCommand*)command;
- (void)QRCodeOff:(CDVInvokedUrlCommand*)command;
- (void)TCIFLinkedCode39On:(CDVInvokedUrlCommand*)command;
- (void)TCIFLinkedCode39Off:(CDVInvokedUrlCommand*)command;
- (void)MicroPDF417On:(CDVInvokedUrlCommand*)command;
- (void)MicroPDF417Off:(CDVInvokedUrlCommand*)command;
@end
