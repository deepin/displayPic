//
//  iSmartVDetailTableViewCell.h
//  masterDetailDemo
//
//  Created by LV on 13-8-23.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef _test
#define _test
#endif
@interface iSmartVDetailTableViewCell : UITableViewCell
#ifdef _test
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *date;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

#endif
@end
