//
//  MainViewController.h
//  iSledWeb5
//
//  Created by zhou shadow on 5/3/13.
//  Copyright (c) 2013 Honeywell Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDVViewController.h"

#import "CDVCommandDelegateImpl.h"

#import "CDVCommandQueue.h"

@interface MainViewController : CDVViewController

@end

@interface MainCommandDelegate : CDVCommandDelegateImpl
@end

@interface MainCommandQueue : CDVCommandQueue
@end
