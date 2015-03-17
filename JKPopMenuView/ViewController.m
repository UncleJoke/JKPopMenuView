//
//  ViewController.m
//  JKPopMenuView
//
//  Created by Bingjie on 15/3/16.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "ViewController.h"
#import "JKPopMenuView.h"

@interface ViewController ()<JKPopMenuViewSelectDelegate>
- (IBAction)showPopMenu:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPopMenu:(id)sender {

    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i < 7; i++) {
        NSString *string = [NSString stringWithFormat:@"icon%ld",i];
        JKPopMenuItem *item = [JKPopMenuItem itemWithTitle:string image:[UIImage imageNamed:string]];
        [array addObject:item];
    }
    
    JKPopMenuView *jkpop = [JKPopMenuView menuViewWithItems:array];
    jkpop.delegate = self;
    [jkpop show];
}

#pragma mark App JKPopMenuViewSelectDelegate
- (void)popMenuViewSelectIndex:(NSInteger)index
{
    
}

@end
