
#import <Foundation/Foundation.h>

@interface Note : NSObject

@property NSString *title;
@property NSString *type;
@property double price;
@property NSString *date;
@property int number;

-(instancetype)initWithData:(int)number title:(NSString *)title type:(NSString *)type price:(double)price date:(NSString *)date;
@end
