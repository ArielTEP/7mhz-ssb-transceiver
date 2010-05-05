//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/BFO/BFO.brd
//2010. 05. 05. 10:39:49

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
#local cam_y = 196;
#local cam_z = -105;
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

#local lgt1_pos_x = 22;
#local lgt1_pos_y = 33;
#local lgt1_pos_z = 24;
#local lgt1_intense = 0.738762;
#local lgt2_pos_x = -22;
#local lgt2_pos_y = 33;
#local lgt2_pos_z = 24;
#local lgt2_intense = 0.738762;
#local lgt3_pos_x = 22;
#local lgt3_pos_y = 33;
#local lgt3_pos_z = -16;
#local lgt3_intense = 0.738762;
#local lgt4_pos_x = -22;
#local lgt4_pos_y = 33;
#local lgt4_pos_z = -16;
#local lgt4_intense = 0.738762;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 59.360000;
#declare pcb_y_size = 45.710000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(730);
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
	//translate<-29.680000,0,-22.855000>
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


#macro BFO(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><59.360000,0.000000>
<59.360000,0.000000><59.360000,45.710000>
<59.360000,45.710000><0.000000,45.710000>
<0.000000,45.710000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,41.910000><3.810000,-5,41.910000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<55.880000,1,3.810000><55.880000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<55.880000,1,41.910000><55.880000,-5,41.910000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_TRIM_TZ03F_ORANGE()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.890000,0.000000,10.160000>}#end		//     C1 22pF CTRIMTZ03
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,34.290000>}#end		//ceramic disc capacitator C2 0.01uF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.320000,0.000000,20.320000>}#end		//ceramic disc capacitator C3 100pF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.320000,0.000000,11.430000>}#end		//ceramic disc capacitator C4 100pF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uF35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.480000,0.000000,34.290000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C5 10uF35V E2,5-6
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<33.020000,0.000000,22.860000>}#end		//ceramic disc capacitator C6 22pF C050-035X075
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.370000,0.000000,11.430000>}#end		//ceramic disc capacitator C7 0.01uF C050-035X075
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.260000,0.000000,21.590000>}#end		//ceramic disc capacitator C8 100pF C050-035X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("Z6V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.320000,0.000000,35.560000>}#end		//Diode DO35 10mm hor. D1 Z6V DO35Z10
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,34.290000>}#end		//Molex 53047 J1 +12V 6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,11.430000>}#end		//Molex 53047 J2 OUT 6410-02
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.670000,0.000000,22.860000>}#end		//TO92 bend vertical Q1 BC548B TO92-EBC
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<41.910000,0.000000,22.860000>}#end		//TO92 bend vertical Q2 BC548B TO92-EBC
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<15.240000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 12MM Grid R1 22k 0207/12
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<15.240000,0.000000,16.510000>}#end		//Discrete Resistor 0,3W 12MM Grid R2 22k 0207/12
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<25.400000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 12MM Grid R3 22E 0207/12
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<26.670000,0.000000,11.430000>}#end		//Discrete Resistor 0,3W 12MM Grid R4 1k 0207/12
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<35.560000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 12MM Grid R5 22k 0207/12
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_12MM(texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Blue}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<34.290000,0.000000,11.430000>}#end		//Discrete Resistor 0,3W 12MM Grid R6 5k6 0207/12
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.640000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 12MM Grid R7 1k 0207/12
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.450000,0.000000,11.430000>}#end		//Discrete Resistor 0,3W 12MM Grid R8 220E 0207/12
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<45.720000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 12MM Grid R9 1k 0207/12
#ifndef(pack_X1) #declare global_pack_X1=yes; object {SPC_XTAL_5MM("4.43MHz",12,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,20.320000>}#end		//Quarz 4,9MM X1 4.43MHz QS
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<8.890000,0,12.660000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<8.890000,0,7.660000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<39.370000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<39.370000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<20.320000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<20.320000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<52.070000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<52.070000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<52.070000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<52.070000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<25.400000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<25.400000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<25.400000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<40.640000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<40.640000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<40.640000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.640000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.640000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,22.860000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,12.660000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,13.462000>}
box{<0,0,-0.304800><0.802000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,17.780000>}
box{<0,0,-0.304800><4.318000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,39.370000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,40.640000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.890000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,22.860000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,27.940000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.240000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,17.780000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<20.320000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,22.860000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,20.320000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,22.860000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.320000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,27.940000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.320000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,17.780000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.320000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,17.780000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,20.320000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.210000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.480000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,35.560000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.480000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.290000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,22.860000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.560000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,27.940000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.560000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.480000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,15.240000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.370000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,17.780000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,20.320000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,22.860000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,27.940000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,17.780000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.640000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,30.480000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.720000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,40.640000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.640000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,25.400000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.640000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,19.050000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.260000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,24.130000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<46.990000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,33.020000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.720000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<48.260000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,12.700000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.530000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,33.020000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,33.020000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,4.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.265900>}
box{<0,0,-0.127000><36.811900,0.035000,0.127000> rotate<0,90.000000,0> translate<1.142900,-1.535000,41.265900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,4.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.253900,-1.535000,4.868700>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,-75.010330,0> translate<1.142900,-1.535000,4.454000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.174500,-1.535000,4.572000>}
box{<0,0,-0.127000><0.031600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.242500,-1.535000,4.826000>}
box{<0,0,-0.127000><0.099600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.375900,-1.535000,5.080000>}
box{<0,0,-0.127000><0.233000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.522600,-1.535000,5.334000>}
box{<0,0,-0.127000><0.379700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.708800,-1.535000,5.588000>}
box{<0,0,-0.127000><0.565900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.962800,-1.535000,5.842000>}
box{<0,0,-0.127000><0.819900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.283600,-1.535000,6.096000>}
box{<0,0,-0.127000><1.140700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.723500,-1.535000,6.350000>}
box{<0,0,-0.127000><1.580600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.466800,-1.535000,6.604000>}
box{<0,0,-0.127000><7.323900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.086800,-1.535000,6.858000>}
box{<0,0,-0.127000><6.943900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.895200,-1.535000,7.112000>}
box{<0,0,-0.127000><6.752300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.792000,-1.535000,7.366000>}
box{<0,0,-0.127000><6.649100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766300,-1.535000,7.620000>}
box{<0,0,-0.127000><7.623400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.774800,-1.535000,7.874000>}
box{<0,0,-0.127000><6.631900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.854600,-1.535000,8.128000>}
box{<0,0,-0.127000><6.711700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.011700,-1.535000,8.382000>}
box{<0,0,-0.127000><6.868800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.305500,-1.535000,8.636000>}
box{<0,0,-0.127000><7.162600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,8.890000>}
box{<0,0,-0.127000><19.100200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.783200,-1.535000,9.144000>}
box{<0,0,-0.127000><13.640300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.529200,-1.535000,9.398000>}
box{<0,0,-0.127000><13.386300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.275200,-1.535000,9.652000>}
box{<0,0,-0.127000><13.132300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,9.906000>}
box{<0,0,-0.127000><13.055700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163100,-1.535000,10.160000>}
box{<0,0,-0.127000><14.020200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.414000>}
box{<0,0,-0.127000><13.055700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.275300,-1.535000,10.668000>}
box{<0,0,-0.127000><13.132400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.529300,-1.535000,10.922000>}
box{<0,0,-0.127000><13.386400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.046600,-1.535000,11.176000>}
box{<0,0,-0.127000><6.903700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.724600,-1.535000,11.430000>}
box{<0,0,-0.127000><6.581700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.470600,-1.535000,11.684000>}
box{<0,0,-0.127000><6.327700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.355700,-1.535000,11.938000>}
box{<0,0,-0.127000><6.212800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.250400,-1.535000,12.192000>}
box{<0,0,-0.127000><6.107500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.446000>}
box{<0,0,-0.127000><6.053300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.700000>}
box{<0,0,-0.127000><6.053300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.954000>}
box{<0,0,-0.127000><6.053300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.283700,-1.535000,13.208000>}
box{<0,0,-0.127000><6.140800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.388900,-1.535000,13.462000>}
box{<0,0,-0.127000><6.246000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.550700,-1.535000,13.716000>}
box{<0,0,-0.127000><6.407800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,13.970000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,14.224000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,14.478000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,14.732000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,14.986000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,15.240000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,15.494000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,15.748000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,16.002000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,16.256000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.481800,-1.535000,16.510000>}
box{<0,0,-0.127000><6.338900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.227800,-1.535000,16.764000>}
box{<0,0,-0.127000><6.084900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.024700,-1.535000,17.018000>}
box{<0,0,-0.127000><5.881800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.919400,-1.535000,17.272000>}
box{<0,0,-0.127000><5.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,17.526000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,17.780000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,18.034000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.919600,-1.535000,18.288000>}
box{<0,0,-0.127000><5.776700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.024800,-1.535000,18.542000>}
box{<0,0,-0.127000><5.881900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.227900,-1.535000,18.796000>}
box{<0,0,-0.127000><6.085000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.481900,-1.535000,19.050000>}
box{<0,0,-0.127000><6.339000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581100,-1.535000,19.304000>}
box{<0,0,-0.127000><18.438200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323100,-1.535000,19.558000>}
box{<0,0,-0.127000><22.180200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.217900,-1.535000,19.812000>}
box{<0,0,-0.127000><22.075000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.066000>}
box{<0,0,-0.127000><21.996500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.320000>}
box{<0,0,-0.127000><21.996500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.574000>}
box{<0,0,-0.127000><21.996500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.218000,-1.535000,20.828000>}
box{<0,0,-0.127000><22.075100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323200,-1.535000,21.082000>}
box{<0,0,-0.127000><22.180300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.501000,-1.535000,21.336000>}
box{<0,0,-0.127000><13.358100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.481800,-1.535000,21.590000>}
box{<0,0,-0.127000><6.338900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.227800,-1.535000,21.844000>}
box{<0,0,-0.127000><6.084900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.024700,-1.535000,22.098000>}
box{<0,0,-0.127000><5.881800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.919400,-1.535000,22.352000>}
box{<0,0,-0.127000><5.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,22.606000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,22.860000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,23.114000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.919600,-1.535000,23.368000>}
box{<0,0,-0.127000><5.776700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.024800,-1.535000,23.622000>}
box{<0,0,-0.127000><5.881900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.227900,-1.535000,23.876000>}
box{<0,0,-0.127000><6.085000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.481900,-1.535000,24.130000>}
box{<0,0,-0.127000><6.339000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.384000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.638000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.892000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,25.146000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,25.400000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,25.654000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,25.908000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,26.162000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,26.416000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,26.670000>}
box{<0,0,-0.127000><12.852500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.993000,-1.535000,26.924000>}
box{<0,0,-0.127000><12.850100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.739000,-1.535000,27.178000>}
box{<0,0,-0.127000><12.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,27.432000>}
box{<0,0,-0.127000><12.496900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,27.686000>}
box{<0,0,-0.127000><12.496900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,27.940000>}
box{<0,0,-0.127000><12.496900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,28.194000>}
box{<0,0,-0.127000><12.496900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,28.448000>}
box{<0,0,-0.127000><12.496900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.739100,-1.535000,28.702000>}
box{<0,0,-0.127000><12.596200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.993100,-1.535000,28.956000>}
box{<0,0,-0.127000><12.850200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.247100,-1.535000,29.210000>}
box{<0,0,-0.127000><13.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.501100,-1.535000,29.464000>}
box{<0,0,-0.127000><13.358200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.281600,-1.535000,29.718000>}
box{<0,0,-0.127000><18.138700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,29.972000>}
box{<0,0,-0.127000><18.135700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.226000>}
box{<0,0,-0.127000><18.135700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,30.480000>}
box{<0,0,-0.127000><19.100200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.433200,-1.535000,30.734000>}
box{<0,0,-0.127000><7.290300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.179200,-1.535000,30.988000>}
box{<0,0,-0.127000><7.036300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.925200,-1.535000,31.242000>}
box{<0,0,-0.127000><6.782300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.496000>}
box{<0,0,-0.127000><6.705700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,31.750000>}
box{<0,0,-0.127000><7.670200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,32.004000>}
box{<0,0,-0.127000><6.705700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.925300,-1.535000,32.258000>}
box{<0,0,-0.127000><6.782400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.179300,-1.535000,32.512000>}
box{<0,0,-0.127000><7.036400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.433300,-1.535000,32.766000>}
box{<0,0,-0.127000><7.290400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403100,-1.535000,33.020000>}
box{<0,0,-0.127000><29.260200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,33.274000>}
box{<0,0,-0.127000><28.156000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317800,-1.535000,33.528000>}
box{<0,0,-0.127000><28.174900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.571800,-1.535000,33.782000>}
box{<0,0,-0.127000><28.428900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.612700,-1.535000,34.036000>}
box{<0,0,-0.127000><28.469800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.289400,-1.535000,34.290000>}
box{<0,0,-0.127000><28.146500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.035400,-1.535000,34.544000>}
box{<0,0,-0.127000><27.892500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.912300,-1.535000,34.798000>}
box{<0,0,-0.127000><27.769400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.807100,-1.535000,35.052000>}
box{<0,0,-0.127000><27.664200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.151000,-1.535000,35.306000>}
box{<0,0,-0.127000><7.008100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.897000,-1.535000,35.560000>}
box{<0,0,-0.127000><6.754100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.643000,-1.535000,35.814000>}
box{<0,0,-0.127000><6.500100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.389000,-1.535000,36.068000>}
box{<0,0,-0.127000><6.246100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,36.322000>}
box{<0,0,-0.127000><6.146900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,36.576000>}
box{<0,0,-0.127000><6.146900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,36.830000>}
box{<0,0,-0.127000><6.146900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,37.084000>}
box{<0,0,-0.127000><6.146900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,37.338000>}
box{<0,0,-0.127000><6.146900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.389100,-1.535000,37.592000>}
box{<0,0,-0.127000><6.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.643100,-1.535000,37.846000>}
box{<0,0,-0.127000><6.500200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,38.100000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,38.354000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,38.608000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,38.862000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,39.116000>}
box{<0,0,-0.127000><6.502500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.723300,-1.535000,39.370000>}
box{<0,0,-0.127000><1.580400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.283300,-1.535000,39.624000>}
box{<0,0,-0.127000><1.140400,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.962700,-1.535000,39.878000>}
box{<0,0,-0.127000><0.819800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.708700,-1.535000,40.132000>}
box{<0,0,-0.127000><0.565800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.522400,-1.535000,40.386000>}
box{<0,0,-0.127000><0.379500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.375800,-1.535000,40.640000>}
box{<0,0,-0.127000><0.232900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.242400,-1.535000,40.894000>}
box{<0,0,-0.127000><0.099500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.174400,-1.535000,41.148000>}
box{<0,0,-0.127000><0.031500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.265900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.253900,-1.535000,40.851200>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,75.010330,0> translate<1.142900,-1.535000,41.265900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.253900,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.615000,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<1.253900,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.253900,-1.535000,40.851200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.615000,-1.535000,40.225700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<1.253900,-1.535000,40.851200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.615000,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.125700,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.615000,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.615000,-1.535000,40.225700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.125700,-1.535000,39.715000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<1.615000,-1.535000,40.225700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.125700,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.751200,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<2.125700,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.125700,-1.535000,39.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.751200,-1.535000,39.353900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<2.125700,-1.535000,39.715000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.751200,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.448800,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<2.751200,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.751200,-1.535000,39.353900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.448800,-1.535000,39.167000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<2.751200,-1.535000,39.353900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.448800,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.171100,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<3.448800,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.448800,-1.535000,39.167000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.171100,-1.535000,39.167000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<3.448800,-1.535000,39.167000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.171100,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<4.171100,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.171100,-1.535000,39.167000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,39.353900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<4.171100,-1.535000,39.167000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.454000,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,1.253900>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,-14.983731,0> translate<4.454000,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.454000,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.235900,-1.535000,1.142900>}
box{<0,0,-0.127000><50.781900,0.035000,0.127000> rotate<0,0.000000,0> translate<4.454000,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.491300,-1.535000,44.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,44.466000>}
box{<0,0,-0.127000><0.390681,0.035000,0.127000> rotate<0,14.981442,0> translate<4.491300,-1.535000,44.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.491300,-1.535000,44.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.198600,-1.535000,44.567000>}
box{<0,0,-0.127000><50.707300,0.035000,0.127000> rotate<0,0.000000,0> translate<4.491300,-1.535000,44.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,1.253900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,1.615000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<4.868700,-1.535000,1.253900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<4.868700,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,39.353900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,39.715000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<4.868700,-1.535000,39.353900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.868700,-1.535000,44.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,44.104900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<4.868700,-1.535000,44.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.896500,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.793300,-1.535000,1.270000>}
box{<0,0,-0.127000><49.896800,0.035000,0.127000> rotate<0,0.000000,0> translate<4.896500,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.896500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.793500,-1.535000,6.350000>}
box{<0,0,-0.127000><49.897000,0.035000,0.127000> rotate<0,0.000000,0> translate<4.896500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.896500,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,39.370000>}
box{<0,0,-0.127000><2.748900,0.035000,0.127000> rotate<0,0.000000,0> translate<4.896500,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.896500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.793500,-1.535000,44.450000>}
box{<0,0,-0.127000><49.897000,0.035000,0.127000> rotate<0,0.000000,0> translate<4.896500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.336400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.213300,-1.535000,6.096000>}
box{<0,0,-0.127000><20.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<5.336400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.336400,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.353600,-1.535000,44.196000>}
box{<0,0,-0.127000><49.017200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.336400,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.336500,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.353300,-1.535000,1.524000>}
box{<0,0,-0.127000><49.016800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.336500,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.336500,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.648100,-1.535000,39.624000>}
box{<0,0,-0.127000><2.311600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.336500,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,1.615000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,2.125700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.494200,-1.535000,1.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<5.494200,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,39.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,40.225700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.494200,-1.535000,39.715000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.494200,-1.535000,44.104900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,43.594200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<5.494200,-1.535000,44.104900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.657100,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.959300,-1.535000,5.842000>}
box{<0,0,-0.127000><20.302200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.657100,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.657100,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.032800,-1.535000,43.942000>}
box{<0,0,-0.127000><48.375700,0.035000,0.127000> rotate<0,0.000000,0> translate<5.657100,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.657200,-1.535000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.032700,-1.535000,1.778000>}
box{<0,0,-0.127000><48.375500,0.035000,0.127000> rotate<0,0.000000,0> translate<5.657200,-1.535000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.657200,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.753400,-1.535000,39.878000>}
box{<0,0,-0.127000><2.096200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.657200,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.911100,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.705300,-1.535000,5.588000>}
box{<0,0,-0.127000><19.794200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.911100,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.911100,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.778800,-1.535000,43.688000>}
box{<0,0,-0.127000><47.867700,0.035000,0.127000> rotate<0,0.000000,0> translate<5.911100,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.911200,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.778700,-1.535000,2.032000>}
box{<0,0,-0.127000><47.867500,0.035000,0.127000> rotate<0,0.000000,0> translate<5.911200,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.911200,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.891900,-1.535000,40.132000>}
box{<0,0,-0.127000><1.980700,0.035000,0.127000> rotate<0,0.000000,0> translate<5.911200,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,2.125700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,2.751200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<6.004900,-1.535000,2.125700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,4.868700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<6.004900,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,40.225700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,40.851200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<6.004900,-1.535000,40.225700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.004900,-1.535000,43.594200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,42.968700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<6.004900,-1.535000,43.594200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.097400,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.592400,-1.535000,2.286000>}
box{<0,0,-0.127000><47.495000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.097400,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.097400,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.334000>}
box{<0,0,-0.127000><19.531200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.097400,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.097400,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.145900,-1.535000,40.386000>}
box{<0,0,-0.127000><2.048500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.097400,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.097400,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.592600,-1.535000,43.434000>}
box{<0,0,-0.127000><47.495200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.097400,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.244000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.445800,-1.535000,2.540000>}
box{<0,0,-0.127000><47.201800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.244000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.244000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.399900,-1.535000,40.640000>}
box{<0,0,-0.127000><2.155900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.244000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.244100,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,5.080000>}
box{<0,0,-0.127000><20.349000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.244100,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.244100,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.445900,-1.535000,43.180000>}
box{<0,0,-0.127000><47.201800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.244100,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,2.751200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,3.448800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<6.366000,-1.535000,2.751200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,4.171100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<6.366000,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,40.851200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,41.548800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<6.366000,-1.535000,40.851200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.366000,-1.535000,42.968700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,42.271100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<6.366000,-1.535000,42.968700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.377400,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.312400,-1.535000,2.794000>}
box{<0,0,-0.127000><46.935000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.377400,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.377400,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.653900,-1.535000,40.894000>}
box{<0,0,-0.127000><2.276500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.377400,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.377500,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,4.826000>}
box{<0,0,-0.127000><19.251100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.377500,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.377500,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.312500,-1.535000,42.926000>}
box{<0,0,-0.127000><46.935000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.377500,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.445500,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.244300,-1.535000,3.048000>}
box{<0,0,-0.127000><46.798800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.445500,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.445500,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.705200,-1.535000,4.572000>}
box{<0,0,-0.127000><19.259700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.445500,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.445500,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.907900,-1.535000,41.148000>}
box{<0,0,-0.127000><2.462400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.445500,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.445500,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.450000,-1.535000,42.672000>}
box{<0,0,-0.127000><13.004500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.445500,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.513500,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.176300,-1.535000,3.302000>}
box{<0,0,-0.127000><46.662800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.513500,-1.535000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.513500,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.161900,-1.535000,41.402000>}
box{<0,0,-0.127000><2.648400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.513500,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.513600,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.959200,-1.535000,4.318000>}
box{<0,0,-0.127000><19.445600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.513600,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.513600,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.174600,-1.535000,42.418000>}
box{<0,0,-0.127000><12.661000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.513600,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,3.448800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,4.171100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<6.552900,-1.535000,4.171100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,3.556000>}
box{<0,0,-0.127000><46.584100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,3.810000>}
box{<0,0,-0.127000><46.584100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.213200,-1.535000,4.064000>}
box{<0,0,-0.127000><19.660300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,41.548800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,42.271100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<6.552900,-1.535000,42.271100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.415900,-1.535000,41.656000>}
box{<0,0,-0.127000><2.863000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.247200,-1.535000,41.910000>}
box{<0,0,-0.127000><7.694300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.552900,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.501200,-1.535000,42.164000>}
box{<0,0,-0.127000><7.948300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.552900,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,17.481800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,16.931100>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,67.496203,0> translate<6.832600,-1.535000,17.481800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,18.078100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,17.481800>}
box{<0,0,-0.127000><0.596300,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.832600,-1.535000,17.481800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,18.078100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,18.628800>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-67.496203,0> translate<6.832600,-1.535000,18.078100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,22.561800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,22.011100>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,67.496203,0> translate<6.832600,-1.535000,22.561800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,23.158100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,22.561800>}
box{<0,0,-0.127000><0.596300,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.832600,-1.535000,22.561800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.832600,-1.535000,23.158100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,23.708800>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-67.496203,0> translate<6.832600,-1.535000,23.158100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,16.931100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,16.509500>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,44.997030,0> translate<7.060700,-1.535000,16.931100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,18.628800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,19.050400>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.060700,-1.535000,18.628800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,22.011100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,21.589500>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,44.997030,0> translate<7.060700,-1.535000,22.011100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.060700,-1.535000,23.708800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,24.130400>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.060700,-1.535000,23.708800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.454100,-1.535000,11.700500>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,67.491456,0> translate<7.196200,-1.535000,12.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.996900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.323000>}
box{<0,0,-0.127000><0.673900,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.196200,-1.535000,12.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.196200,-1.535000,12.996900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.454100,-1.535000,13.619400>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,-67.491456,0> translate<7.196200,-1.535000,12.996900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,36.167200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<7.289800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,36.167200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.289800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,37.848300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.289800,-1.535000,37.492700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.454100,-1.535000,11.700500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.930500,-1.535000,11.224100>}
box{<0,0,-0.127000><0.673731,0.035000,0.127000> rotate<0,44.997030,0> translate<7.454100,-1.535000,11.700500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.454100,-1.535000,13.619400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,13.810700>}
box{<0,0,-0.127000><0.270539,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.454100,-1.535000,13.619400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,16.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,16.442000>}
box{<0,0,-0.127000><0.176516,0.035000,0.127000> rotate<0,22.481053,0> translate<7.482300,-1.535000,16.509500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,19.278500>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-22.497857,0> translate<7.482300,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,21.589500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,21.361400>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,22.497857,0> translate<7.482300,-1.535000,21.589500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.482300,-1.535000,24.130400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,24.358500>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-22.497857,0> translate<7.482300,-1.535000,24.130400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,16.442000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,13.810700>}
box{<0,0,-0.127000><2.631300,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.645400,-1.535000,13.810700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,39.617500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,37.848300>}
box{<0,0,-0.127000><1.769200,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.645400,-1.535000,37.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.645400,-1.535000,39.617500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.834900,-1.535000,40.075000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<7.645400,-1.535000,39.617500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.760300,-1.535000,7.536800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.782900,-1.535000,7.394100>}
box{<0,0,-0.127000><0.144479,0.035000,0.127000> rotate<0,80.995226,0> translate<7.760300,-1.535000,7.536800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.760300,-1.535000,7.536800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766300,-1.535000,7.536800>}
box{<0,0,-0.127000><1.006000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.760300,-1.535000,7.536800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.760300,-1.535000,7.783000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.782900,-1.535000,7.925800>}
box{<0,0,-0.127000><0.144577,0.035000,0.127000> rotate<0,-81.001425,0> translate<7.760300,-1.535000,7.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.760300,-1.535000,7.783000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766300,-1.535000,7.783000>}
box{<0,0,-0.127000><1.006000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.760300,-1.535000,7.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.782900,-1.535000,7.394100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.838100,-1.535000,7.224200>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,71.996425,0> translate<7.782900,-1.535000,7.394100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.782900,-1.535000,7.925800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.838100,-1.535000,8.095700>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,-71.996425,0> translate<7.782900,-1.535000,7.925800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.834900,-1.535000,40.075000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.184900,-1.535000,40.425000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.834900,-1.535000,40.075000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.838100,-1.535000,7.224200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.919200,-1.535000,7.065100>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,62.985980,0> translate<7.838100,-1.535000,7.224200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.838100,-1.535000,8.095700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.919200,-1.535000,8.254800>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,-62.985980,0> translate<7.838100,-1.535000,8.095700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.318600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,30.708600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<7.848600,-1.535000,31.318600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.673600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.318600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.848600,-1.535000,31.318600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.673600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,31.673600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.848600,-1.535000,31.673600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.826200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,31.826200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.848600,-1.535000,31.826200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,32.181300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,31.826200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.848600,-1.535000,31.826200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,32.181300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,32.791300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.848600,-1.535000,32.181300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.919200,-1.535000,7.065100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.024200,-1.535000,6.920600>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,53.992646,0> translate<7.919200,-1.535000,7.065100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.919200,-1.535000,8.254800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.024200,-1.535000,8.399300>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,-53.992646,0> translate<7.919200,-1.535000,8.254800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.930500,-1.535000,11.224100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.553000,-1.535000,10.966200>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,22.502604,0> translate<7.930500,-1.535000,11.224100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.024200,-1.535000,6.920600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.150600,-1.535000,6.794200>}
box{<0,0,-0.127000><0.178757,0.035000,0.127000> rotate<0,44.997030,0> translate<8.024200,-1.535000,6.920600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.024200,-1.535000,8.399300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.150600,-1.535000,8.525700>}
box{<0,0,-0.127000><0.178757,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.024200,-1.535000,8.399300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,19.278500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,19.278500>}
box{<0,0,-0.127000><1.713900,0.035000,0.127000> rotate<0,0.000000,0> translate<8.033000,-1.535000,19.278500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,21.361400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,21.361400>}
box{<0,0,-0.127000><1.713900,0.035000,0.127000> rotate<0,0.000000,0> translate<8.033000,-1.535000,21.361400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.033000,-1.535000,24.358500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,24.358500>}
box{<0,0,-0.127000><1.713900,0.035000,0.127000> rotate<0,0.000000,0> translate<8.033000,-1.535000,24.358500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.150600,-1.535000,6.794200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.295100,-1.535000,6.689200>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,36.001414,0> translate<8.150600,-1.535000,6.794200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.150600,-1.535000,8.525700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.295100,-1.535000,8.630700>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,-36.001414,0> translate<8.150600,-1.535000,8.525700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.184900,-1.535000,40.425000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.454900,-1.535000,41.695000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.184900,-1.535000,40.425000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.227200,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.295100,-1.535000,6.689200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.454200,-1.535000,6.608100>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,27.008080,0> translate<8.295100,-1.535000,6.689200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.295100,-1.535000,8.630700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.454200,-1.535000,8.711800>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,-27.008080,0> translate<8.295100,-1.535000,8.630700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.454200,-1.535000,6.608100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.624100,-1.535000,6.552900>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,17.997636,0> translate<8.454200,-1.535000,6.608100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.454200,-1.535000,8.711800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.624100,-1.535000,8.767000>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,-17.997636,0> translate<8.454200,-1.535000,8.711800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,30.708600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,30.708600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.458600,-1.535000,30.708600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.791300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.458600,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.553000,-1.535000,10.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.226900,-1.535000,10.966200>}
box{<0,0,-0.127000><0.673900,0.035000,0.127000> rotate<0,0.000000,0> translate<8.553000,-1.535000,10.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.624100,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,6.530300>}
box{<0,0,-0.127000><0.144479,0.035000,0.127000> rotate<0,8.998834,0> translate<8.624100,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.624100,-1.535000,8.767000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,8.789500>}
box{<0,0,-0.127000><0.144463,0.035000,0.127000> rotate<0,-8.959664,0> translate<8.624100,-1.535000,8.767000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766300,-1.535000,7.783000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766300,-1.535000,7.536800>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.766300,-1.535000,7.536800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,6.530300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.536300>}
box{<0,0,-0.127000><1.006000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.766800,-1.535000,7.536300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,6.604000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,6.858000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.112000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.366000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.536300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.536300>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,7.536300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.783600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,8.789500>}
box{<0,0,-0.127000><1.005900,0.035000,0.127000> rotate<0,90.000000,0> translate<8.766800,-1.535000,8.789500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.783600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.783600>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,7.783600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.874000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,8.128000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,8.382000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.766800,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,8.636000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.766800,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,31.826200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,31.673600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.813100,-1.535000,31.673600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,30.708600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.673100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.813600,-1.535000,31.673100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,30.734000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,30.988000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.242000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.496000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.673100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.673100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,31.673100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.826800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.791300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.813600,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,31.826800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.826800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,31.826800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.004000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.258000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.512000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.766000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,30.708600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,30.708600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966200,-1.535000,30.708600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.673100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,30.708600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.966200,-1.535000,30.708600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,31.826800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.966200,-1.535000,31.826800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,32.791300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966200,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,31.673600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,31.826200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<8.966800,-1.535000,31.826200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,31.673600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.673600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,31.673600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475700,-1.535000,31.750000>}
box{<0,0,-0.127000><10.508900,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,31.826200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.826200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,31.826200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,6.530300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.155800,-1.535000,6.552900>}
box{<0,0,-0.127000><0.144577,0.035000,0.127000> rotate<0,-8.992636,0> translate<9.013000,-1.535000,6.530300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.536300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,6.530300>}
box{<0,0,-0.127000><1.006000,0.035000,0.127000> rotate<0,-90.000000,0> translate<9.013000,-1.535000,6.530300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,8.789500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,7.783600>}
box{<0,0,-0.127000><1.005900,0.035000,0.127000> rotate<0,-90.000000,0> translate<9.013000,-1.535000,7.783600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013000,-1.535000,8.789500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.155800,-1.535000,8.767000>}
box{<0,0,-0.127000><0.144562,0.035000,0.127000> rotate<0,8.953491,0> translate<9.013000,-1.535000,8.789500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013600,-1.535000,7.536800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013600,-1.535000,7.783000>}
box{<0,0,-0.127000><0.246200,0.035000,0.127000> rotate<0,90.000000,0> translate<9.013600,-1.535000,7.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013600,-1.535000,7.536800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.019500,-1.535000,7.536800>}
box{<0,0,-0.127000><1.005900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.013600,-1.535000,7.536800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013600,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,7.620000>}
box{<0,0,-0.127000><49.203400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.013600,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.013600,-1.535000,7.783000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.019500,-1.535000,7.783000>}
box{<0,0,-0.127000><1.005900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.013600,-1.535000,7.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.155800,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.325700,-1.535000,6.608100>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,-17.997636,0> translate<9.155800,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.155800,-1.535000,8.767000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.325700,-1.535000,8.711800>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,17.997636,0> translate<9.155800,-1.535000,8.767000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.226900,-1.535000,10.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.849400,-1.535000,11.224100>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,-22.502604,0> translate<9.226900,-1.535000,10.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.313000,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,6.604000>}
box{<0,0,-0.127000><48.904000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.313000,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,30.708600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.318600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.321300,-1.535000,30.708600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,32.181300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<9.321300,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.325700,-1.535000,6.608100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.484800,-1.535000,6.689200>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,-27.008080,0> translate<9.325700,-1.535000,6.608100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.325700,-1.535000,8.711800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.484800,-1.535000,8.630700>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,27.008080,0> translate<9.325700,-1.535000,8.711800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.346600,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,32.766000>}
box{<0,0,-0.127000><19.952300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.346600,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.346700,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.734000>}
box{<0,0,-0.127000><9.931900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.346700,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.454900,-1.535000,41.695000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.912400,-1.535000,41.884500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<9.454900,-1.535000,41.695000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.474500,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.636000>}
box{<0,0,-0.127000><9.804100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.474500,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.484800,-1.535000,6.689200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.629300,-1.535000,6.794200>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,-36.001414,0> translate<9.484800,-1.535000,6.689200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.484800,-1.535000,8.630700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.629300,-1.535000,8.525700>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,36.001414,0> translate<9.484800,-1.535000,8.630700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,36.167200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.552700,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.600600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317700,-1.535000,32.512000>}
box{<0,0,-0.127000><19.717100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.600600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.600700,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.988000>}
box{<0,0,-0.127000><9.677900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.600700,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.628900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.306000>}
box{<0,0,-0.127000><19.111200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.628900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.629300,-1.535000,6.794200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.755700,-1.535000,6.920600>}
box{<0,0,-0.127000><0.178757,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.629300,-1.535000,6.794200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.629300,-1.535000,8.525700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.755700,-1.535000,8.399300>}
box{<0,0,-0.127000><0.178757,0.035000,0.127000> rotate<0,44.997030,0> translate<9.629300,-1.535000,8.525700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.693100,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,6.858000>}
box{<0,0,-0.127000><48.523900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.693100,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.733200,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.783300,-1.535000,11.176000>}
box{<0,0,-0.127000><5.050100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.733200,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,19.278500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,19.050400>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,22.497857,0> translate<9.746900,-1.535000,19.278500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,21.361400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,21.589500>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-22.497857,0> translate<9.746900,-1.535000,21.361400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.746900,-1.535000,24.358500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,24.130400>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,22.497857,0> translate<9.746900,-1.535000,24.358500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.755700,-1.535000,6.920600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.860700,-1.535000,7.065100>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,-53.992646,0> translate<9.755700,-1.535000,6.920600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.755700,-1.535000,8.399300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.860700,-1.535000,8.254800>}
box{<0,0,-0.127000><0.178620,0.035000,0.127000> rotate<0,53.992646,0> translate<9.755700,-1.535000,8.399300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.768300,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.355200,-1.535000,8.382000>}
box{<0,0,-0.127000><9.586900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.768300,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.849400,-1.535000,11.224100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.325800,-1.535000,11.700500>}
box{<0,0,-0.127000><0.673731,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.849400,-1.535000,11.224100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.854600,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.571700,-1.535000,32.258000>}
box{<0,0,-0.127000><19.717100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.854600,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.854700,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.281800,-1.535000,31.242000>}
box{<0,0,-0.127000><9.427100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.854700,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.860700,-1.535000,7.065100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.941800,-1.535000,7.224200>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,-62.985980,0> translate<9.860700,-1.535000,7.065100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.860700,-1.535000,8.254800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.941800,-1.535000,8.095700>}
box{<0,0,-0.127000><0.178578,0.035000,0.127000> rotate<0,62.985980,0> translate<9.860700,-1.535000,8.254800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.882900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.560000>}
box{<0,0,-0.127000><18.857200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.882900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.884600,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,7.112000>}
box{<0,0,-0.127000><48.332400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.884600,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.912400,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.407500,-1.535000,41.884500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.912400,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.925400,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.609200,-1.535000,8.128000>}
box{<0,0,-0.127000><9.683800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.925400,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.318600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.673600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.931300,-1.535000,31.673600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.340600,-1.535000,31.496000>}
box{<0,0,-0.127000><9.409300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.931300,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,31.826200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,32.181300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<9.931300,-1.535000,32.181300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.737000,-1.535000,32.004000>}
box{<0,0,-0.127000><9.805700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.931300,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.941800,-1.535000,7.224200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.997000,-1.535000,7.394100>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,-71.996425,0> translate<9.941800,-1.535000,7.224200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.941800,-1.535000,8.095700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.997000,-1.535000,7.925800>}
box{<0,0,-0.127000><0.178642,0.035000,0.127000> rotate<0,71.996425,0> translate<9.941800,-1.535000,8.095700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.987800,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,7.366000>}
box{<0,0,-0.127000><48.229200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.987800,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.997000,-1.535000,7.394100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.019500,-1.535000,7.536800>}
box{<0,0,-0.127000><0.144463,0.035000,0.127000> rotate<0,-81.034396,0> translate<9.997000,-1.535000,7.394100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.997000,-1.535000,7.925800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.019500,-1.535000,7.783000>}
box{<0,0,-0.127000><0.144562,0.035000,0.127000> rotate<0,81.040569,0> translate<9.997000,-1.535000,7.925800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.005200,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.863200,-1.535000,7.874000>}
box{<0,0,-0.127000><9.858000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.005200,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.055300,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.171300,-1.535000,11.430000>}
box{<0,0,-0.127000><40.116000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.055300,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,13.810700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,16.442000>}
box{<0,0,-0.127000><2.631300,0.035000,0.127000> rotate<0,90.000000,0> translate<10.134500,-1.535000,16.442000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,13.810700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.325800,-1.535000,13.619400>}
box{<0,0,-0.127000><0.270539,0.035000,0.127000> rotate<0,44.997030,0> translate<10.134500,-1.535000,13.810700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,13.970000>}
box{<0,0,-0.127000><8.585300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,14.224000>}
box{<0,0,-0.127000><8.585300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,14.478000>}
box{<0,0,-0.127000><8.585300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.819100,-1.535000,14.732000>}
box{<0,0,-0.127000><8.684600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.073100,-1.535000,14.986000>}
box{<0,0,-0.127000><8.938600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,15.240000>}
box{<0,0,-0.127000><8.940900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,15.494000>}
box{<0,0,-0.127000><8.940900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,15.748000>}
box{<0,0,-0.127000><8.940900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,16.002000>}
box{<0,0,-0.127000><8.940900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,16.256000>}
box{<0,0,-0.127000><8.940900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,16.442000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,16.509500>}
box{<0,0,-0.127000><0.176516,0.035000,0.127000> rotate<0,-22.481053,0> translate<10.134500,-1.535000,16.442000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,37.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,38.854400>}
box{<0,0,-0.127000><1.006100,0.035000,0.127000> rotate<0,90.000000,0> translate<10.134500,-1.535000,38.854400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,37.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,37.492700>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<10.134500,-1.535000,37.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,38.100000>}
box{<0,0,-0.127000><19.100900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,38.354000>}
box{<0,0,-0.127000><19.100900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.449700,-1.535000,38.608000>}
box{<0,0,-0.127000><9.315200,0.035000,0.127000> rotate<0,0.000000,0> translate<10.134500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.134500,-1.535000,38.854400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.675500,-1.535000,39.395400>}
box{<0,0,-0.127000><0.765090,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.134500,-1.535000,38.854400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.136800,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,37.846000>}
box{<0,0,-0.127000><19.098600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.136800,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.136900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.814000>}
box{<0,0,-0.127000><18.603200,0.035000,0.127000> rotate<0,0.000000,0> translate<10.136900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.142100,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.174500,-1.535000,38.862000>}
box{<0,0,-0.127000><9.032400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.142100,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.229200,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,13.716000>}
box{<0,0,-0.127000><8.490600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.229200,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,16.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.719200,-1.535000,16.931100>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.297600,-1.535000,16.509500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,19.050400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.719200,-1.535000,18.628800>}
box{<0,0,-0.127000><0.596232,0.035000,0.127000> rotate<0,44.997030,0> translate<10.297600,-1.535000,19.050400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,21.589500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.323400,-1.535000,21.615400>}
box{<0,0,-0.127000><0.036557,0.035000,0.127000> rotate<0,-45.107846,0> translate<10.297600,-1.535000,21.589500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.297600,-1.535000,24.130400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.323400,-1.535000,24.104500>}
box{<0,0,-0.127000><0.036557,0.035000,0.127000> rotate<0,45.107846,0> translate<10.297600,-1.535000,24.130400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.298000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327100,-1.535000,19.050000>}
box{<0,0,-0.127000><9.029100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.298000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.298000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.247000,-1.535000,21.590000>}
box{<0,0,-0.127000><3.949000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.298000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.298000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.130000>}
box{<0,0,-0.127000><3.697400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.298000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.298100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,16.510000>}
box{<0,0,-0.127000><8.777300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.298100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.309300,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.785800,-1.535000,11.684000>}
box{<0,0,-0.127000><38.476500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.309300,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.323400,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,21.615400>}
box{<0,0,-0.127000><3.898300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.323400,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.323400,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.104500>}
box{<0,0,-0.127000><3.672000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.323400,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.325800,-1.535000,11.700500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.323000>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,-67.491456,0> translate<10.325800,-1.535000,11.700500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.325800,-1.535000,13.619400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.996900>}
box{<0,0,-0.127000><0.673809,0.035000,0.127000> rotate<0,67.491456,0> translate<10.325800,-1.535000,13.619400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.390800,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,37.592000>}
box{<0,0,-0.127000><18.844600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.390800,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.390900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.807200,-1.535000,36.068000>}
box{<0,0,-0.127000><18.416300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.390900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.391100,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,13.462000>}
box{<0,0,-0.127000><8.328700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.391100,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.396100,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.501000,-1.535000,39.116000>}
box{<0,0,-0.127000><4.104900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.396100,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.407500,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,41.884500>}
box{<0,0,-0.127000><3.814200,0.035000,0.127000> rotate<0,0.000000,0> translate<10.407500,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.424100,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.531800,-1.535000,11.938000>}
box{<0,0,-0.127000><38.107700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.424100,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,36.167200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,37.492700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<10.490100,-1.535000,37.492700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.912500,-1.535000,36.322000>}
box{<0,0,-0.127000><18.422400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490100,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.035600,-1.535000,36.576000>}
box{<0,0,-0.127000><18.545500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,36.830000>}
box{<0,0,-0.127000><18.745300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490100,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,37.084000>}
box{<0,0,-0.127000><18.745300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490100,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490100,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,37.338000>}
box{<0,0,-0.127000><18.745300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490100,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.496300,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.819000,-1.535000,13.208000>}
box{<0,0,-0.127000><8.322700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.496300,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.529400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.277800,-1.535000,12.192000>}
box{<0,0,-0.127000><37.748400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.529400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.552000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.073100,-1.535000,18.796000>}
box{<0,0,-0.127000><8.521100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.552000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.552100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.073000,-1.535000,16.764000>}
box{<0,0,-0.127000><8.520900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.552100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.996900>}
box{<0,0,-0.127000><0.673900,0.035000,0.127000> rotate<0,90.000000,0> translate<10.583700,-1.535000,12.996900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581000,-1.535000,12.446000>}
box{<0,0,-0.127000><8.997300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.583700,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327000,-1.535000,12.700000>}
box{<0,0,-0.127000><8.743300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.583700,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.583700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.073000,-1.535000,12.954000>}
box{<0,0,-0.127000><8.489300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.583700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.650100,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.247000,-1.535000,39.370000>}
box{<0,0,-0.127000><3.596900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.650100,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.675500,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,39.395400>}
box{<0,0,-0.127000><3.546200,0.035000,0.127000> rotate<0,0.000000,0> translate<10.675500,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.719200,-1.535000,16.931100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,17.481800>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,-67.496203,0> translate<10.719200,-1.535000,16.931100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.719200,-1.535000,18.628800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,18.078100>}
box{<0,0,-0.127000><0.596071,0.035000,0.127000> rotate<0,67.496203,0> translate<10.719200,-1.535000,18.628800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.755100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.819000,-1.535000,17.018000>}
box{<0,0,-0.127000><8.063900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.755100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.755200,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.819100,-1.535000,18.542000>}
box{<0,0,-0.127000><8.063900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.755200,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.860400,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,17.272000>}
box{<0,0,-0.127000><7.859400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.860400,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.860400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,18.288000>}
box{<0,0,-0.127000><7.859400,0.035000,0.127000> rotate<0,0.000000,0> translate<10.860400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,17.481800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,18.078100>}
box{<0,0,-0.127000><0.596300,0.035000,0.127000> rotate<0,90.000000,0> translate<10.947300,-1.535000,18.078100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,17.526000>}
box{<0,0,-0.127000><7.772500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.947300,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,17.780000>}
box{<0,0,-0.127000><7.772500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.947300,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.947300,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,18.034000>}
box{<0,0,-0.127000><7.772500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.947300,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,26.921700>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,44.988973,0> translate<13.639800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,27.277200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.639800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.639800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.639800,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,26.921700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.995400,-1.535000,24.104500>}
box{<0,0,-0.127000><2.817200,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.995400,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,9.728600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.808600,-1.535000,9.118600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<14.198600,-1.535000,9.728600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.083600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,9.728600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.198600,-1.535000,9.728600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.083600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163100,-1.535000,10.083600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.198600,-1.535000,10.083600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.236200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163100,-1.535000,10.236200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.198600,-1.535000,10.236200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.591300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.236200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.198600,-1.535000,10.236200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.198600,-1.535000,10.591300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.808600,-1.535000,11.201300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.198600,-1.535000,10.591300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,21.259800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<14.221700,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,39.039800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<14.221700,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.221700,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,42.240100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<14.221700,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,21.259800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.577200,-1.535000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.577200,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,39.039800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.577200,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.577200,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,42.240100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.577200,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.808600,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.118600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.808600,-1.535000,9.118600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.808600,-1.535000,11.201300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,11.201300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.808600,-1.535000,11.201300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163100,-1.535000,10.236200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163100,-1.535000,10.083600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.163100,-1.535000,10.083600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.083100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<15.163600,-1.535000,10.083100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.144000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.398000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.652000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.906000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.083100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.083100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,10.083100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.236800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,11.201300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<15.163600,-1.535000,11.201300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.236800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.236800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,10.236800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.414000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.668000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.922000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.163600,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,11.176000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.163600,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.671300,-1.535000,9.118600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.316200,-1.535000,9.118600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.083100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,9.118600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.316200,-1.535000,9.118600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,11.201300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,10.236800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.316200,-1.535000,10.236800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316200,-1.535000,11.201300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.671300,-1.535000,11.201300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.316200,-1.535000,11.201300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316800,-1.535000,10.083600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316800,-1.535000,10.236200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<15.316800,-1.535000,10.236200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316800,-1.535000,10.083600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.083600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.316800,-1.535000,10.083600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,10.160000>}
box{<0,0,-0.127000><36.625700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.316800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.316800,-1.535000,10.236200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.236200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.316800,-1.535000,10.236200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.671300,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,9.728600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.671300,-1.535000,9.118600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.671300,-1.535000,11.201300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.591300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<15.671300,-1.535000,11.201300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.696600,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.540200,-1.535000,11.176000>}
box{<0,0,-0.127000><34.843600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.696600,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.696700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,9.144000>}
box{<0,0,-0.127000><3.581900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.696700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,21.615400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<15.902700,-1.535000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<15.902700,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,39.395400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<15.902700,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.902700,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,41.884500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<15.902700,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950600,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453600,-1.535000,10.922000>}
box{<0,0,-0.127000><34.503000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950600,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950700,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.355300,-1.535000,9.398000>}
box{<0,0,-0.127000><3.404600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950700,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.978800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581000,-1.535000,21.336000>}
box{<0,0,-0.127000><3.602200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.978800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.978800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.340500,-1.535000,29.464000>}
box{<0,0,-0.127000><3.361700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.978800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.978800,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.945600,-1.535000,39.116000>}
box{<0,0,-0.127000><2.966800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.978800,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.978800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.945700,-1.535000,42.164000>}
box{<0,0,-0.127000><2.966900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.978800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.204600,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.284100,-1.535000,10.668000>}
box{<0,0,-0.127000><34.079500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.204600,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.204700,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.609300,-1.535000,9.652000>}
box{<0,0,-0.127000><3.404600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.204700,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.232800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327000,-1.535000,21.590000>}
box{<0,0,-0.127000><3.094200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.232800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.232800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475500,-1.535000,29.210000>}
box{<0,0,-0.127000><3.242700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.232800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.232800,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.840500,-1.535000,39.370000>}
box{<0,0,-0.127000><2.607700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.232800,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.232800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.840600,-1.535000,41.910000>}
box{<0,0,-0.127000><2.607800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.232800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.301700,-1.535000,21.615400>}
box{<0,0,-0.127000><3.043500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.258200,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.830000,-1.535000,39.395400>}
box{<0,0,-0.127000><2.571800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.258200,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.258200,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.830000,-1.535000,41.884500>}
box{<0,0,-0.127000><2.571800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.258200,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,9.728600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.083600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.281300,-1.535000,10.083600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.863300,-1.535000,9.906000>}
box{<0,0,-0.127000><3.582000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.281300,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.236200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.591300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<16.281300,-1.535000,10.591300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.281300,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.191000,-1.535000,10.414000>}
box{<0,0,-0.127000><33.909700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.281300,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,26.921700>}
box{<0,0,-0.127000><2.817200,0.035000,0.127000> rotate<0,90.000000,0> translate<16.484500,-1.535000,26.921700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.301700,-1.535000,24.104500>}
box{<0,0,-0.127000><2.817200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327200,-1.535000,24.130000>}
box{<0,0,-0.127000><2.842700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581200,-1.535000,24.384000>}
box{<0,0,-0.127000><3.096700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323100,-1.535000,24.638000>}
box{<0,0,-0.127000><6.838600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.217900,-1.535000,24.892000>}
box{<0,0,-0.127000><6.733400,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.146000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.400000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.654000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.218000,-1.535000,25.908000>}
box{<0,0,-0.127000><6.733500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323200,-1.535000,26.162000>}
box{<0,0,-0.127000><6.838700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.492600,-1.535000,26.416000>}
box{<0,0,-0.127000><7.008100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,26.670000>}
box{<0,0,-0.127000><7.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.484500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.484500,-1.535000,26.921700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,27.277200>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-44.988973,0> translate<16.484500,-1.535000,26.921700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.486800,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.153000,-1.535000,26.924000>}
box{<0,0,-0.127000><7.666200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.486800,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.486800,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.736700,-1.535000,28.956000>}
box{<0,0,-0.127000><3.249900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.486800,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.740800,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.899000,-1.535000,27.178000>}
box{<0,0,-0.127000><7.158200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.740800,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.740800,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.899100,-1.535000,28.702000>}
box{<0,0,-0.127000><7.158300,0.035000,0.127000> rotate<0,0.000000,0> translate<16.740800,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<16.840100,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,27.432000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.840100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,27.686000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.840100,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,27.940000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.840100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,28.194000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.840100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.840100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,28.448000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.840100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,13.307200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,12.369800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<18.719800,-1.535000,13.307200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,14.632700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,13.307200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.719800,-1.535000,13.307200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,14.632700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,14.988300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.719800,-1.535000,14.632700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,17.117200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,16.761600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<18.719800,-1.535000,17.117200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,18.442700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,17.117200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.719800,-1.535000,17.117200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.719800,-1.535000,18.442700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,19.380100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.719800,-1.535000,18.442700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.830000,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.963400,-1.535000,39.073100>}
box{<0,0,-0.127000><0.348816,0.035000,0.127000> rotate<0,67.510876,0> translate<18.830000,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.830000,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.963400,-1.535000,42.206800>}
box{<0,0,-0.127000><0.348816,0.035000,0.127000> rotate<0,-67.510876,0> translate<18.830000,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.963400,-1.535000,39.073100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413500,-1.535000,38.623000>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<18.963400,-1.535000,39.073100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.963400,-1.535000,42.206800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413500,-1.535000,42.656900>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.963400,-1.535000,42.206800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,16.761600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.075400,-1.535000,14.988300>}
box{<0,0,-0.127000><1.773300,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.075400,-1.535000,14.988300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,7.848600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<19.278600,-1.535000,8.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.458600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,8.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,8.813600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,8.966200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,9.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,8.966200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,9.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.278600,-1.535000,9.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,29.737500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304200,-1.535000,29.575700>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,81.003844,0> translate<19.278600,-1.535000,29.737500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,29.737500>}
box{<0,0,-0.127000><0.666100,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,29.737500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,30.403600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,30.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,30.556200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,30.556200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,31.222400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,30.556200>}
box{<0,0,-0.127000><0.666200,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,30.556200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,31.222400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304200,-1.535000,31.384200>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-81.003844,0> translate<19.278600,-1.535000,31.222400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.301700,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,21.259800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<19.301700,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.301700,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,24.460100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<19.301700,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304200,-1.535000,29.575700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.354900,-1.535000,29.419800>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,71.980285,0> translate<19.304200,-1.535000,29.575700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304200,-1.535000,31.384200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.354900,-1.535000,31.540100>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-71.980285,0> translate<19.304200,-1.535000,31.384200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.354900,-1.535000,29.419800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.429300,-1.535000,29.273700>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,63.008816,0> translate<19.354900,-1.535000,29.419800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.354900,-1.535000,31.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.429300,-1.535000,31.686200>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-63.008816,0> translate<19.354900,-1.535000,31.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413500,-1.535000,38.623000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.001600,-1.535000,38.379400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<19.413500,-1.535000,38.623000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413500,-1.535000,42.656900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.001600,-1.535000,42.900500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<19.413500,-1.535000,42.656900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.429300,-1.535000,29.273700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.525600,-1.535000,29.141100>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,54.007619,0> translate<19.429300,-1.535000,29.273700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.429300,-1.535000,31.686200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.525600,-1.535000,31.818800>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-54.007619,0> translate<19.429300,-1.535000,31.686200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.525600,-1.535000,29.141100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.641500,-1.535000,29.025200>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,44.997030,0> translate<19.525600,-1.535000,29.141100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.525600,-1.535000,31.818800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.641500,-1.535000,31.934700>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.525600,-1.535000,31.818800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.641500,-1.535000,29.025200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.774100,-1.535000,28.928900>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,35.986441,0> translate<19.641500,-1.535000,29.025200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.641500,-1.535000,31.934700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.774100,-1.535000,32.031000>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-35.986441,0> translate<19.641500,-1.535000,31.934700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,12.369800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,12.369800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.657200,-1.535000,12.369800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,19.380100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.657200,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,21.259800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.657200,-1.535000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.657200,-1.535000,24.460100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,24.460100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.657200,-1.535000,24.460100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.774100,-1.535000,28.928900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920200,-1.535000,28.854500>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,26.985245,0> translate<19.774100,-1.535000,28.928900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.774100,-1.535000,32.031000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920200,-1.535000,32.105400>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-26.985245,0> translate<19.774100,-1.535000,32.031000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,7.848600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.888600,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.888600,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920200,-1.535000,28.854500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.076100,-1.535000,28.803800>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,18.013775,0> translate<19.920200,-1.535000,28.854500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920200,-1.535000,32.105400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.076100,-1.535000,32.156100>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-18.013775,0> translate<19.920200,-1.535000,32.105400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.001600,-1.535000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.638300,-1.535000,38.379400>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.001600,-1.535000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.001600,-1.535000,42.900500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.638300,-1.535000,42.900500>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.001600,-1.535000,42.900500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.076100,-1.535000,28.803800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.237900,-1.535000,28.778200>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,8.990217,0> translate<20.076100,-1.535000,28.803800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.076100,-1.535000,32.156100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.237900,-1.535000,32.181700>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-8.990217,0> translate<20.076100,-1.535000,32.156100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.237900,-1.535000,28.778200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,28.778200>}
box{<0,0,-0.127000><0.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.237900,-1.535000,28.778200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.237900,-1.535000,32.181700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,32.181700>}
box{<0,0,-0.127000><0.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.237900,-1.535000,32.181700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,8.813600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.243100,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,30.403600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.243100,-1.535000,30.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.813100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,8.813100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,7.874000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.128000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.382000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.636000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.813100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.813100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,8.813100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.966800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,8.966800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.966800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,8.966800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.144000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.398000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.652000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.906000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,28.778200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.403100>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,30.403100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,28.956000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,29.210000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,29.464000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,29.718000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,29.972000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.226000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.403100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.403100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,30.403100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,32.181700>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,32.181700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.556800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,30.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.734000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.988000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,31.242000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,31.496000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,31.750000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,32.004000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,7.848600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.813100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,7.848600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,8.966800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,8.966800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,9.931300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,28.778200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.402000,-1.535000,28.778200>}
box{<0,0,-0.127000><0.005800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,28.778200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.403100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,28.778200>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,28.778200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,32.181700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,30.556800>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,30.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,32.181700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.402000,-1.535000,32.181700>}
box{<0,0,-0.127000><0.005800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,32.181700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,8.966200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.396800,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.813600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293100,-1.535000,8.890000>}
box{<0,0,-0.127000><18.896300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.966200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,30.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,30.556200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.396800,-1.535000,30.556200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,30.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.403600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,30.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,30.480000>}
box{<0,0,-0.127000><24.078600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.556200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,30.556200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.402000,-1.535000,28.778200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.563800,-1.535000,28.803800>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-8.990217,0> translate<20.402000,-1.535000,28.778200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.402000,-1.535000,32.181700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.563800,-1.535000,32.156100>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,8.990217,0> translate<20.402000,-1.535000,32.181700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.563800,-1.535000,28.803800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.719700,-1.535000,28.854500>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-18.013775,0> translate<20.563800,-1.535000,28.803800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.563800,-1.535000,32.156100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.719700,-1.535000,32.105400>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,18.013775,0> translate<20.563800,-1.535000,32.156100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.638300,-1.535000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.226400,-1.535000,38.623000>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<20.638300,-1.535000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.638300,-1.535000,42.900500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.226400,-1.535000,42.656900>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<20.638300,-1.535000,42.900500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.719700,-1.535000,28.854500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.865800,-1.535000,28.928900>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-26.985245,0> translate<20.719700,-1.535000,28.854500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.719700,-1.535000,32.105400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.865800,-1.535000,32.031000>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,26.985245,0> translate<20.719700,-1.535000,32.105400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.458600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.751300,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,9.321300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<20.751300,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.776600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.913300,-1.535000,9.906000>}
box{<0,0,-0.127000><18.136700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.776600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.776700,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.913200,-1.535000,7.874000>}
box{<0,0,-0.127000><18.136500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.776700,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.865800,-1.535000,28.928900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.998400,-1.535000,29.025200>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-35.986441,0> translate<20.865800,-1.535000,28.928900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.865800,-1.535000,32.031000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.998400,-1.535000,31.934700>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,35.986441,0> translate<20.865800,-1.535000,32.031000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.903000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.825700,-1.535000,32.004000>}
box{<0,0,-0.127000><8.922700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.903000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.903100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.153100,-1.535000,28.956000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.903100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,12.369800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,13.307200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.982700,-1.535000,12.369800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338300,-1.535000,19.024500>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<20.982700,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338200,-1.535000,21.615400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<20.982700,-1.535000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.982700,-1.535000,24.460100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338200,-1.535000,24.104500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<20.982700,-1.535000,24.460100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.998400,-1.535000,29.025200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.114300,-1.535000,29.141100>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.998400,-1.535000,29.025200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.998400,-1.535000,31.934700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.114300,-1.535000,31.818800>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,44.997030,0> translate<20.998400,-1.535000,31.934700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.030600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.659300,-1.535000,9.652000>}
box{<0,0,-0.127000><17.628700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.030600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.030700,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.659200,-1.535000,8.128000>}
box{<0,0,-0.127000><17.628500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.030700,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.058800,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.492500,-1.535000,19.304000>}
box{<0,0,-0.127000><2.433700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.058800,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.058800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.492700,-1.535000,21.336000>}
box{<0,0,-0.127000><2.433900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.058800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.058800,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.492500,-1.535000,24.384000>}
box{<0,0,-0.127000><2.433700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.058800,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.058900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.631000,-1.535000,12.446000>}
box{<0,0,-0.127000><17.572100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.058900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.114300,-1.535000,29.141100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210600,-1.535000,29.273700>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-54.007619,0> translate<21.114300,-1.535000,29.141100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.114300,-1.535000,31.818800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210600,-1.535000,31.686200>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,54.007619,0> translate<21.114300,-1.535000,31.818800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.164300,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.407100,-1.535000,29.210000>}
box{<0,0,-0.127000><3.242800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.164300,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.164300,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.230000,-1.535000,31.750000>}
box{<0,0,-0.127000><24.065700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.164300,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.190000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.244500,-1.535000,42.672000>}
box{<0,0,-0.127000><32.054500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.190000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.190100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,38.608000>}
box{<0,0,-0.127000><8.045300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.190100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210600,-1.535000,29.273700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.285000,-1.535000,29.419800>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-63.008816,0> translate<21.210600,-1.535000,29.273700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210600,-1.535000,31.686200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.285000,-1.535000,31.540100>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,63.008816,0> translate<21.210600,-1.535000,31.686200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.226400,-1.535000,38.623000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.676500,-1.535000,39.073100>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.226400,-1.535000,38.623000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.226400,-1.535000,42.656900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.676500,-1.535000,42.206800>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<21.226400,-1.535000,42.656900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.284600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.405300,-1.535000,9.398000>}
box{<0,0,-0.127000><17.120700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.284600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.284700,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.405200,-1.535000,8.382000>}
box{<0,0,-0.127000><17.120500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.284700,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.285000,-1.535000,29.419800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.335700,-1.535000,29.575700>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-71.980285,0> translate<21.285000,-1.535000,29.419800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.285000,-1.535000,31.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.335700,-1.535000,31.384200>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,71.980285,0> translate<21.285000,-1.535000,31.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.299300,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.661100,-1.535000,29.464000>}
box{<0,0,-0.127000><3.361800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.299300,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.299400,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.975900,-1.535000,31.496000>}
box{<0,0,-0.127000><23.676500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.299400,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.312800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746500,-1.535000,19.050000>}
box{<0,0,-0.127000><2.433700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.312800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.312800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746500,-1.535000,21.590000>}
box{<0,0,-0.127000><2.433700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.312800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.312800,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,24.130000>}
box{<0,0,-0.127000><2.433800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.312800,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.312900,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.377000,-1.535000,12.700000>}
box{<0,0,-0.127000><17.064100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.312900,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.335700,-1.535000,29.575700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,29.737500>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-81.003844,0> translate<21.335700,-1.535000,29.575700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.335700,-1.535000,31.384200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,31.222400>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,81.003844,0> translate<21.335700,-1.535000,31.384200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338200,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.721200,-1.535000,21.615400>}
box{<0,0,-0.127000><2.383000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.338200,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338200,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.721200,-1.535000,24.104500>}
box{<0,0,-0.127000><2.383000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.338200,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.338300,-1.535000,19.024500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.772100,-1.535000,19.024500>}
box{<0,0,-0.127000><2.433800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.338300,-1.535000,19.024500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.358200,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,29.718000>}
box{<0,0,-0.127000><23.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.358200,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.358200,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.721900,-1.535000,31.242000>}
box{<0,0,-0.127000><23.363700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.358200,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.813600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.636000>}
box{<0,0,-0.127000><16.967300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,9.321300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,9.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,9.144000>}
box{<0,0,-0.127000><16.967300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,29.737500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.403600>}
box{<0,0,-0.127000><0.666100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,30.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,29.972000>}
box{<0,0,-0.127000><23.114100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,30.226000>}
box{<0,0,-0.127000><23.114100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,31.222400>}
box{<0,0,-0.127000><0.666200,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,31.222400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.478100,-1.535000,30.734000>}
box{<0,0,-0.127000><23.116800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.583400,-1.535000,30.988000>}
box{<0,0,-0.127000><23.222100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.465300,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.176400,-1.535000,42.418000>}
box{<0,0,-0.127000><31.711100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.465300,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.465400,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,38.862000>}
box{<0,0,-0.127000><7.770000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.465400,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,14.988300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,16.535400>}
box{<0,0,-0.127000><1.547100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.564500,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,14.988300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,14.632700>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<21.564500,-1.535000,14.988300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.377100,-1.535000,15.240000>}
box{<0,0,-0.127000><16.812600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.631100,-1.535000,15.494000>}
box{<0,0,-0.127000><17.066600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.388000,-1.535000,15.748000>}
box{<0,0,-0.127000><17.823500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,16.002000>}
box{<0,0,-0.127000><17.830900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.931000,-1.535000,16.256000>}
box{<0,0,-0.127000><4.366500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.677000,-1.535000,16.510000>}
box{<0,0,-0.127000><4.112500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.564500,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.651600,-1.535000,16.535400>}
box{<0,0,-0.127000><4.087100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.564500,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.566800,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.123100,-1.535000,14.986000>}
box{<0,0,-0.127000><16.556300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.566800,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.566900,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.123000,-1.535000,12.954000>}
box{<0,0,-0.127000><16.556100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.566900,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.676500,-1.535000,39.073100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.809900,-1.535000,39.395400>}
box{<0,0,-0.127000><0.348816,0.035000,0.127000> rotate<0,-67.510876,0> translate<21.676500,-1.535000,39.073100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.676500,-1.535000,42.206800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.809900,-1.535000,41.884500>}
box{<0,0,-0.127000><0.348816,0.035000,0.127000> rotate<0,67.510876,0> translate<21.676500,-1.535000,42.206800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.694200,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.661000,-1.535000,39.116000>}
box{<0,0,-0.127000><2.966800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.694200,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.694300,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.661100,-1.535000,42.164000>}
box{<0,0,-0.127000><2.966800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.694300,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.799300,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.407000,-1.535000,39.370000>}
box{<0,0,-0.127000><2.607700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.799300,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.799400,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.407100,-1.535000,41.910000>}
box{<0,0,-0.127000><2.607700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.799400,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.809900,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.381600,-1.535000,39.395400>}
box{<0,0,-0.127000><2.571700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.809900,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.809900,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.381600,-1.535000,41.884500>}
box{<0,0,-0.127000><2.571700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.809900,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.820800,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.869100,-1.535000,14.732000>}
box{<0,0,-0.127000><16.048300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.820800,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.820900,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.869000,-1.535000,13.208000>}
box{<0,0,-0.127000><16.048100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.820900,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,13.307200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,14.632700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<21.920100,-1.535000,14.632700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,13.462000>}
box{<0,0,-0.127000><15.849700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.920100,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,13.716000>}
box{<0,0,-0.127000><15.849700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.920100,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,13.970000>}
box{<0,0,-0.127000><15.849700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.920100,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,14.224000>}
box{<0,0,-0.127000><15.849700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.920100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920100,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,14.478000>}
box{<0,0,-0.127000><15.849700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.920100,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.001600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,19.413500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<23.139400,-1.535000,20.001600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.638300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.001600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.139400,-1.535000,20.001600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,20.638300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,21.226400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<23.139400,-1.535000,20.638300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,24.493500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<23.139400,-1.535000,25.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.718300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.081600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.139400,-1.535000,25.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.139400,-1.535000,25.718300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,26.306400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<23.139400,-1.535000,25.718300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,19.413500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.772100,-1.535000,19.024500>}
box{<0,0,-0.127000><0.550200,0.035000,0.127000> rotate<0,44.989667,0> translate<23.383000,-1.535000,19.413500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,21.226400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,21.589900>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,-44.989151,0> translate<23.383000,-1.535000,21.226400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,24.493500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,24.130000>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,44.989151,0> translate<23.383000,-1.535000,24.493500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.383000,-1.535000,26.306400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.833100,-1.535000,26.756500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.383000,-1.535000,26.306400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.721200,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,21.589900>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,45.109588,0> translate<23.721200,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.721200,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.746600,-1.535000,24.130000>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,-45.109588,0> translate<23.721200,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.921600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<23.799800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,27.277200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.799800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.799800,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.833100,-1.535000,26.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.890000>}
box{<0,0,-0.127000><0.348855,0.035000,0.127000> rotate<0,-22.498359,0> translate<23.833100,-1.535000,26.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.917500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.890000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.155400,-1.535000,26.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155400,-1.535000,26.917500>}
box{<0,0,-0.127000><0.004100,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.155400,-1.535000,26.917500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.381600,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,39.039800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<24.381600,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.381600,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,42.240100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.381600,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.737200,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,39.039800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.737200,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,42.240100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.737200,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<25.628600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,4.648600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.628600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.628600,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.628600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.156200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.628600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.628600,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.651600,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.007200,-1.535000,16.179800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<25.651600,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.007200,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.332700,-1.535000,16.179800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.007200,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<26.062700,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.418300,-1.535000,39.395400>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.062700,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.418300,-1.535000,41.884500>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<26.062700,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.138800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.821100,-1.535000,29.464000>}
box{<0,0,-0.127000><8.682300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.138800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.138800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.821100,-1.535000,42.164000>}
box{<0,0,-0.127000><8.682300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.138800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.138900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,39.116000>}
box{<0,0,-0.127000><3.096500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.138900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.238600,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.238600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.392800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.567100,-1.535000,29.210000>}
box{<0,0,-0.127000><8.174300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.392800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.392800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.567100,-1.535000,41.910000>}
box{<0,0,-0.127000><8.174300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.392800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.392900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,39.370000>}
box{<0,0,-0.127000><2.842500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.392900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.418300,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,39.395400>}
box{<0,0,-0.127000><2.817100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.418300,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.418300,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.232400,-1.535000,41.884500>}
box{<0,0,-0.127000><3.814100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.418300,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.593100,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.003100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.593600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.064000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.318000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.572000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.826000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.003100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.593600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.334000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.588000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.842000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.096000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.917500>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.644500,-1.535000,26.917500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.966800,-1.535000,26.756500>}
box{<0,0,-0.127000><0.348855,0.035000,0.127000> rotate<0,22.498359,0> translate<26.644500,-1.535000,26.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.917500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.921600>}
box{<0,0,-0.127000><0.004100,0.035000,0.127000> rotate<0,90.000000,0> translate<26.644500,-1.535000,26.921600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.644500,-1.535000,26.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,27.277200>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.644500,-1.535000,26.921600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.646800,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.313100,-1.535000,28.956000>}
box{<0,0,-0.127000><7.666300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.646800,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.646900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.313000,-1.535000,26.924000>}
box{<0,0,-0.127000><7.666100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.646900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,4.038600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.746200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.746200,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746200,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,5.156200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.746800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213100,-1.535000,5.080000>}
box{<0,0,-0.127000><7.466300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.900800,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.059100,-1.535000,28.702000>}
box{<0,0,-0.127000><7.158300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.900800,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.900900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.059000,-1.535000,27.178000>}
box{<0,0,-0.127000><7.158100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.900900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.966800,-1.535000,26.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,26.306400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<26.966800,-1.535000,26.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.000100,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,27.432000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,27.686000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000100,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,27.940000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,28.194000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,28.448000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,21.589900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.078700,-1.535000,21.564500>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<27.053300,-1.535000,21.589900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,21.589900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,21.953500>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.053300,-1.535000,21.589900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,23.766400>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,44.997030,0> translate<27.053300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,24.493500>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,-44.989151,0> translate<27.053300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.487100,-1.535000,24.130000>}
box{<0,0,-0.127000><2.433800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.053300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,26.670000>}
box{<0,0,-0.127000><7.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.053300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.053400,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.720000,-1.535000,21.590000>}
box{<0,0,-0.127000><1.666600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.053400,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.078700,-1.535000,21.564500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.694500,-1.535000,21.564500>}
box{<0,0,-0.127000><1.615800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.078700,-1.535000,21.564500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,4.648600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.101300,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<27.101300,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.126600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833300,-1.535000,6.096000>}
box{<0,0,-0.127000><6.706700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.126600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.126700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833200,-1.535000,4.064000>}
box{<0,0,-0.127000><6.706500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.126700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.307300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.233100,-1.535000,23.876000>}
box{<0,0,-0.127000><1.925800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.307300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.307300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.741100,-1.535000,24.384000>}
box{<0,0,-0.127000><2.433800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.307300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.307300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,26.416000>}
box{<0,0,-0.127000><7.008100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.307300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.307400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.974000,-1.535000,21.844000>}
box{<0,0,-0.127000><1.666600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.307400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.332700,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,17.117200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.332700,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.380600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.579300,-1.535000,5.842000>}
box{<0,0,-0.127000><6.198700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.380600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.380700,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.579200,-1.535000,4.318000>}
box{<0,0,-0.127000><6.198500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.380700,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.408900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.551000,-1.535000,16.256000>}
box{<0,0,-0.127000><6.142100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.408900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,21.953500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,22.541600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<27.416900,-1.535000,21.953500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,23.766400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,23.178300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<27.416900,-1.535000,23.766400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,24.493500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.081600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<27.416900,-1.535000,24.493500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.416900,-1.535000,26.306400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.718300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<27.416900,-1.535000,26.306400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.476700,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.979000,-1.535000,22.098000>}
box{<0,0,-0.127000><1.502300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.476700,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.476700,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,24.638000>}
box{<0,0,-0.127000><6.838700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.476700,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.476800,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.979100,-1.535000,23.622000>}
box{<0,0,-0.127000><1.502300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.476800,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.476800,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,26.162000>}
box{<0,0,-0.127000><6.838600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.476800,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.581900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,22.352000>}
box{<0,0,-0.127000><1.297900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.581900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.581900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,24.892000>}
box{<0,0,-0.127000><6.733500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.581900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.582000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,23.368000>}
box{<0,0,-0.127000><1.297800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.582000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.582000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,25.908000>}
box{<0,0,-0.127000><6.733400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.582000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.634600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.325300,-1.535000,5.588000>}
box{<0,0,-0.127000><5.690700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.634600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.634700,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.325200,-1.535000,4.572000>}
box{<0,0,-0.127000><5.690500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.634700,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.637300,-1.535000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,18.442700>}
box{<0,0,-0.127000><0.894844,0.035000,0.127000> rotate<0,44.992503,0> translate<27.637300,-1.535000,19.075400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.637300,-1.535000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,-1.535000,19.075400>}
box{<0,0,-0.127000><1.820200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.637300,-1.535000,19.075400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,22.541600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,23.178300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<27.660500,-1.535000,23.178300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,22.606000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,22.860000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,23.114000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.718300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<27.660500,-1.535000,25.718300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,25.146000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,25.400000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.660500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,25.654000>}
box{<0,0,-0.127000><6.654900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.660500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.662800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.297100,-1.535000,19.050000>}
box{<0,0,-0.127000><5.634300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.662800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.662900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.297000,-1.535000,16.510000>}
box{<0,0,-0.127000><5.634100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.662900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.711300,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,4.826000>}
box{<0,0,-0.127000><5.537300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.711300,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<27.711300,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.334000>}
box{<0,0,-0.127000><5.537300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.711300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.916800,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.043100,-1.535000,18.796000>}
box{<0,0,-0.127000><5.126300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.916800,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.916900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.043000,-1.535000,16.764000>}
box{<0,0,-0.127000><5.126100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.916900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170800,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.789100,-1.535000,18.542000>}
box{<0,0,-0.127000><4.618300,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170800,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.789000,-1.535000,17.018000>}
box{<0,0,-0.127000><4.618100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,17.117200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,18.442700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<28.270100,-1.535000,18.442700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,17.272000>}
box{<0,0,-0.127000><4.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,17.526000>}
box{<0,0,-0.127000><4.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,17.780000>}
box{<0,0,-0.127000><4.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,18.034000>}
box{<0,0,-0.127000><4.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,18.288000>}
box{<0,0,-0.127000><4.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.694500,-1.535000,21.564500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.103500,-1.535000,21.973500>}
box{<0,0,-0.127000><0.578413,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.694500,-1.535000,21.564500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.213800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.005000,-1.535000,34.574400>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,67.491580,0> translate<28.740100,-1.535000,35.213800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.906100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.213800>}
box{<0,0,-0.127000><0.692300,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.740100,-1.535000,35.213800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.740100,-1.535000,35.906100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.005000,-1.535000,36.545500>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,-67.491580,0> translate<28.740100,-1.535000,35.906100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,22.197200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.103500,-1.535000,21.973500>}
box{<0,0,-0.127000><0.316360,0.035000,0.127000> rotate<0,44.997030,0> translate<28.879800,-1.535000,22.197200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,23.522700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,22.197200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.879800,-1.535000,22.197200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.879800,-1.535000,23.522700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.817200,-1.535000,24.460100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.879800,-1.535000,23.522700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.005000,-1.535000,34.574400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.494400,-1.535000,34.085000>}
box{<0,0,-0.127000><0.692116,0.035000,0.127000> rotate<0,44.997030,0> translate<29.005000,-1.535000,34.574400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.005000,-1.535000,36.545500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,36.775800>}
box{<0,0,-0.127000><0.325764,0.035000,0.127000> rotate<0,-44.984594,0> translate<29.005000,-1.535000,36.545500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.235400,-1.535000,36.775800>}
box{<0,0,-0.127000><2.619600,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.235400,-1.535000,36.775800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,32.530800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.990800,-1.535000,31.838900>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,44.997030,0> translate<29.298900,-1.535000,32.530800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,32.943600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,32.530800>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.298900,-1.535000,32.530800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,32.943600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403100,-1.535000,32.943600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.298900,-1.535000,32.943600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,33.096200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403100,-1.535000,33.096200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.298900,-1.535000,33.096200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,33.509100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,33.096200>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.298900,-1.535000,33.096200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.298900,-1.535000,33.509100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.763400,-1.535000,33.973600>}
box{<0,0,-0.127000><0.656902,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.298900,-1.535000,33.509100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,-1.535000,19.075400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.915000,-1.535000,19.264900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<29.457500,-1.535000,19.075400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.494400,-1.535000,34.085000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.763400,-1.535000,33.973600>}
box{<0,0,-0.127000><0.291155,0.035000,0.127000> rotate<0,22.494252,0> translate<29.494400,-1.535000,34.085000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.817200,-1.535000,24.460100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.142700,-1.535000,24.460100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.817200,-1.535000,24.460100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.915000,-1.535000,19.264900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.265000,-1.535000,19.614900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.915000,-1.535000,19.264900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.954100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.551100,-1.535000,19.304000>}
box{<0,0,-0.127000><3.597000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.954100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.990800,-1.535000,31.838900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,31.838900>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,0.000000,0> translate<29.990800,-1.535000,31.838900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.208100,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.307900,-1.535000,19.558000>}
box{<0,0,-0.127000><4.099800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.208100,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.232400,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.727500,-1.535000,41.884500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<30.232400,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.265000,-1.535000,19.614900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.265000,-1.535000,19.615000>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<30.265000,-1.535000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.265000,-1.535000,19.615000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.184900,-1.535000,20.534900>}
box{<0,0,-0.127000><1.300935,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.265000,-1.535000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403100,-1.535000,33.096200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403100,-1.535000,32.943600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.403100,-1.535000,32.943600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,31.838900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.943100>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,90.000000,0> translate<30.403600,-1.535000,32.943100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.004000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.403600,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.258000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.403600,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.512000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.403600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.766000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.403600,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.403600,-1.535000,32.943100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.943100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.403600,-1.535000,32.943100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.462000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,19.812000>}
box{<0,0,-0.127000><3.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<30.462000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,31.838900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.969100,-1.535000,31.838900>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.556200,-1.535000,31.838900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,32.943100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556200,-1.535000,31.838900>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.556200,-1.535000,31.838900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556800,-1.535000,32.943600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556800,-1.535000,33.096200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<30.556800,-1.535000,33.096200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556800,-1.535000,32.943600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,32.943600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.556800,-1.535000,32.943600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.500000,-1.535000,33.020000>}
box{<0,0,-0.127000><15.943200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.556800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.556800,-1.535000,33.096200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,33.096200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.556800,-1.535000,33.096200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.716000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,20.066000>}
box{<0,0,-0.127000><3.599400,0.035000,0.127000> rotate<0,0.000000,0> translate<30.716000,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.727500,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.541600,-1.535000,41.884500>}
box{<0,0,-0.127000><3.814100,0.035000,0.127000> rotate<0,0.000000,0> translate<30.727500,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.969100,-1.535000,31.838900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,32.530800>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.969100,-1.535000,31.838900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.970000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,20.320000>}
box{<0,0,-0.127000><3.345400,0.035000,0.127000> rotate<0,0.000000,0> translate<30.970000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.134200,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.484000,-1.535000,32.004000>}
box{<0,0,-0.127000><14.349800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.134200,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.142700,-1.535000,24.460100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,23.522700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<31.142700,-1.535000,24.460100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.184900,-1.535000,20.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.185000,-1.535000,20.534900>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.184900,-1.535000,20.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.185000,-1.535000,20.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.535000,-1.535000,20.884900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.185000,-1.535000,20.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.196400,-1.535000,33.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.465500,-1.535000,34.085000>}
box{<0,0,-0.127000><0.291247,0.035000,0.127000> rotate<0,-22.486726,0> translate<31.196400,-1.535000,33.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.196400,-1.535000,33.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,33.509100>}
box{<0,0,-0.127000><0.656973,0.035000,0.127000> rotate<0,44.990864,0> translate<31.196400,-1.535000,33.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.218800,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,24.384000>}
box{<0,0,-0.127000><3.096600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.218800,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.224100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,20.574000>}
box{<0,0,-0.127000><3.091300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.224100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.347100,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.515900,-1.535000,34.036000>}
box{<0,0,-0.127000><16.168800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.347100,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.388100,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.261900,-1.535000,33.782000>}
box{<0,0,-0.127000><15.873800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.388100,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.388200,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.738000,-1.535000,32.258000>}
box{<0,0,-0.127000><14.349800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.388200,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.465500,-1.535000,34.085000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.954900,-1.535000,34.574400>}
box{<0,0,-0.127000><0.692116,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.465500,-1.535000,34.085000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.472800,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,24.130000>}
box{<0,0,-0.127000><2.842600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.472800,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.478100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,20.828000>}
box{<0,0,-0.127000><2.837300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.478100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.535000,-1.535000,20.884900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,21.342400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<31.535000,-1.535000,20.884900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.616600,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,21.082000>}
box{<0,0,-0.127000><2.698800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.616600,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.008000,-1.535000,33.528000>}
box{<0,0,-0.127000><15.365900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642200,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.992000,-1.535000,32.512000>}
box{<0,0,-0.127000><14.349800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642200,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,32.530800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,32.943600>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,90.000000,0> translate<31.661000,-1.535000,32.943600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.246000,-1.535000,32.766000>}
box{<0,0,-0.127000><14.585000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.661000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,33.096200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,33.509100>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,90.000000,0> translate<31.661000,-1.535000,33.509100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.661000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.754000,-1.535000,33.274000>}
box{<0,0,-0.127000><15.093000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.661000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.670500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.171500,-1.535000,34.290000>}
box{<0,0,-0.127000><18.501000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.670500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.721800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,21.336000>}
box{<0,0,-0.127000><2.593600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.721800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,21.342400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,21.841600>}
box{<0,0,-0.127000><0.499200,0.035000,0.127000> rotate<0,90.000000,0> translate<31.724500,-1.535000,21.841600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,21.590000>}
box{<0,0,-0.127000><2.590900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,21.841600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,22.197200>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.724500,-1.535000,21.841600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,36.775800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,39.395400>}
box{<0,0,-0.127000><2.619600,0.035000,0.127000> rotate<0,90.000000,0> translate<31.724500,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,36.775800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.954900,-1.535000,36.545500>}
box{<0,0,-0.127000><0.325764,0.035000,0.127000> rotate<0,44.984594,0> translate<31.724500,-1.535000,36.775800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,36.830000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,37.084000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,37.338000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,37.592000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,37.846000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,38.100000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,38.354000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,38.608000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,38.862000>}
box{<0,0,-0.127000><26.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.821000,-1.535000,39.116000>}
box{<0,0,-0.127000><3.096500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.567000,-1.535000,39.370000>}
box{<0,0,-0.127000><2.842500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724500,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.541600,-1.535000,39.395400>}
box{<0,0,-0.127000><2.817100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724500,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.726800,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.313100,-1.535000,23.876000>}
box{<0,0,-0.127000><2.586300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.726800,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.726900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.313000,-1.535000,21.844000>}
box{<0,0,-0.127000><2.586100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.726900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.924400,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.784500,-1.535000,36.576000>}
box{<0,0,-0.127000><18.860100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.924400,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.924500,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.540600,-1.535000,34.544000>}
box{<0,0,-0.127000><18.616100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.924500,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.954900,-1.535000,34.574400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.213800>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,-67.491580,0> translate<31.954900,-1.535000,34.574400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.954900,-1.535000,36.545500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.906100>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,67.491580,0> translate<31.954900,-1.535000,36.545500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.980800,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.059100,-1.535000,23.622000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.980800,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.980900,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.059000,-1.535000,22.098000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.980900,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.047500,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453500,-1.535000,34.798000>}
box{<0,0,-0.127000><18.406000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.047500,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.047500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453600,-1.535000,36.322000>}
box{<0,0,-0.127000><18.406100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.047500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,22.197200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,23.522700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.080100,-1.535000,23.522700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,22.352000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.080100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,22.606000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.080100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,22.860000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.080100,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,23.114000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.080100,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.080100,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,23.368000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.080100,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.152700,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.283900,-1.535000,35.052000>}
box{<0,0,-0.127000><18.131200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.152700,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.152800,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.284100,-1.535000,36.068000>}
box{<0,0,-0.127000><18.131300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.152800,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.213800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.906100>}
box{<0,0,-0.127000><0.692300,0.035000,0.127000> rotate<0,90.000000,0> translate<32.219800,-1.535000,35.906100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190900,-1.535000,35.306000>}
box{<0,0,-0.127000><17.971100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.219800,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,35.560000>}
box{<0,0,-0.127000><19.722700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.219800,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.219800,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.191000,-1.535000,35.814000>}
box{<0,0,-0.127000><17.971200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.219800,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,17.117200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.627200,-1.535000,16.179800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<32.689800,-1.535000,17.117200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,18.442700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,17.117200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.689800,-1.535000,17.117200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,-1.535000,18.442700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.627200,-1.535000,19.380100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.689800,-1.535000,18.442700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<33.248600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,4.648600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.248600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.248600,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213100,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.248600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.156200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.248600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.248600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.248600,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.627200,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.952700,-1.535000,16.179800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.627200,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.627200,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.130000,-1.535000,19.380100>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.627200,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.858600,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858600,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.858600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,22.197200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,21.841600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<33.959800,-1.535000,22.197200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,23.522700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,22.197200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.959800,-1.535000,22.197200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,23.522700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,23.878300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.959800,-1.535000,23.522700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,26.921600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<33.959800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,27.277200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.959800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.959800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.959800,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.130000,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,19.565500>}
box{<0,0,-0.127000><0.262195,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.130000,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213100,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.213100,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.003100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.213600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.064000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.318000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.572000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.826000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.003100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.213600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.334000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.588000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.842000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.213600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,6.096000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.213600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,21.841600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,19.565500>}
box{<0,0,-0.127000><2.276100,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.315400,-1.535000,19.565500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,26.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.315400,-1.535000,23.878300>}
box{<0,0,-0.127000><3.043300,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.315400,-1.535000,23.878300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.721300,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,4.038600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.366200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.366200,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.721300,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366200,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366800,-1.535000,5.156200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<34.366800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366800,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366800,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,5.080000>}
box{<0,0,-0.127000><10.006300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366800,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366800,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.541600,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,39.039800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<34.541600,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.541600,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,42.240100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.541600,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.721300,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,4.648600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.721300,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.721300,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<34.721300,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.746600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.993300,-1.535000,6.096000>}
box{<0,0,-0.127000><9.246700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.746600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.746700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.993200,-1.535000,4.064000>}
box{<0,0,-0.127000><9.246500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.746700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.897200,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,39.039800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.897200,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.897200,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,42.240100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.897200,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.952700,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.117200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.952700,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.739300,-1.535000,5.842000>}
box{<0,0,-0.127000><8.738700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.000600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000700,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.739200,-1.535000,4.318000>}
box{<0,0,-0.127000><8.738500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.000700,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.028900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,16.256000>}
box{<0,0,-0.127000><4.366500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.028900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.254600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.485300,-1.535000,5.588000>}
box{<0,0,-0.127000><8.230700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.254600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.254700,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.485200,-1.535000,4.572000>}
box{<0,0,-0.127000><8.230500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.254700,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.282900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,16.510000>}
box{<0,0,-0.127000><4.112500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.282900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.331300,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,4.826000>}
box{<0,0,-0.127000><8.077300,0.035000,0.127000> rotate<0,0.000000,0> translate<35.331300,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<35.331300,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.331300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.334000>}
box{<0,0,-0.127000><8.077300,0.035000,0.127000> rotate<0,0.000000,0> translate<35.331300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.536900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,16.764000>}
box{<0,0,-0.127000><3.858500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.536900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.790900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.018000>}
box{<0,0,-0.127000><3.604500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.790900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.117200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.620000>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,90.000000,0> translate<35.890100,-1.535000,17.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.272000>}
box{<0,0,-0.127000><3.505300,0.035000,0.127000> rotate<0,0.000000,0> translate<35.890100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.526000>}
box{<0,0,-0.127000><3.505300,0.035000,0.127000> rotate<0,0.000000,0> translate<35.890100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890100,-1.535000,17.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.615000,-1.535000,18.344900>}
box{<0,0,-0.127000><1.025163,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.890100,-1.535000,17.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.050100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.780000>}
box{<0,0,-0.127000><3.345300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.050100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<36.222700,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.578300,-1.535000,39.395400>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.222700,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.222700,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.578300,-1.535000,41.884500>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<36.222700,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.298800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.901100,-1.535000,29.464000>}
box{<0,0,-0.127000><3.602300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.298800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.298800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.901200,-1.535000,42.164000>}
box{<0,0,-0.127000><3.602400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.298800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.298900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.901000,-1.535000,39.116000>}
box{<0,0,-0.127000><3.602100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.298900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.304100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.034000>}
box{<0,0,-0.127000><3.091300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.304100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.552800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.647100,-1.535000,29.210000>}
box{<0,0,-0.127000><3.094300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.552800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.552800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.647200,-1.535000,41.910000>}
box{<0,0,-0.127000><3.094400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.552800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.552900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.647000,-1.535000,39.370000>}
box{<0,0,-0.127000><3.094100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.552900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.558100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.288000>}
box{<0,0,-0.127000><2.837300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.558100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.578300,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.621700,-1.535000,39.395400>}
box{<0,0,-0.127000><3.043400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.578300,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.578300,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.621700,-1.535000,41.884500>}
box{<0,0,-0.127000><3.043400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.578300,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.615000,-1.535000,18.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,18.802400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<36.615000,-1.535000,18.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.696600,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.542000>}
box{<0,0,-0.127000><2.698800,0.035000,0.127000> rotate<0,0.000000,0> translate<36.696600,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.801800,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.796000>}
box{<0,0,-0.127000><2.593600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.801800,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,18.802400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.297500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,90.000000,0> translate<36.804500,-1.535000,19.297500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986500,-1.535000,19.050000>}
box{<0,0,-0.127000><2.182000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.297500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,21.615400>}
box{<0,0,-0.127000><2.317900,0.035000,0.127000> rotate<0,90.000000,0> translate<36.804500,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.732500,-1.535000,19.304000>}
box{<0,0,-0.127000><1.928000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.563100,-1.535000,19.558000>}
box{<0,0,-0.127000><1.758600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.457900,-1.535000,19.812000>}
box{<0,0,-0.127000><1.653400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.066000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.320000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.574000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.458000,-1.535000,20.828000>}
box{<0,0,-0.127000><1.653500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.563200,-1.535000,21.082000>}
box{<0,0,-0.127000><1.758700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.732700,-1.535000,21.336000>}
box{<0,0,-0.127000><1.928200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986500,-1.535000,21.590000>}
box{<0,0,-0.127000><2.182000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.961100,-1.535000,21.615400>}
box{<0,0,-0.127000><2.156600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,26.921600>}
box{<0,0,-0.127000><2.817100,0.035000,0.127000> rotate<0,90.000000,0> translate<36.804500,-1.535000,26.921600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.961100,-1.535000,24.104500>}
box{<0,0,-0.127000><2.156600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,24.130000>}
box{<0,0,-0.127000><2.182100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.732500,-1.535000,24.384000>}
box{<0,0,-0.127000><1.928000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.563100,-1.535000,24.638000>}
box{<0,0,-0.127000><1.758600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.457900,-1.535000,24.892000>}
box{<0,0,-0.127000><1.653400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.146000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.400000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.654000>}
box{<0,0,-0.127000><1.574900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.458000,-1.535000,25.908000>}
box{<0,0,-0.127000><1.653500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.563200,-1.535000,26.162000>}
box{<0,0,-0.127000><1.758700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.732600,-1.535000,26.416000>}
box{<0,0,-0.127000><1.928100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,26.670000>}
box{<0,0,-0.127000><2.182100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.804500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.804500,-1.535000,26.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,27.277200>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.804500,-1.535000,26.921600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.806800,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.393100,-1.535000,28.956000>}
box{<0,0,-0.127000><2.586300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.806800,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.806900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.393000,-1.535000,26.924000>}
box{<0,0,-0.127000><2.586100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.806900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.060800,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.139100,-1.535000,28.702000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<37.060800,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.060900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.139000,-1.535000,27.178000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<37.060900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<37.160100,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,27.432000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.160100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,27.686000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.160100,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,27.940000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.160100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,28.194000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.160100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.160100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,28.448000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.160100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,13.307200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.707200,-1.535000,12.369800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<37.769800,-1.535000,13.307200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,14.632700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,13.307200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.769800,-1.535000,13.307200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.769800,-1.535000,14.632700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.707200,-1.535000,15.570100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.769800,-1.535000,14.632700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.938600,-1.535000,7.848600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<38.328600,-1.535000,8.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.458600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.328600,-1.535000,8.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293100,-1.535000,8.813600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.328600,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293100,-1.535000,8.966200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.328600,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,9.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,8.966200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.328600,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.328600,-1.535000,9.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.938600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.328600,-1.535000,9.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.001600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,19.413500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<38.379400,-1.535000,20.001600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.638300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.001600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.379400,-1.535000,20.001600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,20.638300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,21.226400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<38.379400,-1.535000,20.638300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,24.493500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<38.379400,-1.535000,25.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.718300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.081600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.379400,-1.535000,25.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.379400,-1.535000,25.718300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,26.306400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<38.379400,-1.535000,25.718300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,19.413500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.073100,-1.535000,18.963400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<38.623000,-1.535000,19.413500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,21.226400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,21.589900>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,-44.989151,0> translate<38.623000,-1.535000,21.226400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,24.493500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,24.130000>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,44.989151,0> translate<38.623000,-1.535000,24.493500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.623000,-1.535000,26.306400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.073100,-1.535000,26.756500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.623000,-1.535000,26.306400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.707200,-1.535000,12.369800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.032700,-1.535000,12.369800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.707200,-1.535000,12.369800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.707200,-1.535000,15.570100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.210100,-1.535000,15.570100>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.707200,-1.535000,15.570100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.938600,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,7.848600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.938600,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.938600,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.938600,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.961100,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,21.589900>}
box{<0,0,-0.127000><0.036062,0.035000,0.127000> rotate<0,44.997030,0> translate<38.961100,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.961100,-1.535000,24.104500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.986600,-1.535000,24.130000>}
box{<0,0,-0.127000><0.036062,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.961100,-1.535000,24.104500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.921700>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,44.988973,0> translate<39.039800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,27.277200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.039800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.039800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.039800,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.073100,-1.535000,18.963400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.829900>}
box{<0,0,-0.127000><0.348855,0.035000,0.127000> rotate<0,22.498359,0> translate<39.073100,-1.535000,18.963400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.073100,-1.535000,26.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.890000>}
box{<0,0,-0.127000><0.348855,0.035000,0.127000> rotate<0,-22.498359,0> translate<39.073100,-1.535000,26.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.210100,-1.535000,15.570100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,15.755500>}
box{<0,0,-0.127000><0.262124,0.035000,0.127000> rotate<0,-45.012485,0> translate<39.210100,-1.535000,15.570100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293100,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293100,-1.535000,8.813600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.293100,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.813100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<39.293600,-1.535000,8.813100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,7.874000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.128000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.382000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.636000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.813100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.813100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,8.813100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.966800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.931300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<39.293600,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,8.966800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.966800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,8.966800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.144000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.398000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.652000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.293600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.906000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.293600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.532400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,15.755500>}
box{<0,0,-0.127000><1.776900,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.395400,-1.535000,15.755500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.027500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,17.532400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.395400,-1.535000,17.532400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.829900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,18.027500>}
box{<0,0,-0.127000><0.802400,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.395400,-1.535000,18.027500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.917500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.890000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.395400,-1.535000,26.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.921700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395400,-1.535000,26.917500>}
box{<0,0,-0.127000><0.004200,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.395400,-1.535000,26.917500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.801300,-1.535000,7.848600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<39.446200,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.813100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,7.848600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.446200,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,8.966800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.446200,-1.535000,8.966800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446200,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.801300,-1.535000,9.931300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<39.446200,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446800,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446800,-1.535000,8.966200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<39.446800,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446800,-1.535000,8.813600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.813600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.446800,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446800,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,8.890000>}
box{<0,0,-0.127000><18.770200,0.035000,0.127000> rotate<0,0.000000,0> translate<39.446800,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.446800,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.966200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.446800,-1.535000,8.966200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.621700,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,39.039800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<39.621700,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.621700,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,42.240100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<39.621700,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.801300,-1.535000,7.848600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.458600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.801300,-1.535000,7.848600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.801300,-1.535000,9.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,9.321300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<39.801300,-1.535000,9.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.826600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190900,-1.535000,9.906000>}
box{<0,0,-0.127000><10.364300,0.035000,0.127000> rotate<0,0.000000,0> translate<39.826600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.826700,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,7.874000>}
box{<0,0,-0.127000><18.390300,0.035000,0.127000> rotate<0,0.000000,0> translate<39.826700,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,29.540100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.977200,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,39.039800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.977200,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.977200,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,42.240100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.977200,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.032700,-1.535000,12.369800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.307200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.032700,-1.535000,12.369800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.080600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.283900,-1.535000,9.652000>}
box{<0,0,-0.127000><10.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.080600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.080700,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,8.128000>}
box{<0,0,-0.127000><18.136300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.080700,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.108900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.023800,-1.535000,12.446000>}
box{<0,0,-0.127000><7.914900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.108900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.334600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453500,-1.535000,9.398000>}
box{<0,0,-0.127000><10.118900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.334600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.334700,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,8.382000>}
box{<0,0,-0.127000><17.882300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.334700,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.362900,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.769800,-1.535000,12.700000>}
box{<0,0,-0.127000><7.406900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.362900,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.813600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.411300,-1.535000,8.813600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,8.636000>}
box{<0,0,-0.127000><17.805700,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,9.321300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<40.411300,-1.535000,9.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.784200,-1.535000,9.144000>}
box{<0,0,-0.127000><10.372900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.616900,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.515800,-1.535000,12.954000>}
box{<0,0,-0.127000><6.898900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.616900,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.870900,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.261800,-1.535000,13.208000>}
box{<0,0,-0.127000><6.390900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.870900,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.307200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.810100>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,90.000000,0> translate<40.970100,-1.535000,13.810100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.123200,-1.535000,13.462000>}
box{<0,0,-0.127000><6.153100,0.035000,0.127000> rotate<0,0.000000,0> translate<40.970100,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.018000,-1.535000,13.716000>}
box{<0,0,-0.127000><6.047900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.970100,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970100,-1.535000,13.810100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.695000,-1.535000,14.534900>}
box{<0,0,-0.127000><1.025093,0.035000,0.127000> rotate<0,-44.993078,0> translate<40.970100,-1.535000,13.810100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.130000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,13.970000>}
box{<0,0,-0.127000><5.885400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.130000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,29.540100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<41.302700,-1.535000,29.540100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.658200,-1.535000,39.395400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<41.302700,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.302700,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.658200,-1.535000,41.884500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<41.302700,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.378800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,29.464000>}
box{<0,0,-0.127000><3.096600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.378800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.378800,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.981000,-1.535000,39.116000>}
box{<0,0,-0.127000><3.602200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.378800,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.378800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.981200,-1.535000,42.164000>}
box{<0,0,-0.127000><3.602400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.378800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.384000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.224000>}
box{<0,0,-0.127000><5.631400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.384000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.632800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,29.210000>}
box{<0,0,-0.127000><2.842600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.632800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.632800,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.727000,-1.535000,39.370000>}
box{<0,0,-0.127000><3.094200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.632800,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.632800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.727200,-1.535000,41.910000>}
box{<0,0,-0.127000><3.094400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.632800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.638000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.478000>}
box{<0,0,-0.127000><5.377400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.638000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.658200,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.701700,-1.535000,39.395400>}
box{<0,0,-0.127000><3.043500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.658200,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.658200,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.701700,-1.535000,41.884500>}
box{<0,0,-0.127000><3.043500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.658200,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.695000,-1.535000,14.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,14.992400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<41.695000,-1.535000,14.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.776600,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.732000>}
box{<0,0,-0.127000><5.238800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.776600,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.881800,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.986000>}
box{<0,0,-0.127000><5.133600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.881800,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,14.992400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,15.487500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,90.000000,0> translate<41.884500,-1.535000,15.487500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,15.240000>}
box{<0,0,-0.127000><5.130900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,15.487500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,16.535400>}
box{<0,0,-0.127000><1.047900,0.035000,0.127000> rotate<0,90.000000,0> translate<41.884500,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,15.494000>}
box{<0,0,-0.127000><5.130900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,15.748000>}
box{<0,0,-0.127000><5.130900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,16.002000>}
box{<0,0,-0.127000><5.130900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.711000,-1.535000,16.256000>}
box{<0,0,-0.127000><1.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.457000,-1.535000,16.510000>}
box{<0,0,-0.127000><1.572500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.431700,-1.535000,16.535400>}
box{<0,0,-0.127000><1.547200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.884500,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.917500>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,90.000000,0> translate<41.884500,-1.535000,26.917500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.206800,-1.535000,26.756500>}
box{<0,0,-0.127000><0.348855,0.035000,0.127000> rotate<0,22.498359,0> translate<41.884500,-1.535000,26.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.917500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.921700>}
box{<0,0,-0.127000><0.004200,0.035000,0.127000> rotate<0,90.000000,0> translate<41.884500,-1.535000,26.921700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.884500,-1.535000,26.921700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,27.277200>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-44.988973,0> translate<41.884500,-1.535000,26.921700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.886800,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.473000,-1.535000,26.924000>}
box{<0,0,-0.127000><2.586200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.886800,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.886800,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.473100,-1.535000,28.956000>}
box{<0,0,-0.127000><2.586300,0.035000,0.127000> rotate<0,0.000000,0> translate<41.886800,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.140800,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.219000,-1.535000,27.178000>}
box{<0,0,-0.127000><2.078200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.140800,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.140800,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.219100,-1.535000,28.702000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<42.140800,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.206800,-1.535000,26.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.318700,-1.535000,26.644500>}
box{<0,0,-0.127000><0.158321,0.035000,0.127000> rotate<0,45.022618,0> translate<42.206800,-1.535000,26.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<42.240100,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,27.432000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.240100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,27.686000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.240100,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,27.940000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.240100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,28.194000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.240100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.240100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,28.448000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.240100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.267800,-1.535000,19.024500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,19.413500>}
box{<0,0,-0.127000><0.550200,0.035000,0.127000> rotate<0,-44.989667,0> translate<42.267800,-1.535000,19.024500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.267800,-1.535000,19.024500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.431700,-1.535000,19.024500>}
box{<0,0,-0.127000><1.163900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.267800,-1.535000,19.024500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.457200,-1.535000,19.050000>}
box{<0,0,-0.127000><1.163900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.293300,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,21.589900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,21.226400>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,44.989151,0> translate<42.293300,-1.535000,21.589900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,21.589900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,21.953500>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.293300,-1.535000,21.589900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.318700,-1.535000,24.155400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.293300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,23.766400>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,44.997030,0> translate<42.293300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.499800,-1.535000,24.130000>}
box{<0,0,-0.127000><4.206500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.293300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.727000,-1.535000,26.670000>}
box{<0,0,-0.127000><2.433700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.293300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.293400,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,21.590000>}
box{<0,0,-0.127000><15.923600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.293400,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.318700,-1.535000,24.155400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.474400,-1.535000,24.155400>}
box{<0,0,-0.127000><4.155700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.318700,-1.535000,24.155400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.318700,-1.535000,26.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.752600,-1.535000,26.644500>}
box{<0,0,-0.127000><2.433900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.318700,-1.535000,26.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.547300,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.711200,-1.535000,19.304000>}
box{<0,0,-0.127000><1.163900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.547300,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.547300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,21.336000>}
box{<0,0,-0.127000><15.669700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.547300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.547300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.876000>}
box{<0,0,-0.127000><4.112500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.547300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.547400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,21.844000>}
box{<0,0,-0.127000><15.669600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.547400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,19.413500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.001600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<42.656900,-1.535000,19.413500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,21.226400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.638300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<42.656900,-1.535000,21.226400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,21.953500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,22.541600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<42.656900,-1.535000,21.953500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.656900,-1.535000,23.766400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,23.178300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<42.656900,-1.535000,23.766400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.716700,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,19.558000>}
box{<0,0,-0.127000><3.943100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.716700,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.716700,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,22.098000>}
box{<0,0,-0.127000><15.500300,0.035000,0.127000> rotate<0,0.000000,0> translate<42.716700,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.716800,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,21.082000>}
box{<0,0,-0.127000><15.500200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.716800,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.716800,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.622000>}
box{<0,0,-0.127000><3.943000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.716800,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.821900,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.759100,-1.535000,19.812000>}
box{<0,0,-0.127000><3.937200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.821900,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.821900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,22.352000>}
box{<0,0,-0.127000><15.395100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.821900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.822000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,20.828000>}
box{<0,0,-0.127000><15.395000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.822000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.822000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.759000,-1.535000,23.368000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.822000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.001600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.638300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<42.900500,-1.535000,20.638300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.013100,-1.535000,20.066000>}
box{<0,0,-0.127000><4.112600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.267100,-1.535000,20.320000>}
box{<0,0,-0.127000><4.366600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.521100,-1.535000,20.574000>}
box{<0,0,-0.127000><4.620600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,22.541600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,23.178300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<42.900500,-1.535000,23.178300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.521000,-1.535000,22.606000>}
box{<0,0,-0.127000><4.620500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.267000,-1.535000,22.860000>}
box{<0,0,-0.127000><4.366500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900500,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.013000,-1.535000,23.114000>}
box{<0,0,-0.127000><4.112500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.900500,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.018600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<43.408600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,4.648600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.408600,-1.535000,4.648600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<43.408600,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<43.408600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.156200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.408600,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,5.511300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.018600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.408600,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.431700,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.787200,-1.535000,16.179800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<43.431700,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.431700,-1.535000,19.024500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.787200,-1.535000,19.380100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<43.431700,-1.535000,19.024500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.787200,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.112700,-1.535000,16.179800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<43.787200,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.787200,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.112700,-1.535000,19.380100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<43.787200,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.018600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.018600,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.018600,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.018600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.752600,-1.535000,26.644500>}
box{<0,0,-0.127000><0.894844,0.035000,0.127000> rotate<0,44.992503,0> translate<44.119800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,27.277200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.119800,-1.535000,27.277200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.119800,-1.535000,28.602700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,28.958300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.119800,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,5.003600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.373100,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.003100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<44.373600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.064000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.318000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.572000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.826000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.003100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,5.003100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,6.121300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<44.373600,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.156800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.334000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.588000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.842000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,6.096000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,30.727500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,28.958300>}
box{<0,0,-0.127000><1.769200,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.475400,-1.535000,28.958300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.475400,-1.535000,30.727500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.664900,-1.535000,31.185000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<44.475400,-1.535000,30.727500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881300,-1.535000,4.038600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.003100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,4.038600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.526200,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,5.156800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.526200,-1.535000,5.156800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881300,-1.535000,6.121300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526200,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,5.156200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.526800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,5.003600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.445900,-1.535000,5.080000>}
box{<0,0,-0.127000><8.919100,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.156200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,5.156200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.664900,-1.535000,31.185000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.014900,-1.535000,31.535000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.664900,-1.535000,31.185000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.701700,-1.535000,39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.057200,-1.535000,39.039800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<44.701700,-1.535000,39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.701700,-1.535000,41.884500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.057200,-1.535000,42.240100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<44.701700,-1.535000,41.884500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881300,-1.535000,4.038600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,4.648600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.881300,-1.535000,4.038600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881300,-1.535000,6.121300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<44.881300,-1.535000,6.121300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.906600,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.353600,-1.535000,6.096000>}
box{<0,0,-0.127000><9.447000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.906600,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.906700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,4.064000>}
box{<0,0,-0.127000><8.230300,0.035000,0.127000> rotate<0,0.000000,0> translate<44.906700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.014900,-1.535000,31.535000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.015000,-1.535000,31.535000>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.014900,-1.535000,31.535000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.015000,-1.535000,31.535000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,33.724900>}
box{<0,0,-0.127000><3.096986,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.015000,-1.535000,31.535000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.057200,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.382700,-1.535000,39.039800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.057200,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.057200,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.382700,-1.535000,42.240100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.057200,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.112700,-1.535000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,17.117200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.112700,-1.535000,16.179800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.112700,-1.535000,19.380100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,18.442700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<45.112700,-1.535000,19.380100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.160600,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.032800,-1.535000,5.842000>}
box{<0,0,-0.127000><8.872200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.160600,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.160700,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.176400,-1.535000,4.318000>}
box{<0,0,-0.127000><8.015700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.160700,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.188800,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,19.304000>}
box{<0,0,-0.127000><1.471000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.188800,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.188900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,16.256000>}
box{<0,0,-0.127000><1.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.188900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.414600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.778800,-1.535000,5.588000>}
box{<0,0,-0.127000><8.364200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.414600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.414700,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.244500,-1.535000,4.572000>}
box{<0,0,-0.127000><7.829800,0.035000,0.127000> rotate<0,0.000000,0> translate<45.414700,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.442800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,19.050000>}
box{<0,0,-0.127000><1.217000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.442800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.442900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,16.510000>}
box{<0,0,-0.127000><1.572500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.442900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,4.648600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.003600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.491300,-1.535000,5.003600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.312500,-1.535000,4.826000>}
box{<0,0,-0.127000><7.821200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.491300,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.156200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.511300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<45.491300,-1.535000,5.511300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.491300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.592600,-1.535000,5.334000>}
box{<0,0,-0.127000><8.101300,0.035000,0.127000> rotate<0,0.000000,0> translate<45.491300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.696800,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,18.796000>}
box{<0,0,-0.127000><0.963000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.696800,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.696900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,16.764000>}
box{<0,0,-0.127000><1.318500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.696900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.950800,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,18.542000>}
box{<0,0,-0.127000><0.709000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.950800,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.950900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,17.018000>}
box{<0,0,-0.127000><1.064500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.950900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,17.117200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,18.442700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<46.050100,-1.535000,18.442700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,17.272000>}
box{<0,0,-0.127000><0.965300,0.035000,0.127000> rotate<0,0.000000,0> translate<46.050100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,17.526000>}
box{<0,0,-0.127000><0.965300,0.035000,0.127000> rotate<0,0.000000,0> translate<46.050100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,17.780000>}
box{<0,0,-0.127000><0.965300,0.035000,0.127000> rotate<0,0.000000,0> translate<46.050100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.013000,-1.535000,18.034000>}
box{<0,0,-0.127000><0.962900,0.035000,0.127000> rotate<0,0.000000,0> translate<46.050100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.050100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.759000,-1.535000,18.288000>}
box{<0,0,-0.127000><0.708900,0.035000,0.127000> rotate<0,0.000000,0> translate<46.050100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.382700,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,39.977200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.382700,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.382700,-1.535000,42.240100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,41.302700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<46.382700,-1.535000,42.240100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.458800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,42.164000>}
box{<0,0,-0.127000><6.678200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.458800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.458900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,39.116000>}
box{<0,0,-0.127000><11.758100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.458900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.474400,-1.535000,24.155400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.970100>}
box{<0,0,-0.127000><0.262124,0.035000,0.127000> rotate<0,44.981575,0> translate<46.474400,-1.535000,24.155400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,18.387200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,18.031600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<46.659800,-1.535000,18.387200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,19.712700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,18.387200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.659800,-1.535000,18.387200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,19.712700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.597200,-1.535000,20.650100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.659800,-1.535000,19.712700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.597200,-1.535000,22.529800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<46.659800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.970100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.659800,-1.535000,23.467200>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.659800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.687300,-1.535000,26.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.742400,-1.535000,26.644500>}
box{<0,0,-0.127000><0.055100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.687300,-1.535000,26.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.687300,-1.535000,26.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,27.277200>}
box{<0,0,-0.127000><0.894844,0.035000,0.127000> rotate<0,-44.992503,0> translate<46.687300,-1.535000,26.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.712800,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,26.670000>}
box{<0,0,-0.127000><11.504200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.712800,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.712800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,41.910000>}
box{<0,0,-0.127000><6.424200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.712800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.712900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.793300,-1.535000,39.370000>}
box{<0,0,-0.127000><8.080400,0.035000,0.127000> rotate<0,0.000000,0> translate<46.712900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.742400,-1.535000,26.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.237500,-1.535000,26.644500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.742400,-1.535000,26.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,28.958300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,29.964500>}
box{<0,0,-0.127000><1.006200,0.035000,0.127000> rotate<0,90.000000,0> translate<46.964500,-1.535000,29.964500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,28.958300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,28.602700>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<46.964500,-1.535000,28.958300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,29.210000>}
box{<0,0,-0.127000><11.252500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.964500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,29.464000>}
box{<0,0,-0.127000><11.252500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.964500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,29.718000>}
box{<0,0,-0.127000><11.252500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.964500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.964500,-1.535000,29.964500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.775400,-1.535000,31.775400>}
box{<0,0,-0.127000><2.560999,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.964500,-1.535000,29.964500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.966800,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,26.924000>}
box{<0,0,-0.127000><11.250200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.966800,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.966800,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,28.956000>}
box{<0,0,-0.127000><11.250200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.966800,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.966800,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,41.656000>}
box{<0,0,-0.127000><6.170200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.966800,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.966900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.353300,-1.535000,39.624000>}
box{<0,0,-0.127000><7.386400,0.035000,0.127000> rotate<0,0.000000,0> translate<46.966900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.972000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,29.972000>}
box{<0,0,-0.127000><11.245000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.972000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,13.722400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,13.264900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,67.495834,0> translate<47.015400,-1.535000,13.722400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.217500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,13.722400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.015400,-1.535000,13.722400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,18.031600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.015400,-1.535000,14.217500>}
box{<0,0,-0.127000><3.814100,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.015400,-1.535000,14.217500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,13.264900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.474900,-1.535000,11.994900>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<47.204900,-1.535000,13.264900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,33.725000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,33.724900>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.204900,-1.535000,33.724900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.204900,-1.535000,33.725000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.554900,-1.535000,34.075000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.204900,-1.535000,33.725000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.220800,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,27.178000>}
box{<0,0,-0.127000><10.996200,0.035000,0.127000> rotate<0,0.000000,0> translate<47.220800,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.220800,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,28.702000>}
box{<0,0,-0.127000><10.996200,0.035000,0.127000> rotate<0,0.000000,0> translate<47.220800,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.220800,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.176300,-1.535000,41.402000>}
box{<0,0,-0.127000><5.955500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.220800,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.220900,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.032700,-1.535000,39.878000>}
box{<0,0,-0.127000><6.811800,0.035000,0.127000> rotate<0,0.000000,0> translate<47.220900,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.226000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,30.226000>}
box{<0,0,-0.127000><10.991000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.226000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.237500,-1.535000,26.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.695000,-1.535000,26.455000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<47.237500,-1.535000,26.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,27.277200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,28.602700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<47.320100,-1.535000,28.602700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,27.432000>}
box{<0,0,-0.127000><10.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,27.686000>}
box{<0,0,-0.127000><10.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,27.940000>}
box{<0,0,-0.127000><10.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,28.194000>}
box{<0,0,-0.127000><10.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,28.448000>}
box{<0,0,-0.127000><10.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,39.977200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,41.302700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<47.320100,-1.535000,41.302700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.778700,-1.535000,40.132000>}
box{<0,0,-0.127000><6.458600,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.592400,-1.535000,40.386000>}
box{<0,0,-0.127000><6.272300,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.445800,-1.535000,40.640000>}
box{<0,0,-0.127000><6.125700,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.312400,-1.535000,40.894000>}
box{<0,0,-0.127000><5.992300,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.320100,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.244300,-1.535000,41.148000>}
box{<0,0,-0.127000><5.924200,0.035000,0.127000> rotate<0,0.000000,0> translate<47.320100,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.480000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,30.480000>}
box{<0,0,-0.127000><10.737000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.480000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.554900,-1.535000,34.075000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.012400,-1.535000,34.264500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<47.554900,-1.535000,34.075000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.597200,-1.535000,20.650100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,20.650100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.597200,-1.535000,20.650100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.597200,-1.535000,22.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,22.529800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.597200,-1.535000,22.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.695000,-1.535000,26.455000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.419800,-1.535000,25.730100>}
box{<0,0,-0.127000><1.025093,0.035000,0.127000> rotate<0,45.000982,0> translate<47.695000,-1.535000,26.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.734000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,26.416000>}
box{<0,0,-0.127000><10.483000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.734000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.734000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,30.734000>}
box{<0,0,-0.127000><10.483000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.734000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.988000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,26.162000>}
box{<0,0,-0.127000><10.229000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.988000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.988000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,30.988000>}
box{<0,0,-0.127000><10.229000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.988000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.012400,-1.535000,34.264500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,34.264500>}
box{<0,0,-0.127000><2.133600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.012400,-1.535000,34.264500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.242000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,25.908000>}
box{<0,0,-0.127000><9.975000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.242000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.242000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,31.242000>}
box{<0,0,-0.127000><9.975000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.242000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.419800,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,25.730100>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.419800,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.474900,-1.535000,11.994900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.824900,-1.535000,11.644900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,44.997030,0> translate<48.474900,-1.535000,11.994900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.496000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.540200,-1.535000,31.496000>}
box{<0,0,-0.127000><2.044200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.496000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.750000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.171300,-1.535000,31.750000>}
box{<0,0,-0.127000><1.421300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.750000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.775400,-1.535000,31.775400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,31.775400>}
box{<0,0,-0.127000><1.370600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.775400,-1.535000,31.775400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.824900,-1.535000,11.644900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.282400,-1.535000,11.455400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<48.824900,-1.535000,11.644900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,20.650100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,19.712700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<48.922700,-1.535000,20.650100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,22.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,23.467200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.922700,-1.535000,22.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.922700,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,24.792700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<48.922700,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.998800,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,20.574000>}
box{<0,0,-0.127000><9.218200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.998800,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.998800,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,25.654000>}
box{<0,0,-0.127000><9.218200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.998800,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.998900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,22.606000>}
box{<0,0,-0.127000><9.218100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.998900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.252800,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,20.320000>}
box{<0,0,-0.127000><8.964200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.252800,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.252800,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,25.400000>}
box{<0,0,-0.127000><8.964200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.252800,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.252900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,22.860000>}
box{<0,0,-0.127000><8.964100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.252900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.282400,-1.535000,11.455400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,11.455400>}
box{<0,0,-0.127000><0.863600,0.035000,0.127000> rotate<0,0.000000,0> translate<49.282400,-1.535000,11.455400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,14.485500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,18.031600>}
box{<0,0,-0.127000><3.546100,0.035000,0.127000> rotate<0,90.000000,0> translate<49.504500,-1.535000,18.031600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,14.485500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.045500,-1.535000,13.944500>}
box{<0,0,-0.127000><0.765090,0.035000,0.127000> rotate<0,44.997030,0> translate<49.504500,-1.535000,14.485500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,14.732000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,14.986000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,15.240000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,15.494000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,15.748000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,16.002000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,16.256000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,16.510000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,16.764000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,17.018000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,17.272000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,17.526000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,17.780000>}
box{<0,0,-0.127000><8.712500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.504500,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504500,-1.535000,18.031600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,18.387200>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.504500,-1.535000,18.031600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.506800,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,20.066000>}
box{<0,0,-0.127000><8.710200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.506800,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.506800,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,25.146000>}
box{<0,0,-0.127000><8.710200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.506800,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.506900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,18.034000>}
box{<0,0,-0.127000><8.710100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.506900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.506900,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,23.114000>}
box{<0,0,-0.127000><8.710100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.506900,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.512000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,14.478000>}
box{<0,0,-0.127000><8.705000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.512000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760800,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,19.812000>}
box{<0,0,-0.127000><8.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.760800,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760800,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,24.892000>}
box{<0,0,-0.127000><8.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.760800,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,18.288000>}
box{<0,0,-0.127000><8.456100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.760900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,23.368000>}
box{<0,0,-0.127000><8.456100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.760900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.766000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.540500,-1.535000,14.224000>}
box{<0,0,-0.127000><0.774500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.766000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,18.387200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,19.712700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<49.860100,-1.535000,19.712700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,18.542000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,18.796000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,19.050000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,19.304000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,19.558000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,24.792700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<49.860100,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,23.622000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,23.876000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,24.130000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,24.384000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.860100,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,24.638000>}
box{<0,0,-0.127000><8.356900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.860100,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.020000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.171500,-1.535000,13.970000>}
box{<0,0,-0.127000><0.151500,0.035000,0.127000> rotate<0,0.000000,0> translate<50.020000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.045500,-1.535000,13.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,13.944500>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,0.000000,0> translate<50.045500,-1.535000,13.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,11.455400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,11.257300>}
box{<0,0,-0.127000><0.280085,0.035000,0.127000> rotate<0,45.011494,0> translate<50.146000,-1.535000,11.455400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,13.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,14.142600>}
box{<0,0,-0.127000><0.280085,0.035000,0.127000> rotate<0,-45.011494,0> translate<50.146000,-1.535000,13.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,31.775400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,31.577300>}
box{<0,0,-0.127000><0.280085,0.035000,0.127000> rotate<0,45.011494,0> translate<50.146000,-1.535000,31.775400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.146000,-1.535000,34.264500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,34.462600>}
box{<0,0,-0.127000><0.280085,0.035000,0.127000> rotate<0,-45.011494,0> translate<50.146000,-1.535000,34.264500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,9.892300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<50.170800,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,10.033000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.170800,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,10.427600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<50.170800,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,10.286800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.170800,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,35.292300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<50.170800,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,35.433000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.170800,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,35.686800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,35.827600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<50.170800,-1.535000,35.686800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.170800,-1.535000,35.686800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,35.686800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.170800,-1.535000,35.686800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,9.892300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,9.721200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<50.193100,-1.535000,9.892300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,10.427600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,10.598700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<50.193100,-1.535000,10.427600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,35.292300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,35.121200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<50.193100,-1.535000,35.292300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.193100,-1.535000,35.827600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,35.998700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<50.193100,-1.535000,35.827600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,9.721200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,9.560900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<50.248700,-1.535000,9.721200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,10.598700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,10.759000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<50.248700,-1.535000,10.598700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,35.121200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,34.960900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<50.248700,-1.535000,35.121200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.248700,-1.535000,35.998700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,36.159000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<50.248700,-1.535000,35.998700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,9.560900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,9.415400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<50.330400,-1.535000,9.560900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,10.759000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,10.904500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<50.330400,-1.535000,10.759000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,34.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,34.815400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<50.330400,-1.535000,34.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.330400,-1.535000,36.159000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,36.304500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<50.330400,-1.535000,36.159000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,11.257300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.681500,-1.535000,11.117500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<50.344000,-1.535000,11.257300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,14.142600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.969400,-1.535000,14.401700>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<50.344000,-1.535000,14.142600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,31.577300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.969400,-1.535000,31.318200>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<50.344000,-1.535000,31.577300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.344000,-1.535000,34.462600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.681500,-1.535000,34.602400>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<50.344000,-1.535000,34.462600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,9.415400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,9.288100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<50.436100,-1.535000,9.415400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,10.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,11.031800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.436100,-1.535000,10.904500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,34.815400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,34.688100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<50.436100,-1.535000,34.815400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.436100,-1.535000,36.304500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,36.431800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.436100,-1.535000,36.304500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,9.288100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.708900,-1.535000,9.182400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<50.563400,-1.535000,9.288100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,11.031800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.681500,-1.535000,11.117500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<50.563400,-1.535000,11.031800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,34.688100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.681500,-1.535000,34.602400>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<50.563400,-1.535000,34.688100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.563400,-1.535000,36.431800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.708900,-1.535000,36.537500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<50.563400,-1.535000,36.431800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.708900,-1.535000,9.182400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.869200,-1.535000,9.100700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<50.708900,-1.535000,9.182400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.708900,-1.535000,36.537500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.869200,-1.535000,36.619200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<50.708900,-1.535000,36.537500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.869200,-1.535000,9.100700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.040300,-1.535000,9.045100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<50.869200,-1.535000,9.100700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.869200,-1.535000,36.619200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.040300,-1.535000,36.674800>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<50.869200,-1.535000,36.619200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.969400,-1.535000,14.401700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.170500,-1.535000,14.401700>}
box{<0,0,-0.127000><2.201100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.969400,-1.535000,14.401700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.969400,-1.535000,31.318200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.170500,-1.535000,31.318200>}
box{<0,0,-0.127000><2.201100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.969400,-1.535000,31.318200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.040300,-1.535000,9.045100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.218000,-1.535000,9.017000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<51.040300,-1.535000,9.045100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.040300,-1.535000,36.674800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.218000,-1.535000,36.702900>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<51.040300,-1.535000,36.674800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.218000,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.017000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.218000,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.218000,-1.535000,36.702900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,36.702900>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.218000,-1.535000,36.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,10.033000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.942500,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,35.686800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942500,-1.535000,35.433000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.942500,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,10.032500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<51.943000,-1.535000,10.032500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.144000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.398000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.652000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.906000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,10.032500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,10.032500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,10.032500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,35.687400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,36.702900>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<51.943000,-1.535000,36.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,35.687400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,35.687400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,35.687400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,35.814000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,36.068000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,36.322000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,36.576000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.943000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921900,-1.535000,9.017000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<52.196800,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,10.032500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,9.017000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.196800,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,36.702900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,35.687400>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.196800,-1.535000,35.687400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196800,-1.535000,36.702900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921900,-1.535000,36.702900>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<52.196800,-1.535000,36.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,10.286800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<52.197400,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,10.033000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,10.160000>}
box{<0,0,-0.127000><6.019600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,10.286800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,35.686800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<52.197400,-1.535000,35.686800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,35.433000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,35.560000>}
box{<0,0,-0.127000><6.019600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.197400,-1.535000,35.686800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,35.686800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.197400,-1.535000,35.686800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921900,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.099600,-1.535000,9.045100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<52.921900,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921900,-1.535000,36.702900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.099600,-1.535000,36.674800>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<52.921900,-1.535000,36.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.099600,-1.535000,9.045100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.270700,-1.535000,9.100700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<53.099600,-1.535000,9.045100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.099600,-1.535000,36.674800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.270700,-1.535000,36.619200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<53.099600,-1.535000,36.674800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,3.448800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,2.751200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<53.137000,-1.535000,3.448800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,4.171100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,3.448800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<53.137000,-1.535000,3.448800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,4.171100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,4.868700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<53.137000,-1.535000,4.171100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,41.548800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,40.851200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<53.137000,-1.535000,41.548800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,42.271100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,41.548800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<53.137000,-1.535000,41.548800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.137000,-1.535000,42.271100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,42.968700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<53.137000,-1.535000,42.271100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.170500,-1.535000,14.401700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,14.142600>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<53.170500,-1.535000,14.401700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.170500,-1.535000,31.318200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,31.577300>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<53.170500,-1.535000,31.318200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.270700,-1.535000,9.100700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.431000,-1.535000,9.182400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<53.270700,-1.535000,9.100700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.270700,-1.535000,36.619200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.431000,-1.535000,36.537500>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<53.270700,-1.535000,36.619200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,2.751200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,2.125700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<53.323900,-1.535000,2.751200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<53.323900,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,40.851200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,40.225700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<53.323900,-1.535000,40.851200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.323900,-1.535000,42.968700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,43.594200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<53.323900,-1.535000,42.968700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.355500,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,36.576000>}
box{<0,0,-0.127000><4.861500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.355500,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.355600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,9.144000>}
box{<0,0,-0.127000><4.861400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.355600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.431000,-1.535000,9.182400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,9.288100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<53.431000,-1.535000,9.182400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.431000,-1.535000,36.537500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,36.431800>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<53.431000,-1.535000,36.537500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.458400,-1.535000,11.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,11.031800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<53.458400,-1.535000,11.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.458400,-1.535000,11.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,11.257300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<53.458400,-1.535000,11.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.458400,-1.535000,34.602400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,34.688100>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<53.458400,-1.535000,34.602400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.458400,-1.535000,34.602400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,34.462600>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<53.458400,-1.535000,34.602400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,9.288100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,9.415400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.576500,-1.535000,9.288100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,11.031800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,10.904500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<53.576500,-1.535000,11.031800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,34.688100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,34.815400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.576500,-1.535000,34.688100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.576500,-1.535000,36.431800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,36.304500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<53.576500,-1.535000,36.431800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.599400,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,34.544000>}
box{<0,0,-0.127000><4.617600,0.035000,0.127000> rotate<0,0.000000,0> translate<53.599400,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.599500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,14.224000>}
box{<0,0,-0.127000><4.617500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.599500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.599600,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,11.176000>}
box{<0,0,-0.127000><4.617400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.599600,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.599600,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,31.496000>}
box{<0,0,-0.127000><4.617400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.599600,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,2.125700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,1.615000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<53.685000,-1.535000,2.125700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.685000,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,40.225700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,39.715000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<53.685000,-1.535000,40.225700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.685000,-1.535000,43.594200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,44.104900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.685000,-1.535000,43.594200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.686300,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,10.922000>}
box{<0,0,-0.127000><4.530700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.686300,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.686300,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,36.322000>}
box{<0,0,-0.127000><4.530700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.686300,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.686400,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,9.398000>}
box{<0,0,-0.127000><4.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<53.686400,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.686400,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,34.798000>}
box{<0,0,-0.127000><4.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<53.686400,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,9.415400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,9.560900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<53.703800,-1.535000,9.415400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,10.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,10.759000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<53.703800,-1.535000,10.904500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,34.815400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,34.960900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<53.703800,-1.535000,34.815400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.703800,-1.535000,36.304500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,36.159000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<53.703800,-1.535000,36.304500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,11.257300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,11.736000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.795900,-1.535000,11.257300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,14.142600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,13.663900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<53.795900,-1.535000,14.142600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,31.577300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,32.056000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.795900,-1.535000,31.577300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.795900,-1.535000,34.462600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,33.983900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<53.795900,-1.535000,34.462600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,9.560900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,9.721200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<53.809500,-1.535000,9.560900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,10.759000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,10.598700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<53.809500,-1.535000,10.759000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,34.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,35.121200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<53.809500,-1.535000,34.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.809500,-1.535000,36.159000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,35.998700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<53.809500,-1.535000,36.159000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.855900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,9.652000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.855900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.855900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,10.668000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.855900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.855900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,35.052000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.855900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.855900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,36.068000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.855900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,9.721200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,9.892300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<53.891200,-1.535000,9.721200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,10.598700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,10.427600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<53.891200,-1.535000,10.598700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,35.121200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,35.292300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<53.891200,-1.535000,35.121200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.891200,-1.535000,35.998700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,35.827600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<53.891200,-1.535000,35.998700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,9.892300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,10.033000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<53.946800,-1.535000,9.892300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,10.427600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,10.286800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<53.946800,-1.535000,10.427600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,35.292300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,35.433000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<53.946800,-1.535000,35.292300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.946800,-1.535000,35.827600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.969000,-1.535000,35.686800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<53.946800,-1.535000,35.827600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.948900,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,9.906000>}
box{<0,0,-0.127000><4.268100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.948900,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.948900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,35.306000>}
box{<0,0,-0.127000><4.268100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.948900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.949000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,10.414000>}
box{<0,0,-0.127000><4.268000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.949000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.949000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,35.814000>}
box{<0,0,-0.127000><4.268000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.949000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.968500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,13.970000>}
box{<0,0,-0.127000><4.248500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.968500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.968500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,34.290000>}
box{<0,0,-0.127000><4.248500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.968500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.968600,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,11.430000>}
box{<0,0,-0.127000><4.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.968600,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.968600,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,31.750000>}
box{<0,0,-0.127000><4.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.968600,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,1.615000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,1.253900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<54.195700,-1.535000,1.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<54.195700,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,39.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,39.353900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<54.195700,-1.535000,39.715000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.195700,-1.535000,44.104900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,44.466000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<54.195700,-1.535000,44.104900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.222500,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,13.716000>}
box{<0,0,-0.127000><3.994500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.222500,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.222500,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,34.036000>}
box{<0,0,-0.127000><3.994500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.222500,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.222600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,11.684000>}
box{<0,0,-0.127000><3.994400,0.035000,0.127000> rotate<0,0.000000,0> translate<54.222600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.222600,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,32.004000>}
box{<0,0,-0.127000><3.994400,0.035000,0.127000> rotate<0,0.000000,0> translate<54.222600,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,11.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,12.361400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<54.274600,-1.535000,11.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,13.663900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,13.038500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<54.274600,-1.535000,13.663900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,32.056000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,32.681400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<54.274600,-1.535000,32.056000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.274600,-1.535000,33.983900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,33.358500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<54.274600,-1.535000,33.983900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.358200,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,11.938000>}
box{<0,0,-0.127000><3.858800,0.035000,0.127000> rotate<0,0.000000,0> translate<54.358200,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.358200,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,32.258000>}
box{<0,0,-0.127000><3.858800,0.035000,0.127000> rotate<0,0.000000,0> translate<54.358200,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.358300,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,13.462000>}
box{<0,0,-0.127000><3.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<54.358300,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.358300,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,33.782000>}
box{<0,0,-0.127000><3.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<54.358300,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.463500,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,12.192000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.463500,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.463500,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,13.208000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.463500,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.463500,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,32.512000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.463500,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.463500,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,33.528000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.463500,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,12.361400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,13.038500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<54.533700,-1.535000,13.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,12.446000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,12.700000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,12.954000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,32.681400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,33.358500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<54.533700,-1.535000,33.358500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,32.766000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,33.020000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.533700,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,33.274000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.533700,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,1.253900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.235900,-1.535000,1.142900>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,14.983731,0> translate<54.821200,-1.535000,1.253900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.518800,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<54.821200,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,39.353900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.518800,-1.535000,39.167000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<54.821200,-1.535000,39.353900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.821200,-1.535000,44.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.198600,-1.535000,44.567000>}
box{<0,0,-0.127000><0.390681,0.035000,0.127000> rotate<0,-14.981442,0> translate<54.821200,-1.535000,44.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.518800,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.241100,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<55.518800,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.518800,-1.535000,39.167000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.241100,-1.535000,39.167000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<55.518800,-1.535000,39.167000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.241100,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.938700,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<56.241100,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.241100,-1.535000,39.167000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.938700,-1.535000,39.353900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<56.241100,-1.535000,39.167000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.938700,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.564200,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<56.938700,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.938700,-1.535000,39.353900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.564200,-1.535000,39.715000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<56.938700,-1.535000,39.353900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.966500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,6.350000>}
box{<0,0,-0.127000><1.250500,0.035000,0.127000> rotate<0,0.000000,0> translate<56.966500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.966500,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.250500,0.035000,0.127000> rotate<0,0.000000,0> translate<56.966500,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.406400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,6.096000>}
box{<0,0,-0.127000><0.810600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.406400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.406500,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,39.624000>}
box{<0,0,-0.127000><0.810500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.406500,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.564200,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.074900,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<57.564200,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.564200,-1.535000,39.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.074900,-1.535000,40.225700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.564200,-1.535000,39.715000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.727100,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,5.842000>}
box{<0,0,-0.127000><0.489900,0.035000,0.127000> rotate<0,0.000000,0> translate<57.727100,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.727200,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,39.878000>}
box{<0,0,-0.127000><0.489800,0.035000,0.127000> rotate<0,0.000000,0> translate<57.727200,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.981100,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,5.588000>}
box{<0,0,-0.127000><0.235900,0.035000,0.127000> rotate<0,0.000000,0> translate<57.981100,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.981200,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,40.132000>}
box{<0,0,-0.127000><0.235800,0.035000,0.127000> rotate<0,0.000000,0> translate<57.981200,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.074900,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,5.247800>}
box{<0,0,-0.127000><0.284439,0.035000,0.127000> rotate<0,60.023794,0> translate<58.074900,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.074900,-1.535000,40.225700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,40.472100>}
box{<0,0,-0.127000><0.284439,0.035000,0.127000> rotate<0,-60.023794,0> translate<58.074900,-1.535000,40.225700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.167300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,5.334000>}
box{<0,0,-0.127000><0.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.167300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.167300,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,40.386000>}
box{<0,0,-0.127000><0.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.167300,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,40.472100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.217000,-1.535000,5.247800>}
box{<0,0,-0.127000><35.224300,0.035000,0.127000> rotate<0,-90.000000,0> translate<58.217000,-1.535000,5.247800> }
texture{col_pol}
}
#end
union{
cylinder{<8.890000,0.038000,12.660000><8.890000,-1.538000,12.660000>0.500000}
cylinder{<8.890000,0.038000,7.660000><8.890000,-1.538000,7.660000>0.500000}
cylinder{<8.890000,0.038000,31.750000><8.890000,-1.538000,31.750000>0.406400}
cylinder{<8.890000,0.038000,36.830000><8.890000,-1.538000,36.830000>0.406400}
cylinder{<20.320000,0.038000,22.860000><20.320000,-1.538000,22.860000>0.406400}
cylinder{<20.320000,0.038000,17.780000><20.320000,-1.538000,17.780000>0.406400}
cylinder{<20.320000,0.038000,13.970000><20.320000,-1.538000,13.970000>0.406400}
cylinder{<20.320000,0.038000,8.890000><20.320000,-1.538000,8.890000>0.406400}
cylinder{<30.480000,0.038000,35.560000><30.480000,-1.538000,35.560000>0.406400}
cylinder{<30.480000,0.038000,33.020000><30.480000,-1.538000,33.020000>0.406400}
cylinder{<30.480000,0.038000,22.860000><30.480000,-1.538000,22.860000>0.406400}
cylinder{<35.560000,0.038000,22.860000><35.560000,-1.538000,22.860000>0.406400}
cylinder{<39.370000,0.038000,8.890000><39.370000,-1.538000,8.890000>0.406400}
cylinder{<39.370000,0.038000,13.970000><39.370000,-1.538000,13.970000>0.406400}
cylinder{<48.260000,0.038000,19.050000><48.260000,-1.538000,19.050000>0.406400}
cylinder{<48.260000,0.038000,24.130000><48.260000,-1.538000,24.130000>0.406400}
cylinder{<20.320000,0.038000,30.480000><20.320000,-1.538000,30.480000>0.406400}
cylinder{<20.320000,0.038000,40.640000><20.320000,-1.538000,40.640000>0.406400}
cylinder{<52.070000,0.038000,33.020000><52.070000,-1.538000,33.020000>0.508000}
cylinder{<52.070000,0.038000,35.560000><52.070000,-1.538000,35.560000>0.508000}
cylinder{<52.070000,0.038000,10.160000><52.070000,-1.538000,10.160000>0.508000}
cylinder{<52.070000,0.038000,12.700000><52.070000,-1.538000,12.700000>0.508000}
cylinder{<25.400000,0.038000,22.860000><25.400000,-1.538000,22.860000>0.406400}
cylinder{<25.400000,0.038000,25.400000><25.400000,-1.538000,25.400000>0.406400}
cylinder{<25.400000,0.038000,20.320000><25.400000,-1.538000,20.320000>0.406400}
cylinder{<40.640000,0.038000,22.860000><40.640000,-1.538000,22.860000>0.406400}
cylinder{<40.640000,0.038000,25.400000><40.640000,-1.538000,25.400000>0.406400}
cylinder{<40.640000,0.038000,20.320000><40.640000,-1.538000,20.320000>0.406400}
cylinder{<15.240000,0.038000,27.940000><15.240000,-1.538000,27.940000>0.406400}
cylinder{<15.240000,0.038000,40.640000><15.240000,-1.538000,40.640000>0.406400}
cylinder{<15.240000,0.038000,10.160000><15.240000,-1.538000,10.160000>0.406400}
cylinder{<15.240000,0.038000,22.860000><15.240000,-1.538000,22.860000>0.406400}
cylinder{<25.400000,0.038000,27.940000><25.400000,-1.538000,27.940000>0.406400}
cylinder{<25.400000,0.038000,40.640000><25.400000,-1.538000,40.640000>0.406400}
cylinder{<26.670000,0.038000,5.080000><26.670000,-1.538000,5.080000>0.406400}
cylinder{<26.670000,0.038000,17.780000><26.670000,-1.538000,17.780000>0.406400}
cylinder{<35.560000,0.038000,27.940000><35.560000,-1.538000,27.940000>0.406400}
cylinder{<35.560000,0.038000,40.640000><35.560000,-1.538000,40.640000>0.406400}
cylinder{<34.290000,0.038000,5.080000><34.290000,-1.538000,5.080000>0.406400}
cylinder{<34.290000,0.038000,17.780000><34.290000,-1.538000,17.780000>0.406400}
cylinder{<40.640000,0.038000,27.940000><40.640000,-1.538000,27.940000>0.406400}
cylinder{<40.640000,0.038000,40.640000><40.640000,-1.538000,40.640000>0.406400}
cylinder{<44.450000,0.038000,5.080000><44.450000,-1.538000,5.080000>0.406400}
cylinder{<44.450000,0.038000,17.780000><44.450000,-1.538000,17.780000>0.406400}
cylinder{<45.720000,0.038000,27.940000><45.720000,-1.538000,27.940000>0.406400}
cylinder{<45.720000,0.038000,40.640000><45.720000,-1.538000,40.640000>0.406400}
cylinder{<8.890000,0.038000,17.780000><8.890000,-1.538000,17.780000>0.304800}
cylinder{<8.890000,0.038000,22.860000><8.890000,-1.538000,22.860000>0.304800}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.340000,0.000000,7.660000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.440000,0.000000,7.660000>}
box{<0,0,-0.127000><2.900000,0.036000,0.127000> rotate<0,0.000000,0> translate<7.440000,0.000000,7.660000> }
object{ARC(2.893400,0.254000,111.277779,239.924021,0.036000) translate<8.890000,0.000000,10.163800>}
object{ARC(2.893400,0.254000,300.075979,428.722221,0.036000) translate<8.890000,0.000000,10.163800>}
object{ARC(2.897000,0.254000,68.749494,111.250506,0.036000) translate<8.890000,0.000000,10.160000>}
difference{
cylinder{<8.890000,0,10.160000><8.890000,0.036000,10.160000>1.676200 translate<0,0.000000,0>}
cylinder{<8.890000,-0.1,10.160000><8.890000,0.135000,10.160000>1.523800 translate<0,0.000000,0>}}
box{<-0.350000,0,-1.200000><0.350000,0.036000,1.200000> rotate<0,-0.000000,0> translate<8.890000,0.000000,10.160000>}
box{<-1.200000,0,-0.350000><1.200000,0.036000,0.350000> rotate<0,-0.000000,0> translate<8.890000,0.000000,10.160000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,33.985200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,33.985200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,33.985200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,33.985200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,33.985200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,33.985200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,33.985200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,32.766000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.890000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,34.620200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,34.620200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,34.620200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,34.620200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,34.620200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,34.620200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,34.620200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,35.814000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,30.607000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,37.719000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.668000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,37.973000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,30.861000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.112000,0.000000,30.861000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.366000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.414000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.414000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.366000,0.000000,30.861000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.955000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,20.624800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,20.624800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,20.624800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.685000,0.000000,20.624800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,20.624800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,21.844000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<20.320000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.955000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,19.989800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,19.989800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.685000,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,18.796000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,24.003000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,16.891000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.542000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,16.637000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,23.749000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.098000,0.000000,23.749000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.844000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.796000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.796000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.844000,0.000000,23.749000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.955000,0.000000,11.734800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,11.734800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,11.734800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,11.734800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,11.734800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.685000,0.000000,11.734800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,11.734800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,12.954000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<20.320000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.955000,0.000000,11.099800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,11.099800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,11.099800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.320000,0.000000,11.099800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,11.099800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.685000,0.000000,11.099800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,11.099800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,9.906000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,15.113000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,8.001000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.542000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,7.747000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,14.859000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.098000,0.000000,14.859000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.844000,0.000000,8.001000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.796000,0.000000,8.001000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.796000,0.000000,14.859000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.844000,0.000000,14.859000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.941000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.941000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.369000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.560000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,35.941000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,35.052000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.052000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.210000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,34.544000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,34.544000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.210000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.052000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.750000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,35.052000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.480000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,32.639000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,32.639000> }
difference{
cylinder{<30.480000,0,34.290000><30.480000,0.036000,34.290000>2.870200 translate<0,0.000000,0>}
cylinder{<30.480000,-0.1,34.290000><30.480000,0.135000,34.290000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<30.480000,0.000000,33.782000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.715200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.715200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<32.715200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.715200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.715200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<32.715200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.715200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,22.860000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<31.496000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.350200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.350200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<33.350200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.350200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.350200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<33.350200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,22.860000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<33.350200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,21.336000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.337000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,21.082000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,24.384000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.703000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,24.638000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,0.000000,24.638000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<36.449000,0.000000,24.384000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<36.449000,0.000000,21.336000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.591000,0.000000,21.336000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.591000,0.000000,24.384000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.735000,0.000000,11.125200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.370000,0.000000,11.125200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<38.735000,0.000000,11.125200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.370000,0.000000,11.125200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.005000,0.000000,11.125200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<39.370000,0.000000,11.125200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,11.125200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,9.906000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.735000,0.000000,11.760200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.370000,0.000000,11.760200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<38.735000,0.000000,11.760200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.370000,0.000000,11.760200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.005000,0.000000,11.760200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<39.370000,0.000000,11.760200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,11.760200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,12.954000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<39.370000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,7.747000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.846000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,14.859000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.148000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,15.113000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.846000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,8.001000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.592000,0.000000,8.001000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.846000,0.000000,14.859000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.894000,0.000000,14.859000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.894000,0.000000,8.001000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.846000,0.000000,8.001000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,21.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,21.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,21.285200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,21.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,21.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,21.285200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,21.285200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,20.066000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,21.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,21.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,21.920200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,21.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,21.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,21.920200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,21.920200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,23.114000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<48.260000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,17.907000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,25.019000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.038000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,25.273000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,18.161000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,18.161000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.736000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.784000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.784000,0.000000,18.161000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.736000,0.000000,18.161000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,31.369000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<20.320000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,39.751000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,34.544000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<19.685000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,34.036000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,34.544000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<20.320000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,35.560000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,35.560000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.955000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,35.560000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,35.560000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.082000,0.000000,33.528000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.082000,0.000000,37.592000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<19.558000,0.000000,37.592000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<19.558000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,33.274000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,37.846000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,33.528000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,33.528000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.304000,0.000000,33.528000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<20.320000,0.000000,37.211000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<20.320000,0.000000,32.321500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<20.320000,0.000000,38.798500>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,35.560000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.610000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,36.830000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<52.070000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,35.560000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.991000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,35.560000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<54.991000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,34.290000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.991000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,31.750000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<52.070000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,34.290000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<54.991000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,36.830000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,34.290000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,31.750000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,32.385000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.149000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,33.655000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<49.149000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,34.290000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.149000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,36.195000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.149000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,36.195000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,36.195000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,34.925000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.784000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,34.925000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,33.655000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,33.655000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,32.385000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.784000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,32.385000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,31.750000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,35.560000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.306000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.274000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.020000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,33.020000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,35.306000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<53.467000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,35.306000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,33.274000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.467000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.020000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<53.467000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,33.274000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,33.274000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,33.020000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,12.700000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.610000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<52.070000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,12.700000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.991000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,12.700000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<54.991000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,11.430000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.991000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<52.070000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.991000,0.000000,11.430000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<54.991000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,11.430000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.070000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,9.525000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.149000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<49.149000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,11.430000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.149000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,0.000000,13.335000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.149000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.784000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,12.065000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,10.795000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,9.525000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.784000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.784000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,9.525000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.149000,0.000000,8.890000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.149000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,12.700000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.446000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.414000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.160000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.975000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,10.160000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,12.446000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<53.467000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,12.446000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,10.414000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<53.467000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.467000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.160000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<53.467000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.991000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.975000,0.000000,10.414000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,10.414000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,12.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,10.160000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.749000,0.000000,24.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.749000,0.000000,20.765000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.749000,0.000000,20.765000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<25.400000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,21.724000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,23.996000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,23.996000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<25.399900,0.000000,22.860000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<25.400100,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,24.264000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,25.524000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,25.524000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<25.400100,0.000000,22.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,23.996000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,24.264000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,24.264000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<25.400100,0.000000,22.860000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<25.399900,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,20.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,21.456000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,21.456000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,21.456000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,21.724000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,21.724000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<25.400100,0.000000,22.859500>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.989000,0.000000,24.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.989000,0.000000,20.765000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<38.989000,0.000000,20.765000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<40.640000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,21.724000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,23.996000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.513000,0.000000,23.996000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<40.639900,0.000000,22.860000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<40.640100,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,24.264000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,25.524000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.513000,0.000000,25.524000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<40.640100,0.000000,22.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,23.996000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,24.264000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.513000,0.000000,24.264000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<40.640100,0.000000,22.860000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<40.639900,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,20.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,21.456000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.513000,0.000000,21.456000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,21.456000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.513000,0.000000,21.724000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.513000,0.000000,21.724000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<40.640100,0.000000,22.859500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<15.240000,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.351000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.129000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.129000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.351000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.097000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.097000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.383000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.097000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.224000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.097000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.383000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,38.354000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,30.226000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<15.240000,0.000000,30.226000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,30.683200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,29.413200>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,21.844000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,11.176000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<15.240000,0.000000,11.176000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.351000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.129000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.129000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.351000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.097000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.097000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.383000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.097000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,14.097000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.224000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,14.097000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.097000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.383000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,20.574000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.240000,0.000000,12.446000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<15.240000,0.000000,12.446000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,20.116800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,12.903200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,21.386800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,11.633200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<25.400000,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<24.511000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.289000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.289000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<24.511000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.257000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.257000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.543000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.416000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.257000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.384000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.416000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.416000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.257000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,38.354000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,30.226000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<25.400000,0.000000,30.226000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,30.683200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,29.413200>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,16.764000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<26.670000,0.000000,6.096000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.781000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.559000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.559000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.781000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,8.255000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.527000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.527000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.813000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.686000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.527000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.654000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.686000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.686000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.813000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,14.605000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,15.494000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,7.366000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<26.670000,0.000000,7.366000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,15.036800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,7.823200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,16.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,6.553200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<35.560000,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<34.671000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<36.449000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<36.449000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<34.671000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.417000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.417000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.703000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.576000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.417000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.544000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.576000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.576000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.417000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,38.354000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,30.226000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<35.560000,0.000000,30.226000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,30.683200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,29.413200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,16.764000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<34.290000,0.000000,6.096000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<33.401000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.179000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.179000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<33.401000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,8.255000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.147000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.147000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.433000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.306000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.147000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.274000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.306000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.306000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.147000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.433000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,14.605000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,15.494000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,7.366000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<34.290000,0.000000,7.366000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,15.036800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,7.823200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,16.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,0.000000,6.553200>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<40.640000,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.751000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.529000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.529000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.751000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.497000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.497000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.783000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.656000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.497000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.624000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.656000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.497000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.783000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,38.354000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,30.226000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<40.640000,0.000000,30.226000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,30.683200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.640000,0.000000,29.413200>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,16.764000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<44.450000,0.000000,6.096000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<43.561000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.339000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.339000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<43.561000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,8.255000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.307000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.307000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.593000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<45.466000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.307000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.434000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.466000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,9.017000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.466000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.593000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,14.605000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,15.494000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,7.366000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<44.450000,0.000000,7.366000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,15.036800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,7.823200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,16.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,6.553200>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.720000,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<44.831000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<44.831000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.577000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.577000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.863000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.736000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.577000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.704000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.736000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.736000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.577000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.863000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,38.354000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,30.226000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.720000,0.000000,30.226000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,30.683200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,0.000000,29.413200>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,23.749000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.176000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,16.891000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.668000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.668000,0.000000,23.749000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.668000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.112000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.112000,0.000000,16.891000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<7.112000,0.000000,16.891000> }
object{ARC(1.778000,0.050800,0.000000,180.000000,0.036000) translate<8.890000,0.000000,23.749000>}
object{ARC(2.286000,0.152400,0.000000,180.000000,0.036000) translate<8.890000,0.000000,23.749000>}
object{ARC(2.286000,0.152400,180.000000,360.000000,0.036000) translate<8.890000,0.000000,16.891000>}
object{ARC(1.778000,0.050800,180.000000,360.000000,0.036000) translate<8.890000,0.000000,16.891000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  BFO(-29.680000,0,-22.855000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
