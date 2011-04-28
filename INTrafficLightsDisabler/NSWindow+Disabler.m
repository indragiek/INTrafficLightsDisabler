//
//  NSWindow+Disabler.m
//  INTrafficLightsDisabler
//
//  Copyright 2011 Indragie Karunaratne. All rights reserved.
//  Licensed under the BSD License : <http://www.opensource.org/licenses/bsd-license.php>

#import "INTrafficLightsDisabler.h"
#import "NSWindow+Disabler.h"

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
    NSButton *closeButton = [self standardWindowButton:NSWindowCloseButton];
    NSButton *minButton = [self standardWindowButton:NSWindowMiniaturizeButton];
    NSButton *zoomButton = [self standardWindowButton:NSWindowZoomButton];
#ifndef DONT_DISABLE_CLOSE_BUTTON
    [closeButton setHidden:YES];
#endif
    [minButton setHidden:YES];
    [zoomButton setHidden:YES];
           
}
@end
