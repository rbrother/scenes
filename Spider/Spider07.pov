// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "functions.inc"  // internal functions usable in user defined functions
#include "skies.inc"

global_settings {
  assumed_gamma 2.2
}


// set a color of the background (sky)
// Create an infinite sphere around scene and allow any pigment on it

object { O_Cloud1 hollow }

// Create an infinite sphere around scene and allow any pigment on it
sky_sphere {
  pigment {
    gradient y
    color_map { [0.0 color rgb <0.7,0.7,1.0>] [1.0 color blue 0.5] }
  }
}
                        

// An infinite planar surface
// plane {<A, B, C>, D } where: A*x + B*y + C*z = D
plane {
  y, 0 // <X Y Z> unit surface normal, vector points "away from surface"
  // pattern for use in texture/pigment/normal/density
  texture
  {
	  pigment
	  {  
		// create a smooth color gradation map
		crackle
		color_map {
		  //  [ END_VAL color red R green G blue B filter F transmit T]
		  [ 0.0  color rgb<1,1,1>]
		  [ 0.5  color rgb<0.5,0.5,0.5>]
		  [ 1.0  color rgb<1,1,0.6>]
		} // color_map
        turbulence 0.2
		scale 4
	  }
	  rotate y*45
  }

}

fog {
  fog_type   2 // ground fog
  distance   200
  color      rgb <0.7,0.7,1.0> 
  fog_offset 0.1
  fog_alt    10
  turbulence 0.8
}
           
                    
// perspective (default) camera
camera {
  location  <0.0, 8.0, -35.0>
  direction z*2.5
  look_at   <0.0, 4.0,  0.0>
  right     x*image_width/image_height	  
}                 

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  area_light
  <30, 0, 0> <0, 0, 30> // lights spread out across this distance (x * z)
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
               
                              
#declare arm =
union
{
	#declare joint = <0,0,0>;
	#declare step = 1;
	#while (step <= 5)
		#declare rotation = <15*step, 0, 15*step>;
		object { armPart 
			rotate rotation
			translate joint
		}	
		#declare delta = vrotate(armPartLength*y, rotation);
		#declare joint = joint + delta;
		#declare step = step + 1;   // increment our counter
	#end            
	sphere { joint, armDiameter * 1.25 }
	rotate z*90
}
           
#declare bodyRadius = 3;           
           
#declare spider = union {                    
	#declare yrot = 0;
	#while (yrot < 360)
 		object { arm  
 			rotate z*90
 			rotate z * (- 40 )
 			translate x*bodyRadius	 	
 			rotate y * (yrot + 30)
 		}
 		#declare yrot = yrot + 15;
	#end
	sphere { <0,0,0> 1	
		scale <bodyRadius, 2, bodyRadius>
	}
	texture { Gold_Nugget }	   
}                       

object { spider
	translate y*8
	rotate y*15
}