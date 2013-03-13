//
//  main.m
//  Threading
//
//  Created by Benjamin McCloskey on 3/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreadOperation.h"
#import "Observer.h"

/*
 problem:Create two threads. Both threads will produce lines of output including the thread name and an incrementing number from 1 to 1000 (each thread should produce 1000 lines of output). Both threads should be running and producing numbers to the output simultaneously; the iteration numbers do not need to line up. Each line of output should include the thread name and the iteration number. The output may be placed on STDOUT or to a file; your choice.
 
 This is an example of the start of successful output:
 
 Thread-1 1
 Thread-2 1
 Thread-1 2
 Thread-1 3
 Thread-1 4
 Thread-2 2
 
 And so on. Each line of output must be on a line of its own without ANY information from another line of output. This, for example, is not acceptable:
 
 Thread-1 Thread-2 1
 1
 Thread-1 2
 
 This is considered corrupt data.
 */

/*
 SOLUTION: I chose to use an NSOperation implementation as it is the suggested concurrency solution by Apple for use in the Cocoa framework. The thread objects are created and enqueued, then when run they print the desired output and send a callback to their Observer object. The observer then re-enqueues the next operation so long as the count is within bounds. 
 */



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //create the queue and observer objects
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        Observer *theObserver = [[Observer alloc] init];
        //create the thread objects using those and the necessary title/beginning count
        ThreadOperation *thread1 = [[ThreadOperation alloc] initWithTitle:@"Thread-1" 
                                                                 andQueue:queue 
                                                                 andCount:1 
                                                              andObserver:theObserver];
        ThreadOperation *thread2 = [[ThreadOperation alloc] initWithTitle:@"Thread-2" 
                                                                 andQueue:queue 
                                                                 andCount:1 
                                                              andObserver:theObserver];
        //start the motor running!
        //operations will be re-queued by the callback as long as the count is withing range
        [queue addOperation:thread1];
        [queue addOperation:thread2];
        [queue waitUntilAllOperationsAreFinished];         
    }
    return 0;
}

