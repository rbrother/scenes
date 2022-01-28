//-------  "Vedenalainen maailma Osa 2". Tilausty” Sirpa Kirjalaiselle -----

#version 3.5

global_settings {
  assumed_gamma 2.0
  max_trace_level 5
}

/*
Koko normaali vaaka 70 x 50 cm. Koko: 3200 x 2285.
(MUISTA aspect 1.4) Hinta 1000 mk.
Tulosta t„m„ tiedosto.
*/

#include "colors.inc"

camera {
  location  <-15,-100,-30>  // Ollaan metrin syvyydessa veden alla
  direction <0.0, 0.0, 1.3>
  up  <0.0, 1.0, 0.0>
  right     x*image_width/image_height
  look_at < -15,-30, 90>
}

light_source { < -100,300,-100 > color rgb<1,1,1> } // Aurinko
light_source { < 0,-5,-50 > color rgb<1,0.6,0.6> } // Aurinko2

#declare vesi = plane { y, 0  // Vesi
  pigment { wood
    color_map {
      [ 0 color rgbf<1,1,1,0.4> ]
      [ 0.05 color rgbf<0,0,1,0.4> ]
      [ 0.10 color Black ]
      [ 1.0 color Black ]
    }
    scale 10000
    translate <0,0,0>
  }
  normal { waves 0.2 frequency 0.06 scale 1 translate <-100,0,-200> }
  finish { diffuse 1.0 ambient 0 refraction 1 ior 1.4 brilliance 4 }
  no_shadow
}
  
#declare taivaspallo = sphere { <0,0,0> 1  // Taivaspallo
  pigment {
    gradient y
    color_map {
      [0 color Blue ] [0.5 color Black ]
      [0.5 color White ] [ 1.0 color Blue ]
    }
    scale 2
    translate -1.0*y
  }
  finish { diffuse 0 ambient 1.0 }
  scale 10000
}

#declare vene = intersection {
  sphere { <0,0,-0.7> 2 }
  sphere { <0,0,0.7> 2 }
  plane { y, 0 }
  cylinder { <-0.5,5.3,-4>, <-0.5,5.3,4>, 6.0 }
  plane { -y, 1.1 rotate x*45 }
  plane { -y, 0.75 rotate x*10 }
  plane { -y, 1.2 rotate x*75 }
  plane { -y, 1.1 rotate x*-45 }
  plane { -y, 0.75 rotate x*-10 }
  plane { -y, 1.2 rotate x*-75 }
  plane { -y, 1.2 rotate z*-75 }
  bounded_by { box {<-2,-2,-3>,<2,2,3>} }
  pigment { gradient z
    color_map { [ 0 color White ] [1.0 color Gray80 ] }
    scale 0.15 }
  normal {
    bumps 0.15
    scale 0.015
  }
  finish { ambient 0.1 diffuse 0.8 reflection 0.3 }
  scale <1.5,0.7,1>
  scale 100
  no_shadow
}

#declare blobbylefthand = blob {
  threshold 2
  component 4,4, <-3,5,0>
  component 3,4, <-4.5,2,2>
  component 3,4, <-6,-1,4>
  component 2.5,3, <-3,-2,6>
  component 2.5,2, <-1,-2.5,7>
  component 2.5,3, <0,-3,8>
}

#declare blobbyrighthand = blob {  
  threshold 2
  component 4,4, <3,5,0>
  component 3,4, <4.5,4,2>
  component 3,4, <6,3,4>
  component 2.5,3, <3,3,6>
  component 2.5,2, <1,3,7>
  component 2.5,3, <0,3,8>
}

#declare blobbymain = blob {
  threshold 2
  // P„„
  component 5,4, <0,12,0>
  component 3,3, <0,10,0>
  component 4,2, <0,8,0>
  component 5,2, <0,7,0>
  // Torso
  component 5,4, <-3,5,0> component 5,4, <3,5,0> component 5,4, <0,3,0>
  component 5,5, <-2,2,0> component 5,5, <2,2,0> component 5,4, <0,0,0>
  component 5,4, <-2,-2,0> component 5,4, <2,-2,0> component 5,4, <0,-4,0>
  component 5,4, <-2,-5,0> component 5,4, <2,-5,0>
}

