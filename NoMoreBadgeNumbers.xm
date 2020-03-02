/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/


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
		frame.size.width = frame.size.height;
		accessoryView.frame = frame;
	}
}
%end    // 'SBIconView' hook