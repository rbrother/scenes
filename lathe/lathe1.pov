// Testing the new bezier-lathe object of POV-RAY 3.1

global_settings { 
  assumed_gamma 2.2 
  max_trace_level 12
}

#include "colors.inc"
#include "textures.inc"

camera {
  location <0, 10, -40>
  right <3/4, 0, 0>
  up <0, 1, 0>
  direction <0, 0, 1.8>
  look_at <0, 8, 0>
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [ 0.0 color Black ]
      [ 0.4 color Black ]
      [ 0.6  color White ]
      [ 1.0  color White ]
    }
    scale 2
    translate -1
  }                                                   
}

light_source { <20, 80, 0> colour Gray80 }
light_source { <-20, 40, -20> colour Gray80 }
                    
#declare MyColor = color rgb<1.0,0,0>;                   

// Ground: a large sphere                    
sphere { <0, -400, 0>, 400
   pigment {
      gradient x
      color_map {
        [ 0 color White ]
        [ 0.5 color White ]
        [ 0.5 color Black ]
        [ 1.0 color Black ]
      }                    
      translate x*500
      scale 3
   }
   finish {
      ambient 0.2
      diffuse 0.8
   }
}

// rotate a 2-D outline of points around the Y axis to create a 3-D shape
lathe {
  bezier_spline 
  20, // number of points
  <20, 0>, <40, 20>, <15, 40>, <15, 50>, // the list of <u,v> points
  <15, 50.0001>, <15, 60>, <15, 70>, <30, 80>,
  <30, 80.0001>, <20, 80>, <10, 70>, <10, 50>,
  <10, 50>, <10, 40>, <20, 30>, <20, 20>,
  <20, 20>, <20, 10>, <10, 8>, <0, 8>

  scale 0.2
  pigment { 
    color rgbf<0.8,0.8,1.0, 1.0> 
  }
  finish { 
    ambient 0.0
    diffuse 0.0 
    phong 0.8 
    reflection 0.2
  }
  interior {
    ior 1.2 
  }
}
           
