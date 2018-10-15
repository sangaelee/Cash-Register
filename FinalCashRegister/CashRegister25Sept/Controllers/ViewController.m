//
//  ViewController.m
//  CashRegister25Sept
//
//  Created by Harjinder on 2018-09-25.
//  Copyright © 2018 Harmanjeet. All rights reserved.
//

#import "ViewController.h"
#import "myButton.h"
#import "store.h"
#import "Item.h"
#import "History.h"
#import "ManagerViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *QtyLabel;

@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ItemNameLabel;

@property(nonatomic,strong) store *myModel;
@property (nonatomic,strong) Item *pickItem;
@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;
@property int buyQty;
@property int selectIndex;
@end

BOOL newNumber = YES;

@implementation ViewController

//Method when pressed Buy button
- (IBAction)buyPressed {
    //if quantity is out of range, display alert dialog box
    NSLog(@"buyqty=%d",self.buyQty);
    if(self.buyQty < 1 || self.buyQty >self.pickItem.qty) {
        [self showAlertMessage :@"Out of Range. Enter the number, again."];
    }
    else {
        //update myModel Qty.
        [self.myModel buyItem:self.selectIndex andQty:self.buyQty];
        //update pickerview info.
        [self.myPicker reloadAllComponents];
        self.buyQty = 0;
    }
    self.QtyLabel.text=@"";
    self.PriceLabel.text=@"";
    newNumber = YES;
}


//Method when pressed Number button
- (IBAction)numberPressed:(UIButton *)sender {
    if(newNumber){
        self.QtyLabel.text = (NSString *)sender.currentTitle;
        newNumber = NO;
    }
    else {//concatination of digits
      self.QtyLabel.text = [NSString stringWithFormat:@"%@%@ ",self.QtyLabel.text, sender.currentTitle];
    }
    //displays selected qty on screen
    NSString *displayNumber = self.QtyLabel.text;
    self.buyQty = [displayNumber intValue];//displays price
    self.PriceLabel.text =[NSString stringWithFormat:@"%.2f ", self.pickItem.price * self.buyQty];
}


// alloc & init Mymodel
-(store *)myModel{
    if(_myModel==nil)
        _myModel=[[store alloc]init];
    return _myModel;
}

// number of component in pickerview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//number of Row in pickerview
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.myModel.Inventory count];
}

// display info in pickerview
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Item *myItem = [self.myModel.Inventory objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ %d Price:%.2f",myItem.name, myItem.qty,myItem.price ];
}

//method When select the row of pickerview
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectIndex = (int)row;
    self.pickItem = [self.myModel.Inventory objectAtIndex:self.selectIndex];
    self.ItemNameLabel.text = self.pickItem.name;
    self.QtyLabel.text=@"";
    self.PriceLabel.text=@"";
}

//to move data from view controller to manager view controller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Manager"]){
        ManagerViewController * MVC=segue.destinationViewController;
        //no need of initialization.
        MVC.manageHisArray = self.myModel.HistoryArray;
        MVC.restockItem = self.myModel.Inventory;
        MVC.myStore = self.myModel;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//update pickerview info when return from other view.
-(void)viewWillAppear:(BOOL)animated {
    [self.myPicker reloadAllComponents];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//display Alert dialog box
-(void)showAlertMessage:(NSString *)msg {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"SORRY"                                                    message:msg                                                        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault                                                      handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}@end
