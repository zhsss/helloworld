

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property NSMutableArray *dataArray;

- (IBAction)segmentDidChange:(id)sender;
- (IBAction)didTapAddButton:(id)sender;
- (IBAction)didTapVC:(id)sender;


-(void)reloadTableView;

@end


