//
//  ViewController.m
//  KVOTest
//
//  Created by zhangyongfeng on 2018/1/13.
//  Copyright © 2018年 dvd. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "FirstViewController.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@property (nonatomic, strong) UIButton *actionButton;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.actionButton];
    [self.view addSubview:self.nameLabel];
    
    self.person = [[Person alloc] initWithName:@"吉安娜" age:58];
    [self.person addObserver:self forKeyPath:@"arrary" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionOld context:nil];
    //[self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    
    //[self.actionButton addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"name"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",[NSThread currentThread]);
    if ([keyPath isEqualToString:@"arrary"]) {
        NSLog(@"personName:%@",change);
        //[self.nameLabel setValue:self.person.name forKey:@"text"];
        self.nameLabel.text = self.person.name;
    }
//    if ([keyPath isEqualToString:@"age"]) {
//        NSLog(@"personAge:%@",change);
//        //self.nameLabel.text = self.person.name;
//    }
//    if ([keyPath isEqualToString:@"frame"]) {
//        //id object = [change valueForKey:NSKeyValueChangeNewKey];
//        CGRect newFrame = [[change valueForKey:NSKeyValueChangeNewKey] CGRectValue];
//        // = CGRectFromString(newFrameStr);
//        NSLog(@"buttonFrame:%@",change);
//    }
}


#pragma mark - Event

- (void)actionClick
{
    //self.person.name = @"萨尔";
    [self.person addArraryName:@"萨尔"];
    //[self.person changeName:@"安东尼"];
    NSLog(@"personName:%@",self.person.name);
    //FirstViewController *firstViewController = [[FirstViewController alloc] init];
    //[self.navigationController pushViewController:firstViewController animated:YES];
}

#pragma mark - View

- (UIButton *)actionButton
{
    if (_actionButton == nil) {
        _actionButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 80, 40)];
        _actionButton.backgroundColor = [UIColor redColor];
        [_actionButton addTarget:self action:@selector(actionClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 200, 40)];
        
    }
    return _nameLabel;
}

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        //_textField.placeHolderText
    }
    return _textField;
}

@end
