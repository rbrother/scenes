#include "colors.inc"

camera {
  location < 0 10 -25 >
  direction < 0 0 2 >   // Kameran "linssinpituus"
  up < 0 1 0 >
  right <1.333 0 0 >
  look_at < 0 7 0 >
}

object {
  light_source { < 10 30 -20 > color White }
}

object {
  light_source { < 0 50 0 > color White }
}

object {
  sphere { < 0 0 0 > 5000 }
  texture {
    ambient 1
    diffuse 0
    gradient < 0 1 0 > 1
    color_map {
      [ 0 0.05 color red 1 green 1 blue 1 color red 0 green 0 blue 0.7]
      [ 0.05 0.3 color red 0 green 0 blue 0.7 color red 0 green 0 blue 0]
      [ 0.2 1 color red 0 green 0 blue 0 color red 0 green 0 blue 0]
    }
    turbulence 0.2
    scale < 5000 5000 5000 >
  }
}

object {
  plane { < 0 1 0 > 0 }
  texture {
    color red 0.4 green 0.3 blue 1.0
    ambient 0.3
    diffuse 0.8
    brilliance 1.7
    phong 1
    phong_size 150    
    wrinkles 1.0
    scale < 3 3 3 >
  }
}

object {
  union {
    sphere { < 0 0 0 > 5 }     // Big sphere
    sphere { < 0 0 4.5 > 1.5 }   // small ones attached to it
    sphere { < 0 0 -4.5 > 1.5 }
    sphere { < 0 4.5 0 > 1.5 }
    sphere { < 0 -4.5 0 > 1.5 }
    sphere { < 4.5 0 0 > 1.5 }
    sphere { < -4.5 0 0 > 1.5 }
    sphere { < 3.18 3.18 0 > 1.5 }
    sphere { < 3.18 -3.18 0 > 1.5 }
    sphere { < -3.18 3.18 0 > 1.5 }
    sphere { < -3.18 -3.18 0 > 1.5 }
    sphere { < 0 3.18 3.18 > 1.5 }
    sphere { < 0 3.18 -3.18 > 1.5 }
    sphere { < 0 -3.18 3.18 > 1.5 }
    sphere { < 0 -3.18 -3.18 > 1.5 }
    sphere { < 3.18 0 3.18 > 1.5 }
    sphere { < 3.18 0 -3.18 > 1.5 }
    sphere { < -3.18 0 3.18 > 1.5 }
    sphere { < -3.18 0 -3.18 > 1.5 }
  }
  bounded_by {
    sphere { < 0 0 0 > 6.0 }
  }
  rotate < 7 15 23 >
  texture {
    color red 1 green 0.3 blue 0
    ambient 0.2
    diffuse 0.8
    brilliance 2
    reflection 0.5       // Lis„„ heijastusta kun kuva valmis!
    phong 1
    phong_size 150
  }
  translate < 0 7 15 >
}
