//
//  NSImage+Extension.h
//  exam
//
//  Created by fallen.ink on 15/12/2016.
//  Copyright © 2016 fallen.ink. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (MVC)

- (NSImage *)resizeImageTosize:(NSSize)size;

@end

import_category(NSImage_MVC)
