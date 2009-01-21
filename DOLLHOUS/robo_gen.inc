/* Robot-general. Include-file for toys */

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

#declare Torso = 
  difference {
    box { < -1.5, 0, -1.2 >, < 1.5, 6, 1.2 > }
    plane { -y, 1 rotate -55*x translate y*8.2 }
    plane { -y, 1 rotate 55*x translate y*9.2 }
    plane { y, 1 rotate 80*x translate z*-1.6 }
    plane { y, 1 rotate -80*x translate z*1.6 }
  }
  // Add more details to Torso

#declare Hand_Width = 1.5;

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

#declare Hand_Upper =
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

#declare Foot_Upper =
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

#declare Foot_box2 =
  box { < -Foot_Width/2+0.1, -0.15, -0.6 >, < Foot_Width/2-0.1, 0.15, -2.5 > }


