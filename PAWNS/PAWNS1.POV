#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "stones.inc"

//
//   Lights, Camera ...
//
camera {
   location  < 0, 10, -17 >
   direction < 0,0,1.3>
   up        <0.0,  1.0,  0.0>
   right     <1.42, 0.0, 0.0>
   look_at   <0, 5, 0>
}

light_source { <100.0,  300.0,  200> color rgb<1,0.7,0.7> }

light_source { <-300,  100,  100> color rgb<0.7,0.7,1> }

light_source { <5, 3, -17> color rgb<0.6,0.6,0.6> }


#declare Gold_Texture = texture {
  pigment { color rgb<1,1,0>}
  finish { reflection 0.4 ambient 0 diffuse 0.3
    brilliance 20 metallic
    phong 1 phong_size 120
  }
}

//
//   Yellow pine, close grained
//
#declare Yellow_Pine = texture {
pigment {
   wood
   turbulence 0.02
   color_map {
      [0.000 0.222   color red  0.808  green  0.671  blue  0.251  filter 0.000
      color red  0.808  green  0.671  blue  0.251  filter 0.000]
      [0.222 0.342   color red  0.808  green  0.671  blue  0.251  filter 0.000
      color red  0.600  green  0.349  blue  0.043  filter 0.000]
      [0.342 0.393   color red  0.600  green  0.349  blue  0.043  filter 0.000
      color red  0.808  green  0.671  blue  0.251  filter 0.000]
      [0.393 0.709   color red  0.808  green  0.671  blue  0.251  filter 0.000
      color red  0.808  green  0.671  blue  0.251  filter 0.000]
      [0.709 0.821   color red  0.808  green  0.671  blue  0.251  filter 0.000
      color red  0.533  green  0.298  blue  0.027  filter 0.000]
      [0.821 1.001   color red  0.533  green  0.298  blue  0.027  filter 0.000
      color red  0.808  green  0.671  blue  0.251  filter 0.000]
   }
   scale <0.1 0.1 0.1>
   translate <10 0 0>
}
}

texture {
pigment {
   wood
   turbulence 0.01
   color_map {
      [0.000 0.120   color red  1.000  green  1.000  blue  1.000  filter 1.000
      color red  0.702  green  0.412  blue  0.118  filter 0.608]
      [0.120 0.231   color red  0.702  green  0.412  blue  0.118  filter 0.608
      color red  0.702  green  0.467  blue  0.118  filter 0.608]
      [0.231 0.496   color red  0.702  green  0.467  blue  0.118  filter 0.608
      color red  1.000  green  1.000  blue  1.000  filter 1.000]
      [0.496 0.701   color red  1.000  green  1.000  blue  1.000  filter 1.000
      color red  1.000  green  1.000  blue  1.000  filter 1.000]
      [0.701 0.829   color red  1.000  green  1.000  blue  1.000  filter 1.000
      color red  0.702  green  0.467  blue  0.118  filter 0.608]
      [0.829 1.001   color red  0.702  green  0.467  blue  0.118  filter 0.608
      color red  1.000  green  1.000  blue  1.000  filter 1.000]
   }
   scale <0.5 0.5 0.5>
   translate <10 0 0>
}
}



// Floor
object {
   plane { < 0 1 0 > 0 }
   texture {
     pigment {
       wood
       color_map {
         [0.0 color rgb<0,0,0.2>] [ 0.5 color rgb<1,0.5,0.5> ]
         [1.0 color rgb<0,0,0.2> ]
       }
     }
     finish {
     reflection 0.6
     diffuse 0
     ambient 0.7
     }
     scale < 25 25 25 >
     rotate < 90 0 0 >
     translate < 0 0 15 >
     }
}

object {
   sphere { < 0 0 0 > 1000 }
   texture {
     pigment {
     gradient < 0 1 0 >
     color_map {
       [0 0.2 color red 1 green 0.6 blue 0 color red 1 green 0 blue 0 ]
       [0.2 0.5 color red 1 green 0 blue 0 color red 0 green 0 blue 0 ]
       [0.5 1 color red 0 green 0 blue 0 color red 0 green 0 blue 0 ]
     }
     }
     finish { ambient 1 diffuse 0 }
     scale < 1000 1000 1000 >
   }
}

#declare Knight = union {
   sphere { <0, 7, 0>, 1.5 }

   sphere { <0, 0, 0>, 1
      scale <1.2, 0.3, 1.2>
      translate 5.5*y
   }

   intersection {
      plane { y, 5.5 }
      object {
         Hyperboloid_Y
         translate 5*y
         scale <0.5, 1, 0.5>
      }
      plane { -y, -2.5 }
   }

   sphere { <0, 0, 0>, 1
      scale <2, 0.5, 2>
      translate <0, 2.3, 0>
   }

   intersection {
      sphere { <0, 0, 0>, 2.5 }
      plane { -y, 0 }
   }
}

// Pawn 1
object {
   Knight
   texture {
      Yellow_Pine
      finish { phong 0.8 diffuse 1.1 ambient 0.3 }
      scale 5
      rotate < 0 45 0 >
   }
   rotate y*170
   translate <0 0 0>
}

// Pawn 2
object {
   Knight
   texture { Gold_Texture }
   rotate y*160
   translate <6 0 6>
}

// Pawn 3
object {
   Knight
   texture { Gold_Texture }
   rotate y*200
   translate <-6 0 6>
}

// Pawn 4
object {
   Knight
   texture { PinkAlabaster }
   rotate y*150
   translate <12 0 12>
}

// Pawn 5
object {
   Knight
   texture { PinkAlabaster }
   rotate y*210
   translate <-12 0 12>
}

