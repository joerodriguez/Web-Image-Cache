//
//  ImageCache.h
//  kpmg_iphone_client
//
//  Created by Joseph Rodriguez on 24/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageCache : NSObject {

}

+ (void) write: (NSString *) ImageURLString;
+ (UIImage *) read: (NSString *) ImageURLString;
+ (UIImage *) fetch: (NSString *) ImageURLString;

@end
