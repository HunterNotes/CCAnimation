//
//  UIBarButtonItem+Category.m
//  CCAnimation
//
//  Created by nbcb on 2016/10/11.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (UITabBarItem *)itemWithNormalImg:(NSString *)imgName title:(NSString *)title {
    
    UITabBarItem *item = nil;
    NSString *imgSelected = [imgName stringByAppendingString:@"_sel"];
    if(!IsIOS7){
        item = [[UITabBarItem alloc] init];
        item.title = title;
        item.image = [UIImage imageNamed:imgName];
        item.selectedImage = [UIImage imageNamed:imgSelected];
    }
    else {
        item = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imgSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return item;
}

@end
