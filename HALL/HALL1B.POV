#include "colors.inc"
#include "shapes.inc"
#include "stones.inc"

camera {
  location <0,2,-40>
  up <0,1,0>
  right     x*image_width/image_height
  direction <0,0,1.5>
  look_at <0,10,0>
}

light_source { <0,2,-50> color rgb<0.7,0.7,1> }
light_source { <0,20,10> color rgb<1,0.5,0> }

#declare MyStone = texture { T_Stone13 }

#declare pillar1 =  cylinder { 
  <0,-0.001,0>, <0,1.001,0>, 0.3
  translate x*2
}

#declare pillar2 = difference {
  cylinder { <0,0,0>, <0,1,0>, 2 }
  object { pillar1 rotate y*0 }
  object { pillar1 rotate y*30 }
  object { pillar1 rotate y*60 }
  object { pillar1 rotate y*90 }
  object { pillar1 rotate y*120 }
  object { pillar1 rotate y*150 }
  object { pillar1 rotate y*180 }
  object { pillar1 rotate y*210 }
  object { pillar1 rotate y*240 }
  object { pillar1 rotate y*270 }
  object { pillar1 rotate y*300 }
  object { pillar1 rotate y*330 }
  scale <1,20,1>
}

#declare pillar3 = union {
  object { pillar2 }
  // alapaa
  intersection {
    object { Hyperboloid_Y 
      scale <1.7,1.5,1.7>
      translate 2.5*y
    }
    plane { -y,0 }
    plane { y,2.5 }
  }
  torus { 2.5, 0.6 translate 0.3*y }
  // ylapaa
  intersection {
    object { Hyperboloid_Y 
      scale <1.7,1.5,1.7>
      translate 16.5*y
    }
    plane { -y,-16.5 }
    plane { y,18.5 }
  }
  torus { 2.5, 0.6 translate 18.5*y }
  cone { <0,18.5,0>, 2.7, <0,20.0,0>, 3.2 }
  bounded_by { box { <-4,0,-4>,<4,20,4> } }
}

#declare pillar = union {
  object { pillar3 }
  texture { MyStone }
}

#declare ring = difference {
  cylinder { <0,0,0>, <0,0,0.32>, 1 }
  cylinder { <0,0,-0.001>, <0,0,1.001>, 0.75 }
  plane { y,0 }
  translate -0.16*z
  scale <5,3.5,5>
  scale 2.74
  texture { MyStone }
  translate y*20
}

plane { y,0 
  texture {
    tiles {
      texture {
        T_Stone13
        finish { reflection 0.3 }
      }
    tile2
      texture {
        T_Stone14
        finish { reflection 0.3 }
      }
    }
    scale 2
  }
}

box { <-16,-1,-50>, <16,40,70> 
  pigment { color White }
  finish { reflection 0.6 ambient 0 diffuse 0.5 }
}

union {
  object { pillar translate <-12,0,-12> }
  object { pillar translate <12,0,-12> }
  object { pillar translate <-12,0,12> }
  object { pillar translate <12,0,12> }
  object { pillar translate <-12,0,36> }
  object { pillar translate <12,0,36> }
  object { pillar translate <-12,0,60> }
  object { pillar translate <12,0,60> }
  object { ring translate <0,0,-12> }
  object { ring translate <0,0,12> }
  object { ring translate <0,0,36> }
  object { ring translate <0,0,60> }
  object { ring rotate y*90 translate <-12,0,0> }
  object { ring rotate y*90 translate <12,0,0> }
  object { ring rotate y*90 translate <-12,0,24> }
  object { ring rotate y*90 translate <12,0,24> }
  object { ring rotate y*90 translate <-12,0,48> }
  object { ring rotate y*90 translate <12,0,48> }
}
