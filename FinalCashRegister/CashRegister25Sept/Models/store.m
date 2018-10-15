//
//  store.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "store.h"
#import "Item.h"
#import "History.h"

@implementation store
//Array Initialation
-(NSMutableArray*)Inventory{
    if(_Inventory==nil){
        Item *i1 = [[Item alloc]initWithName:@"pants" andQty:20 andPrice:22.99];
        Item *i2 = [[Item alloc]initWithName:@"shirts" andQty:30 andPrice:32.99];
        Item *i3 = [[Item alloc]initWithName:@"jacket" andQty:20 andPrice:105.99];
        Item *i4 = [[Item alloc]initWithName:@"socks" andQty:100 andPrice:5.99];
        Item *i5 = [[Item alloc]initWithName:@"glasses" andQty:30 andPrice:50.99];
        Item *i6 = [[Item alloc]initWithName:@"hat" andQty:10 andPrice:26.99];
        Item *i7=[[Item alloc]initWithName:@"shoes" andQty:10 andPrice:74.99];
       
        _Inventory= [[NSMutableArray alloc]initWithObjects:i1,i2,i3,i4,i5,i6,i7,nil];
        
    }
         return _Inventory;
}
//Initiation of History Array
-(NSMutableArray*)HistoryArray{
    if(_HistoryArray==nil){
        _HistoryArray=[[NSMutableArray alloc]init];
    }
    return _HistoryArray;
}
//Buy method Implementation
-(void)buyItem:(int)index andQty:(int)qty{
    Item *xItemChoose = self.Inventory[index];
    [xItemChoose setQty:[xItemChoose getQty] - qty];//update quantity
    
    NSDate *currentDate=[NSDate date];//get the current date
    
    double price = qty * [xItemChoose getPrice]; // get the total cost
    
    //create history of bought items
    History *myHistory=[[History alloc] initWithName:[xItemChoose getName] andQty:qty andPrice:price andDate:currentDate];
    
    [self.HistoryArray addObject:myHistory];//update historyTable
}
//AddItem method implementation
-(void)addItem:(int)index andQty:(int)qty{
    NSLog(@"addItem");
    Item *xItemChoose = self.Inventory[index];
    [xItemChoose setQty:[xItemChoose getQty] + qty];
    NSLog(@"%@ %d",[xItemChoose name],[xItemChoose qty]);
}


@end
