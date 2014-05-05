//
//  BlogPost.m
//  BlogReader
//
//  Created by Luke on 5/05/2014.
//  Copyright (c) 2014 Ceenos. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

// implement setting the title
- (void) setTitle:(NSString *)_title {
    title = _title;
}

// implement getting the title (returns instance so use  *)
- (NSString *) title {
    return title;
}

@end
