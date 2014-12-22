//
//  RegisterVC.m
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import "RegisterVC.h"
#import "NSString+Validation.h"
#import "Utilities.h"
@interface RegisterVC ()
{
    NSMutableArray *usersArray;
}

@end

@implementation RegisterVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == _txtPhoneNumber)
        _datePicker.hidden = YES;
    
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField == _txtDateOfBirth)
    {
        _datePicker.hidden = NO;
        [_currentField resignFirstResponder];
    }
    else if (textField == _txtGender)
    {
        _datePicker.hidden = YES;
    }

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _currentField  = textField;
    if(textField == _txtGender)
        _pickerView.hidden = NO;
    else if (textField == _txtDateOfBirth)
    {
        _pickerView.hidden = YES;
        _picker.hidden     = YES;
        [_currentField resignFirstResponder];
        _datePicker.hidden = NO;
    }
    
    return YES;
}
- (BOOL) textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)textEntered
{
    if(textField == _txtPhoneNumber)
    {
        NSUInteger currentLength = textField.text.length;
        NSCharacterSet *numbers = [NSCharacterSet decimalDigitCharacterSet];
        if (range.length == 1)
        {
            return YES;
        }
        if ([numbers characterIsMember:[textEntered characterAtIndex:0]])
        {
            if ( currentLength == 3 )
            {
                if (range.length != 1)
                {
                    NSString *firstThreeDigits = [textField.text substringWithRange:NSMakeRange(0, 3)];
                    NSString *updatedText;
                    if ([textEntered isEqualToString:@"-"])
                    {
                        updatedText = [NSString stringWithFormat:@"%@",firstThreeDigits];
                    }
                    else
                    {
                        updatedText = [NSString stringWithFormat:@"%@-",firstThreeDigits];
                    }
                    [textField setText:updatedText];
                }
            }
            else if ( currentLength > 3 && currentLength < 8 )
            {
                if ( range.length != 1 )
                {
                    NSString *firstThree = [textField.text substringWithRange:NSMakeRange(0, 3)];
                    NSString *dash = [textField.text substringWithRange:NSMakeRange(3, 1)];
                    
                    NSUInteger newLenght = range.location - 4;
                    
                    NSString *nextDigits = [textField.text substringWithRange:NSMakeRange(4, newLenght)];
                    
                    NSString *updatedText = [NSString stringWithFormat:@"%@%@%@",firstThree,dash,nextDigits];
                    
                    [textField setText:updatedText];
                }
            }
            else if ( currentLength == 8 )
            {
                if ( range.length != 1 )
                {
                    NSString *areaCode = [textField.text substringWithRange:NSMakeRange(0, 3)];
                    
                    NSString *firstThree = [textField.text substringWithRange:NSMakeRange(4, 3)];
                    
                    NSString *nextDigit = [textField.text substringWithRange:NSMakeRange(7, 1)];
                    
                    [textField setText:[NSString stringWithFormat:@"%@-%@-%@",areaCode,firstThree,nextDigit]];
                }
            }
            NSUInteger proposedNewLength = textField.text.length - range.length + textEntered.length;
            if (proposedNewLength > 12) return NO;
            return YES;
        }
        else
        {
            return NO;
        }
        return YES;
    }
    return YES;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(row == 0)
      return @"Male";
    else
      return @"Female";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(row == 0)
       _genderString =  @"Male";
    else
       _genderString = @"Female";
}

- (IBAction)datePickertapped:(id)sender {
    
    NSDateFormatter  *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    _txtDateOfBirth.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:_datePicker.date]];
}

-(IBAction)submitButtonTapped:(id)sender
{
    if(![NSString isNullOrEmpty:_txtFirstName.text] && ![NSString isNullOrEmpty:_txtLastName.text] && ![NSString isNullOrEmpty:_txtGender.text] && ![NSString isNullOrEmpty:_txtEmail.text] && ![NSString isNullOrEmpty:_txtDateOfBirth.text] && ![NSString isNullOrEmpty:_txtPhoneNumber.text] && ![NSString isNullOrEmpty:_txtPassword.text] && ![NSString isNullOrEmpty:_txtConfirmPassword.text])
    {

        if([NSString validateEmailWithString:_txtEmail.text])
        {
            if([_txtPassword.text isEqualToString:_txtConfirmPassword.text])
            {
                NSMutableDictionary   *userDetailsDic = [[NSMutableDictionary alloc]init];
                [userDetailsDic setValue:_txtFirstName.text forKey:@"firstname"];
                [userDetailsDic setValue:_txtLastName.text forKey:@"lastname"];
                [userDetailsDic setValue:_txtEmail.text forKey:@"email"];
                [userDetailsDic setValue:_txtGender.text forKey:@"gender"];
                [userDetailsDic setValue:_txtDateOfBirth.text forKey:@"dateofbirth"];
                [userDetailsDic setValue:_txtPassword.text forKey:@"password"];
                [userDetailsDic setValue:_txtConfirmPassword.text forKey:@"confirmPassword"];
                [userDetailsDic setValue:_txtPhoneNumber.text forKey:@"phonenumber"];
                
                [usersArray addObject:userDetailsDic];
                if([[NSUserDefaults standardUserDefaults]objectForKey:@"UserDefaults"])
                {
                    NSMutableArray  *defaultsArray  = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserDefaults"];
                    for (int i=0; i<defaultsArray.count; i++)
                        [usersArray addObject:[defaultsArray objectAtIndex:i]];
                }
                [[NSUserDefaults standardUserDefaults]setObject:usersArray forKey:@"UserDefaults"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                NSLog(@"UserDefaults %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"UserDefaults"]);
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
               [Utilities message:@"Both Passwords should be same" withTitle:@"Invalid Password Match"];
        }
        else
            [Utilities message:@"Please enter valid email" withTitle:@"Invalid Email"];
    }
    else
      [Utilities message:@"Required Field Cannot be blank" withTitle:@"Invalid Data"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    usersArray = [[NSMutableArray alloc]init];
    self.title = @"Registeration View";
    _txtGender.inputView = _pickerView;
    _datePicker.hidden=YES;
   // _txtDateOfBirth.inputView = _pickerView;
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_currentField resignFirstResponder];
    if(_currentField == _txtGender)
        _txtGender.text = _genderString;
    else if (_currentField == _txtDateOfBirth)
    {
        _datePicker.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
