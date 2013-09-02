//
//  iSmartVDetailViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef _test
#define _test
#endif
@interface iSmartVDetailViewController : UITableViewController <UISplitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property float masterWidth;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSArray* back4split;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property  CGRect defaultFrame;
@property BOOL shouldHideMaster;
#ifdef _test
@property (strong, nonatomic) NSArray *computers;
#endif

@end
