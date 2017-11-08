//
//  UIResponder+Router.h
//  ResponderChain
//
//  Created by Travel Chu on 11/6/17.
//  Copyright © 2017 Travel Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
- (NSInvocation *)invocationWithSelector:(SEL)selector;

@end
