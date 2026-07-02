#import "../../Utils.h"

%hook IGDirectThreadCallButtonsCoordinator
// Voice Call
- (void)_didTapAudioButton:(id)arg1 {
     return %orig(arg1);
    
}

// Video Call
- (void)_didTapVideoButton:(id)arg1 {
     return %orig(arg1);
    
}
%end
