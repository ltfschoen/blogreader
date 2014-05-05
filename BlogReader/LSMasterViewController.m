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

#import "BlogPost.h"

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
    
    // test access instance variable from custom class BlogPost using dot notation
    BlogPost *blogPost = [[BlogPost alloc] init];
    blogPost.someTitle = @"test title";
    blogPost.someAuthor = @"test author";
    NSString *string = blogPost.someTitle;
    // ALTERNATIVE #1
    //NSString *string =[blogPost title];
    // ALTERNATIVE #2 call method to set instance title of BlogPost object 
    //[blogPost setTitle:@"some title"];
    NSLog(@"%@", string);
    
    // more readable than blogPost.unread
    if (blogPost.isUnread) {
        NSLog(@"%@", @"hi");
    }

    // create NSURL class object a convenience class to breakdown url
    //NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSURL *blogURL = [NSURL URLWithString:@"http://www.omdbapi.com/?s=Terminator"];
    
    // download the data (NSData object stream from JSON)
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    // take the data which is in byte format and parse it so understood by NSDictionary
    
    // declare pointer in memory
    NSError *error = nil;
    
    // deserialise data into JSON object format so can be stored in dictionary
    // pass a pointer reference to NSError so value can be modified by the method passing it to (otherwise just passing by value and can only read
    // i.e. &__  means value can be modified by the method
    // i.e. ___  means just passing its the value and it can only read your object
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSLog(@"%@", dataDictionary);
    
    
// REMOVED AS RETRIEVING FROM JSON URL
    // all blog posts are contained in a 'posts' array, so pass it the key 'posts'
    
    // declaration for key value pair
    //NSDictionary *blogPost1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Blogpost1", @"title", @"Luke Schoen", @"author", nil];
    
    // ALTERNATIVE convenience constructor for NSDictionary
//    NSDictionary *blogPost1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Blogpost1", @"title",@"Luke Schoen", @"author", nil];
//    
//    NSDictionary *blogPost2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Blogpost2", @"title",@"Claudia Lucero", @"author", nil];
//    
//    NSDictionary *blogPost3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Blogpost3", @"title",@"Luke Schoen", @"author", nil];
//    
//    NSLog(@"%@", blogPost1);
//    NSLog(@"%@", blogPost2);
//    NSLog(@"%@", blogPost3);
    
//    // create an array of blogposts (NSDictionary Objects)
//    self.blogPosts = [NSArray arrayWithObjects:blogPost1,blogPost2, blogPost3, nil];
    
    
    // send message to dataDictionary that returns array of blog posts from JSON
    //self.blogPosts = [dataDictionary objectForKey:@"posts"];
    self.blogPosts = [dataDictionary objectForKey:@"Search"];
    
    
    // array of titles alloc and init
    //self.titlesArray = [[NSArray alloc] initWithObjects:..., nil];
    
    
// REPLACED WITH ARRAY OF NSDICTIONARY 'BLOGPOSTS' OBJECTS ABOVE (INSTEAD OF WITH NAME 'TITLE')
//    // ALTERNATIVE CONVENIENCE METHOD (automatically does alloc and init)
//    // use this array of strings property in methods of the data source (Table View)
//    // alloc and initialise the array
//    self.titlesArray = [NSArray arrayWithObjects:@"Blog1",
//                                                @"Blog2",
//                                                @"Blog3", nil];

//    NSMutableArray *elements = [NSMutableArray array];
//    
//    [elements addObject:@"Helium"];
//    [elements addObject:@"Neon"];
//    [elements addObject:@"Argon"];
//    
//    NSLog(@"%@", elements);
    
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // assuming one section and one array.
    // returns the length of array
    
    // dot notation to reference count of titlesArray property
    //return self.titlesArray.count;
    
    // ALTERNATIVE (called as a method to the titlesArray property)
    return [self.blogPosts count];
    
    //return _objects.count;
}

// responsive technique that returns table view cell (of type UITableViewCell)
// indexPath is passed as an arguement to this method to tell the method the location of the cell to create
// cellForRowAtIndexPath is responsible for creating table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // WRONG METHOD (INEFFICIENT MEMORY MANAGEMENT)
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
    
    // gives blogpost at particular row (NSDictionary object, not just a string like when it was an Array)
    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    // take NSDictionary and extract 'title' from it to set our cell textLabel
    cell.textLabel.text = [blogPost valueForKey:@"Title"];
    cell.detailTextLabel.text = [blogPost valueForKey:@"Year"];
    
// REPLACED WITH ARRAY OF NSDICTIONARY 'BLOGPOSTS' OBJECTS ABOVE (INSTEAD OF WITH NAME 'TITLE')
//    // ALTERNATIVE (common convention)
//    // indexPath is an Object with two Properties (Section, and a Row in that Section)
//    // accessing the row property we know what Object to access for the Array and display in cell
//    NSString *object = self.titlesArray[indexPath.row];

//    // pass object to the text
//    cell.textLabel.text = [object uppercaseString];
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
    // method (rather than dot notation) used to check Segue identifier 'showDetail' matches the one in the storyboard
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        // get indexPath of the selected row
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // access appropriate title from titlesArray
        NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        //NSString *title = self.titlesArray[indexPath.row];
        // get DetailViewController (destination) and get it to the title from the array
        // method chaining used. perform setDetailItem on return value of [segue ...]
        [[segue destinationViewController] setDetailItem:blogPost];

        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
