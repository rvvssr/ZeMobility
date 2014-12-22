//
//  LoanDetailVC.m
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 21/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import "LoanDetailVC.h"

@interface LoanDetailVC ()
{
    NSArray *headderLabelsArray;
}

@end

@implementation LoanDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell   *cell  = [tableView dequeueReusableCellWithIdentifier:nil];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UILabel *headLabel    = [[UILabel alloc]initWithFrame:CGRectMake(20, 10,350,25)];
    headLabel.backgroundColor = [UIColor clearColor];
    headLabel.font        = [UIFont boldSystemFontOfSize:16];
    headLabel.text        = [headderLabelsArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:headLabel];
    
    UILabel *valueLabel   = [[UILabel alloc]initWithFrame:CGRectMake(375, 10,350,25)];
    valueLabel.backgroundColor = [UIColor clearColor];
    valueLabel.font       = [UIFont boldSystemFontOfSize:16];
    [cell.contentView addSubview:valueLabel];
    
    switch (indexPath.row) {
        case 0:
            valueLabel.text      = [_loandetailsDic objectForKey:@"name"];
            break;
        case 1:
            valueLabel.text      = [NSString stringWithFormat:@"%@",[_loandetailsDic objectForKey:@"id"]];
            break;
        case 2:
            valueLabel.text      = [NSString stringWithFormat:@"%@",[_loandetailsDic objectForKey:@"bonus_credit_eligibility"]];
            break;
        case 3:
            valueLabel.text      = [_loandetailsDic objectForKey:@"planned_expiration_date"];
            break;
        case 4:
            valueLabel.text      = [_loandetailsDic objectForKey:@"posted_date"];
            break;
        case 5:
            valueLabel.text      = [_loandetailsDic objectForKey:@"status"];
            break;
        case 6:
            valueLabel.text      = [NSString stringWithFormat:@"%@",[_loandetailsDic objectForKey:@"loan_amount"]];
            break;
        case 7:
            valueLabel.text      = [_loandetailsDic objectForKey:@"sector"];
            break;
        case 8:
            valueLabel.text      = [_loandetailsDic objectForKey:@"activity"];
            break;
        case 9:
            valueLabel.text      = [NSString stringWithFormat:@"%@",[_loandetailsDic objectForKey:@"partner_id"]];
            break;
        default:
            break;
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Loan Detail";
    headderLabelsArray  = [[NSArray alloc]initWithObjects:@"Name:",@"Id:",@"Bonus Credit:",@"Expiry Date:",@"Posted Date:",@"Status:",@"Loan Amount:",@"Sector:",@"Activity:",@"Partner Id:",nil];
    // Do any additional setup after loading the view.
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
