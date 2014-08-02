//
//  LBRenderButton.m
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "LBRenderButton.h"
#import "lb.header.h"
#import "UIColorEX.h"
@implementation LBRenderButton

- (void) LBParser:(LBParser *)parser didGetSheet:(struct LBStyleSheet *)sheet
{
    
    UIButton* button = (UIButton*)self.renderObject;

    
    struct LBCssRule* rule = sheet->head;
    while (rule != NULL) {
        if (strcmp(rule->selector->name, "button") == 0) {
            if (strcmp(rule->declaration->name, "backgroudColor") == 0) {
                UIColor* color = [UIColor colorWithRGBHexString:[NSString stringWithCString:rule->declaration->value]];
                [button setBackgroundColor:color];
            }
        }
        rule = rule->next;
    }
}
@end
