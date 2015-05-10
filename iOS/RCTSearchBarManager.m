//
//  RCTSearchBarManager.m
//  Request
//
//  Created by c4605 on 5/12/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTSearchBarManager.h"

@implementation RCTConvert (RCTSearchBar)

RCT_ENUM_CONVERTER(UISearchBarStyle, (@{
@"default": @(UISearchBarStyleDefault),
@"minimal": @(UISearchBarStyleMinimal),
@"prominent": @(UISearchBarStyleProminent),
}), UISearchBarStyleDefault, integerValue)

@end

@implementation RCTSearchBarManager

RCT_EXPORT_MODULE()

- (UISearchBar *)view
{
  return [[RCTSearchBar alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

#pragma mark - properties

RCT_EXPORT_VIEW_PROPERTY(placeholder, NSString)
RCT_EXPORT_VIEW_PROPERTY(showsCancelButton, BOOL)
RCT_EXPORT_VIEW_PROPERTY(selectTextOnFocus, BOOL)

RCT_REMAP_VIEW_PROPERTY(searchBarStyle, searchBarStyle, UISearchBarStyle)

@end
