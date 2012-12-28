#include "stdinc.inc"
#include "textures.inc"
#include "stones1.inc"
camera {
	location <0, 3, -20>
	look_at <0, 10, 80>
}

light_source { <-100, 400, 0> White }

fog {
	distance 40000
	color LightBlue
}

//floor
plane { 
	<0,1,0>, 0
	texture{
		T_Grnt4
		finish{
			ambient 1.0
		}
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

//path
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

//poles
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

//door
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

//mirror portal
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

//sky
plane{
	<0,1,0>, 0.25 hollow
	texture{
		Shadow_Clouds
		scale 0.1
	}
	scale 2000
}  
