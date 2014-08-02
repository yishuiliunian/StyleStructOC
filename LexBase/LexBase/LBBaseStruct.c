//
//  LBBaseStruct.c
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "LBBaseStruct.h"
struct LBStyleSheet* LBStyleSheetMake()
{
    struct LBStyleSheet* sheet = malloc(sizeof(struct LBStyleSheet));
    if (!sheet) {
        yyerror("memory error!\n");
    }
    sheet->head = NULL;
    
    return sheet;
}

struct LBCssRule* LBCssRuleMake(struct LBSelector* slector, struct LBDeclaration* declaration)
{
    struct LBCssRule* rule = malloc(sizeof(struct LBCssRule));
    if (!rule) {
        yyerror("memory error!\n");
    }
    rule->next = NULL;
    rule->declaration = declaration;
    rule->selector = slector;
    return rule;
}

struct LBDeclaration* LBDeclarationMake(char* name, char* value, int type)
{
    struct LBDeclaration* decl = malloc(sizeof(struct LBDeclaration));
    if (!decl) {
        yyerror("memory error!\n");
    }
    decl->name = name;
    decl->value = value;
    switch (type) {
            
        default:
            decl->func = NULL;
            break;
    }
    return decl;
}

struct LBSelector* LBSelectorMake(int type, char* name)
{
    struct LBSelector* selector = malloc(sizeof(struct LBSelector));
    if (!selector) {
        yyerror("momory error!\n");
    }
    selector->name = name;
    selector->type = type;
    return selector;
}

void LBStyleSheetAddRule(struct LBStyleSheet* sheet, struct LBCssRule* rule)
{
    if (sheet->head == NULL) {
        sheet->head = rule;
    } else
    {
        for (struct LBCssRule* next = sheet->head; ; ) {
            if (next->next == NULL) {
                next->next = rule;
                rule->next = NULL;
                break;
            }
        }
    }
}

