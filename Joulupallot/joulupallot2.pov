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
  location  <0.0, 0, -6>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-2,6,-4>
}                     


#declare kuusi_pigment =
pigment
{
       color rgb <0,0.7,0>
}

#declare kynttila_pigment =
pigment
{
        color rgb <1,0,0>
}
                                 
        
#declare kuusi_tausta =         
sphere { <0,0,0> 1 
        pigment
        {                 
                gradient -z                 
                pigment_map
                {   
                        [ 0.0 kuusi_pigment ]
                        [ 0.2 kuusi_pigment ]
                        [ 0.5 color Black ]
                        [ 0.8 kynttila_pigment ]
                        [ 1.0 kynttila_pigment ]
                }           
                translate -0.5*z   
                scale <1,1,2>
        } 
        finish 
        {
                diffuse 0.0
                ambient 1.0
        }             
        scale 8
        translate -2*z
        hollow                   
}
        


object { kuusi_tausta }


                         
// ----------------------------------------


sphere {              // reflective sphere
  0.0, 1
  texture {
    pigment {
      color rgb <1.0,0,0>
    }
    finish{
      diffuse 0.8
      ambient 0.1
      //specular 0.6
      phong 1.0
      reflection {
        0.4
        //metallic
      }
      conserve_energy
    }
  }
}

