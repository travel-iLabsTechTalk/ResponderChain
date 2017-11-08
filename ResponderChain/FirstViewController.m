//
//  FirstViewController.m
//  ResponderChain
//
//  Created by Travel Chu on 11/6/17.
//  Copyright © 2017 Travel Chu. All rights reserved.
//

#import "FirstViewController.h"
#import "UIResponder+Router.h"

extern NSString *const RCButtonEvent;

@interface FirstViewController ()
@property (nonatomic, strong) NSDictionary <NSString *, NSInvocation *> *eventStrategy;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy {
    if (!_eventStrategy) {
        _eventStrategy = @{
                           RCButtonEvent : [self invocationWithSelector:@selector(buttonEvent:)]
                           };
    }
    return _eventStrategy;
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    //1
    NSString *message = [NSString stringWithFormat:@"Event Name: %@,\nUser Info: %@", eventName, userInfo];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Responder Chain" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
    if ([eventName isEqualToString:RCButtonEvent]) {

    }

    //2
//    NSInvocation *invocation = self.eventStrategy[eventName];
//    [invocation setArgument:&userInfo atIndex:2];
//    [invocation invoke];

    //3
//    [self.eventProxy handleEvent:eventName userInfo:userInfo];
}

- (void)buttonEvent:(NSDictionary *)userInfo {
    NSString *message = [NSString stringWithFormat:@"Event Name: %@,\nUser Info: %@", RCButtonEvent, userInfo];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Responder Chain" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
