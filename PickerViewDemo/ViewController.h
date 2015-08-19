//
//  ViewController.h
//  PickerViewDemo
//
//  Created by Hu Aihong on 15-8-10.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController :UIViewController<UIPickerViewDelegate, UITextFieldDelegate,UIPickerViewDataSource>
{
    NSArray *pickerArray;
    NSArray *subPickerArray;
    NSDictionary *dicPicker;
}


@property (strong, nonatomic) IBOutlet UIToolbar *doneToolbar;

@property (strong, nonatomic) IBOutlet UIPickerView *selectPicker;
@property (strong, nonatomic) IBOutlet UITextField *textField; @end

