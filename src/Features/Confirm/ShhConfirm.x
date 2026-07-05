#import "../../Utils.h"

%hook IGDirectThreadViewController
- (void)swipeableScrollManagerDidEndDraggingAboveSwipeThreshold:(id)arg1 {
    return %orig(arg1);
}

- (void)shhModeTransitionButtonDidTap:(id)arg1 {
    return %orig(arg1);
}

- (void)messageListViewControllerDidToggleShhMode:(id)arg1 {
    return %orig(arg1);
}
%end
