//
//  Person.h
//  KVOTest
//
//  Created by zhangyongfeng on 2018/1/13.
//  Copyright © 2018年 dvd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//{
//    NSString *_nickName;
//}

@property (nonatomic, copy) NSString *name;

//@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) NSMutableArray *arrary;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;

- (void)changeName:(NSString *)name;

- (void)addArraryName:(NSString *)name;

@end
