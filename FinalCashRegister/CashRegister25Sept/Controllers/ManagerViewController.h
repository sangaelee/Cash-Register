//
//  ManagerViewController.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "History.h"
#import "store.h"
@interface ManagerViewController : UIViewController
@property(nonatomic,strong) NSMutableArray* manageHisArray;
@property(nonatomic,strong) NSMutableArray* restockItem;
@property(nonatomic,strong) store* myStore;
@end
