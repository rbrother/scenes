#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "stones.inc"
#include "teapot.inc"

#declare FinalCamera = camera {
  location < 0, 1, -50 >
  direction < 0, 0, 1.4 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 1, 0 >
}

camera { FinalCamera }

light_source { < 200, 70, -50 > color rgb< 1.0, 0.3, 0.3 > }

light_source { < 0, 500, 0 > color Gray90 }

light_source { < -5, 1, -50 > color Gray70 }

sphere {    // Stars and sunset
  < 0, 0, 0 > 1
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map {
	[ 0.0 color red 1.0 green 0.5 ]
	[ 0.2 color red 0.8 ] [ 0.4,1.0 color Black color blue 0.4 ]
      }
      turbulence 0.2
    }
    finish { diffuse 0 ambient 1 }
  }
  texture {  // Stars
    pigment {
      granite
      color_map {
	[ 0, 0.80 color Clear color Clear ] [ 0.80, 1.0 color White color White]
      }
    }
    finish { diffuse 0 ambient 1 }
    scale 0.04
  }
  scale 10000
}

#declare TheCone = cone {
  <0,0,0>, 1, <0,2,0>, 0
  scale 10
}

#declare DoubleCone = union {
  object { TheCone }
  object { TheCone rotate x*180 }
  pigment { gradient y
   color_map { [ 0 color Black ] [ 0.5 color White ] [ 1.0 color Black ] }
   turbulence 0.2
   scale 1.0
  }
  finish { ambient 0.1 diffuse 0.7 reflection 0.4 phong 1 }
}

union {
  object {
    DoubleCone
    rotate <50,80,20>
    translate -75*x
  }
  object {
    DoubleCone
    rotate <70,100,30>
    translate -50*x
  }
  object {
    DoubleCone
    rotate <90,120,30>
    translate -25*x
  }
  object {
    DoubleCone
    rotate <110,130,40>
    translate 0*x
  }
  object {
    DoubleCone
    rotate <130,150,50>
    translate 25*x
  }
  object {
    DoubleCone
    rotate <150,170,60>
    translate 50*x
  }
  object {
    DoubleCone
    rotate <170,190,70>
    translate 75*x
  }
translate <0,40,100>
rotate z*10
}

height_field {
 gif "plasma1.gif"
 smooth // This looks great!
 translate -0.5*x
 scale < 200, 25, 320 >
 texture { T_Stone14 scale 7 }
 texture {
   pigment {
     gradient y
     color_map { [ 0 color Clear ] [ 0.4 color Clear ]
       [ 0.55 color White ] [ 1.0 color White ] }
     turbulence 0.2
     scale 25
   }
   finish {
     ambient 0.1
     diffuse 0.9
     crand 0.3
   }
 }
 translate < -20, -2, 0 >
}

plane { < 0, 1, 0 > 0    // The lake
  pigment { color Black }
  normal {
    waves 0.01
    frequency 500
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

#declare Tower =
union {   // Tower in the water
  cylinder {
    < 0, 0, 0 > , < 0, 0.2, 0 > , 0.8 open
    texture {
      pigment { color Red }
      normal { bumps 0.4 scale 0.05 }
      finish {
	ambient 0.2
	diffuse 0.8
	phong 1
      }
    }
  }
  disc { < 0, 0.2, 0 >, < 0, 1, 0 >, 0.8
    texture {
      Yellow_Pine
      scale 0.8
      rotate < 0, 5, 0 >
    }
  }
  torus { 0.8, 0.06
    texture {
      Yellow_Pine
      rotate < 0, 95, 0 >
    }
    translate < 0, 0.2, 0 >
  }
  bounded_by { box { < -1, 0, -1>, < 1, 2, 1> } }
}

union {
  object { Tower }
  object { Teapot
    texture { Silver2 }
    rotate < -90, 0, 0 >
    rotate < 0, 135, 0 >
    scale 0.30
    translate < 0, 0.18, 0 >
  }
  translate < 1.1, 0, -45.5 >
}

union {
  object { Tower }
  object { Teapot
    texture { Polished_Brass }
    rotate < -90, 0, 0 >
    rotate < 0, 20, 0 >
    scale 0.30
    translate < 0, 0.18, 0 >
  }
  translate < -1.2, 0, -44.5 >
}
