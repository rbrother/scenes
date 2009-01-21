#include "colors.inc"
#include "stones.inc"
#include "metals.inc"

global_settings { max_trace_level 10 }

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
  area_light 160*x, 160*z, 20, 20
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

#declare Torus1 = union {
  difference {
    torus { 60, 20 }
    box { <-100,-21,-100>, <0,21,0> }
  }
  sphere { <0,0,-60>, 20 }
  sphere { <-60,0,0>, 20 }
  rotate -45*y
  translate <0,20,0>
}

#declare pig1 = pigment {
  gradient y
  color_map {
    [ 0 Black ] [ 0.5 White ] [ 1 Black ]
  }
  rotate -30*z
  scale 0.02
}

#declare pig2 = pigment {
  leopard
  color_map {
    [ 0 Red ] [ 0.5 Black ] [ 0.8 Yellow ]
  }
  rotate -30*z
  scale 0.02
}

#declare pig3 = pigment {
  leopard
  color_map {
    [ 0 Blue ] [ 0.4 Black ] [ 0.6 Yellow ]
  }
  rotate -30*z
  scale 0.02
}

#declare pig4 = pigment {
  crackle
  color_map {
    [ 0 Yellow ] [ 0.2 Black ] [ 0.4 Red ] [ 1 Black ]
  }
  scale 0.07
}

#declare Torus2 = object {
  Torus1
  pigment {
    gradient x
    pigment_map {
      [ 0 pig1  ] [ 0.3 pig1 ]
      [ 0.70 pig2 ] [ 1 pig2 ]
    }
    scale 160
    translate -80*x
  }
  finish { diffuse 0.6 ambient 0.2 phong 1 brilliance 2 reflection 0.3 }
}

#declare Torus3 = object {
  Torus1
  pigment {
    gradient x
    pigment_map {
      [ 0 pig4  ] [ 1 pig3 ]
    }
    scale 160
    translate -80*x
  }
  finish { diffuse 0.6 ambient 0.2 phong 1 brilliance 2 reflection 0.3 }
  scale 0.8
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
