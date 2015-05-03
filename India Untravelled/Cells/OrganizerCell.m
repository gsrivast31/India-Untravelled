//
//  OrganizerCell.m
//  India Untravelled
//
//  Created by GAURAV SRIVASTAVA on 13/02/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "OrganizerCell.h"
#import "FlatUIKit.h"
#import "NSString+Icons.h"

@implementation OrganizerCell

- (void)configureWithStars:(NSInteger)stars {
    self.titleLabel.font = [UIFont flatFontOfSize:18];
    self.dateLabel.font = [UIFont flatFontOfSize:16];
    self.costLabel.font = [UIFont flatFontOfSize:18];
    self.ratingLabel.font = [UIFont iconFontWithSize:12];
    self.ratingLabel.textColor = [UIColor turquoiseColor];
    
    NSString* text = @"";
    for (NSInteger i=0; i<stars; i++) {
        text = [text stringByAppendingString:[NSString iconStringForEnum:FUIStar2]];
    }
    self.ratingLabel.text = text;
    self.lineView.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:60.0/255.0 blue:74.0/255.0 alpha:0.5];
}

@end
