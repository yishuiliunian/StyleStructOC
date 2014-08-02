//
//  LBColor.h
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#ifndef LexBase_LBColor_h
#define LexBase_LBColor_h

struct LBColor {
    char* originStr;
    double red;
    double green;
    double blue;
};

struct LBColor* LBColorMake(char* s);

#endif
