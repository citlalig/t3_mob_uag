//
//  PickerViewController.m
//  t3_mob_uag
//
//  Created by Citlali Garcia on 10/18/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

NSMutableArray *maAerolineas;
NSMutableArray *maOrigen;
NSMutableArray *maDestino;

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    maAerolineas = [NSMutableArray arrayWithObjects: @"Viva Aerobus", @"Volaris", @"Interjet", @"Aeromexico", @"Magnicharters",  nil];
    maOrigen = [NSMutableArray arrayWithObjects: @"Culiacán", @"Zapopan", @"Guadalajara", @"Veracruz", @"DF",  nil];
    maDestino = [NSMutableArray arrayWithObjects: @"Puebla", @"Mazatlán", @"Tepic", @"Monterrey", @"Oaxaca",  nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareAction:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat: @"Shared from iOS App: Flying from %@ to %@ with %@",  self.lblOrigenValue.text , self.lblDestinoValue.text, self.lblAerolineaValue.text ];
    
    imgShare    = [UIImage imageNamed:@"avion.jpg"];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}

- (IBAction)seeAction:(id)sender {
    NSLog(@"see Action %d %d %d", [self.pckrView selectedRowInComponent:0], [self.pckrView selectedRowInComponent:1], [self.pckrView selectedRowInComponent:2]);
    self.lblAerolineaValue.text = [maAerolineas objectAtIndex:[self.pckrView selectedRowInComponent:0]];
    self.lblOrigenValue.text = [maOrigen objectAtIndex:[self.pckrView selectedRowInComponent:1]];
    self.lblDestinoValue.text = [maDestino objectAtIndex:[self.pckrView selectedRowInComponent:2]];
}


#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    switch (component) {
        case 0:
            return maAerolineas[row];
        case 1:
            return maOrigen[row];
        case 2:
            return maDestino[row];
    }
    return nil;
}


#pragma mark -
#pragma mark PickerView Delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            //do something
            NSLog(@"Row 1");
            pickerView.tintColor = [UIColor redColor];
            break;
        case 1:
            //do something else
            NSLog(@"Row 2");
            pickerView.tintColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

@end
