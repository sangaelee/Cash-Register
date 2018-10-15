//
//  DetailHistoryViewController.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-26.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "DetailHistoryViewController.h"

@interface DetailHistoryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *qtyLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailHistoryViewController

// method when pressed Done button
- (IBAction)DonePressed {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameLabel.text = self.name;
    self.qtyLabel.text = [NSString stringWithFormat:@"%d",self.qty];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f",self.total];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //set the dateFormatter Format
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //get the date time in NSString
    NSString *dateString=[dateFormatter stringFromDate:self.date];
    self.dateLabel.text = dateString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
