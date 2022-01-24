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

light_source { <-30,30,0> color White }

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
    pigment { gradient x
      color_map {
        [ 0 color rgbf<1,1,1,1> ] [ 0.4 color rgbf<1,1,1,1> ] 
        [ 0.8 color rgbf<0,0,1,0.5> ] [ 1.0 color rgb<1,1,1> ]
      }
      translate -0.5*x
      scale 2
      rotate z*30
    }
    finish { diffuse 0 ambient 1.0 }
  }

  scale 100000
}

#declare ball_finish = finish {
  ambient 0.0 diffuse 0.7 phong 1.0 phong_size 100
  reflection 0.7
}

#include "balls.inc"
