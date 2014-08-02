//
//  LBParser.m
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "LBParser.h"
#import "lb.header.h"
void yyparse();
void yyrestart(FILE*);
@interface LBParser ()
{
}
@end

LBParser* parser ;

@implementation LBParser


- (BOOL) parseWithFile:(NSString*)file error:(NSError* __autoreleasing*)error
{
    FILE* fileHandle = fopen([file cStringUsingEncoding:NSASCIIStringEncoding], "r");
    if (!fileHandle) {
        if (error) {
            *error = [NSError errorWithDomain:@"file" code:-90 userInfo:nil];
        }
        return NO;
    }
    parser = self;
    yyrestart(fileHandle);
    yyparse();
    fclose(fileHandle);
    return YES;
}


- (void) getParsedData:(struct LBStyleSheet*) sheet
{
    if ([self.delegate respondsToSelector:@selector(LBParser:didGetSheet:)]) {
        [self.delegate LBParser:self didGetSheet:sheet];
    }
}
void sendParsedData(struct LBStyleSheet* sheet)
{
    [parser getParsedData:sheet];
    parser = nil;
}
@end
