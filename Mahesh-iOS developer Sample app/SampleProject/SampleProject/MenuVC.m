//
//  MenuVC.m
//  DSCatlog
//
//  Created by Nagabhushana Rao Vaddi on 12/12/14.
//  Copyright (c) 2014 Crystal Logic Pvt. Ltd. All rights reserved.
//

#import "MenuVC.h"
#import "ViewController.h"
#import "SWRevealViewController.h"
#import "Utilities.h"
@interface MenuVC ()

{
    NSArray *menuArray,*imageArray;
}
@end

@implementation MenuVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.font     = [UIFont boldSystemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text     = @"Menu";
    self.navigationItem.titleView = titleLabel;
    menuArray = [[NSArray alloc]initWithObjects:@"Home",@"Registered Users", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma marks Tableview Delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
        return [menuArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = menuArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.menuTable.contentInset = UIEdgeInsetsMake(30, 0,30, 0);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealController = self.revealViewController;
    
    // selecting row
    NSInteger row = indexPath.row;
    UIViewController *newFrontController = nil;
    
    if(row == 1)
      newFrontController = [Utilities.storyboard instantiateViewControllerWithIdentifier:@"RegisteredUsersVC"];
    else
      newFrontController = [Utilities.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
 

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newFrontController];
    [revealController pushFrontViewController:navigationController animated:YES];
    
    _presentedRow = row;  // <- store the presented row
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
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
