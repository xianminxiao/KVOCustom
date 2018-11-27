//
//  ViewController.m
//  KVOCustom
//
//  Created by xianminxiao on 2018/11/24.
//  Copyright © 2018年 xxm. All rights reserved.
//

#import "ViewController.h"
#import "KVOModel.h"
#import <objc/message.h>
#import "NSObject+KVOCustom.h"

@interface ViewController ()
@property (nonatomic, strong) KVOModel* model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [KVOModel new];
    // 注册
//    [_model addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    [_model customKVO_addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
}
/** 监听方法 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@", change);
}
/** 屏幕touch */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int magicNum;
    _model.name = [NSString stringWithFormat:@"name=%d", magicNum++];
}


@end
