

#import <UIKit/UIKit.h>
@protocol MainVCDelegate <NSObject>
@required
-(void)removeAddView;
-(void)reloadTableView;
@end

@interface AddView : UIView

-(instancetype)initAddView;

@property id<MainVCDelegate>mainVCDelegate;

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UIView *typeView;

@property (weak, nonatomic) IBOutlet UITextField *priceInput;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

- (IBAction)didPressCancelButton:(id)sender;
- (IBAction)didPressConfirmButton:(id)sender;

- (IBAction)didTapAddView:(id)sender;
- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender;

- (IBAction)didSelectTypeButton:(UIButton *)sender;

-(void)showWithAnimate;

@end
