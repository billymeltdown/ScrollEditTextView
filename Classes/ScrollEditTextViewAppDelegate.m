//
//  ScrollEditTextViewAppDelegate.m
//  ScrollEditTextView
//
//  Created by Billy Gray on 11/19/09.
//  Copyright Zetetic LLC 2009. All rights reserved.
//

#import "ScrollEditTextViewAppDelegate.h"
#import "ScrollEditTextViewViewController.h"

@implementation ScrollEditTextViewAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch
    UINavigationController *nvc = [[[UINavigationController alloc] initWithRootViewController:self.viewController] autorelease];
    window.rootViewController = nvc;
//    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
