//
//  WidgetView.m
//  ResponderChain
//
//  Created by Travel Chu on 11/6/17.
//  Copyright © 2017 Travel Chu. All rights reserved.
//

#import "WidgetView.h"
#import "UIResponder+Router.h"

extern NSString *const RCButtonEvent;

@interface WidgetView ()
@property (nonatomic) BOOL isViewLoadedFromNib;
@property (strong, nonatomic) IBOutlet WidgetView *view;
@end

@implementation WidgetView

- (void)loadViewFromNib {
    if (!self.isViewLoadedFromNib) {
        [[NSBundle mainBundle] loadNibNamed:@"WidgetView" owner:self options:nil];
        [self addSubview:self.view];
        self.isViewLoadedFromNib = YES;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromNib];
        CGRect viewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.view.frame = viewFrame;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self routerEventWithName:RCButtonEvent userInfo:@{@"Button Name" : [sender titleForState:UIControlStateNormal]}];
}


@end
