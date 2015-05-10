//
//  RCTSearchBarManager.h
//  Request
//
//  Created by c4605 on 5/12/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTViewManager.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

#import "RCTSearchBar.h"

@interface RCTSearchBarManager : RCTViewManager

@property (nonatomic, assign) BOOL selectTextOnFocus;

@end
