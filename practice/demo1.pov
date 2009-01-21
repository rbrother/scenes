#include "colors.inc"
#include "woods.inc"


// Objects

// Create an infinite sphere around scene and allow any pigment on it
sky_sphere {
  pigment {
    gradient y
    color_map { [0.0 color rgb <0.7,0.7,1.0>] [1.0 color blue 0.5] }
  }
}

#declare t1 =   texture {
        pigment { color White } 
        finish { reflection 0.3 phong 1.0 phong_size 100 }
  }               

#declare transparent = texture
{
  pigment { Clear }
  finish { ambient 0 diffuse 0 refraction 1 }
}     


#declare my_ball1 =
sphere { <0,0,0> 1.0 
  texture
  {
        gradient y
        texture_map {
            [ 0.0 transparent ]
            [ 0.40 transparent ]
            [ 0.40 t1 ]
            [ 1.0 t1 ]
          }       
        scale 0.3     
        rotate x*45  
        rotate y*45
  }
}                        

// An infinite planar surface
plane {
  y, // <X Y Z> unit surface normal, vector points "away from surface"
  0 // distance from the origin in the direction of the surface normal
  hollow on // has an inside pigment?
  pigment { 
     bumps     
     color_map {
          [ 0 color red 0.0 green 0.0 blue 0.0]
          [ 0.5  color red 1 green 1 blue 1]     
          [ 1  color red 1 green 0 blue 0]       
     }     
     scale 0.3          
  }  
  finish
  {          
     diffuse 0.5
     reflection 0.5     
  }  
}                    

object { my_ball1              
  translate <0,1,0>
  scale <1.0,  1.0,  1.0> * 1.5
}
object { my_ball1  
  rotate <0,30,0>
  translate <0,1,0>
  translate <2.0,0,0>
}
object { my_ball1  
  rotate <0,30,0>
  translate <0,1,0>  
  scale 2.5
  translate <-1,0,4>  
}

// create a regular point light source
light_source {
  <-2, 4, -4>
  color rgb <1,1,1> * 0.6    // light's color
}

light_source {
  <0,10,0>
  color rgb <1,1,1> * 0.6    // light's color
}


/*
camera {
  location  <0.0, 2.0, -5.0>
  look_at   <0.0, 1.5,  0.0>
  right     x*4/3
} 
*/

camera {
  location  <0.0, 4.0, -3.0>
  look_at   <0.0, 1.5,  0.0>
  right     x*4/3
}

