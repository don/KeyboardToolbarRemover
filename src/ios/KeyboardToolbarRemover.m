#import "KeyboardToolbarRemover.h"

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
            for (UIView *subviewWhichIsPossibleFormView in [possibleFormView subviews]) {
                if ([[subviewWhichIsPossibleFormView description] rangeOfString:@"UIWebFormAccessory"].location != NSNotFound) {
                    [subviewWhichIsPossibleFormView removeFromSuperview];
                }
            }
        }
    }
}


@end

