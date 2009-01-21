// ==== Standard POV-Ray Includes ====
#include "colors.inc"	  // Standard Color definitions
#include "textures.inc"	  // Standard Texture definitions
#include "functions.inc"  // internal functions usable in user defined functions



// TODO:

// Photoshop-käsittely:
// - Levels
// - soft-Blur aura neonvalolle ja lampuille


#declare arealights = true;

// Water     
plane
{
        y, -0.5
        texture
        {
                pigment { color Blue }
                finish { ambient 0 diffuse 0 reflection 0.7 }
                normal { // pattern for use in texture/pigment/normal/density

                   spotted 1.0        // create a spotted texture
                } 
                scale 2
        }
}
        

sphere
{
        <500,1000,7000>, 500
        pigment 
        { 
                marble   
                turbulence 1.5
                // texture pigment {} attribute
                // create a smooth color gradation map
                color_map {
                  //  [ END_VAL color red R green G blue B filter F transmit T]
                  [ 0.0  color White ]
                  [ 1.0  color White*0.8]
                  // (---alternative form---)
                  //[ 1.0  color rgbf <0.8, 0.8, 0.8, 1.0> ]
                } // color_map
                scale 400

        }
        finish { ambient 1 diffuse 0 }
}        

// Floor      
union
{    
        box{ <-200, -10, -200>, <-3, 0.3, 200> }
        box{ <-200, -10, -200>, <1, 0.1, 200> }
        box{ <-200, -10, -200>, <1.4, 0.0, 200> }
        box{ <-200, -10, -200>, <1.8, -0.1, 200> }
        
        pigment 
        { 
                // pattern for use in texture/pigment/normal/density
                  spotted        // create a spotted texture
  
                // create a smooth color gradation map
                color_map {
                  //  [ END_VAL color red R green G blue B filter F transmit T]
                  [ 0.0  color White*0.2]
                  [ 1.0  color White*0.5]
                } // color_map
        }
        normal
        {
                // pattern for use in texture/pigment/normal/density
                  granite  0.2      // create a granite-like texture
         }        
         finish { ambient 0.2 diffuse 1 }
}   
       
      
       
// Wall
box {
  <-20, 0, 100>  // one corner position <X1 Y1 Z1>
  < -5, 15,  -200>  // other corner position <X2 Y2 Z2>
  pigment 
  {                
        // solid pattern for use in texture/pigment/normal(/density)
  // brick pattern generates a brick wall like structure
  brick      
  color White*0.1,          // color of mortar
  color rgb<0.4,0.4 ,0.5>            // color of brick
  brick_size <8,1,3>   // size of brick    (optional)
  mortar     0.2       // width of mortar  (optional)
  scale 0.2
  }         
  normal
  {
        granite 0.5   // create a wrinkly surface (0...1 or more)
        scale 0.5
   }
        
  finish { ambient 0 diffuse 1 }
}   

// create a TrueType text shape
text {
  ttf             // font type (only TrueType format for now)
  "EKLEKTCN.TTF",  // Microsoft Windows-format TrueType font file name
  "Q-Visio",      // the string to create
  0.05,              // the extrusion depth
  <0,0,0>               // inter-character spacing
  
  pigment { color rgb<1,0,1> }
  finish { ambient 1 diffuse 0 }
  scale 5   
  scale <1.5,1,1>
  rotate -y*90
  translate <-4.999,8,5>
}



// perspective (default) camera
camera {
  location  <2.5, 1.0, -10.0>
  look_at   <0.0, 2.0,  0.0>
  right     x*image_width/image_height
}
            

// TODO: Make a "halo" of light surrounding the lights.
// could be made with "media"
#declare sphereLight =
light_source {
  0*x                  // light's position (translated below)
  color rgb White * 3.0    // light's color
  fade_distance 2
  fade_power 2  
                    
  #if (arealights)
          area_light
          <-0.2, 0, -0.2> <0.2, 0, 0.2> // lights spread out across this distance (x * z)
          8, 8                // total number of lights in grid (4x*4z = 16 lights)  
          adaptive 0          // 0,1,2,3...
          jitter              // adds random softening of light
          circular            // make the shape of the light circular                 
  #end

  looks_like { 
        sphere { 0, 0.2 
                pigment {  
                        granite
                        // texture pigment {} attribute
                        // create a smooth color gradation map
                        color_map {
                          //  [ END_VAL color red R green G blue B filter F transmit T]
                          [ 0.0  color White ]
                          [ 1.0  color White*0.7 ]
                          // (---alternative form---)
                          //[ 1.0  color rgbf <0.8, 0.8, 0.8, 1.0> ]
                        } // color_map             
                        scale 0.3

                } 
                finish { ambient 1.2 diffuse 0}
                hollow
        } 
  }                
  
}      
    
      

#declare lamp = union
{
       cylinder { <0,0,0>, <0,3,0>, 0.1 }
       difference
       {
               torus { 0.5, 0.1 
                rotate x*90
                
               }
               plane { y,0 }
               translate <0.5,3.0,0>
       }           
       object { sphereLight translate <1.0, 2.9, 0> }
       pigment
       { 
        color White
       
       }                  
       finish
       {
          ambient 0
          diffuse 0.5
          reflection 0.3
          phong 0.5
          metallic 
       }
}                      

       
// Create an infinite sphere around scene and allow any pigment on it
sky_sphere {
  pigment {
    // pattern for use in texture/pigment/normal/density
          gradient y        // create a granite-like texture
       
    color_map { 
        [0.0 color rgb<0.6,0.6,0.4> ] 
        [0.3 color Black ] 
        [1.0 color Black ]  
    }                     
    turbulence 0.2
    translate y*(-0.1)

  }
  pigment {
    // pattern for use in texture/pigment/normal/density
        granite        // create a granite-like texture
       
    color_map { 
        [0.0 color rgbf<1,1,1,1> ] 
        [0.8 color rgbf<1,1,1,1> ] 
        [0.8 color White*0.7]
        [1.0 color White]  
    }       
    scale 0.03
  }
}   
     
             
              
//     media {..media items..} // sumusaarekkeet
        
#declare windowPane = box { <0,0,-0.01>, <0.5,0.8,0.01> }        

#declare window = union
{                  
        object { windowPane }
        object { windowPane translate <0.6, 0, 0> }
        object { windowPane translate <0, 0.9, 0> }
        object { windowPane translate <0.6, 0.9, 0> }
        box { <-0.1,-0.1,0>, <1.2,1.8,0.005> pigment { color Black }  }
        finish { ambient 1.2 diffuse 0 }
        rotate y*(-90)
       pigment 
       {
        bozo 
        color_map
        {
           [ 0.0 color rgb<1,1,0.6> ]
           [ 1.0 color rgb<1,1,0.6>*0.5 ]                 
        }                    
        scale 0.6
        
       }                              
}                 
                   


#declare winGroup =
union
{
       object { window translate <-4.99, 0.6, 0> }
       object { window translate <-4.99, 5, 3> }
       object { window scale 0.7 translate <-4.99, 3, 5> }
}

object { winGroup }
object { winGroup translate <0,1,8> }
object { winGroup translate <0,0,16> }
object { winGroup translate <0,1,24> }
object { winGroup translate <0,0,32> }
object { winGroup translate <0,1,40> }
object { winGroup translate <0,1,52> }

                
         
                             
#declare lamp_pos = -16;
#while (lamp_pos < 80)
        object
        {
                lamp
                translate <-3.5,0,lamp_pos>
        }
        #declare lamp_pos = lamp_pos + 8;   // increment our counter
#end
                             

          
                      
    
  
                   


