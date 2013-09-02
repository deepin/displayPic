//
//  iSmartVShowImageViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-28.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iSmartVHTTPClient.h"
#import "iSmartVMasterViewController.h"
#import "iSmartVDetailViewController.h"
@interface iSmartVShowImageViewController : UIViewController

- (IBAction)back2split:(id)sender;
@property (strong, nonatomic)  UIImageView *theimageview;
@property (strong, nonatomic)  UIImage *theimage;
@property (strong, nonatomic)  NSArray* theTableViewControllers;
@property (assign, nonatomic) CGRect *imageViewRect;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property float masterWidth;
//@property (strong, nonatomic)
@end
