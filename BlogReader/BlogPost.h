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
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *author;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSURL *url; // allows open in browser

// create return type
// cannot return (BlogPost *), can only return 'id' (use as general rule: 'id' is general purpose data type that can create an instance of any class), as don't always know what type we'll be returning
// 'id' follows design pattern 'DYNAMIC BINDING' where not specify the Class of Instance immediately
// i.e. IN CONTROLLER .M, create valid definition
// when run the applicaiton, it is BOUND AT RUNTIME, so at RUNTIME, OBJECT becomes NSString
// but Compiler during compiling does not know what type of Object this is
// also, when specifying 'id' type, do not used *, as already implied (i.e. not id *randomObject)
//         id randomObject = @"my string";

// DESIGNATED INITIALIZER is 'initWithTitle'
- (id) initWithTitle:(NSString *)title;

// CONVENIENCE CONSTRUCTOR passing 'someTitle' as argument (Class method as uses +sign)
+ (id) blogPostWithTitle:(NSString *)title;

// create instance method of thumbnail that will return an NSURL
- (NSURL *) thumbnailURL;

- (NSString *) formattedDate;

//// when declare primitive types (does not require 'strong' or 'weak')
//@property (nonatomic) int views;
//
////@property (nonatomic) BOOL unread;
//
//// ALTERNATIVE (make more Readable
//@property (nonatomic, getter = isUnread)
//    BOOL unread;

// REPLACE WITH @PROPERTY (LESS CUMBERSOME)
//// setter method for instance variable Title
//- (void) setTitle:(NSString *)title;
//
//// getter method for instance variable Title (returns instance so use  *)
//- (NSString *) title;

@end
