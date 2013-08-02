//
//  TempConverterViewController.h
//  TempConverter
//
//  Created by Mike Madick on 7/29/13.
//  Copyright (c) 2013 Mike Madick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempConverterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *fahTempField;
@property (nonatomic,weak) IBOutlet UITextField *celTempField;
@property (nonatomic,weak) IBOutlet UIButton *convertButton;

- (IBAction)onDoneButton;

@end
