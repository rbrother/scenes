// Blobs stretching from everywhere

#include "colors.inc"
#include "textures.inc"

#include "sinit.inc"

camera {
  location < 0,0 0 >
  direction < 0, 0, 1.5 >
  up < 0, 1, 0 >
  right     x*image_width/image_height
  look_at < 0, 0, 5 >
}

light_source { <5,-3,3> color White }
light_source { <-5,3,-3> color rgb<0.6,0.6,0.2>}

#declare Basestrength = 12;
#declare Baseradius = 4;

#declare TheBlob = blob {
  threshold 5
  component Basestrength,Baseradius, <0,-1+sin1,1>
  component Basestrength,Baseradius, <6,0,sin2>
  component Basestrength,Baseradius, <11+sin1,0,0>
  component Basestrength,Baseradius, <0,1+sin2,5>
  component Basestrength,Baseradius, <5,0,5+sin1>
  component Basestrength,Baseradius, <10+sin2,-1,5>
  component Basestrength,Baseradius, <0,0+sin1,9>
  component Basestrength,Baseradius, <5,1,10+sin2>
  component Basestrength,Baseradius, <9+sin1,0,10>
  component Basestrength,Baseradius, <15,0+sin2,0>
  component Basestrength,Baseradius, <14,1,5+sin1>
  component Basestrength,Baseradius, <16+sin1,0,10>
  component Basestrength,Baseradius, <20,-1+sin2,0>
  component Basestrength,Baseradius, <21,0,5+sin1>
  component Basestrength,Baseradius, <20+sin1,0,10>
  component Basestrength/2,Baseradius, <2.5,0+sin1/2,2.5>
  component Basestrength/2,Baseradius, <2.5,0,7.5+sin2/2>
  component Basestrength/2,Baseradius, <7.5+sin1/2,0,7.5>
  component Basestrength/2,Baseradius, <7.5,0+sin2/2,2.5>
  component 8,3.5, <10,-3,5+sin1/2>
  component 5,2, <5+sin2/2,-2.5,-4>
  component 6,2, <15,-2.5+sin1/2,5>
  component 5,2.5, <0,-2.5,-4+sin2/2>
  translate <-10,0,-5>
}

sphere { <0,0,0> 1
  texture {
    pigment {
      gradient y
      color_map {
        [ 0 color Black ] [ 0.3 color rgb<0,0,1> ]
        [ 0.45 color rgb<1,0,1> ]
        [ 0.5 color rgb<1,0,0> ] [ 0.55 color rgb<1,0,1> ]
        [ 0.7 color rgb<0,0,1> ] [ 1.0 color Black ]
      }
      translate -0.5*y
      scale 2
    }
    finish {
      diffuse 0 ambient 0.6
    }
  }
  texture {
    pigment { leopard
      color_map {
        [ 0 color Clear ] [ 0.3 color Clear ]
        [ 0.6 color Black ] [ 1.0 color Black ]
      }
    }
    scale 0.02
  }
  scale 1000
}

union {
  object { TheBlob
    texture {
      pigment { onion
        color_map {
          [ 0 color rgb<1,0.2,0>]
          [ 0.7 color rgb<1,1,1> ]
          [ 1.0 color rgb<1,0.2,0>]
        }
      }
      finish { phong 1 phong_size 100 reflection 0.5 diffuse 0.4 }
    }
    rotate x*20
    translate <0,5,20>
  }
  object { TheBlob
    texture {
      pigment {
        onion
        color_map {
          [ 0 color rgb<0.2,0.3,0.8> ] [ 0.5 color rgb<0.7,1,1> ]
          [ 1.0 color rgb<0.2,0.3,0.8> ]
        }
        rotate <25,0,-15>
      }
      finish {
        ambient 0.1 diffuse 0.3
        reflection 0.6 phong 1 phong_size 80
      }
    }
    rotate y*-20
    rotate x*-212
    translate <3,-7,18>
  }
}

sphere { <0,0,14> 2
  texture {
    pigment { color Clear }
    finish { ambient 0 diffuse 0
      reflection 0.1 refraction 0.9 ior 1.8
      phong 1 phong_size 160
    }
  }
}

sphere { <4,0,14> 2
  texture {
    pigment { color White }
    finish { ambient 0 diffuse 0.2
      reflection 0.8
      phong 1 phong_size 70
      brilliance 10
    }
  }
}

sphere { <-4,0,14> 2
  texture {
    pigment { granite
      color_map {
        [ 0 color Red ] [ 0.5 color Yellow ] [ 1.0 color Red ]
      }
      turbulence 0.5
    }
    finish { ambient 0 diffuse 0.7
      reflection 0.3
      phong 1 phong_size 70
      brilliance 4
    }
  }
}
