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
    pigment {
        gradient y
        color_map {
            [ 0.0 color rgb<0,0,0> ]
            [ 0.5 color rgb<1,0,0> ]
            [ 1.0 color rgb<1,1,1> ]
        }                              
    }
    pigment {
        leopard 
        color_map {
            [ 0.0 color rgbf<0,0,0,1> ]
            //[ 0.4 color rgbf<0,0,0,0> ]
            [ 0.6 color rgbf<1,0,0,0> ]
            [ 0.8 color rgbf<1,1,0,0> ]
            [ 1.0 color rgbf<1,1,1,0> ]
        }          
        scale 0.025                    
        rotate <20,20,5>   
    }
}
                            
camera { location <0,7,-50> right x/1.5 direction 2*z look_at <-0.5,11,0>}


plane { y, 0 
    pigment { 
        checker
        color rgb<1,1,1>
        color rgb<0.8,0.8,0.8>  
        scale 10
        rotate y*20
    }          
    finish {
        ambient 0
        reflection 0.3
        diffuse 0.7
    }
}                

light_source { 
      <0,0,0> color rgb<1,1,1>   
      area_light
      <8, 0, 0> <0, 8, 0> // lights spread out across this distance (x * z)
      8, 8                // total number of lights in grid (4x*4z = 16 lights)
      adaptive 1          // 0,1,2,3...
      jitter              // adds random softening of light
      circular            // make the shape of the light circular
      orient              // orient light
      translate <20, 40, -40>   // <x y z> position of light
}

                                                
#declare points = 100;                                                

#macro lover(base_thickness)
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
            #local rad = from_top*from_top*2.2 + from_middle*from_middle*15 + 0.2;
            #local _thickness  = from_top*from_top*base_thickness + 0.05;
            <sin(spin) * rad, yy, cos(spin) * rad>, _thickness
            #local spin = spin + 0.1 + from_bottom*0.8 - from_bottom*from_bottom*0.8;
            #local yy = yy + rad * 0.11;
            #local point = point + 1;   
        #end             
    }
#end

object {  // Diana 
    lover( 1.6 )
    material { 
        texture { Glass3 pigment { rgbf <1.0, 0.3, 0.3, 0.9> } }
        interior { ior 1.2 }
    }
    rotate y*70  
}

object {  // Robert
    lover( 2.2 )   
    rotate y*250
    texture {         
        pigment { rgb <1, 1, 0.2> } 
        finish { reflection 0.6 diffuse 0.4 }
    }
}                            

