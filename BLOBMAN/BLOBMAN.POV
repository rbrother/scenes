/*  Robot. POV-object By Robert Brotherus 1994
*/

#version 3

#include "colors.inc"
#include "textures.inc"

global_settings {
  max_trace_level 8
}

#declare camera1 = camera { 
  location < 0, 4.5, -12 >
  right < 3/4, 0, 0 >
  up < 0, 1, 0 >
  direction < 0, 0, 1.5 >
  look_at < 0, 3.5, 0 >
}

camera { camera1 }

light_source { < 20, 20, -10 > color rgb<0.8,0.6,0.6> }
light_source { < -20, 10, -5 > color rgb<0.6,0.8,0.6> }
light_source { < 0, 1000, 0 > color red 0.5 green 0.5 blue 0.8 } // sky

sky_sphere { 
 pigment {
   gradient y
   color_map {
     [ 0 color Black ] [ 0.2 color rgb<0.8,0.4,0.6> ]
     [ 0.5 color red 0.5 ] [ 1.0 color rgb<1,0.5,0> ]
   }
   turbulence 0.3
 }
 pigment { Clouds scale 0.02 scale <4,1,4> }
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
      [ 0 color rgb<0.5,0.2,1> ] [ 1 color red 1 ]
    }
  }
  finish {
    metallic
    specular 1
    roughness 0.02
    reflection 0.3
  }
  normal {
    dents 0.1
    scale 5
  }
  rotate y*15
}

#declare RubyPlane1 = plane {
  < 0, -1, 0 > 0
  rotate < 0, 0, 35 >
  translate < 0.2, -0.2, 0 >
}

#declare RubyPlane2 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 45 >
  translate < 0.2, 0.7, 0 >
  rotate < 0, 30, 0 >
}

#declare RubyPlane3 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 75 >
  translate < -0.4, 0, 0 >
}

#declare Ruby = intersection {
  plane { < 0, -1, 0 > 0 translate < 0, -0.2, 0 > }
  object { RubyPlane1 rotate < 0, 0, 0 > }
  object { RubyPlane1 rotate < 0, 60, 0 > }
  object { RubyPlane1 rotate < 0, 120, 0 > }
  object { RubyPlane1 rotate < 0, 180, 0 > }
  object { RubyPlane1 rotate < 0, 240, 0 > }
  object { RubyPlane1 rotate < 0, 300, 0 > }
  object { RubyPlane2 rotate < 0, 0, 0 > }
  object { RubyPlane2 rotate < 0, 60, 0 > }
  object { RubyPlane2 rotate < 0, 120, 0 > }
  object { RubyPlane2 rotate < 0, 180, 0 > }
  object { RubyPlane2 rotate < 0, 240, 0 > }
  object { RubyPlane2 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 0, 0 > }
  object { RubyPlane3 rotate < 0, 30, 0 > }
  object { RubyPlane3 rotate < 0, 60, 0 > }
  object { RubyPlane3 rotate < 0, 90, 0 > }
  object { RubyPlane3 rotate < 0, 120, 0 > }
  object { RubyPlane3 rotate < 0, 150, 0 > }
  object { RubyPlane3 rotate < 0, 180, 0 > }
  object { RubyPlane3 rotate < 0, 210, 0 > }
  object { RubyPlane3 rotate < 0, 240, 0 > }
  object { RubyPlane3 rotate < 0, 270, 0 > }
  object { RubyPlane3 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 330, 0 > }
  pigment { transmit 1 }
  finish {
    refraction 1
    reflection 0
    diffuse 0 ambient 0
    ior 1.8
    phong 1
    phong_size 100
  }
  halo {
    attenuating
    box_mapping constant
    colour_map { [ 0 color rgbt <1,0.3,0.1,0.6> ]
                 [ 1 color rgbt <1,0.3,0.1,0.6> ] }
    samples 20
    aa_level 5
    aa_threshold 0.1
    jitter 0.8
  }
  hollow
  bounded_by { sphere { < 0, 0, 0 > 1 } }
  scale 6
}


