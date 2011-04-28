//
//  NSWindow+Disabler.m
//  INTrafficLightsDisabler
//
//  Copyright 2011 Indragie Karunaratne. All rights reserved.
//  Licensed under the BSD License : <http://www.opensource.org/licenses/bsd-license.php>

#import "INTrafficLightsDisabler.h"
#import "NSWindow+Disabler.h"
#import "_NSThemeWidget.h"
#import "_NSThemeCloseWidget.h"

@implementation NSWindow (Disabler)
// Suppress compiler warnings
- (id)disabler_orig_init { return nil; }
- (void)disabler_orig_awakeFromNib { }

- (id)disabler_new_init
{
    if ((self = [self disabler_orig_init])) {
        [self disabler_removeTrafficLights];
    }
    return self;
}

- (void)disabler_new_awakeFromNib
{
    [self disabler_orig_awakeFromNib];
    [self disabler_removeTrafficLights];
}

- (void)disabler_removeTrafficLights
{
    /* We could just remove the widgets from the theme frame entirely, but that
     * is likely to cause unwanted problems. Therefore it's easier to just hide
     * them from view */
    NSView *themeFrame = [[self contentView] superview];
    for (NSView *subview in [themeFrame subviews]) {
        if ([subview isKindOfClass:[_NSThemeWidget class]]) {
#ifdef DONT_DISABLE_CLOSE_BUTTON
            if (![subview isKindOfClass:[_NSThemeCloseWidget class]])
#endif
                [subview setHidden:YES];
        }
    }

}
@end
