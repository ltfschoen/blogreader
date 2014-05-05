//
//  BlogPost.h
//  BlogReader
//
//  Created by Luke on 5/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

// LATEST XCODE DOES NOT REQUIRE THE BELOW (AUTOMATIC)
//{
//
//    // declare instance variables scoped within implementation
//    // only visible to class BlogPost but no other class unless use getters and setters below
//    NSString *title;
//    NSString *author;
//}

// facade to access the instance variable
@property (nonatomic, strong) NSString *someTitle;

@property (nonatomic, strong) NSString *someAuthor;

// when declare primitive types (does not require 'strong' or 'weak')
@property (nonatomic) int views;

//@property (nonatomic) BOOL unread;

// ALTERNATIVE (make more Readable
@property (nonatomic, getter = isUnread)
    BOOL unread;

// REPLACE WITH @PROPERTY (LESS CUMBERSOME)
//// setter method for instance variable Title
//- (void) setTitle:(NSString *)title;
//
//// getter method for instance variable Title (returns instance so use  *)
//- (NSString *) title;

@end
