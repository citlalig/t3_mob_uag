//
//  TableViewCell1.h
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/17/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell1 : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblCharacter;

@property (strong, nonatomic) IBOutlet UIButton *btnShareItem;

- (IBAction)btnShareItemPressed:(id)sender;

@end
