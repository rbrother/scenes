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



// Materials from previous exports [MRY]

// Materials exported in this run [MRY]



//  $MRY$: 'Chrome'


#declare Chrome = 
   material  // Chrome
   {   
      texture
      {      
         pigment
         {
            color rgb <1.0, 1.0, 1.0>
         }      
         finish
         {
            ambient 0.1
            diffuse 0.5
            specular 0.5
            reflection
            {
               1.0 , 1.0
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Rosewood'


#declare _auto_name_no_1_ = 
   texture  // txt_26
   {   
      pigment
      {
         bozo
         color_map
         {
            [ 0.0     rgbft <0.204, 0.11, 0.078, 0.0, 0.0> ]
            [ 0.256   rgbft <0.231, 0.125, 0.09, 0.0, 0.0> ]
            [ 0.393   rgbft <0.247, 0.133, 0.09, 0.0, 0.0> ]
            [ 0.581   rgbft <0.204, 0.11, 0.075, 0.0, 0.0> ]
            [ 0.726   rgbft <0.259, 0.122, 0.102, 0.0, 0.0> ]
            [ 0.983   rgbft <0.231, 0.125, 0.086, 0.0, 0.0> ]
            [ 1.0     rgbft <0.204, 0.11, 0.078, 0.0, 0.0> ]
         }
         turbulence 0.04
         ramp_wave
         scale  <0.5, 0.5, 1.0>
         translate 10.0 * x
      }   
      finish
      {
         ambient 0.5
         diffuse 0.8
      }
   }
   texture  // txt_27
   {   
      pigment
      {
         wood
         color_map
         {
            [ 0.0     rgbft <0.545, 0.349, 0.247, 1.0, 0.0> ]
            [ 0.139   rgbft <0.0, 0.0, 0.0, 0.004, 0.0> ]
            [ 0.148   rgbft <0.0, 0.0, 0.0, 0.004, 0.0> ]
            [ 0.287   rgbft <0.545, 0.349, 0.247, 1.0, 0.0> ]
            [ 0.443   rgbft <0.545, 0.349, 0.247, 1.0, 0.0> ]
            [ 0.626   rgbft <0.0, 0.0, 0.0, 0.004, 0.0> ]
            [ 0.635   rgbft <0.0, 0.0, 0.0, 0.004, 0.0> ]
            [ 0.843   rgbft <0.545, 0.349, 0.247, 1.0, 0.0> ]
            [ 1.0     rgbft <0.545, 0.349, 0.247, 1.0, 0.0> ]
         }
         turbulence 0.04
         ramp_wave
         scale  <0.5, 0.5, 1.0>
         translate 10.0 * x
      }   
      finish
      {
         ambient 0.5
         diffuse 0.8
      }
   }

#declare Rosewood = 
   material  // Rosewood
   {   
      texture { _auto_name_no_1_ }
   }


//  $MRY$: 'Maple'


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

#declare Maple = 
   material  // Maple
   {   
      texture { _auto_name_no_1_ }
   }


//  $MRY$: 'DeepBlue'


#declare DeepBlue = 
   material  // DeepBlue
   {   
      texture
      {      
         pigment
         {
            color rgb <0.0, 0.25, 0.5>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 1.0
            reflection
            {
               0.2 , 0.2
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Ecail'


#declare Ecail = 
   material  // Ecail
   {   
      texture
      {      
         pigment
         {
            agate
            agate_turb 1.0
            color_map
            {
               [ 0.0     rgbft <0.8, 0.8, 0.8, 0.0, 0.0> ]
               [ 1.0     rgbft <1.0, 1.0, 1.0, 0.0, 0.0> ]
            }
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 1.0
         }
      }
   }


//  $MRY$: 'Noir_Plastique'


#declare Noir_Plastique = 
   material  // Noir_Plastique
   {   
      texture
      {      
         pigment
         {
            color rgb <0.0, 0.0, 0.0>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 0.5
            reflection
            {
               0.3 , 0.3
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Noir'


#declare Noir = 
   material  // Noir
   {   
      texture
      {      
         pigment
         {
            color rgb <0.0, 0.0, 0.0>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 0.5
         }
      }
   }


//  $MRY$: 'Or'


#declare Or = 
   material  // Or
   {   
      texture
      {      
         pigment
         {
            color rgb <0.8, 0.6, 0.0>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 0.5
            reflection
            {
               0.5 , 0.5
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }


//  $MRY$: 'Blanc'


#declare Blanc = 
   material  // Blanc
   {   
      texture
      {      
         pigment
         {
            color rgbf <1.0, 1.0, 1.0, 0.2>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
         }
      }
   }


//  $MRY$: 'Noir_Metal'


#declare Noir_Metal = 
   material  // Noir_Metal
   {   
      texture
      {      
         pigment
         {
            color rgb <0.0, 0.0, 0.0>
         }      
         finish
         {
            ambient 0.1
            diffuse 1.0
            specular 0.5
            reflection
            {
               0.5 , 0.5
               fresnel  off
               falloff  1.0
               exponent 1.0
               metallic 0.0
            }
         }
      }
   }
