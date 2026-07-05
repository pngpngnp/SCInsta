#import "../../Utils.h"

%hook IGStoryViewerTapTarget
- (void)_didTap:(id)arg1 forEvent:(id)arg2 {
    return %orig(arg1, arg2);
}
%end
