// ==== Standard POV-Ray Includes ====

// Metaani

#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions

// Create an infinite sphere around scene and allow any texture on it
sky_sphere
{
  pigment
  {
    gradient y
    color_map { [ 0.0 Black ] [ 0.4 Gray70 ] [0.6 White ] [1.0 White ] }
    translate -0.5*y
    scale 2
  }
}

// set viewer's position in the scene
camera
{
  location  <0.0, 0, -30.0>  // position of camera <X Y Z>
  direction 3.0*z            // which way are we looking <X Y Z> & zoom
  up        y                // which way is +up <X Y Z>
  right     x            // which way is +right <X Y Z> and aspect ratio
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
  pigment { color Blue*0.2 }
  finish { ambient 0 diffuse 0.8 phong 1 reflection 0.5 }
}

#declare HText = texture {  pigment { color White }
  finish { ambient 0.2 diffuse 0.8 phong 1 reflection 0.2 }
}

// create a smooth blobby shape
#declare molecule = blob
{
  // threshold (0.0 < threshold <= StrengthVal) surface falloff threshold #
  threshold 0.6
  sphere { < 0, 0, 0>, 1.2, 3.0 texture { CarbonText } } // Hiili
  sphere { < 0, 0, 1>, 0.6, 3.0 texture { HText } }
  sphere { < 0, 0.943, -0.333>, 0.6, 3.0 texture { HText } }
  sphere { < -0.816, -0.471, -0.333>, 0.6, 3.0 texture { HText } }
  sphere { < 0.816, -0.471, -0.333>, 0.6, 3.0 texture { HText } }
  scale 3
}

object { molecule rotate 45*y rotate -20*x }
