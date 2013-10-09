#import <Cordova/CDVPlugin.h>

@interface KeyboardToolbarRemover : CDVPlugin
- (void) hide:(CDVInvokedUrlCommand*)command;
- (void) show:(CDVInvokedUrlCommand*)command;
@end