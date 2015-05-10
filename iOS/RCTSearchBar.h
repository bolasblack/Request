//
//  RCTSearchBar.h
//  Request
//
//  Created by c4605 on 5/13/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+React.h"
#import "RCTEventDispatcher.h"

@interface RCTSearchBar : UISearchBar <UISearchBarDelegate>

@property (nonatomic, assign) BOOL selectTextOnFocus;

- (RCTSearchBar *)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
