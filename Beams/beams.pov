#include "colors.inc"
            
#declare floor_plane  = box { <-5, -0.1, -5>, <5, 0, 5> }            
#declare wall = box { <-5, 0, -5>, <5, 3, -5> }
            
#declare roomBox = union  
{
	object { floor_plane }
	difference
	{
		object { floor_plane translate y*3 }       
		box { <-2,2.8,-2>, <2,3.2,2> }
	}
	object { wall }
	object { wall rotate 90*y }
	object { wall rotate 180*y }
	object { wall rotate 270*y }
}                  
                                                
object { 
	roomBox 
	texture
	{
		pigment
		{        
			checker
			color<1,1,1>
			color<0.8,0.8,0.8>           
		}
	}
}

light_source 
{
	<0,2,-4>
	color White
}

camera {
	location  < -4,1,-4 >
	direction < 0,0,1.4>
	up        < 0.0, 1.0, 0.0>
	right     < 1.333, 0.0, 0.0>
	look_at   < 0, 1, 0 >
}

