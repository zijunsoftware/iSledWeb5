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
@end
