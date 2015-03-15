//
//  FSNTabBarAnimator.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-14.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNTabBarAnimator.h"

@implementation FSNTabBarAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UITabBarController *tabBarController = fromViewController.tabBarController;
    
    // get the index to check later if we should animate right or left
    int fromControllerIndex = [tabBarController.viewControllers indexOfObject:fromViewController];
    
    // Get the size of the view area.
    CGRect viewSize = fromViewController.view.frame;
    BOOL shouldScrollRight = fromControllerIndex < tabBarController.selectedIndex;
    
    // Add the view to the tab bar view.
    [[transitionContext containerView] addSubview:toViewController.view];
    
    // Position it off screen.
    toViewController.view.frame = CGRectMake((shouldScrollRight ? 320 : -320), viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations: ^{
                         // Animate the views on and off the screen. This will appear to slide.
                         fromViewController.view.frame = CGRectMake((shouldScrollRight ? -320 : 320), viewSize.origin.y, 320, viewSize.size.height);
                         toViewController.view.frame = CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
                     }
     
                     completion:^(BOOL finished) {
                         if (finished) {
                             [transitionContext completeTransition:YES];
                         }
                     }];
}

@end
