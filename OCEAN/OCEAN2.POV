#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "shapes.inc"

camera {
  location < 0, 10, -25 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 9, 0 >
}

object {
  light_source { < 10, 30, -20 > color White }
}

object {
  light_source { < 0, 50, 0 > color White }
}

sphere {
  < 0, -3000, 0 > 3000
  pigment { color red 0.2 green 0.6 blue 1 }
  normal {
    waves 0.5
    frequency 4
    scale < 10, 10, 10 >
    translate < 30, 30, 30 >
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
         [ 1.0 color Yellow ]
      }
      scale < 0.04, 0.04, 0.04 >
      rotate < 45, 80, 10 >
    }
  }
  scale 500
}

object {
  union {
    sphere { < 0, 0, 0 > 5 }     // Big sphere
    sphere { < 0, 0, 4.5 > 1.5 }   // small ones attached to it
    sphere { < 0, 0, -4.5 > 1.5 }
    sphere { < 0, 4.5, 0 > 1.5 }
    sphere { < 0, -4.5, 0 > 1.5 }
    sphere { < 4.5, 0, 0 > 1.5 }
    sphere { < -4.5, 0, 0 > 1.5 }
    sphere { < 3.18, 3.18, 0 > 1.5 }
    sphere { < 3.18, -3.18, 0 > 1.5 }
    sphere { < -3.18, 3.18, 0 > 1.5 }
    sphere { < -3.18, -3.18, 0 > 1.5 }
    sphere { < 0, 3.18, 3.18 > 1.5 }
    sphere { < 0, 3.18, -3.18 > 1.5 }
    sphere { < 0, -3.18, 3.18 > 1.5 }
    sphere { < 0, -3.18, -3.18 > 1.5 }
    sphere { < 3.18, 0, 3.18 > 1.5 }
    sphere { < 3.18, 0, -3.18 > 1.5 }
    sphere { < -3.18, 0, 3.18 > 1.5 }
    sphere { < -3.18, 0, -3.18 > 1.5 }
  }
  bounded_by {
    sphere { < 0, 0, 0 > 6.0 }
  }
  rotate < 7, 15, 23 >
  texture {
    pigment { color red 1 green 0.3 blue 0 }
    finish {
      ambient 0
      diffuse 0.2
      brilliance 3
      reflection 0.8
      phong 1
      phong_size 150
    }
  }
  translate 7*y
  scale 1.2
  translate 11*z
}
