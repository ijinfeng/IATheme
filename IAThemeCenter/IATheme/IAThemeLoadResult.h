//
//  IAThemeLoadResult.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/26.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAThemePredicate.h"

@class UIColor, UIImage;

@interface IAThemeLoadResult : NSObject

@property (nonatomic, assign) IASourceType sourceType;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;

@end
