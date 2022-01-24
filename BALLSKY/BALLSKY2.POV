// Sky full of balls

#include "colors.inc"

#max_trace_level 5

camera {
  location < 0, 0, 0 >
  direction < 0, 0, 1.3 >
  up < 0, 1, 0 >
  right     x*image_width/image_height
  look_at < 0, 0, 5 >
}

light_source { <1,1,1> color rgb<0.2,0.2,1> }

sphere { <0,0,0> 1
  texture {
    pigment { gradient y 
      color_map {
        [ 0 color rgb<0.8,1,0.3> ] [ 0.5 color Black ] [ 1.0 color Red ]
      }
      translate -0.5*y
      scale 2
    }
    finish { diffuse 0 ambient 1.0 }
  }
  texture {
    pigment {
      leopard
      color_map {
        [0 color rgbf<1,1,1,1> ] [0.2 color rgbf<1,1,1,1>]
        [ 1.0 color rgbf<1,1,1,0> ]
      }
      scale 0.1
    }
    finish { diffuse 0 ambient 1.0 }
  }
  scale 100000
}

#declare ball_finish = finish {
  ambient 0.2 diffuse 0.7 phong 1.0 phong_size 100
  reflection 0.95
}

#include "balls.inc"
