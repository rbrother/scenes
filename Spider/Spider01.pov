// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "functions.inc"  // internal functions usable in user defined functions

// set a color of the background (sky)
// Create an infinite sphere around scene and allow any pigment on it
sky_sphere {
  pigment {
    gradient y
    color_map { [0.0 color rgb <0.7,0.7,1.0>] [1.0 color blue 0.5] }
  }
}

                    
// perspective (default) camera
camera {
  location  <0.0, 2.0, -20.0>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
}                 

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-10, 10, -20>
}

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <20, 30, 0>
}

      
#declare arm =
    union {
        #declare joint = <0,0,0>;
        #declare step = 0;
        #while (step < 10)
        	#declare delta = vnormalize(<1,1,step>);
          	cylinder {
            	joint,  
        	    joint + delta,
        	    0.2
        	}      
        	sphere
        	{
        		joint + delta,
        		0.2		
        	}
        	#declare joint = joint + delta;
        	#declare step = step + 1;   // increment our counter
        #end       
    }
 
union {                    
	#declare xrot = 0;
	#while (xrot < 360)
		#declare xrot = xrot + 45;
		#declare yrot = 0;
		#while (yrot < 360)
		 	object { arm rotate<xrot, yrot,0> }
			#declare yrot = yrot + 45;		
		#end
	#end
	sphere { <0,0,0> 1	}
    texture { Gold_Nugget }
}                       

