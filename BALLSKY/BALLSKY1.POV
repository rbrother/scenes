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

light_source { <5,5,0> color rgb<0.5,0.5,1> }
light_source { <-5,-50,0> color rgb<1,1,0.5>}

sphere { <0,0,0> 1
  pigment { gradient y 
    color_map {
      [ 0 color Red ] [ 0.5 color White ] [ 1.0 color Yellow ]
    }
    translate -0.5*y
    scale 2
  }
  scale 100000
}

#declare ball_finish = finish {
  ambient 0.1 diffuse 0.7 phong 1.0 phong_size 100
  reflection 0.5
}

#include "balls.inc"
