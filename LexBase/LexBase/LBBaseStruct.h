//
//  LBBaseStruct.h
//  LexBase
//
//  Created by stonedong on 14-7-31.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#ifndef LexBase_LBBaseStruct_h
#define LexBase_LBBaseStruct_h


struct LBSelector {
    int type;
    char* name;
};

struct LBDeclaration {
    char* name;
    char* value;
    void* func;
};

struct LBCssRule {
    struct LBSelector* selector;
    struct LBDeclaration* declaration;
    struct LBCssRule* next;
};

struct LBStyleSheet {
    struct LBCssRule* head;
};


struct LBStyleSheet* LBStyleSheetMake();

struct LBCssRule* LBCssRuleMake(struct LBSelector* selector, struct LBDeclaration* declaration);

struct LBDeclaration* LBDeclarationMake(char* name, char* value, int type);

struct LBSelector* LBSelectorMake(int type, char* name);

void LBStyleSheetAddRule(struct LBStyleSheet* sheet, struct LBCssRule* rule);



#endif
