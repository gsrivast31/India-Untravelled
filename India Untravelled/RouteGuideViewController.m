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
    
    self.entries = @[
                     @{@"title":@"Arrive at Leh", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@"The best option to get to Leh is via air. To reach there via road is in itself a trek, as it takes many days and drains out your energy. All major airlines provide flight services from Indira Gandhi International Airport, New Delhi to Leh. Flights to Leh are scheduled to reach before noon or latest by 3pm. While you enter Ladakh, do not forget to look down to one of the most astonishing views of the landscape. The breathtakingly stunning view from the aircraft window is just the beginning; there are many surprises left in the box. The huge Himalayan mountains are taller than any other mountain ranges on the planet. With deep valleys and gorges, Ladakh has all the bounties and miracles of nature. When you land at the Ladakh airport, the sudden drop in temperature will take you by surprise and send a chill running down your spine. The average temperature in Leh stays around the 10 degree C mark, and during winters it can drop down to a bone chilling -20 degrees C or even lower. The air has a distinct freshness and crispiness in it and you will feel like breathing pure air. The chill in the air provides slight indication about the temperatures during the trek to Stok Kangri."},
                     @{@"title":@"Leh (Acclimatization day)", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@"Stok Kangri is the tallest mountain in the area, and there is no place in Leh, from where it is not visible. There is no ignoring the huge mountain of Stok Kangri, the final destination of the trek. The morning hot tea is served, which does adds a lot of antioxidants to our body, but most importantly gives motivation to wake up. After a healthy breakfast, the day calls for acclimatization to the harsh and extreme temperature and environmental conditions that will prevail for the rest of the trek. Today you can enjoy the natural and cultural beauty of Leh and its surroundings. You can consider this day to get accustomed with the place and its rich culture and heritage. It is vital to have your first acclimatization night after arriving at altitudes of more than 3000 mts, before you venture out to higher altitudes."},
                     @{@"title":@"Leh to Chang Ma via Stok Village", @"distance":@"7 km", @"time":@"4 hrs", @"ascend":@"", @"descend":@"", @"description":@"Today is the actual start of the trek. Deciding to trek in Leh is for many like a dream come true, an experience which is highly valued and rare. Only a slight percentage of the trekkers is actually able to accomplish these treks and people who do are one of the most adventurous. Trekking in this part of the country requires strength and serious courage. After breakfast, your guide will give you briefing on the activities ahead."},
                     @{@"title":@"Chang Ma (13087 ft.) to Mankorma (14200 ft.)", @"distance":@"", @"time":@"3 hrs", @"ascend":@"", @"descend":@"", @"description":@"Today the trek is to Mankorma, at an altitude of 14200 ft. The day’s trek will involve some climb. The walk will traverse through the rough and barren landscape of Ladakh. The landscape is astonishingly beautiful, and the huge mountains add glory to it. It is crucial to maintain a healthy rhythm between your trek mates. There will not be any trees on the trek. But this is the actual beauty of Ladakh; grey barren lands make Ladakh the highest cold desert on the planet. The winds are quite strong and gusty and might even sway you from side to side. Do look forward to seeing valleys and vast barren lands."},
                     @{@"title":@"Mankorma (14200 ft.) to Base camp (16300 ft.)", @"distance":@"", @"time":@"", @"ascend":@"", @"descend":@"", @"description":@"Day 05 will take you to the Stok Kangri Base Camp. At an altitude of 5000m the base camp will be the starting point for the summit. The base campsite is a place where you can enjoy to the fullest. It takes roughly 5 hours to reach the campsite, and the trek is beautiful in its own way. The area has many water bodies around it, and when the sun rays fall on it, they sparkle like diamonds. The air becomes considerably thinner as you climb. When you reach the base camp you have to try hard to breathe. The temperature here is considerably less than the other places in the trek. After having lunch and an hour of rest, go to the nearby mountain peaks of Gulap Kangri, Parcha Kangri and many others."}
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
    
    NSString* ascendText = [dict valueForKey:@"ascend"];
    NSString* descendText = [dict valueForKey:@"descend"];
    NSString* distanceText = [dict valueForKey:@"distance"];
    NSString* timeText = [dict valueForKey:@"time"];
    
    if (ascendText && ![ascendText isEqualToString:@""]) {
        cell.ascendImageView.hidden = NO;
    } else {
        cell.ascendImageView.hidden = YES;    }
    
    if (descendText && ![descendText isEqualToString:@""]) {
        cell.descendImageView.hidden = NO;
    } else {
        cell.descendImageView.hidden = YES;
    }

    NSString* detailText = distanceText;
    if (timeText && ![timeText isEqualToString:@""]) {
        if (detailText && ![detailText isEqualToString:@""]) {
            detailText = [detailText stringByAppendingFormat:@" / %@", timeText];
        } else {
            detailText = timeText;
        }
    }
    
    if (detailText && ![detailText isEqualToString:@""]) {
        cell.distanceImageView.hidden = NO;
    } else {
        cell.distanceImageView.hidden = YES;
    }

    cell.ascendLabel.text = ascendText;
    cell.descendLabel.text = descendText;
    cell.distanceLabel.text = detailText;
    
    cell.dayMarkerLabel.text = [[NSString stringWithFormat:@"Day %ld", (long)indexPath.row] uppercaseString];
    cell.titleLabel.text = [[dict valueForKey:@"title"] uppercaseString];
    
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
