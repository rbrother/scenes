//  Persistence of Vision Raytracer V3.5
//  World definition file.

#include "guitar.pov"

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
  <0.0, 0.0, 0.0>
  color rgb <1.000, 1.000, 1.000>
  translate  <-1000.0, 1000.0, -1000.0>
}

light_source {   // Lumiere
  <0.0, 0.0, 0.0>
  color rgb <1.000, 1.000, 1.000>
  translate  <1000.0, 1000.0, -1000.0>
}


object { Guitar rotate<0,135,180>}

//object { Guitar    rotate<50,60,45> }     
