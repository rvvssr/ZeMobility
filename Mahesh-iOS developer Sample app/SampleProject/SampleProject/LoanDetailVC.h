//
//  LoanDetailVC.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 21/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanDetailVC : UIViewController

@property(nonatomic,strong)IBOutlet UITableView *loanDetailView;
@property(nonatomic,strong)NSMutableDictionary  *loandetailsDic;
@end
