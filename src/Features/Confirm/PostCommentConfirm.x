#import "../../Utils.h"

%hook IGCommentComposer.IGCommentComposerController
- (void)onSendButtonTap {
    return %orig();
}
%end
