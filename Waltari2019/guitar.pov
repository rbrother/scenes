//
// ********  MATERIALS  *******
//

#include "elecguit.inc"
#include "stones.inc"


#declare GuitarMaterial = 
material {
    texture { T_Stone3
        scale 20
     }
  }
//
// ********  OBJECTS  *******
//

#declare MicroManche = union {
  superellipsoid { // CacheMicro1
    <0.1, 0.1>
    material {
      Noir_Plastique
    }
    // All transformations fixed
    scale <45.5, 22.5, 3.0>
    translate  <0.0, 513.5, -7.0>
  }
  superellipsoid { // EMGM81
    <0.1, 0.1>
    material {
      Noir
    }
    // All transformations fixed
    scale <34.5, 18.5, 9.0>
    translate  <0.0, 513.5, -5.0>
  }
}
#declare MicroChevalet = union {
  superellipsoid { // CacheMicro2
    <0.1, 0.1>
    material {
      Noir_Plastique
    }
    // All transformations fixed
    scale <45.5, 22.5, 3.0>
    translate  <0.0, 598.5, -7.0>
  }
  superellipsoid { // EMGM85
    <0.1, 0.1>
    material {
      Noir
    }
    scale <34.5, 18.5, 9.0>
    translate  <0.0, 598.5, -5.0>
  }
}
#declare CSG004 = union {
  cylinder { // Cylndr008
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 2.0>
    translate  8.0*z
  }
  cone { // Cone006
    <0,0,0>, 1.5, <0,0,1>, 3.5
    scale <1.0, 1.0, 2.0>
    translate  6.0*z
  }
  cone { // Cone007
    <0,0,0>, 3.5, <0,0,1>, 1.5
    scale <1.0, 1.0, 2.0>
    translate  4.0*z
  }
  cylinder { // Cylndr009
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 4.0>
  }
}
#declare VisVibrato1 = difference {
  object { CSG004 }
  box { // Cube017
    <-1, -1, -1>, <1, 1, 1>
    scale <4.0, 1.0, 1.0>
    translate  10.0*z
  }
  material {
    Chrome
  }
  translate  <37.0, 636.0, -7.5>
}
#declare CSG005 = union {
  cylinder { // Cylndr010
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 2.0>
    translate  8.0*z
  }
  cone { // Cone008
    <0,0,0>, 1.5, <0,0,1>, 3.5
    scale <1.0, 1.0, 2.0>
    translate  6.0*z
  }
  cone { // Cone009
    <0,0,0>, 3.5, <0,0,1>, 1.5
    scale <1.0, 1.0, 2.0>
    translate  4.0*z
  }
  cylinder { // Cylndr011
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 4.0>
  }
}
#declare VisVibrato2 = difference {
  object { CSG005 }
  box { // Cube018
    <-1, -1, -1>, <1, 1, 1>
    scale <4.0, 1.0, 1.0>
    translate  10.0*z
  }
  material { Chrome }
  translate  <-37.0, 636.0, -7.5>
}
// Include contains 'Body'
#include "elecguit.in1"

#declare Body = object {
  Body_Raw
}         
                
                
#declare Caisse = difference {
  object { Body }
  superellipsoid { // SuperQ001
    <0.1, 0.1>
    material {  Noir }
    scale <50.0, 16.0, 3.0>
    translate  <0.0, 660.0, 38.0>
  }
  superellipsoid { // SuperQ002
    <0.1, 0.1>
    material {       Noir }
    scale <36.0, 20.0, 3.0>
    translate  <0.0, 694.0, 38.0>
  }
  cylinder { // Cylndr037
    <0,0,1>, <0,0,0>, 1 
    scale <5.0, 5.0, 10.0>
    translate  <-85.0, 505.0, 31.0>
  } 
  material { GuitarMaterial }
  translate  -47.0*z
}            



#declare CSG001 = union {
  box { // Cube001
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-1.0, 0.0, 6.5>
  }
  box { // Cube002
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-7.5, 0.0, 6.5>
  }
  box { // Cube003
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-14.0, 0.0, 6.5>
  }
  box { // Cube004
    <-1, -1, -1>, <1, 1, 1>
    scale <1.5, 1.0, 0.5>
    translate  <-19.0, 0.0, 6.5>
  }
  box { // Cube005
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <6.0, 0.0, 6.5>
  }
  box { // Cube006
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <13.0, 0.0, 6.5>
  }
  box { // Cube007
    <-1, -1, -1>, <1, 1, 1>
    scale <1.5, 1.0, 0.5>
    translate  <19.0, 0.0, 6.5>
  }
  translate  -1.0*y
}

#declare CSG002 = union {
  box { // Cube008
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-1.0, 0.0, 6.5>
  }
  box { // Cube009
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-7.5, 0.0, 6.5>
  }
  box { // Cube010
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <-14.0, 0.0, 6.5>
  }
  box { // Cube011
    <-1, -1, -1>, <1, 1, 1>
    scale <1.5, 1.0, 0.5>
    translate  <-19.0, 0.0, 6.5>
  }
  box { // Cube012
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <6.0, 0.0, 6.5>
  }
  box { // Cube013
    <-1, -1, -1>, <1, 1, 1>
    scale <3.0, 1.0, 0.5>
    translate  <13.0, 0.0, 6.5>
  }
  box { // Cube014
    <-1, -1, -1>, <1, 1, 1>
    scale <1.5, 1.0, 0.5>
    translate  <19.0, 0.0, 6.5>
  }
  translate  <0.0, -13.0, -2.0>
}

