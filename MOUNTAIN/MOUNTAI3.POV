#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "stoneold.inc"

#declare FinalCamera = camera {
  location < 0, 1, -50 >
  direction < 0, 0, 1.4 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 4, 0 >
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
	[ 0.2 color red 0.8 ] [ 0.4,1.0 color Black color Black ]
      }
      turbulence 0.2
    }
    finish { diffuse 0 ambient 1 }
  }
  texture {  // Stars
    pigment {
      granite
      color_map {
	[ 0, 0.86 color Clear color Clear ] [ 0.86, 1.0 color White color White]
      }
    }
    finish { diffuse 0 ambient 1 }
    scale 0.05
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
       [ 0.5 color rgb< 0.3, 0.6, 0 > ] [ 1 color rgb< 0, 0.3, 0 > ] }
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
     color_map { [ 0 color rgbf< 0.2, 0.5, 0.2, 0.8 > ]
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
      diffuse 0.5
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
      diffuse 0.5
   }
}
scale 4
translate < -320, 250, 1000 >
}

#declare Statue_cone1 = union {
  cone { < 0, -1, 0 >, 0.1, < 0, 0, 0 >, 0.05 }
  sphere { < 0, -1, 0 >, 0.15 }
  rotate < 0, 0, 30 >
}

#declare Statue_part1 = union {
  object { Statue_cone1 rotate < 0, 0, 0 > }
  object { Statue_cone1 rotate < 0, 60, 0 > }
  object { Statue_cone1 rotate < 0, 120, 0 > }
  object { Statue_cone1 rotate < 0, 180, 0 > }
  object { Statue_cone1 rotate < 0, 240, 0 > }
  object { Statue_cone1 rotate < 0, 300, 0 > }
}

#declare Statue = union {
  object { Statue_part1 }
  object { Statue_part1 rotate < 180, 0, 0 > }
  sphere { < 0, 0, 0 >, 0.2 }
  sphere { < 0, 1.90, 0 >, 1.0 texture { Glass3 } }
  translate < 0, 1.02, 0 >
  texture { Stone13 scale 0.1 }
}

#declare Yellow_Pine = texture {
pigment {
   wood
   turbulence 0.02
   colour_map {
      [0.000 0.222   colour red  0.808  green  0.671  blue  0.251  filter  0.000
      colour red  0.808  green  0.671  blue  0.251  filter  0.000]
      [0.222 0.342   colour red  0.808  green  0.671  blue  0.251  filter  0.000
      colour red  0.600  green  0.349  blue  0.043  filter  0.000]
      [0.342 0.393   colour red  0.600  green  0.349  blue  0.043  filter  0.000
      colour red  0.808  green  0.671  blue  0.251  filter  0.000]
      [0.393 0.709   colour red  0.808  green  0.671  blue  0.251  filter  0.000
      colour red  0.808  green  0.671  blue  0.251  filter  0.000]
      [0.709 0.821   colour red  0.808  green  0.671  blue  0.251  filter  0.000
      colour red  0.533  green  0.298  blue  0.027  filter  0.000]
      [0.821 1.001   colour red  0.533  green  0.298  blue  0.027  filter  0.000
      colour red  0.808  green  0.671  blue  0.251  filter  0.000]
   }
   scale 0.1
} }
texture {  // 2nd layer of pine-texture
pigment {
   wood
   turbulence 0.01
   color_map {
      [0.000 0.120   color red  1.000  green  1.000  blue  1.000  filter  1.000
      color red  0.702  green  0.412  blue  0.118  filter  0.608]
      [0.120 0.231   color red  0.702  green  0.412  blue  0.118  filter  0.608
      color red  0.702  green  0.467  blue  0.118  filter  0.608]
      [0.231 0.496   color red  0.702  green  0.467  blue  0.118  filter  0.608
      color red  1.000  green  1.000  blue  1.000  filter  1.000]
      [0.496 0.701   color red  1.000  green  1.000  blue  1.000  filter  1.000
      color red  1.000  green  1.000  blue  1.000  filter  1.000]
      [0.701 0.829   color red  1.000  green  1.000  blue  1.000  filter  1.000
      color red  0.702  green  0.467  blue  0.118  filter  0.608]
      [0.829 1.001   color red  0.702  green  0.467  blue  0.118  filter  0.608
      color red  1.000  green  1.000  blue  1.000  filter  1.000]
   }
   scale 0.5
} }

union {   // Tower in the water
  cylinder {
    < 0, 0, 0 > , < 0, 0.2, 0 > , 0.8 open
    texture {
      pigment {
        color Red
      }
      finish {
	ambient 0.2
	diffuse 1.0
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
  object {
    Statue
    scale 0.5
    translate < 0, 0.2, 0 >
  }
  bounded_by { box { < -1, 0, -1>, < 1, 2, 1> } }
  translate < 0.5, 0, -45.5 >
}