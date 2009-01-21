/* OVAKO.POV - Jousia yms. */

#include "colors.inc"

camera {
  location <1.5,3.0,-5.5>
  direction <0,0,1.5>
  right <1.333,0,0>
  look_at <1,1.6,0>
}

light_source { <5,10,-5> color rgb<0.2,0.8,1>
  spotlight
  point_at <1.0,0,0>
  radius 20
  falloff 30
  tightness 10
}

light_source { <0,20,0> color rgb<1,1,0.8>
  spotlight
  point_at <0,0,0>
  radius 25
  falloff 35
  tightness 10
}

sphere { <0,0,0> 1
  pigment { gradient y
    color_map {
      [ 0 color Black ] [ 0.35 color rgb<0,0,1> ] [ 1.0 color White ]
    }
  }
  finish { ambient 0.7 diffuse 0 }
  scale 10000
}

#declare Metalli =  texture {
  pigment { color White }
  normal { bumps 0.20 scale 0.015 }
  finish { reflection 0.5 diffuse 0.5 phong 1 metallic }
}

#declare Metalli2 =  texture {
  pigment { color White }
  finish { reflection 0.5 diffuse 0.5 phong 1 metallic }
}

plane { y,0
  pigment { hexagon
    color White color Gray80 color Gray60 }
  finish { diffuse 0.3 ambient 0 reflection 0.7 metallic phong 1 }
  scale 0.5 rotate y*45
}

#declare Palkki1 = difference {
  box { <-1,-0.15,0>, <1,0.15,10> }
  plane { y,0 rotate z*45 translate 1.08*x }
  plane { -y,0 rotate z*-45 translate 1.08*x }
  plane { -y,0 rotate z*45 translate -1.08*x }
  plane { y,0 rotate z*-45 translate -1.08*x }
  bounded_by { box { <-1.01,-0.16,-0.01>, <1.01,0.16,10.1> } }
  translate y*0.15
}

#declare Palkki2 = difference {
  object { Palkki1 }
  plane { y,0 rotate x*25 translate z*1.0 }
}

#declare JousiHolkki = difference {
  cylinder { <-1,0,0>, <1,0,0>, 1 }
  cylinder { <-1.01,0,0>, <1.01,0,0>, 0.5 }
  torus { 0.75 0.12 scale <1,0.2,1> rotate z*90 translate 1.0*x }
  torus { 0.75 0.12 scale <1,0.2,1> rotate z*90 translate -1.0*x }
  texture { Metalli2 }
}

#declare Jousi1 = union {
  intersection {
    difference {
      cylinder { <-1,0,0>, <1,0,0>, 0.8 }
      cylinder { <-1.01,0,0>, <1.01,0,0>, 0.5 }
      box { <-1.01,-0.8,0>, <1.01,-0.40,1.0> }
      cone { <0,0,0>, 0, <2,0,0>, 2 translate x*0.43 }
      cone { <0,0,0>, 0, <-2,0,0>, 2 translate x*-0.43 }
    }
    cone { <-2,0,0>, 4, <2,0,0>, 0 translate -0.27*x }
    cone { <-2,0,0>, 0, <2,0,0>, 4 translate 0.27*x }
    translate y*-0.2
  }
  object { JousiHolkki scale <0.85,0.5,0.5> translate <0,-0.2,0> }
  object { Palkki1 translate -1.0*y }
  object { Palkki2 translate <0,-1.3,0.5> }
  object { Palkki2 translate <0,-1.6,1.5> }
  object { Palkki2 translate <0,-1.9,2.5> }
  difference {
    box { <-1.1,-2.0,3.7>, <1.1,-0.6,4.3> }
    box { <-1.0,-1.9,3.69>, <1.0,-0.7,4.31> }
  }
  cylinder { <0,-0.6,4.0>, <0,-0.45,4.0>,0.2 }
  translate y*1.0
  bounded_by { box { <-1.1,-1.0,-1.0>, <1.1,2.0,10.0> } }
  texture { Metalli }
}

#declare Holkki = difference {
  union {
    cone { <0,0,0>, 0.3, <0,0,1.0>, 0.15 }
    cylinder { <-0.2,0,1.0>, <0.2,0,1.0>, 0.4 }
  }
  cylinder { <-0.4,0,1.0>, <0.4,0,1.0>, 0.3 }
}

#declare Vakaaja = union {
  cylinder { <-2.6,0,0>, <2.6,0,0>, 0.3 }
  cylinder { <-3.4,0,0.8>, <-3.4,0,3.2>, 0.3 }
  cylinder { <3.4,0,0.8>, <3.4,0,3.2>, 0.3 }
  intersection {
    torus { 0.8 0.3 } box { <-2,-2,-2>, <0,2,0> }
    translate <-2.6,0,0.8>
  }
  intersection {
    torus { 0.8 0.3 } box { <0,-2,-2>, <2,2,0> }
    translate <2.6,0,0.8>
  }
  object { Holkki translate <-3.4,0,3.2> }
  object { Holkki translate <3.4,0,3.2> }
  texture { Metalli2 }
  bounded_by { box { <-4.6,-0.5,-0.4>, <4.6,0.5,4.7> } }
}

object { Vakaaja
  rotate x*20 rotate y*212
  translate <1.5,1.8,5.0>
}

object { Jousi1 rotate y*60 translate <-0.5,1,1.0>  }

