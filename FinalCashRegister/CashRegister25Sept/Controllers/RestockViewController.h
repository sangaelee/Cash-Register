//
//  RestockViewController.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "store.h"
@interface RestockViewController : UIViewController
@property(nonatomic,strong) NSMutableArray *restockArray;
@property(nonatomic,strong) store *myStore;
@end
