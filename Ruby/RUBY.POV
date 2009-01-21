// Red ruby

#include "colors.inc"
#include "textures.inc"

#max_trace_level 6

camera {
  location < 0, 10, -25 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 9, 0 >
}

sphere { < 0, 0, 0 > 1
  pigment { gradient < 0, 1, 0 >
    color_map { [ 0 color White ] [ 1 color rgb< 0.3, 0.3, 0 > ] }
    turbulence 0.8
  }
  finish {
    diffuse 0
    ambient 1
  }
  scale 120
}

#declare RubyTexture = texture {
  pigment { color rgbf<1,0.3,0.3,0.9> }
  finish {
    refraction 1
    reflection 0.2
    diffuse 0.2
    ior 1.8
    phong 1
    phong_size 100
  }
}

#declare RubyPlane1 = plane {
  < 0, -1, 0 > 0
  rotate < 0, 0, 35 >
  translate < 0.2, -0.2, 0 >
}

#declare RubyPlane2 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 45 >
  translate < 0.2, 0.7, 0 >
  rotate < 0, 30, 0 >
}

#declare RubyPlane3 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 75 >
  translate < -0.4, 0, 0 >
}


#declare Ruby = intersection {
  plane { < 0, -1, 0 > 0 translate < 0, -0.2, 0 > }
  object { RubyPlane1 rotate < 0, 0, 0 > }
  object { RubyPlane1 rotate < 0, 60, 0 > }
  object { RubyPlane1 rotate < 0, 120, 0 > }
  object { RubyPlane1 rotate < 0, 180, 0 > }
  object { RubyPlane1 rotate < 0, 240, 0 > }
  object { RubyPlane1 rotate < 0, 300, 0 > }
  object { RubyPlane2 rotate < 0, 0, 0 > }
  object { RubyPlane2 rotate < 0, 60, 0 > }
  object { RubyPlane2 rotate < 0, 120, 0 > }
  object { RubyPlane2 rotate < 0, 180, 0 > }
  object { RubyPlane2 rotate < 0, 240, 0 > }
  object { RubyPlane2 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 0, 0 > }
  object { RubyPlane3 rotate < 0, 30, 0 > }
  object { RubyPlane3 rotate < 0, 60, 0 > }
  object { RubyPlane3 rotate < 0, 90, 0 > }
  object { RubyPlane3 rotate < 0, 120, 0 > }
  object { RubyPlane3 rotate < 0, 150, 0 > }
  object { RubyPlane3 rotate < 0, 180, 0 > }
  object { RubyPlane3 rotate < 0, 210, 0 > }
  object { RubyPlane3 rotate < 0, 240, 0 > }
  object { RubyPlane3 rotate < 0, 270, 0 > }
  object { RubyPlane3 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 330, 0 > }
  texture { RubyTexture }
  bounded_by { sphere { < 0, 0, 0 > 1 } }
}

object {
  Ruby
  scale 14
  rotate < -15, 20, 0 >
  translate < 0, 6, 10 >
}
