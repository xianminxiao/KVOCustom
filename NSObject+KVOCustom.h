//
//  NSObject+KVOCustom.h
//  KVOCustom
//
//  Created by xianminxiao on 2018/11/24.
//  Copyright © 2018年 xxm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KVOCustom)

- (void)customKVO_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end

NS_ASSUME_NONNULL_END
