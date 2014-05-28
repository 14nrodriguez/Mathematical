//
//  PythagViewController.h
//  Mathematical
//
//  Created by Norma Rodriguez on 3/25/14.
//  Copyright (c) 2014 14snguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PythagViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *APythag;
@property (nonatomic, weak) IBOutlet UITextField *BPythag;



- (IBAction)removeKeyboard;
- (IBAction)pythagshowAlert;

@end
