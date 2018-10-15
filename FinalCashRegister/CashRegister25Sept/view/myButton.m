//
//  myButton.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "myButton.h"

@implementation myButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = self.frame.size.height/3;
    self.clipsToBounds = YES;
}


@end
