#include "colors.inc"
#include "woods.inc"

global_settings { max_trace_level 7 }

camera 
{
  location  < 0, 70, -210 >
  direction < 0,0,1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < -15, 20, 0>
}

light_source 
{
	<0,400,-200>
	color White*0.8
	area_light 80*x, 80*z, 9, 9
	adaptive 1
	spotlight
	radius 15
	falloff 20
	point_at <0,0,80>
	rotate y*30
}

light_source
{
	<300, 100, 0 >
	color White*0.5
	area_light 60*z, 60*y, 9, 9
	adaptive 1
}

plane 
{ 
	y, 0
	pigment { White }
	finish { ambient 0 diffuse 0.6 brilliance 0.6 reflection 0.4 }
	rotate 20*y
	hollow
}

sky_sphere 
{
  pigment 
  {
    gradient y
    color_map 
    {
      [ 0 color Black ] [ 1 color White ]
    }
  }
}

#declare vanne =
// torus {MAJOR, MINOR} // (in the X-Z plane)
// MAJOR = float value giving the major radius
// MINOR = float specifying the minor radius
// The major radius extends from the center of the hole
// to the mid-line of the rim while the minor radius
// is the radius of the cross-section of the rim.
torus {
  41.5,
  3
}
              
#declare petanque_ball =
difference
{
	sphere 
	{ 
		<0,0,0> 1 
		scale 40		
	}              
	object { vanne }
	object { vanne rotate x*90 }    
	object { vanne rotate z*90 }    		    
	object { vanne rotate x*45 }    
	object { vanne rotate z*45 }    		    
	object { vanne rotate x*135 }    
	object { vanne rotate z*135 }    		    
	rotate <30, 40, 10>
	translate <0,40,0>		
} 

              
#declare ball1 =
object
{
	petanque_ball
	texture
	{
		pigment
		{
			color rgb<0.0, 0.2, 0.7>
		}
		finish
		{         
			phong 0.5       
			reflection 0.6
			ambient 0.0
			diffuse 0.6
		}
	}	                         	
}


object 
{ 
	ball1
 	translate <0,0,0>
}

object 
{ 
	ball1               
	rotate y*45
	scale 0.7
 	translate <-70,0,40>
}

object 
{ 
	ball1               
	rotate y*45
	scale 0.6
 	translate <-50,0,-120>
}
                      
sphere
{
	<0,0,0> 1
	texture 
	{ 
		T_Wood19 
		scale 3
		finish { reflection 0.2 }
		translate <0.0,0.6,0.0>
	}
	translate 1*y
	scale 15            
	translate <60,0,-20>	
}                      
                      
