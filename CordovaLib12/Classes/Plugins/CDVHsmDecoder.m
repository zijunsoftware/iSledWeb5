//
//  CDVHsmDecoder.m
//  HTML5Demo
//
//  Created by andy on 13-3-19.
//
//

#import "CDVHsmDecoder.h"
#import <Cordova/CDV.h>

#import "Captuvo.h"

@implementation CDVHsmDecoder

CDVInvokedUrlCommand * mCommand;

#pragma mark ---
#pragma init Captuvo
- (void) pluginInitialize {
    NSLog(@"CDVHsmDecoder init");
    
    [[Captuvo sharedCaptuvoDevice] startDecoderHardware];
    [[Captuvo sharedCaptuvoDevice] addCaptuvoDelegate:self];
}

- (void) doScan:(CDVInvokedUrlCommand*)command {
    NSLog(@"doScan");
    // recoder command for later use, maybe we need use queue to keep more than one command
    mCommand = command;
    
    // do scan here
    [[Captuvo sharedCaptuvoDevice] startDecoderScanning];
    /*
     [self.commandDelegate runInBackground:^{
     CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"123"];
     
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
     }];*/
}

- (void) decoderDataReceived:(NSString*)data {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:data];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:mCommand.callbackId];
}


#pragma mark ---
#pragma setting captuvo decoder.
- (void)enableDecoder:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableDecoder");
    mCommand = command ;
    [[Captuvo sharedCaptuvoDevice] startDecoderScanning] ;
}
- (void)disableDecoder:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableDecoder");
    mCommand = command ;
    [[Captuvo sharedCaptuvoDevice] stopDecoderScanning] ;
}

- (void)enableAimer:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableAimer") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderAimer:NO] ;
}
- (void)disableAimer:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableAimer") ;
    [[Captuvo sharedCaptuvoDevice] disableDecoderAimer:NO] ;
}
- (void)enableIllumination:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableIllumination") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderIllumination:NO] ;
}
- (void)disableIllumination:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableIllumination") ;
    [[Captuvo sharedCaptuvoDevice] disableDecoderIllumination:NO] ;
}
- (void)enableTrigger:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableTrigger") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderScanning] ;
}
- (void)disableTrigger:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableTrigger") ;
    [[Captuvo sharedCaptuvoDevice] disableDecoderScanning] ;
}
- (void)enableDecoderHardware:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableDecoderHardware") ;
    [[Captuvo sharedCaptuvoDevice] startDecoderHardware] ;
}
- (void)disableDecoderHardware:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableDecoderHardware") ;
    [[Captuvo sharedCaptuvoDevice] stopDecoderHardware] ;
}

