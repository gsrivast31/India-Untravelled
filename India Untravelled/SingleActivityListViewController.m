//
//  SingleActivityListViewController.m
//  India Untravelled
//
//  Created by Ranjeet on 4/30/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "SingleActivityListViewController.h"
#import "SingleActivityListViewCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "FlatUIKit.h"

@interface SingleActivityListViewController () <CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) NSArray *activities;
@property (nonatomic, strong) NSMutableArray *cellSizes;

@end

@implementation SingleActivityListViewController

static NSString * const reuseIdentifier = @"Cell";

- (CHTCollectionViewWaterfallLayout *)layout {
    return (id)self.collectionView.collectionViewLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.layout.minimumColumnSpacing = 2;
    self.layout.minimumInteritemSpacing = 2;
    
    self.activities = @[@{@"title":@"Valley of Flowers", @"place":@"Himachal", @"detail":@"40Km", @"image":@"valleyofflowers"},
                        @{@"title":@"Lamayuru-Alchi", @"place":@"Leh", @"detail":@"5-6 Days", @"image":@"lamayurualchitrek"},
                        @{@"title":@"Stok Kangri", @"place":@"Leh", @"detail":@"40km/9Days", @"image":@"stok"},
                        @{@"title":@"Chadar Trek", @"place":@"Leh", @"detail":@"12 days", @"image":@"chadar trek"},
                        @{@"title":@"Parangla Trek", @"place":@"Leh", @"detail":@"25Km", @"image":@"parangla"},
                        @{@"title":@"Tso Moriri Trek", @"place":@"Leh", @"detail":@"25Km", @"image":@"trek2"},
                        @{@"title":@"Tso Moriri Trek", @"place":@"Leh", @"detail":@"25Km", @"image":@"trek3"},
                        @{@"title":@"Tso Moriri Trek", @"place":@"Leh", @"detail":@"25Km", @"image":@"trek4"},
                        ];
    
    UIBarButtonItem* filterButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = filterButton;
    
    if(!self.navigationItem.leftBarButtonItem) {
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [backButton setImage:[[UIImage imageNamed:@"NavBarIconBack.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [backButton setTitle:self.navigationItem.backBarButtonItem.title forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(dismissSelf:) forControlEvents:UIControlEventTouchUpInside];
        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10.0f, 0, 0)];
        [backButton setAdjustsImageWhenHighlighted:NO];
        
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        [self.navigationItem setLeftBarButtonItem:backBarButtonItem];
    }
    
    self.title = @"HIKING";
}

- (void)dismissSelf:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSMutableArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = [NSMutableArray array];
        for (NSInteger i = 0; i < [self.activities count]; i++) {
            CGSize size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
            _cellSizes[i] = [NSValue valueWithCGSize:size];
        }
    }
    return _cellSizes;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.activities count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SingleActivityListViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self.activities objectAtIndex:indexPath.row][@"image"]  ];
    cell.titleLabel.text = [self.activities objectAtIndex:indexPath.row][@"title"];
    cell.placeLabel.text = [self.activities objectAtIndex:indexPath.row][@"place"];
    cell.detailLabel.text = [self.activities objectAtIndex:indexPath.row][@"detail"];
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.titleLabel.font = [UIFont flatFontOfSize:13];
    cell.titleLabel.textColor = [UIColor whiteColor];
    cell.placeLabel.font = [UIFont flatFontOfSize:11];
    cell.placeLabel.textColor = [UIColor whiteColor];
    cell.detailLabel.font = [UIFont flatFontOfSize:11];
    cell.detailLabel.textColor = [UIColor whiteColor];

    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item] CGSizeValue];
}

@end
