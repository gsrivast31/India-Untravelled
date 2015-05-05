//
//  OrganizerListViewController.m
//  India Untravelled
//
//  Created by GAURAV SRIVASTAVA on 13/02/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "OrganizerListViewController.h"
#import "OrganizerCell.h"
#import "FlatUIKit.h"

@interface OrganizerListViewController ()

@property (nonatomic, strong) NSArray* entries;

@end

@implementation OrganizerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TREK ORGANIZERS";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:241.0/255.0 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.entries = @[@{@"title":@"GIO adventures", @"date":@"Jul-Sep", @"cost":@"Rs. 25,500 per person", @"ratings":[NSNumber numberWithInteger:4]},
                     @{@"title":@"Trek the Himalayas", @"date":@"Jun-Aug", @"cost":@"Rs. 16,500 per person", @"ratings":[NSNumber numberWithInteger:4]},
                     @{@"title":@"365 Hops", @"date":@"Jun-Aug", @"cost":@"Rs. 17,000 per person", @"ratings":[NSNumber numberWithInteger:4]},
                     @{@"title":@"India Hikes", @"date":@"Jul-Aug", @"cost":@"Rs. 18,750 per person", @"ratings":[NSNumber numberWithInteger:4]}
                     ];
    
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
    
    UIBarButtonItem* sortButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sort"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = sortButton;

    self.tableView.backgroundColor = [UIColor colorFromHexCode:@"#A2DED0"];

}

- (void)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.entries count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* CellIdentifier = @"Cell";
    OrganizerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"OrganizerCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    NSDictionary* dict = [self.entries objectAtIndex:indexPath.section];
    cell.dateLabel.text = [dict valueForKey:@"date"];
    cell.titleLabel.text = [dict valueForKey:@"title"];
    cell.costLabel.text = [dict valueForKey:@"cost"];
    
    NSNumber* ratings = [dict objectForKey:@"ratings"];
    cell.backgroundColor = [UIColor clearColor];
    [cell configureWithStars:[ratings integerValue]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0f;
}

@end
