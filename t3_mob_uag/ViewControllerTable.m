//
//  ViewControllerTable.m
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/17/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "ViewControllerTable.h"
#import "TableViewCell1.h"

@interface ViewControllerTable ()

@end

NSMutableArray *maNames;

@implementation ViewControllerTable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     maNames = [NSMutableArray arrayWithObjects: @"Thorin Oakenshield", @"Fili", @"Kili", @"Balin", @"Dwalin",
               @"Oin",  @"Gloin", @"Ori", @"Dori", @"Nori",  @"Bifur", @"Bofur", @"Bombur",  nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCell1";
    
    TableViewCell1 *cell = (TableViewCell1 *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[TableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblCharacter.text = maNames[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (IBAction)btnSharePressed:(id)sender {
    NSLog(@"Shared!");
    
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat: @"Shared from iOS App: %@", [maNames componentsJoinedByString:@", "]];
    
    imgShare    = [UIImage imageNamed:@"dwarves.jpg"];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];

}
@end
