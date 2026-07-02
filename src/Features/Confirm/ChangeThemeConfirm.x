#import "../../InstagramHeaders.h"
#import "../../Utils.h"

%hook IGDirectThreadThemePickerViewController
- (void)themeNewPickerSectionController:(id)arg1 didSelectTheme:(id)arg2 atIndex:(NSInteger)arg3 {
    return %orig(arg1, arg2, arg3);
   
}
- (void)themePickerSectionController:(id)arg1 didSelectThemeId:(id)arg2 {
     return %orig(arg1, arg2);
   
}
%end

%hook IGDirectThreadThemeKitSwift.IGDirectThreadThemePreviewController
- (void)primaryButtonTapped {
    return %orig();
    
}
%end
