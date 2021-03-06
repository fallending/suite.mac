//
//  NSWindowController+Extension.m
//  exam
//
//  Created by fallen.ink on 30/11/2016.
//  Copyright © 2016 fallen.ink. All rights reserved.
//

#import "NSWindowController+Extension.h"

@implementation NSWindowController (Extension)

- (id) _initWithNib {
    return [self initWithWindowNibName:NSStringFromClass([self class])];
}

- (void)resizeWithNewSize:(CGSize)newSize {
    NSWindow *window = self.window;
    NSSize currentSize = window.frame.size;
    CGFloat deltaWidth = newSize.width - currentSize.width;
    CGFloat deltaHeight = newSize.height - currentSize.height;
    
    NSRect windowFrame = [window frame];
    windowFrame.size.height += deltaHeight;
    windowFrame.size.width += deltaWidth;
    
    [window setFrame:windowFrame display:YES animate:NO];
}

- (BOOL)shouldCloseDocument {
    return YES;
}

#pragma mark - Transition

- (void)fadeTransitionTo:(NSWindowController *)windowController {
    windowController.window.alphaValue = 0.f;
    [windowController.window center];
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        [context setDuration:1.0];
        
        [[self.window animator] setAlphaValue:0.0];
        
        [[windowController.window animator] setAlphaValue:1.f];
        
    } completionHandler:^{
        
        [self.window orderOut:nil];
        
        [windowController.window center];
        [windowController.window orderFront:nil];
        [windowController.window makeKeyWindow];
        
        [self close];
    }];
}

@end
