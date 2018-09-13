//
//  People.m
//  MessageSelectorDemo
//
//  Created by yangdongzheng on 2017/10/24.
//  Copyright © 2017年 yangdongzheng. All rights reserved.
//

#import "People.h"
#include <objc/runtime.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Student.h"

@interface People()

@property (nonatomic,strong) Student *student;

@end

@implementation People

void perfectGotoSchool(id self,SEL _cmd,id value) {
    printf("go to school");
}

////第一步：对象在收到无法解读的消息后，首先将调用所属类的该方法。
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString isEqualToString:@"perfectGotoSchool"]) {
        class_addMethod(self, sel, (IMP)perfectGotoSchool, "@@:");
    }
    return [super resolveInstanceMethod:sel];
}

//第二步：备援接收者，让其他对象进行处理
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selectorString = NSStringFromSelector(aSelector);
    if ([selectorString isEqualToString:@"perfectGotoSchool"]) {
        return self.student;
    }
    return nil;
}

//第三步：最后一次机会
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:self.student];
}

#pragma mark - Lazy load
- (Student *)student {
    if (!_student) {
        _student = [Student new];
    }
    return _student;
}

@end
