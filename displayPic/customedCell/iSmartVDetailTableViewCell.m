//
//  iSmartVDetailTableViewCell.m
//  masterDetailDemo
//
//  Created by LV on 13-8-23.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVDetailTableViewCell.h"
#ifndef _test
#define _test
#endif

#ifdef _codeCell
#define kDateValueTag 1
#define kTitleValueTag 2
#endif


@implementation iSmartVDetailTableViewCell

@synthesize title;
@synthesize date;
@synthesize titleLabel;
@synthesize dateLabel;

#ifdef _codeCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
#ifdef _test
#ifdef _codeCell
        CGRect titleLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
        titleLabel.text = @"View:";
        titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview: titleLabel];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:colorLabelRect];
        dateLabel.text = @"Date:";
        dateLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview: dateLabel];
        
        CGRect titleValueRect = CGRectMake(80, 5, 200, 15);
        UILabel *titleValue = [[UILabel alloc] initWithFrame: titleValueRect];
        titleValue.tag = kTitleValueTag;
        [self.contentView addSubview:titleValue];
        
        CGRect dateValueRect = CGRectMake(80, 25, 200, 15);
        UILabel *dateValue = [[UILabel alloc] initWithFrame: dateValueRect];
        dateValue.tag = kDateValueTag;
        [self.contentView addSubview:dateValue];
#endif
#endif
    }
    return self;
}
#endif


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)n {
    if (![n isEqualToString:title]) {
        title = [n copy];
#ifdef _codeCell
        UILabel *titleLabel2 = (UILabel *)[self.contentView viewWithTag:
                                         kTitleValueTag];
#endif
        titleLabel.text = title;
    }
}

- (void)setDate:(NSString *)c
{

    if (![c isEqualToString:date]) {
        date = [c copy];
#ifdef _codeCell
        UILabel *dateLabel2 = (UILabel *)[self.contentView viewWithTag: kDateValueTag];
#endif
        dateLabel.text = date;
    }
}
@end
