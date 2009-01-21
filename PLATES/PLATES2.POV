#include "colors.inc"
#max_trace_level 6

camera {
  location < -5, 15, -25 >
  direction < 0, 0, 10 >
  up < 0, 1, 0 >
  right <1.4, 0, 0 >
  look_at < 10, 6.5, 0 >
}

light_source { <-10,19.5,-10> color rgb<1,1,0.8> }

box {
  <-30,0,-30>,<30,25,30>
  texture {
    pigment { checker color White color Gray80 scale 2 }
    finish { diffuse 0.6 ambient 0.2 }
  }
  texture {
    pigment { 
      gradient y 
      color_map { [ 0 color rgb<0.4,0,0> ] [ 1 color Clear ] } 
      scale 25.2
    }
    finish { diffuse 0.6 ambient 0.2 }
  }
}

box {
  <-30,0,-30>,<30,0.06,30>
  pigment { checker color rgb<1,0.3,0.1> color rgb<1,0.1,0.3> scale 6 }
  finish { diffuse 0.6 ambient 0 reflection 0.3 }
}

#declare Radius = 3.0;
#declare Strength = 1.3;

#declare plate = blob {
  threshold 0.3
  component Strength, Radius, <2,0,0>
  component Strength, Radius, <6,0,0>
  component Strength, Radius, <10,0,0>
  component Strength, Radius, <14,0,0>
  component Strength, Radius, <2,4,0>
  component Strength, Radius, <6,4,0>
  component Strength, Radius, <10,4,0>
  component Strength, Radius, <14,4,0>
  component Strength, Radius, <2,8,0>
  component Strength, Radius, <6,8,0>
  component Strength, Radius, <10,8,0>
  component Strength, Radius, <14,8,0>
  component Strength, Radius, <2,12,0>
  component Strength, Radius, <6,12,0>
  component Strength, Radius, <10,12,0>
  component Strength, Radius, <14,12,0>
  translate y*2
  bounded_by { box { <0,0,-2>, <16,16,2> } }
  scale 0.7 rotate y*55
  translate x*4.5
}

#declare PlateFinish = finish {
  ambient 0.05 diffuse 0.15 reflection 0.85
  phong 0.8 phong_size 50
}

#declare plates = union
{
  object { plate rotate y*0 scale 1.4
  texture {
    pigment { color rgb<1,0,0> }
    finish { PlateFinish }
  } }
  object { plate rotate y*40 scale 1.3
  texture {
    pigment { color rgb<1,1,0> }
    finish { PlateFinish   }
  } }
  object { plate rotate y*80 scale 1.2
  texture {
    pigment { color rgb<0,1,0> }
    finish { PlateFinish }
  } }
  object { plate rotate y*120 scale 1.1
  texture {
    pigment { color rgb<0,0,1> }
    finish { PlateFinish   }
  } }
  object { plate rotate y*160 scale 1.0
  texture {
    pigment { color rgb<1,0,1> }
    finish { PlateFinish }
  } }
  object { plate rotate y*200 scale 0.9
  texture {
    pigment { color rgb<1,1,0> }
    finish { PlateFinish }
  } }
  object { plate rotate y*240 scale 0.8
  texture {
    pigment { color rgb<1,0,1> }
    finish { PlateFinish }
  } }
}

object { plates rotate y*200 }
