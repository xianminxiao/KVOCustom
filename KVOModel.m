//
//  KVOModel.m
//  KVOCustom
//
//  Created by xianminxiao on 2018/11/24.
//  Copyright © 2018年 xxm. All rights reserved.
//

#import "KVOModel.h"

@implementation KVOModel
-(void)setName:(NSString *)name
{
    _name = [name stringByAppendingString:@"change"];
    NSLog(@"%@", _name);
}

@end
