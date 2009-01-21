// Jalokivin koristeltu kulta-kruunu

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "shapes.inc"

#max_trace_level 4  // Nopeutusta

camera {
  location < 0, 10, -25 >
  direction < 0, 0, 2 >   // Kameran "linssinpituus"
  up < 0, 1, 0 >
  right <1.333, 0, 0 >
  look_at < 0, 9, 0 >
}

object {
  light_source { < 0, 30, 5 > color White }
}

object {
  light_source { < 5, 0, -50 > color White }
}

sphere { < 0, 0, 0 > 1
  texture {
    pigment {
      gradient < 0, 1, 0 >
      color_map {
	 [ 0.0 color White ] [ 0.3 color Blue ]
	 [ 7.0 color Black ] [ 1.0 color White ]
      }
      turbulence 0.6
    }
    finish {
      diffuse 0
      ambient 1
    }
  }
  scale 300
}

#declare RubyTexture = texture {
  pigment { color rgbf<1,0.3,0.3,0.9> }
  finish {
    refraction 1
    reflection 0.2
    diffuse 0.1
    ambient 0.1
    ior 1.8
    phong 1
    phong_size 120
  }
}

#declare RubyPlane1 = plane {
  < 0, -1, 0 > 0
  rotate < 0, 0, 35 >
  translate < 0.2, -0.2, 0 >
}

#declare RubyPlane2 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 45 >
  translate < 0.2, 0.7, 0 >
  rotate < 0, 30, 0 >
}

#declare RubyPlane3 = plane {
  < 0, 1, 0 > 0
  rotate < 0, 0, 75 >
  translate < -0.4, 0, 0 >
}


#declare Ruby = intersection {
  plane { < 0, -1, 0 > 0 translate < 0, -0.2, 0 > }
  object { RubyPlane1 rotate < 0, 0, 0 > }
  object { RubyPlane1 rotate < 0, 60, 0 > }
  object { RubyPlane1 rotate < 0, 120, 0 > }
  object { RubyPlane1 rotate < 0, 180, 0 > }
  object { RubyPlane1 rotate < 0, 240, 0 > }
  object { RubyPlane1 rotate < 0, 300, 0 > }
  object { RubyPlane2 rotate < 0, 0, 0 > }
  object { RubyPlane2 rotate < 0, 60, 0 > }
  object { RubyPlane2 rotate < 0, 120, 0 > }
  object { RubyPlane2 rotate < 0, 180, 0 > }
  object { RubyPlane2 rotate < 0, 240, 0 > }
  object { RubyPlane2 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 0, 0 > }
  object { RubyPlane3 rotate < 0, 30, 0 > }
  object { RubyPlane3 rotate < 0, 60, 0 > }
  object { RubyPlane3 rotate < 0, 90, 0 > }
  object { RubyPlane3 rotate < 0, 120, 0 > }
  object { RubyPlane3 rotate < 0, 150, 0 > }
  object { RubyPlane3 rotate < 0, 180, 0 > }
  object { RubyPlane3 rotate < 0, 210, 0 > }
  object { RubyPlane3 rotate < 0, 240, 0 > }
  object { RubyPlane3 rotate < 0, 270, 0 > }
  object { RubyPlane3 rotate < 0, 300, 0 > }
  object { RubyPlane3 rotate < 0, 330, 0 > }
  texture { RubyTexture }
  translate < 0, 0.2, 0 >
}

#declare Radius = 3;
#declare BaseHeight = 1;
#declare StickRadius = 0.22;

#declare GlassStick = merge {
  cylinder { < Radius-0.2, 0, 0 >, < Radius + 0.9, 2, 0 >, 0.2 }
  sphere { < Radius + 0.9, 2, 0 > 0.5
    texture { RubyTexture pigment { color rgbf<0.6,1,0.6,1> } }
  }
}

#declare SideJevel = union {
  cone { < Radius-0.1, 0, 0 >, 0.5, < Radius+0.4 0, 0 >, 0.2 }
  object { Ruby
    scale 0.8
    rotate < 0, 0, -90 >
    translate < Radius+0.4, 0, 0 >
    texture { RubyTexture }
  }
  bounded_by { box { < Radius-0.1, -0.5, -0.5>, < Radius+1.4, 0.5, 0.5> } }
}

