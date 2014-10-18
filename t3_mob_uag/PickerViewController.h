//
//  PickerViewController.h
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/18/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblAerolinea;
@property (strong, nonatomic) IBOutlet UILabel *lblAerolineaValue;
@property (strong, nonatomic) IBOutlet UILabel *lblOrigen;
@property (strong, nonatomic) IBOutlet UILabel *lblOrigenValue;
@property (strong, nonatomic) IBOutlet UILabel *lblDestino;
@property (strong, nonatomic) IBOutlet UILabel *lblDestinoValue;
@property (strong, nonatomic) IBOutlet UIButton *btnSee;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;
- (IBAction)shareAction:(id)sender;
- (IBAction)seeAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *pckrView;

@end
