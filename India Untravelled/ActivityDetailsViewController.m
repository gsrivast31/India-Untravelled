//
//  ActivityDetailsViewController.m
//  India Untravelled
//
//  Created by Ranjeet on 5/1/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "FlatUIKit.h"
#import "OrganizerListViewController.h"

@interface ActivityDetailsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *distanceButton;
@property (weak, nonatomic) IBOutlet UIButton *levelButton;
@property (weak, nonatomic) IBOutlet UIButton *descendButton;
@property (weak, nonatomic) IBOutlet UIButton *ascendButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;

@property (nonatomic, strong) NSArray* entries;
@property (nonatomic, strong) NSArray* colors;
@property (nonatomic, strong) NSArray* bluecolors;
@property (nonatomic, strong) NSArray* greencolors;
@end

@implementation ActivityDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.entries = @[@{@"title":@"Why this trek", @"image":@"why"},
                     @{@"title":@"When to go", @"image":@"when"},
                     @{@"title":@"Route Guide", @"image":@"road"},
                     @{@"title":@"Historical Significance", @"image":@"historical"},
                     @{@"title":@"Geographical Significance", @"image":@"geography"},
                     @{@"title":@"Costing", @"image":@"cost"},
                     @{@"title":@"Photos and Videos", @"image":@"photos"},
                     @{@"title":@"How to reach", @"image":@"transport"},
                     @{@"title":@"Where to stay", @"image":@"home"},
                     @{@"title":@"Where to eat", @"image":@"eat"},
                     @{@"title":@"Attractions", @"image":@"attractions"},
                     @{@"title":@"Difficulty level", @"image":@"level"},
                     @{@"title":@"What to pack", @"image":@"pack"},
                     @{@"title":@"Permits", @"image":@"permits"},
                     @{@"title":@"Experiences", @"image":@"experiences"},
                     @{@"title":@"Trek Organizers", @"image":@"organizers"}
                     ];
    
    self.colors = @[@"#7ecef4", @"#84ccc9", @"#88abda", @"#7dc1dd", @"#b6b8de"];
    
    self.greencolors = @[@"#4ECDC4", @"#A2DED0", @"#87D37C", @"#90C695", @"#26A65B", @"#03C9A9", @"#68C3A3", @"#65C6BB", @"#1BBC9B", @"#1BA39C", @"#66CC99", @"#36D7B7", @"#86E2D5", @"#2ECC71", @"#16A085", @"#3FC380", @"#019875", @"#03A678", @"#4DAF7C", @"#2ABB9B", @"#00B16A", @"#1E824C", @"#049372", @"#26C281"];
    
    [self.shareButton addTarget:self action:@selector(showOrganizers:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)showOrganizers:(id)sender {
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:[[OrganizerListViewController alloc] init]];
    [self presentViewController:navVC animated:YES completion:nil];
}

#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.entries count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSDictionary* dict = [self.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict[@"title"] uppercaseString];
    cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
    //cell.backgroundColor = [UIColor colorFromHexCode:[self.bluecolors objectAtIndex:arc4random_uniform([self.bluecolors count] - 1)]];;
    cell.backgroundColor = [UIColor colorFromHexCode:[self.greencolors objectAtIndex:indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.tintColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont flatFontOfSize:18];
    return cell;
}

- (IBAction)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
