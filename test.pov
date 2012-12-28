#include "stdinc.inc"
#include "textures.inc"
camera {
	location <0, 3, -20>
	look_at <0, 10, 80>
}

light_source { <-100, 400, 0> White }

fog {
	distance 40000
	color LightBlue
}

background{
	LightBlue
}

plane { 
	<0,1,0>, 0
	material{
		M_Glass3
	}
}

#declare HGold = texture {
	pigment {
		BrightGold
	}
	finish{
		reflection 0.4
	}
}

#declare Pole = lathe {
	linear_spline
	8, <0, 0>, <0.5, 0>, <0.2, 10>, <0.5, 20>, <1, 20.5>, <0.9, 21.5>, <0.2, 22>,<0, 24>
	texture{
		HGold
	}
}
box{
	<-5,0,-10>, <5,0.07,50>
	texture{
		pigment{
			White
		}
		finish{
			reflection 0.2
		}
	}
}


#declare Count2 = 0;
#while (Count2 < 2)
	#declare Count = 0;
	#while (Count < 5)
		object { Pole
			#if (Count2 = 0)
					translate <-10,0,10*Count>
			#else
					translate <10,0,10*Count>
			#end
		}
		#declare Count=Count+1;
	#end
	#declare Count2=Count2+1;
#end

object{
	merge{
		box{
			<-7,0,60>,<-20,20,70>
		}
		box{
			<20,0,60>,<7,20,70>
		}

		box{
			<23,20,57>,<-23,24,73>
		}
		box{
			<20,24,60>,<-20,27,70>
		}
		box{
			<15,27,63>,<-15,30,67>
		}
	}
	texture{
		HGold
	}
}
box{
	<10,0,75>,<-10,25,75>
	texture{
		pigment{
			White
		}
		normal{
			bumps 0.05
		}
		finish{
			reflection 1.0
		}

	}
}
box{
	<3,0,-25>, <-3,10,-26>
	pigment{Black}
}
//Taken from http://www.f-lohmueller.de/pov_tut/backgrnd/p_sky3.htm
// ***************************************************************
// a lighter version of Darin Dugger's T_Clouds from "skies.inc"
// modified by Friedrich A. Lohmueller for using with "fog": 
// ***************************************************************
#declare T_Cloud2_Lo =
texture {
    pigment { bozo
        turbulence 1.5
        octaves 10
        omega 0.5
        lambda 2.5
        color_map { [0.0 color rgbf<0.85, 0.85, 0.85, 0.00>*1.0 ]
                    [0.5 color rgbf<0.95, 0.95, 0.95, 0.90>*1.12  ]
                    [0.7 color rgbf<1, 1, 1, 1> ]
                    [1.0 color rgbf<1, 1, 1, 1> ] }
    }

    finish {ambient 0.95 diffuse 0.1}
}
//--------------------------- 
#declare T_Cloud3_Lo =
texture {
    pigment { bozo
        turbulence 0.8 //0.6
        octaves 10
        omega 0.5
        lambda 2.5
        color_map { [0.0 color rgbf<0.95, 0.95, 0.95, 0.00>*1.2]
                    [0.4 color rgbf<0.90, 0.90, 0.90, 0.90>*1]
                    [0.7 color rgbf<1, 1, 1, 1> ]
                    [1.0 color rgbf<1, 1, 1, 1> ] }
           }
    finish {ambient 1.0 diffuse 0.0 }
}
texture {
    pigment { bozo
        turbulence 0.8 //0.6
        octaves 10
        omega 0.5
        lambda 2.5
        color_map { [0.00, color rgbf<.85, .85, .85, 0.5>*1.5 ]
                    [0.35 color rgbf<.95, .95, .95, .95>*1.1]
                    [0.5 color rgbf<1, 1, 1, 1> ]
                    [1.0 color rgbf<1, 1, 1, 1> ] }
    }
    finish { ambient 0.65 diffuse 0.0}
scale 0.9
translate y*-0.15
}


// Darin Dugger's DD_Cloud_Sky texture mapped onto a pair of planes
//  first cloud level  500
// second cloud level 3000 

// "hollow" added by Friedrich A.Lohmueller,2000
// for using together with fog!


#declare O_Cloud2_Lo =
union {
 plane { <0,1,0>, 500 hollow //!!!!
        texture { T_Cloud3_Lo  scale 500}}
    
 plane { <0,1,0>, 3000 hollow  //!!!!
        texture {T_Cloud2_Lo scale <900,1,3000> 
                 translate <3000,0,0> rotate <0,-30,0>}}

 plane { <0,1,0> , 10000  hollow
        texture{ pigment {color SkyBlue*0.20}
                 finish {ambient 1 diffuse 0}}}
scale<1.5,1,1.25>
}//------------------------------------------------


object{O_Cloud2_Lo rotate<0,0,0> translate<0,0,0>}
