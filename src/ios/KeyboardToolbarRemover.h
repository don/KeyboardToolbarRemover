#import <Cordova/CDVPlugin.h>

@interface KeyboardToolbarRemover : CDVPlugin

- (void) hide:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) show:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end