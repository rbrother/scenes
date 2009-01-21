// Complex sine-shape

#include "colors.inc"

#declare FlowerStrength = 8.0;
#include "flower.inc"

#max_trace_level 5

camera {
  location < 0, 0, 0 >
  direction < 0, 0, 1.3 >
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 0, 5 >
}

light_source { <200,0,50> color White }
light_source { <0,100,0> color rgb<1.0,0.5,0.5> }

sphere { <0,0,0> 1
  texture {
  pigment { gradient y
    color_map { [ 0 color Black ] [ 0.15 color Black ] 
      [ 0.5 color rgb<0,0.3,1> ] [ 0.85 color White ] [ 1 color White ] }
    translate -0.5*y scale 2
  }
  finish { ambient 1 diffuse 0 }
  }
  texture {
  pigment { leopard
    color_map { [ 0 color Clear ] [ 0.27 color Clear ] 
      [ 0.30 color rgbf<0,0,1,1> ]
      [0.36 color rgb<0,0.3,1> ] [ 1.0 color rgb<1,1,0.5> ] }
    scale 0.2
  }
  finish { ambient 1 diffuse 0 }
  }
  scale 100000
}

object { Flower 
  rotate < 60,120,170 >
  translate z*225
  pigment { color rgb<1,0,0> }
  finish { ambient 0 diffuse 0.4 phong 1 phong_size 50 reflection 0.6 }
  normal { bumps 0.15 scale 1 } 
}