#declare kalastaja = union {
  object { blobbymain }
  object { blobbylefthand }
  object { blobbyrighthand }
  pigment { color Black }
  bounded_by { box { <-9,0,-4>, <9,20,12> } }
  scale 10
  translate y*15
  rotate y*180
}

#declare lumpeenlehti = box { 
  <0,0,0>, <1.0,1.0,0.01> 
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
  finish { ambient 0.7 diffuse 0.5 }
  no_shadow
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
    no_shadow
  }
}

#declare my_threshold = 0.5;
#include "mato.inc"

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
  pigment {
    image_map {
      gif "kalaiho.gif"
      interpolate 2
    }
    scale <4,1.8,1>
    translate y*0.7
    rotate y*90
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
  scale 0.5
}

#declare koho = union {
  sphere { <0,0,0>, 1  // Korkki
    pigment { gradient y
      color_map {
        [ 0 color White ] [ 0.5 color White ]
        [ 0.5 color Red ] [ 1.0 color Red ]
      }
      scale 2 translate -1*y
    }
    finish { ambient 0.3 diffuse 0.6 }
    scale <2,2.5,2>
  }
  sphere { <0,0,0>, 1
    pigment { color Black }
    scale <0.5,5.0,0.5>
  }
}

#declare kalastajavene = union {
  object { vene }
  object { kalastaja }
  cone { <0,45,0>, 2, <-20,45,-350>, 0.5 pigment { color Black }} // Vapa
  cylinder { <-20,45,-350>, <-20,-90,-350>,0.15 // Siima
    pigment { color White }
    finish { ambient 0.2 diffuse 0.6 }
  }
  object { koho translate <-20,-26.0,-350> }
  sphere { <-20,-80,-350>, 0.7 // Paino
    pigment { color Gray30 }
  }
  object { mato scale 0.8
    rotate z*180
    translate <-20,-90,-350>
    pigment { color rgb<0.8,0.5,0.2> }
    finish { diffuse 0.4 ambient 0.2 phong 0.6 reflection 0.2 }
  }
  object { kala1 rotate 90*y translate <0,-90,-350> }
  object { kala1 scale 0.7 rotate 220*y translate <-30,-95,-370> }
  object { kala1 scale 1.4 rotate -80*y translate <-40,-60,-330> }
  object { kala1 scale 1.0 rotate 50*y translate <40,-115,-385> }
  object { kala1 scale 1.0 rotate 40*y translate <45,-65,-340> }
  object { kala1 scale 1.0 rotate 60*y translate <45,-100,-350> }
  object { kala1 scale 0.6 rotate 60*y translate <-50,-90,-300> }
  object { kala1 scale 0.8 rotate 220*y translate <0,-50,-300> }
  rotate y*25
  no_shadow
}

#declare kuplia = union {
  sphere { <-55,-25,50 > 3 }
  sphere { <-45,-30,60 > 2 }
  sphere { <-50,-40,55 > 1.5 }
  sphere { <-45,-53,50 > 1 }
  translate <50,30,-55>
  pigment { color Clear }
  finish { ambient 0 diffuse 0 refraction 1 ior 0.7 }
}

// The Scene

object { lumme
  scale 0.5 rotate -30*y translate <38,0.01,80> 
}
object { lumme
  rotate 50*y translate <-100,0.02,200> 
}
object { lumme
  rotate 0*y translate <-75,0.03,55> 
}

object { vesi }
object { taivaspallo }

object { kalastajavene translate <130,25,400> }

object { kuplia translate <-50,-30,55> }
object { kuplia rotate y*180 translate <20,-50,40> }

