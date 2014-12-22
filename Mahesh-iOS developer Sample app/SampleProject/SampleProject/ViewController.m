//
//  ViewController.m
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "RegisterVC.h"
#import "LoanDetailVC.h"
#import "Utilities.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)LoadData
{
    NSString *urlstr  = [NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"];
    NSURL   *url      =  [NSURL URLWithString:urlstr];
    
    NSData  *responseData = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:url] returningResponse:nil error:nil];
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
    
    NSLog(@"response data %@",jsonDic);
    _loansArray        = [jsonDic objectForKey:@"loans"];
    _loansTableView.dataSource  = self;
    _loansTableView.delegate    = self;
    [_loansTableView reloadData];
    [_HUD hide:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title= @"Home";

    _HUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:_HUD];
    [_HUD showWhileExecuting:@selector(LoadData) onTarget:self withObject:nil animated:YES];
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];

    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];

    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc]initWithTitle:@"Register" style:UIBarButtonItemStylePlain target:self action:@selector(registerTapped)];
    self.navigationItem.leftBarButtonItem   = revealButtonItem;
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)registerTapped
{
    UIStoryboard   *storyboard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegisterVC     *registerVC  = [storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    [self.navigationController pushViewController:registerVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _loansArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell   *cell  = [tableView dequeueReusableCellWithIdentifier:nil];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UILabel *nameLabel    = [[UILabel alloc]initWithFrame:CGRectMake(5, 2,250,25)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font        = [UIFont boldSystemFontOfSize:16];
    nameLabel.text        = [NSString stringWithFormat:@" Name: %@",[[_loansArray objectAtIndex:indexPath.row]objectForKey:@"name"]];
    [cell.contentView addSubview:nameLabel];

    UILabel *idLabel      = [[UILabel alloc]initWithFrame:CGRectMake(5, 29,250,25)];
    idLabel.backgroundColor = [UIColor clearColor];
    idLabel.font          = [UIFont boldSystemFontOfSize:16];
    idLabel.text          = [NSString stringWithFormat:@" Id: %@",[NSString stringWithFormat:@"%@",[[_loansArray objectAtIndex:indexPath.row]objectForKey:@"id"]]];
    [cell.contentView addSubview:idLabel];
    
    UILabel *statusLabel  = [[UILabel alloc]initWithFrame:CGRectMake(5,56,250,25)];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.font      = [UIFont boldSystemFontOfSize:16];
    statusLabel.text      = [NSString stringWithFormat:@" Status: %@",[[_loansArray objectAtIndex:indexPath.row]objectForKey:@"status"]];
    [cell.contentView addSubview:statusLabel];
    
    UILabel *expiryDateLabel  = [[UILabel alloc]initWithFrame:CGRectMake(450,29,260,33)];
    expiryDateLabel.backgroundColor = [UIColor clearColor];
    expiryDateLabel.font      = [UIFont boldSystemFontOfSize:14];
    expiryDateLabel.numberOfLines = 2;
    expiryDateLabel.text      = [NSString stringWithFormat:@" Expiry Date: %@",[[_loansArray objectAtIndex:indexPath.row]objectForKey:@"planned_expiration_date"]];
    [cell.contentView addSubview:expiryDateLabel];
    
    if (indexPath.row % 2) {
        cell.contentView.backgroundColor = [UIColor brownColor];
    } else {
        cell.contentView.backgroundColor = [[UIColor alloc]initWithRed:187.0/255.0 green:184.0/255.0 blue:229.0/255.0 alpha:1];
    }

    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoanDetailVC  *loanDetailVC = [Utilities.storyboard instantiateViewControllerWithIdentifier:@"LoanDetailVC"];
    loanDetailVC.loandetailsDic = [_loansArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:loanDetailVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
