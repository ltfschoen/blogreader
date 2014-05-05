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

// synthesise and ensure accesses underlying instance variable from @interface section
@synthesize someTitle = title;

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