#declare blobbylefthand = blob {
  threshold 2
  component 4,4, <-3,5,0>
  component 3,4, <-4.5,2,2>
  component 3,4, <-6,-1,4>
  component 2.5,3, <-3,-2,6>
  component 2.5,2, <-1,-2.5,7>
  component 2.5,3, <0,-3,8>
}

#declare blobbyrighthand = blob {
  threshold 2
  component 4,4, <3,5,0>
  component 3,4, <4.5,4.5,2>
  component 3,4, <6,4,4>
  component 2.5,3, <3,4.5,6>
  component 2.5,2, <1,5,7>
  component 2.5,3, <0,5.5,8>
}

#declare blobbymain = difference {
  blob {
  threshold 2
  // P„„
  component 5,4, <0,12,0>
  component 3,3, <0,10,0>
  component 4,2, <0,8,0>
  component 5,2, <0,7,0>
  // Torso
  component 5,4, <-3,5,0> component 5,4, <3,5,0> component 5,4, <0,3,0>
  component 5,5, <-2,2,0> component 5,5, <2,2,0> component 5,4, <0,0,0>
  component 5,4, <-2,-2,0> component 5,4, <2,-2,0> component 5,4, <0,-4,0>
  component 5,4, <-2,-5,0> component 5,4, <2,-5,0>
  // Jalat
  component 4,3, <-2.5,-8,0> component 4,3, <2.5,-8,0>
  component 4,3, <-2.5,-10.5,0> component 4,3, <2.5,-10.5,0>
  component 5,3, <-2.5,-13,0> component 5,3, <2.5,-13,0>
  component 4,3, <-2.5,-16.5,0> component 4,3, <2.5,-16.5,0>
  component 4,3, <-2.5,-20,0> component 4,3, <2.5,-20,0>
  // Oikea jalkater„
  component 3.5,2.5, <-2.5,-20,2>
  component 3,2.0, <-3.5,-20,3.5> component 3,2.0, <-1.5,-20,3.5>
  component 3,2.0, <-2.5,-20,5>
  // Vasen jalkater„
  component 3.5,2.5, <2.5,-20,2>
  component 3,2.0, <3.5,-20,3.5> component 3,2.0, <1.5,-20,3.5>
  component 3,2.0, <2.5,-20,5>
  }
  plane { y,-20.5 }
}

#declare blobbyeye = sphere { <0,12.0,1.7>, 0.7
  pigment { Black }
  finish { phong 1 phong_size 50 }
}

#declare blobbyman = union {
  object { blobbymain }
  object { blobbylefthand }
  object { blobbyrighthand }
  object { blobbyeye translate 0.9*x }
  object { blobbyeye translate -0.9*x }
  cylinder { <0,-20.5,8>, <0,15,8>, 0.5 finish { Mirror } }
  object { Ruby translate <0,16,8> }
  pigment {
    onion
    color_map {
      [ 0 color rgb<1.0,0.5,0.5> ] [ 0.4 color rgb<1,0,0> ]
      [ 0.5 color White ] [ 0.9 color White ]
      [ 1.0 color rgb<0.5,0,0> ]
    }
    turbulence 0.2
    scale 6
    translate y*20
  }
  finish { diffuse 0.6 ambient 0 reflection 0.3
    phong 1 phong_size 50 brilliance 0.8 }
  translate y*20.5
  scale 0.17
}

object { blobbyman
  rotate y*155
  translate x*-1.5
}

object { blobbyman
  pigment {
    onion
    color_map {
      [ 0 color rgb<0,0,0> ] [ 0.4 color rgb<1,1,0> ]
      [ 1.0 color rgb<0,0,0> ]
    }
    turbulence 0.2
    scale 1
    translate y*10
  }
  rotate y*205
  translate x*1.5
}


