#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

#declare FinalCamera = camera {
  location < 135, 15, 125 >
  direction < 0, 0, 1.4 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <10/6, 0, 0 >
  look_at < 0, -12, 0 >
}

camera { FinalCamera }

light_source { < 80, 50, 150 > color rgb<0.2,0.2,0.4> }

light_source { < 50, 200, -100 > color rgb<1,1,0.7>*0.8 }
light_source { < 40, 180, -65 > color rgb<1,1,0.7>*0.8 }

sky_sphere {    // Stars and suns
 
 pigment {
      gradient < 0, 1, 0 >
      color_map { [ 0 color Black ]
	[ 0.4 color rgb<0,0,1> ] [ 0.7 color White ] }
      turbulence 0.4
      translate -0.2*y
    } 
  pigment {
      leopard
        color_map { [ 0,0.5 color Clear color Clear ]
	[ 0.7 color rgb<1,1,0.5> ] [ 1.0 color rgb<1,1,0.5> ] }    
        scale 0.03
    }         
}
                      
                      
fog { 
        fog_type 2 // ground fog
        fog_alt 10
        distance 200
        rgb<0,0,0.5>
 
}
                   

height_field 
{
 gif "mount.ghf"
 smooth // This looks great! 
 translate <-0.5,-0.60,-0.5>
 scale < 300, 30, 300 >     
 
 texture {
   pigment {
     gradient y
     color_map { 
        [ 0 color rgb< 0.1, 0.2, 0 > ]
        [ 0.5 color rgb< 0.3, 0.4, 0.2 > ] 
        [ 1 color Gray80 ] }
     turbulence 0.2
     translate -0.5*y    
     scale 30
   }         
   normal {
     granite 0.4
     scale 1.0
   }
   finish {
     ambient 0.0
     diffuse 1.0
   }
 }        
 texture
 {
  pigment {
        gradient y 
        color_map {
                [ 0 color red 0 green 0 blue 0 transmit 1 ]
                [ 0.1 color red 0 green 0 blue 0 transmit 0 ]
                [ 0.2 color red 0.5 green 0.4 blue 0 transmit 0.5 ]
                [ 0.35 color red 0 green 0 blue 0 transmit 1 ]
                [ 1.0 color red 0 green 0 blue 0 transmit 1 ]
        }       
        scale 4  
        turbulence 1.2  
        rotate x*5
        rotate y*4
   }  
 }  

 
}

plane { < 0, 1, 0 > 0    // The lake
  pigment { color Black }
  normal {
    waves 0.03
    frequency 80
    translate < -0.5, -0.5, -0.5 >
    scale 30
  }
  finish {
    reflection 0.7
    ambient 0.0
    diffuse 0.0
  }
  rotate < 0, 20, 0 >
}

