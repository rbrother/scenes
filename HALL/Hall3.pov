#include "colors.inc"
#include "shapes.inc"
#include "stones.inc"
#include "textures.inc"

camera {
  location <-2,3,-42>
  up <0,1,0>
  right     x*image_width/image_height
  direction <0,0,1.5>
  look_at <5,25,70>
}

light_source { <0,2,-50> color Gray80 }
light_source { <0,20,10> color rgb<1,0.5,0> }
light_source { <0,20,-50> color rgb<0.4,0,0> }

#declare MyStone = texture {
  pigment {
    marble
    color_map {
      [ 0 color rgb<0.3,0.3,0.3> ] 
      [ 0.1 color rgb<0.8,0.6,0.6> ]
      [ 1 color White ]
    }
    turbulence 1.2
    rotate <50,50,50>
  }
  finish { diffuse 1.0 ambient 0 phong 1 phong_size 80 }
}
texture {
  pigment {
    marble
    color_map {
      [ 0 color Clear ] [ 0.35 color Clear ][ 1 color rgb<0.7,0.4,0.15> ]
    }
    turbulence 1.2
    scale <3,1,1>
    rotate <-50,20,70>
  }
  finish { diffuse 1.0 ambient 0 phong 1 phong_size 100 }
}

#declare pillar1 =  cylinder { 
  <0,-0.001,0>, <0,1.001,0>, 0.3
  translate x*2
}

#declare pillar2 = difference {
  cylinder { <0,0,0>, <0,1,0>, 2 }
  object { pillar1 rotate y*0 }
  object { pillar1 rotate y*30 }
  object { pillar1 rotate y*60 }
  object { pillar1 rotate y*90 }
  object { pillar1 rotate y*120 }
  object { pillar1 rotate y*150 }
  object { pillar1 rotate y*180 }
  object { pillar1 rotate y*210 }
  object { pillar1 rotate y*240 }
  object { pillar1 rotate y*270 }
  object { pillar1 rotate y*300 }
  object { pillar1 rotate y*330 }
  scale <1,20,1>
}

#declare pillar3 = union {
  object { pillar2 }
  // alapaa
  intersection {
    object { Hyperboloid_Y 
      scale <1.7,1.5,1.7>
      translate 2.5*y
    }
    plane { -y,0 }
    plane { y,2.5 }
  }
  torus { 2.5, 0.6 translate 0.3*y }
  // ylapaa
  intersection {
    object { Hyperboloid_Y 
      scale <1.7,1.5,1.7>
      translate 16.5*y
    }
    plane { -y,-16.5 }
    plane { y,18.5 }
  }
  torus { 2.5, 0.6 translate 18.5*y }
  cone { <0,18.5,0>, 2.7, <0,20.0,0>, 3.2 }
  bounded_by { box { <-4,0,-4>,<4,20,4> } }
}

#declare pillar = union {
  object { pillar3 }
  texture { MyStone }
}

#declare box1 = box {
  <-0.25,0,-0.001>,<0.25,0.5,1.001>
  scale 0.32
  translate y*0.74
}

#declare ring = difference {
  cylinder { <0,0,0>, <0,0,0.32>, 1 }
  cylinder { <0,0,-0.001>, <0,0,1.001>, 0.75 }
  plane { y,0 }
  object { box1 rotate z*0 }
  object { box1 rotate z*20 }
  object { box1 rotate z*-20 }
  object { box1 rotate z*40 }
  object { box1 rotate z*-40 }
  translate -0.16*z
  scale <5,3.5,5>
  scale 2.74
  texture { MyStone }
  translate y*20
}

#declare pillars = union {
  object { pillar translate <-12,0,-12> }
  object { pillar translate <12,0,-12> }
  object { pillar translate <-12,0,12> }
  object { pillar translate <12,0,12> }
  object { pillar translate <-12,0,36> }
  object { pillar translate <12,0,36> }
  object { pillar translate <-12,0,60> }
  object { pillar translate <12,0,60> }
  object { ring translate <0,0,-12> }
  object { ring translate <0,0,12> }
  object { ring translate <0,0,36> }
  object { ring translate <0,0,60> }
  object { ring rotate y*90 translate <-12,0,0> }
  object { ring rotate y*90 translate <12,0,0> }
  object { ring rotate y*90 translate <-12,0,24> }
  object { ring rotate y*90 translate <12,0,24> }
  object { ring rotate y*90 translate <-12,0,48> }
  object { ring rotate y*90 translate <12,0,48> }
}

