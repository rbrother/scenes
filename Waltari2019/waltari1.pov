//  Persistence of Vision Raytracer V3.5
//  World definition file.

#include "stones.inc"
#include "shapes.inc"
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
  look_at   <      0.000,     100.000,       0.000>
}

//
// *******  L I G H T S *******
//              


light_source { 
  <-3000.0, 3000.0, -3000.0>
  color rgb <1,0.7,0.7>
}        

light_source {   // Lumiere
  <0.0, 5000, 0.0>
  color rgb <0.7,1,1>
}           

#declare Guit = object { Guitar scale 0.6 }
                
#declare HiHa = object { HiHat scale 10 translate<-200,0,-200> rotate<-90,0,0> }                

#declare Bass = object { BassDrum scale 10 }                

#declare Ground = union {
        #for (xx,-20,20,1)
           #for (yy,0,45,1)
                object {
                Round_Box_Merge(<-1,-1,-1>, <1, 1, 1>, 0.3)
                    rotate <xx*2,xx+yy*5,yy*3>
                    scale 0.4
                   translate <xx,yy*yy*0.001,yy> }
           #end        
        #end         
        translate<0,0,-30>
        scale 60
        texture { 
           T_Stone8
           normal { bumps 0.1 scale 0.1 }
           scale 20
           translate <-1000,0,0> 
        }
        finish { reflection 0 ambient 0 diffuse 0.6 }  
    }           
    
    
union {
    object { Ground translate<0,100,1000>}
    object { Guit rotate<0,150,0> rotate<0,0,20> translate<-50,50,-100>}
    object { Guit rotate<0,180,0> rotate<0,0,110> rotate<0,-30,0> translate<450,250,400> }
    object { Bass rotate<0,0,45> translate<250,50,-300> }
    object { Bass rotate<0,0,-145> rotate<0,130,0> translate<0,200,500> }
    object { HiHa rotate<0,30,30> translate<-100,150,-100> }
    object { HiHa rotate<0,0,30> rotate<0,-120,0> translate<100,200,400> }
}