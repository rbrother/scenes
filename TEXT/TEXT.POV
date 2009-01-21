#include "colors.inc"
#include "stones.inc"
#include "skies.inc"
#include "metals.inc"

global_settings { max_trace_level 10 }

camera {
  location  < -120, 150, -250 >
  direction < 0,0,1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < -120, 30, 0>
}

light_source {
  <-50, 160, -250>
  color White
}

light_source {
  <-200, 160, -250>
  color Red
}

plane { y, 0
  pigment { checker color Blue color Black scale 15 }
  finish { reflection 0.5 diffuse 0.5 ambient 0.1 }
  rotate 20*y
}

#declare TextTexture = texture {
  pigment { rgb<1,1,0> }
  finish { brilliance 2.0 ambient 0.1 diffuse 0.8 reflection 0.3 metallic }
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
  rotate 89.99*x
  translate TextThick*y
}

#declare teksti3 = text {
  ttf "stopd.ttf",
  "ns",
  TextThick, 0 // Thickness, extra space
  texture { TextTexture }
  rotate 90*z
}

object { teksti1 scale 100 rotate -40*y translate <-250,0,-20> }
object { teksti2 scale 100 rotate -60*y translate <-110,0,-90> }
object { teksti3 scale 100 rotate 40*y translate <10,0,40> }
