//
//  ScrollEditTextViewAppDelegate.h
//  ScrollEditTextView
//
//  Created by Billy Gray on 11/19/09.
//  Copyright Zetetic LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollEditTextViewViewController;

@interface ScrollEditTextViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScrollEditTextViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScrollEditTextViewViewController *viewController;

@end

