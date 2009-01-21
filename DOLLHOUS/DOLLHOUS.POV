/*******************************************
  Dollhouse, by Robert Brotherus 1995
  Scene for the "Toys" competition.
********************************************/

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "shapes.inc"
#include "robo_gen.inc"

// 1 unit = 1 cm

light_source { <0,220,-150> color Gray80 } // Light in the room

camera {
  up < 0, 1, 0 >
  right < 1.333, 0, 0>
  direction < 0, 0, 1.9 >
  location < 45, 90, -50 >
  look_at < 5,77,-5 >
}

box { < -200,0,-200 > < 200, 250, 200 >   // The room
  texture { T_Stone14 scale 20 }
}

#declare Head_Rotation = 0   // Horisontal tilt of head. 0 = forward
#declare Left_Hand_Tilt1 = 30  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 55  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 35  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 50  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 90  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -70  // Tilt of joint in knee
#declare Left_Foot_Tilt3 = -20  // Tilt of joint in foot
#declare Right_Foot_Tilt1 = 85  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -65  // Tilt of joint in knee
#declare Right_Foot_Tilt3 = -20  // Tilt of joint in foot
#declare Robot_Texture =
texture {
  pigment { color rgb<1,0,0> }
  finish { reflection 0.3 ambient 0 diffuse 0.4
    phong 1 phong_size 50 metallic
  }
}
#include "robot.inc"
#declare SittingRobot = object { Robot }

#declare Head_Rotation = 0   // Horisontal tilt of head. 0 = forward
#declare Left_Hand_Tilt1 = 0  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 0  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 0  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 0  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 20  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -20  // Tilt of joint in knee
#declare Left_Foot_Tilt3 = -24  // Tilt of joint in foot
#declare Right_Foot_Tilt1 = 18  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -22  // Tilt of joint in knee
#declare Right_Foot_Tilt3 = -20  // Tilt of joint in foot
#include "robot.inc"
#declare Robot2 = object { Robot }

#declare Hand = union {
  union {
    cylinder { <0,-10,0>, <0,5,0>, 2 }
    sphere { <0,5,0>, 3.5 scale <1,1,0.6 > }
    cone { <0,5,0>, 1.2, <-4,10,0>, 1 } sphere { <-4,10,0>, 1.2 }
    cone { <0,5,0>, 1.2, <-1,10,-1>, 1 } sphere { < -1,10,-1>, 1.2 }
    cone { <0,5,0>, 1.2, <2,10,-1>, 1 } sphere { < 2,10,-1>, 1.2 }
    cone { <0,5,0>, 1.2, <3,7,3>, 1 } sphere { <3,7,3>, 1.2 }
    cone { <-4,10,0>, 0.8, <-1,14,3>, 0.5 }
    cone { <-1,10,-1>, 0.8, <0.5,14,2>, 0.5 }
    cone { <2,10,-1>, 0.8, <2,14,2>, 0.5 }
    cone { <3,7,3>, 0.8, <3,13,3>, 0.5 }
    rotate x*90
    rotate y*90
  }
  object { SittingRobot rotate y*-90 rotate z*-20 translate <9,-14,0> }
  texture { Gold_Metal }
  rotate z*-8
  rotate y*-65
}

#declare ChairPart1 = cylinder { < 1.2,0,1.2 >, < 1.0, 3.5, 1.0>, 0.3 }

#declare Chair = union {
  object { ChairPart1 rotate y*0 }
  object { ChairPart1 rotate y*90 }
  object { ChairPart1 rotate y*180 }
  object { ChairPart1 rotate y*270 }
  cylinder { < 0,3.4,0>, <0,3.6,0>, 1.9 }
  texture { T_Stone14 }
  translate y*1
}

#declare TablePart1 =
  box { < -10, 0, -30 > < 10, 2, 30 > translate 70*y
  texture { Yellow_Pine rotate x*5 scale 10 translate y*5 }
}

#declare Table = union {
  object { TablePart1 translate x*40 }
  object { TablePart1 translate x*20 }
  object { TablePart1 translate x*0 }
  object { TablePart1 translate -20*x }
}

#declare DollTable = union {
  box { < -65, 0, -50 > < 65, 4, 50 > translate 50*y  texture { Glass3 } }
  sphere { <0,79,0>, 25 texture { Glass3 } }
  cylinder { < -40, 0, -20 > < -40, 50, -20 >, 6.5 }
  cylinder { < 40, 0, -20 > < 40, 50, -20 >, 6.5 }
  cylinder { < -40, 0, 20 > < -40, 50, 20 >, 6.5 }
  cylinder { < 40, 0, 20 > < 40, 50, 20 >, 6.5 }
  cylinder { < 40, 25, -20> < -40, 25, -20 >, 4 }
  cylinder { < -40, 25, -20> < -40, 25, 20 >, 4 }
  cylinder { < -40, 25, 20> < 40, 25, 20 >, 4 }
  cylinder { < 40, 25, 20> < 40, 25, -20 >, 4 }
  texture {
    pigment { color Red }
    finish { phong 1 ambient 0 diffuse 0.3 reflection 0.7 }
  }
  scale 0.09
}

