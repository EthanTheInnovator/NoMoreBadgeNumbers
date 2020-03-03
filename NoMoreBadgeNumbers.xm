#import <SpringBoard/SBIcon.h>
#import <SpringBoard/SBIconView.h>
#import <UIKit/UIKit.h>

%hook SBIconView

-(void)layoutSubviews {
	
	%orig();
	// Get Badge View
	UIView *accessoryView = MSHookIvar<UIView *>(self, "_accessoryView");
	if(accessoryView && [accessoryView isKindOfClass:%c(SBIconBadgeView)]) {
		// Get the text view inside the badge (for some reason this is an image view)
		UIView *textView = MSHookIvar<UIView *>(accessoryView, "_textView");
		if (textView) {
			[textView setHidden:true];
		}
		
		// Badges remain the same size, so update the frame to be circular
		CGRect frame = accessoryView.frame;
		CGFloat widthDifference = frame.size.width - frame.size.height;
		frame.size.width = frame.size.height;
		frame.origin.x = frame.origin.x + (widthDifference/2);
		accessoryView.frame = frame;
	}
}
%end    // 'SBIconView' hook