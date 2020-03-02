#line 1 "Tweak.x"




































#import <SpringBoard/SBIcon.h>
#import <SpringBoard/SBIconView.h>
#import <UIKit/UIKit.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconBadgeView; @class SBIconView; 
static void (*_logos_orig$_ungrouped$SBIconView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBIconBadgeView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconBadgeView"); } return _klass; }
#line 41 "Tweak.x"


static void _logos_method$_ungrouped$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	SBIcon *icon = [self icon];

	_logos_orig$_ungrouped$SBIconView$layoutSubviews(self, _cmd);

	
	UIView *accessoryView = MSHookIvar<UIView *>(self, "_accessoryView");
	if(accessoryView && [accessoryView isKindOfClass:_logos_static_class_lookup$SBIconBadgeView()]) {
		UIView *textView = MSHookIvar<UIView *>(accessoryView, "_textView");
		if (textView) {
			[textView setHidden:true];
		}
	}
}
    
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconView = objc_getClass("SBIconView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBIconView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBIconView$layoutSubviews);} }
#line 58 "Tweak.x"
