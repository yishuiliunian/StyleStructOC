//
//  SSCssParser.m
//  SSOC
//
//  Created by stonedong on 14-7-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "SSCssParser.h"
void      yyparse();

@interface SSCssParser ()
{
    FILE* _fileHandler;
}
@end

SSCssParser* parser;

@implementation SSCssParser


- (instancetype) initWithFile:(NSString*)file
{
    self = [super init];
    if (!self) {
        return self;
    }
    parser = self;
    _fileHandler = fopen([file cStringUsingEncoding:NSASCIIStringEncoding], "r");
    
    return self;
}

- (int) yyinputBuffer:(char*)buffer maxSize:(int)maxSize
{
    int copySize = 0;
    copySize = fread(buffer, 1, maxSize, _fileHandler);
    return copySize;
}

- (void) parse {
    yyparse();
}

int yyYYINPUT(char * theBuffer,int maxSize) {
    return [parser yyinputBuffer:theBuffer maxSize:maxSize];
}
@end
