// Idea: Two spirals "snakes" that merge together and curl around each other
// They grow from ground from two different points
// They have some similar properties, some different 
// But like the fanfare vase
// Blob?
                    
#include "colors.inc"                    
#include "skies.inc"                       
#include "textures.inc"

global_settings {
    max_trace_level 10
}

sky_sphere { 
    pigment
    {
        image_map
        {
            "T:\photos\0000_Kokoelmat\avaruus\hs-2009-02-a-hires2.jpg"
            map_type 0 // plane
        }
        //[PIGMENT_MODFIERS...]   
        translate <-0.5, -1.1, 0>
        scale 0.7
        scale <2,1,1>
    }
    pigment {
        gradient y
        color_map {
            [ 0.0 color rgbf<1,1,1,0> ]
            [ 0.2 color rgbf<0,0,0,1> ]
            [ 0.5 color rgbf<0,0,0,0> ]
            [ 0.8 color rgbf<0,0,0,1> ]
            [ 1.0 color rgbf<1,1,1,0> ]
        }        
        translate -0.55*y      
        scale 2.0
    }                                        
}



                            
camera { location <0,3,-50> right 0.75*x direction 2*z look_at <0,13,0>}


// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <20, 40, 0>
}
                
                
                
               
               

light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-20, 0, -10>
}


                                               
#declare points = 100;                                                

#macro lover(base_thickness, rad_mult, height_mult)
    sphere_sweep {
        cubic_spline
        points,
        #local point = 0;                  
        #local spin = 0;                 
        #local yy = -1.0;
        #while ( point < points)                
            #local from_bottom = point/points;
            #local from_top = 1.0-from_bottom;
            #local from_middle = 0.5-from_bottom;
            #local rad = (from_top*from_top*2.2 + from_middle*from_middle*15 + 0.3) * rad_mult;
            #local _thickness  = from_top*from_top*base_thickness + 0.05;
            <sin(spin) * rad, yy, cos(spin) * rad>, _thickness
            #local spin = spin + 0.1 + from_bottom*0.8 - from_bottom*from_bottom*0.8;
            #local yy = yy + rad * height_mult;
            #local point = point + 1;   
        #end             
    }
#end

object {  // Mom
    lover( 1.5, 1.5, 0.066 )
    texture {         
        pigment { rgb <1.0, 0.3, 0.2> } 
        finish { reflection 0.6 diffuse 0.4 }
    }
    rotate y*30  
}

object {  // Dad
    lover( 1.8, 1.5, 0.066 )   
    rotate y*210
    texture {         
        pigment { rgb <1, 1, 1> } 
        finish { reflection 0.6 diffuse 0.4 }
    }
}                            

object {  // Diana
    lover( 1.3, 0.5, 0.24 )   
    rotate y*0
    material { 
        texture { 
            pigment { rgbf <1.0, 0.3, 0.0, 0.9> } 
            finish {
                diffuse 0.3 ambient 0.0 reflection 0.3
            }
        }
        interior { ior 1.2 }
    }
}                            

