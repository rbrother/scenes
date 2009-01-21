#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"

// Tee atmosphere ja jostakin tuleva valonsäde - kaihdinten välistä??!! :)
// Olisi liian hidas... joku toinen kerta
// Render this at 3200 x 2400

global_settings        
{                 
	max_trace_level 12
	ambient_light 0
	radiosity { 
		brightness 1.5 
		count 100
	} 
}


camera {
   location  < -20, 570, -200 >
   direction < 0,0,1.8>
   up        < 0.0, 1.0, 0.0>
   right     < 1.0, 0.0, 0.0>
   look_at   < 20, 480, 0>
}

#declare keppi = union {
  sor {
    12, // number of points - remember to repeat in the end
    <0,0>, <2.2,0.1>, <3,0.3>, <4,2>, <5,7>, <3,20>, <2.5, 30>,
    <2.8, 45>, <2,65>, <2,81>, <1,82.8>, <0,83>
    rotate 20*y
  }
  disc { <0,0,0> y 2.2 }
  sphere { <0,55,0> 4 }
  sphere { <0,50,0> 3 }
  sphere { <0,59,0> 3 }
}

#declare paa_sor =
  sor {
    18, // number of points - remember to repeat in the end
    <1,-20.51>, <8,-20.5> <10,-20>, <12,-18>,
    <10,-16>, <10,-15.9>, <10,-14>,
    <7,-8>, <8.5,-3>, <8.5,3>, <7,8>,
    <10,14>, <10,15.9>, <10,16>,
    <12,18>, <10,20>, <8,20.5>, <1,20.51>
    sturm
    rotate 30*y
}

#declare paa_extras = union
{
  disc { <0,20.5,0>, y, 8.01 }
  torus { 8.5,2 translate <0,13,0> }
}

#declare paa = union {
  object { paa_sor }
  object { paa_extras }
  object { paa_extras rotate x*180 }
  rotate 90*z
}

#declare nuija = union {
  object { keppi translate -72*y}
  object { paa }
  texture { 
  	Yellow_Pine scale 40 rotate y*75 rotate -3*x
    finish { reflection 0.2 phong 1 phong_size 100 diffuse 2.0 }
  }
  rotate 85*x
}

#declare alusta = union {
  sor {
    9, // number of points - remember to repeat in the end
    <30,0>, <40,0.1>, <40,3>, <38,6>, <36,6.1>,
    <33,9>, <33,11>, <30,13>, <26,13.1>
  }
  disc { <0,13,0> y 30 }
  texture { T_Wood34 scale 40 translate <-20,6,0>
    finish { reflection 0.3 phong 1 phong_size 100 diffuse 1 }
  }
  scale 0.75
}

#declare paperi =
// extrude a closed 2-D shape along an axis
prism {
  linear_sweep cubic_spline
  0, 16,  // height1, height 2
  9,    // no. of points
  // the <u,v> points
  <-1,-0.1>, <0,0>, <7,0.5>,
  <12,0>, <20,0.5>, <26,0>, <26,-10>, <0,0>, <26,-20>
  open
  // sturm
  rotate -90*x
  pigment { image_map { gif "teksti.gif" interpolate 2 }
    rotate x*90 rotate y*90 scale <26,1,16> }
  scale <5,5,4>
  normal { granite 0.2 scale 20 }
  finish { diffuse 1.0  }
}                          

/*

#declare viini =
  difference {
    lathe {
      cubic_spline
      11, // number of points
      <3.8, 11.8>, <3.8, 11.8>, <4.6, 9>, <4, 7>, <1.5, 5.5>, <0, 5>, <0, 5>,
      <0,11.8>, <0,11.8>, <3.8, 11.8>, <3.8, 11.8>
    }
    plane { -y, -8 }
    pigment { rgbt<1,1,1,1> }
    halo
    {
      attenuating
      box_mapping constant
      colour_map { [ 0 rgbt <0.4,0,0.1,0.90> ] [ 1 rgbt <0.4,0,0.1,0.90> ] }
      samples 20
      aa_level 5
      aa_threshold 0.1
      jitter 0.8
    }
    finish { reflection 0 refraction 1 ior 1.4 diffuse 0 }
  hollow
}
  
  */
  
#declare lasi = union {
  // rotate a 2-D outline of points around the Y axis to create a 3-D shape
  lathe {
    cubic_spline
    21, // number of points
    <0, 0>, <4.5, 0>, <4.5, 0>, <4.5, 0.5>, <3, 1>, <1.5, 1.2>, <1.5, 2.5>,
    <1.5, 4>, <3.5, 5>, <5, 6>, <5.3, 7.5>, <4.8,9.5>, <4, 12>, <3.8, 11.8>, <4.6, 9>,
    <4, 7>, <1.5, 5.5>, <0, 5>, <0, 5>, <0,0>, <0,0>
  }
  //object { viini }
  scale 2.5
  pigment { rgbf<0.8,1,0.9,0.97> }
  finish { reflection 0 refraction 1 ior 1.3 phong 1 phong_size 100 }
}

#declare TableTop = union {
  box { < -500, -10, -500 >, <500,0,500>
    texture { T_Stone28 scale 100
      finish { reflection 0 diffuse 1.5 }
    }
  }
  union {
    object { nuija rotate -10*x translate 21*y rotate -20*y }
    object { alusta }
    translate 42*x
  }
  object { paperi rotate -105*y translate <-20,0,-110> }
  object { lasi translate <23,0,-102> }
  translate 500*y
}

light_source {
  <0, 2000, -200>
  color White
  spotlight
  point_at <0,500,-40>
  radius 2
  falloff 4
  tightness 1
}

object { TableTop }
