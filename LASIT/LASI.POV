#include "colors.inc"
#include "stones.inc"
#include "skies.inc"
#include "metals.inc"

// "on the rocks"

// Lisää: kynä? Keltaisesta valosta spottivalo. Rivistö spotteja?
// hieman hiejastava lasilevy. Vesilasi!

global_settings { max_trace_level 10 }

camera {
   location  < 0, 550, -300 >
   direction < 0,0,1.4>
   up        < 0.0, 1.0, 0.0>
   right     < 0.75, 0.0, 0.0>
   look_at   < 0, 540, 0>
}

#declare lasi_osa = prism {
  linear_sweep linear_spline
  0, 50, // height 1,2
  9,
  <20,12>, <12,20>, <-12,20>, <-20,12>,
  <-20,-12>, <-12,-20>, <12,-20>, <20,-12>, <20,12>
}

#declare tikku = merge {
  cylinder { <0,0,0>, <0,35,0>, 1 }
  sphere { <0,0,0>, 1.5 }
  sphere { <0,35,0>, 1.35 }
  translate 1.5*y
  pigment { rgbf <1,0.7,0.7,1> }
  finish { reflection 0.2 refraction 1 ior 1.4 diffuse 0 ambient 0 }
  scale 2
  translate 8*y
}

#declare juoma1 =
  object { lasi_osa
    pigment { rgbt<1,1,1,1> }
    halo
    {
      attenuating
      box_mapping constant
      colour_map { [ 0 color rgbft <0.7,0.6,0.1,0,0.99> ]
                   [ 1 color rgbft <0.7,0.6,0.1,0,0.99> ] }
      samples 20
      aa_level 5
      aa_threshold 0.1
      jitter 0.8
    }
    finish { reflection 0 refraction 1 ior 1.5 diffuse 0 ambient 0 }
    hollow
    scale <0.799,0.30,0.799> translate 8*y
  }

#declare juoma2 =
  object { lasi_osa
    pigment { rgbt<1,1,1,1> }
    halo
    {
      attenuating
      box_mapping constant
      colour_map { [ 0 color rgbft <0.7,0,0.1,0,0.99> ]
                   [ 1 color rgbft <0.7,0,0.1,0,0.99> ] }
      samples 20
      aa_level 5
      aa_threshold 0.1
      jitter 0.8
    }
    finish { reflection 0 refraction 1 ior 1.5 diffuse 0 ambient 0 }
    hollow
    scale <0.799,0.30,0.799> translate 8*y
  }

#declare lasi = union {
  difference {
    object { lasi_osa }
    object { lasi_osa scale <0.8,1,0.8> translate 8*y }
  }
  object { tikku rotate x*30 translate -14*z }
  pigment { color rgbf<1,1,1,0.98> }
  normal { bumps 0.1 scale 3 }
  finish { diffuse 0 ambient 0 reflection 0 refraction 1 ior 1.7 }
}

#declare lasi1 = union {
  object { juoma1 }
  object { lasi }
  scale 0.7
  translate 0.01*y
}

#declare lasi2 = union {
  object { juoma2 }
  object { lasi }
  scale 0.7
  translate 0.01*y
}

#declare Table = union {
  torus { 150, 2.3 texture { T_Gold_3C } }
  cylinder { <0,0,0>, <0,-3,0>, 150 }
  cylinder { <0,-3,0>, <0,-200,0>, 30 }
  texture { T_Stone34 scale 60
    finish { reflection 0.4 diffuse 0.5 ambient 0 }
  }
}

#declare TableTop = union {
  object { Table }
  object { lasi1 rotate y*70 translate <20,0,-125> }
  object { lasi2 rotate y*150 translate <-20,0,-85> }
  translate 500*y
}

light_source {
  <-200000, 500000, -100000>
  color White
}

sky_sphere { S_Cloud2 }

plane { y, 0
  pigment { gradient z
    color_map { [ 0 Black ] [ 0.5 Black ] [ 0.5 White ] [ 1.0 White ] }
    scale 1000
  }
  finish { reflection 0.8 diffuse 0.2 ambient 0 }
}

height_field
{
  gif               // the file type to read (gif/tga/pot/pgm/ppm/png/sys)
  "vuoret.gif"     // the file name to read
  pigment { color White }
  finish { reflection 0.7 diffuse 0.3 }
  smooth        // make smoother surface
  translate <-0.5,-0.5,-0.5>
  rotate y*90
  scale 10000 scale <12,5,12>
  translate <10000,0,80000>
}

object { TableTop }
