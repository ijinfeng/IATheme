//
//  IAThemePredicate.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/23.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kIAFilterKey(keyValue) [predicate filterWithObject:self sel:_cmd key:keyValue]

@interface IAThemeFilter : NSObject

@property (nonatomic, assign, readonly) NSUInteger selHash;

@property (nonatomic, assign, readonly) NSUInteger objectHash;

@property (nonatomic, assign, readonly) NSUInteger keyHash;

- (instancetype)initWithObject:(id)object
                           sel:(SEL)sel
                           key:(NSString *)key;
- (instancetype)init NS_UNAVAILABLE;

@end


typedef NS_ENUM(int, IASourceType) {
    IASourceTypeUnknown,
    IASourceTypeColor,
    IASourceTypeImage,
};

typedef NS_ENUM(int, IAKey) {
    IAKeyUnknown,
    IAKeyDefault,
    IAKeyCustom,
};

@interface IAThemePredicate : NSObject<NSCopying>

@property (nonatomic, assign) IASourceType sourceType;

@property (nonatomic, assign) IAKey key;

@property (nonatomic, copy) NSString *keyValue;

@property (nonatomic, strong, readonly) IAThemeFilter *filter;

- (void)filterWithObject:(id)object
                     sel:(SEL)sel
                     key:(NSString *)key;

- (BOOL)isObjectReleased;

@end
