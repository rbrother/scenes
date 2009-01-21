#include "colors.inc"
#include "stones.inc"
#include "metals.inc"

global_settings { max_trace_level 7 }

camera {
  location  < 0, 150, -210 >
  direction < 0,0,1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < 0, 0, 40>
}

light_source {
  <0,400,-200>
  color White*1.0
  area_light 30*x, 30*z, 9, 9
  adaptive 1
  spotlight
  radius 15
  falloff 20
  point_at <0,0,60>
}

plane { y, 0
  pigment { White }
  finish { ambient 0 diffuse 1 brilliance 0.6 reflection 0.2 }
  rotate 20*y
  hollow
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [ 0 color Black ] [ 1 color White ]
    }
  }
}

#declare Torus1 = merge {
  difference {
    torus { 60, 20 }
    box { <-100,-21,-100>, <0,21,0> }
  }
  sphere { <0,0,-60>, 20 }
  sphere { <-60,0,0>, 20 }
  rotate -45*y
  translate <0,20,0>
  hollow
}

#declare tex3 = texture {
  pigment { White }
  finish { ambient 0.1 diffuse 0.25 reflection 0.65 phong 1 }
  rotate -30*z
  scale 0.02
}

#declare tex4 = texture {
  pigment {
    crackle
    color_map {
      [ 0 Yellow ] [ 0.2 Black ] [ 0.4 Red ] [ 1 Black ]
    }
  }
  finish { phong 1 ambient 0.2 diffuse 0.8 }
  scale 0.07
}

#declare Torus3 = object {
  Torus1
  pigment { Clear }
  finish { diffuse 0 ambient 0 phong 1 refraction 0.95 ior 1.5 }
  scale 0.8
  hollow
}

#declare Torus2 = object {
  Torus1
  texture {
    gradient x
    texture_map {
      [ 0 tex4  ] [ 0.3 tex4 ]
      [ 0.7 tex3 ] [ 1 tex3 ]
    }
    scale 160
    translate -80*x
  }
  
}

object { Torus2
  rotate -10*y
  translate <20,0,0>
}

object { Torus3
  rotate -25*y
  rotate <0,-40,20>
  translate <-30,30,0>
}
