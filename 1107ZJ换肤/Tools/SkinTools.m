//
//  SkinTools.m
//  1107ZJ换肤
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//
#define kSkinTypePathKey @"skinTypePath"

#import "SkinTools.h"

#define kSkinNameKey @"skinName"

@implementation SkinTools

+ (void)setSkinWithName:(kSkinName)skinName
{
//    kSkinNameZQ,
//    kSkinNameGQ,
//    kSkinNameCJ
//    [[NSUserDefaults standardUserDefaults] setObject:@(skinName) forKey:kSkinNameKey];
    NSString *path;
    switch (skinName) {
        case kSkinNameCJ:
            path = [NSString stringWithFormat:@"chunjie"];
            break;
        case kSkinNameGQ:
            path = [NSString stringWithFormat:@"guoqing"];
            break;
        case kSkinNameZQ:
            path = [NSString stringWithFormat:@"zhongqiu"];
            break;
        default:
            break;
    }
    
    
    [[NSUserDefaults standardUserDefaults] setObject:path forKey:kSkinTypePathKey];
    
    
    //同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
}

+ (UIImage *)imageNamed:(NSString *)imageName
{
    NSString *skinNumber = [[NSUserDefaults standardUserDefaults] objectForKey:kSkinTypePathKey];
//    NSString *skinName = nil;
//    
//    switch (skinNumber.integerValue) {
//        case 0:
//            skinName = @"zhongqiu";
//            break;
//        case 1:
//            skinName = @"guoqing";
//            break;
//        case 2:
//            skinName = @"chunjie";
//            break;
//
//        default:
//            skinName = @"";
//
//            break;
//    }
    
    NSString *imagePath = [NSString stringWithFormat:@"skin/%@/%@",skinNumber,imageName];
    
    return [UIImage imageNamed:imagePath];
    
}


+ (UIColor *)skinColorWithType:(kSkinColorType)type
{
    //获取当前主题的路径
    NSString *skinTypePath = [[NSUserDefaults standardUserDefaults] objectForKey:kSkinTypePathKey];
    
    //拼接颜色配置文件路径
    NSString *path = [NSString stringWithFormat:@"skin/%@/",skinTypePath];
    path = [[NSBundle mainBundle] pathForResource:@"TextColorConfig.plist" ofType:nil inDirectory:path] ;
    
    // 3.取出文件存储的颜色数据
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *colorStr;
    // 4. 查看外界到底想要获取当前主题下的什么颜色
    switch (type) {
        case kskinColorTypeLabel:
            colorStr = dic[@(kskinColorTypeLabel).stringValue];
            break;
//        case <#expression#>:
        default:
            break;
    }

    
    //根据对应的颜色字符串获取对应的RGB
    NSArray *colorArray = [colorStr componentsSeparatedByString:@","];
    
    float red = [colorArray[0] floatValue] / 255.0;
    float green = [colorArray[1] floatValue] / 255.0;
    float blue = [colorArray[2] floatValue] / 255.0;

    //返回颜色
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
}
 

@end
