//
//  SSCssParser.h
//  SSOC
//
//  Created by stonedong on 14-7-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCssParser : NSObject
- (instancetype) initWithFile:(NSString*)file;
//
- (void) parse;

@end
