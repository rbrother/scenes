// ==== Standard POV-Ray Includes ====

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
  right     1.3333*x            // which way is +right <X Y Z> and aspect ratio
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
  pigment { color White*0.4 }
  finish { ambient 0 diffuse 0.8 phong 0.6 reflection 0.3 }
}
#declare CStrength = 1.8;
#declare CRadius = 1.3;

#declare OTexture = texture {
  pigment { color Red*0.6 }
  finish { ambient 0 diffuse 0.8 phong 0.6 reflection 0.3 }
}
#declare OStrength = 1.8;
#declare ORadius = 1.3;

#declare HTexture = texture {
  pigment { color White }
  finish { ambient 0.2 diffuse 0.8 phong 0.6 reflection 0.2 }
}
#declare HStrength = 1.2;
#declare HRadius = 1.0;

// Molecule object from xyz coordinates. Copy to POV.
#declare molecule = blob {
  threshold 1.0
  sphere { < -0.38897, -1.37624,  0.33824>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.89504, -0.75345, -0.17891>, HRadius, HStrength texture { HTexture } }
  sphere { <  2.84475,  0.68274, -1.96996>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.48152,  2.54416, -2.96301>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.85790,  2.94964, -2.13759>, HRadius, HStrength texture { HTexture } }
  sphere { < -1.81544,  1.51450, -0.33178>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.02929,  0.29011, -0.10985>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.27129,  0.07332, -0.59101>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.80981,  0.87294, -1.60097>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.05375,  1.90609, -2.15515>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.24446,  2.12976, -1.69638>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.77520,  1.32588, -0.68634>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.69080, -0.53319,  1.00001>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.38898, -1.37623,  1.66180>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.89502, -0.75348,  2.17897>, HRadius, HStrength texture { HTexture } }
  sphere { <  2.84474,  0.68274,  3.97000>, HRadius, HStrength texture { HTexture } }
  sphere { <  1.48154,  2.54421,  4.96298>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.85786,  2.94973,  4.13752>, HRadius, HStrength texture { HTexture } }
  sphere { < -1.81541,  1.51456,  2.33174>, HRadius, HStrength texture { HTexture } }
  sphere { < -0.02928,  0.29012,  2.10987>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.27128,  0.07332,  2.59104>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.80981,  0.87296,  3.60099>, CRadius, CStrength texture { CTexture } }
  sphere { <  1.05377,  1.90614,  4.15513>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.24443,  2.12983,  3.69634>, CRadius, CStrength texture { CTexture } }
  sphere { < -0.77518,  1.32593,  2.68632>, CRadius, CStrength texture { CTexture } }
  translate <-0.42911,-0.97072,-1.00000>
  rotate <0,90,0>
}

object { molecule scale 2.0 rotate y*clock*720 rotate x*clock*360 }
