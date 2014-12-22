//
//  AppDelegate.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@class SWRevealViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate,SWRevealViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SWRevealViewController *sWRevealViewController;
@end