#declare CrownClip =
  intersection {
    plane { x,0 rotate < 0, -15, 0 > }
    plane { -x,0 rotate < 0, 15, 0 > }
    translate < 0, 0, -0.3 >
}

#declare Crown = union {
  difference {
    cylinder { < 0, -BaseHeight/2, 0>, < 0, BaseHeight/2, 0 >, Radius }
    cylinder { < 0, -BaseHeight/2-0.1, 0>, < 0, BaseHeight/2+1.1, 0 >, Radius-0.3 }
  }
  difference {
    intersection {
      sphere { < 0, -2.7, 0 > 4 }
      cylinder { < 0, -BaseHeight/2, 0>, < 0, 5, 0 >, Radius }
    }
    sphere { < 0, -2.7, 0 > 3.7 }
    object { CrownClip rotate < 0, 0, 0 > }
    object { CrownClip rotate < 0, 45, 0 > }
    object { CrownClip rotate < 0, 90, 0 > }
    object { CrownClip rotate < 0, 135, 0 > }
    object { CrownClip rotate < 0, 180, 0 > }
    object { CrownClip rotate < 0, 225, 0 > }
    object { CrownClip rotate < 0, 270, 0 > }
    object { CrownClip rotate < 0, 315, 0 > }
  }
  object { Ruby
    scale 1.2
    translate < 0, 1.3, 0 >
  }
  object { SideJevel rotate < 0, 0, 0 > }
  object { SideJevel rotate < 0, 20, 0 > }
  object { SideJevel rotate < 0, 40, 0 > }
  object { SideJevel rotate < 0, 60, 0 > }
  object { SideJevel rotate < 0, 80, 0 > }
  object { SideJevel rotate < 0, 100, 0 > }
  object { SideJevel rotate < 0, 120, 0 > }
  object { SideJevel rotate < 0, 140, 0 > }
  object { SideJevel rotate < 0, 160, 0 > }
  object { SideJevel rotate < 0, 180, 0 > }
  object { SideJevel rotate < 0, 200, 0 > }
  object { SideJevel rotate < 0, 220, 0 > }
  object { SideJevel rotate < 0, 240, 0 > }
  object { SideJevel rotate < 0, 260, 0 > }
  object { SideJevel rotate < 0, 280, 0 > }
  object { SideJevel rotate < 0, 300, 0 > }
  object { SideJevel rotate < 0, 320, 0 > }
  object { SideJevel rotate < 0, 340, 0 > }
  object { GlassStick rotate < 0, 10, 0 > }
  object { GlassStick rotate < 0, 30, 0 > }
  object { GlassStick rotate < 0, 50, 0 > }
  object { GlassStick rotate < 0, 70, 0 > }
  object { GlassStick rotate < 0, 90, 0 > }
  object { GlassStick rotate < 0, 110, 0 > }
  object { GlassStick rotate < 0, 130, 0 > }
  object { GlassStick rotate < 0, 150, 0 > }
  object { GlassStick rotate < 0, 170, 0 > }
  object { GlassStick rotate < 0, 190, 0 > }
  object { GlassStick rotate < 0, 210, 0 > }
  object { GlassStick rotate < 0, 230, 0 > }
  object { GlassStick rotate < 0, 250, 0 > }
  object { GlassStick rotate < 0, 270, 0 > }
  object { GlassStick rotate < 0, 290, 0 > }
  object { GlassStick rotate < 0, 310, 0 > }
  object { GlassStick rotate < 0, 330, 0 > }
  object { GlassStick rotate < 0, 350, 0 > }
  texture {   // Default texture for the crown - can be overrided in individual members of the union
    Gold_Metal
    normal {
      bumps 0.2
      scale 0.06
    }
    finish {
      diffuse 0.8
      reflection 0.3
    }
  }
}

object {
  Crown
  scale 1.8
  rotate < -15, 0, 10 >
  translate < 0, 6, 5>
}
