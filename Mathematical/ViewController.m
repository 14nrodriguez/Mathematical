//
//  ViewController.m
//  Mathematical
//
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *QuadScroll;
@property (weak, nonatomic) IBOutlet UIButton *CalculateQuad;

@end

@implementation ViewController

{
    float _aValue;
    float _bValue;
    float _cValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AnimatedPicture.animationImages = [NSArray arrayWithObjects:
                                       
                                       [UIImage imageNamed:@"1.png"],
                                       
                                       [UIImage imageNamed:@"2.png"],
                                       
                                       [UIImage imageNamed:@"3.png"],
                                       
                                       [UIImage imageNamed:@"4.png"],
                                       
                                       [UIImage imageNamed:@"5.png"],
                                       
                                       [UIImage imageNamed:@"6.png"],
                                       
                                       [UIImage imageNamed:@"7.png"],
                                       
                                       [UIImage imageNamed:@"8.png"],
                                       
                                       [UIImage imageNamed:@"9.png"],
                                       
                                       [UIImage imageNamed:@"10.png"],
                                       
                                       [UIImage imageNamed:@"11.png"],
                                       
                                       [UIImage imageNamed:@"12.png"],
                                       
                                       [UIImage imageNamed:@"13.png"], nil];
    
    [AnimatedPicture setAnimationRepeatCount:0];
    
    AnimatedPicture.animationDuration = 0.85;
    
    [AnimatedPicture startAnimating];
    
    
    
    [super viewDidLoad];
}

- (void)calculateQuad
{
    _aValue = self.aTextField.text.floatValue;
    _bValue = self.bTextField.text.floatValue;
    _cValue = self.cTextField.text.floatValue;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quadshowAlert
{
    [self calculateQuad];
    NSString *message;
    float discriminant = pow(_bValue, 2)-(4*_aValue*_cValue);
    if (discriminant < 0) {
        message = @"NONREAL ANSWER";
    } else if (_aValue == 0) {
        message = @"DOES NOT EXIST";
    } else {
        float posresult = ((-1*_bValue)+sqrt(discriminant))/(2*_aValue);
        float negresult = ((-1*_bValue)-sqrt(discriminant))/(2*_aValue);
        
        message = [NSString stringWithFormat:@" %.3f , %.3f ", posresult, negresult];
    }
    
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
    [self.aTextField resignFirstResponder];
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
    
    CGPoint buttonOrigin = self.CalculateQuad.frame.origin;
    
    CGFloat buttonHeight = self.CalculateQuad.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        
        [self.QuadScroll setContentOffset:scrollPoint animated:YES];
        
    }
    
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.QuadScroll setContentOffset:CGPointZero animated:YES];
    
}


@end
