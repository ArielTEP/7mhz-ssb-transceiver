//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/Audio_Apmlifier/Audio_amp.brd
//2010. 04. 14. 18:08:10

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 206;
#local cam_z = -99;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.739741;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.739741;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -15;
#local lgt3_intense = 0.739741;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -15;
#local lgt4_intense = 0.739741;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 64.440000;
#declare pcb_y_size = 43.170000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(115);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-32.220000,0,-21.585000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro AUDIO_AMP(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><64.440000,0.000000>
<64.440000,0.000000><64.440000,43.170000>
<64.440000,43.170000><0.000000,43.170000>
<0.000000,43.170000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,39.370000><3.810000,-5,39.370000>1.600000 texture{col_hls}}
cylinder{<60.960000,1,39.370000><60.960000,-5,39.370000>1.600000 texture{col_hls}}
cylinder{<60.960000,1,3.810000><60.960000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.160000,0.000000,22.860000>}#end		//ceramic disc capacitator C1 0.1uF C050-035X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.480000,0.000000,20.320000>}#end		//ceramic disc capacitator C2 0.1uF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.05uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.624000,0.000000,11.430000>}#end		//ceramic disc capacitator C3 0.05uF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,34.290000>}#end		//ceramic disc capacitator C4 0.01uF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,33.020000>}#end		//ceramic disc capacitator C5 0.01uF C050-035X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uFx35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<15.240000,0.000000,11.430000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C6 10uFx35V E2,5-6
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_ELKO_2MM5_6MM3("1uFx35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,22.860000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C7 1uFx35V E2,5-6
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_ELKO_2MM5_6MM3("100uFx35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.020000,0.000000,31.750000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C8 100uFx35V E2,5-6
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_ELKO_2MM5_6MM3("100uFx35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.640000,0.000000,31.750000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C9 100uFx35V E2,5-6
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_DIS_ELKO_3MM5_8MM("470uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.530000,0.000000,12.700000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C10 470uF 35V E3,5-8
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP8("LM741P","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.590000,0.000000,20.320000>}#end		//DIP8 IC1 LM741P DIL08
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP8("LM386N-1","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,20.320000>}#end		//DIP8 IC2 LM386N-1 DIL08
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.080000,0.000000,15.240000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.420000,0.000000,22.860000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.420000,0.000000,13.970000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_J4) #declare global_pack_J4=yes; object {MOLEX_PSL3G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<26.670000,0.000000,7.620000>}#end		//Molex 53047 J4  6410-03
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<10.160000,0.000000,33.020000>}#end		//Discrete Resistor 0,3W 12MM Grid R1 33k 0207/12
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<10.160000,0.000000,12.700000>}#end		//Discrete Resistor 0,3W 12MM Grid R2 33k 0207/12
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,29.210000>}#end		//Discrete Resistor 0,3W 12MM Grid R3 100k 0207/12
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<53.340000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 12MM Grid R4 10E 0207/12
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.434000,0.000000,6.350000>}#end		//Discrete Resistor 0,3W 12MM Grid R5 10E 0207/12
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.100000,0.000000,39.370000>}#end		//Discrete Resistor 0,3W 12MM Grid R6 100E 0207/12
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.700000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<7.620000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<42.164000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<37.084000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.050000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<41.910000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.370000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.752000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<51.308000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<5.080000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<5.080000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<24.130000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<26.670000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<29.210000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.240000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<53.340000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<53.340000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.784000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<37.084000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.750000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<44.450000,0,39.370000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,21.590000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<5.080000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.350000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.080000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,3.810000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<5.080000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.350000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.350000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,3.810000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.620000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,6.350000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,26.670000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,20.320000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.160000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,20.320000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<10.160000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<11.430000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<12.700000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,12.700000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.240000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,19.050000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.700000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,29.210000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.240000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,34.290000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<16.510000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,39.370000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,39.370000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<16.510000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,3.810000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,10.160000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,10.160000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.780000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,16.510000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.780000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,19.050000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,21.590000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,34.290000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.510000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,27.940000>}
box{<0,0,-0.304800><7.184205,0.035000,0.304800> rotate<0,44.997030,0> translate<16.510000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,27.940000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<21.590000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<21.590000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,11.430000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.130000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.130000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,21.590000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.860000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,10.160000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<26.670000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,20.320000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<26.670000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,22.860000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.940000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,29.210000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.940000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,34.290000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,3.810000>}
box{<0,0,-0.304800><11.430000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.780000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,12.700000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<26.670000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,38.100000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.210000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,39.370000>}
box{<0,0,-0.304800><12.700000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.510000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,17.780000>}
box{<0,0,-0.304800><7.184205,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.400000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,22.860000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.940000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,30.480000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.480000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,31.750000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<27.940000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,31.750000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.480000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,3.810000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.210000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,12.700000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.210000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<30.480000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,39.370000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.210000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,13.970000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.750000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,20.320000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.020000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,30.480000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.480000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,33.020000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.020000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,34.290000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<29.210000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.020000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,3.810000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.750000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,12.700000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.560000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,16.510000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.560000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.560000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.290000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,-1.535000,11.430000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.084000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,15.240000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.560000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,17.780000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,17.780000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,26.670000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.750000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,26.670000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,27.940000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.100000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,31.750000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<39.370000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,25.400000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<40.640000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,11.430000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.164000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.180000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,15.240000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<43.180000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,15.240000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.450000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.180000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,29.210000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.640000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,31.750000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,31.750000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.450000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,34.290000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.450000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,35.560000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.450000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,39.370000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.450000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,39.370000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.720000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,24.130000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.450000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,-1.535000,12.700000>}
box{<0,0,-0.304800><3.302000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.450000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,24.130000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.990000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,35.560000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.720000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,30.480000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,3.810000>}
box{<0,0,-0.304800><15.240000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.784000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,3.810000>}
box{<0,0,-0.304800><2.735664,0.035000,0.304800> rotate<0,68.194090,0> translate<49.784000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,21.590000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,29.210000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<49.530000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,29.210000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.800000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.800000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,39.370000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.720000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,-1.535000,36.830000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<53.340000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,-1.535000,38.100000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<52.070000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.880000,-1.535000,17.780000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<52.070000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.308000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,12.700000>}
box{<0,0,-0.304800><7.112000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.308000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.880000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,17.780000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<55.880000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,24.130000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.340000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,17.780000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.420000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,8.890000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.960000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,10.160000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.960000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,16.510000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<59.690000,-1.535000,17.780000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,4.960600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,38.219300>}
box{<0,0,-0.203200><33.258700,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219100,-1.535000,38.219300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,4.960600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,5.541000>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,-60.003007,0> translate<1.219100,-1.535000,4.960600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.405400,-1.535000,5.283200>}
box{<0,0,-0.203200><0.186300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.702700,-1.535000,5.689600>}
box{<0,0,-0.203200><0.483600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.131300,-1.535000,6.096000>}
box{<0,0,-0.203200><0.912200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.966000,-1.535000,6.502400>}
box{<0,0,-0.203200><1.746900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.138400,-1.535000,6.908800>}
box{<0,0,-0.203200><7.919300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.544800,-1.535000,7.315200>}
box{<0,0,-0.203200><8.325700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,7.721600>}
box{<0,0,-0.203200><21.132900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,8.128000>}
box{<0,0,-0.203200><21.132900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,8.534400>}
box{<0,0,-0.203200><21.132900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.681100,-1.535000,8.940800>}
box{<0,0,-0.203200><13.462000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.274700,-1.535000,9.347200>}
box{<0,0,-0.203200><13.055600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,9.753600>}
box{<0,0,-0.203200><12.763600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,10.160000>}
box{<0,0,-0.203200><14.019800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.566400>}
box{<0,0,-0.203200><12.763600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.274800,-1.535000,10.972800>}
box{<0,0,-0.203200><13.055700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.992400,-1.535000,11.379200>}
box{<0,0,-0.203200><12.773300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.653000,-1.535000,11.785600>}
box{<0,0,-0.203200><12.433900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.484600,-1.535000,12.192000>}
box{<0,0,-0.203200><12.265500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,12.598400>}
box{<0,0,-0.203200><12.204800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.572100,-1.535000,13.004800>}
box{<0,0,-0.203200><2.353000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.234300,-1.535000,13.411200>}
box{<0,0,-0.203200><2.015200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.107700,-1.535000,13.817600>}
box{<0,0,-0.203200><1.888600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.123900,-1.535000,14.224000>}
box{<0,0,-0.203200><1.904800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.290900,-1.535000,14.630400>}
box{<0,0,-0.203200><2.071800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.276700,-1.535000,15.036800>}
box{<0,0,-0.203200><2.057600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.870300,-1.535000,15.443200>}
box{<0,0,-0.203200><1.651200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.667000,-1.535000,15.849600>}
box{<0,0,-0.203200><1.447900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.256000>}
box{<0,0,-0.203200><1.320900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.662400>}
box{<0,0,-0.203200><1.320900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.625100,-1.535000,17.068800>}
box{<0,0,-0.203200><1.406000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793400,-1.535000,17.475200>}
box{<0,0,-0.203200><1.574300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175200,-1.535000,17.881600>}
box{<0,0,-0.203200><1.956100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,18.288000>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,18.694400>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,19.100800>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,19.507200>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,19.913600>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,20.320000>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,20.726400>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,21.132800>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,21.539200>}
box{<0,0,-0.203200><2.540100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.797700,-1.535000,21.945600>}
box{<0,0,-0.203200><2.578600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.974200,-1.535000,22.352000>}
box{<0,0,-0.203200><2.755100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.380600,-1.535000,22.758400>}
box{<0,0,-0.203200><3.161500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.787000,-1.535000,23.164800>}
box{<0,0,-0.203200><3.567900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.193400,-1.535000,23.571200>}
box{<0,0,-0.203200><3.974300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.599800,-1.535000,23.977600>}
box{<0,0,-0.203200><4.380700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.773400,-1.535000,24.384000>}
box{<0,0,-0.203200><5.554300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,24.790400>}
box{<0,0,-0.203200><7.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,25.196800>}
box{<0,0,-0.203200><7.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,25.603200>}
box{<0,0,-0.203200><7.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,26.009600>}
box{<0,0,-0.203200><7.264500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,26.416000>}
box{<0,0,-0.203200><7.264500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,26.822400>}
box{<0,0,-0.203200><7.264500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,27.228800>}
box{<0,0,-0.203200><7.264500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.754500,-1.535000,27.635200>}
box{<0,0,-0.203200><7.535400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.160900,-1.535000,28.041600>}
box{<0,0,-0.203200><7.941800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.631200,-1.535000,28.448000>}
box{<0,0,-0.203200><12.412100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,28.854400>}
box{<0,0,-0.203200><12.344500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,29.260800>}
box{<0,0,-0.203200><12.344500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,29.667200>}
box{<0,0,-0.203200><12.344500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.732900,-1.535000,30.073600>}
box{<0,0,-0.203200><12.513800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.139300,-1.535000,30.480000>}
box{<0,0,-0.203200><12.920200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.775700,-1.535000,30.886400>}
box{<0,0,-0.203200><15.556600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.369300,-1.535000,31.292800>}
box{<0,0,-0.203200><15.150200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.962900,-1.535000,31.699200>}
box{<0,0,-0.203200><14.743800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.556500,-1.535000,32.105600>}
box{<0,0,-0.203200><14.337400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290700,-1.535000,32.512000>}
box{<0,0,-0.203200><14.071600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,32.918400>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,33.324800>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,33.731200>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,34.137600>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,34.544000>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,34.950400>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,35.356800>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,35.763200>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,36.169600>}
box{<0,0,-0.203200><13.970100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.344700,-1.535000,36.576000>}
box{<0,0,-0.203200><2.125600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.306900,-1.535000,36.982400>}
box{<0,0,-0.203200><1.087800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.804200,-1.535000,37.388800>}
box{<0,0,-0.203200><0.585100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.463800,-1.535000,37.795200>}
box{<0,0,-0.203200><0.244700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.229300,-1.535000,38.201600>}
box{<0,0,-0.203200><0.010200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,38.219300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,37.638900>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,60.003007,0> translate<1.219100,-1.535000,38.219300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.554100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,37.638900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,37.114100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<1.554100,-1.535000,37.638900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<2.078900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,37.114100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,36.742900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<2.078900,-1.535000,37.114100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.156300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.810700,-1.535000,15.502800>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<2.540000,-1.535000,16.156300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.863600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.156300>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.540000,-1.535000,16.156300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,16.863600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.810700,-1.535000,17.517100>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<2.540000,-1.535000,16.863600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<2.721800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,36.550800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<2.721800,-1.535000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.810700,-1.535000,15.502800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.310800,-1.535000,15.002700>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<2.810700,-1.535000,15.502800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.810700,-1.535000,17.517100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.310800,-1.535000,18.017200>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.810700,-1.535000,17.517100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098700,-1.535000,13.919000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,13.874000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,89.866745,0> translate<3.098700,-1.535000,13.919000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098700,-1.535000,13.919000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.028500,-1.535000,13.919000>}
box{<0,0,-0.203200><1.929800,0.035000,0.203200> rotate<0,0.000000,0> translate<3.098700,-1.535000,13.919000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,13.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.128800,-1.535000,13.684400>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<3.098800,-1.535000,13.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.028500,-1.535000,14.020800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.098800,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,14.065900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,14.020800>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.098800,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.098800,-1.535000,14.065900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.128800,-1.535000,14.255500>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<3.098800,-1.535000,14.065900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.128800,-1.535000,13.684400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188100,-1.535000,13.501900>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<3.128800,-1.535000,13.684400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.128800,-1.535000,14.255500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188100,-1.535000,14.438000>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<3.128800,-1.535000,14.255500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188100,-1.535000,13.501900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.275200,-1.535000,13.331000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<3.188100,-1.535000,13.501900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188100,-1.535000,14.438000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.275200,-1.535000,14.608900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<3.188100,-1.535000,14.438000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.275200,-1.535000,13.331000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.388000,-1.535000,13.175700>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<3.275200,-1.535000,13.331000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.275200,-1.535000,14.608900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.388000,-1.535000,14.764200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<3.275200,-1.535000,14.608900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.310800,-1.535000,15.002700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.536600,-1.535000,14.909200>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,22.492143,0> translate<3.310800,-1.535000,15.002700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.310800,-1.535000,18.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,18.202900>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,-22.494877,0> translate<3.310800,-1.535000,18.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.388000,-1.535000,13.175700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.523700,-1.535000,13.040000>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<3.388000,-1.535000,13.175700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.388000,-1.535000,14.764200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.523700,-1.535000,14.899900>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.388000,-1.535000,14.764200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,36.550800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,36.550800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,36.550800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.523700,-1.535000,13.040000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.679000,-1.535000,12.927200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,35.989884,0> translate<3.523700,-1.535000,13.040000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.523700,-1.535000,14.899900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.536600,-1.535000,14.909200>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,-35.786612,0> translate<3.523700,-1.535000,14.899900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.679000,-1.535000,12.927200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.849900,-1.535000,12.840100>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,27.004100,0> translate<3.679000,-1.535000,12.927200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,21.852700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,18.202900>}
box{<0,0,-0.203200><3.649800,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.759200,-1.535000,18.202900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.759200,-1.535000,21.852700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.960300,-1.535000,22.338100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<3.759200,-1.535000,21.852700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.849900,-1.535000,12.840100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.032400,-1.535000,12.780800>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,17.999424,0> translate<3.849900,-1.535000,12.840100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.960300,-1.535000,22.338100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.331800,-1.535000,22.709600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.960300,-1.535000,22.338100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.032400,-1.535000,12.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.222000,-1.535000,12.750800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,8.990654,0> translate<4.032400,-1.535000,12.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<4.181100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,36.550800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,36.742900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<4.181100,-1.535000,36.550800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.222000,-1.535000,12.750800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,12.750800>}
box{<0,0,-0.203200><0.807000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.222000,-1.535000,12.750800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.275100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,36.576000>}
box{<0,0,-0.203200><10.914100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.275100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.331800,-1.535000,22.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.230300,-1.535000,23.608100>}
box{<0,0,-0.203200><1.270671,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.331800,-1.535000,22.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.654000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.502400>}
box{<0,0,-0.203200><4.388400,0.035000,0.203200> rotate<0,0.000000,0> translate<4.654000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<4.898100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,37.114100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<4.898100,-1.535000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,-29.991053,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.809300,-1.535000,1.219100>}
box{<0,0,-0.203200><54.848700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960700,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.809100,-1.535000,1.219200>}
box{<0,0,-0.203200><54.848400,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960700,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.977900,-1.535000,41.950800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,41.625800>}
box{<0,0,-0.203200><0.650159,0.035000,0.203200> rotate<0,29.989936,0> translate<4.977900,-1.535000,41.950800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.977900,-1.535000,41.950800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.792000,-1.535000,41.950800>}
box{<0,0,-0.203200><54.814100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.977900,-1.535000,41.950800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.028500,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.028500,-1.535000,13.919000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.028500,-1.535000,13.919000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,12.750800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,13.918500>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,90.000000,0> translate<5.029000,-1.535000,13.918500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,13.004800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.029000,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,13.411200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.029000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,13.817600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.029000,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.029000,-1.535000,13.918500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,13.918500>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.029000,-1.535000,13.918500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,12.750800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.937900,-1.535000,12.750800>}
box{<0,0,-0.203200><0.807100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.130800,-1.535000,12.750800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,13.918500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.130800,-1.535000,12.750800>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.130800,-1.535000,12.750800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131400,-1.535000,13.919000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131400,-1.535000,14.020800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,90.000000,0> translate<5.131400,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131400,-1.535000,13.919000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,13.919000>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.131400,-1.535000,13.919000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131400,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,14.020800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.131400,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.136700,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.633300,-1.535000,41.859200>}
box{<0,0,-0.203200><54.496600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.136700,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.230300,-1.535000,23.608100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.601800,-1.535000,23.979600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.230300,-1.535000,23.608100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.312900,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,36.982400>}
box{<0,0,-0.203200><9.876300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.312900,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.096000>}
box{<0,0,-0.203200><3.553700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.488700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<5.541000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,37.114100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,37.638900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,37.114100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,41.625800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,41.101000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<5.541000,-1.535000,41.625800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.601800,-1.535000,23.979600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.087200,-1.535000,24.180700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<5.601800,-1.535000,23.979600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.612500,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.157400,-1.535000,1.625600>}
box{<0,0,-0.203200><53.544900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.612500,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.714000,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055900,-1.535000,41.452800>}
box{<0,0,-0.203200><53.341900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.714000,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.815700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,37.388800>}
box{<0,0,-0.203200><9.373500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.815700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.917200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.239900,-1.535000,5.689600>}
box{<0,0,-0.203200><3.322700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.917200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.937900,-1.535000,12.750800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.127500,-1.535000,12.780800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-8.990654,0> translate<5.937900,-1.535000,12.750800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.018900,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.751000,-1.535000,2.032000>}
box{<0,0,-0.203200><52.732100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.018900,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,37.638900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,38.281800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,37.638900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,41.101000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,40.458100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,41.101000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.087200,-1.535000,24.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.570100,-1.535000,24.180700>}
box{<0,0,-0.203200><0.482900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.087200,-1.535000,24.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.097400,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.672600,-1.535000,41.046400>}
box{<0,0,-0.203200><52.575200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.097400,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.127500,-1.535000,12.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.310000,-1.535000,12.840100>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-17.999424,0> translate<6.127500,-1.535000,12.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.156000,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.364000,-1.535000,37.795200>}
box{<0,0,-0.203200><3.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.156000,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.214700,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.646300,-1.535000,5.283200>}
box{<0,0,-0.203200><3.431600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.214700,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.273300,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.496500,-1.535000,2.438400>}
box{<0,0,-0.203200><52.223200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.273300,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.310000,-1.535000,12.840100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480900,-1.535000,12.927200>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-27.004100,0> translate<6.310000,-1.535000,12.840100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.332000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.059300,-1.535000,40.640000>}
box{<0,0,-0.203200><2.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.332000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.390600,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.957600,-1.535000,38.201600>}
box{<0,0,-0.203200><2.567000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.390600,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,18.202900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,21.042900>}
box{<0,0,-0.203200><2.840000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.400700,-1.535000,21.042900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,18.202900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.849100,-1.535000,18.017200>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,22.494877,0> translate<6.400700,-1.535000,18.202900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.551200,-1.535000,18.288000>}
box{<0,0,-0.203200><2.150500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,18.694400>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,19.100800>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,19.507200>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.653000,-1.535000,19.913600>}
box{<0,0,-0.203200><2.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.059400,-1.535000,20.320000>}
box{<0,0,-0.203200><2.658700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.155700,-1.535000,20.726400>}
box{<0,0,-0.203200><2.755000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400700,-1.535000,21.042900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733500,-1.535000,21.375800>}
box{<0,0,-0.203200><0.470721,0.035000,0.203200> rotate<0,-45.005636,0> translate<6.400700,-1.535000,21.042900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,38.281800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,38.998800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,38.281800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,40.458100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,39.741100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,40.458100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.442800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.186400,-1.535000,4.876800>}
box{<0,0,-0.203200><29.743600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.442800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.469900,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.299900,-1.535000,2.844800>}
box{<0,0,-0.203200><51.830000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.469900,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480900,-1.535000,12.927200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636200,-1.535000,13.040000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-35.989884,0> translate<6.480900,-1.535000,12.927200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.490500,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.919700,-1.535000,21.132800>}
box{<0,0,-0.203200><2.429200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.490500,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.497200,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.652900,-1.535000,40.233600>}
box{<0,0,-0.203200><2.155700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.497200,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.524300,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.551200,-1.535000,38.608000>}
box{<0,0,-0.203200><2.026900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.524300,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.551600,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.218400,-1.535000,4.470400>}
box{<0,0,-0.203200><51.666800,0.035000,0.203200> rotate<0,0.000000,0> translate<6.551600,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.570100,-1.535000,24.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.925600,-1.535000,24.536300>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-45.005087,0> translate<6.570100,-1.535000,24.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.578800,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.191000,-1.535000,3.251200>}
box{<0,0,-0.203200><51.612200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.578800,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.587700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,13.004800>}
box{<0,0,-0.203200><6.836200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.587700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.606100,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,39.827200>}
box{<0,0,-0.203200><1.877500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.606100,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.623300,-1.535000,14.909200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636200,-1.535000,14.899900>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,35.786612,0> translate<6.623300,-1.535000,14.909200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.623300,-1.535000,14.909200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.849100,-1.535000,15.002700>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,-22.492143,0> translate<6.623300,-1.535000,14.909200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,3.657600>}
box{<0,0,-0.203200><51.511700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,4.064000>}
box{<0,0,-0.203200><51.511700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,38.998800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,39.741100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,39.741100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,39.014400>}
box{<0,0,-0.203200><1.854500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,39.420800>}
box{<0,0,-0.203200><1.854500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636200,-1.535000,13.040000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771900,-1.535000,13.175700>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.636200,-1.535000,13.040000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636200,-1.535000,14.899900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771900,-1.535000,14.764200>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<6.636200,-1.535000,14.899900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733500,-1.535000,21.375800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.925600,-1.535000,21.183600>}
box{<0,0,-0.203200><0.271741,0.035000,0.203200> rotate<0,45.011938,0> translate<6.733500,-1.535000,21.375800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771900,-1.535000,13.175700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.884700,-1.535000,13.331000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<6.771900,-1.535000,13.175700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771900,-1.535000,14.764200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.884700,-1.535000,14.608900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<6.771900,-1.535000,14.764200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.849100,-1.535000,15.002700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.349200,-1.535000,15.502800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.849100,-1.535000,15.002700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.849100,-1.535000,18.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.349200,-1.535000,17.517100>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<6.849100,-1.535000,18.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.869100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,14.630400>}
box{<0,0,-0.203200><7.050100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.869100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.883200,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,15.036800>}
box{<0,0,-0.203200><7.036000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.883200,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.884700,-1.535000,13.331000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.971800,-1.535000,13.501900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<6.884700,-1.535000,13.331000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.884700,-1.535000,14.608900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.971800,-1.535000,14.438000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<6.884700,-1.535000,14.608900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.925500,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.568900,-1.535000,13.411200>}
box{<0,0,-0.203200><6.643400,0.035000,0.203200> rotate<0,0.000000,0> translate<6.925500,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.925600,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.314300,-1.535000,21.183600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.925600,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.925600,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.314300,-1.535000,24.536300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.925600,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.971800,-1.535000,13.501900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.031100,-1.535000,13.684400>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<6.971800,-1.535000,13.501900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.971800,-1.535000,14.438000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.031100,-1.535000,14.255500>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<6.971800,-1.535000,14.438000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.984700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.957600,-1.535000,17.881600>}
box{<0,0,-0.203200><1.972900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.984700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.031100,-1.535000,13.684400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,13.874000>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<7.031100,-1.535000,13.684400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.031100,-1.535000,14.255500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,14.065900>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<7.031100,-1.535000,14.255500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.036100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,14.224000>}
box{<0,0,-0.203200><6.883100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.036100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.052100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.789400,-1.535000,13.817600>}
box{<0,0,-0.203200><6.737300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.052100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,13.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,13.919000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.061100,-1.535000,13.919000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.061100,-1.535000,14.065900>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,90.000000,0> translate<7.061100,-1.535000,14.065900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.289600,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,15.443200>}
box{<0,0,-0.203200><6.629600,0.035000,0.203200> rotate<0,0.000000,0> translate<7.289600,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.349200,-1.535000,15.502800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.156300>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<7.349200,-1.535000,15.502800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.349200,-1.535000,17.517100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.863600>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<7.349200,-1.535000,17.517100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366600,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.364000,-1.535000,17.475200>}
box{<0,0,-0.203200><1.997400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.366600,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,15.849600>}
box{<0,0,-0.203200><6.426400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.492800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.534900,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,17.068800>}
box{<0,0,-0.203200><6.384300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.534900,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.156300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.863600>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,90.000000,0> translate<7.619900,-1.535000,16.863600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,16.256000>}
box{<0,0,-0.203200><6.299300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.619900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619900,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,16.662400>}
box{<0,0,-0.203200><6.299300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.619900,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.314300,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,21.708600>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,-45.002487,0> translate<8.314300,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.314300,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,24.011300>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,45.002487,0> translate<8.314300,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.466600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,24.384000>}
box{<0,0,-0.203200><0.372600,0.035000,0.203200> rotate<0,0.000000,0> translate<8.466600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,18.355600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,17.373600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<8.483600,-1.535000,18.355600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,19.744300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,18.355600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,18.355600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,19.744300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.310800,-1.535000,20.571400>}
box{<0,0,-0.203200><1.169767,0.035000,0.203200> rotate<0,-44.993567,0> translate<8.483600,-1.535000,19.744300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.975600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,25.620000>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<8.483600,-1.535000,25.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,27.364300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.975600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,25.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,27.364300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,28.346300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.483600,-1.535000,27.364300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,38.675600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,37.693600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<8.483600,-1.535000,38.675600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,40.064300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,38.675600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,38.675600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,40.064300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,41.046300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.483600,-1.535000,40.064300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.669800,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,21.539200>}
box{<0,0,-0.203200><0.169400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.669800,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,21.327200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.040300,-1.535000,20.841800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<8.839200,-1.535000,21.327200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,21.708600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,21.327200>}
box{<0,0,-0.203200><0.381400,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.839200,-1.535000,21.327200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,25.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839200,-1.535000,24.011300>}
box{<0,0,-0.203200><1.608700,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.839200,-1.535000,24.011300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.040300,-1.535000,20.841800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.310800,-1.535000,20.571400>}
box{<0,0,-0.203200><0.382474,0.035000,0.203200> rotate<0,44.986438,0> translate<9.040300,-1.535000,20.841800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,5.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.697100,-1.535000,5.232400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<9.042400,-1.535000,5.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,5.887100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.042400,-1.535000,5.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,6.349400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.042400,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,6.350400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.042400,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.350400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.042400,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.042400,-1.535000,6.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.697100,-1.535000,7.467500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.042400,-1.535000,6.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,17.373600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.465600,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,28.346300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,28.346300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.465600,-1.535000,28.346300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,37.693600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.465600,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.465600,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,41.046300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.465600,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.697100,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,5.232400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.697100,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.697100,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,7.467500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.697100,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,6.349400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.158900,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.348900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<10.159400,-1.535000,6.348900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,5.283200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,5.689600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.096000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.348900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.348900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,6.348900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.351000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,7.467500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<10.159400,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.351000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.351000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,6.351000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.502400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.908800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,7.315200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.622800,-1.535000,5.232400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160400,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.348900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,5.232400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.160400,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,6.351000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.160400,-1.535000,6.351000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.622800,-1.535000,7.467500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160400,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,6.350400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.161000,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.349400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.161000,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.350400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.161000,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.622800,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,5.887100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.622800,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.622800,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.812800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<10.622800,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.673600,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.285700,-1.535000,5.283200>}
box{<0,0,-0.203200><12.612100,0.035000,0.203200> rotate<0,0.000000,0> translate<10.673600,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.775100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,7.315200>}
box{<0,0,-0.203200><11.576900,0.035000,0.203200> rotate<0,0.000000,0> translate<10.775100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681400,-1.535000,18.200800>}
box{<0,0,-0.203200><1.169767,0.035000,0.203200> rotate<0,-45.000493,0> translate<10.854300,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,28.346300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,27.364300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<10.854300,-1.535000,28.346300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.209800,-1.535000,38.049200>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-45.005087,0> translate<10.854300,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.854300,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.209800,-1.535000,40.690700>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,45.005087,0> translate<10.854300,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.955800,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,17.475200>}
box{<0,0,-0.203200><2.963400,0.035000,0.203200> rotate<0,0.000000,0> translate<10.955800,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.955800,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,37.795200>}
box{<0,0,-0.203200><4.233400,0.035000,0.203200> rotate<0,0.000000,0> translate<10.955800,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.080000,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.783900,-1.535000,5.689600>}
box{<0,0,-0.203200><11.703900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.080000,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.159000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,28.041600>}
box{<0,0,-0.203200><2.760200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.159000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.181500,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,6.908800>}
box{<0,0,-0.203200><11.170500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.181500,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.209800,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,38.049200>}
box{<0,0,-0.203200><3.979400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.209800,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.209800,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.247200,-1.535000,40.690700>}
box{<0,0,-0.203200><5.037400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.209800,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,5.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.349400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.277500,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.521100,-1.535000,6.096000>}
box{<0,0,-0.203200><11.243600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.277500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.812800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<11.277500,-1.535000,6.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.277500,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352700,-1.535000,6.502400>}
box{<0,0,-0.203200><11.075200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.277500,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.362200,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.069300,-1.535000,17.881600>}
box{<0,0,-0.203200><0.707100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.362200,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,24.011300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,25.620000>}
box{<0,0,-0.203200><1.608700,0.035000,0.203200> rotate<0,90.000000,0> translate<11.480700,-1.535000,25.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,24.011300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.005600,-1.535000,24.536300>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,-45.002487,0> translate<11.480700,-1.535000,24.011300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.853400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.372700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.480700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,24.790400>}
box{<0,0,-0.203200><2.438500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.480700,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,25.196800>}
box{<0,0,-0.203200><2.438500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.480700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,25.603200>}
box{<0,0,-0.203200><2.438500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.480700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.480700,-1.535000,25.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.975600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.480700,-1.535000,25.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.565400,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,27.635200>}
box{<0,0,-0.203200><2.353800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.565400,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681400,-1.535000,18.200800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.951800,-1.535000,17.930300>}
box{<0,0,-0.203200><0.382474,0.035000,0.203200> rotate<0,45.007622,0> translate<11.681400,-1.535000,18.200800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.975600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,27.364300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,27.364300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,26.009600>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,26.416000>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,26.822400>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,27.228800>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.951800,-1.535000,17.930300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.437200,-1.535000,17.729200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<11.951800,-1.535000,17.930300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.005600,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.394300,-1.535000,24.536300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.005600,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.437200,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,17.729200>}
box{<0,0,-0.203200><1.482000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.437200,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.394300,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,24.011300>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,45.002487,0> translate<13.394300,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,12.338700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700400,-1.535000,11.671200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<13.423900,-1.535000,12.338700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,13.061200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,12.338700>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.423900,-1.535000,12.338700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423900,-1.535000,13.061200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700400,-1.535000,13.728700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<13.423900,-1.535000,13.061200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.546600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,24.384000>}
box{<0,0,-0.203200><0.372600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.546600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,28.515600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,28.160000>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<13.563600,-1.535000,28.515600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,29.904300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,28.515600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.563600,-1.535000,28.515600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.563600,-1.535000,29.904300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.545600,-1.535000,30.886300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.563600,-1.535000,29.904300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700400,-1.535000,11.671200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.211200,-1.535000,11.160400>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<13.700400,-1.535000,11.671200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700400,-1.535000,13.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,13.947400>}
box{<0,0,-0.203200><0.309359,0.035000,0.203200> rotate<0,-44.983935,0> translate<13.700400,-1.535000,13.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,13.947400>}
box{<0,0,-0.203200><3.781800,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.919200,-1.535000,13.947400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,28.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.919200,-1.535000,24.011300>}
box{<0,0,-0.203200><4.148700,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.919200,-1.535000,24.011300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,9.639200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,8.902700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<13.982700,-1.535000,9.639200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,9.639200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.982700,-1.535000,9.639200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,10.159400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<13.982700,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,10.160400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<13.982700,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.680700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.160400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.982700,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.680700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.388900,-1.535000,11.086900>}
box{<0,0,-0.203200><0.574454,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.982700,-1.535000,10.680700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.211200,-1.535000,11.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.388900,-1.535000,11.086900>}
box{<0,0,-0.203200><0.192301,0.035000,0.203200> rotate<0,22.469407,0> translate<14.211200,-1.535000,11.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.545600,-1.535000,30.886300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.934300,-1.535000,30.886300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<14.545600,-1.535000,30.886300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,8.902700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,8.902700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<14.719200,-1.535000,8.902700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,32.757200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390300,-1.535000,32.271800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<15.189200,-1.535000,32.757200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,34.027200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,32.757200>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.189200,-1.535000,32.757200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189200,-1.535000,34.027200>}
box{<0,0,-0.203200><4.022000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.189200,-1.535000,34.027200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,10.159400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.238900,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,8.902700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.158900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<15.239400,-1.535000,10.158900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,8.940800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,9.347200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,9.753600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.158900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.158900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,10.158900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,8.902700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,8.902700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240400,-1.535000,8.902700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.158900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,8.902700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.240400,-1.535000,8.902700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,10.160400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.241000,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.159400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.241000,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,10.160000>}
box{<0,0,-0.203200><7.568200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.241000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.160400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.241000,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390300,-1.535000,32.271800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.761800,-1.535000,31.900300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<15.390300,-1.535000,32.271800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,8.902700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,9.639200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.760700,-1.535000,8.902700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.761800,-1.535000,31.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,27.392900>}
box{<0,0,-0.203200><6.374426,0.035000,0.203200> rotate<0,44.997030,0> translate<15.761800,-1.535000,31.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798800,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.437100,-1.535000,8.940800>}
box{<0,0,-0.203200><6.638300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.798800,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.934300,-1.535000,30.886300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,29.904300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<15.934300,-1.535000,30.886300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.091000,-1.535000,11.086800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.268700,-1.535000,11.160400>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,-22.496933,0> translate<16.091000,-1.535000,11.086800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.091000,-1.535000,11.086800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.680700>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,44.989977,0> translate<16.091000,-1.535000,11.086800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.205100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,10.972800>}
box{<0,0,-0.203200><6.604100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.205100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.205200,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.605400,-1.535000,9.347200>}
box{<0,0,-0.203200><6.400200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.205200,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.247200,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.772700,-1.535000,40.690700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.247200,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.268700,-1.535000,11.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779500,-1.535000,11.671200>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.268700,-1.535000,11.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.340600,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.182100,-1.535000,30.480000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.340600,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.487500,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,11.379200>}
box{<0,0,-0.203200><6.321700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.487500,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,9.639200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.159400>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,90.000000,0> translate<16.497200,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,9.753600>}
box{<0,0,-0.203200><6.312000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.497200,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.680700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,90.000000,0> translate<16.497200,-1.535000,10.680700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,10.566400>}
box{<0,0,-0.203200><6.312000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.497200,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,13.947400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,17.729200>}
box{<0,0,-0.203200><3.781800,0.035000,0.203200> rotate<0,90.000000,0> translate<16.560700,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,13.947400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779500,-1.535000,13.728700>}
box{<0,0,-0.203200><0.309359,0.035000,0.203200> rotate<0,44.983935,0> translate<16.560700,-1.535000,13.947400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.056300,-1.535000,14.224000>}
box{<0,0,-0.203200><8.495600,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.462700,-1.535000,14.630400>}
box{<0,0,-0.203200><8.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.575900,-1.535000,15.036800>}
box{<0,0,-0.203200><8.015200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.446500,-1.535000,15.443200>}
box{<0,0,-0.203200><0.885800,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.878300,-1.535000,15.849600>}
box{<0,0,-0.203200><0.317600,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.688600,-1.535000,16.256000>}
box{<0,0,-0.203200><0.127900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672700,-1.535000,16.662400>}
box{<0,0,-0.203200><0.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.810500,-1.535000,17.068800>}
box{<0,0,-0.203200><0.249800,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.201400,-1.535000,17.475200>}
box{<0,0,-0.203200><0.640700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.730100,-1.535000,17.729200>}
box{<0,0,-0.203200><0.169400,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,25.281300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,28.160000>}
box{<0,0,-0.203200><2.878700,0.035000,0.203200> rotate<0,90.000000,0> translate<16.560700,-1.535000,28.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,25.281300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.830400,-1.535000,25.551100>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,-45.007650,0> translate<16.560700,-1.535000,25.281300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.956200,-1.535000,25.603200>}
box{<0,0,-0.203200><0.395500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,26.009600>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,26.416000>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,26.822400>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,27.228800>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.026900,-1.535000,27.635200>}
box{<0,0,-0.203200><3.466200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.620500,-1.535000,28.041600>}
box{<0,0,-0.203200><3.059800,0.035000,0.203200> rotate<0,0.000000,0> translate<16.560700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.560700,-1.535000,28.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,28.515600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.560700,-1.535000,28.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.422000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.689900,-1.535000,16.248200>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<16.662400,-1.535000,16.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.422000>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.662400,-1.535000,16.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,16.509400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662400,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,16.510400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662400,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.597900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.510400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.662400,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,16.597900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.689900,-1.535000,16.771700>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<16.662400,-1.535000,16.597900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.689900,-1.535000,16.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.744300,-1.535000,16.080900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<16.689900,-1.535000,16.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.689900,-1.535000,16.771700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.744300,-1.535000,16.939000>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<16.689900,-1.535000,16.771700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.690600,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.649800,-1.535000,13.817600>}
box{<0,0,-0.203200><7.959200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.690600,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.730100,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.830400,-1.535000,17.628800>}
box{<0,0,-0.203200><0.141916,0.035000,0.203200> rotate<0,45.025576,0> translate<16.730100,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.744300,-1.535000,16.080900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.824100,-1.535000,15.924200>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<16.744300,-1.535000,16.080900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.744300,-1.535000,16.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.824100,-1.535000,17.095700>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<16.744300,-1.535000,16.939000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.747000,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.588500,-1.535000,30.073600>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.747000,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.772700,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.947200,-1.535000,40.690700>}
box{<0,0,-0.203200><12.174500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.772700,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779500,-1.535000,11.671200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,12.338700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<16.779500,-1.535000,11.671200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779500,-1.535000,13.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,13.061200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<16.779500,-1.535000,13.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.824100,-1.535000,15.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.927500,-1.535000,15.781900>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<16.824100,-1.535000,15.924200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.824100,-1.535000,17.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.927500,-1.535000,17.238000>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<16.824100,-1.535000,17.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.826800,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.847700,-1.535000,11.785600>}
box{<0,0,-0.203200><6.020900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.826800,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.830400,-1.535000,17.628800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.207700,-1.535000,17.472600>}
box{<0,0,-0.203200><0.408355,0.035000,0.203200> rotate<0,22.487786,0> translate<16.830400,-1.535000,17.628800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.830400,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.446500,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<16.830400,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.848700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.214100,-1.535000,28.448000>}
box{<0,0,-0.203200><2.365400,0.035000,0.203200> rotate<0,0.000000,0> translate<16.848700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.911100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.243400,-1.535000,13.411200>}
box{<0,0,-0.203200><7.332300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.911100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,28.515600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,29.904300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<16.916300,-1.535000,29.904300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.807700,-1.535000,28.854400>}
box{<0,0,-0.203200><1.891400,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916300,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.401300,-1.535000,29.260800>}
box{<0,0,-0.203200><1.485000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916300,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916300,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.994900,-1.535000,29.667200>}
box{<0,0,-0.203200><1.078600,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916300,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.927500,-1.535000,15.781900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.051900,-1.535000,15.657500>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<16.927500,-1.535000,15.781900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.927500,-1.535000,17.238000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.051900,-1.535000,17.362400>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.927500,-1.535000,17.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.995200,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.024200,-1.535000,12.192000>}
box{<0,0,-0.203200><6.029000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.995200,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.051900,-1.535000,15.657500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.194200,-1.535000,15.554100>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<17.051900,-1.535000,15.657500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.051900,-1.535000,17.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.194200,-1.535000,17.465800>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<17.051900,-1.535000,17.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,12.338700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,13.061200>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.056000,-1.535000,13.061200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.430600,-1.535000,12.598400>}
box{<0,0,-0.203200><6.374600,0.035000,0.203200> rotate<0,0.000000,0> translate<17.056000,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056000,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.837000,-1.535000,13.004800>}
box{<0,0,-0.203200><6.781000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.056000,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.194200,-1.535000,15.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.350900,-1.535000,15.474300>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,26.985841,0> translate<17.194200,-1.535000,15.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.194200,-1.535000,17.465800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.207700,-1.535000,17.472600>}
box{<0,0,-0.203200><0.015116,0.035000,0.203200> rotate<0,-26.732800,0> translate<17.194200,-1.535000,17.465800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.350900,-1.535000,15.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.518200,-1.535000,15.419900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,18.011491,0> translate<17.350900,-1.535000,15.474300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.446500,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.113400,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.446500,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.518200,-1.535000,15.419900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.692000,-1.535000,15.392400>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,8.990654,0> translate<17.518200,-1.535000,15.419900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.692000,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,15.392400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.692000,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,16.509400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.778900,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,16.508900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,16.508900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,15.443200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,15.849600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,16.256000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,16.508900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,16.508900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,16.508900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.867900,-1.535000,15.392400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,16.508900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,15.392400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,16.510400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.781000,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.509400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.510400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,35.610700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,38.049200>}
box{<0,0,-0.203200><2.438500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.830700,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,35.610700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.000000,-1.535000,35.610700>}
box{<0,0,-0.203200><0.169300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,35.610700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.152500,-1.535000,35.763200>}
box{<0,0,-0.203200><0.321800,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.272500,-1.535000,36.169600>}
box{<0,0,-0.203200><11.441800,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.866100,-1.535000,36.576000>}
box{<0,0,-0.203200><11.035400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.459700,-1.535000,36.982400>}
box{<0,0,-0.203200><10.629000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.074900,-1.535000,37.388800>}
box{<0,0,-0.203200><10.244200,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.906600,-1.535000,37.795200>}
box{<0,0,-0.203200><10.075900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.830700,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.889200,-1.535000,38.049200>}
box{<0,0,-0.203200><10.058500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.830700,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.867900,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.041700,-1.535000,15.419900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-8.990654,0> translate<17.867900,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.000000,-1.535000,35.610700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.355600,-1.535000,35.966300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.000000,-1.535000,35.610700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.041700,-1.535000,15.419900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209000,-1.535000,15.474300>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-18.011491,0> translate<18.041700,-1.535000,15.419900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.113300,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.096000,-1.535000,15.443200>}
box{<0,0,-0.203200><5.982700,0.035000,0.203200> rotate<0,0.000000,0> translate<18.113300,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.113400,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.729500,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<18.113400,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209000,-1.535000,15.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.365700,-1.535000,15.554100>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-26.985841,0> translate<18.209000,-1.535000,15.474300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.352300,-1.535000,17.472600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.365700,-1.535000,17.465800>}
box{<0,0,-0.203200><0.015027,0.035000,0.203200> rotate<0,26.904318,0> translate<18.352300,-1.535000,17.472600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.352300,-1.535000,17.472600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.729500,-1.535000,17.628800>}
box{<0,0,-0.203200><0.408263,0.035000,0.203200> rotate<0,-22.493153,0> translate<18.352300,-1.535000,17.472600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.355600,-1.535000,35.966300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.744300,-1.535000,35.966300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<18.355600,-1.535000,35.966300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.358500,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.994500,-1.535000,17.475200>}
box{<0,0,-0.203200><5.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.358500,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.365700,-1.535000,15.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.508000,-1.535000,15.657500>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<18.365700,-1.535000,15.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.365700,-1.535000,17.465800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.508000,-1.535000,17.362400>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<18.365700,-1.535000,17.465800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.508000,-1.535000,15.657500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.632400,-1.535000,15.781900>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.508000,-1.535000,15.657500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.508000,-1.535000,17.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.632400,-1.535000,17.238000>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<18.508000,-1.535000,17.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.603800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,25.603200>}
box{<0,0,-0.203200><1.665400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.603800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.632400,-1.535000,15.781900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.735800,-1.535000,15.924200>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<18.632400,-1.535000,15.781900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.632400,-1.535000,17.238000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.735800,-1.535000,17.095700>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<18.632400,-1.535000,17.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.681500,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859000,-1.535000,15.849600>}
box{<0,0,-0.203200><5.177500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.681500,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.729500,-1.535000,17.628800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,18.100400>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.729500,-1.535000,17.628800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.729500,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,25.079500>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<18.729500,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.735800,-1.535000,15.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.815600,-1.535000,16.080900>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<18.735800,-1.535000,15.924200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.735800,-1.535000,17.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.815600,-1.535000,16.939000>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<18.735800,-1.535000,17.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.749500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.817000,-1.535000,17.068800>}
box{<0,0,-0.203200><5.067500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.749500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.784000,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.744300,-1.535000,32.613600>}
box{<0,0,-0.203200><0.960300,0.035000,0.203200> rotate<0,0.000000,0> translate<18.784000,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.784000,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.709600,-1.535000,28.688100>}
box{<0,0,-0.203200><5.551566,0.035000,0.203200> rotate<0,44.996300,0> translate<18.784000,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.815600,-1.535000,16.080900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.870000,-1.535000,16.248200>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<18.815600,-1.535000,16.080900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.815600,-1.535000,16.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.870000,-1.535000,16.771700>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<18.815600,-1.535000,16.939000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.870000,-1.535000,16.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.422000>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<18.870000,-1.535000,16.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.870000,-1.535000,16.771700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.597900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<18.870000,-1.535000,16.771700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.871200,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.256000>}
box{<0,0,-0.203200><4.852400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.871200,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.880600,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,19.999500>}
box{<0,0,-0.203200><0.453255,0.035000,0.203200> rotate<0,44.997030,0> translate<18.880600,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.880600,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,20.640400>}
box{<0,0,-0.203200><0.453185,0.035000,0.203200> rotate<0,-44.988091,0> translate<18.880600,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.880600,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.474500,-1.535000,20.320000>}
box{<0,0,-0.203200><3.593900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.880600,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.880600,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,22.539500>}
box{<0,0,-0.203200><0.453255,0.035000,0.203200> rotate<0,44.997030,0> translate<18.880600,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.880600,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,23.180400>}
box{<0,0,-0.203200><0.453185,0.035000,0.203200> rotate<0,-44.988091,0> translate<18.880600,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.885700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.264600,-1.535000,32.512000>}
box{<0,0,-0.203200><12.378900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.885700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.887300,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.662400>}
box{<0,0,-0.203200><4.836300,0.035000,0.203200> rotate<0,0.000000,0> translate<18.887300,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.422000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.509400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897500,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,16.597900>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897500,-1.535000,16.597900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.982200,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,22.758400>}
box{<0,0,-0.203200><1.287000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.982200,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.982300,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.197600,-1.535000,17.881600>}
box{<0,0,-0.203200><5.215300,0.035000,0.203200> rotate<0,0.000000,0> translate<18.982300,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.083800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,25.196800>}
box{<0,0,-0.203200><1.185400,0.035000,0.203200> rotate<0,0.000000,0> translate<19.083800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.185400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,23.164800>}
box{<0,0,-0.203200><1.083800,0.035000,0.203200> rotate<0,0.000000,0> translate<19.185400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,18.100400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,18.716500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<19.201100,-1.535000,18.100400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,19.999500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,19.383400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<19.201100,-1.535000,19.999500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,20.640400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,21.256500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<19.201100,-1.535000,20.640400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,22.539500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,21.923400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<19.201100,-1.535000,22.539500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,23.180400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,23.796500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<19.201100,-1.535000,23.180400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.201100,-1.535000,25.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<19.201100,-1.535000,25.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.236700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.943300,-1.535000,19.913600>}
box{<0,0,-0.203200><4.706600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.236700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.236700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.855700,-1.535000,20.726400>}
box{<0,0,-0.203200><2.619000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.236700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.278800,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.901000,-1.535000,18.288000>}
box{<0,0,-0.203200><4.622200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.278800,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.278800,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.370700,-1.535000,22.352000>}
box{<0,0,-0.203200><1.091900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.278800,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.292100,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.433000,-1.535000,32.105600>}
box{<0,0,-0.203200><12.140900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.292100,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.320900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,24.790400>}
box{<0,0,-0.203200><0.948300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.320900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.362900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,23.571200>}
box{<0,0,-0.203200><0.906300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.362900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.405000,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.449300,-1.535000,21.132800>}
box{<0,0,-0.203200><2.044300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.405000,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.405100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.774900,-1.535000,19.507200>}
box{<0,0,-0.203200><4.369800,0.035000,0.203200> rotate<0,0.000000,0> translate<19.405100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.732700,-1.535000,18.694400>}
box{<0,0,-0.203200><4.285600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.447100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447200,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.636500,-1.535000,21.945600>}
box{<0,0,-0.203200><1.189300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.447200,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,18.716500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,19.383400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,19.383400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,19.100800>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,21.256500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,21.923400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,21.923400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.042900,-1.535000,21.539200>}
box{<0,0,-0.203200><1.586600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,23.796500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,24.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,23.977600>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,24.384000>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.698500,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.772400,-1.535000,31.699200>}
box{<0,0,-0.203200><12.073900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.698500,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.744300,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,33.595600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.744300,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.744300,-1.535000,35.966300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,34.984300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<19.744300,-1.535000,35.966300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.947400,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.678900,-1.535000,35.763200>}
box{<0,0,-0.203200><9.731500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.947400,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.049100,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,32.918400>}
box{<0,0,-0.203200><11.154800,0.035000,0.203200> rotate<0,0.000000,0> translate<20.049100,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.104900,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.054900,-1.535000,31.292800>}
box{<0,0,-0.203200><11.950000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.104900,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,22.597200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470300,-1.535000,22.111800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<20.269200,-1.535000,22.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,23.122700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,22.597200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.269200,-1.535000,22.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,27.392900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.269200,-1.535000,23.122700>}
box{<0,0,-0.203200><4.270200,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.269200,-1.535000,23.122700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.353800,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.616400,-1.535000,35.356800>}
box{<0,0,-0.203200><3.262600,0.035000,0.203200> rotate<0,0.000000,0> translate<20.353800,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.455500,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.514700,-1.535000,33.324800>}
box{<0,0,-0.203200><3.059200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.455500,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.470300,-1.535000,22.111800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.740300,-1.535000,20.841800>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<20.470300,-1.535000,22.111800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.511300,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.886400>}
box{<0,0,-0.203200><11.251400,0.035000,0.203200> rotate<0,0.000000,0> translate<20.511300,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,33.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,34.984300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<20.726300,-1.535000,34.984300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.108300,-1.535000,33.731200>}
box{<0,0,-0.203200><2.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.726300,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.137600>}
box{<0,0,-0.203200><2.286100,0.035000,0.203200> rotate<0,0.000000,0> translate<20.726300,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.544000>}
box{<0,0,-0.203200><2.286100,0.035000,0.203200> rotate<0,0.000000,0> translate<20.726300,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.726300,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.210000,-1.535000,34.950400>}
box{<0,0,-0.203200><2.483700,0.035000,0.203200> rotate<0,0.000000,0> translate<20.726300,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.917700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.839300,-1.535000,30.480000>}
box{<0,0,-0.203200><5.921600,0.035000,0.203200> rotate<0,0.000000,0> translate<20.917700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.324100,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.432900,-1.535000,30.073600>}
box{<0,0,-0.203200><5.108800,0.035000,0.203200> rotate<0,0.000000,0> translate<21.324100,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.730500,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,29.667200>}
box{<0,0,-0.203200><4.533100,0.035000,0.203200> rotate<0,0.000000,0> translate<21.730500,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.740300,-1.535000,20.841800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.111800,-1.535000,20.470300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<21.740300,-1.535000,20.841800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.111800,-1.535000,20.470300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.597200,-1.535000,20.269200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<22.111800,-1.535000,20.470300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.136900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,29.260800>}
box{<0,0,-0.203200><4.126700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.136900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,6.504300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.622700,-1.535000,5.850800>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<22.352000,-1.535000,6.504300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,8.735600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,6.504300>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.352000,-1.535000,6.504300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,8.735600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.622700,-1.535000,9.389100>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<22.352000,-1.535000,8.735600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.543300,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.854400>}
box{<0,0,-0.203200><3.720300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.543300,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.597200,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.248600,-1.535000,20.269200>}
box{<0,0,-0.203200><1.651400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.597200,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.622700,-1.535000,5.850800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.122800,-1.535000,5.350700>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<22.622700,-1.535000,5.850800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.622700,-1.535000,9.389100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,9.575500>}
box{<0,0,-0.203200><0.263680,0.035000,0.203200> rotate<0,-44.981666,0> translate<22.622700,-1.535000,9.389100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.709600,-1.535000,28.688100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,28.202700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<22.709600,-1.535000,28.688100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.331200,-1.535000,28.448000>}
box{<0,0,-0.203200><3.522100,0.035000,0.203200> rotate<0,0.000000,0> translate<22.809100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,11.692700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,9.575500>}
box{<0,0,-0.203200><2.117200,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.809200,-1.535000,9.575500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.809200,-1.535000,11.692700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010300,-1.535000,12.178100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<22.809200,-1.535000,11.692700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,23.407000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,27.677200>}
box{<0,0,-0.203200><4.270200,0.035000,0.203200> rotate<0,90.000000,0> translate<22.910700,-1.535000,27.677200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,23.407000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.407000,-1.535000,22.910700>}
box{<0,0,-0.203200><0.701874,0.035000,0.203200> rotate<0,44.997030,0> translate<22.910700,-1.535000,23.407000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.816900,-1.535000,23.571200>}
box{<0,0,-0.203200><0.906200,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,23.977600>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,24.384000>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859100,-1.535000,24.790400>}
box{<0,0,-0.203200><0.948400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.096100,-1.535000,25.196800>}
box{<0,0,-0.203200><1.185400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.576200,-1.535000,25.603200>}
box{<0,0,-0.203200><1.665500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,26.009600>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,26.416000>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,26.822400>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,27.228800>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,27.635200>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,27.677200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,28.202700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<22.910700,-1.535000,28.202700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.910700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,28.041600>}
box{<0,0,-0.203200><3.708500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.910700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.010300,-1.535000,12.178100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.381800,-1.535000,12.549600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.010300,-1.535000,12.178100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,33.827100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,33.172400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<23.012400,-1.535000,33.827100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.289400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,33.827100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.012400,-1.535000,33.827100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.289400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,34.289400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.012400,-1.535000,34.289400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.290400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,34.290400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.012400,-1.535000,34.290400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.752800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.290400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.012400,-1.535000,34.290400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,34.752800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,35.407500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.012400,-1.535000,34.752800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.122800,-1.535000,5.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.776300,-1.535000,5.080000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<23.122800,-1.535000,5.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.152900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.994400,-1.535000,23.164800>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.152900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.381800,-1.535000,12.549600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.651800,-1.535000,13.819600>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.381800,-1.535000,12.549600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.407000,-1.535000,22.910700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.248600,-1.535000,22.910700>}
box{<0,0,-0.203200><0.841600,0.035000,0.203200> rotate<0,0.000000,0> translate<23.407000,-1.535000,22.910700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,33.172400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,33.172400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667100,-1.535000,33.172400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,35.407500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,35.407500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667100,-1.535000,35.407500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.176500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,15.560400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<23.723600,-1.535000,16.176500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.843400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.176500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.723600,-1.535000,16.176500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,16.843400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,17.459500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<23.723600,-1.535000,16.843400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,18.716500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,18.100400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<23.723600,-1.535000,18.716500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,19.383400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,18.716500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.723600,-1.535000,18.716500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,19.383400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,19.999500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<23.723600,-1.535000,19.383400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,23.796500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,23.180400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<23.723600,-1.535000,23.796500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,24.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,23.796500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.723600,-1.535000,23.796500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.723600,-1.535000,24.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,25.079500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<23.723600,-1.535000,24.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.776300,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.483600,-1.535000,5.080000>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.776300,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,15.560400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.450400,-1.535000,15.088800>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<23.978800,-1.535000,15.560400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,17.459500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.299300,-1.535000,17.780000>}
box{<0,0,-0.203200><0.453255,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.978800,-1.535000,17.459500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,18.100400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.299300,-1.535000,17.780000>}
box{<0,0,-0.203200><0.453185,0.035000,0.203200> rotate<0,44.988091,0> translate<23.978800,-1.535000,18.100400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,19.999500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.248600,-1.535000,20.269200>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,-44.986411,0> translate<23.978800,-1.535000,19.999500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,23.180400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.248600,-1.535000,22.910700>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,44.986411,0> translate<23.978800,-1.535000,23.180400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.978800,-1.535000,25.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.450400,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.978800,-1.535000,25.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,34.290400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,34.289400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.128900,-1.535000,34.289400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,33.172400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.288900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<24.129400,-1.535000,34.288900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,33.324800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,33.731200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.137600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.288900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.288900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,34.288900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.291000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,35.407500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<24.129400,-1.535000,35.407500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.291000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.291000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,34.291000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.544000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.950400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,35.356800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,33.172400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,33.172400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130400,-1.535000,33.172400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.288900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,33.172400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130400,-1.535000,33.172400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,35.407500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,34.291000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130400,-1.535000,34.291000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,35.407500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,35.407500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130400,-1.535000,35.407500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,34.289400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,34.290400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.131000,-1.535000,34.290400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,34.289400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.289400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.131000,-1.535000,34.289400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,34.290400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.290400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.131000,-1.535000,34.290400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.450400,-1.535000,15.088800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.066500,-1.535000,14.833600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<24.450400,-1.535000,15.088800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.450400,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.066500,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<24.450400,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.483600,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.137100,-1.535000,5.350700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<24.483600,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,33.172400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,33.827100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.592800,-1.535000,33.172400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,35.407500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.752800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<24.592800,-1.535000,35.407500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.643500,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.085300,-1.535000,35.356800>}
box{<0,0,-0.203200><5.441800,0.035000,0.203200> rotate<0,0.000000,0> translate<24.643500,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.651800,-1.535000,13.819600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.665900,-1.535000,14.833600>}
box{<0,0,-0.203200><1.434083,0.035000,0.203200> rotate<0,-44.994205,0> translate<24.651800,-1.535000,13.819600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.745200,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,33.324800>}
box{<0,0,-0.203200><6.458700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.745200,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.974100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.825700,-1.535000,5.283200>}
box{<0,0,-0.203200><0.851600,0.035000,0.203200> rotate<0,0.000000,0> translate<24.974100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.049900,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.491700,-1.535000,34.950400>}
box{<0,0,-0.203200><5.441800,0.035000,0.203200> rotate<0,0.000000,0> translate<25.049900,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.066500,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.665900,-1.535000,14.833600>}
box{<0,0,-0.203200><0.599400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.066500,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.066500,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.733400,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.066500,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.137100,-1.535000,5.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,5.613600>}
box{<0,0,-0.203200><0.371797,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.137100,-1.535000,5.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.151600,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.349000,-1.535000,33.731200>}
box{<0,0,-0.203200><6.197400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.151600,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,33.827100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.289400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<25.247500,-1.535000,34.289400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.304500,-1.535000,34.137600>}
box{<0,0,-0.203200><6.057000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.247500,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.290400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.752800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<25.247500,-1.535000,34.752800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.898100,-1.535000,34.544000>}
box{<0,0,-0.203200><5.650600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.247500,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,5.613600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.662800,-1.535000,5.350700>}
box{<0,0,-0.203200><0.371726,0.035000,0.203200> rotate<0,45.007928,0> translate<25.400000,-1.535000,5.613600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.662800,-1.535000,5.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.316300,-1.535000,5.080000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<25.662800,-1.535000,5.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.733400,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.349500,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<25.733400,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.223800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,25.603200>}
box{<0,0,-0.203200><0.395400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.223800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.515600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,28.160100>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,44.988973,0> translate<26.263600,-1.535000,28.515600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,29.904300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.515600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,28.515600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,29.904300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.245600,-1.535000,30.886300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.263600,-1.535000,29.904300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.316300,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.023600,-1.535000,5.080000>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.316300,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.349500,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,25.281300>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,45.007650,0> translate<26.349500,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.551300,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.821100,-1.535000,17.459500>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,44.986411,0> translate<26.551300,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.551300,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.932700,-1.535000,17.729200>}
box{<0,0,-0.203200><0.381400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.551300,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,28.160100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.619200,-1.535000,25.281300>}
box{<0,0,-0.203200><2.878800,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.619200,-1.535000,25.281300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.805400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.307500,-1.535000,17.475200>}
box{<0,0,-0.203200><1.502100,0.035000,0.203200> rotate<0,0.000000,0> translate<26.805400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.821100,-1.535000,17.459500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.843400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<26.821100,-1.535000,17.459500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.932700,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.418100,-1.535000,17.930300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<26.932700,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.983000,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.901100,-1.535000,17.068800>}
box{<0,0,-0.203200><0.918100,0.035000,0.203200> rotate<0,0.000000,0> translate<26.983000,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.023600,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.677100,-1.535000,5.350700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<27.023600,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.843400>}
box{<0,0,-0.203200><0.599400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.076300,-1.535000,16.843400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,17.971400>}
box{<0,0,-0.203200><2.442842,0.035000,0.203200> rotate<0,-44.998689,0> translate<27.076300,-1.535000,16.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.088300,-1.535000,16.256000>}
box{<0,0,-0.203200><0.012000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.076300,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076300,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.494700,-1.535000,16.662400>}
box{<0,0,-0.203200><0.418400,0.035000,0.203200> rotate<0,0.000000,0> translate<27.076300,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.245600,-1.535000,30.886300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.634300,-1.535000,30.886300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.245600,-1.535000,30.886300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.300500,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.713900,-1.535000,17.881600>}
box{<0,0,-0.203200><1.413400,0.035000,0.203200> rotate<0,0.000000,0> translate<27.300500,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.418100,-1.535000,17.930300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.688100,-1.535000,19.200300>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.418100,-1.535000,17.930300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.514100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.780000,-1.535000,5.283200>}
box{<0,0,-0.203200><8.265900,0.035000,0.203200> rotate<0,0.000000,0> translate<27.514100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.677100,-1.535000,5.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.177200,-1.535000,5.850800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.677100,-1.535000,5.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.775800,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,18.288000>}
box{<0,0,-0.203200><1.027800,0.035000,0.203200> rotate<0,0.000000,0> translate<27.775800,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.889200,-1.535000,37.837200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.090300,-1.535000,37.351800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<27.889200,-1.535000,37.837200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.889200,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.889200,-1.535000,37.837200>}
box{<0,0,-0.203200><0.212000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.889200,-1.535000,37.837200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.990700,-1.535000,9.575600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.990700,-1.535000,9.613000>}
box{<0,0,-0.203200><0.037400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.990700,-1.535000,9.613000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.990700,-1.535000,9.575600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.177200,-1.535000,9.389100>}
box{<0,0,-0.203200><0.263751,0.035000,0.203200> rotate<0,44.997030,0> translate<27.990700,-1.535000,9.575600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.990700,-1.535000,9.613000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.756900,-1.535000,11.379200>}
box{<0,0,-0.203200><2.497784,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.990700,-1.535000,9.613000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.016000,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.860300,-1.535000,5.689600>}
box{<0,0,-0.203200><0.844300,0.035000,0.203200> rotate<0,0.000000,0> translate<28.016000,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.090300,-1.535000,37.351800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.461800,-1.535000,36.980300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<28.090300,-1.535000,37.351800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.131300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,9.753600>}
box{<0,0,-0.203200><7.631900,0.035000,0.203200> rotate<0,0.000000,0> translate<28.131300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.177200,-1.535000,5.850800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.270700,-1.535000,6.076600>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,-67.501918,0> translate<28.177200,-1.535000,5.850800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.177200,-1.535000,9.389100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.270700,-1.535000,9.163300>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,67.501918,0> translate<28.177200,-1.535000,9.389100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.182200,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.023700,-1.535000,18.694400>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.182200,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194600,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.464400,-1.535000,9.347200>}
box{<0,0,-0.203200><0.269800,0.035000,0.203200> rotate<0,0.000000,0> translate<28.194600,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.270700,-1.535000,6.076600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.280000,-1.535000,6.063700>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,54.207449,0> translate<28.270700,-1.535000,6.076600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.270700,-1.535000,9.163300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.280000,-1.535000,9.176200>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,-54.207449,0> translate<28.270700,-1.535000,9.163300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.280000,-1.535000,6.063700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.415700,-1.535000,5.928000>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<28.280000,-1.535000,6.063700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.280000,-1.535000,9.176200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.415700,-1.535000,9.311900>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.280000,-1.535000,9.176200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.415700,-1.535000,5.928000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571000,-1.535000,5.815200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,35.989884,0> translate<28.415700,-1.535000,5.928000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.415700,-1.535000,9.311900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571000,-1.535000,9.424700>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-35.989884,0> translate<28.415700,-1.535000,9.311900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.461800,-1.535000,36.980300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.455000,-1.535000,33.987200>}
box{<0,0,-0.203200><4.232953,0.035000,0.203200> rotate<0,44.996073,0> translate<28.461800,-1.535000,36.980300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.537700,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,10.160000>}
box{<0,0,-0.203200><7.225500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.537700,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571000,-1.535000,5.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.741900,-1.535000,5.728100>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,27.004100,0> translate<28.571000,-1.535000,5.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571000,-1.535000,9.424700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.741900,-1.535000,9.511800>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-27.004100,0> translate<28.571000,-1.535000,9.424700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.588600,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.430100,-1.535000,19.100800>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.588600,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.634300,-1.535000,30.886300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,29.904300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<28.634300,-1.535000,30.886300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.688100,-1.535000,19.200300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.059600,-1.535000,19.571800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.688100,-1.535000,19.200300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.741900,-1.535000,5.728100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.924400,-1.535000,5.668800>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,17.999424,0> translate<28.741900,-1.535000,5.728100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.741900,-1.535000,9.511800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.924400,-1.535000,9.571100>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-17.999424,0> translate<28.741900,-1.535000,9.511800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,18.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,17.971400>}
box{<0,0,-0.203200><0.502900,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.803600,-1.535000,17.971400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,18.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,19.456300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.803600,-1.535000,18.474300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.924400,-1.535000,5.668800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.114000,-1.535000,5.638800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,8.990654,0> translate<28.924400,-1.535000,5.668800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.924400,-1.535000,9.571100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.114000,-1.535000,9.601100>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-8.990654,0> translate<28.924400,-1.535000,9.571100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.944100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.576800,-1.535000,10.566400>}
box{<0,0,-0.203200><6.632700,0.035000,0.203200> rotate<0,0.000000,0> translate<28.944100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.947200,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.472700,-1.535000,40.690700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.947200,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.995000,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,19.507200>}
box{<0,0,-0.203200><2.704200,0.035000,0.203200> rotate<0,0.000000,0> translate<28.995000,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.040600,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,30.480000>}
box{<0,0,-0.203200><3.978300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.040600,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.059600,-1.535000,19.571800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,20.057200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<29.059600,-1.535000,19.571800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.114000,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,5.638800>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.114000,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.114000,-1.535000,9.601100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,9.601100>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.114000,-1.535000,9.601100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.568500>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,90.000000,0> translate<29.159000,-1.535000,7.568500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,6.096000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,6.502400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,6.908800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.315200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.568500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.568500>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,7.568500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.671400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,9.601100>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,90.000000,0> translate<29.159000,-1.535000,9.601100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.671400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.671400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,7.671400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.721600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,8.128000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,8.534400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,8.940800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.159000,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,9.347200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.159000,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.201200,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,19.913600>}
box{<0,0,-0.203200><2.498000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.201200,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,20.057200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,21.539200>}
box{<0,0,-0.203200><1.482000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.260700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,20.320000>}
box{<0,0,-0.203200><2.438500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.758800,-1.535000,20.726400>}
box{<0,0,-0.203200><2.498100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.965000,-1.535000,21.132800>}
box{<0,0,-0.203200><2.704300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.430100,-1.535000,21.539200>}
box{<0,0,-0.203200><0.169400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,24.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,28.160100>}
box{<0,0,-0.203200><3.979400,0.035000,0.203200> rotate<0,90.000000,0> translate<29.260700,-1.535000,28.160100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,24.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.430100,-1.535000,24.180700>}
box{<0,0,-0.203200><0.169400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,24.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.633400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.372700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.019100,-1.535000,24.790400>}
box{<0,0,-0.203200><4.758400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.256100,-1.535000,25.196800>}
box{<0,0,-0.203200><4.995400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.736200,-1.535000,25.603200>}
box{<0,0,-0.203200><5.475500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.463000,-1.535000,26.009600>}
box{<0,0,-0.203200><10.202300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.788200,-1.535000,26.416000>}
box{<0,0,-0.203200><10.527500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.194600,-1.535000,26.822400>}
box{<0,0,-0.203200><10.933900,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.601000,-1.535000,27.228800>}
box{<0,0,-0.203200><11.340300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.007400,-1.535000,27.635200>}
box{<0,0,-0.203200><11.746700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.413800,-1.535000,28.041600>}
box{<0,0,-0.203200><12.153100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260700,-1.535000,28.160100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.515600>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<29.260700,-1.535000,28.160100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.305900,-1.535000,5.638800>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260800,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.568500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,5.638800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.260800,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,9.601100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,7.671400>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.260800,-1.535000,7.671400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.260800,-1.535000,9.601100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.305900,-1.535000,9.601100>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.260800,-1.535000,9.601100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.261400,-1.535000,7.569000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.261400,-1.535000,7.670800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,90.000000,0> translate<29.261400,-1.535000,7.670800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.261400,-1.535000,7.569000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.569000>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.261400,-1.535000,7.569000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.261400,-1.535000,7.670800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.670800>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.261400,-1.535000,7.670800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.305900,-1.535000,5.638800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.495500,-1.535000,5.668800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-8.990654,0> translate<29.305900,-1.535000,5.638800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.305900,-1.535000,9.601100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.495500,-1.535000,9.571100>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,8.990654,0> translate<29.305900,-1.535000,9.601100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.350500,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,10.972800>}
box{<0,0,-0.203200><6.057100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.350500,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.430100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,21.183600>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,45.005087,0> translate<29.430100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.430100,-1.535000,24.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,24.536300>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-45.005087,0> translate<29.430100,-1.535000,24.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.447000,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.073600>}
box{<0,0,-0.203200><2.315700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.447000,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.472700,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,40.690700>}
box{<0,0,-0.203200><1.227300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.472700,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.495500,-1.535000,5.668800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.678000,-1.535000,5.728100>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-17.999424,0> translate<29.495500,-1.535000,5.668800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.495500,-1.535000,9.571100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.678000,-1.535000,9.511800>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,17.999424,0> translate<29.495500,-1.535000,9.571100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.548600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.820200,-1.535000,28.448000>}
box{<0,0,-0.203200><12.271600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.548600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.559500,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,5.689600>}
box{<0,0,-0.203200><5.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.559500,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.515600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,29.904300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,29.904300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.226600,-1.535000,28.854400>}
box{<0,0,-0.203200><12.610300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.461100,-1.535000,29.260800>}
box{<0,0,-0.203200><2.844800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.054700,-1.535000,29.667200>}
box{<0,0,-0.203200><2.438400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.678000,-1.535000,5.728100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.848900,-1.535000,5.815200>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-27.004100,0> translate<29.678000,-1.535000,5.728100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.678000,-1.535000,9.511800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.848900,-1.535000,9.424700>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,27.004100,0> translate<29.678000,-1.535000,9.511800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.756900,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.487200,-1.535000,11.379200>}
box{<0,0,-0.203200><1.730300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.756900,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,19.456300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,19.456300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.785600,-1.535000,19.456300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,21.183600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.785600,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.785600,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,24.536300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.785600,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.848900,-1.535000,5.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.004200,-1.535000,5.928000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-35.989884,0> translate<29.848900,-1.535000,5.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.848900,-1.535000,9.424700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.004200,-1.535000,9.311900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,35.989884,0> translate<29.848900,-1.535000,9.424700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.955600,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,9.347200>}
box{<0,0,-0.203200><5.807600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.955600,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.004200,-1.535000,5.928000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139900,-1.535000,6.063700>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.004200,-1.535000,5.928000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.004200,-1.535000,9.311900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139900,-1.535000,9.176200>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<30.004200,-1.535000,9.311900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139900,-1.535000,6.063700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.252700,-1.535000,6.219000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<30.139900,-1.535000,6.063700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139900,-1.535000,9.176200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.252700,-1.535000,9.020900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<30.139900,-1.535000,9.176200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.163300,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,6.096000>}
box{<0,0,-0.203200><5.244300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.163300,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.252700,-1.535000,6.219000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.339800,-1.535000,6.389900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<30.252700,-1.535000,6.219000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.252700,-1.535000,9.020900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.339800,-1.535000,8.850000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<30.252700,-1.535000,9.020900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.293600,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,8.940800>}
box{<0,0,-0.203200><5.469600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.293600,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.339800,-1.535000,6.389900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.399100,-1.535000,6.572400>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<30.339800,-1.535000,6.389900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.339800,-1.535000,8.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.399100,-1.535000,8.667500>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<30.339800,-1.535000,8.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.376300,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,6.502400>}
box{<0,0,-0.203200><5.031300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.376300,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.399100,-1.535000,6.572400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,6.762000>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<30.399100,-1.535000,6.572400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.399100,-1.535000,8.667500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,8.477900>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<30.399100,-1.535000,8.667500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.420200,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,8.534400>}
box{<0,0,-0.203200><5.343000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.420200,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,6.762000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.569000>}
box{<0,0,-0.203200><0.807000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.429100,-1.535000,7.569000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,6.908800>}
box{<0,0,-0.203200><4.978500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.429100,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.678500,-1.535000,7.315200>}
box{<0,0,-0.203200><5.249400,0.035000,0.203200> rotate<0,0.000000,0> translate<30.429100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.670800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,8.477900>}
box{<0,0,-0.203200><0.807100,0.035000,0.203200> rotate<0,90.000000,0> translate<30.429100,-1.535000,8.477900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,7.721600>}
box{<0,0,-0.203200><5.334100,0.035000,0.203200> rotate<0,0.000000,0> translate<30.429100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.429100,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,8.128000>}
box{<0,0,-0.203200><5.334100,0.035000,0.203200> rotate<0,0.000000,0> translate<30.429100,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.055600,-1.535000,41.046300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.700000,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.055600,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.444300,-1.535000,41.046300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.055600,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,19.456300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,18.931300>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,45.002487,0> translate<31.174300,-1.535000,19.456300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,21.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,22.165600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.174300,-1.535000,21.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.174300,-1.535000,24.536300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,23.554300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<31.174300,-1.535000,24.536300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,32.658700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.480400,-1.535000,31.991200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<31.203900,-1.535000,32.658700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,33.381200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,32.658700>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.203900,-1.535000,32.658700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.203900,-1.535000,33.381200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.455000,-1.535000,33.987200>}
box{<0,0,-0.203200><0.655963,0.035000,0.203200> rotate<0,-67.488559,0> translate<31.203900,-1.535000,33.381200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.326600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,24.384000>}
box{<0,0,-0.203200><2.557000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.326600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.480400,-1.535000,31.991200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.991200,-1.535000,31.480400>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<31.480400,-1.535000,31.991200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.484000,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.444300,-1.535000,37.693600>}
box{<0,0,-0.203200><0.960300,0.035000,0.203200> rotate<0,0.000000,0> translate<31.484000,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.484000,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.139600,-1.535000,35.038100>}
box{<0,0,-0.203200><3.755515,0.035000,0.203200> rotate<0,44.995951,0> translate<31.484000,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.487200,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.012700,-1.535000,11.379200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.487200,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.529800,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,19.100800>}
box{<0,0,-0.203200><0.169400,0.035000,0.203200> rotate<0,0.000000,0> translate<31.529800,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.529900,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.371400,-1.535000,21.539200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.529900,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,20.057200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,18.931300>}
box{<0,0,-0.203200><1.125900,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.699200,-1.535000,18.931300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,20.582700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,20.057200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.699200,-1.535000,20.057200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.699200,-1.535000,20.582700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.900300,-1.535000,21.068100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<31.699200,-1.535000,20.582700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.733000,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,23.977600>}
box{<0,0,-0.203200><2.150600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.733000,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,29.959200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.499200,-1.535000,29.222700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<31.762700,-1.535000,29.959200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,29.959200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.762700,-1.535000,29.959200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.762700,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.762700,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,31.000700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,30.480400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.762700,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.762700,-1.535000,31.000700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.168900,-1.535000,31.406800>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,-44.989977,0> translate<31.762700,-1.535000,31.000700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.788900,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,37.388800>}
box{<0,0,-0.203200><12.610300,0.035000,0.203200> rotate<0,0.000000,0> translate<31.788900,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.900300,-1.535000,21.068100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.541800,-1.535000,22.709600>}
box{<0,0,-0.203200><2.321432,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.900300,-1.535000,21.068100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.936300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.777800,-1.535000,21.945600>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.936300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.991200,-1.535000,31.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.168900,-1.535000,31.406800>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,22.496933,0> translate<31.991200,-1.535000,31.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.012700,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.498100,-1.535000,11.580300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<32.012700,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.012700,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,11.379200>}
box{<0,0,-0.203200><3.394900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.012700,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.139400,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.976900,-1.535000,23.571200>}
box{<0,0,-0.203200><1.837500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.139400,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,22.165600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,23.554300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<32.156300,-1.535000,23.554300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.184200,-1.535000,22.352000>}
box{<0,0,-0.203200><1.027900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.156300,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.659600,-1.535000,22.758400>}
box{<0,0,-0.203200><1.503300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.156300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.156300,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.154400,-1.535000,23.164800>}
box{<0,0,-0.203200><1.998100,0.035000,0.203200> rotate<0,0.000000,0> translate<32.156300,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.195300,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,36.982400>}
box{<0,0,-0.203200><12.203900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.195300,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.444300,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,38.675600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.444300,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.444300,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,40.064300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<32.444300,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.498100,-1.535000,11.580300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.768000,-1.535000,12.850300>}
box{<0,0,-0.203200><1.795981,0.035000,0.203200> rotate<0,-44.999286,0> translate<32.498100,-1.535000,11.580300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.499200,-1.535000,29.222700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,29.222700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.499200,-1.535000,29.222700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.545900,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.654000,-1.535000,37.795200>}
box{<0,0,-0.203200><11.108100,0.035000,0.203200> rotate<0,0.000000,0> translate<32.545900,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.601700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,36.576000>}
box{<0,0,-0.203200><11.797500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.601700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.703300,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,11.785600>}
box{<0,0,-0.203200><2.704300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.703300,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.850600,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.349300,-1.535000,40.640000>}
box{<0,0,-0.203200><10.498700,0.035000,0.203200> rotate<0,0.000000,0> translate<32.850600,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.952300,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.247600,-1.535000,38.201600>}
box{<0,0,-0.203200><10.295300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.952300,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.008100,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,36.169600>}
box{<0,0,-0.203200><11.391100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.008100,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.018900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,29.222700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,30.478900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<33.019400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,29.260800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,29.667200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,30.073600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,30.478900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,29.222700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.540700,-1.535000,29.222700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020400,-1.535000,29.222700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,29.222700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020400,-1.535000,29.222700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.021000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.479400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.021000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.611600,-1.535000,30.480000>}
box{<0,0,-0.203200><7.590600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.021000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.480400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.021000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.109700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.475300,-1.535000,12.192000>}
box{<0,0,-0.203200><2.365600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.109700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.257000,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.942900,-1.535000,40.233600>}
box{<0,0,-0.203200><9.685900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.257000,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.358700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.841200,-1.535000,38.608000>}
box{<0,0,-0.203200><9.482500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.358700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.414500,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.055400,-1.535000,35.763200>}
box{<0,0,-0.203200><10.640900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.414500,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,38.675600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,40.064300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<33.426300,-1.535000,40.064300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,39.014400>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.426300,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,39.420800>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.426300,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426300,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,39.827200>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.426300,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.516100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.881700,-1.535000,12.598400>}
box{<0,0,-0.203200><2.365600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.516100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.540700,-1.535000,29.222700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,29.959200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.540700,-1.535000,29.222700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.541800,-1.535000,22.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.027200,-1.535000,22.910700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<33.541800,-1.535000,22.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.578800,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.633000,-1.535000,29.260800>}
box{<0,0,-0.203200><9.054200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.578800,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.768000,-1.535000,12.850300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.768100,-1.535000,12.850300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.768000,-1.535000,12.850300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.768100,-1.535000,12.850300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.139600,-1.535000,13.221800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.768100,-1.535000,12.850300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.820900,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.649000,-1.535000,35.356800>}
box{<0,0,-0.203200><9.828100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.820900,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.871000,-1.535000,31.406800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.048700,-1.535000,31.480400>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,-22.496933,0> translate<33.871000,-1.535000,31.406800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.871000,-1.535000,31.406800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,31.000700>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,44.989977,0> translate<33.871000,-1.535000,31.406800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,23.796500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.138800,-1.535000,23.180400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<33.883600,-1.535000,23.796500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,24.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,23.796500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,23.796500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,24.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.138800,-1.535000,25.079500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<33.883600,-1.535000,24.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.922600,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288100,-1.535000,13.004800>}
box{<0,0,-0.203200><2.365500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.922600,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.985100,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.292800>}
box{<0,0,-0.203200><4.127600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.985100,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.985200,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.039400,-1.535000,29.667200>}
box{<0,0,-0.203200><9.054200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.985200,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.027200,-1.535000,22.910700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.408600,-1.535000,22.910700>}
box{<0,0,-0.203200><0.381400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.027200,-1.535000,22.910700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.048700,-1.535000,31.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.559500,-1.535000,31.991200>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.048700,-1.535000,31.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.138800,-1.535000,23.180400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.408600,-1.535000,22.910700>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,44.986411,0> translate<34.138800,-1.535000,23.180400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.138800,-1.535000,25.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.610400,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.138800,-1.535000,25.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.139600,-1.535000,13.221800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,13.707200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<34.139600,-1.535000,13.221800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.139600,-1.535000,35.038100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,34.552700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<34.139600,-1.535000,35.038100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.176000,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.294000,-1.535000,34.950400>}
box{<0,0,-0.203200><9.118000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.176000,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.218000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,13.411200>}
box{<0,0,-0.203200><8.911200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.218000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.267500,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.699200>}
box{<0,0,-0.203200><3.845200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.267500,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,29.959200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.479400>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,90.000000,0> translate<34.277200,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.211400,-1.535000,30.073600>}
box{<0,0,-0.203200><6.934200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.277200,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,31.000700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,90.000000,0> translate<34.277200,-1.535000,31.000700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.277200,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.455500,-1.535000,30.886400>}
box{<0,0,-0.203200><4.178300,0.035000,0.203200> rotate<0,0.000000,0> translate<34.277200,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,13.707200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,19.772900>}
box{<0,0,-0.203200><6.065700,0.035000,0.203200> rotate<0,90.000000,0> translate<34.340700,-1.535000,19.772900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,13.817600>}
box{<0,0,-0.203200><8.788500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,14.224000>}
box{<0,0,-0.203200><8.788500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,14.630400>}
box{<0,0,-0.203200><8.788500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.355900,-1.535000,15.036800>}
box{<0,0,-0.203200><8.015200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.226500,-1.535000,15.443200>}
box{<0,0,-0.203200><0.885800,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658300,-1.535000,15.849600>}
box{<0,0,-0.203200><0.317600,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.468600,-1.535000,16.256000>}
box{<0,0,-0.203200><0.127900,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.452700,-1.535000,16.662400>}
box{<0,0,-0.203200><0.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.590500,-1.535000,17.068800>}
box{<0,0,-0.203200><0.249800,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.992700,-1.535000,17.475200>}
box{<0,0,-0.203200><0.652000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.279300,-1.535000,17.881600>}
box{<0,0,-0.203200><6.938600,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.741400,-1.535000,18.288000>}
box{<0,0,-0.203200><0.400700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.500400,-1.535000,18.694400>}
box{<0,0,-0.203200><0.159700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.100800>}
box{<0,0,-0.203200><0.101700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.538700,-1.535000,19.507200>}
box{<0,0,-0.203200><0.198000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,19.772900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.699600,-1.535000,20.131900>}
box{<0,0,-0.203200><0.507632,0.035000,0.203200> rotate<0,-45.005011,0> translate<34.340700,-1.535000,19.772900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,34.267500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,34.552700>}
box{<0,0,-0.203200><0.285200,0.035000,0.203200> rotate<0,90.000000,0> translate<34.340700,-1.535000,34.552700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,34.267500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.559500,-1.535000,34.048700>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,44.997030,0> translate<34.340700,-1.535000,34.267500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.340700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.544000>}
box{<0,0,-0.203200><8.788500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.340700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.422000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,16.248200>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<34.442400,-1.535000,16.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.422000>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.442400,-1.535000,16.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,16.509400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.442400,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,16.510400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.442400,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.597900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.510400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.442400,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,16.597900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,16.771700>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<34.442400,-1.535000,16.597900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,18.962000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,18.788200>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<34.442400,-1.535000,18.962000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.049400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,18.962000>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.442400,-1.535000,18.962000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.049400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,19.049400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.442400,-1.535000,19.049400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,19.050400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.442400,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.137900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.050400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.442400,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.442400,-1.535000,19.137900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,19.311700>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<34.442400,-1.535000,19.137900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,16.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,16.080900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<34.469900,-1.535000,16.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,16.771700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,16.939000>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<34.469900,-1.535000,16.771700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,18.788200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,18.620900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<34.469900,-1.535000,18.788200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.469900,-1.535000,19.311700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,19.479000>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<34.469900,-1.535000,19.311700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.470600,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.137600>}
box{<0,0,-0.203200><8.658600,0.035000,0.203200> rotate<0,0.000000,0> translate<34.470600,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.481300,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.847400,-1.535000,19.913600>}
box{<0,0,-0.203200><0.366100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.481300,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,16.080900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,15.924200>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<34.524300,-1.535000,16.080900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,16.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,17.095700>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<34.524300,-1.535000,16.939000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,18.620900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,18.464200>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<34.524300,-1.535000,18.620900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.524300,-1.535000,19.479000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,19.635700>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<34.524300,-1.535000,19.479000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.559500,-1.535000,31.991200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,32.658700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<34.559500,-1.535000,31.991200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.559500,-1.535000,34.048700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,33.381200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<34.559500,-1.535000,34.048700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,15.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,15.781900>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<34.604100,-1.535000,15.924200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,17.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,17.238000>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<34.604100,-1.535000,17.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,18.464200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,18.321900>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<34.604100,-1.535000,18.464200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.604100,-1.535000,19.635700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,19.778000>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<34.604100,-1.535000,19.635700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.606800,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,32.105600>}
box{<0,0,-0.203200><3.505900,0.035000,0.203200> rotate<0,0.000000,0> translate<34.606800,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.610400,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.226500,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<34.610400,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.691100,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,33.731200>}
box{<0,0,-0.203200><8.438100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.691100,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.699600,-1.535000,20.131900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.987600,-1.535000,20.012600>}
box{<0,0,-0.203200><0.311731,0.035000,0.203200> rotate<0,22.499618,0> translate<34.699600,-1.535000,20.131900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,15.781900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,15.657500>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<34.707500,-1.535000,15.781900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,17.238000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,17.362400>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.707500,-1.535000,17.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,18.321900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,18.197500>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<34.707500,-1.535000,18.321900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.707500,-1.535000,19.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,19.902400>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.707500,-1.535000,19.778000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.775200,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,32.512000>}
box{<0,0,-0.203200><3.578800,0.035000,0.203200> rotate<0,0.000000,0> translate<34.775200,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,15.657500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,15.554100>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<34.831900,-1.535000,15.657500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,17.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,17.465800>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<34.831900,-1.535000,17.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,18.197500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,18.094100>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<34.831900,-1.535000,18.197500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.831900,-1.535000,19.902400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,20.005800>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<34.831900,-1.535000,19.902400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,32.658700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,33.381200>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,90.000000,0> translate<34.836000,-1.535000,33.381200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760400,-1.535000,32.918400>}
box{<0,0,-0.203200><3.924400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.836000,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.836000,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.966500,-1.535000,33.324800>}
box{<0,0,-0.203200><6.130500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.836000,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,15.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,15.474300>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,26.985841,0> translate<34.974200,-1.535000,15.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,17.465800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,17.545600>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-26.985841,0> translate<34.974200,-1.535000,17.465800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,18.094100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,18.014300>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,26.985841,0> translate<34.974200,-1.535000,18.094100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.974200,-1.535000,20.005800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.987600,-1.535000,20.012600>}
box{<0,0,-0.203200><0.015027,0.035000,0.203200> rotate<0,-26.904318,0> translate<34.974200,-1.535000,20.005800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,15.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,15.419900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,18.011491,0> translate<35.130900,-1.535000,15.474300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,17.545600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,17.600000>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-18.011491,0> translate<35.130900,-1.535000,17.545600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130900,-1.535000,18.014300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,17.959900>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,18.011491,0> translate<35.130900,-1.535000,18.014300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.226500,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.893400,-1.535000,25.806300>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,0.000000,0> translate<35.226500,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,15.419900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,15.392400>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,8.990654,0> translate<35.298200,-1.535000,15.419900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,17.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,17.627500>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-8.990654,0> translate<35.298200,-1.535000,17.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.298200,-1.535000,17.959900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,17.932400>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,8.990654,0> translate<35.298200,-1.535000,17.959900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,5.655600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.389600,-1.535000,4.673600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<35.407600,-1.535000,5.655600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,7.044300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,5.655600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.407600,-1.535000,5.655600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,7.044300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,7.399900>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.407600,-1.535000,7.044300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,10.735600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,10.380000>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<35.407600,-1.535000,10.735600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,12.124300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,10.735600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.407600,-1.535000,10.735600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.407600,-1.535000,12.124300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.389600,-1.535000,13.106300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.407600,-1.535000,12.124300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,15.392400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.472000,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,17.627500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.627500>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.472000,-1.535000,17.627500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.472000,-1.535000,17.932400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.932400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.472000,-1.535000,17.932400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,16.509400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.558900,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,19.049400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.558900,-1.535000,19.049400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.508900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<35.559400,-1.535000,16.508900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,15.443200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,15.849600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.256000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.508900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.508900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,16.508900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.511000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.627500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<35.559400,-1.535000,17.627500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.511000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.511000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,16.511000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.662400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.068800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.475200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,17.932400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,19.048900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<35.559400,-1.535000,19.048900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,18.288000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,18.694400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,19.048900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,19.048900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,19.048900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,15.392400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560400,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.508900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,15.392400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560400,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.627500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,16.511000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560400,-1.535000,16.511000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.627500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,17.627500>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560400,-1.535000,17.627500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.932400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,17.932400>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560400,-1.535000,17.932400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,19.048900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,17.932400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560400,-1.535000,17.932400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,16.510400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.561000,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,16.509400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.509400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.510400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,16.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,19.049400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,19.050400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.561000,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,19.049400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.049400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,19.049400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.050400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,15.392400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,15.419900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-8.990654,0> translate<35.647900,-1.535000,15.392400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,17.627500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,17.600000>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,8.990654,0> translate<35.647900,-1.535000,17.627500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.647900,-1.535000,17.932400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,17.959900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-8.990654,0> translate<35.647900,-1.535000,17.932400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,10.380000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.763200,-1.535000,7.399900>}
box{<0,0,-0.203200><2.980100,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.763200,-1.535000,7.399900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,15.419900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,15.474300>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-18.011491,0> translate<35.821700,-1.535000,15.419900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,17.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,17.545600>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,18.011491,0> translate<35.821700,-1.535000,17.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.821700,-1.535000,17.959900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,18.014300>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-18.011491,0> translate<35.821700,-1.535000,17.959900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.893300,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.876000,-1.535000,15.443200>}
box{<0,0,-0.203200><5.982700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.893300,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.893400,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.509500,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<35.893400,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,15.474300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,15.554100>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-26.985841,0> translate<35.989000,-1.535000,15.474300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,17.545600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,17.465800>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,26.985841,0> translate<35.989000,-1.535000,17.545600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989000,-1.535000,18.014300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,18.094100>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-26.985841,0> translate<35.989000,-1.535000,18.014300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.127300,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.774600,-1.535000,17.475200>}
box{<0,0,-0.203200><5.647300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.127300,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.132300,-1.535000,20.012600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,20.005800>}
box{<0,0,-0.203200><0.015027,0.035000,0.203200> rotate<0,26.904318,0> translate<36.132300,-1.535000,20.012600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.132300,-1.535000,20.012600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.509500,-1.535000,20.168800>}
box{<0,0,-0.203200><0.408263,0.035000,0.203200> rotate<0,-22.493153,0> translate<36.132300,-1.535000,20.012600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,15.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,15.657500>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<36.145700,-1.535000,15.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,17.465800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,17.362400>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<36.145700,-1.535000,17.465800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,18.094100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,18.197500>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-36.001049,0> translate<36.145700,-1.535000,18.094100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.145700,-1.535000,20.005800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,19.902400>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,36.001049,0> translate<36.145700,-1.535000,20.005800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.272600,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.378600,-1.535000,19.913600>}
box{<0,0,-0.203200><3.106000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.272600,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,15.657500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,15.781900>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.288000,-1.535000,15.657500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,17.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,17.238000>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<36.288000,-1.535000,17.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,18.197500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,18.321900>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.288000,-1.535000,18.197500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.288000,-1.535000,19.902400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,19.778000>}
box{<0,0,-0.203200><0.175928,0.035000,0.203200> rotate<0,44.997030,0> translate<36.288000,-1.535000,19.902400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.378500,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.804100,-1.535000,18.288000>}
box{<0,0,-0.203200><4.425600,0.035000,0.203200> rotate<0,0.000000,0> translate<36.378500,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.383800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.603200>}
box{<0,0,-0.203200><2.935400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.383800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.389600,-1.535000,4.673600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.778300,-1.535000,4.673600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.389600,-1.535000,4.673600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.389600,-1.535000,13.106300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.778300,-1.535000,13.106300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.389600,-1.535000,13.106300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,15.781900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,15.924200>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<36.412400,-1.535000,15.781900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,17.238000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,17.095700>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<36.412400,-1.535000,17.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,18.321900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,18.464200>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,-53.993011,0> translate<36.412400,-1.535000,18.321900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412400,-1.535000,19.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,19.635700>}
box{<0,0,-0.203200><0.175900,0.035000,0.203200> rotate<0,53.993011,0> translate<36.412400,-1.535000,19.778000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.461500,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.639000,-1.535000,15.849600>}
box{<0,0,-0.203200><5.177500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.461500,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.509500,-1.535000,20.168800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,20.640400>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.509500,-1.535000,20.168800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.509500,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,25.079500>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<36.509500,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,15.924200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,16.080900>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<36.515800,-1.535000,15.924200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,17.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,16.939000>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<36.515800,-1.535000,17.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,18.464200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,18.620900>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,-63.008220,0> translate<36.515800,-1.535000,18.464200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.515800,-1.535000,19.635700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,19.479000>}
box{<0,0,-0.203200><0.175849,0.035000,0.203200> rotate<0,63.008220,0> translate<36.515800,-1.535000,19.635700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.529500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.597000,-1.535000,17.068800>}
box{<0,0,-0.203200><5.067500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.529500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.581300,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.584900,-1.535000,19.507200>}
box{<0,0,-0.203200><3.003600,0.035000,0.203200> rotate<0,0.000000,0> translate<36.581300,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,16.080900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,16.248200>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<36.595600,-1.535000,16.080900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,16.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,16.771700>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<36.595600,-1.535000,16.939000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,18.620900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,18.788200>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,-71.982570,0> translate<36.595600,-1.535000,18.620900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.595600,-1.535000,19.479000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,19.311700>}
box{<0,0,-0.203200><0.175922,0.035000,0.203200> rotate<0,71.982570,0> translate<36.595600,-1.535000,19.479000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.619400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.397700,-1.535000,18.694400>}
box{<0,0,-0.203200><3.778300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.619400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,16.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.422000>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<36.650000,-1.535000,16.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,16.771700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.597900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<36.650000,-1.535000,16.771700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,18.788200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,18.962000>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,-81.003406,0> translate<36.650000,-1.535000,18.788200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650000,-1.535000,19.311700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.137900>}
box{<0,0,-0.203200><0.175962,0.035000,0.203200> rotate<0,81.003406,0> translate<36.650000,-1.535000,19.311700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.651200,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.256000>}
box{<0,0,-0.203200><4.852400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.651200,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.660600,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,22.539500>}
box{<0,0,-0.203200><0.453255,0.035000,0.203200> rotate<0,44.997030,0> translate<36.660600,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.660600,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,23.180400>}
box{<0,0,-0.203200><0.453185,0.035000,0.203200> rotate<0,-44.988091,0> translate<36.660600,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.660700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,20.320000>}
box{<0,0,-0.203200><2.658500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.660700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.667300,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.662400>}
box{<0,0,-0.203200><4.836300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.667300,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.422000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.509400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,90.000000,0> translate<36.677500,-1.535000,16.509400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,16.597900>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,90.000000,0> translate<36.677500,-1.535000,16.597900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,18.962000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.049400>}
box{<0,0,-0.203200><0.087400,0.035000,0.203200> rotate<0,90.000000,0> translate<36.677500,-1.535000,19.049400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.137900>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,90.000000,0> translate<36.677500,-1.535000,19.137900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677500,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.991300,-1.535000,19.100800>}
box{<0,0,-0.203200><3.313800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.677500,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.762200,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,22.758400>}
box{<0,0,-0.203200><2.557000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.762200,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.863800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.196800>}
box{<0,0,-0.203200><2.455400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.863800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.965400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,23.164800>}
box{<0,0,-0.203200><2.353800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.965400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,20.640400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,21.256500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<36.981100,-1.535000,20.640400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,22.539500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,21.923400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<36.981100,-1.535000,22.539500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,23.180400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,23.796500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<36.981100,-1.535000,23.180400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.981100,-1.535000,25.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<36.981100,-1.535000,25.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.016700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,20.726400>}
box{<0,0,-0.203200><2.302500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.016700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.058800,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,22.352000>}
box{<0,0,-0.203200><2.260400,0.035000,0.203200> rotate<0,0.000000,0> translate<37.058800,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.100900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,24.790400>}
box{<0,0,-0.203200><2.218300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.100900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.142900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,23.571200>}
box{<0,0,-0.203200><2.176300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.142900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.185000,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,21.132800>}
box{<0,0,-0.203200><2.134200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.185000,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.227200,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,21.945600>}
box{<0,0,-0.203200><2.092000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.227200,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,21.256500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,21.923400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,21.923400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,21.539200>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,23.796500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,24.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,23.977600>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,24.384000>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.778300,-1.535000,4.673600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,5.655600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.778300,-1.535000,4.673600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.778300,-1.535000,13.106300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,12.124300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<37.778300,-1.535000,13.106300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.879800,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.368100,-1.535000,13.004800>}
box{<0,0,-0.203200><3.488300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.879800,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.981500,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.327200,-1.535000,4.876800>}
box{<0,0,-0.203200><20.345700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.981500,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.229200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.849200,-1.535000,30.492700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<38.112700,-1.535000,31.229200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.749400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.229200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.112700,-1.535000,31.229200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.749400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.368900,-1.535000,31.749400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.112700,-1.535000,31.749400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.750400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.368900,-1.535000,31.750400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.112700,-1.535000,31.750400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,32.270700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,31.750400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.112700,-1.535000,31.750400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.112700,-1.535000,32.270700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.849200,-1.535000,33.007200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.112700,-1.535000,32.270700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.286200,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961700,-1.535000,12.598400>}
box{<0,0,-0.203200><2.675500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.286200,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.387900,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.270300,-1.535000,5.283200>}
box{<0,0,-0.203200><10.882400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.387900,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,7.399900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,10.380000>}
box{<0,0,-0.203200><2.980100,0.035000,0.203200> rotate<0,90.000000,0> translate<38.404700,-1.535000,10.380000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,7.399900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,7.044300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<38.404700,-1.535000,7.399900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,7.721600>}
box{<0,0,-0.203200><24.816100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,8.128000>}
box{<0,0,-0.203200><24.816100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,8.534400>}
box{<0,0,-0.203200><24.816100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,8.940800>}
box{<0,0,-0.203200><24.816100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,9.347200>}
box{<0,0,-0.203200><24.816100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.469600,-1.535000,9.753600>}
box{<0,0,-0.203200><3.064900,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.063200,-1.535000,10.160000>}
box{<0,0,-0.203200><2.658500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.404700,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.404700,-1.535000,10.380000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,10.735600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.404700,-1.535000,10.380000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.489400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.168800,-1.535000,7.315200>}
box{<0,0,-0.203200><10.679400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.489400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.591100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.656800,-1.535000,10.566400>}
box{<0,0,-0.203200><2.065700,0.035000,0.203200> rotate<0,0.000000,0> translate<38.591100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.692600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.555300,-1.535000,12.192000>}
box{<0,0,-0.203200><1.862700,0.035000,0.203200> rotate<0,0.000000,0> translate<38.692600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,5.655600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,7.044300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<38.760300,-1.535000,7.044300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.863900,-1.535000,5.689600>}
box{<0,0,-0.203200><10.103600,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.096000>}
box{<0,0,-0.203200><9.906100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.502400>}
box{<0,0,-0.203200><9.906100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.762400,-1.535000,6.908800>}
box{<0,0,-0.203200><10.002100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,10.735600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,12.124300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<38.760300,-1.535000,12.124300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,10.972800>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,11.379200>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.760300,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,11.785600>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.760300,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.849200,-1.535000,30.492700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,30.492700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.849200,-1.535000,30.492700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.849200,-1.535000,33.007200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,33.007200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.849200,-1.535000,33.007200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,20.057200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.520300,-1.535000,19.571800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<39.319200,-1.535000,20.057200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.137200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,20.057200>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.319200,-1.535000,20.057200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.662700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.137200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.319200,-1.535000,25.137200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.319200,-1.535000,25.662700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.520300,-1.535000,26.148100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<39.319200,-1.535000,25.662700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.368900,-1.535000,31.750400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.368900,-1.535000,31.749400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.368900,-1.535000,31.749400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,30.492700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.748900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<39.369400,-1.535000,31.748900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,30.886400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.292800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.699200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.748900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.748900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,31.748900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.751000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,33.007200>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<39.369400,-1.535000,33.007200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,31.751000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.751000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,31.751000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,32.105600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,32.512000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.369400,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,32.918400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.369400,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,30.492700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.890700,-1.535000,30.492700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.370400,-1.535000,30.492700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.748900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,30.492700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.370400,-1.535000,30.492700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,33.007200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,31.751000>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.370400,-1.535000,31.751000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370400,-1.535000,33.007200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.890700,-1.535000,33.007200>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.370400,-1.535000,33.007200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.520300,-1.535000,19.571800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.891800,-1.535000,19.200300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<39.520300,-1.535000,19.571800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.520300,-1.535000,26.148100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,29.757000>}
box{<0,0,-0.203200><5.103755,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.520300,-1.535000,26.148100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.890700,-1.535000,30.492700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.296800,-1.535000,30.898900>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,-45.004083,0> translate<39.890700,-1.535000,30.492700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.890700,-1.535000,33.007200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.296800,-1.535000,32.601000>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,45.004083,0> translate<39.890700,-1.535000,33.007200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.891800,-1.535000,19.200300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.161800,-1.535000,17.930300>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<39.891800,-1.535000,19.200300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.979500,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.510100,-1.535000,32.918400>}
box{<0,0,-0.203200><0.530600,0.035000,0.203200> rotate<0,0.000000,0> translate<39.979500,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.284300,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.301900,-1.535000,30.886400>}
box{<0,0,-0.203200><0.017600,0.035000,0.203200> rotate<0,0.000000,0> translate<40.284300,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.296800,-1.535000,30.898900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370400,-1.535000,30.721200>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,67.497128,0> translate<40.296800,-1.535000,30.898900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.296800,-1.535000,32.601000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370400,-1.535000,32.778700>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,-67.497128,0> translate<40.296800,-1.535000,32.601000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370400,-1.535000,30.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.881200,-1.535000,30.210400>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<40.370400,-1.535000,30.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370400,-1.535000,32.778700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.881200,-1.535000,33.289500>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.370400,-1.535000,32.778700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,10.735600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.469600,-1.535000,9.753600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<40.487600,-1.535000,10.735600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,12.124300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,10.735600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.487600,-1.535000,10.735600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487600,-1.535000,12.124300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.469600,-1.535000,13.106300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.487600,-1.535000,12.124300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.881200,-1.535000,30.210400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.548700,-1.535000,29.933900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<40.881200,-1.535000,30.210400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.881200,-1.535000,33.289500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.548700,-1.535000,33.566000>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<40.881200,-1.535000,33.289500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.161800,-1.535000,17.930300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.647200,-1.535000,17.729200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<41.161800,-1.535000,17.930300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.469600,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.858300,-1.535000,9.753600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.469600,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.469600,-1.535000,13.106300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.858300,-1.535000,13.106300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.469600,-1.535000,13.106300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.176500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.758800,-1.535000,15.560400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<41.503600,-1.535000,16.176500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.843400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.176500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.503600,-1.535000,16.176500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503600,-1.535000,16.843400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.758800,-1.535000,17.459500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<41.503600,-1.535000,16.843400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.548700,-1.535000,29.933900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.271200,-1.535000,29.933900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.548700,-1.535000,29.933900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.548700,-1.535000,33.566000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.271200,-1.535000,33.566000>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.548700,-1.535000,33.566000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.647200,-1.535000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.028600,-1.535000,17.729200>}
box{<0,0,-0.203200><0.381400,0.035000,0.203200> rotate<0,0.000000,0> translate<41.647200,-1.535000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.758800,-1.535000,15.560400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.230400,-1.535000,15.088800>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<41.758800,-1.535000,15.560400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.758800,-1.535000,17.459500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.028600,-1.535000,17.729200>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,-44.986411,0> translate<41.758800,-1.535000,17.459500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.230400,-1.535000,15.088800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.846500,-1.535000,14.833600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<42.230400,-1.535000,15.088800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.271200,-1.535000,29.933900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.938700,-1.535000,30.210400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<42.271200,-1.535000,29.933900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.271200,-1.535000,33.566000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.938700,-1.535000,33.289500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<42.271200,-1.535000,33.566000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.608400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,30.073600>}
box{<0,0,-0.203200><0.520800,0.035000,0.203200> rotate<0,0.000000,0> translate<42.608400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,38.675600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.755600,-1.535000,37.693600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<42.773600,-1.535000,38.675600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,40.064300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,38.675600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.773600,-1.535000,38.675600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.773600,-1.535000,40.064300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.755600,-1.535000,41.046300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.773600,-1.535000,40.064300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.846500,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.988600,-1.535000,14.833600>}
box{<0,0,-0.203200><0.142100,0.035000,0.203200> rotate<0,0.000000,0> translate<42.846500,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.853500,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,33.324800>}
box{<0,0,-0.203200><0.275700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.853500,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.858300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.213900,-1.535000,10.109200>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.858300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.858300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,9.753600>}
box{<0,0,-0.203200><20.362500,0.035000,0.203200> rotate<0,0.000000,0> translate<42.858300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.858300,-1.535000,13.106300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.923400,-1.535000,13.041100>}
box{<0,0,-0.203200><0.092136,0.035000,0.203200> rotate<0,45.040999,0> translate<42.858300,-1.535000,13.106300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.914000,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.513400,-1.535000,25.806300>}
box{<0,0,-0.203200><0.599400,0.035000,0.203200> rotate<0,0.000000,0> translate<42.914000,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.914000,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.198100,-1.535000,28.090300>}
box{<0,0,-0.203200><3.230134,0.035000,0.203200> rotate<0,-44.995776,0> translate<42.914000,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.923400,-1.535000,13.041100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,13.247000>}
box{<0,0,-0.203200><0.291116,0.035000,0.203200> rotate<0,-45.010946,0> translate<42.923400,-1.535000,13.041100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.938700,-1.535000,30.210400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,30.401000>}
box{<0,0,-0.203200><0.269478,0.035000,0.203200> rotate<0,-45.012064,0> translate<42.938700,-1.535000,30.210400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.938700,-1.535000,33.289500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,33.098900>}
box{<0,0,-0.203200><0.269478,0.035000,0.203200> rotate<0,45.012064,0> translate<42.938700,-1.535000,33.289500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.988600,-1.535000,14.833600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,14.692900>}
box{<0,0,-0.203200><0.198909,0.035000,0.203200> rotate<0,45.017397,0> translate<42.988600,-1.535000,14.833600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.117300,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,26.009600>}
box{<0,0,-0.203200><20.103500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.117300,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,14.692900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,13.247000>}
box{<0,0,-0.203200><1.445900,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.129200,-1.535000,13.247000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,30.401000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,29.757000>}
box{<0,0,-0.203200><0.644000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.129200,-1.535000,29.757000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.027200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,33.098900>}
box{<0,0,-0.203200><0.928300,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.129200,-1.535000,33.098900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.552700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.027200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.129200,-1.535000,34.027200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.129200,-1.535000,34.552700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.330300,-1.535000,35.038100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<43.129200,-1.535000,34.552700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.213900,-1.535000,10.109200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.442700,-1.535000,10.109200>}
box{<0,0,-0.203200><0.228800,0.035000,0.203200> rotate<0,0.000000,0> translate<43.213900,-1.535000,10.109200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.330300,-1.535000,35.038100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,36.107000>}
box{<0,0,-0.203200><1.511653,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.330300,-1.535000,35.038100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.442700,-1.535000,10.109200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.928100,-1.535000,10.310300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<43.442700,-1.535000,10.109200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.513400,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.129500,-1.535000,25.551100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<43.513400,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.523700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,26.416000>}
box{<0,0,-0.203200><19.697100,0.035000,0.203200> rotate<0,0.000000,0> translate<43.523700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.565300,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,10.160000>}
box{<0,0,-0.203200><19.655500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.565300,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.755600,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,37.693600>}
box{<0,0,-0.203200><0.643600,0.035000,0.203200> rotate<0,0.000000,0> translate<43.755600,-1.535000,37.693600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.755600,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.144300,-1.535000,41.046300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<43.755600,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.928100,-1.535000,10.310300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.997000,-1.535000,11.379200>}
box{<0,0,-0.203200><1.511653,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.928100,-1.535000,10.310300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.930100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,26.822400>}
box{<0,0,-0.203200><19.290700,0.035000,0.203200> rotate<0,0.000000,0> translate<43.930100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.003800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.164900,-1.535000,25.603200>}
box{<0,0,-0.203200><3.161100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.003800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.129500,-1.535000,25.551100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,25.079500>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<44.129500,-1.535000,25.551100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.184200,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,10.566400>}
box{<0,0,-0.203200><19.036600,0.035000,0.203200> rotate<0,0.000000,0> translate<44.184200,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.280600,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,17.459500>}
box{<0,0,-0.203200><0.453255,0.035000,0.203200> rotate<0,44.997030,0> translate<44.280600,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.280600,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,18.100400>}
box{<0,0,-0.203200><0.453185,0.035000,0.203200> rotate<0,-44.988091,0> translate<44.280600,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.331300,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,19.999500>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,44.986411,0> translate<44.331300,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.331300,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.712700,-1.535000,20.269200>}
box{<0,0,-0.203200><0.381400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.331300,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.336500,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,27.228800>}
box{<0,0,-0.203200><18.884300,0.035000,0.203200> rotate<0,0.000000,0> translate<44.336500,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.382200,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,17.881600>}
box{<0,0,-0.203200><18.838600,0.035000,0.203200> rotate<0,0.000000,0> translate<44.382200,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,37.693600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,-1.535000,36.107000>}
box{<0,0,-0.203200><1.586600,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.399200,-1.535000,36.107000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.483800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.189000,-1.535000,25.196800>}
box{<0,0,-0.203200><1.705200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.483800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.585400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,17.475200>}
box{<0,0,-0.203200><18.635400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.585400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.590600,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.176000,-1.535000,10.972800>}
box{<0,0,-0.203200><2.585400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.590600,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,17.459500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,16.843400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<44.601100,-1.535000,17.459500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,18.100400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,18.716500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<44.601100,-1.535000,18.100400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,19.999500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,19.383400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<44.601100,-1.535000,19.999500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.601100,-1.535000,25.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<44.601100,-1.535000,25.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.636700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,19.913600>}
box{<0,0,-0.203200><18.584100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.636700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.678800,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,18.288000>}
box{<0,0,-0.203200><18.542000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.678800,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.712700,-1.535000,20.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.198100,-1.535000,20.470300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<44.712700,-1.535000,20.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.720900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.782700,-1.535000,24.790400>}
box{<0,0,-0.203200><1.061800,0.035000,0.203200> rotate<0,0.000000,0> translate<44.720900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.742900,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,27.635200>}
box{<0,0,-0.203200><18.477900,0.035000,0.203200> rotate<0,0.000000,0> translate<44.742900,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.763000,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,17.068800>}
box{<0,0,-0.203200><18.457800,0.035000,0.203200> rotate<0,0.000000,0> translate<44.763000,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.805100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,19.507200>}
box{<0,0,-0.203200><18.415700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.805100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.835300,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,20.320000>}
box{<0,0,-0.203200><18.385500,0.035000,0.203200> rotate<0,0.000000,0> translate<44.835300,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.847100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,18.694400>}
box{<0,0,-0.203200><18.373700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.847100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,16.701300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,16.843400>}
box{<0,0,-0.203200><0.142100,0.035000,0.203200> rotate<0,90.000000,0> translate<44.856300,-1.535000,16.843400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,16.701300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.569600,-1.535000,15.988100>}
box{<0,0,-0.203200><1.008688,0.035000,0.203200> rotate<0,44.993014,0> translate<44.856300,-1.535000,16.701300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,18.716500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,19.383400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<44.856300,-1.535000,19.383400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,19.100800>}
box{<0,0,-0.203200><18.364500,0.035000,0.203200> rotate<0,0.000000,0> translate<44.856300,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,23.864000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,24.463400>}
box{<0,0,-0.203200><0.599400,0.035000,0.203200> rotate<0,90.000000,0> translate<44.856300,-1.535000,24.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,23.864000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.870300,-1.535000,24.878100>}
box{<0,0,-0.203200><1.434083,0.035000,0.203200> rotate<0,-44.999855,0> translate<44.856300,-1.535000,23.864000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.969900,-1.535000,23.977600>}
box{<0,0,-0.203200><0.113600,0.035000,0.203200> rotate<0,0.000000,0> translate<44.856300,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.376300,-1.535000,24.384000>}
box{<0,0,-0.203200><0.520000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.856300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.895300,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,16.662400>}
box{<0,0,-0.203200><18.325500,0.035000,0.203200> rotate<0,0.000000,0> translate<44.895300,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.997000,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.504400,-1.535000,11.379200>}
box{<0,0,-0.203200><1.507400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.997000,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.144300,-1.535000,41.046300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.499900,-1.535000,40.690700>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<45.144300,-1.535000,41.046300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.149300,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.041600>}
box{<0,0,-0.203200><18.071500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.149300,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.198100,-1.535000,20.470300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.292700,-1.535000,22.565000>}
box{<0,0,-0.203200><2.962282,0.035000,0.203200> rotate<0,-44.998398,0> translate<45.198100,-1.535000,20.470300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.198100,-1.535000,28.090300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.569600,-1.535000,28.461800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.198100,-1.535000,28.090300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.301700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.982300,-1.535000,16.256000>}
box{<0,0,-0.203200><11.680600,0.035000,0.203200> rotate<0,0.000000,0> translate<45.301700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.454100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345500,-1.535000,20.726400>}
box{<0,0,-0.203200><1.891400,0.035000,0.203200> rotate<0,0.000000,0> translate<45.454100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.499900,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.982700,-1.535000,40.690700>}
box{<0,0,-0.203200><0.482800,0.035000,0.203200> rotate<0,0.000000,0> translate<45.499900,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.555800,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.448000>}
box{<0,0,-0.203200><17.665000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.555800,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.569600,-1.535000,15.988100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,15.502700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<45.569600,-1.535000,15.988100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.569600,-1.535000,28.461800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,28.947200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<45.569600,-1.535000,28.461800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.627000,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.600300,-1.535000,15.849600>}
box{<0,0,-0.203200><10.973300,0.035000,0.203200> rotate<0,0.000000,0> translate<45.627000,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.732200,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.854400>}
box{<0,0,-0.203200><17.488600,0.035000,0.203200> rotate<0,0.000000,0> translate<45.732200,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.977200>}
box{<0,0,-0.203200><0.956500,0.035000,0.203200> rotate<0,90.000000,0> translate<45.770700,-1.535000,14.977200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.504400,-1.535000,14.020700>}
box{<0,0,-0.203200><0.733700,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,14.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.707700,-1.535000,14.224000>}
box{<0,0,-0.203200><0.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.600200,-1.535000,14.630400>}
box{<0,0,-0.203200><10.829500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,14.977200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,15.502700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<45.770700,-1.535000,15.502700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.455700,-1.535000,15.036800>}
box{<0,0,-0.203200><10.685000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.455800,-1.535000,15.443200>}
box{<0,0,-0.203200><10.685100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,28.947200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,31.487200>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<45.770700,-1.535000,31.487200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,29.260800>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.492300,-1.535000,29.667200>}
box{<0,0,-0.203200><1.721600,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.073600>}
box{<0,0,-0.203200><1.371700,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,30.480000>}
box{<0,0,-0.203200><2.488200,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.886400>}
box{<0,0,-0.203200><1.371700,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.492400,-1.535000,31.292800>}
box{<0,0,-0.203200><1.721700,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,31.487200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,32.012700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<45.770700,-1.535000,32.012700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,31.699200>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,32.012700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,33.742900>}
box{<0,0,-0.203200><1.730200,0.035000,0.203200> rotate<0,90.000000,0> translate<45.770700,-1.535000,33.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,32.105600>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,32.512000>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,32.918400>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,33.324800>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,33.731200>}
box{<0,0,-0.203200><17.450100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.770700,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.770700,-1.535000,33.742900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.267000,-1.535000,34.239200>}
box{<0,0,-0.203200><0.701874,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.770700,-1.535000,33.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.860500,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.132800>}
box{<0,0,-0.203200><1.142200,0.035000,0.203200> rotate<0,0.000000,0> translate<45.860500,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.870300,-1.535000,24.878100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.241800,-1.535000,25.249600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.870300,-1.535000,24.878100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.982700,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.332700,-1.535000,40.690700>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.982700,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.165400,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.311600,-1.535000,34.137600>}
box{<0,0,-0.203200><1.146200,0.035000,0.203200> rotate<0,0.000000,0> translate<46.165400,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.241800,-1.535000,25.249600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.727200,-1.535000,25.450700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<46.241800,-1.535000,25.249600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.266900,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.539200>}
box{<0,0,-0.203200><0.735800,0.035000,0.203200> rotate<0,0.000000,0> translate<46.266900,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.267000,-1.535000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.210000,-1.535000,34.239200>}
box{<0,0,-0.203200><0.943000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.267000,-1.535000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.504400,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.723200,-1.535000,11.160400>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,44.997030,0> translate<46.504400,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.504400,-1.535000,14.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.723200,-1.535000,14.239500>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.504400,-1.535000,14.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.673300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.945600>}
box{<0,0,-0.203200><0.329400,0.035000,0.203200> rotate<0,0.000000,0> translate<46.673300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.723200,-1.535000,11.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.390700,-1.535000,10.883900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<46.723200,-1.535000,11.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.723200,-1.535000,14.239500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.390700,-1.535000,14.516000>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<46.723200,-1.535000,14.239500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.727200,-1.535000,25.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.012400,-1.535000,25.450700>}
box{<0,0,-0.203200><0.285200,0.035000,0.203200> rotate<0,0.000000,0> translate<46.727200,-1.535000,25.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.069200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.739200,-1.535000,20.332700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<47.002700,-1.535000,21.069200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.589400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.069200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.002700,-1.535000,21.069200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.589400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,21.589400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.002700,-1.535000,21.589400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.590400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,21.590400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.002700,-1.535000,21.590400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,22.110700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,21.590400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.002700,-1.535000,21.590400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.002700,-1.535000,22.110700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.408900,-1.535000,22.516800>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,-44.989977,0> translate<47.002700,-1.535000,22.110700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.012400,-1.535000,25.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.231200,-1.535000,25.669500>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.012400,-1.535000,25.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,36.880700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,38.049200>}
box{<0,0,-0.203200><1.168500,0.035000,0.203200> rotate<0,90.000000,0> translate<47.040700,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,36.880700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.210000,-1.535000,36.880700>}
box{<0,0,-0.203200><0.169300,0.035000,0.203200> rotate<0,0.000000,0> translate<47.040700,-1.535000,36.880700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.311700,-1.535000,36.982400>}
box{<0,0,-0.203200><0.271000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.040700,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,37.388800>}
box{<0,0,-0.203200><4.622900,0.035000,0.203200> rotate<0,0.000000,0> translate<47.040700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.776900,-1.535000,37.795200>}
box{<0,0,-0.203200><4.736200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.040700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.040700,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.522900,-1.535000,38.049200>}
box{<0,0,-0.203200><4.482200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.040700,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.079700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244100,-1.535000,22.352000>}
box{<0,0,-0.203200><0.164400,0.035000,0.203200> rotate<0,0.000000,0> translate<47.079700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.017100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.797100,-1.535000,29.362400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<47.142400,-1.535000,30.017100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.017100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.142400,-1.535000,30.017100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.142400,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.142400,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.942800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.480400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.142400,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142400,-1.535000,30.942800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.797100,-1.535000,31.597500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.142400,-1.535000,30.942800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.210000,-1.535000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.565600,-1.535000,33.883600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<47.210000,-1.535000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.210000,-1.535000,36.880700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.565600,-1.535000,37.236300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.210000,-1.535000,36.880700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.231200,-1.535000,25.669500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.898700,-1.535000,25.946000>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<47.231200,-1.535000,25.669500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.292700,-1.535000,22.565000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.408900,-1.535000,22.516800>}
box{<0,0,-0.203200><0.125800,0.035000,0.203200> rotate<0,22.527288,0> translate<47.292700,-1.535000,22.565000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.390700,-1.535000,10.883900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.113200,-1.535000,10.883900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.390700,-1.535000,10.883900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.390700,-1.535000,14.516000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.113200,-1.535000,14.516000>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.390700,-1.535000,14.516000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.565600,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.954300,-1.535000,33.883600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.565600,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.565600,-1.535000,37.236300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.954300,-1.535000,37.236300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.565600,-1.535000,37.236300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.739200,-1.535000,20.332700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,20.332700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.739200,-1.535000,20.332700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.797100,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,29.362400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<47.797100,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.797100,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,31.597500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<47.797100,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.898700,-1.535000,25.946000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.621200,-1.535000,25.946000>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.898700,-1.535000,25.946000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.113200,-1.535000,10.883900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,11.160400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<48.113200,-1.535000,10.883900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.113200,-1.535000,14.516000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,14.239500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<48.113200,-1.535000,14.516000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,21.590400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,21.589400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.258900,-1.535000,21.589400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.258900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.258900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,20.332700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,21.588900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<48.259400,-1.535000,21.588900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,20.726400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,21.132800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,21.539200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,21.588900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,21.588900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,21.588900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.478900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<48.259400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,29.667200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.073600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.478900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,31.597500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<48.259400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.481000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.886400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.259400,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,31.292800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.259400,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,20.332700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,20.332700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260400,-1.535000,20.332700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,21.588900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,20.332700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.260400,-1.535000,20.332700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.722800,-1.535000,29.362400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,29.362400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.260400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,30.481000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.260400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.722800,-1.535000,31.597500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,21.589400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,21.590400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.261000,-1.535000,21.590400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,21.589400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.589400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<48.261000,-1.535000,21.589400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,21.590400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.590400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<48.261000,-1.535000,21.590400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.261000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.479400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.261000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,30.480000>}
box{<0,0,-0.203200><14.959800,0.035000,0.203200> rotate<0,0.000000,0> translate<48.261000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.261000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.480400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.261000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.327800,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.466800,-1.535000,10.972800>}
box{<0,0,-0.203200><2.139000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.327800,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.621200,-1.535000,25.946000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.288700,-1.535000,25.669500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<48.621200,-1.535000,25.946000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,5.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.321100,-1.535000,5.232400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<48.666400,-1.535000,5.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,5.887100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.666400,-1.535000,5.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.782900,-1.535000,6.349400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.666400,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.782900,-1.535000,6.350400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.666400,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.350400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.666400,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666400,-1.535000,6.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.321100,-1.535000,7.467500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.666400,-1.535000,6.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.722800,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.017100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.722800,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.722800,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.942800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<48.722800,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,11.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.291500,-1.535000,11.671200>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.780700,-1.535000,11.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,14.239500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.291500,-1.535000,13.728700>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<48.780700,-1.535000,14.239500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.780700,-1.535000,20.332700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.069200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.780700,-1.535000,20.332700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.796200,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.263700,-1.535000,14.224000>}
box{<0,0,-0.203200><1.467500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.796200,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.954300,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,34.865600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.954300,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.954300,-1.535000,37.236300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,36.254300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<48.954300,-1.535000,37.236300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.999500,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.060400,-1.535000,11.379200>}
box{<0,0,-0.203200><1.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<48.999500,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.027500,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,31.292800>}
box{<0,0,-0.203200><14.193300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.027500,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.027600,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,29.667200>}
box{<0,0,-0.203200><14.193200,0.035000,0.203200> rotate<0,0.000000,0> translate<49.027600,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.111000,-1.535000,22.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.288700,-1.535000,22.590400>}
box{<0,0,-0.203200><0.192339,0.035000,0.203200> rotate<0,-22.496933,0> translate<49.111000,-1.535000,22.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.111000,-1.535000,22.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,22.110700>}
box{<0,0,-0.203200><0.574383,0.035000,0.203200> rotate<0,44.989977,0> translate<49.111000,-1.535000,22.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.174400,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.797300,-1.535000,20.726400>}
box{<0,0,-0.203200><7.622900,0.035000,0.203200> rotate<0,0.000000,0> translate<49.174400,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.202600,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.857300,-1.535000,13.817600>}
box{<0,0,-0.203200><0.654700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.202600,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208200,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,36.982400>}
box{<0,0,-0.203200><2.455400,0.035000,0.203200> rotate<0,0.000000,0> translate<49.208200,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208300,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,34.137600>}
box{<0,0,-0.203200><14.012500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.208300,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.275900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.704700,-1.535000,22.352000>}
box{<0,0,-0.203200><7.428800,0.035000,0.203200> rotate<0,0.000000,0> translate<49.275900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.288700,-1.535000,22.590400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.799500,-1.535000,23.101200>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.288700,-1.535000,22.590400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.288700,-1.535000,25.669500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.799500,-1.535000,25.158700>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<49.288700,-1.535000,25.669500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.291500,-1.535000,11.671200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,12.155100>}
box{<0,0,-0.203200><0.523755,0.035000,0.203200> rotate<0,-67.499380,0> translate<49.291500,-1.535000,11.671200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.291500,-1.535000,13.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,13.244800>}
box{<0,0,-0.203200><0.523755,0.035000,0.203200> rotate<0,67.499380,0> translate<49.291500,-1.535000,13.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.321100,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,5.232400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.321100,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.321100,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,7.467500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.321100,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.338800,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.654000,-1.535000,11.785600>}
box{<0,0,-0.203200><0.315200,0.035000,0.203200> rotate<0,0.000000,0> translate<49.338800,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.355000,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.442500,-1.535000,25.603200>}
box{<0,0,-0.203200><3.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.355000,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.017100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.479400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<49.377500,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,30.073600>}
box{<0,0,-0.203200><13.843300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.377500,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.942800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<49.377500,-1.535000,30.942800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.377500,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,30.886400>}
box{<0,0,-0.203200><13.843300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.377500,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.423000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,13.411200>}
box{<0,0,-0.203200><0.068900,0.035000,0.203200> rotate<0,0.000000,0> translate<49.423000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.456700,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.340800,-1.535000,22.758400>}
box{<0,0,-0.203200><2.884100,0.035000,0.203200> rotate<0,0.000000,0> translate<49.456700,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,11.947700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.555700,-1.535000,10.883900>}
box{<0,0,-0.203200><1.504440,0.035000,0.203200> rotate<0,44.997030,0> translate<49.491900,-1.535000,11.947700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,12.155100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,11.947700>}
box{<0,0,-0.203200><0.207400,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.491900,-1.535000,11.947700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,13.452200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,13.244800>}
box{<0,0,-0.203200><0.207400,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.491900,-1.535000,13.244800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.491900,-1.535000,13.452200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.555700,-1.535000,14.516000>}
box{<0,0,-0.203200><1.504440,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.491900,-1.535000,13.452200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.069200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.589400>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,90.000000,0> translate<49.517200,-1.535000,21.589400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.524500,-1.535000,21.132800>}
box{<0,0,-0.203200><7.007300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.517200,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,21.539200>}
box{<0,0,-0.203200><8.851300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.517200,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.590400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,22.110700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,90.000000,0> translate<49.517200,-1.535000,22.110700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.517200,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.491600,-1.535000,21.945600>}
box{<0,0,-0.203200><6.974400,0.035000,0.203200> rotate<0,0.000000,0> translate<49.517200,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.614600,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,36.576000>}
box{<0,0,-0.203200><2.049000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.614600,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.614700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,34.544000>}
box{<0,0,-0.203200><13.606100,0.035000,0.203200> rotate<0,0.000000,0> translate<49.614700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.761400,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.036100,-1.535000,25.196800>}
box{<0,0,-0.203200><2.274700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.761400,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.782900,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.782900,-1.535000,6.349400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.782900,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.348900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<49.783400,-1.535000,6.348900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,5.283200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,5.689600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.096000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.348900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.348900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,6.348900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.351000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,7.467500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<49.783400,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.351000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.351000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,6.351000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.502400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.908800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.783400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,7.315200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.783400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.246800,-1.535000,5.232400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<49.784400,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.348900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,5.232400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.784400,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,6.351000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.784400,-1.535000,6.351000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784400,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.246800,-1.535000,7.467500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<49.784400,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.785000,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.785000,-1.535000,6.350400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<49.785000,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.785000,-1.535000,6.349400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.349400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.785000,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.785000,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.350400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.785000,-1.535000,6.350400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.799500,-1.535000,23.101200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,23.768700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<49.799500,-1.535000,23.101200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.799500,-1.535000,25.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,24.491200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<49.799500,-1.535000,25.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.825800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.934400,-1.535000,23.164800>}
box{<0,0,-0.203200><2.108600,0.035000,0.203200> rotate<0,0.000000,0> translate<49.825800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,34.865600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,36.254300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<49.936300,-1.535000,36.254300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,34.950400>}
box{<0,0,-0.203200><13.284500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.936300,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.442400,-1.535000,35.356800>}
box{<0,0,-0.203200><2.506100,0.035000,0.203200> rotate<0,0.000000,0> translate<49.936300,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.036000,-1.535000,35.763200>}
box{<0,0,-0.203200><2.099700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.936300,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.936300,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,36.169600>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.936300,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.952100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,24.790400>}
box{<0,0,-0.203200><1.711500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.952100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.994100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,23.571200>}
box{<0,0,-0.203200><1.669500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.994100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,23.768700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,24.491200>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,90.000000,0> translate<50.076000,-1.535000,24.491200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,23.977600>}
box{<0,0,-0.203200><1.587600,0.035000,0.203200> rotate<0,0.000000,0> translate<50.076000,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.076000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,24.384000>}
box{<0,0,-0.203200><1.587600,0.035000,0.203200> rotate<0,0.000000,0> translate<50.076000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.246800,-1.535000,5.232400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,5.887100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.246800,-1.535000,5.232400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.246800,-1.535000,7.467500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.812800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<50.246800,-1.535000,7.467500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.297600,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.555300,-1.535000,5.283200>}
box{<0,0,-0.203200><8.257700,0.035000,0.203200> rotate<0,0.000000,0> translate<50.297600,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.399100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,7.315200>}
box{<0,0,-0.203200><12.821700,0.035000,0.203200> rotate<0,0.000000,0> translate<50.399100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.555700,-1.535000,10.883900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.060200,-1.535000,10.883900>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<50.555700,-1.535000,10.883900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.555700,-1.535000,14.516000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.060200,-1.535000,14.516000>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<50.555700,-1.535000,14.516000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.704000,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.852700,-1.535000,5.689600>}
box{<0,0,-0.203200><8.148700,0.035000,0.203200> rotate<0,0.000000,0> translate<50.704000,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.805500,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,6.908800>}
box{<0,0,-0.203200><12.415300,0.035000,0.203200> rotate<0,0.000000,0> translate<50.805500,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,5.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.349400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<50.901500,-1.535000,6.349400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.281300,-1.535000,6.096000>}
box{<0,0,-0.203200><8.379800,0.035000,0.203200> rotate<0,0.000000,0> translate<50.901500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.350400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.812800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<50.901500,-1.535000,6.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.901500,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.116000,-1.535000,6.502400>}
box{<0,0,-0.203200><9.214500,0.035000,0.203200> rotate<0,0.000000,0> translate<50.901500,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.522900,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.855800,-1.535000,37.716400>}
box{<0,0,-0.203200><0.470721,0.035000,0.203200> rotate<0,44.988424,0> translate<51.522900,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,23.435600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,22.453600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<51.663600,-1.535000,23.435600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,24.824300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,23.435600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.663600,-1.535000,23.435600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,24.824300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,25.806300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.663600,-1.535000,24.824300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,36.135600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,35.153600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<51.663600,-1.535000,36.135600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,37.524300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,36.135600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.663600,-1.535000,36.135600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.663600,-1.535000,37.524300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.855800,-1.535000,37.716400>}
box{<0,0,-0.203200><0.271741,0.035000,0.203200> rotate<0,-44.982122,0> translate<51.663600,-1.535000,37.524300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.060200,-1.535000,10.883900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.555500,-1.535000,11.379200>}
box{<0,0,-0.203200><0.700460,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.060200,-1.535000,10.883900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.060200,-1.535000,14.516000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.555500,-1.535000,14.020700>}
box{<0,0,-0.203200><0.700460,0.035000,0.203200> rotate<0,44.997030,0> translate<52.060200,-1.535000,14.516000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.149100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.181600,-1.535000,10.972800>}
box{<0,0,-0.203200><5.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.149100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.332700,-1.535000,40.690700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.818100,-1.535000,40.489600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<52.332700,-1.535000,40.690700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.352200,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.691400,-1.535000,14.224000>}
box{<0,0,-0.203200><4.339200,0.035000,0.203200> rotate<0,0.000000,0> translate<52.352200,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.438000,-1.535000,40.640000>}
box{<0,0,-0.203200><5.982900,0.035000,0.203200> rotate<0,0.000000,0> translate<52.455100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.555500,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,11.379200>}
box{<0,0,-0.203200><3.908800,0.035000,0.203200> rotate<0,0.000000,0> translate<52.555500,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.555500,-1.535000,14.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,14.020700>}
box{<0,0,-0.203200><3.908800,0.035000,0.203200> rotate<0,0.000000,0> translate<52.555500,-1.535000,14.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,22.453600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,22.453600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.645600,-1.535000,22.453600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,25.806300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.645600,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.645600,-1.535000,35.153600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,35.153600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.645600,-1.535000,35.153600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.818100,-1.535000,40.489600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.189600,-1.535000,40.118100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<52.818100,-1.535000,40.489600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.074100,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.272800,-1.535000,40.233600>}
box{<0,0,-0.203200><5.198700,0.035000,0.203200> rotate<0,0.000000,0> translate<53.074100,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.189600,-1.535000,40.118100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.088100,-1.535000,39.219600>}
box{<0,0,-0.203200><1.270671,0.035000,0.203200> rotate<0,44.997030,0> translate<53.189600,-1.535000,40.118100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.480500,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.163900,-1.535000,39.827200>}
box{<0,0,-0.203200><4.683400,0.035000,0.203200> rotate<0,0.000000,0> translate<53.480500,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.886900,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,39.420800>}
box{<0,0,-0.203200><4.253900,0.035000,0.203200> rotate<0,0.000000,0> translate<53.886900,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,22.453600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.389900,-1.535000,22.809200>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.034300,-1.535000,22.453600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.389900,-1.535000,25.450700>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<54.034300,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.034300,-1.535000,35.153600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,36.135600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.034300,-1.535000,35.153600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.088100,-1.535000,39.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.459600,-1.535000,38.848100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<54.088100,-1.535000,39.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.237400,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.616800,-1.535000,25.603200>}
box{<0,0,-0.203200><2.379400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.237400,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.237500,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,35.356800>}
box{<0,0,-0.203200><8.983300,0.035000,0.203200> rotate<0,0.000000,0> translate<54.237500,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.293300,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,39.014400>}
box{<0,0,-0.203200><3.847500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.293300,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.339100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515100,-1.535000,22.758400>}
box{<0,0,-0.203200><2.176000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.339100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.389900,-1.535000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,22.809200>}
box{<0,0,-0.203200><2.074400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.389900,-1.535000,22.809200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.389900,-1.535000,25.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,25.450700>}
box{<0,0,-0.203200><2.074400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.389900,-1.535000,25.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.459600,-1.535000,38.848100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660700,-1.535000,38.362700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<54.459600,-1.535000,38.848100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.559100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.245500,-1.535000,38.608000>}
box{<0,0,-0.203200><3.686400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.559100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.643900,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,35.763200>}
box{<0,0,-0.203200><8.576900,0.035000,0.203200> rotate<0,0.000000,0> translate<54.643900,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660700,-1.535000,37.879900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660700,-1.535000,38.362700>}
box{<0,0,-0.203200><0.482800,0.035000,0.203200> rotate<0,90.000000,0> translate<54.660700,-1.535000,38.362700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660700,-1.535000,37.879900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,37.524300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<54.660700,-1.535000,37.879900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660700,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.379200,-1.535000,38.201600>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660700,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.745400,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.613800,-1.535000,37.795200>}
box{<0,0,-0.203200><3.868400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.745400,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,36.135600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,37.524300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<55.016300,-1.535000,37.524300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,36.169600>}
box{<0,0,-0.203200><8.204500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.016300,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.494700,-1.535000,36.576000>}
box{<0,0,-0.203200><5.478400,0.035000,0.203200> rotate<0,0.000000,0> translate<55.016300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.456900,-1.535000,36.982400>}
box{<0,0,-0.203200><4.440600,0.035000,0.203200> rotate<0,0.000000,0> translate<55.016300,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.016300,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.954200,-1.535000,37.388800>}
box{<0,0,-0.203200><3.937900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.016300,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,14.954400>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<56.438800,-1.535000,15.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.189000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.144000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.438800,-1.535000,15.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.189000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,15.189000>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.438800,-1.535000,15.189000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,15.290800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.438800,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.290800>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.438800,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,15.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,15.525500>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<56.438800,-1.535000,15.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,21.304400>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<56.438800,-1.535000,21.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.539000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.494000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.438800,-1.535000,21.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.539000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,21.539000>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.438800,-1.535000,21.539000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,21.640800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.438800,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.685900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.640800>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.438800,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.438800,-1.535000,21.685900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,21.875500>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<56.438800,-1.535000,21.685900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,11.192700>}
box{<0,0,-0.203200><0.263751,0.035000,0.203200> rotate<0,44.997030,0> translate<56.464300,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,14.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,14.207200>}
box{<0,0,-0.203200><0.263751,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.464300,-1.535000,14.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,22.809200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,22.622700>}
box{<0,0,-0.203200><0.263751,0.035000,0.203200> rotate<0,44.997030,0> translate<56.464300,-1.535000,22.809200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.464300,-1.535000,25.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,25.637200>}
box{<0,0,-0.203200><0.263751,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.464300,-1.535000,25.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,14.954400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,14.771900>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<56.468800,-1.535000,14.954400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,15.525500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,15.708000>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<56.468800,-1.535000,15.525500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,21.304400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,21.121900>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<56.468800,-1.535000,21.304400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.468800,-1.535000,21.875500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,22.058000>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<56.468800,-1.535000,21.875500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,14.771900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,14.601000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<56.528100,-1.535000,14.771900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,15.708000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,15.878900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<56.528100,-1.535000,15.708000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,21.121900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,20.951000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<56.528100,-1.535000,21.121900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.528100,-1.535000,22.058000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,22.228900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<56.528100,-1.535000,22.058000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,14.601000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,14.445700>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<56.615200,-1.535000,14.601000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,15.878900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,16.034200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<56.615200,-1.535000,15.878900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,20.951000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,20.795700>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<56.615200,-1.535000,20.951000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.615200,-1.535000,22.228900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,22.384200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<56.615200,-1.535000,22.228900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,11.192700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.304300,-1.535000,10.922000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<56.650800,-1.535000,11.192700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,14.207200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.876600,-1.535000,14.300700>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,-22.492143,0> translate<56.650800,-1.535000,14.207200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,22.622700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.876600,-1.535000,22.529200>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,22.492143,0> translate<56.650800,-1.535000,22.622700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.650800,-1.535000,25.637200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.304300,-1.535000,25.907900>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<56.650800,-1.535000,25.637200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,14.445700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,14.310000>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<56.728000,-1.535000,14.445700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,16.034200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,16.169900>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.728000,-1.535000,16.034200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,20.795700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,20.660000>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<56.728000,-1.535000,20.795700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.728000,-1.535000,22.384200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,22.519900>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.728000,-1.535000,22.384200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,14.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.876600,-1.535000,14.300700>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,35.786612,0> translate<56.863700,-1.535000,14.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,16.169900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.019000,-1.535000,16.282700>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-35.989884,0> translate<56.863700,-1.535000,16.169900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,20.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.019000,-1.535000,20.547200>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,35.989884,0> translate<56.863700,-1.535000,20.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.863700,-1.535000,22.519900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.876600,-1.535000,22.529200>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,-35.786612,0> translate<56.863700,-1.535000,22.519900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.019000,-1.535000,16.282700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.189900,-1.535000,16.369800>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-27.004100,0> translate<57.019000,-1.535000,16.282700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.019000,-1.535000,20.547200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.189900,-1.535000,20.460100>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,27.004100,0> translate<57.019000,-1.535000,20.547200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.189900,-1.535000,16.369800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372400,-1.535000,16.429100>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-17.999424,0> translate<57.189900,-1.535000,16.369800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.189900,-1.535000,20.460100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372400,-1.535000,20.400800>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,17.999424,0> translate<57.189900,-1.535000,20.460100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.304300,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.535600,-1.535000,10.922000>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.304300,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.304300,-1.535000,25.907900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.535600,-1.535000,25.907900>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.304300,-1.535000,25.907900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372400,-1.535000,16.429100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.562000,-1.535000,16.459100>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-8.990654,0> translate<57.372400,-1.535000,16.429100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372400,-1.535000,20.400800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.562000,-1.535000,20.370800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,8.990654,0> translate<57.372400,-1.535000,20.400800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.562000,-1.535000,16.459100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,16.459100>}
box{<0,0,-0.203200><0.807000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.562000,-1.535000,16.459100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.562000,-1.535000,20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,20.370800>}
box{<0,0,-0.203200><0.807000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.562000,-1.535000,20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<58.140800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.140800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<58.140800,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,38.998800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,38.281800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<58.140800,-1.535000,38.998800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,39.741100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,38.998800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.140800,-1.535000,38.998800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.140800,-1.535000,39.741100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,40.458100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<58.140800,-1.535000,39.741100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<58.332900,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<58.332900,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,38.281800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,37.638900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<58.332900,-1.535000,38.281800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.332900,-1.535000,40.458100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,41.101000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<58.332900,-1.535000,40.458100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,15.189000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.368500,-1.535000,15.189000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.368500,-1.535000,21.539000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.368500,-1.535000,21.539000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,15.291400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,16.459100>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,90.000000,0> translate<58.369000,-1.535000,16.459100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,15.291400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,15.291400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,15.291400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,15.443200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,15.849600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,16.256000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,21.538500>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,90.000000,0> translate<58.369000,-1.535000,21.538500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,20.726400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,21.132800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.369000,-1.535000,21.538500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,21.538500>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<58.369000,-1.535000,21.538500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,16.459100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,15.291400>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.470800,-1.535000,15.291400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,16.459100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.277900,-1.535000,16.459100>}
box{<0,0,-0.203200><0.807100,0.035000,0.203200> rotate<0,0.000000,0> translate<58.470800,-1.535000,16.459100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.277900,-1.535000,20.370800>}
box{<0,0,-0.203200><0.807100,0.035000,0.203200> rotate<0,0.000000,0> translate<58.470800,-1.535000,20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,21.538500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.470800,-1.535000,20.370800>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.470800,-1.535000,20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,15.189000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,15.290800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,90.000000,0> translate<58.471400,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,15.189000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.189000>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<58.471400,-1.535000,15.189000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.290800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<58.471400,-1.535000,15.290800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,21.539000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,21.640800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,90.000000,0> translate<58.471400,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,21.539000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.539000>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<58.471400,-1.535000,21.539000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,21.539200>}
box{<0,0,-0.203200><4.749400,0.035000,0.203200> rotate<0,0.000000,0> translate<58.471400,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.471400,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.640800>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,0.000000,0> translate<58.471400,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,1.554100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<58.704100,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.704100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,37.638900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,37.114100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<58.704100,-1.535000,37.638900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.704100,-1.535000,41.101000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,41.625800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.704100,-1.535000,41.101000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.809300,-1.535000,1.219100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,29.991053,0> translate<59.228900,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.871800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<59.228900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,37.114100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.871800,-1.535000,36.742900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<59.228900,-1.535000,37.114100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.228900,-1.535000,41.625800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.792000,-1.535000,41.950800>}
box{<0,0,-0.203200><0.650159,0.035000,0.203200> rotate<0,-29.989936,0> translate<59.228900,-1.535000,41.625800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.277900,-1.535000,16.459100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.467500,-1.535000,16.429100>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,8.990654,0> translate<59.277900,-1.535000,16.459100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.277900,-1.535000,20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.467500,-1.535000,20.400800>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-8.990654,0> translate<59.277900,-1.535000,20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.467500,-1.535000,16.429100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.650000,-1.535000,16.369800>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,17.999424,0> translate<59.467500,-1.535000,16.429100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.467500,-1.535000,20.400800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.650000,-1.535000,20.460100>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-17.999424,0> translate<59.467500,-1.535000,20.400800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.535600,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,11.192700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<59.535600,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.535600,-1.535000,25.907900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,25.637200>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<59.535600,-1.535000,25.907900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.650000,-1.535000,16.369800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820900,-1.535000,16.282700>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,27.004100,0> translate<59.650000,-1.535000,16.369800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.650000,-1.535000,20.460100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820900,-1.535000,20.547200>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-27.004100,0> translate<59.650000,-1.535000,20.460100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.658200,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,10.972800>}
box{<0,0,-0.203200><3.562600,0.035000,0.203200> rotate<0,0.000000,0> translate<59.658200,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820900,-1.535000,16.282700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,16.169900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,35.989884,0> translate<59.820900,-1.535000,16.282700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820900,-1.535000,20.547200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,20.660000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-35.989884,0> translate<59.820900,-1.535000,20.547200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.857700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,16.256000>}
box{<0,0,-0.203200><3.363100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.857700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.871800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.588800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<59.871800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.871800,-1.535000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.588800,-1.535000,36.550800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<59.871800,-1.535000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.963300,-1.535000,14.300700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,14.310000>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,-35.786612,0> translate<59.963300,-1.535000,14.300700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.963300,-1.535000,14.300700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,14.207200>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,22.492143,0> translate<59.963300,-1.535000,14.300700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.963300,-1.535000,22.529200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,22.519900>}
box{<0,0,-0.203200><0.015903,0.035000,0.203200> rotate<0,35.786612,0> translate<59.963300,-1.535000,22.529200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.963300,-1.535000,22.529200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,22.622700>}
box{<0,0,-0.203200><0.244393,0.035000,0.203200> rotate<0,-22.492143,0> translate<59.963300,-1.535000,22.529200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,14.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,14.445700>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.976200,-1.535000,14.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,16.169900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,16.034200>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<59.976200,-1.535000,16.169900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,20.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,20.795700>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.976200,-1.535000,20.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.976200,-1.535000,22.519900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,22.384200>}
box{<0,0,-0.203200><0.191909,0.035000,0.203200> rotate<0,44.997030,0> translate<59.976200,-1.535000,22.519900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.042600,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,20.726400>}
box{<0,0,-0.203200><3.178200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.042600,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,14.445700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,14.601000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<60.111900,-1.535000,14.445700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,16.034200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,15.878900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<60.111900,-1.535000,16.034200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,20.795700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,20.951000>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,-54.004177,0> translate<60.111900,-1.535000,20.795700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.111900,-1.535000,22.384200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,22.228900>}
box{<0,0,-0.203200><0.191943,0.035000,0.203200> rotate<0,54.004177,0> translate<60.111900,-1.535000,22.384200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.135300,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,22.352000>}
box{<0,0,-0.203200><3.085500,0.035000,0.203200> rotate<0,0.000000,0> translate<60.135300,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.148600,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,14.224000>}
box{<0,0,-0.203200><3.072200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.148600,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,11.192700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,11.692800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.189100,-1.535000,11.192700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,14.207200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,13.707100>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<60.189100,-1.535000,14.207200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,22.622700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,23.122800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.189100,-1.535000,22.622700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.189100,-1.535000,25.637200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,25.137100>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<60.189100,-1.535000,25.637200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223100,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,25.603200>}
box{<0,0,-0.203200><2.997700,0.035000,0.203200> rotate<0,0.000000,0> translate<60.223100,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,14.601000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,14.771900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<60.224700,-1.535000,14.601000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,15.878900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,15.708000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<60.224700,-1.535000,15.878900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,20.951000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,21.121900>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,-62.989961,0> translate<60.224700,-1.535000,20.951000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.224700,-1.535000,22.228900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,22.058000>}
box{<0,0,-0.203200><0.191816,0.035000,0.203200> rotate<0,62.989961,0> translate<60.224700,-1.535000,22.228900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.239600,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,14.630400>}
box{<0,0,-0.203200><2.981200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.239600,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.239700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,15.849600>}
box{<0,0,-0.203200><2.981100,0.035000,0.203200> rotate<0,0.000000,0> translate<60.239700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,14.771900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,14.954400>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<60.311800,-1.535000,14.771900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,15.708000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,15.525500>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<60.311800,-1.535000,15.708000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,21.121900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,21.304400>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,-71.994636,0> translate<60.311800,-1.535000,21.121900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.311800,-1.535000,22.058000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,21.875500>}
box{<0,0,-0.203200><0.191893,0.035000,0.203200> rotate<0,71.994636,0> translate<60.311800,-1.535000,22.058000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.315300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,21.132800>}
box{<0,0,-0.203200><2.905500,0.035000,0.203200> rotate<0,0.000000,0> translate<60.315300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.324800,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,22.758400>}
box{<0,0,-0.203200><2.896000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.324800,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348400,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,21.945600>}
box{<0,0,-0.203200><2.872400,0.035000,0.203200> rotate<0,0.000000,0> translate<60.348400,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,14.954400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.144000>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<60.371100,-1.535000,14.954400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,15.525500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.335900>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<60.371100,-1.535000,15.525500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,21.304400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.494000>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,-81.003406,0> translate<60.371100,-1.535000,21.304400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.371100,-1.535000,21.875500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.685900>}
box{<0,0,-0.203200><0.191959,0.035000,0.203200> rotate<0,81.003406,0> translate<60.371100,-1.535000,21.875500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.375600,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,11.379200>}
box{<0,0,-0.203200><2.845200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.375600,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.384100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,15.036800>}
box{<0,0,-0.203200><2.836700,0.035000,0.203200> rotate<0,0.000000,0> translate<60.384100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.384200,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,15.443200>}
box{<0,0,-0.203200><2.836600,0.035000,0.203200> rotate<0,0.000000,0> translate<60.384200,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.189000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.401100,-1.535000,15.189000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.290800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,15.335900>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,90.000000,0> translate<60.401100,-1.535000,15.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.539000>}
box{<0,0,-0.203200><0.045000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.401100,-1.535000,21.539000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,21.685900>}
box{<0,0,-0.203200><0.045100,0.035000,0.203200> rotate<0,90.000000,0> translate<60.401100,-1.535000,21.685900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.578700,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,13.817600>}
box{<0,0,-0.203200><2.642100,0.035000,0.203200> rotate<0,0.000000,0> translate<60.578700,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.588800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.331100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.588800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.588800,-1.535000,36.550800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.331100,-1.535000,36.550800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.588800,-1.535000,36.550800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.629500,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,25.196800>}
box{<0,0,-0.203200><2.591300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.629500,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,11.692800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,12.346300>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<60.689200,-1.535000,11.692800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,13.707100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,13.053600>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<60.689200,-1.535000,13.707100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,23.122800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,23.776300>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<60.689200,-1.535000,23.122800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.689200,-1.535000,25.137100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,24.483600>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<60.689200,-1.535000,25.137100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706500,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,23.164800>}
box{<0,0,-0.203200><2.514300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.706500,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.727600,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,11.785600>}
box{<0,0,-0.203200><2.493200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.727600,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.811800,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,13.411200>}
box{<0,0,-0.203200><2.409000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.811800,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.832900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,24.790400>}
box{<0,0,-0.203200><2.387900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.832900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.874900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,23.571200>}
box{<0,0,-0.203200><2.345900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.874900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.895900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,12.192000>}
box{<0,0,-0.203200><2.324900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.895900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,12.346300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,13.053600>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,90.000000,0> translate<60.959900,-1.535000,13.053600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,12.598400>}
box{<0,0,-0.203200><2.260900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959900,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,13.004800>}
box{<0,0,-0.203200><2.260900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959900,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,23.776300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,24.483600>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,90.000000,0> translate<60.959900,-1.535000,24.483600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,23.977600>}
box{<0,0,-0.203200><2.260900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959900,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,24.384000>}
box{<0,0,-0.203200><2.260900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.331100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.048100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<61.331100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.331100,-1.535000,36.550800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.048100,-1.535000,36.742900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<61.331100,-1.535000,36.550800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.425100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,36.576000>}
box{<0,0,-0.203200><1.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.425100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.804000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,6.502400>}
box{<0,0,-0.203200><1.416800,0.035000,0.203200> rotate<0,0.000000,0> translate<61.804000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.048100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.691000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<62.048100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.048100,-1.535000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.691000,-1.535000,37.114100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<62.048100,-1.535000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.462900,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,36.982400>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,0.000000,0> translate<62.462900,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.638700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,6.096000>}
box{<0,0,-0.203200><0.582100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.638700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.691000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.215800,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<62.691000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.691000,-1.535000,37.114100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.215800,-1.535000,37.638900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.691000,-1.535000,37.114100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.965700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,37.388800>}
box{<0,0,-0.203200><0.255100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.965700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.067200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.153600,0.035000,0.203200> rotate<0,0.000000,0> translate<63.067200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.215800,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,5.532100>}
box{<0,0,-0.203200><0.010208,0.035000,0.203200> rotate<0,60.668816,0> translate<63.215800,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.215800,-1.535000,37.638900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,37.647800>}
box{<0,0,-0.203200><0.010208,0.035000,0.203200> rotate<0,-60.668816,0> translate<63.215800,-1.535000,37.638900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,37.647800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,5.532100>}
box{<0,0,-0.203200><32.115700,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.220800,-1.535000,5.532100> }
texture{col_pol}
}
#end
union{
cylinder{<12.700000,0.038000,22.860000><12.700000,-1.538000,22.860000>0.406400}
cylinder{<7.620000,0.038000,22.860000><7.620000,-1.538000,22.860000>0.406400}
cylinder{<30.480000,0.038000,22.860000><30.480000,-1.538000,22.860000>0.406400}
cylinder{<30.480000,0.038000,17.780000><30.480000,-1.538000,17.780000>0.406400}
cylinder{<42.164000,0.038000,11.430000><42.164000,-1.538000,11.430000>0.406400}
cylinder{<37.084000,0.038000,11.430000><37.084000,-1.538000,11.430000>0.406400}
cylinder{<19.050000,0.038000,34.290000><19.050000,-1.538000,34.290000>0.406400}
cylinder{<24.130000,0.038000,34.290000><24.130000,-1.538000,34.290000>0.406400}
cylinder{<48.260000,0.038000,35.560000><48.260000,-1.538000,35.560000>0.406400}
cylinder{<48.260000,0.038000,30.480000><48.260000,-1.538000,30.480000>0.406400}
cylinder{<15.240000,0.038000,12.700000><15.240000,-1.538000,12.700000>0.406400}
cylinder{<15.240000,0.038000,10.160000><15.240000,-1.538000,10.160000>0.406400}
cylinder{<48.260000,0.038000,24.130000><48.260000,-1.538000,24.130000>0.406400}
cylinder{<48.260000,0.038000,21.590000><48.260000,-1.538000,21.590000>0.406400}
cylinder{<33.020000,0.038000,33.020000><33.020000,-1.538000,33.020000>0.406400}
cylinder{<33.020000,0.038000,30.480000><33.020000,-1.538000,30.480000>0.406400}
cylinder{<41.910000,0.038000,31.750000><41.910000,-1.538000,31.750000>0.406400}
cylinder{<39.370000,0.038000,31.750000><39.370000,-1.538000,31.750000>0.406400}
cylinder{<47.752000,0.038000,12.700000><47.752000,-1.538000,12.700000>0.406400}
cylinder{<51.308000,0.038000,12.700000><51.308000,-1.538000,12.700000>0.406400}
cylinder{<17.780000,0.038000,24.130000><17.780000,-1.538000,24.130000>0.406400}
cylinder{<17.780000,0.038000,21.590000><17.780000,-1.538000,21.590000>0.406400}
cylinder{<17.780000,0.038000,19.050000><17.780000,-1.538000,19.050000>0.406400}
cylinder{<17.780000,0.038000,16.510000><17.780000,-1.538000,16.510000>0.406400}
cylinder{<25.400000,0.038000,16.510000><25.400000,-1.538000,16.510000>0.406400}
cylinder{<25.400000,0.038000,19.050000><25.400000,-1.538000,19.050000>0.406400}
cylinder{<25.400000,0.038000,21.590000><25.400000,-1.538000,21.590000>0.406400}
cylinder{<25.400000,0.038000,24.130000><25.400000,-1.538000,24.130000>0.406400}
cylinder{<35.560000,0.038000,24.130000><35.560000,-1.538000,24.130000>0.406400}
cylinder{<35.560000,0.038000,21.590000><35.560000,-1.538000,21.590000>0.406400}
cylinder{<35.560000,0.038000,19.050000><35.560000,-1.538000,19.050000>0.406400}
cylinder{<35.560000,0.038000,16.510000><35.560000,-1.538000,16.510000>0.406400}
cylinder{<43.180000,0.038000,16.510000><43.180000,-1.538000,16.510000>0.406400}
cylinder{<43.180000,0.038000,19.050000><43.180000,-1.538000,19.050000>0.406400}
cylinder{<43.180000,0.038000,21.590000><43.180000,-1.538000,21.590000>0.406400}
cylinder{<43.180000,0.038000,24.130000><43.180000,-1.538000,24.130000>0.406400}
cylinder{<5.080000,0.038000,16.510000><5.080000,-1.538000,16.510000>0.508000}
cylinder{<5.080000,0.038000,13.970000><5.080000,-1.538000,13.970000>0.508000}
cylinder{<58.420000,0.038000,21.590000><58.420000,-1.538000,21.590000>0.508000}
cylinder{<58.420000,0.038000,24.130000><58.420000,-1.538000,24.130000>0.508000}
cylinder{<58.420000,0.038000,12.700000><58.420000,-1.538000,12.700000>0.508000}
cylinder{<58.420000,0.038000,15.240000><58.420000,-1.538000,15.240000>0.508000}
cylinder{<24.130000,0.038000,7.620000><24.130000,-1.538000,7.620000>0.508000}
cylinder{<26.670000,0.038000,7.620000><26.670000,-1.538000,7.620000>0.508000}
cylinder{<29.210000,0.038000,7.620000><29.210000,-1.538000,7.620000>0.508000}
cylinder{<10.160000,0.038000,26.670000><10.160000,-1.538000,26.670000>0.406400}
cylinder{<10.160000,0.038000,39.370000><10.160000,-1.538000,39.370000>0.406400}
cylinder{<10.160000,0.038000,6.350000><10.160000,-1.538000,6.350000>0.406400}
cylinder{<10.160000,0.038000,19.050000><10.160000,-1.538000,19.050000>0.406400}
cylinder{<15.240000,0.038000,29.210000><15.240000,-1.538000,29.210000>0.406400}
cylinder{<27.940000,0.038000,29.210000><27.940000,-1.538000,29.210000>0.406400}
cylinder{<53.340000,0.038000,36.830000><53.340000,-1.538000,36.830000>0.406400}
cylinder{<53.340000,0.038000,24.130000><53.340000,-1.538000,24.130000>0.406400}
cylinder{<49.784000,0.038000,6.350000><49.784000,-1.538000,6.350000>0.406400}
cylinder{<37.084000,0.038000,6.350000><37.084000,-1.538000,6.350000>0.406400}
cylinder{<31.750000,0.038000,39.370000><31.750000,-1.538000,39.370000>0.406400}
cylinder{<44.450000,0.038000,39.370000><44.450000,-1.538000,39.370000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<10.464800,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,23.495000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<10.464800,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.464800,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,22.860000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<10.464800,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.829800,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,23.495000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.829800,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.829800,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,22.860000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<8.636000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,24.384000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.843000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,24.638000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,21.336000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,21.082000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,21.082000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,0.000000,21.336000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,0.000000,24.384000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,0.000000,24.384000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,0.000000,21.336000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<31.115000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.480000,0.000000,20.624800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<30.480000,0.000000,20.624800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.480000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.845000,0.000000,20.624800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<29.845000,0.000000,20.624800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,21.844000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<30.480000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<31.115000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.480000,0.000000,19.989800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<30.480000,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.480000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.845000,0.000000,19.989800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<29.845000,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,18.796000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,24.003000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.702000,0.000000,16.891000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.702000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,16.637000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,23.749000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.258000,0.000000,23.749000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.004000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.956000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.956000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.004000,0.000000,23.749000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.928800,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.928800,0.000000,11.430000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<39.928800,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.928800,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.928800,0.000000,12.065000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<39.928800,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.928800,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,11.430000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<39.928800,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.293800,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.293800,0.000000,11.430000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<39.293800,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.293800,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.293800,0.000000,12.065000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<39.293800,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.293800,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,11.430000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.100000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,12.954000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.307000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,13.208000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,9.906000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.941000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,9.652000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,9.652000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.195000,0.000000,9.906000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.195000,0.000000,12.954000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.053000,0.000000,12.954000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.053000,0.000000,9.906000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.285200,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.285200,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<21.285200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.285200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.285200,0.000000,33.655000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<21.285200,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.285200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,34.290000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.920200,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.920200,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<21.920200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.920200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.920200,0.000000,33.655000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<21.920200,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,34.290000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,32.766000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.907000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,32.512000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,35.814000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.273000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,36.068000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,36.068000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.019000,0.000000,35.814000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.019000,0.000000,32.766000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.161000,0.000000,32.766000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.161000,0.000000,35.814000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,33.324800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,33.324800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,33.324800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,33.324800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,33.324800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,33.324800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,33.324800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,34.544000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<48.260000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,32.689800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,32.689800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,31.496000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,36.703000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,29.591000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,29.337000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,36.449000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.038000,0.000000,36.449000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.784000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.736000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.736000,0.000000,36.449000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.784000,0.000000,36.449000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,13.081000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,13.081000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.129000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,13.081000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,12.192000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,12.192000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.970000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.684000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,11.684000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.970000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,12.192000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,12.192000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.240000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,9.779000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,9.779000> }
difference{
cylinder{<15.240000,0,11.430000><15.240000,0.036000,11.430000>2.870200 translate<0,0.000000,0>}
cylinder{<15.240000,-0.1,11.430000><15.240000,0.135000,11.430000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<15.240000,0.000000,10.922000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.530000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,23.622000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,23.622000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,23.114000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,23.114000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,23.622000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,23.622000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,21.209000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,21.209000> }
difference{
cylinder{<48.260000,0,22.860000><48.260000,0.036000,22.860000>2.870200 translate<0,0.000000,0>}
cylinder{<48.260000,-0.1,22.860000><48.260000,0.135000,22.860000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<48.260000,0.000000,22.352000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.401000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.401000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.909000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,33.401000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,32.512000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.512000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.004000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,32.004000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,32.512000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,32.512000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,30.099000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,30.099000> }
difference{
cylinder{<33.020000,0,31.750000><33.020000,0.036000,31.750000>2.870200 translate<0,0.000000,0>}
cylinder{<33.020000,-0.1,31.750000><33.020000,0.135000,31.750000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<33.020000,0.000000,31.242000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.291000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,30.099000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.291000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,31.750000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,33.020000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.402000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,33.020000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.894000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,30.480000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.894000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,30.480000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.894000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,31.750000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.402000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,31.750000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,31.750000> }
difference{
cylinder{<40.640000,0,31.750000><40.640000,0.036000,31.750000>2.870200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,31.750000><40.640000,0.135000,31.750000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<40.132000,0.000000,31.750000>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,13.843000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.101000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,14.224000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.482000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,12.700000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.768000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,11.430000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,13.970000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.276000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,13.970000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,12.700000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.768000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,12.700000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,12.700000> }
difference{
cylinder{<49.530000,0,12.700000><49.530000,0.036000,12.700000>4.140200 translate<0,0.000000,0>}
cylinder{<49.530000,-0.1,12.700000><49.530000,0.135000,12.700000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<50.038000,0.000000,12.700000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,25.400000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.511000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,15.240000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.669000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,15.240000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,25.400000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,25.400000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,25.400000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<21.590000,0.000000,25.400000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,25.400000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.291000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,15.240000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.449000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,15.240000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,25.400000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.386000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,25.400000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,25.400000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<39.370000,0.000000,25.400000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.540000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,0.000000,13.970000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.159000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.080000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,12.700000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,13.970000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.159000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,0.000000,13.970000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.159000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,15.240000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.159000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.080000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,17.780000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,0.000000,15.240000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.159000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.080000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,12.700000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.080000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,15.240000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.001000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.080000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,17.780000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.080000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,17.145000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.001000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,15.875000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<8.001000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,15.240000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.001000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.001000,0.000000,13.335000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<8.001000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.001000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<7.366000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,14.605000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<7.366000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,14.605000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<7.366000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,15.875000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.001000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,15.875000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<7.366000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,17.145000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<7.366000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.366000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,17.145000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<7.366000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.001000,0.000000,17.780000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.001000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,13.970000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,14.224000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<3.175000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.256000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<3.175000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.510000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<3.175000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,16.510000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.683000,0.000000,14.224000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<3.175000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,14.224000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.683000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.683000,0.000000,16.256000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<3.683000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.683000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.510000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<3.175000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.159000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,0.000000,16.256000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.159000,0.000000,16.256000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.080000,0.000000,13.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.080000,0.000000,16.510000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,24.130000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.960000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,25.400000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.420000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,24.130000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.341000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,24.130000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.341000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,22.860000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.341000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,20.320000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.420000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,22.860000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.341000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,25.400000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,22.860000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,20.320000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,20.955000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.499000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,22.225000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<55.499000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,22.860000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.499000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,24.765000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.499000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,24.765000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,24.765000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,23.495000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.134000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,23.495000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,22.225000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,22.225000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,20.955000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.134000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,20.955000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,20.320000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,24.130000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,23.876000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.844000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.590000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,21.590000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,23.876000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<59.817000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,23.876000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,21.844000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.817000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.590000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<59.817000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,21.844000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,21.844000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,24.130000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,21.590000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,15.240000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.960000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,16.510000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.420000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,15.240000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.341000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,15.240000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.341000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,13.970000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.341000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,11.430000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.420000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.341000,0.000000,13.970000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.341000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,16.510000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,13.970000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.420000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,11.430000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,12.065000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.499000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,13.335000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<55.499000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,13.970000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.499000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.499000,0.000000,15.875000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.499000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,15.875000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,15.875000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,14.605000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.134000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,14.605000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,13.335000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.134000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.134000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,12.065000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.499000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.499000,0.000000,11.430000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.499000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,15.240000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,14.986000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.954000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.700000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.325000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,12.700000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,14.986000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<59.817000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,14.986000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,12.954000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.817000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.817000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.700000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<59.817000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.341000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.325000,0.000000,12.954000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.325000,0.000000,12.954000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,15.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,12.700000>}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,4.699000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.210000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.480000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.480000,0.000000,4.699000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.480000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.480000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,4.699000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.210000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.956000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,4.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.956000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.940000,0.000000,4.699000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.940000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,4.699000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<22.860000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.940000,0.000000,4.699000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<22.860000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.480000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.480000,0.000000,10.541000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<30.480000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.480000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,10.541000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.940000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,10.541000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<22.860000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.495000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,10.541000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.495000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.035000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.305000,0.000000,10.541000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.035000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,10.541000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.305000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.226000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,0.000000,10.541000>}
box{<0,0,-0.127000><0.381000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.845000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,0.000000,9.906000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<29.845000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.575000,0.000000,9.906000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.575000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.575000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.575000,0.000000,10.541000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<28.575000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.575000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,0.000000,10.541000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.575000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.575000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.305000,0.000000,10.541000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.305000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.305000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.305000,0.000000,9.906000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<27.305000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.305000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.035000,0.000000,9.906000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.035000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.035000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.035000,0.000000,10.541000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<26.035000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.035000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,10.541000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.765000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,9.906000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<24.765000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.495000,0.000000,9.906000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.495000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.495000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.495000,0.000000,10.541000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<23.495000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.495000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.860000,0.000000,10.541000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<22.860000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,4.699000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<29.210000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,5.715000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.956000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,5.715000>}
box{<0,0,-0.127000><4.572000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.384000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,5.715000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,4.699000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<24.130000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,6.223000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<28.956000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,5.715000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<28.956000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.956000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,6.223000>}
box{<0,0,-0.127000><4.572000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.384000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,5.715000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<24.130000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.384000,0.000000,5.715000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<24.384000,0.000000,5.715000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.210000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.670000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.130000,0.000000,7.620000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,38.354000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,27.686000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,0.000000,27.686000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.049000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.049000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.017000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.017000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.303000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,35.560000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.017000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,30.607000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.144000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,35.560000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,30.607000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.176000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,35.560000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,35.560000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.303000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,36.195000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,37.084000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,28.956000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,0.000000,28.956000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,36.626800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,29.413200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,28.143200>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,18.034000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,7.366000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,0.000000,7.366000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.049000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.049000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,9.525000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.017000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,10.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.017000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.303000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,10.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,15.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.017000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,10.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.144000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,15.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,10.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.176000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,15.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,15.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.303000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,15.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,16.764000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,8.636000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,0.000000,8.636000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,16.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,9.093200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,17.576800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,0.000000,7.823200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.924000,0.000000,29.210000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<26.924000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.256000,0.000000,29.210000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<15.240000,0.000000,29.210000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.669000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.669000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<24.511000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<24.511000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,30.099000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.415000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,30.353000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,30.353000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,28.067000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,28.067000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,30.353000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.003000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,30.226000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.067000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.003000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,28.194000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,30.353000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.130000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,28.067000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.130000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,30.099000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.765000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.035000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.654000,0.000000,29.210000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<25.654000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.145000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.526000,0.000000,29.210000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<17.145000,0.000000,29.210000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<25.196800,0.000000,29.210000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.983200,0.000000,29.210000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<26.466800,0.000000,29.210000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<16.713200,0.000000,29.210000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,25.146000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<53.340000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,35.814000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<53.340000,0.000000,35.814000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.229000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.451000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.451000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.229000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,33.655000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.483000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.356000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.197000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<52.197000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<54.356000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.356000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.197000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.324000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.483000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.197000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,26.416000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<53.340000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,34.544000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<53.340000,0.000000,34.544000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<53.340000,0.000000,26.873200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<53.340000,0.000000,34.086800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<53.340000,0.000000,25.603200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<53.340000,0.000000,35.356800>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.084000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,6.350000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<37.084000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.768000,0.000000,6.350000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.768000,0.000000,6.350000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.355000,0.000000,5.461000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.355000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.513000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.513000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.461000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.609000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,5.207000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,5.207000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<45.847000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,7.493000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,7.493000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.847000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,5.207000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.894000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,5.334000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,7.493000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.894000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,7.366000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,5.207000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,7.493000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,5.461000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.259000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.989000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,6.350000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.989000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.879000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.498000,0.000000,6.350000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.498000,0.000000,6.350000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<39.827200,0.000000,6.350000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<47.040800,0.000000,6.350000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<38.557200,0.000000,6.350000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<48.310800,0.000000,6.350000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.434000,0.000000,39.370000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<43.434000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.766000,0.000000,39.370000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<31.750000,0.000000,39.370000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.179000,0.000000,40.259000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.179000,0.000000,38.481000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.021000,0.000000,38.481000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.021000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,40.259000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.925000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,40.513000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.179000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,40.513000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.560000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,38.227000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.179000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,38.227000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.560000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.513000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.513000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,40.386000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.687000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,38.227000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.513000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,38.354000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.687000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.513000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.640000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,38.227000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.640000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,40.259000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.275000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.545000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.164000,0.000000,39.370000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<42.164000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.655000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.036000,0.000000,39.370000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<33.655000,0.000000,39.370000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<41.706800,0.000000,39.370000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<34.493200,0.000000,39.370000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.976800,0.000000,39.370000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<33.223200,0.000000,39.370000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  AUDIO_AMP(-32.220000,0,-21.585000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
