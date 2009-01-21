/* 
   Kynttil„t. Robert Brotherus.
   Kersio pystysuuntaista A4-tulostetta varten.
*/
#include "colors.inc"
#include "shapes.inc"
#include "stones.inc"
#include "textures.inc"

camera {
  location < 0, 20, -55 >
  direction < 0, 0, 2.3 >   // Kameran "linssinpituus"
  up < 0, 1.414, 0 >
  right <1, 0, 0 >
  look_at < -5, 12, 0 >
}

light_source { < -10,10,-20> color rgb<0.8,0.5,0.5> }
light_source { < 20,30,20> color rgb<0.8,0.8,0.4> }
light_source { < 21,30,5 > color rgb<1.0,1.0,1.0> }

#declare small_ball =  sphere { <0,0,0>, 3
  pigment { color White } 
  finish { reflection 1.0 diffuse 0.1 ambient 0 phong 1 metallic 
    phong_size 150 brilliance 3 }
}

union {
  object { small_ball translate <7,25,15> }
  object { small_ball translate <-7,25,15> }
  object { small_ball translate <20,10,10> }
  object { small_ball translate <-20,10,10> }
  object { small_ball translate <10,15,10> }
  object { small_ball translate <-10,15,10> }
  object { small_ball translate <15,20,10> }
  object { small_ball translate <-15,20,10> }
  object { small_ball translate <10,10,5> }
  object { small_ball translate <-10,10,5> }
  object { small_ball translate <20,20,5> }
  object { small_ball translate <-20,20,5> }
  object { small_ball translate <15,5,-5> }
  object { small_ball translate <-15,5,-5> }
  object { small_ball translate <10,3,-15> }
  object { small_ball translate <-10,3,-15> }
}

sphere { <0,0,0>,1
  pigment { gradient y
    color_map { [ 0 color Black ] [ 1.0 color Red ] }
  }
  finish { diffuse 0 ambient 0.7 }
  scale 1000
}

#declare pilari = union { 
  cylinder { <0,0,0>, <0,50,0>, 7.5 }
  difference {
    object { Hyperboloid_Y }
    plane { -y,0 }
    scale <7.5,5,7.5>
    translate y*5
  }
}

union { 
  object { pilari translate -20*x-5*z }
  object { pilari translate 0*x }
  object { pilari translate 20*x-5*z }
  translate z*30
  texture {
    pigment { color red 1 blue 0.6 }
    finish { 
      diffuse 0.2 
      metallic
      phong 1
      phong_size 80
      reflection 0.8 
    }
  }
  texture { 
    pigment { gradient y
      color_map {
	[ 0 color Clear ] [ 0.3 color Clear ]
	[ 0.5 color rgbf<1,1,1,0.5> ] [ 0.7 color Clear ]
	[ 1.0 color Clear ]
      }
      scale 5
    }
  }
}

#declare Candle = union {
  object {              // The candle
    union {
      cylinder { <0,0,0>,<0,-5,0>,1 }
      intersection {
	object { Ellipsoid scale < 1, 5, 1 > } 
	plane { -y, 0 }
      }
      scale 0.20
      translate y*0.30
    }
    pigment { color rgb<0.8,0.3,0> }
    finish {
       ambient 0.15
       diffuse 1.0
       brilliance 1.5
       phong 1
    }
  }
  object {              // Flame
    merge {
      sphere { < 0, 0, 0 >, 1 
	scale <1,1.4,1>
      }
      cone { <0,0,0>,1, <0,1,0>,0 
	scale < 0.8, 3, 0.8 > 
	translate y*0.9
      }
      light_source { < 0,0,0 > color rgb<0.8,0.8,0.3>}
      scale <0.8,1.2,0.8>
    }
    translate 1.6*y
    pigment {
      gradient 1*y
      color_map { 
	[ 0 color rgbf<0,0,1,1> ] [ 0.35 color rgbf<1,1,0.3,0>] 
	[ 1 color rgbf<1,1,0.3,0> ] }
      scale < 1, 6.0, 1 >
      } 
    finish {
      diffuse 0
      ambient 1
    }
    scale < 0.15, 0.15, 0.15 >
    translate 1.33*y
    no_shadow
  }
}

#declare box1 = box { <-2,-2,-2>, <2,2,2>
  rotate < 0,0,45 >
  translate < 0,3.5,-11.5 >
}

#declare Candle_Base = union { // pohjalevy
  sphere { < 0,0,0 > 1 scale < 10,0.5,10> 
    texture { Yellow_Pine scale 7 rotate < 0, 45, 0 > }
  }
  difference { // pohjalevyn reunat
    cone { < 0,0,0 >, 10, <0,2,0>, 12 }
    cone { < 0,-0.1,0 >, 9, <0,2.1,0>, 11.5 }
    object { box1 rotate < 0, 0, 0 > }
    object { box1 rotate < 0, 30, 0 > }
    object { box1 rotate < 0, 60, 0 > }
    object { box1 rotate < 0, 90, 0 > }
    object { box1 rotate < 0, 120, 0 > }
    object { box1 rotate < 0, 150, 0 > }
    object { box1 rotate < 0, 180, 0 > }
    object { box1 rotate < 0, 210, 0 > }
    object { box1 rotate < 0, 240, 0 > }
    object { box1 rotate < 0, 270, 0 > }
    object { box1 rotate < 0, 300, 0 > }
    object { box1 rotate < 0, 330, 0 > }
  }
  difference {  // Jalka
    union {
    intersection { 
      object { 
	Hyperboloid_Y 
	translate y*1.5
	scale 2
      }
      plane { y, 5 }
      plane { -y, 0 }
    }
    difference {
      sphere { < 0,0,0 >,1 scale <5,0.5,5> translate y*5.2 }
      sphere { < 0,0,0 >,1 scale <5,0.5,5> translate y*5.4 }
    }
    }
    sphere { < 0,6.5,0 > 2.5 }
  }
  torus { 2.8,0.7
    rotate < 90,0,0 >
    translate < -10,2.8,0 >
  }
  object { Candle 
    scale 8.5
    translate 7*y 
  }
  texture { 
    Yellow_Pine
    finish { reflection 0.4 phong 1}
    scale 7
  }
  bounded_by { union {
    box { <-2,-1,-2>,<2,50,2> }
    box { <-12,-1,-12>,<12,6,12> } 
  } }
}

object { Candle_Base 
  rotate <0,33,0>
  translate < 0, 0, 0 > 
}

