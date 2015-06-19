//
//  SkinTools.h
//  1107ZJ换肤
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SkinTools : NSObject

typedef enum
{
    kSkinNameZQ,
    kSkinNameGQ,
    kSkinNameCJ
    
}kSkinName;

typedef enum
{
    kskinColorTypeLabel 
    

} kSkinColorType;

#define kLabelColor @"labelColor"

//切换主题的图片
+ (UIImage *)imageNamed:(NSString *)imageName;

//切换主题
+ (void)setSkinWithName:(kSkinName)skinName;

//切换主题的颜色
+ (UIColor *)skinColorWithType:(kSkinColorType)type;

@end
