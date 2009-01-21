/*  Robot. POV-object By Robert Brotherus 1994

*/

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

#declare Head_Rotation = 0   // Horisontal tilt of head. 0 = forward
#declare Left_Hand_Tilt1 = -70  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 60  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 20  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 20  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 15  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -15  // Tilt of joint in knee
#declare Left_Foot_Tilt3 = 0  // Tilt of joint in knee
#declare Right_Foot_Tilt1 = -5  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -25  // Tilt of joint in knee
#declare Right_Foot_Tilt3 = 15  // Tilt of joint in knee

camera {
  location < 0, 2, -40 >
  right < 1.42, 0, 0 >
  up < 0, 1, 0 >
  direction < 0, 0, 1.5 >
  look_at < 0, 10, 0 >
}

light_source { < -20, 20, -30 > color rgb<1,1,1> }
light_source { < 50, 20, -20 > color rgb<1,0.5,0.5> }
light_source { < 0, 5, -40 > color rgb<0.4,0.4,0.2> }

plane { y, 0
  texture { T_Stone22 scale 3 }
  finish { reflection 0.5 }
}

sphere { < 0,0,0 > 1.0
  pigment { granite
    color_map {
      [ 0 color Black ] [ 1 color rgb<1,0.2,0> ]
    }
    scale 0.4
  }
  finish {
    ambient 1
    diffuse 0
  }
  scale 1000.0
}

#declare Head_part1 = box { < -0.07, 0, -1.3 >, < 0.07, 2, -1.05 > }

#declare Head_part2 =
  box { < -1.1, 0, 0 >, < 1.1, 1, 0.15 > rotate x*20 }

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
  cylinder { < 0.8, 1.5, 0.3 >, < 0.8, 3.8, 0.6 >, 0.15 }
  cylinder { < -0.8, 1.5, 0.3 >, < -0.8, 3.8, 0.6 >, 0.15 }
  cone { < 0, -1.5, 0 >, 0.8 < 0, 1, 0 >, 0.6 }
  union {
    sphere { < -0.4, 2, -0.75 >, 0.3 }
    sphere { < 0.4, 2, -0.75 >, 0.3 }
    texture {
      pigment { color red 0.8 }
      finish { specular 1 roughness 0.02 reflection 0.4 metallic }
    }
  }
  bounded_by { box { < -1, -1, -1.2 >, < 1, 3.8, 1 > } }
}

#declare Torso = union {
  difference {
    box { < -1.5, 0, -1.2 >, < 1.5, 6, 1.2 > }
    plane { -y, 1 rotate -55*x translate y*8.2 }
    plane { -y, 1 rotate 55*x translate y*9.2 }
    plane { y, 1 rotate 80*x translate z*-1.6 }
    plane { y, 1 rotate -80*x translate z*1.6 }
  }
  // Add some more details to the torso? Button panels?
}

#declare Hand_Width = 1.5

#declare Hand_End = union {
  cylinder { < -Hand_Width/2-0.01, 0, 0 >, < Hand_Width/2+0.01, 0, 0 >, 0.5 }
  box { < -Hand_Width/2+0.1, 0, -0.2 >, < Hand_Width/2-0.1, 4, 0.2 > }
  box { < -0.2, 0, -0.4 >, < 0.2, 4, 0.4 > }
  difference {
    cylinder { < -Hand_Width/2-0.01, 4, 0 >, < Hand_Width/2+0.01, 4, 0 >, 0.5
      texture { Chrome_Texture }
    }
    cylinder { < Hand_Width/2-0.1, 4, 0 >, < Hand_Width/2+0.1, 4, 0 >, 0.4 }
  }
  translate -4*y
}

#declare Hand_Upper = union {
  difference {
    union {
      difference {
	box { < -Hand_Width/2, 0, -0.8 >, < Hand_Width/2-0.1, 4, 0.8 > }
	plane { z, 0 rotate -7*x translate -0.4*z }
	plane { -z, 0 rotate 7*x translate 0.4*z }
      }
      cylinder { < -Hand_Width/2-0.01, 4, 0 >, < Hand_Width/2+0.01, 4, 0 >, 0.9
	texture { Chrome_Texture }
      }
    }
    cylinder { < Hand_Width/2-0.2, 4, 0 >, < Hand_Width/2+0.1, 4, 0 >, 0.6 }
  }
}

