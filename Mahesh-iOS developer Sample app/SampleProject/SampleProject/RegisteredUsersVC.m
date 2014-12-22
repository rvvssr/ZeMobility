//
//  RegisteredUsersVC.m
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 21/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import "RegisteredUsersVC.h"
#import "SWRevealViewController.h"
@interface RegisteredUsersVC ()
{
    NSMutableArray *usersArray;
}
@end

@implementation RegisteredUsersVC

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
    return usersArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell   *cell  = [tableView dequeueReusableCellWithIdentifier:nil];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UILabel *nameLabel    = [[UILabel alloc]initWithFrame:CGRectMake(5, 2,250,25)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font        = [UIFont boldSystemFontOfSize:16];
    nameLabel.text        = [NSString stringWithFormat:@" Name: %@ %@",[[usersArray objectAtIndex:indexPath.row]objectForKey:@"firstname"],[[usersArray objectAtIndex:indexPath.row]objectForKey:@"lastname"]];
    [cell.contentView addSubview:nameLabel];
    
    UILabel *idLabel      = [[UILabel alloc]initWithFrame:CGRectMake(5, 29,600,25)];
    idLabel.backgroundColor = [UIColor clearColor];
    idLabel.font          = [UIFont boldSystemFontOfSize:16];
    idLabel.text          = [NSString stringWithFormat:@" Email Id: %@",[NSString stringWithFormat:@"%@",[[usersArray objectAtIndex:indexPath.row]objectForKey:@"email"]]];
    [cell.contentView addSubview:idLabel];
    
    UILabel *statusLabel  = [[UILabel alloc]initWithFrame:CGRectMake(5,56,250,25)];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.font      = [UIFont boldSystemFontOfSize:16];
    statusLabel.text      = [NSString stringWithFormat:@" Phone No: %@",[[usersArray objectAtIndex:indexPath.row]objectForKey:@"phonenumber"]];
    [cell.contentView addSubview:statusLabel];
    
    UILabel *expiryDateLabel  = [[UILabel alloc]initWithFrame:CGRectMake(450,29,260,33)];
    expiryDateLabel.backgroundColor = [UIColor clearColor];
    expiryDateLabel.font      = [UIFont boldSystemFontOfSize:14];
    expiryDateLabel.numberOfLines = 2;
    expiryDateLabel.text      = [NSString stringWithFormat:@" Date of birth: %@",[[usersArray objectAtIndex:indexPath.row]objectForKey:@"dateofbirth"]];
    [cell.contentView addSubview:expiryDateLabel];
    
    if (indexPath.row % 2) {
        cell.contentView.backgroundColor = [UIColor brownColor];
    } else {
        cell.contentView.backgroundColor = [[UIColor alloc]initWithRed:8/255.0 green:139/255.0 blue:190/255.0 alpha:1];
    }
    
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title  = @"New Users";
    usersArray  = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserDefaults"];
    [usersTableView reloadData];
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem   = revealButtonItem;
	// Do any additional setup after loading the view, typically from a nib.

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
