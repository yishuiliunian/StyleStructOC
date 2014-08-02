//
//  lb.header.h
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#ifndef LexBase_lb_header_h
#define LexBase_lb_header_h

#include "LBColor.h"
#include "LBBaseStruct.h"
struct ast {
    int nodetype;
    struct ast *l;
    struct ast *r;
};

struct symbol {
    char* name;
    char* value;
};

#define NHASH 9997
struct symbol symtab[NHASH];
struct symbol *lookup(char*);

struct ast * newast(int nodetype, struct ast *l, struct ast *r);
struct ast * addast(int nodetype, char* l, char* r);
//extern symbol
extern int yylineno; /* from lexer */


//error
void yyerror(char *s, ...);
#endif
