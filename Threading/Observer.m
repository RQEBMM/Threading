//
//  Observer.m
//  Threading
//
//  Created by Benjamin McCloskey on 3/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Observer.h"
#import "ThreadOperation.h"

@implementation Observer

//callback is called from the threads in order to init and add to queue from the main thread
//this sidesteps worrying about locking since the only action happening outside the main thread
//is printing to the console, incrementing the counter, and calling this method
-(void)callbackFor:(ThreadOperation *)operation
{
        if (operation.count <= 1000)
        {
            ThreadOperation *newOperation = [[ThreadOperation alloc] initWithTitle:operation.title
                                                                    andQueue:operation.queue
                                                                    andCount:operation.count
                                                                    andObserver:operation.observer];
            [operation.queue addOperation:newOperation];
        }
}


@end
