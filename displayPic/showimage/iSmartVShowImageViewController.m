//
//  iSmartVShowImageViewController.m
//  masterDetailDemo
//
//  Created by LV on 13-8-28.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVShowImageViewController.h"
#import "iSmartVHTTPClient.h"
#import "Report.h"
#import "AFImageRequestOperation.h"
#import "iSmartVAppDelegate.h"  
@interface iSmartVShowImageViewController ()

@end 

@implementation iSmartVShowImageViewController
@synthesize theimageview;
@synthesize theimage;
@synthesize imageViewRect;
@synthesize masterWidth;
@synthesize theTableViewControllers;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willAnimateRotationToInterfaceOrientation:) name:@"willAnimateRotationToInterfaceOrientation" object:nil];
    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //UIImage *animage = [UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"];
    //[theimageview setImage:animage];//]initWithImage:animage];
    //imageViewRect = [theimageview];
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(doPinch:)];
    [self.view addGestureRecognizer:pinch];
    //self.wantsFullScreenLayout = YES;
    CGRect thescreen = [[UIScreen mainScreen] bounds];
    
  // if (UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
  //      float tmp = thescreen.size.width;
   //     thescreen.size.width = thescreen.size.height;
   //     thescreen.size.height = tmp;
   // }
    
   // self.view.frame = thescreen;
    //self.view.bounds = thescreen;
    if(!theimageview){
        
        theimageview = [[UIImageView alloc] initWithFrame:thescreen];
        if(theimageview){
            theimageview.contentMode = UIViewContentModeScaleAspectFill;
            
        }
        [self.view addSubview:theimageview];
        //[self.view insertSubview:theimageview belowSubview: _backButton];
        // CGRect thescreen = [[UIScreen mainScreen] bounds];
        // [contentViewController.view setFrame:thescreen];
        //theimageview.transform = CGAffineTransformMakeScale(0.6f, 0.6f);

    }
    if(!self.theTableViewControllers){
        UISplitViewController* splitViewController = self.splitViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers objectAtIndex:0];
        UIViewController* c0 =  [navigationController.viewControllers objectAtIndex:0];
        
        navigationController = [splitViewController.viewControllers objectAtIndex:1];
        UIViewController* c1 =  [navigationController.viewControllers objectAtIndex:0];
        
        self.theTableViewControllers = [NSArray arrayWithObjects:c0, c1, nil];
    }


/*    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://172.19.18.184:8000/ReportIosServer/2013/07/22/ChenDeGao_10002_150212/page/1"]];
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:request imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.theimageview.image=image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"EROOR%@",error);
    }];
    [operation start];*/
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation duration:(NSTimeInterval)duration
{   
   //NSLog(@"noti got");
    
    CGRect thescreen = [[UIScreen mainScreen] bounds];
    float tmp = thescreen.size.width;
    thescreen.size.width = thescreen.size.height;
    thescreen.size.height = tmp;
    
/*    if (UIInterfaceOrientationIsPortrait( UIInterfaceOrientationPortrait)) {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(0);
        self.view.bounds = [[UIScreen mainScreen] bounds];
        
        self.theimageview.transform = CGAffineTransformIdentity;
        self.theimageview.transform = CGAffineTransformMakeRotation(0);
        self.theimageview.bounds = [[UIScreen mainScreen] bounds];
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI /  (-2.0));
        self.view.bounds = thescreen;
        
        self.theimageview.transform = CGAffineTransformIdentity;
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI /  (-2.0));
        self.theimageview.bounds = [[UIScreen mainScreen] bounds];
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI / (2.0));
        self.view.bounds = thescreen;
        
        self.theimageview.transform = CGAffineTransformIdentity;
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI /  (2.0));
        self.theimageview.bounds = [[UIScreen mainScreen] bounds];
    }
    else {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI);
        self.view.bounds = [[UIScreen mainScreen] bounds];
        
        self.theimageview.transform = CGAffineTransformIdentity;
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI);
        self.theimageview.bounds = [[UIScreen mainScreen] bounds];
    }*/
/*     CGRect thescreen = [[UIScreen mainScreen] bounds];
    switch ( interfaceOrientation ) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            theimageview.frame = thescreen;
            break;
        default:
            theimageview.frame = CGRectMake( thescreen.origin.x, thescreen.origin.y, thescreen.size.height, thescreen.size.width );
            break;
    }*/
}

- (void)viewWillAppear:(BOOL)animated
{

    [super  viewWillAppear:animated];
    
    /*NSLog(@"imageview width: %f, imageview height: %f", theimageview.frame.size.width, theimageview.frame.size.height);
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        ;
    }
    else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI * 270.0 / 180.0);
    }
    else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI * 90.0 / 180.0);
    }
    else {
        self.theimageview.transform = CGAffineTransformMakeRotation(M_PI);
    }*/
    
    
    
   // [UIView setAnimationDuration:3];
    if(theimage) {
        [theimageview setImage: theimage];
        //theimage.size;
    }


    
   // [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

/*    if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        CGRect thescreen = [[UIScreen mainScreen] bounds];
        thescreen.size.height += [UIApplication
                                  sharedApplication].statusBarFrame.size.height;
        [self.view setFrame: thescreen];
        [self.theimageview setFrame: thescreen];

    }
    else{
        CGRect thescreen = [[UIScreen mainScreen] bounds];
        thescreen.size.height += [UIApplication
                                  sharedApplication].statusBarFrame.size.height;
        CGRect swap = CGRectMake(thescreen.origin.x, thescreen.origin.y, thescreen.size.height, thescreen.size.width);
        self.view.frame = swap;
    }*/
    //CGRect thescreen = [[UIScreen mainScreen] bounds];
    //[self.view setFrame:thescreen];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super  viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    //[[self.theTableViewControllers objectAtIndex:1] setValue:NO forKey:@"shouldHideMaster"];
    ((iSmartVDetailViewController*)[self.theTableViewControllers objectAtIndex:1]).shouldHideMaster = NO;
    NSDictionary *userInfo = @{
                               @"toInterfaceOrientation":@(self.interfaceOrientation),
                               @"duration":@(1)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"willAnimateRotationToInterfaceOrientation" object:nil userInfo:userInfo];
    
    NSLog(@"sending notification: showPic");
    
    
}
- (void)doPinch:(UIPinchGestureRecognizer *)pinch
{
    if (pinch.state == UIGestureRecognizerStateBegan) {
        ;//initialFontSize = label.font.pointSize;
    } else {
        
        [theimageview setImage:[UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"]];//label.font = [label.font fontWithSize:initialFontSize * pinch.scale];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Touches Began";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    //messageLabel.text = @"Touches Cancelled";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Touches Ended.";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Drag Detected";
    //[self updateLabelsFromTouches:touches];
}

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer {
    //label.text = @"Horizontal swipe detected";
    //[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}
- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer {
    //label.text = @"Vertical swipe detected";
    //[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (IBAction)back2split:(id)sender
{
    [self.view removeFromSuperview];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:Nil];
}
@end
