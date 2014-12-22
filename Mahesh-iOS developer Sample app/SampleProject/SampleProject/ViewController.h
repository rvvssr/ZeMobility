//
//  ViewController.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)MBProgressHUD *HUD;
@property(nonatomic,strong)IBOutlet UITableView *loansTableView;
@property(nonatomic,strong)NSMutableArray *loansArray;
@end
