//
//  ViewControllerTable.h
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/17/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerTable : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnShareAll;

- (IBAction)btnSharePressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tblCharacters;

@end
