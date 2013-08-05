//
//  TempConverterViewController.m
//  TempConverter
//
//  Created by Mike Madick on 7/29/13.
//  Copyright (c) 2013 Mike Madick. All rights reserved.
//

// FIXME -
// - why cant' do if (self.tempTag == FIELD_ONE_TAG) ???
// - change button to green, how? Why button move up when I run app?
// - is tags the way to determine which UITextField ?

#import "TempConverterViewController.h"
#define FIELD_ONE_TAG 1;
#define FIELD_TWO_TAG 2;

@interface TempConverterViewController ()

@property (nonatomic) int tempTag;

@end

@implementation TempConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temp Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fahTempField.delegate = self;
    self.fahTempField.tag = FIELD_ONE_TAG;
    self.celTempField.delegate = self;
    self.celTempField.tag = FIELD_TWO_TAG;
    [self.convertButton addTarget:self action:@selector(convertTemp) forControlEvents:UIControlEventTouchUpInside];
//    [self.convertButton addTarget:self action:@selector(convertTemp) forControlEvents:UIControlEventValueChanged];
//    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextField delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton)];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    NSLog(@"end editing %d", textField.tag);
    self.tempTag = textField.tag;
    return YES;
}

#pragma mark - private methods
-(void)onDoneButton {
    [self.view endEditing:YES];
}
-(void)convertTemp {
    float far1 = [self.fahTempField.text floatValue];
    float cel1 = [self.celTempField.text floatValue];
    

    NSLog(@"%f %f",far1, cel1);
    // determine which is source
    NSLog(@"tag: %d",self.tempTag);
    // C x 9/5 + 32 = °F. (°F - 32) x 5/9 = °C
    
    if (self.tempTag == self.fahTempField.tag) {
        float cVal = (far1 - 32) * 5/9;
        self.celTempField.text = [NSString stringWithFormat:@"%f", cVal];
    }
    else if (self.tempTag == self.celTempField.tag) {
        float fVal = (cel1 * 9/5) + 32;
        self.fahTempField.text = [NSString stringWithFormat:@"%f", fVal];
    }
    
}
@end
