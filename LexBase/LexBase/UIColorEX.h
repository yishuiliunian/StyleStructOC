//
//  UIColorEX.h
//  QQMSFContact
//
//  Created by deanchen on 13-8-15.
//
//

#import <Foundation/Foundation.h>

@interface UIColor (EX)

- (BOOL)isEqual2Color:(UIColor *)color;

- (BOOL)isRGBAWhiteColor;

+ (UIColor*)randomColor;

+ (UIColor *)colorWithRGBHexString:(NSString *)rgbString;

+ (UIColor *)colorWithRGBHex: (unsigned int)hex;

+ (UIColor *)colorWithARGBHexString:(NSString *)argbString;

+ (UIColor *)colorWithARGBHex: (unsigned int)hex;

+ (UIColor *)colorWithHexString2: (NSString *)hexString;

@end
