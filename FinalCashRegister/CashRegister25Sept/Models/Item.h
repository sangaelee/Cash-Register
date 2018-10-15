//
//  Item.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property(nonatomic,strong)NSString *name;
@property int qty;
@property double price;
//constructor for Item class
-(instancetype)initWithName:(NSString *)name andQty:(int) qty andPrice:(double)price;
//getter for items
-(int) getQty;
-(double) getPrice;
-(NSString *) getName;
@end
