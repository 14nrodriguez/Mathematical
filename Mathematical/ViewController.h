//
//  ViewController.h
//  Mathematical
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UIImageView *AnimatedPicture;
    
}

@property (nonatomic, weak) IBOutlet UITextField *aTextField;
@property (nonatomic, weak) IBOutlet UITextField *bTextField;
@property (nonatomic, weak) IBOutlet UITextField *cTextField;

- (IBAction)quadshowAlert;
- (IBAction)removeKeyboard;
//scroll view used for when keyboard appear, all view objects can move up


@end
