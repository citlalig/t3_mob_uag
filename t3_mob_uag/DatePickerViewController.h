//
//  DatePickerViewController.h
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/18/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *pickr1;
@property (strong, nonatomic) IBOutlet UIDatePicker *pickr2;
@property (strong, nonatomic) IBOutlet UILabel *Diff;
@property (strong, nonatomic) IBOutlet UILabel *DiffValue;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;
@property (strong, nonatomic) IBOutlet UIButton *btnSee;
- (IBAction)btnSharePressed:(id)sender;
- (IBAction)btnSeeAction:(id)sender;

@end
