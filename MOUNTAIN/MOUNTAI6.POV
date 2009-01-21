#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

#declare FinalCamera = camera {
  location < -135, 7, -125 >
  direction < 0, 0, 1.4 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 0, 0 >
}

camera { FinalCamera }

light_source { < -150, 50, 150 > color rgb<1,0.5,0.3> }

light_source { < -150, 200, -100 > color White }

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
  hollow
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
  hollow
}

height_field {
 gif "mount.ghf"
 smooth // This looks great!
 texture {
   pigment {
     gradient y
     color_map { [ 0 color rgb< 0, 0.3, 0 > ]
       [ 0.5 color rgb< 0.3, 0.6, 0.2 > ] [ 1 color Gray70 ] }
     turbulence 0.2
   }
   normal {
     waves 0.3
     frequency 15
     scale <0.1,1,0.1>
     scale 0.1
   }
   finish {
     ambient 0.1
     diffuse 0.8
     crand 0.2
   }
 }
 translate <-0.5,-0.60,-0.5>
 scale < 300, 30, 300 >
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
    reflection 0.7
    ambient 0.0
    diffuse 0.0
  }
  rotate < 0, 20, 0 >
}

#declare RBStrength = 0.5;

disc { < 0, 0, 0 >, < 0, 1, 0 >,1.1,0.75   // Rainbow!
  pigment {
    wood
    color_map {
      [ 0,0.7 color Clear color Clear ]
      [ 0.74 color rgbf<1,RBStrength,RBStrength,0.8> ]
      [ 0.78 color rgbf<1,1,RBStrength,0.8> ]
      [ 0.82 color rgbf<RBStrength,1,RBStrength,0.8> ]
      [ 0.86 color rgbf<RBStrength,1,1,0.8> ]
      [ 0.90 color rgbf<RBStrength,RBStrength,1,0.8> ]
      [ 0.94 color rgbf<1,RBStrength,1,0.8> ]
      [ 0.98 1.00 color Clear color Clear]
    }
    rotate < 90, 0, 0 >
    scale 0.5
  }
  finish { diffuse 0 ambient 1 }
  scale 300
  rotate < 90, 0, 0 >
  translate < 150, -100, 300 >
}

