//
//  RegisteredUsersVC.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 21/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteredUsersVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *usersTableView;
}
@end
