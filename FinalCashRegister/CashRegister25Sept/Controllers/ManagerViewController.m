//
//  ManagerViewController.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "ManagerViewController.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"
@interface ManagerViewController ()

@end

@implementation ManagerViewController
//to move data from manager view controller to history/restock view controller using segue.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"History"]){
        HistoryTableViewController * HTV=segue.destinationViewController;
        HTV.hisArray = self.manageHisArray;
    }
    else if([segue.identifier isEqualToString:@"restock"]){
        RestockViewController * RVC=segue.destinationViewController;
        RVC.restockArray = self.restockItem;
        RVC.myStore = self.myStore;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
