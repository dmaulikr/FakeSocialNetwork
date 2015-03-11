//
//  FSNFeedCollectionViewController.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-09.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNFeedCollectionViewController.h"

@interface FSNFeedCollectionViewController ()

@end

@implementation FSNFeedCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.feedItems count] > 0) {
        return [self.feedItems count];
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"feedItemCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [self cellBackgroundColorForItem:indexPath.item];
    
    return cell;
}

- (UIColor *)cellBackgroundColorForItem:(NSInteger)itemIndex {
    NSString *colorName = [[self.feedItems objectAtIndex:itemIndex] valueForKey:@"color"];
    UIColor *cellColor = [[UIColor alloc] init];
    if ([[UIColor class] respondsToSelector:NSSelectorFromString(colorName)]) {
        cellColor = [[UIColor class] performSelector:NSSelectorFromString(colorName)];
    } else {
        cellColor = [UIColor clearColor];
    }
    
    return cellColor;
}

@end