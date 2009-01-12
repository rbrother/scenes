// Idea: Two spirals "snakes" that merge together and curl around each other
// They grow from ground from two different points
// They have some similar properties, some different 
// But like the fanfare vase
// Blob?

                       
                            
                            
camera { location <0,10,-50> right 0.75*x direction 2*z look_at <0,10,0>}


plane { y, 0 pigment { color rgb<1,1,1> } }                

light_source { <50,40,0> color rgb<1,1,1> }

                                                
#declare points = 100;                                                

#declare lover = sphere_sweep {
  cubic_spline
  points,
  #declare point = 0;                  
  #declare spin = 0;
  #while ( point < points)           
        #declare from_top = (points-point);
        #declare rad = (cos(point*0.045)+1.1)*4.0;
        #declare _thickness  = rad*0.1 + from_top*0.01;
        <sin(spin) * rad, point * 0.2, cos(spin) * rad>, _thickness
        #declare point = point + 1;   
        #declare spin = spin + (1/(rad+0.1))*0.5;
  #end                                            
}
  
object { lover
        pigment { color rgb<1,0,0> }  
}

object { lover
        pigment { color rgb<1,1,0> }  
        rotate y*180
}