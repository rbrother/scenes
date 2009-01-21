// Versiota 2.0 varten
// Lasinen pallo, johon kiinnitettyn„ pikkupalloja tikun p„„ss„

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "stones.inc"

camera {
  location < 0, 20, -50 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 11, 0 >
}

object {
  light_source { < -10, 30, -10 > color White }
}

object {
  plane { < 0, 0, -1 > 0 }       // Takasein„
  texture { Stone12 scale < 3 3 3 > }
  translate < 0, 0, 30 >
  rotate < 0, -25, 0 >
}

object {
  plane { < 0, 1, 0 > 0 } // Lattia
  texture {
    pigment {
      color red 1 green 0.5 blue 0 
    }
    normal {
      bumps 1
      scale < 1, 1, 1 >
    }
    finish {
      ambient 0.2
      diffuse 1
      phong 1
      phong_size 150
    }
  }
}

object {
  sphere { < 0, 0, 0 > 100 }
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map {
        [ 0 1 color red 1 green 0 blue 0 color red 1 green 1 blue 0 ]
      }
      scale < 100, 100, 100 >
    }
    finish {
      diffuse 0
      ambient 1
    }
  }
}

#declare Stick =
object { 
  merge { 
    sphere { < 5, 0, 0 > 2 }
    intersection {
      object { Cylinder_X }
      plane { < -1, 0, 0 > 0 }
      plane { < 1, 0, 0 > 5 }
    }
  }
  translate < 4, 0, 0 > 
}

object {
  merge {
    sphere { < 0, 0, 0 > 5 }     // Big sphere
    object { Stick rotate < 0, 0, 0 > }
    object { Stick rotate < 0, 90, 0 > }
    object { Stick rotate < 0, 180, 0 > }
    object { Stick rotate < 0, 270, 0 > }
    object { Stick rotate < 0, 0, 90 > }
    object { Stick rotate < 0, 0, -90 > }

    object { Stick rotate < 0, 45, 0 > }
    object { Stick rotate < 0, 135, 0 > }
    object { Stick rotate < 0, 225, 0 > }
    object { Stick rotate < 0, 315, 0 > }
    
    object { Stick rotate < 0, 0, 45 > }
    object { Stick rotate < 0, 0, 135 > }
    object { Stick rotate < 0, 0, 225 > }
    object { Stick rotate < 0, 0, 315 > }

    object { Stick rotate < 0, 90, 0 > rotate < 45, 0, 0 > }
    object { Stick rotate < 0, 90, 0 > rotate < 135, 0, 0 > }
    object { Stick rotate < 0, 90, 0 > rotate < 225, 0, 0 > }
    object { Stick rotate < 0, 90, 0 > rotate < 315, 0, 0 > }
  }
  bounded_by {
    sphere { < 0, 0, 0 > 11.0 }
  }
  rotate < -20, 20, 0 >
  texture { Glass }
  translate < 0 11 0 >
}
