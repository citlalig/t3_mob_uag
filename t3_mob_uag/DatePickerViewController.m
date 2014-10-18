//
//  DatePickerViewController.m
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/18/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnSharePressed:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat: @"Shared from iOS App: %@",  self.DiffValue.text ];
    aShareItems = @[strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}


- (IBAction)btnSeeAction:(id)sender {
    NSLocale *usLocale = [[NSLocale alloc]
                          initWithLocaleIdentifier:@"en_US"];
    
    NSDate *date1 = [self.pickr1 date];
    
    NSDate *date2 = [self.pickr2 date];
    NSString *strMsg;
    
    if ([date1 compare:date2] == NSOrderedSame) {
        strMsg = @"Dates are equal";
    }
    if ([date1 laterDate:date2] == date1) {
        strMsg = @"date 1 is LATER than date 2";
    } else {
        strMsg = @"date 1 is EARLIER than date 2";
    }
    
    NSLog(@"%f", [date1 timeIntervalSinceDate:date2]);
    
    self.DiffValue.text = strMsg;
    self.DiffValue.adjustsFontSizeToFitWidth = YES;

}
@end
