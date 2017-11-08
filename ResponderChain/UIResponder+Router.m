//
//  UIResponder+Router.m
//  ResponderChain
//
//  Created by Travel Chu on 11/6/17.
//  Copyright © 2017 Travel Chu. All rights reserved.
//

#import "UIResponder+Router.h"

NSString *const RCButtonEvent = @"RCButtonEvent";

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

- (NSInvocation *)invocationWithSelector:(SEL)selector {
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    return invocation;
}

@end
