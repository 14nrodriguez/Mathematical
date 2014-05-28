//
//  MidPointViewController.m
//  Mathematical
//
//  Created by Norma Rodriguez on 4/11/14.
//  Copyright (c) 2014 14snguyen. All rights reserved.
//

#import "MidPointViewController.h"

@interface MidPointViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *MidpointScroll;
@property (weak, nonatomic) IBOutlet UIButton *MidpointCalc;


@end


@implementation MidPointViewController
{
    float X1;
    float Y1;
    float X2;
    float Y2;
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

- (void)calculateMidpoint
{
    X1 = self.X1text.text.floatValue;
    Y1 = self.Y1text.text.floatValue;
    X2 = self.X2text.text.floatValue;
    Y2 = self.Y2text.text.floatValue;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) calculateMid;
{
    [self calculateMidpoint];
    NSString *message;
    float result1 = ((X1 + X2)/2);
    float result2 = ((Y1 + Y2)/2);
    message = [NSString stringWithFormat:@" %.2f,%.2f ", result1, result2];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"RESULT:"
                              message:message
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
    [alertView show];
}



-(IBAction)removeKeyboard
{
    [self.X1text resignFirstResponder];
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
    
    CGPoint buttonOrigin = self.MidpointCalc.frame.origin;
    
    CGFloat buttonHeight = self.MidpointCalc.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        
        [self.MidpointScroll setContentOffset:scrollPoint animated:YES];
        
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.MidpointScroll setContentOffset:CGPointZero animated:YES];
    
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

@end
