
#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell

+(instancetype)noteTableCelll;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;


@end
