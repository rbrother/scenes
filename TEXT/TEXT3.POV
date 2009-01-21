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
  color White*0.8
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [ 0 color Black ] [ 1 color Blue ]
    }
  }
}

plane { y, 0
  pigment { checker color White color rgb<1,0.7,0.7> scale 30 }
  finish { ambient 0.3 diffuse 1 brilliance 0.2 }
  rotate 20*y
  translate -15*y
  hollow
}

#declare TextTexture = texture {
  pigment { rgbt<1,1,1,1> }
  finish { reflection 0 refraction 1 ior 1.5 diffuse 0 ambient 0 }
  halo
  {
    attenuating
    box_mapping constant
    colour_map { [ 0 color rgbt <0.2,0,0.4, 0.3> ]
                 [ 1 color rgbt <0.2,0,0.4, 0.3> ] }
    samples 100
    aa_level 5
    aa_threshold 0.1
    jitter 0.8
    translate <-0.5, -0.5, -0.5>
    scale 10000
  }
}

#declare TextThick = 0.3

#declare teksti1 = text {
  ttf "stopd.ttf",
  "reflec",
  TextThick, 0 // Thickness, extra space
  texture { TextTexture }
  hollow
}

#declare teksti2 = text {
  ttf "stopd.ttf",
  "tio",
  0.3, 0 // Thickness, extra space
  texture { TextTexture  }
  rotate 90*x
  translate TextThick*y
  hollow
}

#declare teksti3 = text {
  ttf "stopd.ttf",
  "ns",
  TextThick, 0 // Thickness, extra space
  texture { TextTexture  }
  rotate 90*z
  hollow
}

object { teksti1 scale 100 rotate -40*y translate <-130,0,-20> }
object { teksti2 scale 100 rotate -60*y translate <10,0,-90> }
object { teksti3 scale 100 rotate 40*y translate <130,0,40> }

