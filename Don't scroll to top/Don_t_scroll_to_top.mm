#line 1 "/Users/admin/Dropbox/Проекты/Don't scroll to top/Don't scroll to top/Don_t_scroll_to_top.xm"




#import <UIKit/UIKit.h>

#include <logos/logos.h>
#include <substrate.h>
@class UIScrollView; 
static void (*_logos_orig$_ungrouped$UIScrollView$_scrollToTopFromTouchAtScreenLocation$resultHandler$)(UIScrollView*, SEL, struct CGPoint, id); static void _logos_method$_ungrouped$UIScrollView$_scrollToTopFromTouchAtScreenLocation$resultHandler$(UIScrollView*, SEL, struct CGPoint, id); 

#line 7 "/Users/admin/Dropbox/Проекты/Don't scroll to top/Don't scroll to top/Don_t_scroll_to_top.xm"


static void _logos_method$_ungrouped$UIScrollView$_scrollToTopFromTouchAtScreenLocation$resultHandler$(UIScrollView* self, SEL _cmd, struct CGPoint arg1, id arg2) {
    return;
}


static void reloadPreferences(CFNotificationCenterRef center, void *observer,
                              CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    
    loadPreferences();
}

static __attribute__((constructor)) void _logosLocalCtor_98f13708()
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL, reloadPreferences, CFSTR("ru.firemoon777.DStTBundle.settingsChanged"),
                                    NULL, 0);
    {Class _logos_class$_ungrouped$UIScrollView = objc_getClass("UIScrollView"); MSHookMessageEx(_logos_class$_ungrouped$UIScrollView, @selector(_scrollToTopFromTouchAtScreenLocation:resultHandler:), (IMP)&_logos_method$_ungrouped$UIScrollView$_scrollToTopFromTouchAtScreenLocation$resultHandler$, (IMP*)&_logos_orig$_ungrouped$UIScrollView$_scrollToTopFromTouchAtScreenLocation$resultHandler$);}
}
