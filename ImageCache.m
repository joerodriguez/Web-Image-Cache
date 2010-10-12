//
//  ImageCache.m
//
//  Created by Joseph Rodriguez on 24/08/10.
//  /* Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php */
//

#import "ImageCache.h"
#define TMP NSTemporaryDirectory()

@implementation ImageCache

+ (void) write: (NSString *) urlString {
	NSURL *ImageURL = [NSURL URLWithString: urlString];
    
    // Generate a unique path to a resource representing the image you want
    NSString *filename = [[[ImageURL path]  urlReadyString] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];

	// Fetch image
	NSData *data = [NSData dataWithContentsOfURL: ImageURL];
	UIImage *image = [UIImage imageWithData: data];
	
	// Is it PNG or JPG/JPEG?
	// Running the image representation function writes the data from the image to a file
	if ([urlString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound)
	{
		[UIImagePNGRepresentation(image) writeToFile: uniquePath atomically: YES];
	}
	else if ([urlString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound || 
			 [urlString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound ) {
		[UIImageJPEGRepresentation(image, 100) writeToFile: uniquePath atomically: YES];
	}
}

+ (UIImage *) read: (NSString *) urlString {
	
	NSURL *ImageURL = [NSURL URLWithString: urlString];
    NSString *filename = [[[ImageURL path]  urlReadyString] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
        
    if ([[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
		return [UIImage imageWithContentsOfFile: uniquePath]; // this is the cached image
    else
        return nil;
}

+ (UIImage *) fetch: (NSString *) urlString {
	UIImage *image = [self read:urlString];
	
	if (image == nil){
		[self write:urlString];
		image = [self read:urlString];
	}
	
	return image;
}

@end
