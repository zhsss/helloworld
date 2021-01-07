
#import <Foundation/Foundation.h>
#import "Note.h"
@interface DataManagement : NSObject

+(instancetype)shareDataManagement;
-(void)insertNote:(Note *)newNote;
-(NSMutableArray *)getNoteFormDataBase;
-(void)deleteNoteNumber:(int)number;
-(int)getNoteCount;
-(NSString *)getWeeksFromDate:(NSString *)dateStr;
-(NSArray *)getDataOfLastWeek;
@end
