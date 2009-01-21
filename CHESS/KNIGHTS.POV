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
  right     4/3*x            // which way is +right <X Y Z> and aspect ratio
  look_at   <0.0, 0.0,  0.0> // point center of view at this point <X Y Z>
}

sky_sphere {
  pigment {
    gradient y
    color_map { [ 0 color Black ] [ 0.75 color Blue ] [ 1 color White ] }
  }
}

light_source {
  < 20, 20, 0 > color White
}

#declare ChessTile1 = texture {
  T_Stone6
  finish { ambient 0.2 diffuse 0.6 reflection 0.2 }
}

#declare ChessTile2 = texture {
  T_Stone15
  finish { ambient 0.2 diffuse 0.6 reflection 0.2 }
}

#declare Board = plane { y, 0
  texture {
  checker
    texture { ChessTile1 }
    texture { ChessTile2 }
  }
  scale 1.0
}

#declare WWood = texture {
   pigment {
      wood
      turbulence 0.1
      colour_map {
         [ 0.0  color rgb<0.7,0.4,0> ]
         [ 0.25 color rgb<0.7,0.4,0> ]
         [ 0.50 color rgb<0.95,0.62,0> ]
         [ 1.0  color rgb<0.95,0.62,0> ]
      }
      scale <0.6, 1000.0, 0.6>
      translate <200.0, 0.0, 100.0>
   }
   finish {
      specular 1
      roughness 0.02
   }
}

#declare WPawn = object {
   Pawn
   texture { WWood }
}

//  *************** THE SCENE  **********************

object { Board }

#declare R1 = seed(1)
#declare R2 = seed(80)
#declare xx = 1
#while (xx<12)
  #declare yy = 1
  #while (yy<12)
    #if (rand(R2)>0.5)
    object { WPawn scale 0.15
      rotate y*rand(R1)*180
      translate <(xx-8)+0.5,0,(yy-5)+0.5>
    }
    #end
  #declare yy = yy + 1
  #end
#declare xx = xx + 1
#end


