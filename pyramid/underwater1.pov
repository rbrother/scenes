// This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a
// letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

// woodbox.pov
// POV-Ray scene file by Dan Farmer
// Copyright POV-Team, 1995
// Demonstrates some of the woods.inc textures.
// Several wooden spheres (and one glass one), in and around
// a wooden box.
//
// -w320 -h240
// -w800 -h600 +a0.3

#version 3.7;
global_settings { 
  assumed_gamma 1.2 
  number_of_waves 10 } 

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"
#include "elecguit.pov"

camera {
   location <0, 7, -55>
   angle 45 // direction <0, 0,  1.7>
   right x*image_width/image_height
   look_at <0,10,0>
}

light_source { < 0, 9, -40> color White*3 }

sky_sphere {
    pigment {
        gradient y
        color_map {
            [ 0 color White ]
            [ 0.5 color Blue ]
            [ 1 color White ]
        }
    }
}                  

                                                    