#declare TransSweep001 = prism {
  linear_sweep
  linear_spline
  -41.0,0.0
  7  // control points
  <0.0, 0.0>,
  <6.0, 0.0>,
  <6.0, -2.0>,
  <4.0, -12.0>,
  <4.0, -14.0>,
  <0.0, -14.0>,
  <0.0, 0.0>
  rotate -x*90
  rotate -90.0*y
  translate  20.5*x
}
// Include contains 'TransSweep021'
#include "elecguit.in2"

#declare TransSweep021 = object {
  TransSweep021_Raw
  rotate 101.0*x
  translate  <-13.0, -2.0, 6.0>
}
// Include contains 'TransSweep022'
#include "elecguit.in3"

#declare TransSweep022 = object {
  TransSweep022_Raw
  rotate 101.0*x
  translate  <0.0, -2.0, 6.0>
}
// Include contains 'TransSweep023'
#include "elecguit.in4"

#declare TransSweep023 = object {
  TransSweep023_Raw
  rotate 101.0*x
  translate  <14.5, -2.0, 6.0>
}
#declare VisBloqueCorde1 = union {
  cylinder { // Cylndr095
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 4.0>
    translate  8.0*z
  }
  cylinder { // Cylndr006
    <0,0,1>, <0,0,0>, 1 
    scale <1.5, 1.5, 8.0>
  }
  material {
    Noir_Metal
  }
  rotate 11.0*x
  translate  <14.5, -6.5, 2.5>
}
#declare VisBloqueCorde2 = union {
  cylinder { // Cylndr123
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 4.0>
    translate  8.0*z
  }
  cylinder { // Cylndr005
    <0,0,1>, <0,0,0>, 1 
    scale <1.5, 1.5, 8.0>
  }
  material {
    Noir_Metal
  }
  rotate 11.0*x
  translate  <0.0, -6.5, 2.5>
}
#declare VisBloqueCorde3 = union {
  cylinder { // Cylndr124
    <0,0,1>, <0,0,0>, 1 
    scale <3.5, 3.5, 4.0>
    translate  8.0*z
  }
  cylinder { // Cylndr007
    <0,0,1>, <0,0,0>, 1 
    scale <1.5, 1.5, 8.0>
  }
  material {
    Noir_Metal
  }
  rotate 11.0*x
  translate  <-13.0, -6.5, 2.5>
}
#declare CSG003 = union {
  object { CSG001 }
  object { CSG002 }
  object { TransSweep001 }
  object { TransSweep021 }
  object { TransSweep022 }
  object { TransSweep023 }
  object { VisBloqueCorde1 }
  object { VisBloqueCorde2 }
  object { VisBloqueCorde3 }
}
#declare Sillet = difference {
  object { CSG003 }
  cone { // Cone001
    <0,0,0>, 1.5, <0,0,1>, 2.5
    scale <1.0, 1.0, 1.1>
    translate  <7.0, -7.0, 3.5>
  }
  cone { // Cone002
    <0,0,0>, 1.5, <0,0,1>, 2.5
    scale <1.0, 1.0, 1.1>
    translate  <-7.0, -7.0, 3.5>
  }
  cylinder { // Cylndr001
    <0,0,1>, <0,0,0>, 1 
    scale <1.5, 1.5, 7.0>
    translate  <7.0, -7.0, -1.0>
  }
  cylinder { // Cylndr002
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 1.0>
    translate  <7.0, -7.0, 4.5>
  }
  cylinder { // Cylndr003
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 1.0>
    translate  <-7.0, -7.0, 4.5>
  }
  cylinder { // Cylndr004
    <0,0,1>, <0,0,0>, 1 
    scale <1.5, 1.5, 7.0>
    translate  <-7.0, -7.0, -1.0>
  }
  material {
    Chrome
  }
  translate  1.5*z
}

#declare Manche = intersection {
  box { // Cube015
    <-1, -1, -1>, <1, 1, 1>
    scale <30.0, 247.0, 15.0>
    translate  <0.0, 233.0, -15.0>
  }
  cone { // Cone003
    <0,0,0>, 20.5, <0,0,1>, 27.5
    scale <1.0, 0.7, 494.0>
    rotate -90.0*x
    translate  -14.0*y
  }
  material { GuitarMaterial }
}

#declare Touche = intersection {
  box { // Cube016
    <-1, -1, -1>, <1, 1, 1>
    scale <30.0, 247.0, 2.5>
    translate  <0.0, 233.0, 2.5>
  }
  cone { // Cone004
    <0,0,0>, 20.5, <0,0,1>, 27.5
    scale <1.0, 1.0, 494.0>
    rotate -90.0*x
    translate  -14.0*y
  }
  material {
    Rosewood
  }     
}

