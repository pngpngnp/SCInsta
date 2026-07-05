#import "../../Utils.h"
#import "../../InstagramHeaders.h"

// Follow button on profile page
%hook IGFollowController

- (void)_didPressFollowButton {
    return %orig();
}

%end

// Follow button on discover people page
%hook IGDiscoverPeopleButtonGroupView

- (void)_onFollowButtonTapped:(id)arg1 {
    return %orig(arg1);
}

- (void)_onFollowingButtonTapped:(id)arg1 {
    return %orig(arg1);
}

%end

// Suggested for you follow button
%hook IGHScrollAYMFCell

- (void)_didTapAYMFActionButton {
    return %orig();
}

%end

%hook IGHScrollAYMFActionButton

- (void)_didTapTextActionButton {
    return %orig();
}

%end

// Follow button on reels
%hook IGUnifiedVideoFollowButton

- (void)_hackilyHandleOurOwnButtonTaps:(id)arg1 event:(id)arg2 {
    return %orig(arg1, arg2);
}

%end

// Follow text on profile
%hook IGProfileViewController

- (void)navigationItemsControllerDidTapHeaderFollowButton:(id)arg1 {
    return %orig(arg1);
}

%end

// Follow button on suggested friends
%hook IGStorySectionController

- (void)followButtonTapped:(id)arg1 cell:(id)arg2 {
    return %orig(arg1, arg2);
}

%end
