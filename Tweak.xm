#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface LSApplicationWorkspace : NSObject
+ (instancetype)defaultWorkspace;
- (BOOL)openApplicationWithBundleID:(NSString *)bundleID;
@end

static NSString *const kCameraTargetBundleID   = @"com.tencent.xin";       
static NSString *const kFlashlightTargetBundleID = @"com.apple.Preferences"; 

static void OpenApp(NSString *bundleID) {
    if (bundleID.length == 0) return;
    LSApplicationWorkspace *ws = [LSApplicationWorkspace defaultWorkspace];
    [ws openApplicationWithBundleID:bundleID];
}

%hook CSCameraQuickAction
- (void)activate {
    if (kCameraTargetBundleID.length > 0) {
        OpenApp(kCameraTargetBundleID);
    } else {
        %orig;
    }
}
%end

%hook CSFlashlightQuickAction
- (void)activate {
    if (kFlashlightTargetBundleID.length > 0) {
        OpenApp(kFlashlightTargetBundleID);
    } else {
        %orig;
    }
}
%end
