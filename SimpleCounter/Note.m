
#import "Note.h"

@implementation Note

-(instancetype)initWithData:(int)number title:(NSString *)title type:(NSString *)type price:(double)price date:(NSString *)date{
    self=[super init];
    if (self) {
        self.number=number;
        self.title=title;
        self.type=type;
        self.price=price;
        self.date=date;
        
    }
    return self;
}
@end
