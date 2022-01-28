#include "colors.inc"               
#include "stones1.inc"
                         
#declare room_height = 2;             
#declare hole_size = 0.15;
        
global_settings        
{
	ambient_light 0
	radiosity { 
		brightness 3.0 
		count 100
	} 
}
                       
#declare grid = 
union
{
	#declare xx = -3;
	#while (xx < 3.1)
		#declare yy = -3;
		#while (yy < 3.1)
			box { <-hole_size, room_height - 0.2, -hole_size>, 
					<hole_size, room_height + 0.2, hole_size> 
				translate <xx * 0.5, 0, yy * 0.5>	
			}
			#declare yy = yy + 1;
		#end
		#declare xx = xx + 1;
	#end                    
	scale <0.7,1,0.7>
}
                                 
#declare cylinderA = cylinder { <0,0,0>,<0,room_height,0>, 4 };
                                 
#declare hollow_cylinder =
difference
{
	object { cylinderA scale 1.02 }
	object { cylinderA }
}
            
#declare roomBox = 
difference
{
	object { hollow_cylinder }
	object { grid }
}                  
                                                
object { 
	roomBox 
	texture 
	{ 
		T_Grnt11 
		finish { diffuse 1.0 ambient 0.0 }  		
	}
}                          

#declare weirdo = 
union
{
	sphere { <0,0,0> 1 } 
	#declare n1 = 0;
	#while (n1 < 64)
		sphere { <0,0,0> 1 scale 0.2 translate y*0.9 
			rotate <n1 * 7, n1*17, n1*27>          
		} 
		#declare n1 = n1 + 1;
	#end         
	translate y*1
}

object
{
	weirdo
	scale 0.8
	pigment { color rgb<1,1,1> }
	finish { diffuse 0.7 reflection 0.3 }
	
}

light_source 
{
	<0,room_height + 2.0,0>
	color White * 1.0
	area_light <0.3,0,0>, <0,0,0.3>, 10, 10
	adaptive 1
	jitter 
	circular
}

camera {
	location  < -3.8,0.5,0 >
	direction < 0,0,1.4>
	up        < 0.0, 1.0, 0.0>
	right     x*image_width/image_height
	look_at   < 0, 1, 0 >
	rotate y*30
}

