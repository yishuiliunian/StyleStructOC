//
//  LBParser.h
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lb.header.h"
@class LBParser;
@protocol LBParserDelegate <NSObject>

- (void) LBParser:(LBParser*)parser didGetSheet:(struct LBStyleSheet*)sheet;

@end

@interface LBParser : NSObject
@property (nonatomic, weak) id<LBParserDelegate> delegate;
- (BOOL) parseWithFile:(NSString*)file error:(NSError* __autoreleasing*)error;
@end
