// Idea: Two spirals "snakes" that merge together and curl around each other
// They grow from ground from two different points
// They have some similar properties, some different 
// But like the fanfare vase
// Blob?

                       
                            
                            
camera { location <0,10,-50> right 0.75*x direction 2*z look_at <0,10,0>}


plane { y, 0 pigment { color rgb<1,1,1> } }                

light_source { <50,40,0> color rgb<1,1,1> }

                                                
#declare points = 100;                                                

#macro lover()
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
            #local _thickness  = from_top*from_top*2.0 + 0.05;
            <sin(spin) * rad, yy, cos(spin) * rad>, _thickness
            #local spin = spin + from_bottom * 0.2;
            #local yy = yy + rad * 0.12;
            #local point = point + 1;   
        #end     
    }
#end

object { 
    lover( )
    pigment { color rgb<1,0.4,0.4> }
    rotate y*90        
    // Idead: color to change along y-axis (moods change)
}

object { 
    lover( )   
    pigment { color rgb<0,0,1> }                         
    // Idead: color to change along y-axis (moods change)
    rotate y*270
}