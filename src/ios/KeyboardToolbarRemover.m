#import "KeyboardToolbarRemover.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyboardToolbarRemover

- (void) hide:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    NSString* callbackId = [arguments objectAtIndex:0];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [super success:result callbackId:callbackId];
}

- (void) show:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
{
    NSString* callbackId = [arguments objectAtIndex:0];

    [[NSNotificationCenter defaultCenter] removeObserver:self];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [super success:result callbackId:callbackId];

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

    // Locate UIWebFormView.
    for (UIView *possibleFormView in [keyboardWindow subviews]) {
        // iOS 5 sticks the UIWebFormView inside a UIPeripheralHostView.
        if ([[possibleFormView description] rangeOfString:@"UIPeripheralHostView"].location != NSNotFound) {

            // remove the border above the toolbar in iOS 6
            [[possibleFormView layer] setMasksToBounds:YES];

            for (UIView *subviewWhichIsPossibleFormView in [possibleFormView subviews]) {
                if ([[subviewWhichIsPossibleFormView description] rangeOfString:@"UIWebFormAccessory"].location != NSNotFound) {
                    [subviewWhichIsPossibleFormView removeFromSuperview];

                    // http://stackoverflow.com/questions/10746998/phonegap-completely-removing-the-black-bar-from-the-iphone-keyboard/10796550#10796550
                    UIScrollView *webScroll;
                    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
                        webScroll = [[self webView] scrollView];
                    } else {
                        webScroll = [[[self webView] subviews] lastObject];
                    }

                    CGRect newFrame = [webScroll frame];

                    float accessoryHeight = [subviewWhichIsPossibleFormView frame].size.height;
                    newFrame.size.height += accessoryHeight;

                    [subviewWhichIsPossibleFormView removeFromSuperview];
                    [webScroll setFrame:newFrame];
                }
            }
        }
    }
}


@end

