//
//  LSMasterViewController.m
//  BlogReader
//
//  Created by Luke on 2/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

// implements declared properties and variabels from header file
#import "LSMasterViewController.h"

// import so compiler aware using class within implementation
#import "LSDetailViewController.h"

// NOT REQUIRED INITIALLY
// defining private instance
//@interface LSMasterViewController () {
//    NSMutableArray *_objects;
//}
//@end

@implementation LSMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // array of titles alloc and init
    //self.titlesArray = [[NSArray alloc] initWithObjects:..., nil];
    
    // ALTERNATIVE CONVENIENCE METHOD (automatically does alloc and init)
    // use this array of strings property in methods of the data source (Table View)
    self.titlesArray = [NSArray arrayWithObjects:@"Blog1",
                                                @"Blog2",
                                                @"Blog3", nil];
    
    NSString *blogTitle = self.titlesArray[2];
    self.blogTitle = [blogTitle uppercaseString];
    NSLog(@"%@", [blogTitle uppercaseString]);
    
#pragma mark - 
#pragma mark Add/Edit Start
// NOT ADD OR EDIT INITIALLY
//    // setup edit button on nav bar
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    
//    // setup add button on nav bar
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
#pragma mark Add/Edit End
#pragma mark -
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Add Start
// NOT ADD INITIALLY
// method for inserting new rows in table view
//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}
#pragma mark Add End
#pragma mark -

#pragma mark - Table View

// defines qty of sections in table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // create list categories (for blog posts section separation)
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // assuming one section and one array.
    // returns the length of array
    
    // dot notation to reference count of titlesArray property
    //return self.titlesArray.count;
    
    // ALTERNATIVE (called as a method to the titlesArray property)
    return [self.titlesArray count];
    
    //return _objects.count;
}

// responsive technique that returns table view cell (of type UITableViewCell)
// indexPath is passed as an arguement to this method to tell the method the location of the cell to create
// cellForRowAtIndexPath is responsible for creating table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // WRONG METHOD (INEFFICIENT)
    // alloc and init a new table view cell for each row to be display in table view
    // gives as many rows and qty items in array, which is not good.
    // as if we have a thousand rows in array then have to alloc a thousand table view cells
    // causing app to be slow
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    // ALTERNATIVE allows table view to efficiently manage the cells with each cell having an
    // identifier identified in the storyboard so when table view cell scrolls beyond the screen the table view remarks it for reusability and recycles it for a new row
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    // store object from array into a variable
    //NSString *object = [self.titlesArray objectAtIndex:indexPath.row];
    
    // ALTERNATIVE (common convention)
    // indexPath is an Object with two Properties (Section, and a Row in that Section)
    // accessing the row property we know what Object to access for the Array and display in cell
    NSString *object = self.titlesArray[indexPath.row];
    
    // pass object to the text
    cell.textLabel.text = [object uppercaseString];
    return cell;
    
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    //return cell;
}

#pragma mark -
#pragma mark Add/Edit Start
// NOT ADD OR EDIT INITIALLY
//// editing table view
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}
//
///*
//// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//}
//*/
//
///*
//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}
//*/
#pragma mark Add/Edit End
#pragma mark -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
// NOT REQUIRED INITIALLY
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
