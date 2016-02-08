//
//  DataManager.h
//  我要考驾照
//
//  Created by 谢谦 on 16/2/8.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    chapter//章节选择界面

}dataType;

@interface DataManager : NSObject

+(NSArray *)getData :(dataType)type;

@end
