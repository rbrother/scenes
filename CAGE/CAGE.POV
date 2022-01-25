#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "shapes.inc"

global_settings {
  max_trace_level 3    // Some speed-up...
}

fog{
  color Black
  distance 30
}

camera {
  location < 3, 2, 5 >
  direction < 0, 0, 1.0 >
  right     x*image_width/image_height
  up < 0,1,0 >
  rotate z*-25
  look_at < 7, 8, 10 >
}

light_source { < 15.1, 5.1, 5.1 > color rgb<0.8,0.8,0.5> }
light_source { < 5.1, 15.1, 5.1 > color rgb<0.8,0.5,0.5> }
light_source { < 5.1, 5.1, 15.1 > color rgb<0.8,0.8,0.8> }
light_source { < 3.1, 2.1, 5.1 > color Gray40 }

#declare pillar = object {
  Cylinder_Z
  scale 0.7
  texture {
    material_map {
      gif "pattern.gif" map_type 2  // y-axiz cylinder
      texture { T_Stone13
        finish { reflection 0.5 }
        scale 0.5
      }
      texture { T_Stone21
        finish { reflection 0.5 }
        scale 0.5
      }
    }
    rotate x*90
    scale <2,2,1.2>
  }
}

#declare Row = union {
  object { pillar translate x*-0 }
  object { pillar translate x*-30 }
  object { pillar translate x*-20 }
  object { pillar translate x*-10 }
  object { pillar translate x*10 }
  object { pillar translate x*20 }
  object { pillar translate x*30 }
  object { pillar translate x*40 }
  object { pillar translate x*50 }
  object { pillar translate x*60 }
  object { pillar translate x*70 }
}

#declare Rows = union {
  object { Row translate y*-0 }
  object { Row translate y*-30 }
  object { Row translate y*-20 }
  object { Row translate y*-10 }
  object { Row translate y*10 }
  object { Row translate y*20 }
  object { Row translate y*30 }
  object { Row translate y*40 }
  object { Row translate y*50 }
  object { Row translate y*60 }
}

#declare Cage = union {
  object { Rows }
  object { Rows rotate y*90 }
  object { Rows rotate x*90 }
  translate <30,30,30>
}

object { Cage }
