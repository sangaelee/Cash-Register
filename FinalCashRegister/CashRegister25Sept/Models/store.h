//
//  store.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
@interface store : NSObject
//declaration of Mutable arrays of items and history
@property (nonatomic, strong) NSMutableArray *Inventory;
@property (nonatomic, strong) NSMutableArray *HistoryArray;
//method Declaration
-(void)buyItem:(int)index andQty:(int)qty;
-(void)addItem:(int)index andQty:(int)qty;
@end
