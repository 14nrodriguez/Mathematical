//
//  MidPointViewController.h
//  Mathematical
//
//  Created by Norma Rodriguez on 4/11/14.
//  Copyright (c) 2014 14snguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MidPointViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *X1text;
@property (weak, nonatomic) IBOutlet UITextField *Y1text;
@property (weak, nonatomic) IBOutlet UITextField *X2text;
@property (weak, nonatomic) IBOutlet UITextField *Y2text;

- (IBAction)removeKeyboard;
-(IBAction) calculateMid; 
@end
