//
//  main.m
//  seePlist
//
//  Created by Lucian on 16/7/25.
//  Copyright © 2016年 Lucian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        //command+点击NSStringFromClass可以看到头文件中说明如下：
        // If nil is specified for principalClassName, the value for NSPrincipalClass from the Info.plist is used. If there is no
        // NSPrincipalClass key specified, the UIApplication class is used. The delegate class will be instantiated using init.
    }
}
