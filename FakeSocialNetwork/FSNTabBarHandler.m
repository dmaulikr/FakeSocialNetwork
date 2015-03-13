//
//  FSNTabBarHandler.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNTabBarHandler.h"

@implementation FSNTabBarHandler

+ (instancetype)sharedInstance {
    static FSNTabBarHandler *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    // get the index to check later if we should animate right or left
    int controllerIndex = [tabBarController.viewControllers indexOfObject:viewController];
    if (controllerIndex == tabBarController.selectedIndex) {
        return YES;
    }
    
    // Get the views.
    UIView *fromView = tabBarController.selectedViewController.view;
    UIView *toView = [[tabBarController.viewControllers objectAtIndex:controllerIndex] view];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    BOOL shouldScrollRight = controllerIndex > tabBarController.selectedIndex;
    
    // Add the view to the tab bar view.
    [fromView.superview addSubview:toView];
    
    // Position it off screen.
    toView.frame = CGRectMake((shouldScrollRight ? 320 : -320), viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:0.3
                     animations: ^{
                         // Animate the views on and off the screen. This will appear to slide.
                         fromView.frame =CGRectMake((shouldScrollRight ? -320 : 320), viewSize.origin.y, 320, viewSize.size.height);
                         toView.frame =CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
                     }
     
                     completion:^(BOOL finished) {
                         if (finished) {
                             // Remove the old view from the tabbar view.
                             [fromView removeFromSuperview];
                             tabBarController.selectedIndex = controllerIndex;                
                         }
                     }];
    
    return YES;
}

@end
