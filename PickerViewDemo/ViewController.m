//
//  ViewController.m
//  PickerViewDemo
//
//  Created by Hu Aihong on 15-8-10.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize  selectPicker,textField,doneToolbar;
#define kFirstComponent 0
#define kSubComponent 1

- (void)viewDidLoad {
    [super viewDidLoad];
    //Use codes to create Picker and Toolbar
    pickerArray = [NSArray arrayWithObjects:@"动物",@"植物",@"石头",@"天空",@"动物",@"植物",@"石头",@"天空",@"动物",@"植物",@"石头",@"天空", nil];
    dicPicker = [NSDictionary dictionaryWithObjectsAndKeys:
                 [NSArray arrayWithObjects:@"鱼",@"鸟",@"虫子",            nil], @"动物",
                 [NSArray arrayWithObjects:@"花",@"草",@"葵花",            nil], @"植物",
                 [NSArray arrayWithObjects:@"疯狂的石头",@"花岗岩",@"鹅卵石", nil], @"石头",nil];
    selectPicker = [[UIPickerView alloc] init];
    selectPicker.delegate = self;
    selectPicker.dataSource = self;
  
    textField.inputView = selectPicker;
    doneToolbar = [[UIToolbar alloc] init];
    doneToolbar.frame = CGRectMake(0, 60, 320, 38);
    doneToolbar.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(selectButton)];
    [doneBtn setTintColor:[UIColor blueColor]];
    UIBarButtonItem *spaceBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    doneToolbar.items=@[spaceBtn,doneBtn];
    textField.inputAccessoryView = doneToolbar;
  
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


//判断是那个齿轮，返回相应的数据的Count。
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == kFirstComponent){
        return [pickerArray count];
    }else {
        return [subPickerArray count];
    }
    
}

//根据component返回相应的String数据
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == kFirstComponent){
        return [pickerArray objectAtIndex:row];
    }else {
        return [subPickerArray objectAtIndex:row];
    }
}

//拖动左边的齿轮时，右边的数据相应的Reload更新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"TestComponent%d",component);
    if (component == kFirstComponent) {
        subPickerArray = [dicPicker objectForKey:[pickerArray objectAtIndex:row]];
        [pickerView selectRow:0 inComponent:kSubComponent animated:YES];
        [pickerView reloadComponent:kSubComponent];
    }
}

//相应选择的数据，并显示在TextField上
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger firstViewRow = [selectPicker selectedRowInComponent:kFirstComponent];
    NSInteger subViewRow = [selectPicker selectedRowInComponent:kSubComponent];
    NSString * firstString = [pickerArray objectAtIndex:firstViewRow];
    NSString * subString =  [[dicPicker objectForKey:[pickerArray objectAtIndex:firstViewRow]] objectAtIndex:subViewRow] ;
    NSString *textString = [[NSString alloc ] initWithFormat:@"您选择了：%@%@%@", firstString, @" 里的 ", subString];
    self.textField.text = textString;
}
/*
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
   
    NSInteger row = [selectPicker selectedRowInComponent:0];
    self.textField.text = [pickerArray objectAtIndex:row];
}
*/

- (IBAction)selectButton{
    [textField endEditing:YES];
} 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
