// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.5
// Desc: Checkered Floor Example
// Date: mm/dd/yy
// Auth: ?
//

#version 3.5;

#include "colors.inc"

global_settings {
  assumed_gamma 2.0
  max_trace_level 5
}

// ----------------------------------------

camera {
  location  <0.0, 0, -20.0>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30, 30, -30>
}
                                 
difference
{                                 
        plane
        {
                -z,
                0                
        }        
        sphere
        {
                <0,0,-4>
                5
        }

        pigment
        {  
                color Red
        /*        image_map { 
                        jpeg "kuusi4.jpg" 
                }        
                translate <0.5,-0.5,0>
                scale <4/3,1,1>
                scale 8
         */
        } 
        finish 
        {
                diffuse 1.0
                ambient 0.0
        }             
        translate z*6.0
        
}                         
                         
// ----------------------------------------


sphere {              // reflective sphere
  0.0, 1
  texture {
    pigment {
      color rgb <0.8,0.8,1.0>
    }
    finish{
      diffuse 0.3
      ambient 0.0
      specular 0.6
      reflection {
        0.8
        metallic
      }
      conserve_energy
    }
  }
}

