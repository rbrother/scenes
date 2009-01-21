// Complex sine-shape

#include "colors.inc"

#declare FStr = 4.0
#declare FRad = 10.0

#include "helix.inc"

#max_trace_level 5

camera {
  location < 0, 0, 0 >
  direction < 0, 0, 1.5 >
  up < 0, 1, 0 >
  right <2, 0, 0 >
  look_at < -4, 0, 5 >
}

light_source { <-200,200,400> color rgb<0.8,0.8,0> }
light_source { <60,0,200> color rgb<0.4,0.4,0.8> }

sphere { <0,0,0> 1
  texture {
    pigment { gradient y 
      color_map {
        [ 0 color rgb<1,1,0.6> ] [ 0.50 color White ]
        [ 0.50 color White ] [ 1.0 color rgb<0.6,0.6,1> ] 
      }
      translate -0.5*y
      scale 2
    }
    finish { diffuse 0 ambient 1.0 }
  }
  scale 100000
}

#declare ball_finish = finish {
  ambient 0.0 diffuse 0.7 phong 1.0 phong_size 100
  reflection 0.0
}

object { Flower
  scale 0.5
  rotate < 45,30,0 >
  translate <-150,20,350>
  pigment { color White }
  finish { 
    ambient 0.2 diffuse 0.7 reflection 0.5 
    phong 1 phong_size 25
  }
}


