//  Persistence of Vision Raytracer V3.5
//  World definition file.

#include "stones.inc"
#include "guitar.pov"
#include "drumkit.pov"

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
  location  <   0.000,     600.000,     -700.000>
  up        <        0.0,         1.0,         0.0> 
  right     <    1.0,         0.0,         0.0>
  look_at   <      0.000,     0.000,       0.000>
}

//
// *******  L I G H T S *******
//              


light_source { 
  <-3000.0, 3000.0, -3000.0>
  color rgb <1,1,0.5>
}        

light_source {   // Lumiere
  <0.0, 5000, 0.0>
  color rgb <0.7,0.7,1>
}   

#declare Guitars = union {             
    #for (i,15,359,45)
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


#declare Drums = union {             
    #for (i,0,359,60)
        object { BassDrum 
            rotate<-90,0,0>
            rotate<0,180,0>  
            scale 8 
            rotate<0,i*0.7,i*2>       
            translate<250,0,0>                       
            rotate<0,i+20,0>
            translate <0,70,0>
            }            
    #end
}                      


#declare HiHats = union {             
    #for (i,0,359,60)
        object { HiHat 
            rotate<-70,0,0>
            rotate<0,180,0>  
            scale 10 
            translate<450,0,0>                       
            rotate<0,i+30,0>
            translate <0,-70,0>
            }            
    #end
}                      


#declare Ground = 
    blob {
        #for (i,0,200,1)
            sphere { <sin(i*0.1)*1000,0,0>, 300, 30 
              rotate<0,i*19,0>
            }
        #end                       
        scale <2,1,2>
        texture { 
           T_Stone8
           normal { bumps 0.1 scale 0.1 }
           scale 20
           translate <-1000,0,0> }
        finish { reflection 0 ambient 0 diffuse 0.6 }  
    }
    
union {
    object { Ground translate<0,-200,500>}
    object { Guitars }
    object { Drums }
    object { HiHats }
}