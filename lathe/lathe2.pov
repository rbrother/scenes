// Testing the new bezier-lathe object of POV-RAY 3.1
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"

camera {
  location <0, 40, -80>
  right     x*image_width/image_height
  up <0, 1, 0>
  direction <0, 0, 1.8>
  look_at <0, 10, 0>
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [ 0.0 color rgb<1.0, 1.0, 1.0> ]
      [ 0.5 color rgb<1.0, 1.0, 1.0> ]
      [ 1.0  color Blue ]
    }
    scale 2
    translate -1
  }             
}                                     

light_source { <-80, 40, -20> colour White }

                    
#declare MyColor = color rgb<1.0,0,0>;                   
                    
#declare taso = plane { y, 0 };

// rotate a 2-D outline of points around the Y axis to create a 3-D shape
#declare moykky = lathe {
  bezier_spline 
  4, // number of points
  <0, 10>, <10, 10>, <10, 0>, <20, 0> // the list of <u,v> points
  scale 0.7
}
           
union { 
  object { taso }
  #declare kulma = 0;
  #while (kulma < 359)
    object { moykky translate z*20 rotate y*kulma} 
    #declare kulma = kulma + 60;
  #end
  
            
  pigment {
     crackle 
     color_map { 
       [ 0.0 color White ]
       [ 0.1 color White ]
       [ 0.2 MyColor ]
       [ 1.0 MyColor ]
     }
     scale 8
  }
  finish {
     ambient 0.2
     diffuse 0.8
     reflection 0
     phong 0.8
  }
}