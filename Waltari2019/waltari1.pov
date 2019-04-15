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
  location  <   -400.000,     600.000,     900.000>
  sky       <    0.00000,     0.00000,     1.00000> // Use right handed-system 
  up        <        0.0,         0.0,         1.0> // Where Z is up
  right     <    1.0,         0.0,         0.0> // Right Vector is adjusted to compensate for spherical (Moray) vs. planar (POV-Ray) aspect ratio
  angle         45.00000    // Vertical      33.750
  look_at   <      0.000,     350.000,       0.000>
}

//
// *******  L I G H T S *******
//

light_source {   // Lumiere
  <0.0, 0.0, 0.0>
  color rgb <1.000, 1.000, 1.000>
  photons { }
  translate  <-1000.0, 1000.0, 1000.0>
}


object { Guitar }

object { Guitar    rotate<50,60,45> }     

