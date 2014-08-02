//
//  LBRenderOperation.h
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lb.header.h"
#import "LBParser.h"
@interface LBRenderOperation : NSObject <LBParserDelegate>

@property (nonatomic, weak) NSObject* renderObject;
@end
