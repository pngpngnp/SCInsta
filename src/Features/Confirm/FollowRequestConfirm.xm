#import "../../Utils.h"

%hook IGPendingRequestView
- (void)_onApproveButtonTapped {
    return %orig();
}
- (void)_onIgnoreButtonTapped {
    return %orig();
}
%end