#declare Left_Hand = union {
  object { Hand_Upper }
  object { Hand_End rotate Left_Hand_Tilt2*x }
  translate -4*y
}

#declare Right_Hand = union {
  object { Hand_Upper rotate y*180 }
  object { Hand_End rotate y*180 rotate Right_Hand_Tilt2*x }
  translate -4*y
}

#declare Foot_Width = 2

#declare Foot_End = union {
  cylinder { < -Foot_Width/2-0.01, 0, 0 >, < Foot_Width/2+0.01, 0, 0 >, 0.5 }
  box { < -Foot_Width/2+0.1, 0, -0.2 >, < Foot_Width/2-0.1, 4, 0.2 > }
  box { < -0.5, 0, -0.5 >, < 0.5, 4, 0.5 > }
  difference {
    cylinder { < -Foot_Width/2-0.01, 4, 0 >, < Foot_Width/2+0.01, 4, 0 >, 0.5 }
    cylinder { < Foot_Width/2-0.1, 4, 0 >, < Foot_Width/2+0.1, 4, 0 >, 0.4 }
    texture { Chrome_Texture }
  }
  translate -4*y
}

#declare Foot_box1 =
  box { < 0.5, -0.1, -1.5 >, < Foot_Width/2+0.1, 0.1, 1.5 >
  rotate 30*z
}

#declare Foot_Upper = union {
  difference {
    union {
      difference {
	box { < -Foot_Width/2, 0, -1.2 >, < Foot_Width/2-0.1, 4, 1.2 > }
	plane { z, 0 rotate -7*x translate -0.4*z }
	plane { -z, 0 rotate 7*x translate 0.4*z }
	object { Foot_box1 translate 0.5*y }
	object { Foot_box1 translate 1.0*y }
	object { Foot_box1 translate 1.5*y }
	object { Foot_box1 translate 2.0*y }
      }
      cylinder { < -Foot_Width/2+0.01, 4, 0 >, < Foot_Width/2+0.01, 4, 0 >, 0.9
	texture { Chrome_Texture }
      }
    }
    cylinder { < Foot_Width/2-0.2, 4, 0 >, < Foot_Width/2+0.1, 4, 0 >, 0.6 }
  }
}

#declare Foot_box2 =
  box { < -Foot_Width/2+0.1, -0.15, -0.6 >, < Foot_Width/2-0.1, 0.15, -2.5 > }

#declare Left_Foot = union {
  object { Foot_Upper }
  union {
    object { Foot_End }
    object { Foot_box2
      rotate Left_Foot_Tilt3*x
      translate -4*y
    }
    rotate Left_Foot_Tilt2*x
  }
  translate -4*y
}

#declare Right_Foot = union {
  object { Foot_Upper rotate y*180 }
  union {
    object { Foot_End rotate 180*y }
    object { Foot_box2
      rotate Right_Foot_Tilt3*x
      translate -4*y
    }
    rotate Left_Foot_Tilt2*x
  }
  translate -4*y
}

#declare Robot = union {
  object { Head translate y*10 rotate y*Head_Rotation translate z*0.2 }
  object { Torso translate y*3}
  object { Left_Hand
    rotate Left_Hand_Tilt1*x
    translate < Hand_Width/2+1.5, 8, 0 >
  }
  object { Right_Hand
    rotate Right_Hand_Tilt1*x
    translate < -Hand_Width/2-1.5, 8, 0 >
  }
  object { Left_Foot
    rotate Left_Foot_Tilt1*x
    translate < Foot_Width/2, 3, 0 >
  }
  object { Right_Foot
    rotate Right_Foot_Tilt1*x
    translate < -Foot_Width/2, 3, 0 >
  }
  texture { Gold_Metal }
  translate 5.2*y
  // Bounding shape speeds rendering 4 fold...!
  bounded_by { box { < -8, 0, -8 >, < 8, 22, 8 > } }
}

#declare RobotLine = union {
object { Robot translate -20*x }
object { Robot translate -10*x }
object { Robot translate 0*x }
object { Robot translate 10*x }
object { Robot translate 20*x }
}

#declare RobotField = union {
object { RobotLine translate -20*z }
object { RobotLine translate -10*z }
object { RobotLine translate 0*z }
object { RobotLine translate 10*z }
object { RobotLine translate 20*z }
object { RobotLine translate 30*z }
}

object { RobotField rotate -50*y translate <0,0,20> }
