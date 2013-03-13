//
//  Observer.h
//  Threading
//
//  Created by Benjamin McCloskey on 3/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ThreadOperation;

@interface Observer : NSObject

-(void)callbackFor:(ThreadOperation *)operation;

@end
