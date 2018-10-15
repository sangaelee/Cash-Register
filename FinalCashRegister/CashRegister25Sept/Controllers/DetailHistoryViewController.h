//
//  DetailHistoryViewController.h
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHistoryViewController : UIViewController
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int qty;
@property (nonatomic) double total;
@property (nonatomic, strong) NSDate *date;
@end
