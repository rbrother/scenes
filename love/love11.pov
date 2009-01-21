// Idea: Two spirals "snakes" that merge together and curl around each other
// They grow from ground from two different points
// They have some similar properties, some different 
// But like the fanfare vase
// Blob?
                    
#include "colors.inc"                    
#include "skies.inc"                       

sky_sphere { S_Cloud5 }
                            
camera { location <0,10,-50> right 0.75*x direction 2*z look_at <0,10,0>}


plane { y, 0 
    pigment { 
        checker
        color rgb<1,1,1>
        color rgb<0.8,0.8,0.8>  
        scale 5
    }          
    finish {
        ambient 0
        reflection 0.3
        diffuse 0.7
    }
}                

light_source { <50,40,0> color rgb<1,1,1> }

                                                
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
            #local rad = from_top*from_top*2.0 + from_middle*from_middle*15 - 0;
            #local _thickness  = from_top*from_top*base_thickness + 0.05;
            <sin(spin) * rad, yy, cos(spin) * rad>, _thickness
            #local spin = spin + 0.1 + from_bottom*0.8 - from_bottom*from_bottom*0.8;
            #local yy = yy + rad * 0.12;
            #local point = point + 1;   
        #end     
        finish { reflection 0.4 diffuse 0.6 phong 1 }
    }
#end

object {  // Diana 
    lover( 1.8 )
    pigment {  
        gradient y   
        color_map {
            [ 0.0 color rgb<0.2,0,0>]
            [ 0.2 color rgb<1,0,0>]
            [ 0.5 color rgb<1,0.5,0.5>]
            [ 0.8 color rgb<1,0,0>]
            [ 1.0 color rgb<0.2,0,0>]
        }          
        scale 4                
        rotate <20,0,-15>        
    }                         
    rotate y*90        
    // Idead: color to change along y-axis (moods change)
}

object {  // Robert
    lover( 2.2 )   
    pigment {  
        gradient y   
        color_map {
            [ 0.0 color rgb<0,0,0.2>]
            [ 0.2 color rgb<0,0,1>]
            [ 0.5 color rgb<0.5,0.5,1>]
            [ 0.8 color rgb<0,0,1>]
            [ 1.0 color rgb<0,0,0.2>]
        }          
        scale 5                
        rotate z*20
    }                         
    rotate y*270
}