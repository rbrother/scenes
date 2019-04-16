//  Persistence of Vision Raytracer V3.5
//  World definition file.

#include "guitar.pov"
#include "stones.inc"

default {
  texture {
    pigment { rgb <1,0,0> }
  }
}

global_settings {
  adc_bailout 0.003922
  ambient_light <1.0,1.0,1.0>
  assumed_gamma 1.9
  irid_wavelength <0.247059,0.176471,0.137255>
  max_trace_level 10
  number_of_waves 10
  noise_generator 2
  charset ascii
}

background { color <0.000,0.000,0.000> }

camera {  //  Camera Camera
  location  <   0.000,     0.000,     -2000.000>
  up        <        0.0,         1.0,         0.0> 
  right     <    1.0,         0.0,         0.0>
  look_at   <      0.000,     0.000,       0.000>
}

//
// *******  L I G H T S *******
//

light_source {   // Lumiere
  <-1000.0, 1000.0, 0.0>
  color rgb <1.000, 0.8, 0.8>
}

light_source {   // Lumiere
  <1000.0, -200, -1000.0>
  color rgb <1.000, 1.000, 0.8>
}


// object { Guitar rotate<0,135,180>}

//object { Guitar    rotate<50,60,45> }     

blob {
    #for (i,0,200,1)
        sphere { <380,0,0>, 200, 30 
          rotate<0,0,i*19>
          rotate<0,i*13,0>
          rotate<i*3,0,0>
           }
    #end            
    #for (i,0,600,1)
        sphere { <460,0,0>, 100, 30 
          rotate<0,i*19,0>
          rotate<0,i*13,0>
          rotate<i*5,0,0>
           }
    #end
    texture { T_Stone8 
       normal { bumps 0.3 scale 0.1 }
       scale<50,50,50> }
}