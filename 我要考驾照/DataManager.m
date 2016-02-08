//
//  DataManager.m
//  我要考驾照
//
//  Created by 谢谦 on 16/2/8.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "DataManager.h"
#import "FMDatabase.h"
#import "TestModel.h"

@implementation DataManager


+(NSArray *)getData :(dataType)type
{
    static FMDatabase *database;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    if (!database) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        database = [[FMDatabase alloc]initWithPath:path];
    }

    if ([database open]) {
        NSLog(@"database open");
    }else
    {
        return array;
    }
    
    
    switch (type) {
        case chapter:
        {
            NSString *sql = @"select pid,pname,pcount FROM firstlevel";
            FMResultSet *rs = [database executeQuery:sql];
            while ([rs next]) {
                TestModel *model = [[TestModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
            }
            break;
            
            
            }
           
    }
    return array;

}
@end
