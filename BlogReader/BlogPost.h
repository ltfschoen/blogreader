//
//  BlogPost.h
//  BlogReader
//
//  Created by Luke on 5/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject {

    // declare instance variables scoped within implementation
    // only visible to class BlogPost but no other class unless use getters and setters below
    NSString *title;
    NSString *author;
}

// setter method
- (void) setTitle:(NSString *)title;

// getter method (returns instance so use  *)
- (NSString *) title;

@end
