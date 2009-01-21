// ==== Standard POV-Ray Includes ====
#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions

// set viewer's position in the scene
camera
{
// (camera types)
//  perspective (default) | orthographic | fisheye |
//  ultra_wide_angle | omnimax | panoramic | cylinder 1
  location  <-4.0, 3.0, -6.0> // position of camera <X Y Z>
  direction 2.0*z            // which way are we looking <X Y Z> & zoom
//  sky       y                // rarely used
  up        y                // which way is +up <X Y Z>
  right     4/3*x            // which way is +right <X Y Z> and aspect ratio
  look_at   <-1.0, 1.2,  0.0> // point center of view at this point <X Y Z>
//  angle FLOAT                // overrides "direction" with specific angle
//  normal { ripples 0.2 }     // perturb the camera lens with a pattern
// (focal blur extras)
//  aperture 0.2               // 0...N (bigger is narrower depth of field)
//  blur_samples 4             // # of rays per pixel
//  focal_point <VECTOR>       // x,y,z point that is in focus
}
      
light_source { <0,10,0> color rgb<0.6,0.6,0.2> }
light_source { <-3,5,-10> color rgb<0.5,0.5,0.7> }  
light_source { <-20,5,-2> color rgb<0.5,0.3,0.3> }
      
// CSG difference, subtract intersections of shapes 2...N from Shape1
#declare cylwidth = 0.5   

#declare plane1 = plane { -y, 0 rotate z*45 translate y*1.7 }
#declare plane2 = object { plane1 rotate x*90 }

#declare planegroup1 = union {
  object { plane1 }
  object { plane1 rotate y*90 }
  object { plane1 rotate y*180 }
  object { plane1 rotate y*270 }
}

#declare planegroup2 = union {
  object { plane2 }
  object { plane2 rotate y*90 }
  object { plane2 rotate y*180 }
  object { plane2 rotate y*270 }
}    

#declare cone1 = cone {
  <0, 0, 0>, 0.0    // Center and radius of one end
  <0, 0, -1.0>, 1.0    // Center and radius of other end 
  translate -0.4*z   
}

#declare Weirdo = difference
{
  box
  {
    <-1, -1, -1>  // one corner position <X1 Y1 Z1>
    < 1,  1,  1>  // other corner position <X2 Y2 Z2>
  }
  cylinder { <-1.1, 0, 0>, <1.1, 0, 0>, cylwidth }  
  cylinder { <0, -1.1, 0>, <0, 1.1, 0>, cylwidth }  
  cylinder { <0, 0, -1.1>, <0, 0, 1.1>, cylwidth }  
  object { cone1 }
  object { cone1 rotate y*90 }
  object { cone1 rotate y*180 }
  object { cone1 rotate y*270 }
  object { cone1 rotate x*90 }
  object { cone1 rotate x*(-90)}
  object { planegroup1 }
  object { planegroup1 rotate z*180 }
  object { planegroup2 }
  pigment {    
    gradient x       //this is the PATTERN_TYPE
    color_map {
      [ 0.1  color Red ]
      [ 0.3  color Yellow ]
      [ 0.6  color Blue ]
      [ 0.6  color Green ]
      [ 0.8  color Cyan ]
    }
  }
  finish { diffuse 0.6 ambient 0.3 }   
  translate y*1.0
}
                             
object { Weirdo }
object { Weirdo rotate y*30 translate <0,0,7> }
object { Weirdo rotate y*10 translate <10,0,20> }    
object { Weirdo rotate y*(-15) translate <-3.5,0,-3> }  

plane { y,0 
  pigment { color White }  
  finish { ambient 0.3 diffuse 0.9 }
}                           