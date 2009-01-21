//-------  "Vedenalainen maailma". Tilausty” Sirpa Kirjalaiselle ----------

#max_trace_level 5

/*
Koko normaali vaaka 70 x 50 cm. Koko: 3200 x 2285  (aspect 1.4)
Hinta 1200 mk. Laita muita kuvia samalle negatiiville. (pallomeri-variaat.)
Valmis viimeistaan marraskuussa, mieluiten ennen USA:n matkaa.
*/

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

camera {
   location  <-15,-100,-100>  // Ollaan metrin syvyydessa veden alla
   direction <0.0, 0.0, 1.3>
   up  <0.0, 1.0, 0.0>
   right <1.4, 0.0, 0.0>
   look_at < -15,-85, 0>
}

light_source { < -300,500,-300 > color rgb<1,1,0.5> } // Aurinko
light_source { < 70,20,10 > color rgb<0.7,0.7,1.0> } // Aurinko2

fog { color rgb<0,0,0.2> distance 1000 }

plane { y, 0  // Vesi
  pigment { wood
   color_map {
     [ 0 color rgb<0.7,0.7,1> ]
     [ 1.0 color rgb<0.2,0.4,1.0> ]
   }
   rotate x*90
   scale 900
  } // Vesi
  normal { waves 0.4 frequency 2 scale 100 translate <-500,0,-500> }
  finish { diffuse 1.0 ambient 0.2 reflection 0.3 }
  no_shadow
}
                  
#declare pohjatext = 
texture {  
  pigment { leopard 
   color_map { [ 0 color rgb<1,1,0.5> ] [ 1 color Green ] }
  }
  finish { diffuse 0.8 ambient 0.2 reflection 0.3 } 
  scale 10 
} 
texture {
  pigment { wood 
    color_map {
      [ 0.0 color Clear ] [ 0.7 color Clear ] 
      [ 1.0 color rgb<1,1,1> ]
    }
    scale 100
    rotate x*90
    translate <-300,-250,-300>
  }
  finish { diffuse 0.8 ambient 0.4 }
}

// Pohja1
height_field {
  gif "bottom.ghf"
  smooth    
  translate <-0.5,0,0>
  scale <3000,80,3000>
  translate <0,-250,-500>
  texture { pohjatext } 
} 

// pohja 2
height_field { 
  gif "bottom.ghf"
  translate <-0.5,0,0>
  scale <3000,300,3000>
  rotate -20*x
  rotate y*30
  translate <0,-450,900>
  texture { pohjatext } 
} 

#declare lumpeenlehti = box { 
  <0,0,0>,<1.0,1.0,0.01> 
  pigment {
    image_map {
      gif "lumme.gif"
      map_type 0
      filter 0,1.0
      interpolate 2
      once
    }
  }
  translate <-0.5,-0.5,0>
  rotate x*90
  scale 100
  finish { ambient 0.6 diffuse 1.0 }
  translate -0.1*y
}

#declare my_strength = 1.0;
#declare my_radius = 2.0;
#declare my_threshold = 0.5;
#include "kasvi.inc"

#declare lumme = union {
  object { lumpeenlehti }
  object { varsi
    scale <1,2.5,1>
    translate <5,-250,0>
    pigment { color rgb<0,1,0>}
    finish { diffuse 0.5 ambient 0.2 reflection 0.3 
      phong 1 phong_size 100 }
  }
}

#declare my_strength = 2.0;
#declare my_radius = 6.0;
#declare my_threshold = 0.5;
#include "kasvi2.inc"

#declare ruoho = object {
  kasvi2
  scale <1.3,3,1.3>
  translate <5,-230,0>
  pigment { color rgb<0,1,0>}
  finish { diffuse 0.5 ambient 0 reflection 0.5 phong 1 phong_size 100 }
}

#declare puska = union {
  object { ruoho }
  object { ruoho rotate y*45 translate <40,0,50> }
  object { ruoho rotate y*-80 translate <-40,0,20> }
  object { ruoho rotate y*140 translate <20,0,-50> }
}

#declare kala_runko = union {
  intersection {
    sphere { <0.7,0,0> 1 }
    sphere { <-0.7,0,0> 1 }
    scale <0.45,0.7,1.7>
    translate -0.8*z
  }
  intersection {
    sphere { <0.7,0,0> 1 }
    sphere { <-0.7,0,0> 1 }
    scale <0.7,1.0,2.5>
  }
  intersection {
    sphere { <0.7,0,0> 1 }
    sphere { <-0.7,0,0> 1 }
    scale <0.50,0.7,1.7>
    translate 1.0*z
  }
  intersection {
    sphere { <0.7,0,0> 1 }
    sphere { <-0.7,0,0> 1 }
    scale <0.40,0.45,1.6>
    translate 1.7*z
  }
  pigment { gradient y 
    color_map { [ 0.0 color White ] [ 0.3 color White ] 
                [ 0.7 color Yellow ] [ 1.0 color Yellow ] } 
    translate -0.5*y scale <1,4,1>
  }
  finish { ambient 0 diffuse 0.4 reflection 0.2 phong 0.4 }
  normal { 
    bump_map {
      gif "suomu.gif"
      bump_size 3.0
      interpolate 2
    }
    scale 0.2
    rotate y*-90
  }
}

