//
//  RouteGuideViewController.m
//  India Untravelled
//
//  Created by Ranjeet on 5/1/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "RouteGuideViewController.h"
#import "RouteGuideViewCell.h"
#import "FlatUIKit.h"

@interface RouteGuideViewController ()

@property (nonatomic, strong) NSArray* entries;
@property (nonatomic, strong) NSArray* colors;

@end

@implementation RouteGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.entries = @[@{@"title":@"Sample1", @"distance":@"5km", @"time":@"6 Hrs", @"ascend":@"5km", @"descend":@"0km", @"description":@"Sampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsd"},
                     @{@"title":@"Sample2", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@""},
                     @{@"title":@"Sample3", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@""},
                     @{@"title":@"Sample4", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@"Sampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsdSampe extdcjdfdkdfdkfjdkm,ndkfhdjfndjfndkfndjfndjfdfdhfjdnfjdnfjdfdjfndjfdjfdjfdjfdjfbdjfbdjfbjdfbdjfbdjfbdjfbddddddfmncm dfsydvcnsd"},
                     @{@"title":@"Sample5", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@""}
                     ];
    
    
    self.colors = @[@"#7ecef4",
                    @"#84ccc9",
                    @"#88abda",
                    @"#7dc1dd",
                    @"#b6b8de"];
    
    self.title = @"STOK KANGRI EXPEDITION";
    
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

    self.tableView.backgroundColor = [UIColor colorFromHexCode:@"#A2DED0"];
}

- (void)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RouteGuideViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configureCell];
    cell.markerInnerView.backgroundColor = [UIColor colorFromHexCode:[self.colors objectAtIndex:arc4random_uniform([self.colors count] - 1)]];
    
    NSDictionary* dict = [self.entries objectAtIndex:indexPath.row];
    
    cell.dayMarkerLabel.text = [[NSString stringWithFormat:@"Day %ld", (long)indexPath.row] uppercaseString];
    cell.titleLabel.text = [[dict valueForKey:@"title"] uppercaseString];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%@ / %@", [dict valueForKey:@"distance"], [dict valueForKey:@"time"]];
    cell.ascendLabel.text = [dict valueForKey:@"ascend"];
    cell.descendLabel.text = [dict valueForKey:@"descend"];
    cell.descriptionLabel.text = [dict valueForKey:@"description"];
    
    cell.dayMarkerLabel.font = [UIFont flatFontOfSize:12];
    cell.dayMarkerLabel.textColor = [UIColor whiteColor];
    cell.titleLabel.font = [UIFont flatFontOfSize:16];
    cell.distanceLabel.font = [UIFont flatFontOfSize:12];
    cell.ascendLabel.font = [UIFont flatFontOfSize:12];
    cell.descendLabel.font = [UIFont flatFontOfSize:12];
    cell.descriptionLabel.font = [UIFont flatFontOfSize:13];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat baseHeight = 88.0f;

    NSString* desc = [self.entries objectAtIndex:indexPath.row][@"description"];
    
    CGFloat availWidth = tableView.bounds.size.width - 110.0f;
    if (desc && ![desc isEqualToString:@""]) {
        CGFloat descHeight = [desc boundingRectWithSize:CGSizeMake(availWidth, INFINITY) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]} context:nil].size.height;
        baseHeight += MIN(descHeight, 100.0f);
    }
    return baseHeight;
}
@end
