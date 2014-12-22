//
//  RegisterVC.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) NSString *genderString;
@property (strong, nonatomic) UITextField *currentField;
@property (strong, nonatomic) IBOutlet UIView *pickerView;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtGender;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtDateOfBirth;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)datePickertapped:(id)sender;
-(IBAction)submitButtonTapped:(id)sender;
@end
