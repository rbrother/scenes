// Ze RooM...

#include "colors.inc"

#max_trace_level 20

camera {
  location < 40, -20, -70 >
  direction < 0, 0, 1.5 >
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, -30, 0 >
}

light_source { <-20,20,70> color rgb<0.8,0.6,0.6> }
light_source { <-40,-40,-50> color rgb<0.8,0.8,0.6> }

box { <-100,-50,-100>, <100,50,100>
  pigment { color White }
  finish { reflection 0.9 ambient 0 diffuse 0 brilliance 3.0 }
}

box { <-100,-50,-100>, <100,-49.9,100> // FLOOR
  pigment { checker color White color rgb<1,0.7,0.7> scale 20 }
  finish { reflection 0.8 ambient 0.1 diffuse 0.2 brilliance 1.0 }
} 

sphere { <-40,-30,40>, 20
  pigment { color Red }
  finish { diffuse 0.7 ambient 0.1 brilliance 1.0 phong 1 
  reflection 0.4 }
}
