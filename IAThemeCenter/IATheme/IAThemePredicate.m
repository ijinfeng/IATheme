//
//  IAThemePredicate.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/23.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "IAThemePredicate.h"

@interface IAThemePredicate ()

@property (nonatomic, strong) IAThemeFilter *filter;

@property (nonatomic, weak) id delegate;

@end

@implementation IAThemePredicate

- (id)copyWithZone:(NSZone *)zone {
    IAThemePredicate *predicate = [[IAThemePredicate allocWithZone:zone] init];
    predicate.sourceType = self.sourceType;
    predicate.key = self.key;
    predicate.keyValue = self.keyValue;
    predicate.delegate = self.delegate;
    return predicate;
}

- (void)filterWithObject:(id)object sel:(SEL)sel key:(NSString *)key {
    _delegate = object;
    
    IAThemeFilter *filter = [[IAThemeFilter alloc] initWithObject:object sel:sel key:key];
    self.filter = filter;
}


- (BOOL)isObjectReleased {
    return self.delegate ? NO : YES;
}

@end


@implementation IAThemeFilter

- (instancetype)initWithObject:(id)object sel:(SEL)sel key:(NSString *)key {
    self = [super init];
    if (self) {
        _selHash = [NSStringFromSelector(sel) hash];
        _objectHash = [object hash];
        _keyHash = [key hash];
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[self class]]) {
        IAThemeFilter *filter = (IAThemeFilter *)object;
        if (filter.selHash == self.selHash && filter.objectHash == self.objectHash && filter.keyHash == self.keyHash) {
            return YES;
        }
        return NO;
    } else {
        return NO;
    }
}

@end

