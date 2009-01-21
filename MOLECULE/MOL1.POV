
// ==== Standard POV-Ray Includes ====
#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions


// Create an infinite sphere around scene and allow any texture on it
sky_sphere
{
  pigment
  {
    gradient y
    color_map { [ 0.0 Red ] [ 0.5 White ] [1.0 Yellow] }
    translate -0.5*y
    scale 2
  }
}


// set viewer's position in the scene
camera
{
  location  <0.0, 0, -30.0>  // position of camera <X Y Z>
  direction 2.0*z            // which way are we looking <X Y Z> & zoom
  up        y                // which way is +up <X Y Z>
  right     4/3*x            // which way is +right <X Y Z> and aspect ratio
  look_at   <0.0, 0.0,  0.0> // point center of view at this point <X Y Z>
}

// create a regular point light source
light_source
{
  0*x // light's position (translated below)
  color red 1.0  green 1.0  blue 1.0  // light's color
  translate <-20, 40, -70>
}

#declare CarbonText = texture {
  pigment { color Gray30 }
  finish { ambient 0.2 diffuse 0.8 phong 1 reflection 0.4 }
}

#declare HText = texture {
  pigment { color White }
  finish { ambient 0.2 diffuse 0.8 phong 1 reflection 0.2 }
}

// create a smooth blobby shape
#declare molecule = blob
{
  // threshold (0.0 < threshold <= StrengthVal) surface falloff threshold #
  threshold 0.6
  #declare n = 1
  #while (n<7)
      sphere { < 3.5, 0, 0>, 2.8, 3.0
        rotate z*(n*60) texture { CarbonText } }
      sphere { < 6, 0, 0>, 1.8, 3.0
        rotate z*(n*60) texture { HText } }
    #declare n = n + 1
  #end
  scale 1

}

object { molecule rotate y*15 rotate x*45 }
object { molecule rotate y*15 rotate x*-45 translate <-20,10,30> }
object { molecule rotate y*15 rotate x*45 translate <10,10,50> }
