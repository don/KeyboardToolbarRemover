#import "KeyboardToolbarRemover.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyboardToolbarRemover

- (void) hide:(CDVInvokedUrlCommand*)command
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void) show:(CDVInvokedUrlCommand*)command
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

// http://ios-blog.co.uk/tutorials/rich-text-editing-a-simple-start-part-1
- (void)keyboardWillShow:(NSNotification *)note {
    [self performSelector:@selector(removeBar) withObject:nil afterDelay:0];
}

- (void)removeBar {
    // Locate non-UIWindow.
    UIWindow *keyboardWindow = nil;
    for (UIWindow *testWindow in [[UIApplication sharedApplication] windows]) {
        if (![[testWindow class] isEqual:[UIWindow class]]) {
            keyboardWindow = testWindow;
            break;
        }
    }

    // Locate UIWebFormView
    for (UIView *possibleFormView in [keyboardWindow subviews]) {
        if ([[possibleFormView description] hasPrefix:@"<UIPeripheralHostView"]) {
            for (UIView* peripheralView in [possibleFormView subviews]) {
                
                // hides the backdrop (iOS 7)
                if ([[peripheralView description] hasPrefix:@"<UIKBInputBackdropView"]) {
                    //skip the keyboard background....hide only the toolbar background
                    if ([peripheralView frame].origin.y == 0){
                        [[peripheralView layer] setOpacity:0.0];
                    }
                }
                // hides the accessory bar
                if ([[peripheralView description] hasPrefix:@"<UIWebFormAccessory"]) {
                    // remove the extra scroll space for the form accessory bar
                    UIScrollView *webScroll;
                    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
                        webScroll = [[self webView] scrollView];
                    } else {
                        webScroll = [[[self webView] subviews] lastObject];
                    }
                    CGRect newFrame = webScroll.frame;
                    newFrame.size.height += peripheralView.frame.size.height;
                    webScroll.frame = newFrame;
                    
                    // remove the form accessory bar
                    [peripheralView removeFromSuperview];
                }
                // hides the thin grey line used to adorn the bar (iOS 6)
                if ([[peripheralView description] hasPrefix:@"<UIImageView"]) {
                    [[peripheralView layer] setOpacity:0.0];
                }
            }
        }
    }
}


@end

