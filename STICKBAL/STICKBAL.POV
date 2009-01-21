// Versiota 2.0 varten

#include "colors.inc"
#include "shapes.inc"
#include "stones.inc"

camera {
  location < 0, 15, -40 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 14, 0 >
}

object {
  light_source { < -10, 20, -15 > color rgb<1,1,0> }
}

object {
  light_source { < 0, 50, 0 > color rgb<0.5,0.5,1> }
}

object {
  plane { < 0, 1, 0 > 0 }
  texture {
    pigment {
      onion
      color_map {
        [ 0 color Yellow ] [ 0.5 color Red ] [ 1 color Yellow ]
      }
      scale 5
    }
    finish {
      ambient 0.3
      diffuse 0.5
      brilliance 1.7
      reflection 0.3
    }
  }
  scale 2
  translate z*25
}

sphere { <0,0,0>,1
  pigment { gradient y
    color_map {
      [ 0 color Black ] [ 0.1 color Blue ] [ 0.3 color White ]
      [ 1.0 color Black ]
    }
  }
  finish { diffuse 0 ambient 0.7 }
  scale 1000
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

#declare stickball =
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
  texture {
    pigment {
      color red 1 green 0.3 blue 0
    }
    finish {
      ambient 0.1
      diffuse 0.65
      brilliance 2
      reflection 0.5       // Lis„„ heijastusta kun kuva valmis!
      phong 1
      phong_size 100
    }
  }
}

object { stickball translate <0,11,0> scale 0.8 }
object { stickball
  rotate < 50,10,40 >
  translate <-12,16,25>
  pigment { color rgb<1.0,0.8,0.1> }
}
object { stickball
  rotate < 120,-45,0 >
  translate <12,16,25>
  pigment { color White }
}
