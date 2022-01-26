// knights.pov

// pawnit knigteiksi?

#include "colors.inc"
#include "stones.inc"
#include "chess.inc"

global_settings {
  assumed_gamma 1.0
  max_trace_level 8
}

// set viewer's position in the scene
camera
{
  location  <-0.5, 3.0, -4.0> // position of camera <X Y Z>
  direction 2.0*z            // which way are we looking <X Y Z> & zoom
  up        <0, 1, 0>                // which way is +up <X Y Z>
  right     x*image_width/image_height
  look_at   <-0.5,0.8,0.25> // point center of view at this point <X Y Z>
}

sky_sphere {
  pigment {
    gradient y
    color_map { [ 0 color White ] [ 0.5 color Blue ] [ 1 color Black ] }
  }
}

#declare c1 = rgb<1,0.9,0.6>;
#declare c2 = c1*0.65;

#declare Board = plane { y, 0
  pigment { gradient z
    color_map {
      [ 0 color c1 ] [ 0.4 color c1 ]
      [ 0.5 color c2 ] [ 0.9 color c2 ]
      [ 1.0 color c1 ]
    }
    translate z*0.5
  }
  finish { ambient 0 diffuse 0.8 reflection 0.2 }
  scale 1.0
}

light_source {
  < 20, 20, -5 > color Gray50
}

light_source {
  < 10, 30, -15 > color Gray60
  spotlight
  point_at <0,0,0>
  radius 1
  falloff 4
}

#declare WColor = color rgb<0.9,0.8,0.5>;

#declare WWood = texture {
   pigment {
      wood
      turbulence 0.1
      colour_map {
         [ 0.0  color WColor*0.8 ]
         [ 0.15 color WColor*0.8 ]
         [ 0.30 color WColor*1.1 ]
         [ 1.0  color WColor*1.1 ]
      }
      scale <0.6, 1000.0, 0.6>
      translate <200.0, 0.0, 100.0>
   }
   finish {
      ambient 0.05 diffuse 0.9 reflection 0.10
      specular 1
      roughness 0.01
   }
}

#declare RColor = color rgb<0.9,0.2,0>;

#declare RWood = texture {
  pigment {
    color rgbf<1,1,1,0.9>
  }
  finish {
    ambient 0 diffuse 0
    specular 1
    roughness 0.01
    reflection 0.2
  }               
}

#declare WPawn = object {
   Pawn
   texture { WWood }
   scale 0.15
}

#declare RKnight = object {
   Knight
   texture { RWood scale 0.8 rotate y*30 }
	  interior
	  {
	    ior 1.5
	  }   
   scale 0.20
   rotate y*180
}

//  *************** THE SCENE  **********************

object { Board }

#declare R1 = seed(1);
object { WPawn
  rotate y*rand(R1)*180
  translate <-1.5,0,1.5>
}
object { WPawn
  rotate y*rand(R1)*180
  translate <-0.6,0,2.6>
}


object { RKnight rotate y*45 }
