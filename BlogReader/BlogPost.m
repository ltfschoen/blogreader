//
//  BlogPost.m
//  BlogReader
//
//  Created by Luke on 5/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import "BlogPost.h"

// 'self' directly accesses these setter and getter of the instance variable in @interface
@implementation BlogPost

- (id) initWithTitle:(NSString *)title {
    
    // initialize with 'self', where 'self' refers to a particular Instance of the Class
    // initialize with Parent Class (NSObject), which includes Memory allocation methods (i.e. init, dealloc)
    // call these specific methods from the Super/Parent Class (NSObject). Use 'super' init to provide an Initialized Instance of BlogPost
    self = [super init];
    
    // check if 'self' is a valid instance (nil if something went wrong)
    if ( self ) {
        // initialize 'someTitle' instance variable using 'setter'
        // where 'title' is the argument passed to this method
        _title = title;
        
        // ALTERNATIVE using convenience constructor for 'setter'
        //[self setTitle:title];
        
    }

    // return 'self' (valid instance of BlogPost)
    return self;
}

// implement CONVENIENCE CONSTRUCTOR
+ (id) blogPostWithTitle:(NSString *)title {
    // call DEDICATED INITIALIZER
    // allocate 'self' and return whatever is returned in the 'initWithTitle' instance method 
    return [[self alloc] initWithTitle:title];
}

// synthesise and ensure accesses underlying instance variable from @interface section
@synthesize title = _title;
@synthesize author = _author;

// REPLACE WITH @SYNTHESISE (LESS CUMBERSOME)
//// implement setting the title
//- (void) setTitle:(NSString *)_title {
//    // 'title' accesses the instance variable 'title'
//    title = _title;
//}
//
//// implement getting the title (returns instance so use  *)
//- (NSString *) title {
//    return title;
//}

@end
