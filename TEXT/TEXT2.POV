#include "colors.inc"
#include "stones.inc"
#include "metals.inc"

global_settings { max_trace_level 10 }

camera {
  location  < 0, 150, -250 >
  direction < 0,0,1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < 0, 30, 0>
}

light_source {
  <0,200,-100>
  color White*1.2
  area_light 300*x, <0,300,200>, 20, 20
  adaptive 1
}

plane { y, 0
  pigment { White }
  finish { ambient 0.3 diffuse 1 brilliance 0.2 }
  rotate 20*y
  translate -15*y
}

#declare TextTexture = texture {
  pigment { gradient y
    color_map { [ 0 color rgb<0.7,0.6,0.3> ] [ 1 rgb <1,1,1> ] }
  }
  normal { bumps 0.12 scale 0.02 }
  finish { brilliance 0.7 ambient 0.1 diffuse 0.8 }
}

#declare TextThick = 0.3

#declare teksti1 = text {
  ttf "stopd.ttf",
  "reflec",
  TextThick, 0 // Thickness, extra space
  texture { TextTexture } 
}

#declare teksti2 = text {
  ttf "stopd.ttf",
  "tio",
  0.3, 0 // Thickness, extra space
  texture { TextTexture }
  rotate 90*x
  translate TextThick*y
}

#declare teksti3 = text {
  ttf "stopd.ttf",
  "ns",
  TextThick, 0 // Thickness, extra space
  texture { TextTexture }
  rotate 90*z
}

object { teksti1 scale 100 rotate -40*y translate <-130,0,-20> }
object { teksti2 scale 100 rotate -60*y translate <10,0,-90> }
object { teksti3 scale 100 rotate 40*y translate <130,0,40> }
