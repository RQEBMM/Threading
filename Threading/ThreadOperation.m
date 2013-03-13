//
//  ThreadOperation.m
//  Threading
//
//  Created by Benjamin McCloskey on 3/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ThreadOperation.h"
#import "Observer.h"

@implementation ThreadOperation

@synthesize title;
@synthesize count;
@synthesize queue;
@synthesize observer;

-(id)initWithTitle:(NSString *)newTitle andQueue:(NSOperationQueue *)newQueue andCount:(int)newCount andObserver:(Observer *)newObserver
{
        if (self = [super init])
        {        
            self.title = newTitle;
            self.count = newCount;
            self.queue = newQueue;
            self.observer = newObserver;
            return self;
        }
    return nil;
}

- (void) main
{    
    printf("%s %i\n",[self.title UTF8String],self.count);
    self.count++;
    [self.observer callbackFor:self];
}

@end
