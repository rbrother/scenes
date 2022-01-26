// Complex sine-shape            
#version 3.7

#include "colors.inc"

#declare FStr = 4.0;
#declare FRad = 10.0;

#include "helix.inc"

global_settings {
    assumed_gamma 2.0
    max_trace_level 5      
}

camera {
  location < 0, 0, 0 >
  direction < 0, 0, 1.8 >
  up < 0, 1, 0 >
  right     x*image_width/image_height
  look_at < 0, 0, 5 >
}

light_source { <-200,200,400> color rgb<0.8,0.8,0> }
light_source { <60,0,200> color rgb<0.4,0.4,0.8> }

sphere { <0,0,0> 1
  texture {
    pigment { gradient y 
      color_map {
        [ 0 color Red ] [ 0.5 color Black ] [ 1.0 color White ]
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
  rotate < 45,30,0 >
  translate <-20,20,350>
  pigment { color Red }
  finish { 
    ambient 0 diffuse 0.5 reflection 0.5 
    phong 1 phong_size 45
  }
}


