//
//  UIColorEX.m
//  QQMSFContact
//
//  Created by deanchen on 13-8-15.
//
//

#import "UIColorEX.h"

@implementation UIColor (EX)

- (BOOL)isEqual2Color:(UIColor *)color
{
    CGFloat r1,g1,b1,a1;
    CGFloat r2,g2,b2,a2;
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    BOOL ret = NO;
    if(r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2)
    {
        ret = YES;
    }
    return ret;
}

- (BOOL)isRGBAWhiteColor
{
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

    BOOL ret = NO;
    if([self isEqual:whiteColor])
    {
        ret = YES;
    }
    return ret;
}

+ (UIColor*)randomColor
{
    CGFloat r = (CGFloat)(rand()%256)/256.0f;
    CGFloat g = (CGFloat)(rand()%256)/256.0f;
    CGFloat b = (CGFloat)(rand()%256)/256.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

+ (UIColor *)colorWithRGBHexString:(NSString *)rgbString
{
    if (rgbString == nil) {
        return nil;
    }
    
    if ([rgbString hasPrefix:@"#"]) {
        rgbString = [rgbString substringFromIndex:1];
    }
    
    unsigned int value = 0;
    [[NSScanner scannerWithString:rgbString] scanHexInt:&value];
    
    return [self colorWithRGBHex:value];
}

+ (UIColor *)colorWithRGBHex: (unsigned int)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)colorWithARGBHexString:(NSString *)argbString
{
    if (argbString == nil) {
        return nil;
    }
    
    if ([argbString hasPrefix:@"#"]) {
        argbString = [argbString substringFromIndex:1];
    }
    
    if (argbString.length == 6) {
        return [self colorWithRGBHexString:argbString];
    }
    
    unsigned int value = 0;
    [[NSScanner scannerWithString:argbString] scanHexInt:&value];
    
    return [self colorWithARGBHex:value];
}

+ (UIColor *)colorWithARGBHex: (unsigned int)hex
{
    int a = (hex >> 24) & 0xFF;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.0f];
}


+ (UIColor *)colorWithHexString2: (NSString *) hexString {
    if (!hexString || !hexString.length) return nil;
    
    @try {
        NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
        CGFloat alpha, red, blue, green;
        
        switch ([colorString length]) {
            case 3: // #RGB
                alpha = 1.0f;
                red   = [UIColor colorComponentFrom: colorString start: 0 length: 1];
                green = [UIColor colorComponentFrom: colorString start: 1 length: 1];
                blue  = [UIColor colorComponentFrom: colorString start: 2 length: 1];
                break;
            case 4: // #ARGB
                alpha = [UIColor colorComponentFrom: colorString start: 0 length: 1];
                red   = [UIColor colorComponentFrom: colorString start: 1 length: 1];
                green = [UIColor colorComponentFrom: colorString start: 2 length: 1];
                blue  = [UIColor colorComponentFrom: colorString start: 3 length: 1];
                break;
            case 6: // #RRGGBB
                alpha = 1.0f;
                red   = [UIColor colorComponentFrom: colorString start: 0 length: 2];
                green = [UIColor colorComponentFrom: colorString start: 2 length: 2];
                blue  = [UIColor colorComponentFrom: colorString start: 4 length: 2];
                break;
            case 8: // #AARRGGBB
                alpha = [UIColor colorComponentFrom: colorString start: 0 length: 2];
                red   = [UIColor colorComponentFrom: colorString start: 2 length: 2];
                green = [UIColor colorComponentFrom: colorString start: 4 length: 2];
                blue  = [UIColor colorComponentFrom: colorString start: 6 length: 2];
                break;
            default:
                return nil;
        }
        
        return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


@end
