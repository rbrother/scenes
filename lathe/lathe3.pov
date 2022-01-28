// Testing the new bezier-lathe object of POV-RAY 3.1

global_settings { 
  assumed_gamma 2.2 
  max_trace_level 12
}

#include "colors.inc"
#include "textures.inc"
#include "stones1.inc"

camera {
  location <0, 10, -40>
  right     x*image_width/image_height
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
light_source { <-20, 20, -20> colour Gray80 }
                    
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

#declare shape = 
union 
{
  difference 
  {
    merge 
    {
      lathe 
      {
        bezier_spline 
        4 // number of points
        <20, 0>, <40, 20>, <10, 40>, <0, 60> // the list of <u,v> points
      }
      sphere { <0,66,0>, 13 }
    }
    sphere { <0, 20, 0>, 17 }
  }
  box 
  { 
    <-1, -1, -1>, <1,1,1> 
    scale 6
    rotate <10,20,30> 
    translate <0,20,0> 
    texture { T_Grnt28 }
  }
}

object 
{ 
  shape 
  scale 0.2    
  pigment { color rgbf<0.8,0.8,1.0, 1.0> }
  finish 
  { 
    ambient 0.0
    diffuse 0.0 
    phong 0.8 metallic 
    reflection 0.2
  }
  interior { ior 1.2 }
}
           
