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
    
    self.entries = @[@"bkgnd1", @"bkgnd1"];
    
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
    NSString* htmlStr = @"<html><body><p>From <a href=\"#poi-26\">Crianlarich</a>, head back up to the trail that leads you west through the trees and then descends into Strath Fillan (just follow the A82 until you hit the trail again). You'll walk through this wide valley towards <a href=\"#poi-27\">Tyndrum</a>, passing underneath the railway and crossing the A82 and River Fillan to Kirkton Farm and what remains of St Fillan's Chapel. Less than a kilometer from there, you'll get to <a href=\"#poi-68\">Auchtertyre Farm</a>, a working farm that lets wigwams, has a small shop and serves tea and coffee.</p></body></html>";
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
