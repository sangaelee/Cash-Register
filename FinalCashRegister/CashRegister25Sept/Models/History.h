//
//  History.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "Item.h"

@interface History : Item
@property (nonatomic,strong)NSDate *date;
//constructor for History
-(instancetype)initWithName:(NSString *)name andQty:(int)qty andPrice:(double)price andDate:(NSDate *)date;
@end
