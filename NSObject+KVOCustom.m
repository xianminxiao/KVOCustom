//
//  NSObject+KVOCustom.m
//  KVOCustom
//
//  Created by xianminxiao on 2018/11/24.
//  Copyright © 2018年 xxm. All rights reserved.
//

#import "NSObject+KVOCustom.h"
#import <objc/message.h>

@implementation NSObject (KVOCustom)

- (void)customKVO_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    // 创建一个类
    NSString* oldClassName = NSStringFromClass(self.class);
    NSString* newClassName = [@"customKVO_" stringByAppendingString:oldClassName];
    Class subClass = objc_allocateClassPair(self.class, newClassName.UTF8String, 0);
    // 注册类
    objc_registerClassPair(subClass);
    
    // 重写setName方法
    class_addMethod(subClass, @selector(setName:), (IMP)setName, "v@:@");
    
    // 修改isa指针
    object_setClass(self, subClass);
    
    // 将观察者保存到当前对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
    
}

void setName(id self, SEL _cmd, NSString* newName)
{
    // 调用父类的setName方法
    Class class = [self class];
    object_setClass(self, class_getSuperclass(class));
    objc_msgSend(self, @selector(setName:), newName);
    
    // 通知observer
    id observer = objc_getAssociatedObject(self, @"observer");
    if (observer)
    {
        objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:), @"name", self, @{@"customKVO_new:":newName, @"customKVO_kind":@1}, nil);
    }
    
    // self改回子类
    object_setClass(self, class);
}

@end
