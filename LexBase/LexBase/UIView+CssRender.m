//
//  UIView+CssRender.m
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "UIView+CssRender.h"
#import "LBParser.h"
#import "LBRenderButton.h"
#import <objc/runtime.h>

static void* kRenderOperation = &kRenderOperation;

@interface UIView ()
@property (nonatomic, strong) LBRenderOperation* renderOperation;
@end


@implementation UIView (CssRender)

- (LBRenderOperation*) renderOperation
{
    return objc_getAssociatedObject(self, kRenderOperation);
}
- (void) setRenderOperation:(LBRenderOperation *)renderOperation
{
    objc_setAssociatedObject(self, kRenderOperation, renderOperation, OBJC_ASSOCIATION_RETAIN);
}
- (void) renderWithCss:(NSString*)fileName
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"css"];
    LBParser* parser = [LBParser new];
    
    LBRenderOperation* render = self.renderOperation;
    if (!render) {
        if ([[self class] isSubclassOfClass:[UIButton class]]) {
            render = [LBRenderButton new];
        }
    }
    render.renderObject = self;
    self.renderOperation = render;
    parser.delegate = render;
    [parser parseWithFile:filePath error:nil];
}
@end
