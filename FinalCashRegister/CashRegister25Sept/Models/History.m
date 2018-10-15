//
//  History.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "History.h"

@implementation History
//constructor Initiation
-(instancetype)initWithName:(NSString *)name andQty:(int)qty andPrice:(double)price andDate:(NSDate *)date{
    self=[super initWithName:name andQty:qty andPrice:price];
    if(self){
    _date=date;
    }
    return self;
}
@end
