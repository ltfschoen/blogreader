//
//  LSDetailViewController.h
//  BlogReader
//
//  Created by Luke on 2/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
