/*  Robot. POV-object By Robert Brotherus 1994

*/

#include "colors.inc"
#include "textures.inc"

#declare Head_Rotation = 0   // Horisontal tilt of head. 0 = forward
#declare Robot_Rotation = 50  // Horisontal tilt of robot. 0 = -z
#declare Left_Hand_Tilt1 = -70  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 60  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 20  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 20  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 15  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -15  // Tilt of joint in knee
#declare Right_Foot_Tilt1 = -5  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -25  // Tilt of joint in knee


camera {
  location < 0, 20, -40 >
  right < 1.333, 0, 0 >
  up < 0, 1, 0 >
  direction < 0, 0, 1.5 >
  look_at < 0, 10, 0 >
}

light_source { < 10, 20, -20 > color Gray80 }
light_source { < -10, 20, -20 > color Gray80 }

sphere { < 0, 0, 0 >, 1
texture {
 Blue_Sky
 finish { diffuse 0 ambient 1.0 }
 scale 0.1
}
scale 10000
}

plane { y, 0
  texture {
    checker color red 1 color red 0.8 blue 0.3
    finish { ambient 0.4 diffuse 0.8 }
    scale 3 rotate y*20
  }
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
  cylinder { < -Hand_Width/2, 0, 0 >, < Hand_Width/2, 0, 0 >, 0.5 }
  box { < -Hand_Width/2+0.1, 0, -0.2 >, < Hand_Width/2-0.1, 4, 0.2 > }
  box { < -0.2, 0, -0.4 >, < 0.2, 4, 0.4 > }
  difference {
    cylinder { < -Hand_Width/2, 4, 0 >, < Hand_Width/2, 4, 0 >, 0.5
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
      cylinder { < -Hand_Width/2, 4, 0 >, < Hand_Width/2, 4, 0 >, 0.9
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
  object { Hand_Upper }
  object { Hand_End rotate Right_Hand_Tilt2*x }
  translate -4*y
}

#declare Foot_Width = 2

#declare Foot_End = union {
  cylinder { < -Foot_Width/2, 0, 0 >, < Foot_Width/2, 0, 0 >, 0.5 }
  box { < -Foot_Width/2, -0.2, -3 >, < Foot_Width/2, 0.2, 0 > rotate -10*x }
  box { < -Foot_Width/2+0.1, 0, -0.2 >, < Foot_Width/2-0.1, 4, 0.2 > }
  box { < -0.5, 0, -0.6 >, < 0.5, 4, 0.6 > }
  difference {
    cylinder { < -Foot_Width/2, 4, 0 >, < Foot_Width/2, 4, 0 >, 0.5
      texture { Chrome_Texture }
    }
    cylinder { < Foot_Width/2-0.1, 4, 0 >, < Foot_Width/2+0.1, 4, 0 >, 0.4 }
  }
  translate -4*y
}

#declare Foot_Upper = union {
  difference {
    union {
      difference {
	box { < -Foot_Width/2, 0, -1.2 >, < Foot_Width/2-0.1, 4, 1.2 > }
	plane { z, 0 rotate -7*x translate -0.4*z }
	plane { -z, 0 rotate 7*x translate 0.4*z }
      }
      cylinder { < -Foot_Width/2, 4, 0 >, < Foot_Width/2, 4, 0 >, 0.9
	texture { Chrome_Texture }
      }
    }
    cylinder { < Foot_Width/2-0.2, 4, 0 >, < Foot_Width/2+0.1, 4, 0 >, 0.6 }
  }
}

#declare Left_Foot = union {
  object { Foot_Upper }
  object { Foot_End rotate Left_Foot_Tilt2*x }
  translate -4*y
}

#declare Right_Foot = union {
  object { Foot_Upper }
  object { Foot_End rotate Right_Foot_Tilt2*x }
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
  translate 6*y
}

object { Robot scale 1 rotate y*Robot_Rotation }