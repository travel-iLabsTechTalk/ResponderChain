//
//  ResponderChainCell.m
//  ResponderChain
//
//  Created by Travel Chu on 11/7/17.
//  Copyright © 2017 Travel Chu. All rights reserved.
//

#import "ResponderChainCell.h"
#import "UIResponder+Router.h"

extern NSString *const RCButtonEvent;

@implementation ResponderChainCell

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if ([eventName isEqualToString:RCButtonEvent]) {
        
        NSMutableDictionary *decoratorUserInfo = userInfo.mutableCopy;
        NSString *buttonName = userInfo[@"Button Name"];
        if ([buttonName isEqualToString:@"Mountain"]) {
            decoratorUserInfo[@"ResponderChainCell added"] = @"Mountain, a natural upward projection of the earth's surface.";
        } else if ([buttonName isEqualToString:@"Road"]) {
            decoratorUserInfo[@"ResponderChainCell added"] = @"Hit the road!";
        } else if ([buttonName isEqualToString:@"Girl"]) {
            decoratorUserInfo[@"ResponderChainCell added"] = @"Pretty!";
        }
        //we want the event pass up
        [super routerEventWithName:eventName userInfo:decoratorUserInfo];
    }

    //if we want the event pass up
//    [super routerEventWithName:eventName userInfo:userInfo];
}

@end
