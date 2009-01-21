/* Robot. Include-file for toys. Include this for every robot in the scene
after defining following values:

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
#declare  Robot_Texture = texture { }

*/

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
  texture { Robot_Texture }
  translate 5.2*y
  // Bounding shape speeds rendering 4 fold...!
  bounded_by { box { < -8, 0, -8 >, < 8, 22, 8 > } }
  scale 0.8
}

