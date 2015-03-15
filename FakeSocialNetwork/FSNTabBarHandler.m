//
//  FSNTabBarHandler.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNTabBarHandler.h"
#import "FSNTabBarAnimator.h"

@interface FSNTabBarHandler ()
@property (nonatomic, strong) FSNTabBarAnimator *animator;
@end

@implementation FSNTabBarHandler

+ (instancetype)sharedInstance {
    static FSNTabBarHandler *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.animator = [[FSNTabBarAnimator alloc] init];
    });
    
    return sharedInstance;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self.animator;
}

@end
