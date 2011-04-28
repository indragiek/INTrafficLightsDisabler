//
//  INTrafficLightsDisabler.m
//  INTrafficLightsDisabler
//
//  Copyright 2011 Indragie Karunaratne. All rights reserved.
//  Licensed under the BSD License : <http://www.opensource.org/licenses/bsd-license.php>

#import "INTrafficLightsDisabler.h"
#import "NSWindow+Disabler.h"
#import "JRSwizzle.h"

@implementation INTrafficLightsDisabler

+ (void)load
{
    // First use JRSwizzle to alias the original methods and provide our own implementations
    [NSWindow jr_aliasMethod:@selector(init) withSelector:@selector(disabler_orig_init) error:NULL];
    [NSWindow jr_swizzleMethod:@selector(init) withMethod:@selector(disabler_new_init) error:NULL];
    [NSWindow jr_aliasMethod:@selector(awakeFromNib) withSelector:@selector(disabler_orig_awakeFromNib) error:NULL];
    [NSWindow jr_swizzleMethod:@selector(awakeFromNib) withMethod:@selector(disabler_new_awakeFromNib) error:NULL];
    /* Remove traffic lights from windows that were created before the plugin was loaded
     * It's impossible to guarantee that the SIMBL plugin will be loaded before the NSWindows are initialized
     * so this handles that issue. */
    NSArray *windows = [NSApp windows];
    for (NSWindow *aWindow in windows) {
        [aWindow disabler_removeTrafficLights];
    }
}

@end
