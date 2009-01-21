// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "functions.inc"  // internal functions usable in user defined functions



// An infinite planar surface
// plane {<A, B, C>, D } where: A*x + B*y + C*z = D
plane {
  y, // <X Y Z> unit surface normal, vector points "away from surface"
  0.0 // distance from the origin in the direction of the surface normal
  hollow off // has an inside pigment?
// solid pattern for use in texture/pigment/normal(/density)
// create a hexagonal pattern texture with 3 colors
// hexagons are in the X-Z plane, extending infinitely in Y plane
        pigment
        {
  hexagon
    color White,
    color rgb<1,1,0.5>,
    color rgb<0.8,0.8,0.8>
         }     
         finish
         {
                ambient 0.3
                diffuse 1.0
                reflection 0.3
         }      
         
}  

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-20, 50, -60>
}              


fog {
  fog_type   2
  distance   60
  color      Black
  fog_offset 0.1
  fog_alt    10
  turbulence 0
}              

 

                      
#declare torus_size = 6;

  // spin the torus around the X axis, as "clock" goes from 0 to 1
  // the torus will rotate one complete 360 degree revolution.
  // Note that the texture is put on BEFORE we rotate so it rotates too.
  torus 
  { 
        1, 0.3    
        rotate x*90
        translate y*(1.0+0.3)
        scale torus_size 
        pigment 
        {
                crackle          // crackled pattern
                color_map {
                  //  [ END_VAL color red R green G blue B filter F transmit T]
                  [ 0.1  color White ]
                  [ 0.7  color Red ]
                  [ 1.0  color Blue ]
                } // color_map  
                turbulence 0.5
        }                     
        finish
        {
                diffuse 1
                ambient 0
                phong 1
                reflection 0.3
        }
        rotate clock*y*360
  } // torus
  
  #declare y_center = torus_size * 1.3;
              
              
// perspective (default) camera
camera {
  location  <0.0, 7.0, -20.0>
  look_at   <0.0, y_center,  0.0>
  right     x*image_width/image_height
}
              