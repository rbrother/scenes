// Complex sine-shape

#include "colors.inc"

#declare FStr = 4.0;
#declare FRad = 10.0;

#include "helix2.inc"

#max_trace_level 5

camera {
  location < 0, 0, 0 >
  direction < 0, 0, 1.5 >
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 0, 5 >
}

light_source { <-200,200,400> color rgb<0.8,0.8,0> }
light_source { <60,0,200> color rgb<0.4,0.4,0.8> }

sphere { <0,0,0> 1
  texture {
    pigment { gradient y 
      color_map {
        [ 0 color Blue ] [ 0.5 color Black ] [ 1.0 color White ]
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
  rotate <50,30,0>
  translate <-20,-18,350>
  pigment { leopard 
    color_map {
      [ 0.0 color rgb<1,0.3,0.1> ] [ 0.35 color rgb<0.8,0,0> ]
      [ 0.4 color Black ] [ 1.0 color Black ]
    }
    scale 3
    rotate <70,-50,20>
  }
  finish { 
    ambient 0 diffuse 0.5 reflection 0.5 
    phong 1 phong_size 45
  }
}

#declare cylinder1 =
cylinder { <0,-1000,0>, <0,1000,0>, 100 } 

union {
  object { cylinder1 translate x*120 }
  object { cylinder1 translate x*(-120) }
  object { cylinder1 translate x*360 } 
  object { cylinder1 translate x*(-360) }
  translate z*1000
  pigment { gradient y color_map { 
    [ 0 color Red ] [ 0.5 color Black ] [ 1.0 color Red ]
  } scale 30 }
  finish { ambient 0 diffuse 0.2 reflection 0.8 }
}
