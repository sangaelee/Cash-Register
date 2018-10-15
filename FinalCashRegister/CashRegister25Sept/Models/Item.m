//
//  Item.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "Item.h"

@implementation Item
//constructor initiation
-(instancetype)initWithName:(NSString *)name andQty:(int) qty andPrice:(double)price{
    if(self) {
        _name = name;
        _qty = qty;
        _price = price;
    }
    return self;
}
//setting getter
-(int) getQty {
    return _qty;
}

-(double) getPrice {
    return _price;
    
}

-(NSString *)getName {
    return _name;
}

@end
