//  Material Include file.
//
//  This file was generated for POV-Ray V3.5 by
//  NOTE: Do *NOT* remove the comment lines containing '$MRY$'.
//        To make Moray not re-export the material, change
//        the '$MRY$' to '$MRX$'.
//


//
// ********  MATERIALS  *******
//



//  $MRY$: 'BlackWood'


#declare BlackWood = 
   material  // BlackWood
   {   
      texture
      {      
         pigment
         {
            color rgbf <0.395833, 0.216459, 0.221008, 0.0208>
         }      
         finish
         {
            ambient 0.503567
            diffuse 0.2158
            brilliance 6.315667
            phong 0.762567
            phong_size 71.52
            specular 0.4964
            reflection
            {
               0.0935 , 0.0935
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Scanner'


#declare Scanner = 
   material  // Scanner
   {   
      texture
      {      
         pigment
         {
            marble
            color_map
            {
               [ 0.0     rgbft <0.0104, 0.655, 0.9479, 0.0, 0.0> ]
               [ 0.05    rgbft <0.481, 0.5457, 0.843733, 0.0, 0.0> ]
               [ 0.16    rgbft <0.2517, 0.2356, 0.6608, 0.0, 0.0> ]
               [ 0.2     rgbft <0.1233, 0.1173, 0.2549, 0.0, 0.0> ]
               [ 0.5     rgbft <0.4906, 0.718733, 0.9375, 0.0, 0.0> ]
               [ 0.81    rgbft <1.0, 1.0, 1.0, 0.0, 0.0> ]
               [ 1.0     rgbft <0.0104, 0.270833, 0.5263, 0.0, 0.0> ]
            }
            turbulence 1.2
            octaves 4
            ramp_wave
         }      
         normal
         {
            bumps , 0.9
         }      
         finish
         {
            ambient 0.4
            phong 0.82
            phong_size 81.0
         }      
         scale  <20.0, 20.0, 1.0>
      }
   }


//  $MRY$: 'Chrome_Textur_Modif'


#declare Chrome_Textur_Modif = 
   material  // Chrome_Textur_Modif
   {   
      texture
      {      
         pigment
         {
            color rgb <0.658824, 0.658824, 0.658824>
         }      
         finish
         {
            ambient 0.0
            diffuse 0.2
            brilliance 6.0
            phong 0.95
            phong_size 4.173333
            specular 0.2
            roughness 0.01
            reflection
            {
               0.8 , 0.8
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Aluminum'


#declare Aluminum = 
   material  // Aluminum
   {   
      texture
      {      
         pigment
         {
            color rgb <0.55, 0.5, 0.45>
         }      
         finish
         {
            ambient 0.1
            diffuse 0.65
            brilliance 1.5
            specular 0.85
            roughness 0.01
            reflection
            {
               0.45 , 0.45
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Plastik_Fell_Other'


#declare Plastik_Fell_Other = 
   material  // Plastik_Fell_Other
   {   
      texture
      {      
         pigment
         {
            color rgbf <0.6979, 0.875, 1.0, 0.666667>
         }      
         finish
         {
            ambient 0.258967
            diffuse 0.1007
            phong 0.661867
            reflection
            {
               0.136667 , 0.136667
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Scanner_Tube_Modif'


#declare Scanner_Tube_Modif = 
   material  // Scanner_Tube_Modif
   {   
      texture
      {      
         pigment
         {
            marble
            color_map
            {
               [ 0.0     rgbft <0.0104, 0.655, 0.9479, 0.0, 0.0> ]
               [ 0.05    rgbft <0.481, 0.5457, 0.843733, 0.0, 0.0> ]
               [ 0.16    rgbft <0.2517, 0.2356, 0.6608, 0.0, 0.0> ]
               [ 0.2     rgbft <0.1233, 0.1173, 0.2549, 0.0, 0.0> ]
               [ 0.5     rgbft <0.4906, 0.718733, 0.9375, 0.0, 0.0> ]
               [ 0.81    rgbft <1.0, 1.0, 1.0, 0.0, 0.0> ]
               [ 1.0     rgbft <0.0104, 0.270833, 0.5263, 0.0, 0.0> ]
            }
            turbulence 1.2
            octaves 4
            ramp_wave
         }      
         normal
         {
            bumps , 0.9
         }      
         finish
         {
            ambient 0.4
            phong 0.82
            phong_size 81.0
            reflection
            {
               0.0935 , 0.0935
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }      
         scale  <10.0, 10.0, 1.0>
         rotate    <-90.0, 0.0, -90.0>
      }
   }


//  $MRY$: 'Maple_Tube_Inn'


#declare _auto_name_no_1_ = 
   texture  // txt_175
   {   
      pigment
      {
         wood
         color_map
         {
            [ 0.0     rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
            [ 0.133   rgbft <0.706, 0.518, 0.235, 0.0, 0.0> ]
            [ 0.23    rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
            [ 0.336   rgbft <0.706, 0.518, 0.235, 0.0, 0.0> ]
            [ 0.442   rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
            [ 0.549   rgbft <0.706, 0.518, 0.235, 0.0, 0.0> ]
            [ 0.646   rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
            [ 0.743   rgbft <0.706, 0.518, 0.235, 0.0, 0.0> ]
            [ 0.85    rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
            [ 0.947   rgbft <0.706, 0.518, 0.235, 0.0, 0.0> ]
            [ 1.0     rgbft <0.796, 0.796, 0.384, 0.0, 0.0> ]
         }
         turbulence 0.1
         ramp_wave
         scale  <2.0, 2.0, 15.0>
         rotate 90.0 * z
         translate    <-8.0, 80.0, 0.0>
      }   
      finish
      {
         ambient 0.2
         diffuse 0.8
      }
   }
   texture  // txt_176
   {   
      pigment
      {
         bozo
         color_map
         {
            [ 0.0     rgbft <1.0, 1.0, 0.439, 1.0, 0.0> ]
            [ 0.008   rgbft <1.0, 1.0, 0.439, 1.0, 0.0> ]
            [ 0.508   rgbft <1.0, 1.0, 0.439, 0.4, 0.0> ]
            [ 1.0     rgbft <1.0, 1.0, 0.439, 1.0, 0.0> ]
         }
         scale  <1.5, 1.5, 0.375>
         rotate 90.0 * z
      }   
      finish
      {
         ambient 0.2
         diffuse 0.8
      }
   }

#declare Maple_Tube_Inn = 
   material  // Maple_Tube_Inn
   {   
      texture { _auto_name_no_1_ }
   }


//  $MRY$: 'Filz_Texture'


#declare Filz_Texture = 
   material  // Filz_Texture
   {   
      texture
      {      
         pigment
         {
            color rgb <1.0, 1.0, 0.593733>
         }      
         normal
         {
            waves , 0.6
            bump_size 0.1
         }
      }
   }


//  $MRY$: 'Aluminum_Act'


#declare Aluminum_Act = 
   material  // Aluminum_Act
   {   
      texture
      {      
         pigment
         {
            color rgb <0.55, 0.5, 0.45>
         }      
         finish
         {
            ambient 0.7
            diffuse 0.65
            brilliance 7.6
            phong_size 0.0
            specular 0.3
            roughness 0.3
         }
      }
   }


//  $MRY$: 'Plastic_1'


#declare Plastic_1 = 
   material  // Plastic_1
   {   
      texture
      {      
         pigment
         {
            color rgb <0.0, 0.0, 0.114567>
         }      
         finish
         {
            ambient 0.7194
            diffuse 0.251767
            phong 1.0
            phong_size 9.933333
            specular 0.194233
         }
      }
   }


//  $MRY$: 'Zymbal_Texture'


#declare Zymbal_Texture = 
   material  // Zymbal_Texture
   {   
      texture
      {      
         pigment
         {
            onion
            color_map
            {
               [ 0.0     rgbft <0.6875, 0.5104, 0.0, 0.0, 0.0> ]
               [ 0.494662  rgbft <0.878431, 0.776471, 0.607843, 0.0, 0.0> ]
               [ 0.508897  rgbft <0.0104, 0.0, 0.0104, 0.0, 0.0> ]
               [ 0.508897  rgbft <0.479167, 0.406233, 0.218733, 0.0, 0.0> ]
               [ 1.0     rgbft <0.6875, 0.541667, 0.104167, 0.0, 0.0> ]
            }
            scale  <0.2, 0.2, 0.05>
            rotate -90.0 * z
            translate 1.0 * z
         }      
         finish
         {
            ambient 0.5
            diffuse 0.2
            brilliance 9.0
            phong 0.381267
            phong_size 20.0
            specular 0.5
            roughness 0.2
            metallic 0.3
            crand 0.1
            reflection
            {
               0.1 , 0.1
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
            irid
            {
               0.5
               thickness 2.0
               turbulence <2.0, 2.0, 1.0>               
            }
         }
      }   
      interior
      {
         ior 0.0
         fade_distance 1.0
         fade_power 2.0
      }
   }


//  $MRY$: 'Black_White_Cow'


#declare Black_White_Cow = 
   material  // Black_White_Cow
   {   
      texture
      {      
         pigment
         {
            bozo
            color_map
            {
               [ 0.0     rgbft <0.0, 0.0, 0.0, 0.0, 0.0> ]
               [ 1.0     rgbft <0.0, 0.0, 0.0, 0.0, 0.0> ]
            }
            turbulence 0.9
            ramp_wave
         }      
         normal
         {
            bumps , 0.4
            scale  0.0001
         }      
         finish
         {
            ambient 0.4
            phong 0.2
         }
      }
   }


//  $MRY$: 'White_Plast'


#declare White_Plast = 
   material  // White_Plast
   {   
      texture
      {      
         pigment
         {
            color rgb <0.956765, 0.943254, 0.834902>
         }      
         finish
         {
            ambient 0.194233
            phong_size 0.66
            specular 0.1
            roughness 0.3
         }
      }
   }


//  $MRY$: 'Aluminum_1'


#declare Aluminum_1 = 
   material  // Aluminum_1
   {   
      texture
      {      
         pigment
         {
            color rgb <0.55, 0.5, 0.45>
         }      
         finish
         {
            ambient 1.0
            diffuse 0.65
            brilliance 7.593667
            phong_size 0.0
            specular 0.007167
            roughness 0.270667
            crand 0.1151
         }
      }
   }


//  $MRY$: 'Plastik_Fell_Snare'


#declare Plastik_Fell_Snare = 
   material  // Plastik_Fell_Snare
   {   
      texture
      {      
         pigment
         {
            color rgbf <0.906233, 0.906233, 0.906233, 0.666667>
         }      
         finish
         {
            ambient 0.4964
            diffuse 0.1007
            phong 0.661867
            reflection
            {
               0.136667 , 0.136667
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Jurit_Texture'


#declare Jurit_Texture = 
   material  // Jurit_Texture
   {   
      texture
      {      
         pigment
         {
            color rgb <0.823529, 0.403922, 0.301961>
         }
      }
   }


//  $MRY$: 'Sit_Texture'


#declare Sit_Texture = 
   material  // Sit_Texture
   {   
      texture
      {      
         pigment
         {
            color rgb <0.6458, 0.012512, 0.0>
         }      
         normal
         {
            agate , 0.1
            agate_turb 2.0
         }      
         finish
         {
            ambient 0.1
            specular 0.3453
         }
      }
   }


//  $MRY$: 'Sit_Texture_1'


#declare Sit_Texture_1 = 
   material  // Sit_Texture_1
   {   
      texture
      {      
         pigment
         {
            color rgb <0.6458, 0.0, 0.0>
         }      
         finish
         {
            ambient 0.1
            specular 0.424433
         }
      }
   }


//  $MRY$: 'Hammerschlag'


#declare Hammerschlag = 
   material  // Hammerschlag
   {   
      texture
      {      
         pigment
         {
            color rgb <0.501961, 0.501961, 0.501961>
         }      
         normal
         {
            wrinkles , 0.8
            scale  0.1
         }
      }
   }
