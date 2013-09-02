//
//  iSmartVMasterViewController.m
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVMasterViewController.h"

#import "iSmartVDetailViewController.h"
#import "iSmartVHTTPClient.h"

@interface iSmartVMasterViewController () {
    NSMutableArray *_objects;
    
}
@end

@implementation iSmartVMasterViewController
@synthesize patients;
@synthesize reports;
@synthesize defaultFrame;
- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.defaultWidth = self.view.frame.size.width;
    
    self.title = @"the master view";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (iSmartVDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.defaultFrame = self.view.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refreshFromServer: (id)sender
{
    //fill mutablearray -- patients and reports -- with new data
    [self.tableView reloadData];
}
/*- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = [[_objectsArray objectAtIndex: indexPath.section] objectAtIndex:indexPath.row ];
        //[[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
#ifdef _test
   // [self.navigationController pushViewController:nextController animated:YES];
#endif
}







-(void) iSmartVHTTPClient:(iSmartVHTTPClient *)client didFailWithError:(NSError *)error
{
    NSLog(@"Error");
    //self.testResult.text = @"DownLoad Error";
}

-(void) iSmartVHTTPClient:(iSmartVHTTPClient *)client didUpdateWithPatient:(id)newPatient
{
    
}

-(void) iSmartVHTTPClient:(iSmartVHTTPClient *)client didUpdateWithReport:(id)newReport
{
    //self.report = newReport;
    //NSLog(@"Successfully Got Report:%@",self.report);
    
    
    //Report *reportFromService  = [[Report alloc] init];
    //reportFromService.checkTimeStr=[self.report objectForKey:@"CheckTimeStr"];
    //NSDictionary *patientInfo = [self.report objectForKey:@"PatientInfo"];
    //reportFromService.patientID = [patientInfo objectForKey:@"Id"];
    
    
    //self.testResult.text = reportFromService.patientID;
    
    
    //NSLog(@"Time:%@",reportFromService.createDate);
    //self.testResult.text = @"Success!";
    
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {

}

@end