#declare evat = union {
  // per„ev„
  difference {
    intersection {
      sphere { <0.7,0,0> 1 }
      sphere { <-0.7,0,0> 1 }
      scale <0.1,1.0,1.0>
    }
    cylinder { <2,0,1.5>, <-2,0,1.5>, 1.7 }
    translate 3.4*z
  }
  // selk„-ev„
  difference {
    box { <-0.01,0,0>, <0.01,0.7,1.2> }
    plane { z,0 rotate x*35 }
    scale 1.2
    rotate x*10
    translate <0,0.60,-0.2>
  }
  // pohjaev„
  difference {
    box { <-0.01,0,0>, <0.01,0.7,1.2> }
    plane { z,0 rotate x*35 }
    scale <1,-1,1>
    scale 0.8
    rotate -15*x
    translate <0,-0.55,0.6>
  }
  pigment { gradient y 
    color_map { [ 0.0 color rgbf<1,1,1,0.6> ] [ 0.3 color rgbf<1,1,1,0.6> ] 
                [ 0.7 color rgbf<1,1,0.5,0.6> ] [ 1.0 color rgbf<1,1,0.5,0.6> ] } 
    translate -0.5*y scale <1,4,1>
  }
  finish { ambient 0.2 diffuse 0.6 reflection 0.2 refraction 1 crand 0.1 }
}

#declare silmat =
  union { // Silm„t
    union {
      sphere { <0,0,0> 0.12 
        scale <0.5,1,1>
        translate -0.08*x
      }
      sphere { <0,0,0> 0.12 
        scale <0.5,1,1>
        translate 0.08*x
      }
      pigment { color Black }
    }
    union {
      sphere { <0,0,0> 0.16
        scale <0.5,1,1>
        translate -0.055*x
      }
      sphere { <0,0,0> 0.16
        scale <0.5,1,1>
        translate 0.055*x
      }
      pigment { color Red }
      finish { crand 0.5 phong 1 }
    }
    translate <0,0.1,-1.4>
  }

#declare kala1 = union {
  object { kala_runko }
  object { evat }
  object { silmat }
  bounded_by { box { <-1.0,-4.0,-3.0>, <1.0,4.0,6.0> } }
  scale <20,15,15>
}

#declare ilmakuplat = union {
  sphere { <0,0,0> 5 }
  sphere { <7,20,-7> 7 }
  sphere { <-3,25,5> 4 }
  sphere { <0,50,0> 10 }
  sphere { <15,75,-5> 13 }
  pigment { color Clear }
  finish { ambient 0 diffuse 0 refraction 1 ior 0.7 }
  bounded_by { box { <-30,-5,-30>, <30,100,30> } }
}

// The Scene

object { lumme
  rotate -30*y translate <50,0.01,100> 
}
object { lumme
  rotate 50*y translate <-100,0.02,200> 
}
object { lumme
  rotate -80*y translate <-180,0.03,300> 
}
object { lumme
  rotate 20*y translate <0,0.04,400> 
}
object { lumme
  rotate 160*y translate <100,0.05,500> 
}
object { lumme
  rotate 120*y translate <-180,0.06,700> 
}
object { lumme
  rotate 160*y translate <0,0.07,900> 
}
object { lumme
  rotate -20*y translate <-150,0.08,600> 
}
object { lumme
  rotate 130*y translate <100,0.08,250> 
}

object { puska
  rotate -20*y translate <250,0,400>
}
object { puska
  rotate 60*y translate <-300,0,600>
}
object { puska
  rotate 130*y translate <70,0,500>
}
object { puska
  rotate 130*y translate <-200,0,800>
}

object { kala1 scale 1 rotate y*60 translate <50,-100,40> }
object { kala1 scale 1 rotate y*85 translate <-10,-80,60> }
object { kala1 scale 1 rotate y*120 translate <-50,-120,80> }
object { kala1 scale 1 rotate y*110 translate <0,-110,100> }

object { ilmakuplat translate <-150,-100,300> }
object { ilmakuplat rotate y*70 translate <120,-100,200> }
object { ilmakuplat rotate y*150 translate <-15,-80,150> }
// lisaa yksittäisiä ilmakuplia
union {
  sphere { <40,-50,100 > 7 }
  sphere { <-35,-100,35 > 6 }
  sphere { <40,-120,25 > 8 }
  pigment { color Clear }
  finish { ambient 0 diffuse 0 refraction 1 ior 0.7 }
}
