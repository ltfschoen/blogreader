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
    
    // alloc and init using Dedicated Initalizer 'initWithTitle'
    // Dedicated Initalizer ensures when initialize BlogPost it must have a Title
    // creates a valid instance of BlogPost with a new title
//    BlogPost *bp = [[BlogPost alloc] initWithTitle:@"some title"];
//    bp.someAuthor = @"Author";
    
    // create another BlogPost Instance using CONVENIENCE CONSTRUCTOR
    // call Class method directly instead of having to allocate it because
    // inside this Class we are allocating a new Instance of BlogPost already
//    BlogPost *bp1 = [BlogPost blogPostWithTitle:@"another title"];
//    bp1.someTitle = @"Luke";
    
    // test access instance variable from custom class BlogPost using dot notation
//    BlogPost *blogPost = [[BlogPost alloc] init];
//    blogPost.someTitle = @"test title";
//    blogPost.someAuthor = @"test author";
//    NSString *string = blogPost.someTitle;
    // ALTERNATIVE #1
    //NSString *string =[blogPost title];
    // ALTERNATIVE #2 call method to set instance title of BlogPost object 
    //[blogPost setTitle:@"some title"];
//    NSLog(@"%@", string);
    
    // more readable than blogPost.unread
//    if (blogPost.isUnread) {
//        NSLog(@"%@", @"hi");
//    }

    // create NSURL class object a convenience class to breakdown url
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    //NSURL *blogURL = [NSURL URLWithString:@"http://www.omdbapi.com/?s=Terminator"];
    
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
    
//    NSLog(@"%@", dataDictionary);
    
    
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
//    self.blogPosts = [dataDictionary objectForKey:@"Search"];
    
    // init NSMutableArray blogPost
    self.blogPosts = [NSMutableArray array]; // do not know capacity
    
    // temp array to return all posts from dataDictionary
    //NSArray *blogPostsArray = [dataDictionary objectForKey:@"Search"];
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    // loop through array of dictionaries assigned earlier to '*dataDictionary'
    // store dictionaries in BlogPost Class
    // loop through collection of blogPost array of object NSDictionary
    for (NSDictionary *bpDictionary in blogPostsArray) {
        // create instances of blogPost and store title
        //BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"Search"]];
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        // store author into blogPost instance
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        // create instance of NSURL string from dictionary object and assign to url property of BlogPost Class
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        
        // add instances to blogPostsArray for display in table view (mutable array)
        [self.blogPosts addObject:blogPost];
    }
    
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
//    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    // update TableViewController with this mutable array BlogPost that are returned instead of previously returning an NSDictionary
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    // take NSDictionary and extract 'title' from it to set our cell textLabel
//    cell.textLabel.text = [blogPost valueForKey:@"Title"]; // only for NSDictionary
    cell.textLabel.text = blogPost.title;
//    cell.detailTextLabel.text = [blogPost valueForKey:@"Year"]; // only for NSDictionary
    //cell.detailTextLabel.text = blogPost.author;
    
    // append date to author using string concatenation using String Format Specifiers
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", blogPost.author, blogPost.date];
    
    // use the formatted date
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", blogPost.author, [blogPost formattedDate]];
    
    // format the date so more readable
    
    // debug error with thumbnail
//    NSLog(@"THUMBNAIL IS: %@", blogPost.thumbnail);

    // prevent app crashing by only displaying images in 'thumbnail' key of JSON file that are of type NSString (not NSNull)
    if ( [blogPost.thumbnail isKindOfClass:[NSString class]] ) {
    
        // before we set cell.imageView, we need to download the thumbnail data by create an instance of image data (Class methods defined in BlogPost.h allows us to reuse code and just use convenience constructors in implementation)
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        
        // create instance of UIImage
        UIImage *image = [UIImage imageWithData:imageData];
        
        // add image to each table view cell
        //cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
        cell.imageView.image = image;
    } else {
        // display default image
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    
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

#pragma mark - Table view delegate

// action if user selects a row from table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
// REPLACE WITH NAVIGATION CONTROLLER FOR DETAILED VIEW WHICH IS DONE IN THE STORYBOARD
//    // print out the row property of indexPath to confirm interception
//    NSLog(@"Row selected: %d", indexPath.row);
//    
//    // retrieve blogpost object from array
//    // use similar code as that used in 'cellForRowAtIndexPath method
//    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
//    
//    // open url in browser window using index path. need access to main app object that controls events
//    // open AppDelegate.h. also there is the singleton App Object, in Supporting Files, main.m > UIApplicationMain instance object is created there behind the scenes
//    // retrieve its shared instance of application object. as it is a singleton object (only a single instance of it at any time)
//    UIApplication *application = [UIApplication sharedApplication];
//    // use UIApplications method called 'openURL' to open in default browser
//    [application openURL:blogPost.url];
    
//    // Navigation logic may go here. Create and push another view controller.
//    
//     // create instance of navigation controller
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

#pragma mark
#pragma mark -

// intercept segue event and act upon it
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // check the identifier given to the segue in the storyboard
    NSLog(@"%@",segue.identifier);
    
    // method (rather than dot notation) used to check Segue identifier 'showDetail' matches the one in the storyboard
    //if ([[segue identifier] isEqualToString:@"showDetail"]) {
    // using BlogPost Custom Class (on event where segue for DetailView is fired to)
    // where DetailViewController (segue object) has @properties 'detailView' and 'blogPostURL'
    if ([[segue identifier] isEqualToString:@"showBlogPost"]) {
// REPLACED WITH BLOGPOST CUSTOM CLASS
//        // get indexPath of the selected row
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        // access appropriate title from titlesArray
//        NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
//        //NSString *title = self.titlesArray[indexPath.row];
//        // get DetailViewController (destination) and get it to the title from the array
//        // method chaining used. perform setDetailItem on return value of [segue ...]
//        [[segue destinationViewController] setDetailItem:blogPost];
        
        // to set the blogpost, first must access blogpost object (must know what row was selected). if access the TableView, there is method indexPathForSelectedRow.
        // allows get indexPath of row that was selected within the TableView
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // access blogpost object from blogposts array
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        // can send any message to object of type 'id', if method does not belong to that specific object the app will crash, but there is a @property called blogPostURL. call it through dot notation or set method
        [segue.destinationViewController setBlogPostURL:blogPost.url];
        
        // ALTERNATIVE TO ABOVE LINE OF CODE
        // create instance of detailviewcontroller, and get from the segue
        // make above code legal by do a TYPECAST (DetailViewController *) from a generic type 'id' to a specific type for specific class DetailViewController (as we know the destinationViewController is the DetailViewController, because we checked the segue 'identifier'
        //LSDetailViewController *dvc = (LSDetailViewController *)segue.destinationViewController;
        // use specific instance of DetailViewController (dvc) to directly use the blogPostURL @property
        //dvc.blogPostURL = blogPost.url;
        



        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
