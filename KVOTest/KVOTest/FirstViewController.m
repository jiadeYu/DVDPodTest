//
//  FirstViewController.m
//  KVOTest
//
//  Created by zhangyongfeng on 2018/1/13.
//  Copyright © 2018年 dvd. All rights reserved.
//

#import "FirstViewController.h"
#import "Person.h"

@interface FirstViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.person = [[Person alloc] initWithName:@"许明" age:58];
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"first dealloc");
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",[NSThread currentThread]);
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"personName:%@",change);
        //self.nameLabel.text = self.person.name;
    }
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"personAge:%@",change);
        //self.nameLabel.text = self.person.name;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
