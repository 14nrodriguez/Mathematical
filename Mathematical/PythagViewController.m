//
//  PythagViewController.m
//  Mathematical
//
//  Created by Norma Rodriguez on 3/25/14.
//  Copyright (c) 2014 14snguyen. All rights reserved.
//

#import "PythagViewController.h"

@interface PythagViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *PythagScroll;

@property (weak, nonatomic) IBOutlet UIButton *PythagCalc;

@end

@implementation PythagViewController

{
    float _aValue;
    float _bValue;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)calculatePythag
{
    _aValue = self.APythag.text.floatValue;
    _bValue = self.BPythag.text.floatValue;
    
}

- (IBAction)pythagshowAlert
{
    [self calculatePythag];
    NSString *message;
           float result = pow(_aValue, 2) + pow(_bValue, 2);
        message = [NSString stringWithFormat:@" %.3f ", result];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"RESULT:"
                              message:message
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
    
    [alertView show];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)removeKeyboard
{
    [self.APythag resignFirstResponder];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    
    [super viewWillDisappear:animated];
    
    
}
- (void)keyboardWasShown:(NSNotification *)notification {
    
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGPoint buttonOrigin = self.PythagCalc.frame.origin;
    
    CGFloat buttonHeight = self.PythagCalc.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        
        [self.PythagScroll setContentOffset:scrollPoint animated:YES];
        
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.PythagScroll setContentOffset:CGPointZero animated:YES];
    
}



@end
