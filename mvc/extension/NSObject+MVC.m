//
//  NSObject+MVC.m
//  exam
//
//  Created by fallen.ink on 30/11/2016.
//  Copyright © 2016 fallen.ink. All rights reserved.
//

#import "NSObject+MVC.h"

@implementation NSObject (MVC)

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                  onWindow:(NSWindow *)window
             defaultButton:(NSString *)defaultText
              defaultBlock:(Block)defaultHandler
         alternativeButton:(NSString *)alternativeText
          alternativeBlock:(Block)alternativeHandler {
    NSAlert *alert = [NSAlert new];
    
    if (!is_string_empty(title)) alert.messageText = title;
    if (!is_string_empty(message)) alert.informativeText = message;
    
    [alert addButtonWithTitle:defaultText];
    [alert addButtonWithTitle:alternativeText];

    [alert beginSheetModalForWindow:window completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertFirstButtonReturn) {
            if (defaultHandler) defaultHandler();
        } else if (returnCode == NSAlertSecondButtonReturn) {
            if (alternativeHandler) alternativeHandler();
        }
    }];
    
}

@end