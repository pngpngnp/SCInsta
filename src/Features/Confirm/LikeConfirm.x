#import "../../Utils.h"

///////////////////////////////////////////////////////////

// Confirmation handlers

#define CONFIRMPOSTLIKE(orig)                             \
    if ([SCIUtils getBoolPref:@"like_confirm"]) {           \
        NSLog(@"[SCInsta] Confirm post like triggered");  \
                                                          \
        [SCIUtils showConfirmation:^(void) { orig; }];    \
    }                                                     \
    else {                                                \
        return orig;                                      \
    }                                                     \

#define CONFIRMREELSLIKE(orig)                            \
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {     \
        NSLog(@"[SCInsta] Confirm reels like triggered"); \
                                                          \
        [SCIUtils showConfirmation:^(void) { orig; }];    \
    }                                                     \
    else {                                                \
        return orig;                                      \
    }                                                     \

///////////////////////////////////////////////////////////

// Liking posts
%hook IGUFIButtonBarView
- (void)_onLikeButtonPressed:(id)arg1 {
    return %orig(arg1);
}
%end
%hook IGFeedPhotoView
- (void)_onDoubleTap:(id)arg1 {
    return %orig(arg1);
}
%end
%hook IGVideoPlayerOverlayContainerView
- (void)_handleDoubleTapGesture:(id)arg1 {
    return %orig(arg1);
}
%end

// Liking reels
%hook IGSundialViewerVideoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    return %orig(arg1);
}

- (void)controlsOverlayControllerDidLongPressLikeButton:(id)arg1 gestureRecognizer:(id)arg2 {
    return %orig(arg1, arg2);
}

- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    return %orig(arg1, arg2);
}
%end
%hook IGSundialViewerPhotoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    return %orig(arg1);
}

- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    return %orig(arg1, arg2);
}
%end
%hook IGSundialViewerCarouselCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    return %orig(arg1);
}

- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    return %orig(arg1, arg2);
}
%end

// Liking comments
%hook IGCommentCellController
- (void)commentCell:(id)arg1 didTapLikeButton:(id)arg2 {
    return %orig(arg1, arg2);
}

- (void)commentCell:(id)arg1 didTapLikedByButtonForUser:(id)arg2 {
    return %orig(arg1, arg2);
}

- (void)commentCellDidLongPressOnLikeButton:(id)arg1 {
    return %orig(arg1);
}

- (void)commentCellDidEndLongPressOnLikeButton:(id)arg1 {
    return %orig(arg1);
}

- (void)commentCellDidDoubleTap:(id)arg1 {
    return %orig(arg1);
}
%end
%hook IGFeedItemPreviewCommentCell
- (void)_didTapLikeButton {
    return %orig();
}

%end

// Liking stories
%hook IGStoryFullscreenDefaultFooterView
- (void)_handleLikeTapped {
    return %orig();
}

- (void)_likeTapped {
    return %orig();
}

- (void)inputView:(id)arg1 didTapLikeButton:(id)arg2 {
    return %orig(arg1, arg2);
}

// For some stupid reason they removed the "liketapped" methods on newer Instagram versions
// Now we have to do a shitty workaround instead :(
// Works 99% of the time, but sometimes clicks get through directly to the like button (somehow)
- (void)layoutSubviews {
    return %orig();
}
%end

// DM like button (seems to be hidden)
%hook IGDirectThreadViewController
- (void)_didTapLikeButton {
    return %orig();
}
%end