- (void)enableTriggerClick:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enableTriggerClick") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderTriggerClick:YES persistSetting:NO] ;
}
- (void)disableTriggerClick:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disableTriggerClick") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderTriggerClick:NO persistSetting:NO] ;
}
- (void)goodreadyDelay:(CDVInvokedUrlCommand*)command
{
    NSLog(@"goodreadyDelay");
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int millseconds = 0 ;
    if (array!=nil&&[array count]>0) {
        millseconds = [[array objectAtIndex:0] intValue] ;
    }
    [[Captuvo sharedCaptuvoDevice] setDecoderGoodReadDelayInMilliSeconds:millseconds persistSetting:NO] ;
}
- (void)setTriggerTimout:(CDVInvokedUrlCommand*)command
{
    NSLog(@"setTriggerTimout") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int millseconds = 0 ;
    if (array!=nil&&[array count]>0) {
        millseconds = [[array objectAtIndex:0] intValue] ;
    }
    [[Captuvo sharedCaptuvoDevice]  setDecoderSerialTriggerTimeoutInMilliSeconds:millseconds persistSetting:NO] ;
    
}
- (void)powerBeepOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"powerBeepOn") ;
    [[Captuvo sharedCaptuvoDevice] enableDecoderPowerUpBeep:YES];
}
- (void)powerBeepOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"powerBeepOff") ;
    [[Captuvo sharedCaptuvoDevice]enableDecoderPowerUpBeep:NO];
}
- (void)readBeepOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"readBeepOn") ;
    [[Captuvo sharedCaptuvoDevice]enableDecoderBeeperForGoodRead:YES persistSetting:NO];
}
- (void)readBeepOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"readBeepOff") ;
    [[Captuvo sharedCaptuvoDevice]enableDecoderBeeperForGoodRead:NO persistSetting:NO];
}
- (void)goodReadBeeperPitch:(CDVInvokedUrlCommand*)command
{
    NSLog(@"goodReadBeeperPitch") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int BeeperPitch = 0 ;
    if (array!=nil&&[array count]>0) {
        BeeperPitch = [[array objectAtIndex:0] intValue] ;
    }
    //BeeperPitch 0:BeeperPitchLow 1:BeeperPitchMedium 2:BeeperPitchHigh
    [[Captuvo sharedCaptuvoDevice]setDecoderBeeperPitchGoodRead:BeeperPitch persistSetting:NO];
}
- (void)errorReadBeeperPitch:(CDVInvokedUrlCommand*)command
{
    NSLog(@"errorReadBeeperPitch") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int BeepererrprPitch = 0 ;
    if (array!=nil&&[array count]>0) {
        BeepererrprPitch = [[array objectAtIndex:0] intValue] ;
    }
    //BeeperPitch 0:BeeperErrorPitchRazz 1:BeeperErrorPitchMedium 2:BeeperErrorPitchHigh
    
    [[Captuvo sharedCaptuvoDevice]setDecoderBeeperPitchError:BeepererrprPitch persistSetting:NO];
    
}
- (void)goodReadBeeperDuration:(CDVInvokedUrlCommand*)command
{
    NSLog(@"goodReadBeeperDuration") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int BeeperVolume = 0 ;
    if (array!=nil&&[array count]>0) {
        BeeperVolume = [[array objectAtIndex:0] intValue] ;
    }
    //   BeeperVolumeLow,                 /**< Low volume */
    //    BeeperVolumeMedium,              /**< Medium volume */
    //    BeeperVolumeHigh,                /**< High volume */
    //    BeeperVolumeOff                  /**< Volume off */
    
    //BeeperVolume 0:BeeperVolumeLow 1:BeeperVolumeMedium 2:BeeperVolumeHigh 3:BeeperVolumeOff
    
    [[Captuvo sharedCaptuvoDevice]setDecoderGoodReadBeeperVolume:BeeperVolume persistSetting:NO];
    
    
}
- (void)beepsofGoodRead:(CDVInvokedUrlCommand*)command
{
    NSLog(@"beepsofGoodRead") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int numberofbeep = 0 ;
    if (array!=nil&&[array count]>0) {
        numberofbeep = [[array objectAtIndex:0] intValue] ;
    }
    
    [[Captuvo sharedCaptuvoDevice]setDecoderNumberOfBeepsGoodRead:numberofbeep persistSetting:NO];
}
- (void)beepsofErrorRead:(CDVInvokedUrlCommand*)command
{
    NSLog(@"beepsofErrorRead") ;
    mCommand = command ;
    NSArray *array = mCommand.arguments ;
    int errornumberofbeep = 0 ;
    if (array!=nil&&[array count]>0) {
        errornumberofbeep = [[array objectAtIndex:0] intValue] ;
    }
    
    [[Captuvo sharedCaptuvoDevice]setDecoderNumberOfBeepsError:errornumberofbeep persistSetting:NO];
}
- (void)passThrough:(CDVInvokedUrlCommand*)command
{
    NSLog(@"passThrough") ;
}
- (void)dateEditing:(CDVInvokedUrlCommand*)command
{
    NSLog(@"dateEditing") ;
}


