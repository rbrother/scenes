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
      granite
      color_map {
	[ 0, 0.8 color Black color Black ] [ 0.85, 1.0 color White color White]
      }
    }
    finish { diffuse 0 ambient 1 }
    scale 0.01
  }
  texture {
    pigment {
      leopard
      color_map { [ 0,0.5 color Clear color Clear ]
	[ 0.7 color rgb<1,1,0.5> ] [ 1.0 color rgb<1,1,0.5> ] }
      scale 0.03
    }
    finish { diffuse 0 ambient 0.8 }
  }
  scale 10000
}

sphere { < 0, 0, 0 > 1
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map { [ 0 color rgbf<1,0.2,0.2,0.8> ]
	[ 0.4 color rgbf<1,1,0.3,0.8> ] [ 1.0 color blue 0.4 ] }
      turbulence 0.4
    }
    finish { diffuse 0 ambient 0.8 }
  }
  scale 500
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

// Planet in the sky
union {
sphere { <0.0, 0.0, 0.0>, 30.0
   pigment {
      bozo
      turbulence 0.5
      colour_map {
	 [0.0 0.7  colour red 0.0 green 0.3 blue 0.8
		   colour red 0.0 green 0.3 blue 0.8]
	 [0.7 1.0  colour red 0.0 green 0.7 blue 0.0
		   colour red 0.6 green 0.7 blue 0.0]
	 [1.0 1.01 colour red 0.6 green 0.7 blue 0.0
		   colour red 0.7 green 0.3 blue 0.3]
      }
      scale 10.0
      translate 100*x
   }
   finish {
      crand 0.08
      ambient 0.0
      diffuse 1.0
   }
}
sphere { <0.0, 0.0, 0.0>, 30.2
   pigment {
      bozo
      turbulence 1.0
      colour_map {
	 [0.0 0.4 colour red 1.0 green 1.0 blue 1.0 filter 1.0
		  colour red 1.0 green 1.0 blue 1.0 filter 1.0]
	 [0.4 0.9 colour red 1.0 green 1.0 blue 1.0 filter 1.0
		  colour red 1.0 green 1.0 blue 1.0]
	 [0.9 1.0 colour red 1.0 green 1.0 blue 1.0
		  colour red 1.0 green 1.0 blue 1.0]
      }
      scale <12.0, 3.0, 12.0>
      rotate <30.0, 0.0, -45.0>
   }
   finish {
      ambient 0.0
      diffuse 1.0
   }
}
scale 5
translate < -200, 300, 1000 >
}