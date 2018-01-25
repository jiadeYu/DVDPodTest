//
//  Person.m
//  KVOTest
//
//  Created by zhangyongfeng on 2018/1/13.
//  Copyright © 2018年 dvd. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _arrary = [NSMutableArray array];
    }
    return self;
}

- (void)changeName:(NSString *)name
{
    //_nickName = name;
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

//- (void)changeName:(NSString *)name
//{
//    //_nickName = name;
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        [self willChangeValueForKey:@"name"];
//        _name = name;
//        [self didChangeValueForKey:@"name"];
//    });
//}

- (void)setName:(NSString *)name
{
    //_name = name;
}

- (void)addArraryName:(NSString *)name
{
    [self willChangeValueForKey:@"arrary"];
    [self.arrary addObject:name];
    [self didChangeValueForKey:@"arrary"];
}


@end
