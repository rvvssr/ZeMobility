//
//  Utilities.m
//  LuganoPrive
//
//  Created by chintanshah on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

/*
 *  Display a message dialog with the specified dialog title.
 */
+ (void)message:(NSString *)messageText withTitle:(NSString *)title
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, nil)
                                                    message:NSLocalizedString(messageText, nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles: nil];
   if([alert respondsToSelector:@selector(performSelectorOnMainThread:withObject:waitUntilDone:)])
     [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
   else
     [alert show];
}
+ (UIStoryboard *)storyboard
{
   if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
     return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
     return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    return nil;
}
@end
