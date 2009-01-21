// GOLDEN CHAINS from infinity fo a ring in center

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "shapes.inc"

camera {
  location < 0, 15, -20 >
  direction < 0, 0, 1.5 >
  right < 1.333, 0, 0 >     
  look_at < 0, 10, 0 >
}

sphere {
  < 0, -3000, 0 > 3000
  pigment { color red 0.2 green 0.6 blue 1 }
  normal {
    waves 0.5
    frequency 4
    scale < 10, 10, 10 >
    translate < 50, 50, 50 >
  }
  finish {
    diffuse 0.6
    ambient 0.2
    brilliance 6
    phong 1
    phong_size 400
    reflection 0.5
  }
}

sphere { < 0, 0, 0 > 1
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map {
         [ 0.0 color White ] [ 0.4 color Blue ]
         [ 0.95 color Black ] [ 1.0 color Black ]
      }
    }
    finish {
      diffuse 0
      ambient 1
    }
  }
  texture {
    pigment {
      leopard
      color_map {
         [ 0.0 color rgbf<1,1,1,1> ]
         [ 0.6 color rgbf<0,0,0,0> ]
         [ 1.0 color Red ]
      }
      scale < 0.02, 0.02, 0.02 >
      rotate < 45, 80, 10 >
    }
  }
  scale 500
}

light_source { < -10, 30, -20 > color White }
light_source { < 0, 30, 20 > color White }

#declare Loop = union {
  intersection { torus { 1.5, 0.5 } plane { < -1, 0, 0 > 0 } }
  cylinder { < 0, 0, 1.5 >, < -2, 0, 1.5 >, 0.5 }
  cylinder { < 0, 0, -1.5 >, < -2, 0, -1.5 >, 0.5 }
  intersection {
    torus { 1.5, 0.5 }
    plane { < 1, 0, 0 > 0 }
    translate < -2, 0, 0 >
  }
  translate < 1, 0, 0 >
  texture { Gold_Metal }
}

#declare TwoLoops = union {
  object { Loop }
  object { Loop rotate < 90, 0, 0 > translate < 4, 0, 0> }
}

#declare Chain = union {
  object { TwoLoops }
  object { TwoLoops translate < 8, 0, 0 > }
  object { TwoLoops translate < 16, 0, 0 > }
  object { TwoLoops translate < 24, 0, 0 > }
  object { TwoLoops translate < 32, 0, 0 > }
  object { TwoLoops translate < 40, 0, 0 > }
  object { TwoLoops translate < 48, 0, 0 > }
  object { TwoLoops translate < 56, 0, 0 > }
  object { TwoLoops translate < 64, 0, 0 > }
  object { TwoLoops translate < 72, 0, 0 > }
  object { TwoLoops translate < 80, 0, 0 > }
  object { TwoLoops translate < 88, 0, 0 > }
  object { TwoLoops translate < 96, 0, 0 > }
  object { TwoLoops translate < 104, 0, 0 > }
  object { TwoLoops translate < 112, 0, 0 > }
  object { TwoLoops translate < 120, 0, 0 > }
  object { TwoLoops translate < 128, 0, 0 > }
}

sphere { < 8, 6, 10 > 5
  pigment { color Red }
  finish { phong 1 reflection 0.8 diffuse 0.2 ambient 0}
}

sphere { < -12, 8, 30 > 7
  pigment { color rgbf<1,1,1,1> }
  finish { phong 1 refraction 1 reflection 0.2 ior 1.7 diffuse 0 ambient 0 }
}

object {
  Chain
  rotate <0, -55, 0 >
  translate <-18, 5, -3>
}
