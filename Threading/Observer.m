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

//callback is called from the threads in order to init and add to queue from the calling thread
//this keeps all action in the active thread
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
