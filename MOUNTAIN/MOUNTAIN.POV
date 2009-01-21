#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

#declare FinalCamera = camera {
  location < 0, 1, -50 >
  direction < 0, 0, 1.4 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 7, 0 >
}

camera { FinalCamera }

light_source { < 200, 70, -50 > color Gray70 }

light_source { < 0, 500, 0 > color Gray70 }

sphere {    // Stars and suns
  < 0, 0, 0 > 1
  texture {
    pigment {
      leopard
      color_map { [ 0,0.5 color Clear color Clear ]
	[ 0.7 color rgb<1,1,0.5> ] [ 1.0 color rgb<1,1,0.5> ] }
      scale 0.03
    }
    finish { diffuse 0 ambient 0.8 }
  }
  scale 5000
}

sphere { < 0, 0, 0 > 1
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map { [ 0 color rgb<1,0.2,0.2> ]
	[ 0.4 color rgb<1,1,0.3> ] [ 1.0 color blue 0.4 ] }
      turbulence 0.4
    }
    finish { diffuse 0 ambient 0.8 }
  }
  scale 10000
}

height_field {
 gif "plasma1.gif"
 smooth // This looks great!
 texture {
   pigment {
     granite
     color_map { [ 0 color rgb< 0, 0.3, 0 > ]
       [ 0.5 color rgb< 0, 1, 0 > ] [ 1 color rgb< 0, 0.3, 0 > ] }
     scale 0.1
     turbulence 1
   }
   finish {
     ambient 0.1
     diffuse 0.9
   }
 }
 texture {
   pigment {
     gradient < 0, 1, 0 >
     color_map { [ 0 color rgbf< 0.2, 0.6, 0, 0.8 > ]
       [ 0.1 color Gray30 ] [ 1 color White ] }
     turbulence 0.2
   }
   finish {
     ambient 0.1
     diffuse 0.9
     crand 0.3
   }
 }
 translate -0.5*x
 scale < 200, 25, 320 >
 translate < -20, -2, 0 >
}

plane { < 0, 1, 0 > 0    // The lake
  pigment { color Black }
  normal {
    waves 0.01
    frequency 150
    translate < -0.5, -0.5, -0.5 >
    scale 30
  }
  finish {
    reflection 0.6
    ambient 0.0
    diffuse 0.0
  }
  rotate < 0, 20, 0 >
}

#declare RBStrength = 0.5

disc { < 0, 0, 0 >, < 0, 1, 0 >,1.1,0.75   // Rainbow!
  pigment {
    wood
    color_map {
      [ 0,0.7 color Clear color Clear ]
      [ 0.73 color rgbf<1,RBStrength,RBStrength,0.8> ]
      [ 0.76 color rgbf<1,1,RBStrength,0.8> ]
      [ 0.79 color rgbf<RBStrength,1,RBStrength,0.8> ]
      [ 0.82 color rgbf<RBStrength,1,1,0.8> ]
      [ 0.85 color rgbf<RBStrength,RBStrength,1,0.8> ]
      [ 0.88 color rgbf<1,RBStrength,1,0.8> ]
      [ 0.91 1.00 color Clear color Clear]
    }
    rotate < 90, 0, 0 >
    scale 0.5
  }
  finish { diffuse 0 ambient 1 }
  scale 300
  rotate < 90, 0, 0 >
  translate < 150, -100, 300 >
}

