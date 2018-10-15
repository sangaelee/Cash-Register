//
//  RestockViewController.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "RestockViewController.h"
#import "Item.h"
#import "store.h"
@interface RestockViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic,strong) Item *pickItem;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UITextField *restockTxt;
@property (weak, nonatomic) IBOutlet UITableView *thisTableView;
@end
@implementation RestockViewController
int selectRow = 0;

//method when pressed Cancel button
- (IBAction)CancelPressed {
    [self.view endEditing:YES];//dissappear keyboard
    self.restockTxt.text=@"";
}

//method when pressed Ok button
- (IBAction)OkPressed {
    int changeQty = [self.restockTxt.text intValue];
    [self.myStore addItem:selectRow andQty:changeQty];//update items
    //refresh table view data
    [self.thisTableView beginUpdates];
    [self.thisTableView reloadData];
    [self.thisTableView endUpdates];
    self.restockTxt.text=@"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//override tableview method
//returns numbers of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//returns number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restockArray.count;
}

//Displays data in rows
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    Item *myItem = [self.restockArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %d price :%.2f" ,myItem.name,myItem.qty, myItem.price];
    return cell;
}
//selection of specific row
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectRow = (int)indexPath.row;
    self.pickItem = [self.restockArray objectAtIndex:selectRow];
    self.itemLabel.text = self.pickItem.name;
}
@end
