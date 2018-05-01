//
//  UIButton+IATheme.h
//  IAThemeCenter
//
//  Created by Alter on 2018/4/24.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (IATheme)

- (void)ia_setImageWithKey:(NSString *)key
                  forState:(UIControlState)state;

- (void)ia_setBackgroundImageWithKey:(NSString *)key
                            forState:(UIControlState)state;

- (void)ia_setTintColorWithKey:(NSString *)key;

- (void)ia_setTitleColorWithKey:(NSString *)key
                      forState:(UIControlState)state;

@end
