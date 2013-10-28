//
//  ScrollEditTextViewViewController.m
//  ScrollEditTextView
//
//  Created by Billy Gray on 11/19/09.
//  Copyright Zetetic LLC 2009. All rights reserved.
//

#import "ScrollEditTextViewViewController.h"

@interface ScrollEditTextViewViewController (Private)
- (void)observeKeyboard;
- (void)ignoreKeyboard;
@end

@implementation ScrollEditTextViewViewController

@synthesize textView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rbi = [[[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(stopEditing:)]
                            autorelease];
    [rbi setEnabled:NO];
    self.navigationItem.title = @"UITextView";
    self.navigationItem.rightBarButtonItem = rbi;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self observeKeyboard];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self ignoreKeyboard];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.textView = nil;
}

- (IBAction)stopEditing:(id)selector {
	[textView resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView	*)aTextView {
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
}

- (void)textViewDidEndEditing:(UITextView *)aTextView {
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

#pragma mark -
#pragma mark Keyboard Handling

- (void)observeKeyboard {
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)ignoreKeyboard {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat height = kbSize.height;
//    if (self.navigationController != nil) {
//        CGSize navBarSize = self.navigationController.navigationBar.frame.size;
//        height -= navBarSize.height;
//    }
    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom = height;
    self.textView.contentInset = insets;
    
    insets = self.textView.scrollIndicatorInsets;
    insets.bottom = height;
    self.textView.scrollIndicatorInsets = insets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= height;
//    if (!CGRectContainsPoint(aRect, self.textView.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.textView.frame.origin.y - height);
        [self.textView setContentOffset:scrollPoint animated:YES];
//    }
//    [self.textView scrollRectToVisible:CGRectZero animated:YES];
}

- (void)keyboardWillHide:(NSNotification *)aNotification {
    // reset the content insets to restore the text view's content area to its proper size
    UIEdgeInsets contentInsets = self.textView.contentInset;
    contentInsets.bottom = 0;
    self.textView.contentInset = contentInsets;
    self.textView.scrollIndicatorInsets = contentInsets;
}

- (void)dealloc {
	[textView release];
    [super dealloc];
}

@end
