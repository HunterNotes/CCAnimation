//
//  Config.h
//  CCAnimation
//
//  Created by nbcb on 2016/10/11.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define app_width ([[UIScreen mainScreen] bounds].size.width)
#define app_height ([[UIScreen mainScreen] bounds].size.height)

#define IsIOS10 ([[[UIDevice currentDevice] systemVersion] compare:@"10" options:NSNumericSearch] != NSOrderedAscending)
#define IsIOS9 ([[[UIDevice currentDevice] systemVersion] compare:@"9" options:NSNumericSearch] != NSOrderedAscending)
#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending)
#define isIOS8 ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)
#define IsIOS6 ([[[UIDevice currentDevice] systemVersion] compare:@"6" options:NSNumericSearch] != NSOrderedAscending)