//Symbology
- (void)enableAllSymbologyOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    [[Captuvo sharedCaptuvoDevice]enableAllSymbologiesPersistSetting:NO];
}
- (void)disableAllSymbologyOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    [[Captuvo sharedCaptuvoDevice]disableAllSymbologiesPersistSetting:NO];
}
- (void)UPCAOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    UPCA* upca = [[UPCA alloc]init];
    upca.enabled=YES;
    upca.enableCheckDigit = YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderUPCAConfiguration:upca persistSetting:NO];
}
- (void)UPCAOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    UPCA* upca = [[UPCA alloc]init];
    upca.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderUPCAConfiguration:upca persistSetting:NO];
    
}
- (void)EAN13On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    EAN13* ean13 = [[EAN13 alloc]init];
    ean13.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderEAN13Configuration:ean13 persistSetting:NO];
    
}
- (void)EAN13Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    EAN13* ean13 = [[EAN13 alloc]init];
    ean13.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderEAN13Configuration:ean13 persistSetting:NO];
    
}
- (void)UPCE0On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    UPCE0* upce0 = [[UPCE0 alloc]init];
    upce0.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderUPCE0Configuration:upce0 persistSetting:NO];
    
}
- (void)UPCE0Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    UPCE0* upce0 = [[UPCE0 alloc]init];
    upce0.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderUPCE0Configuration:upce0 persistSetting:NO];
    
}
- (void)EAN8On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    EAN8* ean8 = [[EAN8 alloc]init];
    ean8.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderEAN8Configuration:ean8 persistSetting:NO];
    
}
- (void)EAN8Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    EAN8* ean8 = [[EAN8 alloc]init];
    ean8.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderEAN8Configuration:ean8 persistSetting:NO];
    
}
- (void)CodabarOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Codabar* cb = [[Codabar alloc]init];
    cb.enabled=YES;
    cb.maxMessageLength=99;
    cb.minMessageLength=0;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodabarConfiguration:cb persistSetting:NO];
    
}
- (void)CodabarOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Codabar* cb = [[Codabar alloc]init];
    cb.enabled=NO;
    cb.maxMessageLength=33;
    cb.minMessageLength=22;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodabarConfiguration:cb persistSetting:NO];
    
}
- (void)Code39On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Code39* code39 = [[Code39 alloc]init];
    code39.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode39Configuration:code39 persistSetting:NO];
    
}
- (void)Code39Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Code39* code39 = [[Code39 alloc]init];
    code39.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode39Configuration:code39 persistSetting:NO];
    
}
- (void)Interleaved2Of5On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Interleaved2of5* i25 = [[Interleaved2of5 alloc]init];
    i25.enabled = YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderInterleaved2of5Configuration:i25 persistSetting:NO];
    
}
- (void)Interleaved2Of5Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Interleaved2of5* i25 = [[Interleaved2of5 alloc]init];
    i25.enabled = NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderInterleaved2of5Configuration:i25 persistSetting:NO];
    
}
- (void)NEC2Of5On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    NEC2of5* n25 = [[NEC2of5 alloc]init];
    n25.enabled = YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderNEC2of5Configuration:n25 persistSetting:NO];
    
}
- (void)NEC2Of5Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    NEC2of5* n25 = [[NEC2of5 alloc]init];
    n25.enabled = NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderNEC2of5Configuration:n25 persistSetting:NO];
    
}
- (void)Code93On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Code93* code93 = [[Code93 alloc]init];
    code93.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode93Configuration:code93 persistSetting:NO];
    
}
- (void)Code93Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Code93* code93 = [[Code93 alloc]init];
    code93.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode93Configuration:code93 persistSetting:NO];
    
}
- (void)Straight2Of5IndustrialOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Straight2of5Industrial* s25 = [[Straight2of5Industrial alloc]init];
    s25.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderStraight2of5IndustrialConfiguration:s25 persistSetting:NO];
    
}
- (void)Straight2Of5IndustrialOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Straight2of5Industrial* s25 = [[Straight2of5Industrial alloc]init];
    s25.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderStraight2of5IndustrialConfiguration:s25 persistSetting:NO];
    
}
- (void)Straight2Of5IATAOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Straight2of5IATA* s25 = [[Straight2of5IATA alloc]init];
    s25.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderStraight2of5IATAConfiguration:s25 persistSetting:NO];
    
}
- (void)Straight2Of5IATAOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Straight2of5IATA* s25 = [[Straight2of5IATA alloc]init];
    s25.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderStraight2of5IATAConfiguration:s25 persistSetting:NO];
    
}
- (void)Matrix2Of5On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Matrix2of5* m25 = [[Matrix2of5 alloc]init];
    m25.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderMatrix2of5Configuration:m25 persistSetting:NO];
}
- (void)Matrix2Of5Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Matrix2of5* m25 = [[Matrix2of5 alloc]init];
    m25.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderMatrix2of5Configuration:m25 persistSetting:NO];
    
}
- (void)Code11On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Code11* c11 = [[Code11 alloc]init];
    c11.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode11Configuration:c11 persistSetting:NO];
    
}
- (void)Code11Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Code11* c11 = [[Code11 alloc]init];
    c11.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode11Configuration:c11 persistSetting:NO];
    
}
- (void)Code128On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Code128* c128 = [[Code128 alloc]init];
    c128.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode128Configuration:c128 persistSetting:NO];
    
}
- (void)Code128Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Code128* c128 = [[Code128 alloc]init];
    c128.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCode128Configuration:c128 persistSetting:NO];
    
}
- (void)GS1128On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    GS1_128* gs1 = [[GS1_128 alloc]init];
    gs1.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1_128Configuration:gs1 persistSetting:NO];
    
}
- (void)GS1128Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    GS1_128* gs1 = [[GS1_128 alloc]init];
    gs1.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1_128Configuration:gs1 persistSetting:NO];
    
}
- (void)TelepenOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Telepen* telepen = [[Telepen alloc]init];
    telepen.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderTelepenConfiguration:telepen persistSetting:NO];
    
}
- (void)TelepenOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Telepen* telepen = [[Telepen alloc]init];
    telepen.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderTelepenConfiguration:telepen persistSetting:NO];
    
}
- (void)MSIOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    MSI* msi = [[MSI alloc]init];
    msi.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderMSIConfiguration:msi persistSetting:NO];
    
}
- (void)MSIOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    MSI* msi = [[MSI alloc]init];
    msi.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderMSIConfiguration:msi persistSetting:NO];
    
}
- (void)GS1DataBarOmnidirectionalOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    GS1DataBarOmnidirectional* gs1 = [[GS1DataBarOmnidirectional alloc]init];
    gs1.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarOmnidirectionalConfiguration:gs1 persistSetting:NO];
    
}
- (void)GS1DataBarOmnidirectionalOff:(CDVInvokedUrlCommand *)command
{
    NSLog(@"disable") ;
    GS1DataBarOmnidirectional* gs1 = [[GS1DataBarOmnidirectional alloc]init];
    gs1.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarOmnidirectionalConfiguration:gs1 persistSetting:NO];
    
}
- (void)GS1DataBarLimitedOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    GS1DataBarLimited* gs1 = [[GS1DataBarLimited alloc]init];
    gs1.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarLimitedConfiguration:gs1 persistSetting:NO];
    
}
- (void)GS1DataBarLimitedOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    GS1DataBarLimited* gs1 = [[GS1DataBarLimited alloc]init];
    gs1.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarLimitedConfiguration:gs1 persistSetting:NO];
    
}
- (void)GS1DataBarExpandedOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    GS1DataBarExpanded* gs1 = [[GS1DataBarExpanded alloc]init];
    gs1.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarExpandedConfiguration:gs1 persistSetting:NO];
    
}
- (void)GS1DataBarExpandedOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    GS1DataBarExpanded* gs1 = [[GS1DataBarExpanded alloc]init];
    gs1.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderGS1DataBarExpandedConfiguration:gs1 persistSetting:NO];
    
}
- (void)CodablockAOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    CodablockA* codablockA = [[CodablockA alloc]init];
    codablockA.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodablockAConfiguration:codablockA persistSetting:NO];
    
}
- (void)CodablockAOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    CodablockA* codablockA = [[CodablockA alloc]init];
    codablockA.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodablockAConfiguration:codablockA persistSetting:NO];
    
}
- (void)CodablockFOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    CodablockF* codablockF = [[CodablockF alloc]init];
    codablockF.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodablockFConfiguration:codablockF persistSetting:NO];
    
}
- (void)CodablockFOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    CodablockF* codablockF = [[CodablockF alloc]init];
    codablockF.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderCodablockFConfiguration:codablockF persistSetting:NO];
    
}
- (void)PDF417On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    PDF417* pdf417 = [[PDF417 alloc]init];
    pdf417.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderPDF417Configuration:pdf417 persistSetting:NO];
    
}
- (void)PDF417Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    PDF417* pdf417 = [[PDF417 alloc]init];
    pdf417.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderPDF417Configuration:pdf417 persistSetting:NO];
    
}
- (void)DataMatrixOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    DataMatrix* dm = [[DataMatrix alloc]init];
    dm.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderDataMatrixConfiguration:dm persistSetting:NO];
    
}
- (void)DataMatrixOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    DataMatrix* dm = [[DataMatrix alloc]init];
    dm.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderDataMatrixConfiguration:dm persistSetting:NO];
    
}

