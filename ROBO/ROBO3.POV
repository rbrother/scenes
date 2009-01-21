/*  Robot. POV-object By Robert Brotherus 1994

*/

#include "colors.inc"
#include "textures.inc"
#include "chess.inc"   // Chessboard with pieces...

#include "robo_gen.inc"
#declare Head_Rotation = 0   // Horisontal tilt of head. 0 = forward
#declare Robot_Rotation = 0  // Horisontal tilt of robot. 0 = -z
#declare Left_Hand_Tilt1 = -40  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 30  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 15  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 20  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 15  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -20  // Tilt of joint in knee
#declare Left_Foot_Tilt3 = 0  // Tilt of joint in knee
#declare Right_Foot_Tilt1 = -15  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -25  // Tilt of joint in knee
#declare Right_Foot_Tilt3 = 15  // Tilt of joint in knee
#declare Robot_Texture = texture { pigment { color White }}
#include "robot.inc"

#declare camera1 = camera {   // Camera for A3 Laser print
  location < -2, 5, -15 >
  right < 1.333, 0, 0 >
  up < 0, 1, 0 >
  direction < 0, 0, 1.52 >
  look_at < -1.2, 3, 0 >
}

#declare camera2 = camera {
  location < 0, 20, -5 >
  right < 1.333, 0, 0 >
  up < 0, 1, 0 >
  direction < 0, 0, 1.5 >
  look_at < -0.5, 3 0 >
}

camera { camera1 }

light_source { < 30, 30, -10 > color Gray80 }
light_source { < -20, 10, 0 > color Gray80 }
light_source { < 0, 5000, 0 > color red 0.5 green 0.5 blue 0.8 } // sky

sphere { < 0, 0, 0 >, 1
texture {
 pigment {
   gradient y
   color_map {
     [ 0 color White ] [ 0.3 color Blue ]
     [ 0.6 color blue 0.3 ] [ 1.0 color blue 0.2 ]
   }
 }
 finish { diffuse 0 ambient 1.0 }
}
texture {
  pigment {
    leopard
    color_map {
      [ 0.0 0.4 color Clear color Clear ]
      [ 0.7 color green 0.5 blue 1 ] [ 1.0 color White ]
    }
    scale 0.03
    translate < 0.3, 0.3, 0.3 >
  }
}
scale 10000
}

// Mountains in the background
height_field {
 gif "plasma1.gif"
 smooth // This looks great!
 texture {
   pigment {
     gradient y
     color_map { [ 0 color rgb< 0.6, 0.8, 0.3 > ]
       [ 0.1 color Gray50 ] [0.4 color Gray70]
       [ 0.4 1.0 color White color red 0.85 green 0.9 blue 1 ] }
     turbulence 0.3
     scale < 0.05, 1.5, 0.05 >
     translate 0.1*y
   }
   finish {
     ambient 0.1
     diffuse 0.9
     crand 0.4
   }
 }
 translate -0.5*x
 scale < 200, 25, 200 >
 scale 2
 translate < -30, -12, 200 >
}

plane { y, 0
  pigment {
    leopard
    color_map {
      [ 0 color Gray20 ] [ 1 color red 1 ]
    }
  }
  finish {
    metallic
    specular 1
    roughness 0.02
    reflection 0.3
  }
  rotate y*15
}

#declare Robot_Texture1 =
texture {
  pigment { granite
    color_map { [ 0 color rgb<1,0.2,0> ] [ 0.4 color Red ]
       [ 1.0 color Black ] }
    scale 0.20
  }
  finish {
    diffuse 0.8 ambient 0.1 reflection 0.4
    brilliance 2.0
    metallic
    specular 1
    roughness 0.02
  }
}

#declare Robot_Texture2 = texture {
  Robot_Texture1
  pigment {
    color_map { [ 0 color blue 1 ] [ 1 color blue 0.5 ] }
  }
}

union {
  object { Robot
    texture { Robot_Texture1 }
    translate 6*z
  }
  object { Robot
    texture { Robot_Texture2 }
    rotate 180*y translate -6*z
  }
  object { Chessboard
    scale 0.04
    translate 2.2*y
  }
  rotate -130*y
}
