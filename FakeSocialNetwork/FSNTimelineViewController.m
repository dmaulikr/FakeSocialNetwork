//
//  FSNTimelineViewController.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-09.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//


#import "FSNTimelineViewController.h"
#import "FSNPostTableViewCell.h"
#import "FSNUser.h"
#import "FSNPost.h"
#import "UIColor+FSNColor.h"
#import "FSNTabBarHandler.h"
#import "FSNSentiment.h"


@interface FSNTimelineViewController ()
@property (nonatomic, strong) NSMutableArray *posts;
@end

@implementation FSNTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupTabBar];
    [self prepareMockPosts];
    [self prepareTableViewAppearance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareTableViewAppearance {
    self.tableView.estimatedRowHeight = 70.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)setupNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"create_new-75"] style:UIBarButtonItemStylePlain target:self action:@selector(addPost)];
    self.navigationItem.title = @"Home";
}

- (void)setupTabBar {
    self.tabBarController.delegate = [FSNTabBarHandler sharedInstance];
}

- (void)addPost {
    NSLog(@"adding post");
}

- (void)prepareMockPosts {
    FSNUser *renato = [[FSNUser alloc] initWithName:@"Renato Camilio" andUserID:@"@recamilio" andAvatar:[UIImage imageNamed:@"renato"]];
    FSNUser *cory = [[FSNUser alloc] initWithName:@"Cory CoolKid" andUserID:@"@deCooler" andAvatar:[UIImage imageNamed:@"cory"]];
    FSNUser *danny = [[FSNUser alloc] initWithName:@"Danny Mathews" andUserID:@"@notSoFunny" andAvatar:[UIImage imageNamed:@"danny"]];
    
    FSNPost *renatoPost = [[FSNPost alloc] initWithContent:@"How cool is that?" andAuthor:renato];
    FSNPost *dannyPost = [[FSNPost alloc] initWithContent:@"In this fake social network I'll get people laughing of my jokes, just loved it! So cooollll!!!" andAuthor:danny];
    FSNPost *coryPost = [[FSNPost alloc] initWithContent:@"Are you talking about me, guys? @recamilio @notSoFunny" andAuthor:cory];
    
    FSNSentiment *sentimentAnalyzer = [[FSNSentiment alloc] init];
    FSNPost *renatoPost2 = [[FSNPost alloc] initWithContent:@"I am happy" andAuthor:renato];
    FSNPost *renatoPost3 = [[FSNPost alloc] initWithContent:@"I am very happy" andAuthor:renato];
    FSNPost *renatoPost4 = [[FSNPost alloc] initWithContent:@"I am not very happy" andAuthor:renato];
    [sentimentAnalyzer scoreForPost:renatoPost4];
    
    self.posts = [[NSMutableArray alloc] initWithArray:@[dannyPost, renatoPost, coryPost]];
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FSNPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FSNPostTableViewCell class]) forIndexPath:indexPath];
    
    // do something with the cell
    FSNPost *post = [self.posts objectAtIndex:indexPath.row];
    cell.avatarImageView.image = post.author.avatar;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM, dd"];
    cell.postDate.text = [dateFormatter stringFromDate:post.postedDate];
    
    cell.postText.text = post.content;
    cell.userName.text = post.author.name;
    cell.userID.text = post.author.userID;
    
    return cell;
}

#pragma mark - TableView Delegate


@end
