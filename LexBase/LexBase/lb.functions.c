//
//  lb.functions.c
//  LexBase
//
//  Created by stonedong on 14-7-30.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "lb.header.h"

static unsigned symhash(char *sym)
{
    unsigned int hash = 0;
    unsigned c;
    
    while((c = *sym++)) hash = hash*9 ^ c;
    
    return hash;
}

struct symbol * lookup(char* sym)
{
    struct symbol *sp = &symtab[symhash(sym)%NHASH];
    int scount = NHASH;		/* how many have we looked at */
    
    while(--scount >= 0) {
        if(sp->name && !strcmp(sp->name, sym)) { return sp; }
        
        if(!sp->name) {		/* new entry */
            sp->name = strdup(sym);
            sp->value = 0;
            return sp;
        }
        
        if(++sp >= symtab+NHASH) sp = symtab; /* try the next entry */
    }
    yyerror("symbol table overflow\n");
    abort(); /* tried them all, table is full */
    
}


void yyerror(char *s, ...)
{
    va_list ap;
    va_start(ap, s);
    
    fprintf(stderr, "%d: error: ", yylineno);
    vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}


struct ast * newast(int nodetype, struct ast *l, struct ast *r)
{
    struct ast *a = malloc(sizeof(struct ast));
    
    if(!a) {
        yyerror("out of space");
        exit(0);
    }
    a->nodetype = nodetype;
    a->l = l;
    a->r = r;
    return a;
}


struct ast * addast(int nodetype, char* l, char* r)
{
    
    struct ast *a = malloc(sizeof(struct ast));
    
    if(!a) {
        yyerror("out of space");
        exit(0);
    }
    a->nodetype = nodetype;
    a->l = NULL;
    a->r = NULL;
    return a;
    
}

