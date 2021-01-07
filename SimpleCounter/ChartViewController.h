
#import <UIKit/UIKit.h>

@interface ChartViewController : UIViewController
@property (strong,nonatomic) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *graphView;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


- (IBAction)didTapLineView:(UITapGestureRecognizer *)sender;
- (IBAction)segementDidChange:(id)sender;

@end
