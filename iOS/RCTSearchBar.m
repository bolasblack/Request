//
//  RCTSearchBar.m
//  Request
//
//  Created by c4605 on 5/13/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTSearchBar.h"

@implementation RCTSearchBar
{
  RCTEventDispatcher *_eventDispatcher;
}

- (RCTSearchBar *)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  CGRect screenRect = [[UIScreen mainScreen] bounds];
//  if (self = [super initWithFrame:CGRectMake(0, 0, screenRect.size.height, 44)]) {
  if (self = [super initWithFrame:CGRectZero]) {
    
    _eventDispatcher = eventDispatcher;
    self.delegate = self;
  }
  return self;
}

#pragma mark - private methods
// http://stackoverflow.com/questions/8435271/uisearchbar-select-all-text
- (UITextField *)getTextFieldInSearchBar:(RCTSearchBar *)searchBar
{
  UITextField *textfield;
  for (UIView *subview in [[searchBar.subviews firstObject] subviews]) {
    // we can't check if it is a UITextField because it is a UISearchBarTextField.
    // Instead we check if the view conforms to UITextInput protocol. This finds
    // the view we are after.
    if ([subview conformsToProtocol:@protocol(UITextInput)]) {
      textfield = (UITextField*)subview;
      break;
    }
  }
  return textfield;
}

#pragma mark - delegate

#define RCT_SEARCH_BAR_EVENT_TRIGGER(eventName) \
  NSDictionary *event = @{@"target": self.reactTag};      \
  [_eventDispatcher sendInputEventWithName:@#eventName body:event];

- (void)searchBarTextDidBeginEditing:(RCTSearchBar *)searchBar
{
  if (_selectTextOnFocus) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[self getTextFieldInSearchBar:self] selectAll:nil];
    });
  }
  RCT_SEARCH_BAR_EVENT_TRIGGER(topFocus)
}

- (void)searchBar:(RCTSearchBar *)searchBar textDidChange:(NSString *)searchText
{
  RCT_SEARCH_BAR_EVENT_TRIGGER(topChange)
}

- (void)searchBarCancelButtonClicked:(RCTSearchBar *)searchBar
{
  [searchBar setText:@""];
  [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(RCTSearchBar *)searchBar
{
  [self resignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  BOOL result = [super resignFirstResponder];
  if (result) {
    RCT_SEARCH_BAR_EVENT_TRIGGER(topBlur)
  }
  return result;
}

@end
