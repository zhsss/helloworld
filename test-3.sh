 
#!/bin/bash

echo "-------------------------------------------------------------------"
grep -oP '^(\w+\.)+[A_Za-z]+' web_log.tsv | sort -n  | uniq -c | sort -nr -k1 | head -10
echo "-------------------------------------------------------------------"
grep -oP '(\d+\.){3}\d+\s' web_log.tsv | sort -nr | uniq -c | sort -nr -k1 | head -10
echo "-------------------------------------------------------------------"
grep -oP '(\/[^\s]+)+' web_log.tsv | sort -n  | uniq -c | sort -nr -k1 | head -10
echo "-------------------------------------------------------------------"
grep -oP '\s+\d{3}\s+(?=\d+)' web_log.tsv | sort | uniq -c | sort -k1 -nr | awk  '{array[$2]=$1; sum+=$1} END { for (i in array) printf "%-20s %-15d %6.6f%%\n", i, array[i], array[i]/sum*100}'
echo "-------------------------------------------------------------------"
grep -oP '\s+4\d{2}\s+(?=\d+)' web_log.tsv | sort -u | xargs -i sh -c "grep  -P '\s+{}(?=\d+)'  web_log.tsv  | awk '{printf \"%s %d \n\",\$5,\$6 }'| sort | uniq -c | sort -nr -k1 |head -10"
echo "-------------------------------------------------------------------"
grep -P $1'\s+' web_log.tsv | awk '{printf "%s \n",$1}'| sort | uniq -c | sort -nr -k1 | head -10
echo "-------------------------------------------------------------------"

#import"doublearray.h"
#import <Foundation/Foundation.h>


int main()
{

    NSArray *one=[[NSArray alloc] initWithObjects:@"2.31",@"2.41",@"2.51",@"2.61",@"2.71", nil];
    NSArray *two=[[NSArray alloc] initWithObjects:@"2.31",@"2.41",@"2.51",@"2.61",@"2.71", nil];
    NSArray *three=[[NSArray alloc] initWithObjects:@"2.31",@"2.41",@"2.51",@"2.61",@"2.71", nil];
    NSArray *dArray=[[NSArray alloc] initWithObjects:one,two,three, nil];
    
    
    doublearray *aob=[[doublearray alloc] init];
 
    [aob display1:dArray];
    
   
    
    NSMutableArray *dhowarray=[aob copyarray:dArray];
    
    [aob display2:dhowarray];
    
    return 0;
    
}
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface doublearray : NSObject

-(void)display2:(NSMutableArray*)array;
-(NSMutableArray*)copyarray:(NSArray*)a;
-(void)display1:(NSArray*)array;
@end

NS_ASSUME_NONNULL_END

#import "doublearray.h"

@implementation doublearray

-(void)display2:(NSMutableArray *)array{
    NSLog(@"%@",array);
}
-(void)display1:(NSArray*)array{
    NSLog(@"%@",array);
    
}
-(NSMutableArray*)copyarray:(NSArray*)a {
    
    NSMutableArray *mcopy=[a mutableCopy];
    return mcopy;
}
@end
