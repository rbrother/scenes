#include "colors.inc"
#include "stones.inc"
#include "metals.inc"

global_settings { max_trace_level 7 }

camera 
{
  location  < 0, 70, -210 >
  direction < 0,0,1.4>
  up        < 0.0, 1.0, 0.0>
  right     < 1.333, 0.0, 0.0>
  look_at   < 0, 20, 0>
}

light_source 
{
	<0,400,-200>
	color White*1.0
	area_light 80*x, 80*z, 9, 9
	adaptive 1
	spotlight
	radius 15
	falloff 20
	point_at <0,0,80>
	rotate y*30
}

plane 
{ 
	y, 0
	pigment { White }
	finish { ambient 0 diffuse 1 brilliance 0.6 reflection 0.2 }
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

#declare ball1 =
sphere
{
	<0,0,0> 1
	translate <0,1,0>	
	texture
	{
		pigment
		{
			color Red     
		}
		finish
		{         
			phong 0.5       
			reflection 0.4
			ambient 0.0
			diffuse 1.0
		}
	}	               
	scale 40
}


object 
{ 
	ball1
 	translate <0,0,0>
}

