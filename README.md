What is INTrafficLightsDisabler?
====================

INTrafficLightsDisabler is a SIMBL plugin to disable the traffic lights (AKA "window widgets") in windows on Mac OS X (tested on OS X 10.6-10.7). Please see the [blog post](http://blog.indragie.com/post/5004061949/the-traffic-lights-experiment) for screenshots and more information.

Usage
====================

The bundle should be compiled and installed to /Library/Application Support/SIMBL/Plugins (for all users) or ~/Library/Application Support/SIMBL/Plugins (for the current user).

You will notice this #define in the `INTrafficLightsDisabler.h` file:

    /** Uncomment this define to disable all of the traffic lights EXCEPT for the close button */

    // #define DONT_DISABLE_CLOSE_BUTTON
    // #define DONT_DISABLE_ZOOM_BUTTON

It does exactly what it says. Uncommenting either line will make it so that the minimize traffic light are hidden, but the close and/or zoom button will remain visible (known as the "Cyclops version").

Who am I?
====================

I'm Indragie Karunaratne, a 16 year old Mac OS X and iOS Developer from Edmonton AB, Canada. Visit [my website](http://indragie.com) to check out my work, or to get in touch with me.

Licensing
====================

INTrafficLightsDisabler is licensed under the [BSD license](http://www.opensource.org/licenses/bsd-license.php).