#declare CylWidth1 = 1.0

#declare RedLamp = union {
  light_source { < 0,0,0 > color rgb<1,0.7,0.7> }
  sphere { <0,0,0>, 1.5
    pigment {
      granite
      color_map {
        [ 0 color rgbf<1,0.7,0.7,0.5> ]
        [ 1 color rgbf<1,0.7,0.7,1> ]
      }
      scale 1.0
    }
    finish { diffuse 0.5 ambient 0.5 }
  }
  scale 0.001
}

#declare BlueLamp = union {
  light_source { < 0,0,0 > color rgb<0.7,0.7,1.0> }
  sphere { <0,0,0>, 1.5
    pigment {
      granite
      color_map {
        [ 0 color rgbf<1,1,0.7,0.5> ]
        [ 1 color rgbf<1,1,0.7,1> ]
      }
      scale 1.0
    }
    finish { diffuse 0.5 ambient 0.5 }
  }
  scale 0.001
}

#declare Painting2 = union {
  object { Plane_XY
    pigment {
      image_map {
        tga "fract2.tga"
        once
      }
      scale <3.2,2.56,1>
    }
    finish { diffuse 0 ambient 1 }
  }
  difference {
    box { <-0.2,-0.2,-0.2>, <3.4,2.76,0.2> }
    box { < 0,0,-0.5>, <3.2,2.56,0.5> }
    texture { Gold_Texture }
  }
  translate <-1.6,-1.2,0>
  scale 2.7
}

#declare Matto = object {
  Plane_XY
    pigment {
      image_map {
        tga "matto.tga"
        once
      }
      scale <5,8,1>
    }
    finish { diffuse 0.5 ambient 0.5 }
  translate <-2.5,-4,0>
  rotate x*90
  rotate y*90
  scale 2.5
}

#declare TheDollHouse = union {
  difference {
    box { < 0,0,0 >, < 60, 40, 30 > }
    box { < 1,1,-1>,< 25, 19, 29 > }
    box { < 26,1,-1>,< 61, 19, 29 > }
    box { < 1,20,-1>,< 19, 39, 29 > }
    box { < 20,20,-1>,< 39, 39, 29 > }
    box { < 40,20,-1>,< 59, 39, 29 > }
    box { < 24.9,1.3,12 >,< 26.1,16,19> }
  }
  box { < 1,1,1 >, < 59,1.1,29 >  // Floor
    texture { Brass_Texture }
  }
  box { < 1,18.95,0 >, < 59,19.0,29 >  // Ceiling
    pigment { gradient x
      color_map {
        [ 0 color White ] [ 0.5 color White]
        [ 0.5 color rgb<1.0,0.7,0.7> ] [ 1.0 color rgb<1.0,0.7,0.7> ]
      }
      scale 4
    }
    finish { ambient 0.5 diffuse 0.3 }
  }
  union {
    cylinder { < 25.5, 1, 12 >, < 25.5, 16, 12 >, CylWidth1 }
    cylinder { < 25.5, 1, 19 >, < 25.5, 16, 19 >, CylWidth1 }
    cylinder { < 25.5, 16, 12 >, < 25.5, 16, 19 >, CylWidth1 }
    sphere { < 25.5, 16, 12 >, CylWidth1 }
    sphere { < 25.5, 16, 19 >, CylWidth1 }
    cylinder { < 25.5, 1, 12 >, < 25.5, 1, 0.01 >, CylWidth1 }
    cylinder { < 25.5, 1, 19 >, < 25.5, 1, 29 >, CylWidth1 }
    cylinder { < 25.5, 1, 29 >, < 59, 1, 29 >, CylWidth1 }
    cylinder { < 25.5, 19, 0 >, < 25.5, 19, 29 >, CylWidth1 }
    cylinder { < 25.5, 19, 29 >, < 59, 19, 29 >, CylWidth1 }
    cylinder { < 25.5, 19, 29 >, < 25.5, 0, 29 >, CylWidth1 }
    texture { Brass_Valley scale 3 }
  }
  object { DollTable translate <45,1,12> }
  object { SittingRobot rotate y*-90 translate <35,-1.3,12> }
  object { SittingRobot rotate y*0 translate <45,-1.3,20> }
  object { Chair translate <35,0,12> }
  object { Chair translate <55,0,12> }
  object { Chair translate <45,0,4> }
  object { Chair translate <45,0,20> }
  object { Hand translate <31,16,-6> }
  object { Painting2 translate <38,12,28.9> }
  object { Matto translate <45,1.11,12> }
  object { RedLamp translate < 32, 18, 15 > }
  object { BlueLamp translate < 53, 18, 15 > }
  object { Robot2 rotate x*90 rotate y*210 translate <54,0.8,2.5> }
  light_source { < 10,18,15 > color Gray80 }
  texture { T_Stone14 scale 3 }
  translate < -30, 0, -20 >
}

#declare TableAndHouse = union {
  object { Table }
  object { TheDollHouse translate y*72 }
}

object { TableAndHouse }
