/*   Veistos   */

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "metals.inc"
#include "skies.inc"

#version 3.0

global_settings {
  assumed_gamma 2.2
  max_trace_level 10
}

camera {
  location < -1000, 200, -1300 >
  direction < 0, 0, 1.6 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 350, 0 >
}

light_source { < 200,1500,-2000 > color White }

#declare GlassWidth = 8

#declare GlassCover = merge {
  #declare kulma = 0
  #while (kulma < 359)
    box { <-300,0,-GlassWidth/2>, <300,500,GlassWidth/2>
      translate z*400
      rotate y*kulma
    }
  #declare kulma = kulma + 45
  #end
  pigment { crackle
   color_map { [ 0 color Black ] [ 0.1 color White ] [ 1.0 color White ] }
   scale 20
  }
  finish { diffuse 0.8 ambient 0.2 reflection 0.2 }
}

#declare MyBall = sphere { <0,0,0>, 35
  translate y*35
  finish { ambient 0.2 diffuse 0.5 reflection 0.3 phong 1 }
}

//************ THE SCENE ************

sky_sphere { S_Cloud2 }

plane { y, 0.1
  pigment { color White }
  finish { ambient 0 diffuse 0.6 reflection 1 }
  normal { dents 0.1 scale 50 }
}

object { GlassCover }

object { MyBall pigment {Red} translate <-580,0,-320> }
object { MyBall pigment {Orange} scale 0.8 translate <-500,0,-300> }
