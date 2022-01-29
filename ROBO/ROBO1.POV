/*  Robot. POV-object By Robert Brotherus 1994

*/

global_settings {
  assumed_gamma 2
}


#include "colors.inc"
#include "textures.inc"

camera {
  location < 0, 10, -20 >
  right     x*image_width/image_height
  up < 0, 1, 0 >
  direction < 0, 0, 1.5 >
  look_at < 0, 10, 0 >
}

light_source { < -5, 10, -10 > color White }
light_source { < 10, 5, 0 > color White }

sphere { < 0, 0, 0 >, 1
texture {
  pigment { gradient < 0, 1, 0 >
    color_map {
      [ 0 color Blue ] [ 0.25 color Black ]
      [ 0.50 color Red ] [ 0.75 color Black ]
      [ 1.00 color Blue ]
    }
    scale 0.3
    rotate z*15
  }
  finish { diffuse 0 ambient 1.0 }
}
texture {
  pigment { gradient < 0, 1, 0 >
    color_map {
      [ 0,0.5 color Clear color Clear] [ 0.75 color Yellow ]
      [ 1.00 color Clear ]
    }
    scale 0.3
    rotate z*-30
  }
  finish { diffuse 0 ambient 1.0 }
}
scale 10000
}

#declare Head_part1 = box { < -0.07, 0, -1.3 >, < 0.07, 2, -1.05 > }

#declare Head_part2 =
  box { < -1.1, 0, 0 >, < 1.1, 1, 0.15 > rotate x*20 }

#declare Head = union {
  intersection {
    difference {
      box { < -1, 0, -1.2 >, < 1, 3, 1 > }
      plane { -y, 1 rotate -70*x translate y*7.2 }
      plane { y, 1 rotate 20*x translate y*-1.2 }
      plane { -y, 1 rotate 45*x translate y*4.8 }
      object { Head_part1 }
      object { Head_part1 translate x*0.3}
      object { Head_part1 translate x*-0.3}
      object { Head_part1 translate x*0.6}
      object { Head_part1 translate x*-0.6}
      object { Head_part2 }
      object { Head_part2 translate z*0.3 }
      object { Head_part2 translate z*-0.3 }
      object { Head_part2 translate z*-0.6 }
    }
    cylinder { < -4.5, 0.7, -1.5 >, < -4.5, 0.7, 1.5 >, 5.5 }
    cylinder { < 4.5, 0.7, -1.5 >, < 4.5, 0.7, 1.5 >, 5.5 }
  }
  cylinder { < 0.8, 0.2, 0.3 >, < 0.8, 3.8, 0.6 >, 0.15 }
  cylinder { < -0.8, 0.2, 0.3 >, < -0.8, 3.8, 0.6 >, 0.15 }
  union {
    sphere { < -0.4, 2, -0.75 >, 0.3 }
    sphere { < 0.4, 2, -0.75 >, 0.3 }
    texture {
      pigment { color red 0.7 }
      finish { specular 1 roughness 0.02 }
    }
  }
  texture { Gold_Metal }
}

object { Head scale 3 translate y*5 rotate 30*y }