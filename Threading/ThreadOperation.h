//
//  ThreadOperation.h
//  Threading
//
//  Created by Benjamin McCloskey on 3/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Observer;
@interface ThreadOperation : NSOperation
 
@property NSString *title;
@property int count;
@property NSOperationQueue *queue;
@property Observer *observer;

-(id)initWithTitle:(NSString *)newTitle andQueue:(NSOperationQueue *)newQueue andCount:(int)newCount andObserver:(Observer *)newObserver;

@end
