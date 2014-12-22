//
//  MenuVC.h
//  DSCatlog
//
//  Created by Nagabhushana Rao Vaddi on 12/12/14.
//  Copyright (c) 2014 Crystal Logic Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
 NSInteger _presentedRow;
}
@property (strong, nonatomic) IBOutlet UITableView *menuTable;

@end
