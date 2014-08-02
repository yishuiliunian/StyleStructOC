//
//  LBViewController.m
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "LBViewController.h"
#import "UIView+CssRender.h"
@interface LBViewController ()

@end

@implementation LBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.testButton renderWithCss:@"test"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
