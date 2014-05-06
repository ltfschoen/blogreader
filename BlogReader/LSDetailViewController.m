//
//  LSDetailViewController.m
//  BlogReader
//
//  Created by Luke on 2/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import "LSDetailViewController.h"

@interface LSDetailViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *detailView;

//- (void)configureView;
@end

@implementation LSDetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        //[self configureView];
//    }
//}

//- (void)configureView
//{
//    // Update the user interface for the detail item.
//
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self configureView];
    
    // so everytime someone clicks on a blogpost it will open up the following
    // create instance of NSURL
    NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com"];
    
    // create instance of url request
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    // load default webpage using property detailView
    [self.detailView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
