 
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


#import <Foundation/Foundation.h> 

int main()
{
   NSString *str0=@"文艺青年";
 
    NSString *temp = @"文艺";
    NSRange rang = [str0 rangeOfString:temp];
 
    NSLog(@"搜索的字符串在str0中起始点的index 为 %d", rang.location);
    NSLog(@"搜索的字符串在str0中结束点的index 为 %d", rang.location + rang.length);
 
    //将搜索中的字符串替换成为一个新的字符串
    NSString *str = [str0 stringByReplacingCharactersInRange:rang withString:@"123"];
    NSLog(@"替换后字符串为%@", str);
    NSString *str1=@"i love you";
    NSString *capitalize=[str1 capitalizedString];
    NSLog(@"str1首字母大写:%@",capitalize);
    
    NSString *str3=@"20|https://www.cuc.edu.cn”https://www.cuc.edu.cn";
    NSString *temp1=@"|";
    
    NSRange rang1=[str3 rangeOfString:temp1];
    int point=rang1.location;
    NSString * to = [str3 substringToIndex:point];
    NSString * from=[str3 substringFromIndex:point+1];
    NSLog(@"to = %@",to);
    NSLog(@"from = %@",from);
   return 0;
}
#import <Foundation/Foundation.h> 

int main()
{
    NSNumber *n1 = [NSNumber numberWithInt:23];

    NSNumber *n2 = [NSNumber numberWithFloat:1.2];

    NSNumber *n3 = [NSNumber numberWithBool:YES];

    NSNumber *n4=[NSNumber numberWithDouble:2.33];

    NSValue *n5 = [NSValue valueWithRange:NSMakeRange(2, 2)];

    NSMutableArray *muArray = [NSMutableArray arrayWithObjects:n1,n2,n3,n4,n5,nil];
    
    for (int i = 0; i < muArray.count; i++) {

        NSLog(@"%@",muArray[i]);

    }
}
