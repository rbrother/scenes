// knights.pov

#include "colors.inc"
#include "stones.inc"
#include "chess.inc"

// set viewer's position in the scene
camera
{
  location  <4.0, 5.0, -6.0> // position of camera <X Y Z>
  direction 2.0*z            // which way are we looking <X Y Z> & zoom
  up        <0, 1, 0>                // which way is +up <X Y Z>
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0> // point center of view at this point <X Y Z>
}

sky_sphere {
  pigment {
    gradient y
    color_map { [ 0 color Black ] [ 0.75 color Blue ] [ 1 color White ] }
  }
}

light_source {
  < 20, 20, 0 > color Gray80
}

light_source {
  < -10, 8, -20 > color Gray80
}

/*
light_source {
  < -8, 20, -5 > color rgb<0.8,0.8,0.3>
  spotlight
  point_at <0.25,0,0.25>
  radius 3
  falloff 5
  tightness 1.0
}
*/

#declare Board = plane { y, 0
  texture {
  checker
    texture { T_Stone6 }
    texture { T_Stone15 }
  }
  scale 1.0
}

#declare WColor = color rgb<0.9,0.8,0.7>;

#declare WWood = texture {
   pigment {
      wood
      turbulence 0.1
      colour_map {
         [ 0.0  color WColor*0.9 ]
         [ 0.15 color WColor*0.9 ]
         [ 0.30 color WColor*1.1 ]
         [ 1.0  color WColor*1.1 ]
      }
      scale <0.6, 1000.0, 0.6>
      translate <200.0, 0.0, 100.0>
   }
   finish {
      ambient 0.3 diffuse 0.7
      specular 1
      roughness 0.01
   }
}

#declare RColor = color rgb<0.9,0,0>;

#declare RWood = texture {
   pigment {
      wood
      turbulence 0.1
      colour_map {
         [ 0.0  color RColor*0.9 ]
         [ 0.15 color RColor*0.9 ]
         [ 0.30 color RColor*1.1 ]
         [ 1.0  color RColor*1.1 ]
      }
      scale <0.6, 1000.0, 0.6>
      translate <200.0, 0.0, 100.0>
   }
   finish {
      ambient 0.2 diffuse 0.8
      specular 1
      roughness 0.001
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
   scale 0.20
   rotate y*180
}

//  *************** THE SCENE  **********************

object { Board }

#declare R1 = seed(1);
#declare R2 = seed(82);
#declare xx = 1;
#while (xx<12)
  #declare yy = 1;
  #while (yy<12)
    #if (rand(R2)>0.6)
    object { WPawn
      rotate y*rand(R1)*180
      translate <(xx-8)+0.5,0,(yy-5)+0.5>
    }
    #end
  #declare yy = yy + 1;
  #end
#declare xx = xx + 1;
#end

object { RKnight translate <0.25,0,0.25> }
