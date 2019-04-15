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

camera {
   location <-10, 2, -20>
   angle 45 // direction <0, 0,  1.7>
   right x*image_width/image_height
   look_at <-10,-2,0>
}

// Uncomment the area lights only if you've got lots of time.
#declare Dist=80.0;
light_source {< -50, 25, -30> color White
     fade_distance Dist fade_power 2
}

sky_sphere {
    pigment {
        gradient y
        color_map {
            [0, 1  color Black color White]
        }
    }
}
    
    
height_field {
    png "mandel2c.png"
    pigment {     
      gradient y
      color_map {
       [ 0.0 rgb<0.1,0.5,0> ]
       [ 0.5 rgb<0.1,0.1,0.1> ]
       [ 0.8 White ]
       [ 1.0 White ] }
    }       
    translate <-0.5,0,-0.5>
    rotate y*180
    scale <100,2,100> 
}
    
/*
plane { y,0
    texture { 
        pigment { color rgb<0,0,0.2>}
        normal { waves 0.3 scale 2 }
        finish { reflection 0.7 ambient 0.3 }
    }
} 
*/

#declare Slope=55;                                                                      
                
#declare Pyramid =                
                
difference {

    intersection {
                                 
        #for (Angle, 0, 359, 45)
            plane { y 0 rotate z*Slope rotate y*Angle }
        #end    
    }
    
    sphere { <0,0,0>, 10 translate <0,0,0> }

    pigment {     
      gradient y
      color_map {
       [ 0.0 Yellow ]
       [ 0.5 Yellow ]
       [ 0.5 Black ]
       [ 1.0 Black ] }
    }  

    translate y*20         
    rotate y*-5
                  
                 
    finish { reflection 0.2 ambient 0.2 diffuse 0.6  }
    
    normal { bumps scale 0.05 }
}


// object { Pyramid }
