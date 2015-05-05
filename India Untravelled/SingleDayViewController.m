//
//  SingleDayViewController.m
//  India Untravelled
//
//  Created by Ranjeet on 5/1/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "SingleDayViewController.h"
#import "SingleDayViewCell.h"

@interface SingleDayViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *leftArrowButton;
@property (weak, nonatomic) IBOutlet UIButton *rightArrowButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *distanceButton;
@property (weak, nonatomic) IBOutlet UIButton *ascendButton;
@property (weak, nonatomic) IBOutlet UIButton *descendButton;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSArray* entries;
@end

@implementation SingleDayViewController

- (UICollectionViewFlowLayout *)layout {
    return (id)self.photoCollectionView.collectionViewLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoCollectionView.dataSource = self;
    
    self.entries = @[@"trek2", @"trek3", @"trek4", @"stok", @"lamayurualchitrek", @"panrangla"];
    
    self.layout.minimumInteritemSpacing = 5.0f;
    self.layout.minimumLineSpacing = 5.0f;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
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
    
    UIBarButtonItem* mapButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"map"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = mapButton;

    [self addText];
}

- (void)dismissSelf:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addText {
    NSString* htmlStr = @"<html><body style=\"background: rgb(161, 221, 207);\"><p>Today is the actual start of the trek. Deciding to trek in Leh is for many like a dream come true, an experience which is highly valued and rare. Only a slight percentage of the trekkers is actually able to accomplish these treks and people who do are one of the most adventurous. Trekking in this part of the country requires strength and serious courage. After breakfast, your guide will give you briefing on the activities ahead.<br>The trekking starts with a drive to Stok village through a paved road. Before you start, always recheck that you have all the required stuff and supplies for the trek. As the drive starts from Leh, you will come across many beautiful and exotic scenes. The drive to the Stok Village is quite adventurous and has bounties of nature never before experienced. Full of lush green, silver birch trees and colourful flowers, there is no better ride. The weather is perfect during summers and roaming around is very peaceful. Stok Village is situated to the south of Leh and is well known for its royal palace and the King of Ladakh who resides here. If time permits do visit the grand palace and the museum attached to it. The museum hosts many religious and historic artefacts, which depict the history of Ladakh and its ancient rulers.<br><br>Stok Kangri is not a camping site, but the place where you start your walk to Chang Ma. As it is just beginning, the trek might be a bit difficult to start off. Experience the immense joy of trekking on snow and open up huge possibilities, for moving ahead. After a trek of around 4 hours, the destination for the day arrives. Chang Ma is a popular spot for camping, a firm open ground where tents can easily be placed. You will spend the night here, have your dinner quickly and go for an early sleep; the next day awaits many surprises.</p></body></html>";
    [self.webView loadHTMLString:htmlStr baseURL:nil];
}

#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.entries count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SingleDayViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self.entries objectAtIndex:indexPath.row]];
    return cell;
}

@end
