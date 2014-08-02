//
//  LBColor.c
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "LBColor.h"
struct LBColor* LBColorMake(char* s)
{
    if (!strlen(s) != 7) {
        yyerror("color format error!\n");
    }
    
    struct LBColor* color = malloc(sizeof(struct LBColor));
    color->originStr = s;
    return color;
}