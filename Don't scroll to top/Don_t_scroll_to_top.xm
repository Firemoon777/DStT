
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

#define PREFS_FILE @"/var/mobile/Library/Preferences/ru.firemoon777.DStT.plist"

%hook UIScrollView
- (void)_scrollToTopFromTouchAtScreenLocation:(struct CGPoint)arg1 resultHandler:(id)arg2
{
    
    %orig;
}
%end

static void loadPreferences()
{
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFS_FILE];
    if(!settings)
    {
        settings = [[NSMutableDictionary alloc] init];
    }
    if(![settings objectForKey:@"DStTEnabled"])
    {
        [settings setObject:@YES forKey:@"DStTEnabled"];
    }
    [settings writeToFile:PREFS_FILE atomically:YES];
    
}

static void reloadPreferences(CFNotificationCenterRef center, void *observer,
                              CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    // NOTE: Must synchronize preferences from disk
    loadPreferences();
}

%ctor
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL, reloadPreferences, CFSTR("ru.firemoon777.DStTBundle.settingsChanged"),
                                    NULL, 0);
    %init();
}