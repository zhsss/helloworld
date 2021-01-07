

#import <UIKit/UIKit.h>

@interface  HeaderView: UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;



@end



@interface FooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *comsumLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
