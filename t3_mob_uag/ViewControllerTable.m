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
    
     maNames = [NSMutableArray arrayWithObjects: @"Thorin", @"Fili", @"Kili", @"Balin", @"Dwalin",
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
    cell.imgCharacter.image = [UIImage imageNamed:[maNames[indexPath.row] stringByAppendingString:@".jpeg"]];
    cell.btnShareItem.tag = indexPath.row;
    [cell.btnShareItem addTarget:self action:@selector(shareItem:)
                forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)shareItem:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    TableViewCell1 *cell = [self.tblCharacters cellForRowAtIndexPath:indexPath];
    NSString *imgName = cell.lblCharacter.text;
    imgName = [imgName stringByAppendingString:@".jpeg"];
    [self shareWindow:cell.lblCharacter.text withImg:imgName];
}


- (IBAction)btnSharePressed:(id)sender {
    [self shareWindow:[maNames componentsJoinedByString:@", "] withImg:@"dwarves.jpg"];
}

- (void)shareWindow:(NSString*)strShareMsg withImg:(NSString*)strImgName {
    NSLog(@"Shared!");
    
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat: @"Shared from iOS App: %@", strShareMsg];
    
    imgShare    = [UIImage imageNamed:strImgName];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
    
}

@end
