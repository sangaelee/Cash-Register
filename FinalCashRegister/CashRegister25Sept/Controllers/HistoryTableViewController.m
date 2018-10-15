//
//  HistoryTableViewController.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "History.h"
#import "DetailHistoryViewController.h"
@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//returns number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//returns number of rows in setion
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.hisArray.count;
}

//Displays data in rows
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    History *myItem = [self.hisArray objectAtIndex:indexPath.row];
    cell.textLabel.text=myItem.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",myItem.qty];
    // Configure the cell...
    
    return cell;
}

//to move data from History view controller to detailHistory view controller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detail"]){
        DetailHistoryViewController * DVC=segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        History *myItem = [self.hisArray objectAtIndex:indexPath.row];
        NSLog(@"%@",myItem.name);
        //no need of initialization.
        DVC.name = myItem.name;
        DVC.qty = myItem.qty;
        DVC.total= myItem.price;
        DVC.date = myItem.date;
        
    }
}


@end
