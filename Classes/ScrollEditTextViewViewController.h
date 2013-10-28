//
//  ScrollEditTextViewViewController.h
//  ScrollEditTextView
//
//  Created by Billy Gray on 11/19/09.
//  Copyright Zetetic LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollEditTextViewViewController : UIViewController <UITextViewDelegate> {
	IBOutlet UITextView *textView;
}

@property (nonatomic, retain) IBOutlet UITextView *textView;

- (IBAction)stopEditing:(id)selector;

@end

