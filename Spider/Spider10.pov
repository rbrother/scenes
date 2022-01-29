// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "glass.inc"

global_settings {
  assumed_gamma 2
}
                    
sphere
{	<0,0,0> 1	
	pigment
	{      
		color White
	}	              
	finish
	{
		//ambient 0.5
		diffuse 1.0
	}
	scale 10000
	translate 10000*y
	hollow
}
         
                    
// perspective (default) camera
camera {
  location  <0.0, 8.0, -35.0>
  direction z*2
  look_at   <0.0, 4.0,  0.0>
  right     x*image_width/image_height
	  
}                 

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  area_light
  <10, 0, 0> <0, 0, 10> // lights spread out across this distance (x * z)
  6, 6                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 1          // 0,1,2,3...
  jitter              // adds random softening of light
  circular
  translate <-40, 100, -40>
}        

               
               
#declare armPartLength = 2.5;               
#declare armDiameter = 0.3;
     
#declare armPart =
union
{
	sphere { <0,0,0> armDiameter * 0.75
		texture { Tinny_Brass }	
	}
	cone {
  		0,  0.0,
  		y*0.5, armDiameter
  		texture { Aluminum }
	}   
	cylinder
	{
		y*0.5, 
		y*(armPartLength - 0.5),
		armDiameter
		texture { Soft_Silver }
	}  
	cone {
  		y*(armPartLength - 0.5), armDiameter,
  		y*(armPartLength), 0
  		texture { Aluminum }
	}   	
}     
               
                              
#declare arm = union {
	#declare joint = <0,0,0>;
	#declare step = 1;
	#while (step <= 5)
		#declare rotation = <0*step, 0, -25*step>;
		object { armPart 
			rotate rotation
			translate joint
		}	
		#declare delta = vrotate(armPartLength*y, rotation);
		#declare joint = joint + delta;
		#declare step = step + 1;   // increment our counter
	#end            
	sphere { joint, armDiameter * 1.25 
		pigment { rgbf<1,0.3,0.3,1> }
		finish { F_Glass5 }       
		interior { I_Glass }
	}
}
           
#declare bodyRadius = 3;           


#declare cover = 
	sphere { <0,0,0> 1	
		scale <bodyRadius, 1, bodyRadius>		
	}

 
#declare body = union {                                  
	object { cover translate 1.0*y }
	object { cover rotate x*180 translate -1.0*y }
	cylinder { <0,-0.7,0>, <0,0.7,0>, bodyRadius-0.5 }
	texture { Gold_Nugget }	   		
}
           
#declare spider = union {                    
	#declare yrot = 0;
	#while (yrot < 360)
 		object { arm  
 			rotate z*(-10)
 			translate x*bodyRadius	 	
 			rotate y * (yrot)
 		}
 		#declare yrot = yrot + 45;
	#end

	#declare yrot = 0;
	#while (yrot < 360)
 		object { arm  
 			rotate z*(-52)	 			
 			translate x*bodyRadius	 	
 			rotate y * (yrot + 45*0.5)
 		}
 		#declare yrot = yrot + 45;
	#end

	object { body }
}                       

object { spider
	translate y*6.5
	rotate y*15
}