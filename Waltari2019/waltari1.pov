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
  location  <   0.000,     700.000,     -700.000>
  up        <        0.0,         1.0,         0.0> 
  right     <    1.0,         0.0,         0.0>
  look_at   <      0.000,     0.000,       0.000>
}

//
// *******  L I G H T S *******
//              

sky_sphere {               
  pigment {
    bumps 
    
    color_map {
      [ 0.0 color rgb<0,0,0> ]      
      [ 0.8 color rgb<0,0,0> ]
      [ 0.9 color rgb<0.5,0.5,1> ]
      [ 1.0 color rgb<1,1,1> ]
    }
  }
}

light_source {   // Lumiere
  <1000.0, 2000.0, -2000.0>
  color rgb <0.8, 0.8, 0.8>
}

light_source {   // Lumiere
  <-1000.0, 2000, 0.0>
  color rgb <1.000, 1.000, 0.8>
}
              
#declare Guitars = union {             
    #for (i,0,359,30)
    object { Guitar    
        scale 0.6  
        translate<0,-200,0>    
        
        rotate<0,135,0>
        
        rotate<0,0,i*2>       
                       
        translate<400,0,0>                       
                       
        rotate<0,i,0>
           
        translate<0,120,0>   
        }            
    #end
}       

#declare Ground = 
    blob {
        #for (i,0,400,1)
            sphere { <sin(i*0.1)*1000,0,0>, 140, 30 
              rotate<0,i*19,0>
            }
        #end            
        texture { T_Stone5
           normal { bumps 0.3 scale 0.1 }
           scale 20 }
        finish { reflection 0 ambient 0.1 diffuse 0.8 }  
        
    }
    
union {
    object { Ground translate<0,0,500>}
    object { Guitars }
}