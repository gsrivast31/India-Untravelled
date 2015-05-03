//
//  ActivitiesViewController.m
//  India Untravelled
//
//  Created by Ranjeet on 4/30/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "ActivitiesViewController.h"
#import "KRLCollectionViewGridLayout.h"
#import "ActivitiesViewCell.h"
#import "FlatUIKit.h"

@interface ActivitiesViewController ()

@property (nonatomic, strong) NSArray *activities;

@end

@implementation ActivitiesViewController

static NSString * const reuseIdentifier = @"Cell";

- (KRLCollectionViewGridLayout *)layout {
    return (id)self.collectionView.collectionViewLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"INDIA UNTRAVELLED";
    self.layout.numberOfItemsPerLine = 2;
    self.layout.aspectRatio = 1;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.layout.interitemSpacing = 0;
    self.layout.lineSpacing = 0;
    
    self.activities = @[@{@"title":@"HIKING", @"image":@"hike2"},
                        @{@"title":@"DRIVING", @"image":@"biking2"},
                        @{@"title":@"WILDLIFE", @"image":@"wildlife2"},
                        @{@"title":@"BACKPACKING", @"image":@"backpacking"},
                        @{@"title":@"CYCLING", @"image":@"cycling3"},
                        @{@"title":@"HISTORY WALKS", @"image":@"history"},
                        @{@"title":@"MOUNTAIN BIKING", @"image":@"mountainbiking"},
                        @{@"title":@"PARAGLIDING", @"image":@"paragliding1"},
                        @{@"title":@"SCUBA DIVING", @"image":@"scubadiving"},
                        @{@"title":@"Festivals", @"image":@"festival"},
                        @{@"title":@"Fishing", @"image":@"fishing"},
                        @{@"title":@"Photography", @"image":@"photography"},
                        @{@"title":@"Rock climbing", @"image":@"rockclimbing1"},
                        @{@"title":@"Snorkeling", @"image":@"snorkeling2"},
                        @{@"title":@"Snowboarding", @"image":@"snowboarding1"},
                        @{@"title":@"Surfing", @"image":@"surfing1"},
                        @{@"title":@"Walking", @"image":@"walking"},
                        @{@"title":@"Balloon Rides", @"image":@"balloon3"},
                        ];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBarIconListMenu"] style:UIBarButtonItemStylePlain target:self action:nil];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.activities count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ActivitiesViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self.activities objectAtIndex:indexPath.row][@"image"]  ];
    NSString* text = [self.activities objectAtIndex:indexPath.row][@"title"];
    cell.titleLabel.text = text;
    cell.titleLabel.font = [UIFont flatFontOfSize:20];
    cell.titleLabel.textAlignment = NSTextAlignmentCenter;
    cell.titleLabel.textColor = [UIColor whiteColor];
    cell.titleLabel.numberOfLines = 2;
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

@end