#declare Frette = union {
  cylinder { // Frette1
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 36.0, 5.0>
  }
  cylinder { // Frette2
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 70.0, 5.0>
  }
  cylinder { // Frette3
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 102.5, 5.0>
  }
  cylinder { // Frette4
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 133.5, 5.0>
  }
  cylinder { // Frette5
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 162.0, 5.0>
  }
  cylinder { // Frette6
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 189.5, 5.0>
  }
  cylinder { // Frette7
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 215.0, 5.0>
  }
  cylinder { // Frette8
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 239.5, 5.0>
  }
  cylinder { // Frette9
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 262.5, 5.0>
  }
  cylinder { // Frette10
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 284.0, 5.0>
  }
  cylinder { // Frette11
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 304.5, 5.0>
  }
  cylinder { // Frette12
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 324.0, 5.0>
  }
  cylinder { // Frette13
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 342.0, 5.0>
  }
  cylinder { // Frette14
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 359.5, 5.0>
  }
  cylinder { // Frette15
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 375.5, 5.0>
  }
  cylinder { // Frette16
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 390.0, 5.0>
  }
  cylinder { // Frette17
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 405.0, 5.0>
  }
  cylinder { // Frette18
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 419.0, 5.0>
  }
  cylinder { // Frette19
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 432.0, 5.0>
  }
  cylinder { // Frette20
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 444.0, 5.0>
  }
  cylinder { // Frette21
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 455.5, 5.0>
  }
  cylinder { // Frette22
    <0,0,1>, <0,0,0>, 1 
    scale <0.5, 1.5, 60.0>
    rotate -90.0*y
    translate  <30.0, 466.5, 5.0>
  }
}
#declare Frettes = intersection {
  object { Frette }
  cone { // Cone005
    <0,0,0>, 20.5, <0,0,1>, 27.5
    scale <1.0, 1.0, 494.0>
    rotate -90.0*x
    translate  -14.0*y
  }
  material {
    Chrome
  }
}
#declare Dots = union {
  cylinder { // DotCase3
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 86.0, 4.0>
  }
  cylinder { // DotCase5
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 147.5, 4.0>
  }
  cylinder { // DotCase7
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 202.5, 4.0>
  }
  cylinder { // DotCase9
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 251.0, 4.0>
  }
  cylinder { // DotCase12CaD
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <17.5, 314.0, 4.0>
  }
  cylinder { // DotCase12CbD
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <-17.5, 314.0, 4.0>
  }
  cylinder { // DotCase15
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 367.5, 4.0>
  }
  cylinder { // DotCase17
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 398.0, 4.0>
  }
  cylinder { // DotCase19
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 425.5, 4.0>
  }
  cylinder { // DotCase21
    <0,0,1>, <0,0,0>, 1 
    scale <3.0, 3.0, 1.0>
    translate  <0.0, 450.0, 4.0>
  }
  material {
    Ecail
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  0.001*z
}
#declare MancheGuitare = union {
  object { Sillet }
  object { Manche }
  object { Touche }
  object { Frettes }
  object { Dots }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Cordes_C042M009D = union {
  cylinder { // MI_Cd042eDRe0d5334mmD
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.5334, 0.5334, 657.0>
    rotate <-90.0, 0.0, -0.95>
    translate  <16.75, 0.0, 6.5334>
  }
  cylinder { // LA_Cd032eDRe0d4064mmD
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.4064, 0.4064, 656.0>
    rotate <-90.0, 0.0, -0.615>
    translate  <9.5, 0.0, 6.4064>
  }
  cylinder { // RE_Cd024eDRe0d3048mmD
    <0,0,1>, <0,0,0>, 1 
    scale <0.3048, 0.30486, 655.0>
    rotate <-90.0, 0.0, -0.25>
    translate  <2.5, 0.0, 6.3048>
  }
  cylinder { // SOL_Cd016eDRe0d2032mmD
    <0,0,1>, <0,0,0>, 1 
    scale <0.2032, 0.2032, 656.0>
    rotate <-90.0, 0.0, 0.1>
    translate  <-4.25, 0.0, 6.2032>
  }
  cylinder { // SI_Cd011eDRe0d1397mmD
    <0,0,1>, <0,0,0>, 1 
    scale <0.1397, 0.1397, 655.0>
    rotate <-90.0, 0.0, 0.5>
    translate  <-10.75, 0.0, 6.1397>
  }
  cylinder { // MI_Cd009eDRe0d1143mmD
    <0,0,1>, <0,0,0>, 1 
    scale <0.1143, 0.1143, 654.0>
    rotate <-90.0, -0.000004, 0.9>
    translate  <-17.25, 0.0, 6.1143>
  }
  material {
    Chrome
  }
  translate  1.5*z
}
#declare Boutons = union {
  superellipsoid { // BoutonVolume
    <1.0, 0.25>
    scale 9.0
  }
  superellipsoid { // BoutonTonaliteAigue
    <1.0, 0.25>
    scale 9.0
    translate  40.0*y
  }
  superellipsoid { // BoutonTonaliteGrave
    <1.0, 0.25>
    scale 9.0
    translate  80.0*y
  }
  material {
    Chrome
  }
  rotate 10.0*z
  translate  <-80.0, 600.0, -2.0>
}
#declare VisTune1 = union {
  cylinder { // Cylndr112
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr111
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone021
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <-27.5, 55.5, 7.0>
}
#declare VisTune2 = union {
  cylinder { // Cylndr113
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr114
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone022
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <-16.5, 55.5, 7.0>
}
#declare VisTune3 = union {
  cylinder { // Cylndr115
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr116
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone023
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <-5.5, 55.5, 7.0>
}
#declare VisTune4 = union {
  cylinder { // Cylndr117
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr118
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone024
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <5.5, 55.5, 7.0>
}
#declare VisTune5 = union {
  cylinder { // Cylndr119
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr120
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone025
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <16.5, 55.5, 7.0>
}
#declare VisTune6 = union {
  cylinder { // Cylndr121
    <0,0,1>, <0,0,0>, 1 
    scale <4.5, 4.5, 3.0>
    translate  9.5*z
  }
  cylinder { // Cylndr122
    <0,0,1>, <0,0,0>, 1 
    scale <2.5, 2.5, 10.0>
    translate  -0.5*z
  }
  cone { // Cone026
    <0,0,0>, 1.0, <0,0,1>, 2.5
    translate  -1.5*z
  }
  material {
    Noir_Metal
  }
  rotate -16.0*x
  translate  <27.5, 55.5, 7.0>
}
#declare Support = union {
  superellipsoid { // SuperQ003
    <0.1, 0.1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <34.0, 5.0, 1.0>
    rotate -16.0*x
    translate  <0.0, 56.5, 12.5>
  }
  superellipsoid { // SuperQ004
    <0.1, 0.1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <34.0, 10.0, 1.0>
    rotate 51.0*x
    translate  <0.0, 46.5, 6.5>
  }
  superellipsoid { // SuperQ005
    <0.1, 0.1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <47.0, 21.0, 1.0>
    translate  <0.0, 20.0, -1.0>
  }
  superellipsoid { // SuperQ006
    <1.0, 0.2>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 3.0>
    translate  <-40.0, 24.0, 3.5>
  }
  object { VisTune1 }
  object { VisTune2 }
  object { VisTune3 }
  object { VisTune4 }
  object { VisTune5 }
  object { VisTune6 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vibrato = difference {
  object { Support }
  box { // Cube043
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <-27.5, 45.0, 5.0>
  }
  box { // Cube044
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <-16.5, 45.0, 5.0>
  }
  box { // Cube045
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <-5.5, 45.0, 5.0>
  }
  box { // Cube046
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <5.5, 45.0, 5.0>
  }
  box { // Cube047
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <16.5, 45.0, 5.0>
  }
  box { // Cube048
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 9.0, 7.0>
    translate  <27.5, 45.0, 5.0>
  }
  cone { // Cone010
    <0,0,0>, 1.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 1.2>
    translate  <37.0, 0.0, -1.1>
  }
  cone { // Cone011
    <0,0,0>, 1.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 1.2>
    rotate 180.0*x
    translate  <37.0, 0.0, -0.9>
  }
  cone { // Cone012
    <0,0,0>, 1.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 1.2>
    translate  <-37.0, 0.0, -1.1>
  }
  cone { // Cone013
    <0,0,0>, 1.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 1.2>
    rotate 180.0*x
    translate  <-37.0, 0.0, -0.9>
  }
  cylinder { // Cylndr019
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <-27.5, 56.5, 10.5>
  }
  cylinder { // Cylndr020
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <-16.5, 56.5, 10.5>
  }
  cylinder { // Cylndr021
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <-5.5, 56.5, 10.5>
  }
  cylinder { // Cylndr022
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <5.5, 56.5, 10.5>
  }
  cylinder { // Cylndr023
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <16.5, 56.5, 10.5>
  }
  cylinder { // Cylndr024
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.5, 2.5, 4.0>
    rotate -16.0*x
    translate  <27.5, 56.5, 10.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Bout = union {
  cylinder { // Cylndr098
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 70.0>
    rotate -90.0*y
  }
  sphere { // Sphere011
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  -70.0*x
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate <0.0, 10.0, 20.0>
  translate  <-80.0, 0.0, 30.0>
}
#declare Barre = union {
  cylinder { // Cylndr096
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 30.0>
  }
  sphere { // Sphere009
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  30.0*z
  }
  cylinder { // Cylndr097
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 80.0>
    rotate -90.0*y
    translate  30.0*z
  }
  sphere { // Sphere010
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  <-80.0, 0.0, 30.0>
  }
  object { Bout }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 30.0*z
  translate  <-40.0, 24.0, 0.0>
}
#declare TransSweep002 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet1 = difference {
  object { TransSweep002 }
  box { // Cube019
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube020
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube021
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr012
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <-32.5, 12.0, 0.0>
}
#declare TransSweep008 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe1 = difference {
  object { TransSweep008 }
  box { // Cube037
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube038
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr018
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr025
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube039
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube040
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  -32.5*x
}
#declare VisLock1 = union {
  cylinder { // Cylndr099
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr100
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <0.0, -636.0, 0.5>
}
#declare VisPontet1 = union {
  cylinder { // Cylndr125
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr126
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <-27.5, 4.0, 0.5>
}
#declare Pont1 = union {
  object { Pontet1 }
  box { // Cale1
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <-27.5, 22.0, 4.5>
  }
  object { PartieFixe1 }
  object { VisLock1 }
  object { VisPontet1 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare TransSweep003 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet2 = difference {
  object { TransSweep003 }
  box { // Cube022
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube023
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube024
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr013
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <-21.5, 13.0, 0.0>
}
#declare TransSweep009 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe2 = difference {
  object { TransSweep009 }
  box { // Cube041
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube042
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr026
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr027
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube049
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube050
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <-21.5, 1.0, 0.0>
}
#declare VisLock2 = union {
  cylinder { // Cylndr101
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr102
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <11.0, -635.0, 0.5>
}
#declare VisPontet2 = union {
  cylinder { // Cylndr127
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr128
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <-16.5, 4.0, 0.5>
}
#declare Pont2 = union {
  object { Pontet2 }
  box { // Cale2
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <-16.5, 23.0, 4.5>
  }
  object { PartieFixe2 }
  object { VisLock2 }
  object { VisPontet2 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare TransSweep004 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet3 = difference {
  object { TransSweep004 }
  box { // Cube025
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube026
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube027
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr014
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <-10.5, 14.0, 0.0>
}
#declare TransSweep010 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe3 = difference {
  object { TransSweep010 }
  box { // Cube051
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube052
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr028
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr029
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube053
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube054
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <-10.5, 2.0, 0.0>
}
#declare VisLock3 = union {
  cylinder { // Cylndr103
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr104
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <22.0, -634.0, 0.5>
}
#declare VisPontet3 = union {
  cylinder { // Cylndr129
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr130
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <-5.5, 8.0, 0.5>
}
#declare Pont3 = union {
  object { Pontet3 }
  box { // Cale3
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <-5.5, 24.0, 4.5>
  }
  object { PartieFixe3 }
  object { VisLock3 }
  object { VisPontet3 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare TransSweep005 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet4 = difference {
  object { TransSweep005 }
  box { // Cube028
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube029
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube030
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr015
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <0.5, 13.0, 0.0>
}
#declare TransSweep011 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe4 = difference {
  object { TransSweep011 }
  box { // Cube055
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube056
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr030
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr031
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube057
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube058
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <0.5, 1.0, 0.0>
}
#declare VisLock4 = union {
  cylinder { // Cylndr105
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr106
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <33.0, -635.0, 0.5>
}
#declare VisPontet4 = union {
  cylinder { // Cylndr131
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr132
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <5.5, 4.0, 0.5>
}
#declare Pont4 = union {
  object { Pontet4 }
  box { // Cale4
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <5.5, 23.0, 4.5>
  }
  object { PartieFixe4 }
  object { VisLock4 }
  object { VisPontet4 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare TransSweep006 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet5 = difference {
  object { TransSweep006 }
  box { // Cube031
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube032
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube033
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr016
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <11.5, 14.0, 0.0>
}
#declare TransSweep012 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe5 = difference {
  object { TransSweep012 }
  box { // Cube059
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube060
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr032
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr033
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube061
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube062
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <11.5, 2.0, 0.0>
}
#declare VisLock5 = union {
  cylinder { // Cylndr107
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr108
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <44.0, -634.0, 0.5>
}
#declare VisPontet5 = union {
  cylinder { // Cylndr133
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr134
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <16.5, 8.0, 0.5>
}
#declare Pont5 = union {
  object { Pontet5 }
  box { // Cale5
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <16.5, 24.0, 4.5>
  }
  object { PartieFixe5 }
  object { VisLock5 }
  object { VisPontet5 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare TransSweep007 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  7  // control points
  <0.0, 0.0>,
  <0.0, 22.0>,
  <-7.0, 22.0>,
  <-9.0, 20.0>,
  <-9.0, 1.0>,
  <-8.0, 0.0>,
  <0.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontet6 = difference {
  object { TransSweep007 }
  box { // Cube034
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 0.0>
  }
  box { // Cube035
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 2.0, 10.0>
  }
  box { // Cube036
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <-4.5, 12.0, 5.0>
  }
  cylinder { // Cylndr017
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 15.0>
    rotate -90.0*x
    translate  <-9.0, -1.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <22.5, 15.0, 0.0>
}
#declare TransSweep013 = prism {
  linear_sweep
  linear_spline
  -10.0,0.0
  8  // control points
  <-3.0, 0.0>,
  <0.0, 0.0>,
  <0.0, 17.0>,
  <-8.0, 17.0>,
  <-9.0, 16.0>,
  <-9.0, 11.0>,
  <-7.0, 9.0>,
  <-3.0, 0.0>
  rotate -x*90
  photons {
    collect off
  }
  // All transformations fixed
}
#declare PartieFixe6 = difference {
  object { TransSweep013 }
  box { // Cube063
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 3.0>
    translate  <-4.5, 15.0, 5.0>
  }
  box { // Cube064
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 5.0, 3.0>
    translate  <-9.0, 13.0, 5.0>
  }
  cylinder { // Cylndr034
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 6.0>
    rotate -90.0*y
    translate  <-2.0, 6.0, 5.0>
  }
  cylinder { // Cylndr035
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    rotate -90.0*y
    translate  <0.0, 6.0, 5.0>
  }
  box { // Cube065
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 4.0, 2.0>
    translate  <0.0, 2.0, 5.0>
  }
  box { // Cube066
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 4.0, 3.0>
    translate  <-5.0, 2.0, 5.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 90.0*y
  translate  <22.5, 3.0, 0.0>
}
#declare VisLock6 = union {
  cylinder { // Cylndr109
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.5, 1.5, 40.0>
    rotate -90.0*x
    translate  <-27.5, 660.0, 3.0>
  }
  cylinder { // Cylndr110
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 4.0>
    rotate -90.0*x
    translate  <-27.5, 700.0, 3.0>
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <55.0, -633.0, 0.5>
}
#declare VisPontet6 = union {
  cylinder { // Cylndr135
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale 3.0
    translate  1.5*z
  }
  cylinder { // Cylndr136
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.0>
    translate  -2.5*z
  }
  material {
    Noir_Metal
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <27.5, 8.0, 0.5>
}
#declare Pont6 = union {
  object { Pontet6 }
  box { // Cale6
    <-1, -1, -1>, <1, 1, 1>
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 4.5>
    translate  <27.5, 25.0, 4.5>
  }
  object { PartieFixe6 }
  object { VisLock6 }
  object { VisPontet6 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Pontets = union {
  object { Pont1 }
  object { Pont2 }
  object { Pont3 }
  object { Pont4 }
  object { Pont5 }
  object { Pont6 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare VibratoFloydRose = union {
  object { Vibrato }
  object { Barre }
  object { Pontets }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <0.0, 636.0, -0.5>
}
#declare Capuchon = union {
  sphere { // Sphere001
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale 4.0
    translate  <-85.0, 505.0, 10.0>
  }
  cone { // Cone014
    <0,0,0>, 2.5, <0,0,1>, 4.0
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    translate  <-85.0, 505.0, 0.0>
  }
  torus { // Torus001
    2.0, 0.5  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  <-85.0, 505.0, 0.0>
  }
  material {
    Noir_Plastique
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige = union {
  cylinder { // Cylndr036
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <2.0, 2.0, 10.0>
    translate  <-85.0, 505.0, -10.0>
  }
  sphere { // Sphere002
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale 4.0
    translate  <-85.0, 505.0, -10.0>
  }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep014'
#include "elecguit.in5"

#declare TransSweep014 = object {
  TransSweep014_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  <-85.0, 505.0, -7.0>
}
#declare CSG006 = union {
  object { TransSweep014 }
  cylinder { // Cylndr039
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 0.5>
    translate  <-85.0, 505.0, -7.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis = difference {
  object { CSG006 }
  cylinder { // Cylndr038
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.5, 5.5, 4.0>
    translate  <-85.0, 505.0, -8.0>
  }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare RndDisc001 = merge {
  difference {
    cylinder { <0,0,1>,<0,0,0>, 1   scale <5.4000, 5.4000, 5.0000> }
    cylinder { <0,0,1>,<0,0,0>, 1   scale <4.6000, 4.6000, 5.1000> translate -0.0500*z }
  }
  difference {
    cylinder { <0,0,1>,<0,0,0>, 1   scale <5.5000, 5.5000, 4.8000> translate 0.1000*z }
    cylinder { <0,0,1>,<0,0,0>, 1   scale <4.5000, 4.5000, 5.1000> translate -0.0500*z }
  }
  torus { 5.4000, 0.1000  rotate -x*90 translate  4.9000*z bounded_by { box { <-5.5020, -5.5020, 4.7980>, <5.5020, 5.5020, 5.0020> } } }
  torus { 5.4000, 0.1000  rotate -x*90 translate  0.1000*z bounded_by { box { <-5.5020, -5.5020, -0.0020>, <5.5020, 5.5020, 0.2020> } } }
  torus { 4.6000, 0.1000  rotate -x*90 translate  4.9000*z bounded_by { box { <-4.7020, -4.7020, 4.7980>, <4.7020, 4.7020, 5.0020> } } }
  torus { 4.6000, 0.1000  rotate -x*90 translate  0.1000*z bounded_by { box { <-4.6020, -4.6020, -0.0020>, <4.6020, 4.6020, 0.1020> } } }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <-85.0, 505.0, -10.0>
}
#declare SelecteurMicro = union {
  object { Capuchon }
  object { Tige }
  object { Vis }
  object { RndDisc001 }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Cle = intersection {
  cylinder { // Cylndr043
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, 7.5, -5.0>
  }
  cylinder { // Cylndr044
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  cylinder { // Cylndr045
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, 7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG007 = union {
  cylinder { // Cylndr046
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere003
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige1 = difference {
  object { CSG007 }
  torus { // Torus002
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr047
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep015'
#include "elecguit.in6"

#declare TransSweep015 = object {
  TransSweep015_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis1 = union {
  cylinder { // Cylndr048
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep015 }
  cone { // Rondelle1
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique1 = difference {
  object { Vis1 }
  cylinder { // Passage1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique1 = union {
  cone { // Cone015
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  cylinder { // Cylndr040
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr041
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  box { // Cube068
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, 6.0, 2.25>
  }
  box { // Cube069
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  4.0*y
  }
  cylinder { // Cylndr042
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc1
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, 7.5, 0.0>
  }
  cylinder { // JointNoir1
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  object { Cle }
  object { Tige1 }
  object { Vis_Mecanique1 }
  photons {
    collect off
  }
  // All transformations fixed
  rotate -180.0*z
  translate  <-25.0, -50.0, -19.5>
}
#declare Cle1 = intersection {
  cylinder { // Cylndr052
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, 7.5, -5.0>
  }
  cylinder { // Cylndr053
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  cylinder { // Cylndr054
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, 7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG008 = union {
  cylinder { // Cylndr055
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere004
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige2 = difference {
  object { CSG008 }
  torus { // Torus003
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr056
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep016'
#include "elecguit.in7"

#declare TransSweep016 = object {
  TransSweep016_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis2 = union {
  cylinder { // Cylndr057
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep016 }
  cone { // Rondelle2
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique2 = difference {
  object { Vis2 }
  cylinder { // Passage2
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique2 = union {
  cone { // Cone016
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  cylinder { // Cylndr049
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr050
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  box { // Cube070
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, 6.0, 2.25>
  }
  box { // Cube071
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  4.0*y
  }
  cylinder { // Cylndr051
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc2
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, 7.5, 0.0>
  }
  cylinder { // JointNoir2
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  object { Cle1 }
  object { Tige2 }
  object { Vis_Mecanique2 }
  photons {
    collect off
  }
  // All transformations fixed
  rotate -180.0*z
  translate  <-25.0, -90.0, -19.5>
}
#declare Cle2 = intersection {
  cylinder { // Cylndr061
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, 7.5, -5.0>
  }
  cylinder { // Cylndr062
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  cylinder { // Cylndr063
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, 7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG009 = union {
  cylinder { // Cylndr064
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere005
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige3 = difference {
  object { CSG009 }
  torus { // Torus004
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr065
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep017'
#include "elecguit.in8"

#declare TransSweep017 = object {
  TransSweep017_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis3 = union {
  cylinder { // Cylndr066
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep017 }
  cone { // Rondelle3
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique3 = difference {
  object { Vis3 }
  cylinder { // Passage3
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique3 = union {
  cone { // Cone017
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  cylinder { // Cylndr058
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr059
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, 7.5, 0.0>
  }
  box { // Cube072
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, 6.0, 2.25>
  }
  box { // Cube073
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  4.0*y
  }
  cylinder { // Cylndr060
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc3
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, 7.5, 0.0>
  }
  cylinder { // JointNoir3
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, 7.5, 0.0>
  }
  object { Cle2 }
  object { Tige3 }
  object { Vis_Mecanique3 }
  photons {
    collect off
  }
  // All transformations fixed
  rotate -180.0*z
  translate  <-25.0, -130.0, -19.5>
}
#declare Cle3 = intersection {
  cylinder { // Cylndr070
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, -7.5, -5.0>
  }
  cylinder { // Cylndr071
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  cylinder { // Cylndr072
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, -7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG010 = union {
  cylinder { // Cylndr073
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere006
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige4 = difference {
  object { CSG010 }
  torus { // Torus005
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr074
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep018'
#include "elecguit.in9"

#declare TransSweep018 = object {
  TransSweep018_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis4 = union {
  cylinder { // Cylndr075
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep018 }
  cone { // Rondelle4
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique4 = difference {
  object { Vis4 }
  cylinder { // Passage4
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique4 = union {
  cone { // Cone018
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  cylinder { // Cylndr067
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr068
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  box { // Cube074
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, -6.0, 2.25>
  }
  box { // Cube075
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  -4.0*y
  }
  cylinder { // Cylndr069
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc4
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, -7.5, 0.0>
  }
  cylinder { // JointNoir4
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  object { Cle3 }
  object { Tige4 }
  object { Vis_Mecanique4 }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <25.0, -130.0, -19.5>
}
#declare Cle4 = intersection {
  cylinder { // Cylndr079
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, -7.5, -5.0>
  }
  cylinder { // Cylndr080
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  cylinder { // Cylndr081
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, -7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG011 = union {
  cylinder { // Cylndr082
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere007
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige5 = difference {
  object { CSG011 }
  torus { // Torus006
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr083
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep019'
#include "elecguit.i10"

#declare TransSweep019 = object {
  TransSweep019_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis5 = union {
  cylinder { // Cylndr084
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep019 }
  cone { // Rondelle5
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique5 = difference {
  object { Vis5 }
  cylinder { // Passage5
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique5 = union {
  cone { // Cone019
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  cylinder { // Cylndr076
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr077
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  box { // Cube076
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, -6.0, 2.25>
  }
  box { // Cube077
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  -4.0*y
  }
  cylinder { // Cylndr078
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc5
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, -7.5, 0.0>
  }
  cylinder { // JointNoir5
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  object { Cle4 }
  object { Tige5 }
  object { Vis_Mecanique5 }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <25.0, -90.0, -19.5>
}
#declare Cle5 = intersection {
  cylinder { // Cylndr088
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <7.0, 14.0, 10.0>
    translate  <26.0, -7.5, -5.0>
  }
  cylinder { // Cylndr089
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <9.0, 9.0, 16.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  cylinder { // Cylndr090
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 10.0, 17.0>
    rotate 90.0*y
    translate  <17.5, -7.5, 0.0>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG012 = union {
  cylinder { // Cylndr091
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 27.0>
    translate  4.5*z
  }
  sphere { // Sphere008
    <0,0,0>,1
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.0, 3.0, 1.0>
    translate  31.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Tige6 = difference {
  object { CSG012 }
  torus { // Torus007
    6.0, 4.0  rotate -x*90
    photons {
      collect off
    }
    // All transformations fixed
    translate  28.5*z
  }
  cylinder { // Cylndr092
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 10.0>
    rotate 90.0*y
    translate  <-5.0, 0.0, 28.5>
  }
  photons {
    collect off
  }
  // All transformations fixed
}
// Include contains 'TransSweep020'
#include "elecguit.i11"

#declare TransSweep020 = object {
  TransSweep020_Raw
  photons {
    collect off
  }
  // All transformations fixed
  translate  20.5*z
}
#declare Vis6 = union {
  cylinder { // Cylndr093
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.0, 4.0, 18.0>
    translate  4.5*z
  }
  object { TransSweep020 }
  cone { // Rondelle6
    <0,0,0>, 7.5, <0,0,1>, 6.0
    photons {
      collect off
    }
    // All transformations fixed
    translate  19.5*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Vis_Mecanique6 = difference {
  object { Vis6 }
  cylinder { // Passage6
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 20.0>
    translate  4.0*z
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Mecanique6 = union {
  cone { // Cone020
    <0,0,0>, 4.5, <0,0,1>, 3.5
    photons {
      collect off
    }
    // All transformations fixed
    scale <1.0, 1.0, 9.0>
    rotate 90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  cylinder { // Cylndr085
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 8.0, 9.5>
    translate  -5.0*z
  }
  cylinder { // Cylndr086
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <4.5, 4.5, 16.0>
    rotate -90.0*y
    translate  <8.0, -7.5, 0.0>
  }
  box { // Cube078
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 6.0, 2.25>
    translate  <0.0, -6.0, 2.25>
  }
  box { // Cube079
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <8.0, 4.0, 4.5>
    translate  -4.0*y
  }
  cylinder { // Cylndr087
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <5.0, 5.0, 8.0>
    translate  4.5*z
  }
  cylinder { // JointBlanc6
    <0,0,1>, <0,0,0>, 1 
    material {
      Blanc
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <17.0, -7.5, 0.0>
  }
  cylinder { // JointNoir6
    <0,0,1>, <0,0,0>, 1 
    material {
      Noir
    }
    photons {
      collect off
    }
    // All transformations fixed
    scale <3.5, 3.5, 1.0>
    rotate 90.0*y
    translate  <18.0, -7.5, 0.0>
  }
  object { Cle5 }
  object { Tige6 }
  object { Vis_Mecanique6 }
  photons {
    collect off
  }
  // All transformations fixed
  translate  <25.0, -50.0, -19.5>
}
#declare Mecaniques = union {
  object { Mecanique1 }
  object { Mecanique2 }
  object { Mecanique3 }
  object { Mecanique4 }
  object { Mecanique5 }
  object { Mecanique6 }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare Cordes_C042M009D_Tete = union {
  cylinder { // MI_Cd042eDRe0d5334mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.5334, 0.5334, 53.0>
    rotate <84.023605, 0.741758, 6.010623>
    translate  <16.75, 3.0, 3.5>
  }
  cylinder { // LA_Cd032eDRe0d4064mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.4064, 0.4064, 93.0>
    rotate <86.514893, 0.526148, 7.86878>
    translate  <9.5, 3.0, 3.5>
  }
  cylinder { // RE_Cd024eDRe0d3048mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.3048, 0.30486, 133.0>
    rotate <87.519775, 0.396311, 8.741366>
    translate  <2.5, 3.0, 3.5>
  }
  cylinder { // SOL_Cd016eDRe0d2032mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.2032, 0.2032, 133.0>
    rotate <87.52079, -0.350774, -7.892354>
    translate  <-4.25, 3.0, 3.5>
  }
  cylinder { // SI_Cd011eDRe0d1397mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.1397, 0.1397, 93.0>
    rotate <86.52903, -0.490409, -7.484884>
    translate  <-10.75, 3.0, 3.5>
  }
  cylinder { // MI_Cd009eDRe0d1143mmD1
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <0.1143, 0.1143, 53.0>
    rotate <84.032379, -0.681279, -5.564843>
    translate  <-17.5, 3.0, 3.5>
  }
  material {
    Chrome
  }
  photons {
    collect off
  }
  // All transformations fixed
}
#declare CSG013 = union {
  box { // Cube067
    <-1, -1, -1>, <1, 1, 1>
    photons {
      collect off
    }
    // All transformations fixed
    scale <37.5, 85.0, 7.5>
    translate  <0.0, -85.0, -7.5>
  }
  object { Mecaniques }
  cylinder { // Cylndr094
    <0,0,1>, <0,0,0>, 1 
    photons {
      collect off
    }
    // All transformations fixed
    scale <37.5, 20.5, 15.0>
    translate  <0.0, -170.0, -15.0>
  }
  object { Cordes_C042M009D_Tete }
  photons {
    collect off
  }
  // All transformations fixed
  rotate 15.0*x
}

#declare Tete = difference {
  object { CSG013 }
  torus { // Torus008
    55.250037, 34.749963  rotate -x*90
    scale <1.0, 0.7, 1.0>
    rotate 90.0*x
  }
  material { GuitarMaterial }
  translate  <0.0, -14.0, 1.5>
}

#declare Guitar = union { 
  object { MicroManche }
  object { MicroChevalet }
  object { VisVibrato1 }
  object { VisVibrato2 }
  object { Caisse }
  object { MancheGuitare }
  object { Cordes_C042M009D }
  object { Boutons }
  object { VibratoFloydRose }
  object { SelecteurMicro }
  object { Tete }
  material { Noir_Plastique }
}