#declare floor2 = union {
  plane { y,0     // Floor
    pigment { color rgb<0.7,0.5,0.5> }
    finish { ambient 0 diffuse 0.6 reflection 0.4 }
  }
  box { <-4,0,-50>,<4,0.01,70>
    pigment { agate 
      color_map { [ 0 color rgb<0.7,0,0> ] [ 1 color Red ] }
      scale 0.1
    }
    finish { diffuse 0.4 ambient 0.15 }
  }
}

#declare room = difference {
  box { <-17,-2,-51>, <17,41,71> }  
  box { <-16,-1,-50>, <16,40.5,70> }
  box { <-6,-2,69.9>, <6,15,71.1> }
  cylinder { <0,15,69.9>,<0,15,71.1>, 6  }
  pigment { color White }
  finish { reflection 0.7 ambient 0 diffuse 0.3 }
}

#declare ceiling = box {
  <-17,40,-51>, <17,40.5,70>
  texture {
    tiles {
      texture {
        T_Stone13
        finish { reflection 0.3 }
      }
    tile2
      texture {
        T_Stone14
        finish { reflection 0.3 }
      }
    }
    scale 6
  }
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
  component 3,4, <4.5,4.5,2>
  component 3,4, <6,4,4>
  component 2.5,3, <3,4.5,6>
  component 2.5,2, <1,5,7>
  component 2.5,3, <0,5.5,8>
}

#declare blobbymain = difference {
  blob {
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
  // Jalat
  component 4,3, <-2.5,-8,0> component 4,3, <2.5,-8,0>
  component 4,3, <-2.5,-10.5,0> component 4,3, <2.5,-10.5,0>
  component 5,3, <-2.5,-13,0> component 5,3, <2.5,-13,0>
  component 4,3, <-2.5,-16.5,0> component 4,3, <2.5,-16.5,0>
  component 4,3, <-2.5,-20,0> component 4,3, <2.5,-20,0>
  // Oikea jalkater„ 
  component 3.5,2.5, <-2.5,-20,2>
  component 3,2.0, <-3.5,-20,3.5> component 3,2.0, <-1.5,-20,3.5>
  component 3,2.0, <-2.5,-20,5>
  // Vasen jalkater„ 
  component 3.5,2.5, <2.5,-20,2>
  component 3,2.0, <3.5,-20,3.5> component 3,2.0, <1.5,-20,3.5>
  component 3,2.0, <2.5,-20,5>
  }
  plane { y,-20.5 }
}

#declare blobbyeye = sphere { <0,12.0,1.7>, 0.7
  pigment { Black }
  finish { phong 1 phong_size 50 }
}

#declare blobbyman = union {
  object { blobbymain }
  object { blobbylefthand }
  object { blobbyrighthand }
  object { blobbyeye translate 0.9*x }
  object { blobbyeye translate -0.9*x }
  cylinder { <0,-20.5,8>, <0,15,8>, 0.5 texture { Gold_Metal } }
  sphere { <0,18,8>,4 texture { finish { reflection 1.0 } }}
  pigment { 
    onion
    color_map {
      [ 0 color rgb<1.0,0.5,0.5> ] [ 0.4 color rgb<1,0,0> ]
      [ 0.5 color White ] [ 0.9 color White ]
      [ 1.0 color rgb<0.5,0,0> ]
    }
    turbulence 0.2
    scale 6
    translate y*20
  }
  finish { diffuse 0.8 ambient 0
    phong 1 phong_size 50 brilliance 30 }
  translate y*20.5
  scale 0.2
}

#declare blobby2 = object {
  blobbyman
  rotate y*90
  translate -8.5*x
}

#declare blobbyrow = union {
  object { blobby2 translate 18*z }
  object { blobby2 translate 12*z }
  object { blobby2 translate 6*z }
  object { blobby2 translate 0*z }
  object { blobby2 translate -6*z }
  object { blobby2 translate -12*z }
  object { blobby2 translate -18*z }
}

union {
  object { blobbyrow }
  object { blobbyrow rotate y*180 }
  translate -6*z
}

object { room }
object { ceiling }
object { pillars }
object { floor2 }

sphere { <0,0,0>, 1
  texture {
  pigment { gradient y
    color_map { [ 0 color Black ][ 0.2 color rgb<0.5,0,0>] }
    turbulence 0.05
  }
  finish { diffuse 0 ambient 1 }
  }
  scale 5000
}

height_field {
 gif "mounts1.ghf"
 smooth // This looks great!
 texture {
   pigment {
     gradient y
     color_map { [ 0 color Gray30 ]
       [ 1 color Gray80 ] }
     turbulence 0.2
     scale 1.2
     translate -0.1*y
   }
   finish {
     ambient 0.1
     diffuse 0.9
     crand 0.3
   }
 }
 translate <-0.5,-0.5,0>
 scale < 200, 25, 200 >
 scale 3
 translate < 0, 0, 500 >
}
