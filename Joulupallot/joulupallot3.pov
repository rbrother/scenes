// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.5
// Desc: Checkered Floor Example
// Date: mm/dd/yy
// Auth: ?
//

#version 3.5;

#include "colors.inc"
// several different gold colors, finishes and textures
#include "golds.inc"

// various metal colors, finishes and textures
// brass, copper, chrome, silver
#include "metals.inc"


global_settings {
  assumed_gamma 2.0
  max_trace_level 5
}

// ----------------------------------------

camera {
  location  <0.0, 0, -6>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>*0.5  // light's color
  translate <-4,6,-4>
}                     

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 0.5>*0.5  // light's color
  translate <4,0,-2>
}                     


#declare kuusi_pigment =
pigment
{
        image_map { jpeg "kuusi4.jpg" }        
        translate <0.5,-0.5,0>
        scale <4/3,1,1>
        scale 1
}

#declare kynttila_pigment =
pigment
{
        image_map { jpeg "kynttila.jpg" }
        translate <0.5,-0.5,0>
        scale <4/3,1,1>
        scale 3
}

#declare arttu_pigment =
pigment
{
        image_map { jpeg "arttu.jpg" }
        translate < -0.5, -0.5, 0.0>
        scale 4        
}
                                 
        
#declare kuusi_tausta =         
sphere { <0,0,0> 1 
        pigment
        {                 
                gradient -z                 
                pigment_map
                {   
                        [ 0.0 kuusi_pigment ]
                        [ 0.2 kuusi_pigment ]
                        [ 0.5 color rgb<0.2,0.2,0.2>]
                        [ 1.0 arttu_pigment ]
                }           
                translate -0.5*z   
                scale <0.5, 0.5, 2.0>
        } 
        finish 
        {
                diffuse 0.0
                ambient 1.0
        }             
        scale 8   
        scale <2.5,2.5,1>        
        hollow                   
}
        
object { kuusi_tausta }

                         
// ----------------------------------------


#declare Loop = union {
  intersection { torus { 1.5, 0.5 } plane { < -1, 0, 0 > 0 } }
  cylinder { < 0, 0, 1.5 >, < -2, 0, 1.5 >, 0.5 }
  cylinder { < 0, 0, -1.5 >, < -2, 0, -1.5 >, 0.5 }
  intersection {
    torus { 1.5, 0.5 }
    plane { < 1, 0, 0 > 0 }
    translate < -2, 0, 0 >
  }
  translate < 1, 0, 0 >
}

#declare TwoLoops = union {
  object { Loop }
  object { Loop rotate < 90, 0, 0 > translate < 4, 0, 0> }
}

#declare Chain = union {
        // Create 10 balls along X axis, from 0 to 9
        #declare i = 0;
        #while (i < 10)
          object { TwoLoops translate < i*8, 0, 0 > }
          #declare i = i + 1;   // increment our counter
        #end
  texture { 
        pigment { color White }
        finish { ambient 0.0 diffuse 0.8 reflection 0.6 phong 1.0 }
  }
  rotate z*90    
  scale 0.4            
  rotate y*25
  scale <0.1,0.1,0.1> 
}

#macro joulupallo(pallo_koko, sijainti)
union
{
        object { Chain translate y * pallo_koko }   
        difference
        {       
                union
                {
                        sphere { 0.0, 1.0 }      
                        torus { 0.84 0.05 translate <0,0.5,0>  }
                        torus { 0.84 0.05 translate <0,-0.5,0>  }
                        sphere { <0,0,0> 0.15 translate y*1.0 }
                }
                torus { 0.85 0.07 translate <0,0.6,0> }
                torus { 0.85 0.07 translate <0,-0.6,0> }
                texture {
                        pigment { color White }        
                        finish
                        {    
                              diffuse 0.8
                              ambient 0.2
                              specular 1.0 
                              roughness 0.01
                              reflection { 0.4 }
                              conserve_energy
                        }         
                }
                scale pallo_koko
        } // difference        
        translate sijainti
}
#end

joulupallo(0.8, <-1.5 , 1.0, 0.0> )

joulupallo(0.8, <-1.5, -1.0, 0.0> )

joulupallo(0.8, <1.5, 1.0, 0.0> )

joulupallo(0.8, <1.5, -1.0, 0.0> )