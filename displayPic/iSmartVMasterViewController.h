//
//  iSmartVMasterViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iSmartVDetailViewController;

@interface iSmartVMasterViewController : UITableViewController

@property (strong, nonatomic) iSmartVDetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *patients;
@property (strong, nonatomic) NSMutableArray *reports;
@property  CGRect defaultFrame;
@end
