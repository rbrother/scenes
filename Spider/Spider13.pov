// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "glass.inc"

#include "..\robo\robo_gen.inc"  
#declare Head_Rotation = 0;   // Horisontal tilt of head. 0 = forward
#declare Robot_Rotation = 0;  // Horisontal tilt of robot. 0 = -z
#declare Left_Hand_Tilt1 = -40;  // Tilt of joint in shoulder
#declare Left_Hand_Tilt2 = 30;  // Tilt of joint in elbow
#declare Right_Hand_Tilt1 = 15;  // Tilt of joint in shoulder
#declare Right_Hand_Tilt2 = 20;  // Tilt of joint in elbow
#declare Left_Foot_Tilt1 = 15;  // Tilt of joint in hip
#declare Left_Foot_Tilt2 = -20;  // Tilt of joint in knee
#declare Left_Foot_Tilt3 = 0;  // Tilt of joint in knee
#declare Right_Foot_Tilt1 = -15;  // Tilt of joint in hip
#declare Right_Foot_Tilt2 = -25;  // Tilt of joint in knee
#declare Right_Foot_Tilt3 = 15;  // Tilt of joint in knee
#include "..\robo\robot.inc"


                    
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
  direction z*2.2
  look_at   <0.0, 4.0,  0.0>
  right     x*image_width/image_height
	  
}                 

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  area_light
  <20, 0, 0> <0, 0, 20> // lights spread out across this distance (x * z)
  8, 8                // total number of lights in grid
  adaptive 1          // 0,1,2,3...
  jitter              // adds random softening of light
  circular               
  fade_distance 150
  fade_power 2
  translate <5, 100, -80>
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
               
                              
#declare arm =
union
{
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
union
{	
	intersection
	{
		sphere { <0,0,0> 1	
			scale <bodyRadius, 1, bodyRadius>		
		}
		plane { -y, 0 }
	}
	cone
	{
		<0,0,0>, bodyRadius, <0,-0.5,0>, bodyRadius-0.5
	}
}

 
#declare body =
union
{                                  
	object { cover translate 1.0*y }
	object { cover rotate x*180 translate -1.0*y }
	cylinder { <0,-1.0,0>, <0,1.0,0>, bodyRadius-0.5 }
	texture { Gold_Nugget }	   		
}
           
#declare spider =      
union
{                    
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

#declare Robot_Texture1 = 
texture {
  pigment { granite
    color_map { [ 0 color rgb<1,0.2,0> ] [ 0.4 color Red ] 
       [ 1.0 color Black ] }
    scale 0.20
  }
  finish {
    diffuse 0.8 ambient 0.1 reflection 0.2
    brilliance 2.0
    metallic
    specular 1
    roughness 0.02
  }
}

object { Robot
  texture { Robot_Texture1 }
  scale 0.7
  rotate y*(-35)
  translate <-16,0,10>
}
                            

object { Robot
  texture { Robot_Texture1 }
  scale 0.7
  rotate y*(-120)
  translate <-10,0,-10>
}

object { Robot
  texture { Robot_Texture1 }
  scale 0.7
  rotate y*(45)
  translate <12,0,30>
}
                            
object { Robot
  texture { Robot_Texture1 }
  scale 0.7
  rotate y*(80)
  translate <20,0,15>
}
                            