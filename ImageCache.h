//
//  ImageCache.h
//
//  Created by Joseph Rodriguez on 24/08/10.
//  /* Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php */
//

#import <Foundation/Foundation.h>


@interface ImageCache : NSObject {

}

+ (void) write: (NSString *) ImageURLString;
+ (UIImage *) read: (NSString *) ImageURLString;
+ (UIImage *) fetch: (NSString *) ImageURLString;

@end
