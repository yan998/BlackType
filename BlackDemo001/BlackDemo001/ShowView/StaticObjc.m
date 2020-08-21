//
//  StaticObjc.m
//  BlackDemo001
//
//  Created by yan on 2020/5/14.
//  Copyright © 2020 yan. All rights reserved.
//

#import "StaticObjc.h"
#import "TempObjc.h"

@implementation StaticObjc

+ (instancetype)share {
    static StaticObjc *objc = nil;
    if (objc == nil) {
        objc = [[StaticObjc alloc] init];
    }
    return objc;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        TempObjc *tempObjc = [[TempObjc alloc] init];
    }
    return self;
}


- (void)dealloc
{
    
}

@end
