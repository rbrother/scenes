#include "colors.inc"
#include "textures.inc"

camera {
  location < -10, 12 , -25+clock*0.2 >
  rotate < 0, clock, 0 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 6, 15 >
}

light_source { < 10, 30, -20 > color White }
light_source { < 0, 50, 0 > color White }

#declare texture1 =
  texture {
    pigment {
      color red 1 green 0.3 blue 0
    }
    finish {
      ambient 0.2
      diffuse 0.6
      brilliance 2
      reflection 0.5
      phong 1
      phong_size 150
    }
  }

sphere { < 0, 0, 0 >, 5000 
  texture {
    finish {
      ambient 1
      diffuse 0
    }
    pigment {
      gradient y
      color_map {
        [ 0 color Black ] [0.4 color White ]
        [ 0.6 color red 0.5 ] [ 1.0 color Black ]
      }
      turbulence 0.1
      scale 5000
    }
  }
  texture {
    pigment {
      leopard
      color_map {
        [ 0 color Clear]
        [ 0.3 0.5 color Clear color Red ]
        [ 1 color Yellow ]
      }
      scale 300
      rotate < 45, 25, 45 >
    }
    finish {
      ambient 1
      diffuse 0
    }
  }
}

plane { y, 0
  texture {  
    tiles {
      texture { texture1 pigment { color rgb<0.6, 0.6, 0.6> } }
    tile2
      texture { texture1 pigment { color rgb<0.6, 0, 0> } }
    }
    scale 10
  }
}
  

#declare sphere1 = sphere { < 4.5, 0, 0 >, 2.0 }

#declare part1 = union {
  object { sphere1 
    texture { texture1 pigment { color rgb< 0.2, 0.4, 0.6 > } } 
  }
  object { sphere1 rotate 45*z }
  object { sphere1 rotate -45*z 
    texture { texture1 pigment { color rgb< 0.6, 0.4, 0.2 > } } 
  }
}

#declare part2 = union {
  object { part1 }
  object { part1 rotate 90*y }
  object { part1 rotate 180*y }
  object { part1 rotate 270*y }
}

union {
  object { part2 }
  union {
    sphere { < 0, 4.5, 0 >, 1.5 }
    sphere { < 0, -4.5, 0 >, 1.5 }
  }
  texture { texture1 }
  bounded_by {
    sphere { < 0, 0, 0 >, 6.5 }
  }
  rotate < 0 , 45 * clock / 24, 0 >  // Py”rii y-akselin ymp„ri (24 askelta)
  translate < 0, 6, 15 >
}



