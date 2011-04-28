//
//  NSWindow+Disabler.h
//  INTrafficLightsDisabler
//
//  Copyright 2011 Indragie Karunaratne. All rights reserved.
//  Licensed under the BSD License : <http://www.opensource.org/licenses/bsd-license.php>

#import <Foundation/Foundation.h>

/** Category to override NSWindow's init and remove traffic lights */
@interface NSWindow (Disabler)
- (id)disabler_orig_init;
- (id)disabler_new_init;
- (void)disabler_orig_awakeFromNib;
- (void)disabler_new_awakeFromNib;
- (void)disabler_removeTrafficLights;
@end
