#include "colors.inc"
#include "stones.inc"
#include "metals.inc"

// (taivaalla outo planeetta JA avaruusalus!)

global_settings { max_trace_level 7 }

camera {
  location  < -20, 5, -170 >
  direction < 0, 0, 1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < 0, 45, 40>
}

light_source {
  <0,200,0>
  color White*1.0
//  area_light 100*x, 100*z, 20, 20
//  adaptive 1
//  spotlight
//  radius 15
//  falloff 20
//  point_at <0,0,50>
}

#declare ScaleFactor = 100000

#declare LandText = texture {
  pigment {
    crackle
    color_map {
      [ 0 Black ] [ 0.1 White ] [ 0.3 White ] [ 0.4 Black ] [ 0.6 Red ]
    }
    scale 5
    scale 1 / ScaleFactor
  }
  finish { ambient 0 diffuse 0.9 brilliance 5 }
}

plane { y, 0             // The Land
  texture {
    wood rotate 90*x
    texture_map {
      [ 0 LandText ]
      [ 0.01 LandText ]
      [ 0.02 finish { ambient 0 diffuse 0 reflection 1 } ]
    }
  }
  scale ScaleFactor
  hollow
}

#declare RedSky = pigment {
  granite
  color_map {
    [ 0 color Black ] [ 0.2 Black ] [ 0.8 color rgb<1,0.2,0> ]
    [ 1 color Yellow ]
  }
  scale 0.6
}

sky_sphere {
  pigment {
    gradient y
    pigment_map {
     [ 0 RedSky ]
     [ 0.2 RedSky ]
     [ 1 White]
    }
  }
}

#declare Head_part1 = box { < -0.07, 0, -1.3 >, < 0.07, 2, -1.05 > }

#declare Head_part2 =
  box { < -1.1, 0, 0 >, < 1.1, 1, 0.15 > rotate x*20 }

#declare EyeSphere = sphere { 0 0.3
  pigment {
    wood
    color_map {
      [ 0 color Red ] [ 0.5 color Black ] [ 1 color Black ]
    }
  }
  finish { ambient 1 diffuse 0 }
}

#declare Head = union {
  intersection {
    difference {
      box { < -1, 0, -1.2 >, < 1, 3, 1 > }
      plane { -y, 1 rotate -70*x translate y*7.2 }
      plane { y, 1 rotate 20*x translate y*-1.2 }
      plane { -y, 1 rotate 45*x translate y*4.8 }
      object { Head_part1 }
      object { Head_part1 translate x*0.3}
      object { Head_part1 translate x*-0.3}
      object { Head_part1 translate x*0.6}
      object { Head_part1 translate x*-0.6}
      object { Head_part2 }
      object { Head_part2 translate z*0.3 }
      object { Head_part2 translate z*-0.3 }
      object { Head_part2 translate z*-0.6 }
    }
    cylinder { < -4.5, 0.7, -1.5 >, < -4.5, 0.7, 1.5 >, 5.5 }
    cylinder { < 4.5, 0.7, -1.5 >, < 4.5, 0.7, 1.5 >, 5.5 }
  }
  cylinder { < 0.8, 0.2, 0.3 >, < 0.8, 3.8, 0.6 >, 0.15 }
  cylinder { < -0.8, 0.2, 0.3 >, < -0.8, 3.8, 0.6 >, 0.15 }
  union {
    object { EyeSphere translate -0.4*x }
    object { EyeSphere translate 0.4*x }
    translate < 0, 2, -0.75 >
  }
  scale 7
}

#declare stick = union {
  cylinder { <0,0,0>, <0,50,0>, 20 }
  #declare a = 0
  #while (a<16)
    cone {
      <20,50,0>,  0.0,
      <20,0,0>, 10
      rotate y*(a*360/16)
    }
    #declare a = a+1
  #end
  difference {
    sphere { <0,0,0>, 20 }
    union {
      #declare a = 0
      #while (a<32)
      cylinder { <0,0,-23>, <0,44,0>, 1.3
      rotate y*(a*360/32)
      }
      #declare a = a+1
      #end
    }
    translate 50*y
  }
  object { Head translate <0,70,0> }
  pigment { color rgb<1,0.8,0> }
  finish { ambient 0.1 diffuse 0.3 reflection 0.6 metallic phong 0.7 }
}

object { stick translate <0,-10,0> }
object { stick rotate 20*y translate <-60,-10,0> }
object { stick rotate -20*y translate <60,-10,0> }
object { stick rotate 10*y translate <-30,-30,-50> }
object { stick rotate -10*y translate <30,-30,-50> }
object { stick translate <0,-50,-90>}