- (void)MaxiCodeOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    MaxiCode* mc = [[MaxiCode alloc]init];
    mc.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderMaxiCodeConfiguration:mc persistSetting:NO];
    
}
- (void)MaxiCodeOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    MaxiCode* mc = [[MaxiCode alloc]init];
    mc.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderMaxiCodeConfiguration:mc persistSetting:NO];
    
}


- (void)AztecOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    Aztec* aztec = [[Aztec alloc]init];
    aztec.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderAztecConfiguration:aztec persistSetting:NO];
    
}
- (void)AztecOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    Aztec* aztec = [[Aztec alloc]init];
    aztec.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderAztecConfiguration:aztec persistSetting:NO];
    
}
- (void)ChineseSensibleOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    ChineseSensible* cs = [[ChineseSensible alloc]init];
    cs.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderChineseSensibleConfiguration:cs persistSetting:NO];
    
}
- (void)ChineseSensibleOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    ChineseSensible* cs = [[ChineseSensible alloc]init];
    cs.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderChineseSensibleConfiguration:cs persistSetting:NO];
    
}
- (void)QRCodeOn:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    QRCode* qrc = [[QRCode alloc]init];
    qrc.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderQRCodeConfiguration:qrc persistSetting:NO];
    
}
- (void)QRCodeOff:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    QRCode* qrc = [[QRCode alloc]init];
    qrc.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderQRCodeConfiguration:qrc persistSetting:NO];
    
}
- (void)TCIFLinkedCode39On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    TCIFLinkedCode39* tcif = [[TCIFLinkedCode39 alloc]init];
    tcif.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderTCIFLinkedCode39Configuration:tcif persistSetting:NO];
    
}
- (void)TCIFLinkedCode39Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    TCIFLinkedCode39* tcif = [[TCIFLinkedCode39 alloc]init];
    tcif.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderTCIFLinkedCode39Configuration:tcif persistSetting:NO];
    
}
- (void)MicroPDF417On:(CDVInvokedUrlCommand*)command
{
    NSLog(@"enable") ;
    MicroPDF417* mpdf = [[MicroPDF417 alloc]init];
    mpdf.enabled=YES;
    [[Captuvo sharedCaptuvoDevice]setDecoderMicroPDF417Configuration:mpdf persistSetting:NO];
    
}
- (void)MicroPDF417Off:(CDVInvokedUrlCommand*)command
{
    NSLog(@"disable") ;
    MicroPDF417* mpdf = [[MicroPDF417 alloc]init];
    mpdf.enabled=NO;
    [[Captuvo sharedCaptuvoDevice]setDecoderMicroPDF417Configuration:mpdf persistSetting:NO];
    
}



@end
