// ==== Standard POV-Ray Includes ====

// Benzo(a)pyreeni
// kolme benzeeni-rengasta alarivissä, kaksi ylärivissä oikeassa laidassa

#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions

// Create an infinite sphere around scene and allow any texture on it
sky_sphere
{
  pigment
  {
    gradient y
    color_map { [ 0.0 Black ] [ 0.4 rgb<0.2,0,1> ] [0.6 White ] [1.0 White ] }
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

#declare CTexture = texture {
  pigment { color Blue*0.2 }
  finish { ambient 0 diffuse 0.8 phong 1 reflection 0.5 }
}
#declare CStrength = 1.8;
#declare CRadius = 1.1;

#declare OTexture = texture {
  pigment { color Red*0.6 }
  finish { ambient 0 diffuse 0.8 phong 1 reflection 0.5 }
}
#declare OStrength = 1.8;
#declare ORadius = 1.3;

#declare HTexture = texture {
  pigment { color White }
  finish { ambient 0.2 diffuse 0.8 phong 1 reflection 0.2 }
}
#declare HStrength = 1.2;
#declare HRadius = 0.8;

// create a smooth blobby shape
// Molecule object from xyz coordinates. Copy to POV.
#declare molecule = blob {
  threshold 1.0
  sphere { <  0.16993,  0.20524,  0.82697>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.29902, -0.30646, -0.04168>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.26996,  0.04915,  0.77319>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.05361,  1.29253,  0.75530>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.35478, -0.33599,  2.02838>, ORadius, OStrength texture { OTexture } }
  sphere { <  0.20726,  0.27877,  3.17634>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.23338, -0.17711,  4.08974>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.30859,  0.12521,  3.20481>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.01494,  1.36866,  3.18695>, HRadius, HStrength texture { HTexture } }
  translate <0,0,-2>
}

object { molecule rotate <0,90,0> rotate <-90,0,0> scale 3 translate <0.0,0.0,0.0> }
