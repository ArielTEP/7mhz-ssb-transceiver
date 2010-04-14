//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/MIC_Amplifier/MIC_amp.brd
//2010. 04. 14. 18:45:29

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
#local cam_y = 230;
#local cam_z = -124;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
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

#local lgt1_pos_x = 27;
#local lgt1_pos_y = 41;
#local lgt1_pos_z = 28;
#local lgt1_intense = 0.755569;
#local lgt2_pos_x = -27;
#local lgt2_pos_y = 41;
#local lgt2_pos_z = 28;
#local lgt2_intense = 0.755569;
#local lgt3_pos_x = 27;
#local lgt3_pos_y = 41;
#local lgt3_pos_z = -19;
#local lgt3_intense = 0.755569;
#local lgt4_pos_x = -27;
#local lgt4_pos_y = 41;
#local lgt4_pos_z = -19;
#local lgt4_intense = 0.755569;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 72.020000;
#declare pcb_y_size = 54.010000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(302);
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
	//translate<-36.010000,0,-27.005000>
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


#macro MIC_AMP(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><72.020000,0.000000>
<72.020000,0.000000><72.020000,54.010000>
<72.020000,54.010000><0.000000,54.010000>
<0.000000,54.010000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,50.800000><3.810000,-5,50.800000>1.600000 texture{col_hls}}
cylinder{<68.580000,1,50.800000><68.580000,-5,50.800000>1.600000 texture{col_hls}}
cylinder{<68.580000,1,3.810000><68.580000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_2MM5_6MM3("100uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.200000,0.000000,46.220000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C1 100uF 35V E2,5-6
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("1000pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.540000,0.000000,29.070000>}#end		//ceramic disc capacitator C2 1000pF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<28.630000,0.000000,38.600000>}#end		//ceramic disc capacitator C3 0.1uF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.360000,0.000000,31.580000>}#end		//ceramic disc capacitator C4 0.1uF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_ELKO_2MM5_6MM3("1uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.850000,0.000000,16.740000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C5 1uF 35V E2,5-6
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("1000pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.360000,0.000000,26.500000>}#end		//ceramic disc capacitator C6 1000pF C050-035X075
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.022uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<53.070000,0.000000,10.390000>}#end		//ceramic disc capacitator C7 0.022uF C050-035X075
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_ELKO_2MM5_6MM3("1uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.030000,0.000000,47.490000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C8 1uF 35V E2,5-6
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_ELKO_2MM5_6MM3("22uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.280000,0.000000,12.610000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C9 22uF 35V E2,5-6
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_DIS_ELKO_2MM5_6MM3("22uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.830000,0.000000,12.490000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C10 22uF 35V E2,5-6
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_DIS_ELKO_2MM5_6MM3("1uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.190000,0.000000,20.050000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C11 1uF 35V E2,5-6
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("6V1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.470000,0.000000,39.870000>}#end		//Diode DO35 10mm hor. D1 6V1 DO35Z10
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO35_102MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.190000,0.000000,10.950000>}#end		//Diode DO35 10mm hor. D2 1N4148 DO35-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP14("LM324N","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<54.030000,0.000000,30.980000>}#end		//DIP14 IC1 LM324N DIL14
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.400000,0.000000,29.050000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.600000,0.000000,47.450000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<64.200000,0.000000,11.250000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.400000,0.000000,19.280000>}#end		//TO92 bend vertical Q1 BC548B TO92-EBC
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {TR_TO92_L("BC558B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.200000,0.000000,16.070000>}#end		//TO92 bend vertical Q2 BC558B TO92-EBC
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.470000,0.000000,36.060000>}#end		//Discrete Resistor 0,3W 12MM Grid R1 1k 0207/12
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<28.630000,0.000000,47.490000>}#end		//Discrete Resistor 0,3W 12MM Grid R2 10k 0207/12
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<12.120000,0.000000,11.930000>}#end		//Discrete Resistor 0,3W 12MM Grid R3 10k 0207/12
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.200000,0.000000,22.020000>}#end		//Discrete Resistor 0,3W 12MM Grid R4 10k 0207/12
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.790000,0.000000,33.520000>}#end		//Discrete Resistor 0,3W 12MM Grid R5 22k 0207/12
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.090000,0.000000,7.460000>}#end		//Discrete Resistor 0,3W 12MM Grid R6 100k 0207/12
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<37.520000,0.000000,23.360000>}#end		//Discrete Resistor 0,3W 12MM Grid R7 100k 0207/12
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_12MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.790000,0.000000,41.140000>}#end		//Discrete Resistor 0,3W 12MM Grid R8 4k7 0207/12
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.790000,0.000000,37.330000>}#end		//Discrete Resistor 0,3W 12MM Grid R9 270k 0207/12
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<33.980000,0.000000,13.730000>}#end		//Discrete Resistor 0,3W 12MM Grid R10 10k 0207/12
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_12MM(texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<61.650000,0.000000,30.980000>}#end		//Discrete Resistor 0,3W 12MM Grid R11 47k 35V 0207/12
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.310000,0.000000,11.930000>}#end		//Discrete Resistor 0,3W 12MM Grid R12 220E 0207/12
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<65.460000,0.000000,30.980000>}#end		//Discrete Resistor 0,3W 12MM Grid R13 2k2 0207/12
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<55.300000,0.000000,42.410000>}#end		//Discrete Resistor 0,3W 12MM Grid R14 100E 0207/12
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.330000,0.000000,23.360000>}#end		//Discrete Resistor 0,3W 12MM Grid R15 100k 0207/12
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<45.140000,0.000000,23.360000>}#end		//Discrete Resistor 0,3W 12MM Grid R16 100k 0207/12
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<57.240000,0.000000,11.700000>}#end		//Discrete Resistor 0,3W 12MM Grid R17 1k 0207/12
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<17.200000,0,47.490000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<17.200000,0,44.950000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.540000,0,26.530000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.540000,0,31.610000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<28.630000,0,36.060000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<28.630000,0,41.140000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.820000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<29.900000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<21.580000,0,16.740000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.120000,0,16.740000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.820000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<29.900000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<53.070000,0,12.930000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<53.070000,0,7.850000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<53.300000,0,47.490000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.760000,0,47.490000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<46.280000,0,13.880000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.280000,0,11.340000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<39.830000,0,13.760000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<39.830000,0,11.220000> texture{col_thl}}
#ifndef(global_pack_C11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<62.920000,0,20.050000> texture{col_thl}}
#ifndef(global_pack_C11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<65.460000,0,20.050000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.390000,0,39.870000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<23.550000,0,39.870000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<18.110000,0,10.950000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<28.270000,0,10.950000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,38.600000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,36.060000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,33.520000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,30.980000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,28.440000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,25.900000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<50.220000,0,23.360000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,23.360000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,25.900000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,28.440000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,30.980000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,33.520000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,36.060000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.840000,0,38.600000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.400000,0,30.320000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.400000,0,27.780000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.870000,0,47.450000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.330000,0,47.450000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<64.200000,0,9.980000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<64.200000,0,12.520000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.130000,0,19.280000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.130000,0,21.820000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.130000,0,16.740000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.930000,0,16.070000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.930000,0,18.610000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.930000,0,13.530000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.120000,0,36.060000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.820000,0,36.060000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.980000,0,47.490000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<22.280000,0,47.490000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.120000,0,18.280000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.120000,0,5.580000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<23.550000,0,22.020000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<10.850000,0,22.020000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<32.440000,0,33.520000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.140000,0,33.520000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.440000,0,7.460000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.740000,0,7.460000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<37.520000,0,29.710000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<37.520000,0,17.010000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<32.440000,0,41.140000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.140000,0,41.140000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<32.440000,0,37.330000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.140000,0,37.330000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.980000,0,7.380000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.980000,0,20.080000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<61.650000,0,24.630000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<61.650000,0,37.330000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.310000,0,5.580000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.310000,0,18.280000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<65.460000,0,24.630000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<65.460000,0,37.330000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<61.650000,0,42.410000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.950000,0,42.410000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.330000,0,17.010000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.330000,0,29.710000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<45.140000,0,29.710000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<45.140000,0,17.010000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<57.240000,0,5.350000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<57.240000,0,18.050000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<55.300000,0,27.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<55.300000,0,37.260000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<46.910000,0,39.370000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<46.980000,0,31.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<60.380000,0,22.090000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<60.380000,0,17.070000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<47.280000,0,28.440000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<47.280000,0,19.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<53.000000,0,32.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<53.000000,0,19.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<50.000000,0,7.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.800000,1,16,1,0) translate<50.000000,0,14.000000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,19.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,34.790000>}
box{<0,0,-0.304800><15.240000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.040000,-1.535000,34.790000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,34.790000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,43.490000>}
box{<0,0,-0.304800><8.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.040000,-1.535000,43.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,19.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.310000,-1.535000,18.280000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<7.040000,-1.535000,19.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,39.920000>}
box{<0,0,-0.304800><10.820000,0.035000,0.304800> rotate<0,90.000000,0> translate<9.500000,-1.535000,39.920000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,40.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,43.000000>}
box{<0,0,-0.304800><2.920000,0.035000,0.304800> rotate<0,90.000000,0> translate<9.500000,-1.535000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.580000,-1.535000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.580000,-1.535000,39.870000>}
box{<0,0,-0.304800><0.130000,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.580000,-1.535000,39.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,39.920000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.580000,-1.535000,40.000000>}
box{<0,0,-0.304800><0.113137,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.500000,-1.535000,39.920000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,40.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.580000,-1.535000,40.000000>}
box{<0,0,-0.304800><0.113137,0.035000,0.304800> rotate<0,44.997030,0> translate<9.500000,-1.535000,40.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.580000,-1.535000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.710000,-1.535000,39.870000>}
box{<0,0,-0.304800><0.183848,0.035000,0.304800> rotate<0,44.997030,0> translate<9.580000,-1.535000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.830000,-1.535000,27.770000>}
box{<0,0,-0.304800><1.880904,0.035000,0.304800> rotate<0,44.997030,0> translate<9.500000,-1.535000,29.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,-1.535000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.450000,-1.535000,44.950000>}
box{<0,0,-0.304800><2.757716,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.500000,-1.535000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.310000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,5.580000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.310000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,15.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,18.280000>}
box{<0,0,-0.304800><3.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<12.120000,-1.535000,18.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.710000,-1.535000,39.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.390000,-1.535000,39.870000>}
box{<0,0,-0.304800><3.680000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.710000,-1.535000,39.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.300000>}
box{<0,0,-0.304800><0.020000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.400000,-1.535000,30.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.300000>}
box{<0,0,-0.304800><0.020000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.400000,-1.535000,30.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,36.060000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,34.780000>}
box{<0,0,-0.304800><1.810193,0.035000,0.304800> rotate<0,44.997030,0> translate<12.120000,-1.535000,36.060000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,34.780000>}
box{<0,0,-0.304800><4.460000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.400000,-1.535000,34.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,15.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.500000,-1.535000,13.700000>}
box{<0,0,-0.304800><1.951615,0.035000,0.304800> rotate<0,44.997030,0> translate<12.120000,-1.535000,15.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.040000,-1.535000,43.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.580000,-1.535000,50.030000>}
box{<0,0,-0.304800><9.248957,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.040000,-1.535000,43.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.850000,-1.535000,22.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.580000,-1.535000,22.020000>}
box{<0,0,-0.304800><3.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.850000,-1.535000,22.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.500000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.760000,-1.535000,13.700000>}
box{<0,0,-0.304800><2.260000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.500000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.760000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.930000,-1.535000,13.530000>}
box{<0,0,-0.304800><0.240416,0.035000,0.304800> rotate<0,44.997030,0> translate<15.760000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.930000,-1.535000,16.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,15.900000>}
box{<0,0,-0.304800><0.240416,0.035000,0.304800> rotate<0,44.997030,0> translate<15.930000,-1.535000,16.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.930000,-1.535000,18.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,18.780000>}
box{<0,0,-0.304800><0.240416,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.930000,-1.535000,18.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,18.780000>}
box{<0,0,-0.304800><1.720000,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.100000,-1.535000,18.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.580000,-1.535000,22.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,20.500000>}
box{<0,0,-0.304800><2.149605,0.035000,0.304800> rotate<0,44.997030,0> translate<14.580000,-1.535000,22.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.400000,-1.535000,30.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.300000,-1.535000,30.300000>}
box{<0,0,-0.304800><2.900000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.400000,-1.535000,30.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.740000,-1.535000,7.460000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,-1.535000,7.450000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<16.740000,-1.535000,7.460000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.450000,-1.535000,44.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.200000,-1.535000,44.950000>}
box{<0,0,-0.304800><5.750000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.450000,-1.535000,44.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.430000,-1.535000,27.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.500000,-1.535000,26.700000>}
box{<0,0,-0.304800><1.513209,0.035000,0.304800> rotate<0,44.997030,0> translate<16.430000,-1.535000,27.770000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.300000,-1.535000,30.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.610000,-1.535000,31.610000>}
box{<0,0,-0.304800><1.852620,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.300000,-1.535000,30.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,15.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.500000,-1.535000,15.900000>}
box{<0,0,-0.304800><2.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.100000,-1.535000,15.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.500000,-1.535000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.370000,-1.535000,26.700000>}
box{<0,0,-0.304800><1.870000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.500000,-1.535000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.370000,-1.535000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.540000,-1.535000,26.530000>}
box{<0,0,-0.304800><0.240416,0.035000,0.304800> rotate<0,44.997030,0> translate<19.370000,-1.535000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.610000,-1.535000,31.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.540000,-1.535000,31.610000>}
box{<0,0,-0.304800><1.930000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.610000,-1.535000,31.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.930000,-1.535000,18.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.710000,-1.535000,18.610000>}
box{<0,0,-0.304800><3.780000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.930000,-1.535000,18.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,-1.535000,7.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.750000,-1.535000,7.450000>}
box{<0,0,-0.304800><3.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.750000,-1.535000,7.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.500000,-1.535000,15.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.100000,-1.535000,14.300000>}
box{<0,0,-0.304800><2.262742,0.035000,0.304800> rotate<0,44.997030,0> translate<18.500000,-1.535000,15.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.110000,-1.535000,10.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.850000,-1.535000,10.950000>}
box{<0,0,-0.304800><2.740000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.110000,-1.535000,10.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.750000,-1.535000,7.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,8.600000>}
box{<0,0,-0.304800><1.626346,0.035000,0.304800> rotate<0,-44.997030,0> translate<19.750000,-1.535000,7.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.850000,-1.535000,10.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,10.900000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,44.997030,0> translate<20.850000,-1.535000,10.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,8.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,10.900000>}
box{<0,0,-0.304800><2.300000,0.035000,0.304800> rotate<0,90.000000,0> translate<20.900000,-1.535000,10.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.100000,-1.535000,14.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.500000>}
box{<0,0,-0.304800><1.131371,0.035000,0.304800> rotate<0,44.997030,0> translate<20.100000,-1.535000,14.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,10.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.500000>}
box{<0,0,-0.304800><2.600000,0.035000,0.304800> rotate<0,90.000000,0> translate<20.900000,-1.535000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.710000,-1.535000,18.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.580000,-1.535000,16.740000>}
box{<0,0,-0.304800><2.644579,0.035000,0.304800> rotate<0,44.997030,0> translate<19.710000,-1.535000,18.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.200000,-1.535000,47.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.280000,-1.535000,47.490000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.200000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.280000,-1.535000,44.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.280000,-1.535000,47.490000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.280000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.500000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.500000,-1.535000,21.970000>}
box{<0,0,-0.304800><1.470000,0.035000,0.304800> rotate<0,90.000000,0> translate<23.500000,-1.535000,21.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.500000,-1.535000,21.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,22.020000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.500000,-1.535000,21.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.280000,-1.535000,44.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,43.680000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<22.280000,-1.535000,44.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,39.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,43.680000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<23.550000,-1.535000,43.680000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,43.680000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.570000,-1.535000,43.700000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.550000,-1.535000,43.680000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.500000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.720000,-1.535000,19.280000>}
box{<0,0,-0.304800><1.725341,0.035000,0.304800> rotate<0,44.997030,0> translate<23.500000,-1.535000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.540000,-1.535000,26.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.790000,-1.535000,26.530000>}
box{<0,0,-0.304800><5.250000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.540000,-1.535000,26.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.540000,-1.535000,31.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.790000,-1.535000,31.610000>}
box{<0,0,-0.304800><5.250000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.540000,-1.535000,31.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.790000,-1.535000,26.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,26.500000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,44.997030,0> translate<24.790000,-1.535000,26.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.790000,-1.535000,31.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,31.580000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,44.997030,0> translate<24.790000,-1.535000,31.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.550000,-1.535000,39.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,38.600000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<23.550000,-1.535000,39.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,36.060000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,38.600000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.820000,-1.535000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.430000>}
box{<0,0,-0.304800><0.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.360000,-1.535000,25.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.700000>}
box{<0,0,-0.304800><0.200000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.360000,-1.535000,25.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.900000>}
box{<0,0,-0.304800><0.600000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.360000,-1.535000,25.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.820000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,26.500000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.820000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,34.790000>}
box{<0,0,-0.304800><8.290000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.360000,-1.535000,34.790000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.570000,-1.535000,43.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.500000,-1.535000,43.700000>}
box{<0,0,-0.304800><3.930000,0.035000,0.304800> rotate<0,0.000000,0> translate<23.570000,-1.535000,43.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.270000,-1.535000,8.630000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.270000,-1.535000,10.950000>}
box{<0,0,-0.304800><2.320000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.270000,-1.535000,10.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,-1.535000,36.190000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,-1.535000,38.000000>}
box{<0,0,-0.304800><1.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.500000,-1.535000,38.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,25.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,24.160000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<27.360000,-1.535000,25.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.360000,-1.535000,34.790000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,36.060000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.360000,-1.535000,34.790000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,-1.535000,36.190000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,36.060000>}
box{<0,0,-0.304800><0.183848,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,-1.535000,36.190000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,42.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,41.140000>}
box{<0,0,-0.304800><1.430000,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.630000,-1.535000,41.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.500000,-1.535000,43.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,42.570000>}
box{<0,0,-0.304800><1.598061,0.035000,0.304800> rotate<0,44.997030,0> translate<27.500000,-1.535000,43.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.120000,-1.535000,16.740000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.130000,-1.535000,16.740000>}
box{<0,0,-0.304800><5.010000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.120000,-1.535000,16.740000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.720000,-1.535000,19.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.130000,-1.535000,19.280000>}
box{<0,0,-0.304800><4.410000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.720000,-1.535000,19.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.130000,-1.535000,16.740000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.170000,-1.535000,16.700000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,44.997030,0> translate<29.130000,-1.535000,16.740000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.300000,-1.535000,13.500000>}
box{<0,0,-0.304800><8.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.900000,-1.535000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.270000,-1.535000,8.630000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.440000,-1.535000,7.460000>}
box{<0,0,-0.304800><1.654630,0.035000,0.304800> rotate<0,44.997030,0> translate<28.270000,-1.535000,8.630000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.440000,-1.535000,5.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.440000,-1.535000,7.460000>}
box{<0,0,-0.304800><1.820000,0.035000,0.304800> rotate<0,90.000000,0> translate<29.440000,-1.535000,7.460000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.120000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.500000,-1.535000,5.580000>}
box{<0,0,-0.304800><17.380000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.120000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.440000,-1.535000,5.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.500000,-1.535000,5.580000>}
box{<0,0,-0.304800><0.084853,0.035000,0.304800> rotate<0,44.997030,0> translate<29.440000,-1.535000,5.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900000,-1.535000,31.580000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<29.900000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900000,-1.535000,32.700000>}
box{<0,0,-0.304800><1.120000,0.035000,0.304800> rotate<0,90.000000,0> translate<29.900000,-1.535000,32.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,-1.535000,38.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,40.000000>}
box{<0,0,-0.304800><2.828427,0.035000,0.304800> rotate<0,-44.997030,0> translate<28.500000,-1.535000,38.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,42.500000>}
box{<0,0,-0.304800><2.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.500000,-1.535000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900000,-1.535000,32.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,-1.535000,33.520000>}
box{<0,0,-0.304800><1.159655,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.900000,-1.535000,32.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.630000,-1.535000,24.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.440000,-1.535000,24.160000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.630000,-1.535000,24.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.440000,-1.535000,33.520000>}
box{<0,0,-0.304800><1.720000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.720000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.440000,-1.535000,37.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.440000,-1.535000,41.140000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<32.440000,-1.535000,41.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.440000,-1.535000,41.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.480000,-1.535000,41.100000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,44.997030,0> translate<32.440000,-1.535000,41.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.500000,-1.535000,44.500000>}
box{<0,0,-0.304800><2.828427,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.500000,-1.535000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.300000,-1.535000,13.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.500000,-1.535000,9.300000>}
box{<0,0,-0.304800><5.939697,0.035000,0.304800> rotate<0,44.997030,0> translate<29.300000,-1.535000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.130000,-1.535000,21.820000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.620000,-1.535000,21.820000>}
box{<0,0,-0.304800><4.490000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.130000,-1.535000,21.820000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.580000,-1.535000,50.030000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.710000,-1.535000,50.030000>}
box{<0,0,-0.304800><20.130000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.580000,-1.535000,50.030000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,7.380000>}
box{<0,0,-0.304800><1.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.980000,-1.535000,7.380000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,16.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,20.080000>}
box{<0,0,-0.304800><3.360000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.980000,-1.535000,20.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.170000,-1.535000,16.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.000000,-1.535000,16.700000>}
box{<0,0,-0.304800><4.830000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.170000,-1.535000,16.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,16.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.000000,-1.535000,16.700000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<33.980000,-1.535000,16.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.500000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.050000,-1.535000,5.580000>}
box{<0,0,-0.304800><4.550000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.500000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.980000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.050000,-1.535000,5.580000>}
box{<0,0,-0.304800><0.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.980000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.050000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,5.580000>}
box{<0,0,-0.304800><0.850000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.050000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.620000,-1.535000,21.820000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,23.100000>}
box{<0,0,-0.304800><1.810193,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.620000,-1.535000,21.820000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,23.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,28.100000>}
box{<0,0,-0.304800><5.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.900000,-1.535000,28.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,28.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,29.700000>}
box{<0,0,-0.304800><1.600000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.900000,-1.535000,29.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,29.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,31.900000>}
box{<0,0,-0.304800><2.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.900000,-1.535000,31.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,29.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.910000,-1.535000,29.710000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.900000,-1.535000,29.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.980000,-1.535000,48.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.980000,-1.535000,47.490000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.980000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.710000,-1.535000,50.030000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.980000,-1.535000,48.760000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<33.710000,-1.535000,50.030000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.980000,-1.535000,47.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.020000,-1.535000,47.450000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,44.997030,0> translate<34.980000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.700000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.000000,-1.535000,11.500000>}
box{<0,0,-0.304800><3.252691,0.035000,0.304800> rotate<0,44.997030,0> translate<33.700000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.480000,-1.535000,41.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.100000,-1.535000,41.100000>}
box{<0,0,-0.304800><3.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.480000,-1.535000,41.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.000000,-1.535000,11.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.280000,-1.535000,11.220000>}
box{<0,0,-0.304800><0.395980,0.035000,0.304800> rotate<0,44.997030,0> translate<36.000000,-1.535000,11.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,31.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.520000,-1.535000,33.520000>}
box{<0,0,-0.304800><2.291026,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.900000,-1.535000,31.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.000000,-1.535000,16.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.940000,-1.535000,13.760000>}
box{<0,0,-0.304800><4.157788,0.035000,0.304800> rotate<0,44.997030,0> translate<34.000000,-1.535000,16.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.980000,-1.535000,5.580000>}
box{<0,0,-0.304800><2.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.900000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.940000,-1.535000,13.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.450000,-1.535000,13.760000>}
box{<0,0,-0.304800><0.510000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.940000,-1.535000,13.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.500000,-1.535000,39.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.500000,-1.535000,37.500000>}
box{<0,0,-0.304800><2.200000,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.500000,-1.535000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.100000,-1.535000,41.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.500000,-1.535000,39.700000>}
box{<0,0,-0.304800><1.979899,0.035000,0.304800> rotate<0,44.997030,0> translate<36.100000,-1.535000,41.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.450000,-1.535000,13.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.520000,-1.535000,13.830000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.450000,-1.535000,13.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.520000,-1.535000,13.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.520000,-1.535000,17.010000>}
box{<0,0,-0.304800><3.180000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.520000,-1.535000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.910000,-1.535000,29.710000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.520000,-1.535000,29.710000>}
box{<0,0,-0.304800><2.610000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.910000,-1.535000,29.710000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.980000,-1.535000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.300000,-1.535000,6.900000>}
box{<0,0,-0.304800><1.866762,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.980000,-1.535000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.520000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.790000,-1.535000,33.520000>}
box{<0,0,-0.304800><2.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.520000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.020000,-1.535000,47.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.330000,-1.535000,47.450000>}
box{<0,0,-0.304800><4.310000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.020000,-1.535000,47.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.500000,-1.535000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.500000,-1.535000,35.500000>}
box{<0,0,-0.304800><2.828427,0.035000,0.304800> rotate<0,44.997030,0> translate<37.500000,-1.535000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.280000,-1.535000,11.220000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.830000,-1.535000,11.220000>}
box{<0,0,-0.304800><3.550000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.280000,-1.535000,11.220000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.450000,-1.535000,13.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.830000,-1.535000,13.760000>}
box{<0,0,-0.304800><2.380000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.450000,-1.535000,13.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.770000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.830000,-1.535000,13.760000>}
box{<0,0,-0.304800><0.084853,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.770000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.830000,-1.535000,13.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.890000,-1.535000,13.700000>}
box{<0,0,-0.304800><0.084853,0.035000,0.304800> rotate<0,44.997030,0> translate<39.830000,-1.535000,13.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.830000,-1.535000,11.220000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.950000,-1.535000,11.340000>}
box{<0,0,-0.304800><0.169706,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.830000,-1.535000,11.220000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,19.550000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.330000,-1.535000,19.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,19.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,22.090000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.330000,-1.535000,22.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,29.710000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,29.880000>}
box{<0,0,-0.304800><0.240416,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.330000,-1.535000,29.710000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,29.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,30.500000>}
box{<0,0,-0.304800><0.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.500000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.500000,-1.535000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,44.500000>}
box{<0,0,-0.304800><9.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.500000,-1.535000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.890000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.900000,-1.535000,13.700000>}
box{<0,0,-0.304800><2.010000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.890000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.480000,-1.535000,31.480000>}
box{<0,0,-0.304800><1.385929,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.500000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.500000,-1.535000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.600000,-1.535000,45.600000>}
box{<0,0,-0.304800><1.555635,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.500000,-1.535000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.900000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,15.000000>}
box{<0,0,-0.304800><1.838478,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.900000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,15.800000>}
box{<0,0,-0.304800><0.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.200000,-1.535000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,16.000000>}
box{<0,0,-0.304800><0.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.200000,-1.535000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,18.200000>}
box{<0,0,-0.304800><2.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.200000,-1.535000,18.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,18.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,18.400000>}
box{<0,0,-0.304800><0.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.200000,-1.535000,18.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,18.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.100000,-1.535000,19.300000>}
box{<0,0,-0.304800><1.272792,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.200000,-1.535000,18.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.000000,-1.535000,41.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.000000,-1.535000,45.500000>}
box{<0,0,-0.304800><4.220000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.000000,-1.535000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.330000,-1.535000,22.090000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,25.900000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.330000,-1.535000,22.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,25.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,29.710000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.140000,-1.535000,29.710000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.790000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,33.520000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.790000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.000000,-1.535000,41.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,41.140000>}
box{<0,0,-0.304800><0.197990,0.035000,0.304800> rotate<0,44.997030,0> translate<45.000000,-1.535000,41.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.950000,-1.535000,11.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.280000,-1.535000,11.340000>}
box{<0,0,-0.304800><6.330000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.950000,-1.535000,11.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.280000,-1.535000,13.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.400000,-1.535000,14.000000>}
box{<0,0,-0.304800><0.169706,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.280000,-1.535000,13.880000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.280000,-1.535000,11.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.440000,-1.535000,11.500000>}
box{<0,0,-0.304800><0.226274,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.280000,-1.535000,11.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.910000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.910000,0.000000,39.370000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<46.910000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.480000,-1.535000,31.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.980000,-1.535000,31.480000>}
box{<0,0,-0.304800><4.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.480000,-1.535000,31.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.910000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.980000,0.000000,31.480000>}
box{<0,0,-0.304800><0.278927,0.035000,0.304800> rotate<0,75.460564,0> translate<46.910000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.000000,-1.535000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,47.490000>}
box{<0,0,-0.304800><2.814285,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.000000,-1.535000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.100000,-1.535000,19.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.260000,-1.535000,19.300000>}
box{<0,0,-0.304800><3.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.100000,-1.535000,19.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.260000,-1.535000,19.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.280000,-1.535000,19.320000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.260000,-1.535000,19.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.280000,0.000000,19.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.280000,0.000000,28.440000>}
box{<0,0,-0.304800><9.120000,0.035000,0.304800> rotate<0,90.000000,0> translate<47.280000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,37.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.680000,-1.535000,37.330000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.140000,-1.535000,37.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.210000,-1.535000,17.010000>}
box{<0,0,-0.304800><3.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.140000,-1.535000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.500000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.500000,-1.535000,35.500000>}
box{<0,0,-0.304800><9.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.500000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.680000,-1.535000,37.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,38.600000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.680000,-1.535000,37.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.910000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,41.410000>}
box{<0,0,-0.304800><2.884996,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.910000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,41.410000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,42.410000>}
box{<0,0,-0.304800><1.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.950000,-1.535000,42.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.500000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.060000,-1.535000,36.060000>}
box{<0,0,-0.304800><0.791960,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.500000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.300000,-1.535000,6.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.900000,-1.535000,6.900000>}
box{<0,0,-0.304800><11.600000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.300000,-1.535000,6.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.900000,-1.535000,6.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,-1.535000,7.000000>}
box{<0,0,-0.304800><0.141421,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.900000,-1.535000,6.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.400000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,-1.535000,14.000000>}
box{<0,0,-0.304800><3.600000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.400000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,0.000000,7.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,0.000000,14.000000>}
box{<0,0,-0.304800><7.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,-1.535000,16.000000>}
box{<0,0,-0.304800><2.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.000000,-1.535000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,25.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,25.900000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.140000,-1.535000,25.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.280000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,28.440000>}
box{<0,0,-0.304800><2.940000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.280000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,33.520000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.140000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.060000,-1.535000,36.060000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,36.060000>}
box{<0,0,-0.304800><1.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.060000,-1.535000,36.060000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,38.600000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.950000,-1.535000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.210000,-1.535000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,19.100000>}
box{<0,0,-0.304800><2.955706,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.210000,-1.535000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,19.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,21.300000>}
box{<0,0,-0.304800><2.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.300000,-1.535000,21.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,23.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,23.280000>}
box{<0,0,-0.304800><0.113137,0.035000,0.304800> rotate<0,44.997030,0> translate<50.220000,-1.535000,23.360000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,21.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,23.280000>}
box{<0,0,-0.304800><1.980000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.300000,-1.535000,23.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.500000,-1.535000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.500000,-1.535000,9.300000>}
box{<0,0,-0.304800><17.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.500000,-1.535000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,47.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.760000,-1.535000,47.490000>}
box{<0,0,-0.304800><3.770000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.990000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.440000,-1.535000,11.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.000000,-1.535000,11.500000>}
box{<0,0,-0.304800><4.560000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.440000,-1.535000,11.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,30.980000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.780000,-1.535000,30.980000>}
box{<0,0,-0.304800><1.560000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.220000,-1.535000,30.980000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.500000,-1.535000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.950000,-1.535000,7.850000>}
box{<0,0,-0.304800><2.050610,0.035000,0.304800> rotate<0,44.997030,0> translate<50.500000,-1.535000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.000000,-1.535000,11.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.380000,-1.535000,10.120000>}
box{<0,0,-0.304800><1.951615,0.035000,0.304800> rotate<0,44.997030,0> translate<51.000000,-1.535000,11.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.440000,-1.535000,28.440000>}
box{<0,0,-0.304800><2.220000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.220000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.300000,-1.535000,21.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500000,-1.535000,21.300000>}
box{<0,0,-0.304800><2.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.300000,-1.535000,21.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.000000,-1.535000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,-1.535000,19.000000>}
box{<0,0,-0.304800><4.242641,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.000000,-1.535000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,0.000000,30.500000>}
box{<0,0,-0.304800><11.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<53.000000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.780000,-1.535000,30.980000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,-1.535000,32.200000>}
box{<0,0,-0.304800><1.725341,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.780000,-1.535000,30.980000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.000000,0.000000,32.200000>}
box{<0,0,-0.304800><1.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<53.000000,0.000000,32.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.950000,-1.535000,7.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.070000,-1.535000,7.850000>}
box{<0,0,-0.304800><1.120000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.950000,-1.535000,7.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.070000,-1.535000,12.930000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.140000,-1.535000,13.000000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.070000,-1.535000,12.930000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.220000,-1.535000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.960000,-1.535000,38.600000>}
box{<0,0,-0.304800><3.740000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.220000,-1.535000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.440000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.000000,-1.535000,31.000000>}
box{<0,0,-0.304800><3.620387,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.440000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.000000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.000000,-1.535000,32.500000>}
box{<0,0,-0.304800><1.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<55.000000,-1.535000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.300000,0.000000,37.260000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.300000,0.000000,27.240000>}
box{<0,0,-0.304800><10.020000,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.300000,0.000000,27.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.960000,-1.535000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.300000,-1.535000,37.260000>}
box{<0,0,-0.304800><1.895046,0.035000,0.304800> rotate<0,44.997030,0> translate<53.960000,-1.535000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.000000,-1.535000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000000,-1.535000,33.500000>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.000000,-1.535000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500000,-1.535000,21.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.200000,-1.535000,21.300000>}
box{<0,0,-0.304800><3.700000,0.035000,0.304800> rotate<0,0.000000,0> translate<52.500000,-1.535000,21.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.300000,-1.535000,27.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.500000,-1.535000,28.440000>}
box{<0,0,-0.304800><1.697056,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.300000,-1.535000,27.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.950000,-1.535000,42.410000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.570000,-1.535000,42.410000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.950000,-1.535000,42.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.380000,-1.535000,10.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.000000,-1.535000,10.120000>}
box{<0,0,-0.304800><4.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<52.380000,-1.535000,10.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,9.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,5.350000>}
box{<0,0,-0.304800><4.530000,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.240000,-1.535000,5.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.000000,-1.535000,10.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,9.880000>}
box{<0,0,-0.304800><0.339411,0.035000,0.304800> rotate<0,44.997030,0> translate<57.000000,-1.535000,10.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,19.840000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,18.050000>}
box{<0,0,-0.304800><1.790000,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.240000,-1.535000,18.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.200000,-1.535000,21.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.450000,-1.535000,20.050000>}
box{<0,0,-0.304800><1.767767,0.035000,0.304800> rotate<0,44.997030,0> translate<56.200000,-1.535000,21.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.240000,-1.535000,19.840000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.450000,-1.535000,20.050000>}
box{<0,0,-0.304800><0.296985,0.035000,0.304800> rotate<0,-44.997030,0> translate<57.240000,-1.535000,19.840000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000000,-1.535000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.820000,-1.535000,33.500000>}
box{<0,0,-0.304800><1.820000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.000000,-1.535000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,23.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,25.900000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<57.840000,-1.535000,25.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.500000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,28.440000>}
box{<0,0,-0.304800><1.340000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.500000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.820000,-1.535000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,33.520000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,-44.997030,0> translate<57.820000,-1.535000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,41.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,38.600000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.840000,-1.535000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.570000,-1.535000,42.410000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,41.140000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<56.570000,-1.535000,42.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.140000,-1.535000,13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,13.000000>}
box{<0,0,-0.304800><5.360000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.140000,-1.535000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,23.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.110000,-1.535000,22.090000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<57.840000,-1.535000,23.360000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,14.880000>}
box{<0,0,-0.304800><2.658721,0.035000,0.304800> rotate<0,-44.997030,0> translate<58.500000,-1.535000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,14.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,17.070000>}
box{<0,0,-0.304800><2.190000,0.035000,0.304800> rotate<0,90.000000,0> translate<60.380000,-1.535000,17.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.110000,-1.535000,22.090000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,22.090000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.110000,-1.535000,22.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,0.000000,17.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,0.000000,22.090000>}
box{<0,0,-0.304800><5.020000,0.035000,0.304800> rotate<0,90.000000,0> translate<60.380000,0.000000,22.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,28.440000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.840000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,36.060000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,36.060000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.840000,-1.535000,36.060000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.300000,-1.535000,47.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.010000,-1.535000,47.490000>}
box{<0,0,-0.304800><7.710000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.300000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,27.170000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,24.630000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<61.650000,-1.535000,24.630000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,28.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,27.170000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<60.380000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.380000,-1.535000,36.060000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,37.330000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<60.380000,-1.535000,36.060000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,37.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.650000,-1.535000,42.410000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<61.650000,-1.535000,42.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.450000,-1.535000,20.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.920000,-1.535000,20.050000>}
box{<0,0,-0.304800><5.470000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.450000,-1.535000,20.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,30.980000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.920000,-1.535000,30.980000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.840000,-1.535000,30.980000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,12.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,14.470000>}
box{<0,0,-0.304800><1.940000,0.035000,0.304800> rotate<0,90.000000,0> translate<64.190000,-1.535000,14.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.840000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,33.520000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.840000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,12.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.200000,-1.535000,12.520000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<64.190000,-1.535000,12.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,14.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,15.740000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.190000,-1.535000,14.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,15.740000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,20.050000>}
box{<0,0,-0.304800><4.310000,0.035000,0.304800> rotate<0,90.000000,0> translate<65.460000,-1.535000,20.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.920000,-1.535000,30.980000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,28.440000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<62.920000,-1.535000,30.980000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,24.630000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,28.440000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<65.460000,-1.535000,28.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.190000,-1.535000,33.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,34.790000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.190000,-1.535000,33.520000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,34.790000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,37.330000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<65.460000,-1.535000,37.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,37.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.500000,-1.535000,37.370000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,-44.997030,0> translate<65.460000,-1.535000,37.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.010000,-1.535000,47.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.500000,-1.535000,43.000000>}
box{<0,0,-0.304800><6.349819,0.035000,0.304800> rotate<0,44.997030,0> translate<61.010000,-1.535000,47.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.500000,-1.535000,37.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.500000,-1.535000,43.000000>}
box{<0,0,-0.304800><5.630000,0.035000,0.304800> rotate<0,90.000000,0> translate<65.500000,-1.535000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.310000,-1.535000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.000000,-1.535000,10.000000>}
box{<0,0,-0.304800><2.690000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.310000,-1.535000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.000000,-1.535000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,11.000000>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.000000,-1.535000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,12.500000>}
box{<0,0,-0.304800><1.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<68.000000,-1.535000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.460000,-1.535000,24.630000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,22.090000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<65.460000,-1.535000,24.630000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,12.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.000000,-1.535000,22.090000>}
box{<0,0,-0.304800><9.590000,0.035000,0.304800> rotate<0,90.000000,0> translate<68.000000,-1.535000,22.090000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,49.649300>}
box{<0,0,-0.203200><44.688700,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219100,-1.535000,49.649300> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.268100,-1.535000,6.908800>}
box{<0,0,-0.203200><6.049000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,7.315200>}
box{<0,0,-0.203200><13.844500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,7.721600>}
box{<0,0,-0.203200><13.844500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,8.128000>}
box{<0,0,-0.203200><13.844500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.443700,-1.535000,8.534400>}
box{<0,0,-0.203200><14.224600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.850100,-1.535000,8.940800>}
box{<0,0,-0.203200><14.631000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.938400,-1.535000,9.347200>}
box{<0,0,-0.203200><15.719300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.275200,-1.535000,9.753600>}
box{<0,0,-0.203200><15.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.962200,-1.535000,10.160000>}
box{<0,0,-0.203200><14.743100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.793900,-1.535000,10.566400>}
box{<0,0,-0.203200><14.574800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773200,-1.535000,10.972800>}
box{<0,0,-0.203200><14.554100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.812900,-1.535000,11.379200>}
box{<0,0,-0.203200><14.593800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.981300,-1.535000,11.785600>}
box{<0,0,-0.203200><14.762200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.236800,-1.535000,12.192000>}
box{<0,0,-0.203200><13.017700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.733700,-1.535000,12.598400>}
box{<0,0,-0.203200><11.514600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.327300,-1.535000,13.004800>}
box{<0,0,-0.203200><11.108200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.920900,-1.535000,13.411200>}
box{<0,0,-0.203200><10.701800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.514500,-1.535000,13.817600>}
box{<0,0,-0.203200><10.295400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.108100,-1.535000,14.224000>}
box{<0,0,-0.203200><9.889000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.876500,-1.535000,14.630400>}
box{<0,0,-0.203200><9.657400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,15.036800>}
box{<0,0,-0.203200><9.580100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,15.443200>}
box{<0,0,-0.203200><9.580100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,15.849600>}
box{<0,0,-0.203200><9.580100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,16.256000>}
box{<0,0,-0.203200><9.580100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.556800,-1.535000,16.662400>}
box{<0,0,-0.203200><6.337700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.150400,-1.535000,17.068800>}
box{<0,0,-0.203200><5.931300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.744000,-1.535000,17.475200>}
box{<0,0,-0.203200><5.524900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,17.881600>}
box{<0,0,-0.203200><5.414500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.434100,-1.535000,18.288000>}
box{<0,0,-0.203200><5.215000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.027700,-1.535000,18.694400>}
box{<0,0,-0.203200><4.808600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.796400,-1.535000,19.100800>}
box{<0,0,-0.203200><4.577300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,19.507200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,19.913600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,20.320000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,20.726400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,21.132800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,21.539200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,21.945600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,22.352000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,22.758400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,23.164800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,23.571200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,23.977600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,24.384000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,24.790400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,25.196800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,25.603200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,26.009600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,26.416000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,26.822400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,27.228800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,27.635200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,28.041600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,28.448000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,28.854400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,29.260800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,29.667200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,30.073600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,30.480000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,30.886400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,31.292800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,31.699200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,32.105600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,32.512000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,32.918400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,33.324800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,33.731200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,34.137600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,34.544000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,34.950400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,35.356800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,35.763200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,36.169600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,36.576000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,36.982400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,37.388800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,37.795200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,38.201600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,38.608000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,39.014400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,39.420800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,39.827200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,40.233600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,40.640000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,41.046400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,41.452800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,41.859200>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,42.265600>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,42.672000>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.078400>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.484800>}
box{<0,0,-0.203200><4.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.776600,-1.535000,43.891200>}
box{<0,0,-0.203200><4.557500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.979800,-1.535000,44.297600>}
box{<0,0,-0.203200><4.760700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.386200,-1.535000,44.704000>}
box{<0,0,-0.203200><5.167100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.792600,-1.535000,45.110400>}
box{<0,0,-0.203200><5.573500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.199000,-1.535000,45.516800>}
box{<0,0,-0.203200><5.979900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.605400,-1.535000,45.923200>}
box{<0,0,-0.203200><6.386300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.011800,-1.535000,46.329600>}
box{<0,0,-0.203200><6.792700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.418200,-1.535000,46.736000>}
box{<0,0,-0.203200><7.199100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.824600,-1.535000,47.142400>}
box{<0,0,-0.203200><7.605500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.231000,-1.535000,47.548800>}
box{<0,0,-0.203200><8.011900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.637400,-1.535000,47.955200>}
box{<0,0,-0.203200><8.418300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.394900,-1.535000,48.361600>}
box{<0,0,-0.203200><1.175800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.855000,-1.535000,48.768000>}
box{<0,0,-0.203200><0.635900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.493200,-1.535000,49.174400>}
box{<0,0,-0.203200><0.274100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.258600,-1.535000,49.580800>}
box{<0,0,-0.203200><0.039500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,49.649300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,49.068900>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,60.003007,0> translate<1.219100,-1.535000,49.649300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.554100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,49.068900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,48.544100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<1.554100,-1.535000,49.068900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<2.078900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,48.544100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,48.172900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<2.078900,-1.535000,48.544100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<2.721800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,48.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,47.980800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<2.721800,-1.535000,48.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,47.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,47.980800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,47.980800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<4.181100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,47.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,48.172900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<4.181100,-1.535000,47.980800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.654000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.861700,-1.535000,6.502400>}
box{<0,0,-0.203200><2.207700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.654000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<4.898100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,48.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,48.544100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<4.898100,-1.535000,48.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,-29.991053,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.429300,-1.535000,1.219100>}
box{<0,0,-0.203200><62.468700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960700,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.429100,-1.535000,1.219200>}
box{<0,0,-0.203200><62.468400,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960700,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.224900,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.043800,-1.535000,48.361600>}
box{<0,0,-0.203200><4.818900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.224900,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,6.096000>}
box{<0,0,-0.203200><1.144900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.488700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<5.541000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,48.544100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,49.068900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,48.544100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.612500,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.777400,-1.535000,1.625600>}
box{<0,0,-0.203200><61.164900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.612500,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,19.287200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.920300,-1.535000,18.801800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<5.719200,-1.535000,19.287200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,34.527200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,19.287200>}
box{<0,0,-0.203200><15.240000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.719200,-1.535000,19.287200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.227200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,34.527200>}
box{<0,0,-0.203200><8.700000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.719200,-1.535000,34.527200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.752700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.227200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.719200,-1.535000,43.227200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.719200,-1.535000,43.752700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.920300,-1.535000,44.238100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<5.719200,-1.535000,43.752700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.764900,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.450200,-1.535000,48.768000>}
box{<0,0,-0.203200><4.685300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.764900,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.805900,-1.535000,52.790800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,52.531000>}
box{<0,0,-0.203200><0.367483,0.035000,0.203200> rotate<0,44.986006,0> translate<5.805900,-1.535000,52.790800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.805900,-1.535000,52.790800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.584000,-1.535000,52.790800>}
box{<0,0,-0.203200><60.778100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.805900,-1.535000,52.790800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.917200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,5.689600>}
box{<0,0,-0.203200><0.716400,0.035000,0.203200> rotate<0,0.000000,0> translate<5.917200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.920300,-1.535000,18.801800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.291800,-1.535000,18.430300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<5.920300,-1.535000,18.801800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.920300,-1.535000,44.238100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.460300,-1.535000,50.778100>}
box{<0,0,-0.203200><9.248957,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.920300,-1.535000,44.238100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.018900,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.371000,-1.535000,2.032000>}
box{<0,0,-0.203200><60.352100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.018900,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,49.068900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,49.711800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,49.068900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,52.531000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,51.888100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,52.531000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.126700,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.856600,-1.535000,49.174400>}
box{<0,0,-0.203200><4.729900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.126700,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.126700,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.263300,-1.535000,52.425600>}
box{<0,0,-0.203200><60.136600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.126700,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.214700,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,5.283200>}
box{<0,0,-0.203200><0.418900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.214700,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.273300,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.116500,-1.535000,2.438400>}
box{<0,0,-0.203200><59.843200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.273300,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.291800,-1.535000,18.430300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,18.088500>}
box{<0,0,-0.203200><0.483378,0.035000,0.203200> rotate<0,44.997030,0> translate<6.291800,-1.535000,18.430300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.361300,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.263000,-1.535000,49.580800>}
box{<0,0,-0.203200><4.901700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.361300,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.361400,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.028600,-1.535000,52.019200>}
box{<0,0,-0.203200><59.667200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.361400,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,49.711800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,50.428800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,49.711800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,51.888100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,51.171100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,51.888100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.442800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.642400,-1.535000,4.876800>}
box{<0,0,-0.203200><0.199600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.442800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.469900,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.919900,-1.535000,2.844800>}
box{<0,0,-0.203200><59.450000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.469900,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510700,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669400,-1.535000,49.987200>}
box{<0,0,-0.203200><5.158700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.510700,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510800,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.879200,-1.535000,51.612800>}
box{<0,0,-0.203200><59.368400,0.035000,0.203200> rotate<0,0.000000,0> translate<6.510800,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.551600,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.048800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.497200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.551600,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.578800,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.811000,-1.535000,3.251200>}
box{<0,0,-0.203200><59.232200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.578800,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.619600,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.075800,-1.535000,50.393600>}
box{<0,0,-0.203200><5.456200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.619600,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.619700,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.968900,-1.535000,51.206400>}
box{<0,0,-0.203200><6.349200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.619700,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,3.657600>}
box{<0,0,-0.203200><59.131700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.455200,-1.535000,4.064000>}
box{<0,0,-0.203200><0.826100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,50.428800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,51.171100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,51.171100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.482200,-1.535000,50.800000>}
box{<0,0,-0.203200><5.853100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,4.885600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,3.903600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<6.633600,-1.535000,4.885600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,6.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,4.885600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.633600,-1.535000,4.885600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,6.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,7.256300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.633600,-1.535000,6.274300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,17.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,16.603600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<6.633600,-1.535000,17.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,18.088500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.633600,-1.535000,17.585600>}
box{<0,0,-0.203200><0.502900,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.633600,-1.535000,17.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,3.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,3.903600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.615600,-1.535000,3.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,7.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,7.256300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.615600,-1.535000,7.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615600,-1.535000,16.603600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,16.603600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.615600,-1.535000,16.603600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,20.097000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,34.527200>}
box{<0,0,-0.203200><14.430200,0.035000,0.203200> rotate<0,90.000000,0> translate<8.360700,-1.535000,34.527200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,20.097000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.501400,-1.535000,19.956300>}
box{<0,0,-0.203200><0.198980,0.035000,0.203200> rotate<0,44.997030,0> translate<8.360700,-1.535000,20.097000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.412100,-1.535000,20.320000>}
box{<0,0,-0.203200><6.051400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.772800,-1.535000,20.726400>}
box{<0,0,-0.203200><1.412100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.366400,-1.535000,21.132800>}
box{<0,0,-0.203200><1.005700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,21.539200>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,21.945600>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,22.352000>}
box{<0,0,-0.203200><0.812900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.217700,-1.535000,22.758400>}
box{<0,0,-0.203200><0.857000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.624100,-1.535000,23.164800>}
box{<0,0,-0.203200><1.263400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.030500,-1.535000,23.571200>}
box{<0,0,-0.203200><1.669800,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,23.977600>}
box{<0,0,-0.203200><25.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,24.384000>}
box{<0,0,-0.203200><25.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,24.790400>}
box{<0,0,-0.203200><25.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.832400,-1.535000,25.196800>}
box{<0,0,-0.203200><20.471700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.426000,-1.535000,25.603200>}
box{<0,0,-0.203200><20.065300,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,26.009600>}
box{<0,0,-0.203200><19.862900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,26.416000>}
box{<0,0,-0.203200><19.862900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,26.822400>}
box{<0,0,-0.203200><19.862900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.258200,-1.535000,27.228800>}
box{<0,0,-0.203200><19.897500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,27.635200>}
box{<0,0,-0.203200><20.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,28.041600>}
box{<0,0,-0.203200><20.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,28.448000>}
box{<0,0,-0.203200><20.218500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.589100,-1.535000,28.854400>}
box{<0,0,-0.203200><3.228400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182700,-1.535000,29.260800>}
box{<0,0,-0.203200><2.822000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.983800,-1.535000,29.667200>}
box{<0,0,-0.203200><2.623100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,30.073600>}
box{<0,0,-0.203200><2.499300,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,30.480000>}
box{<0,0,-0.203200><2.499300,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.948200,-1.535000,30.886400>}
box{<0,0,-0.203200><2.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.116500,-1.535000,31.292800>}
box{<0,0,-0.203200><2.755800,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.502800,-1.535000,31.699200>}
box{<0,0,-0.203200><3.142100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,32.105600>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,32.512000>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,32.918400>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,33.324800>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,33.731200>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,34.137600>}
box{<0,0,-0.203200><3.718500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,34.527200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,42.942900>}
box{<0,0,-0.203200><8.415700,0.035000,0.203200> rotate<0,90.000000,0> translate<8.360700,-1.535000,42.942900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.265200,-1.535000,34.544000>}
box{<0,0,-0.203200><2.904500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.858800,-1.535000,34.950400>}
box{<0,0,-0.203200><2.498100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.452400,-1.535000,35.356800>}
box{<0,0,-0.203200><2.091700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,35.763200>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,36.169600>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,36.576000>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.671700,-1.535000,36.982400>}
box{<0,0,-0.203200><2.311000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.078100,-1.535000,37.388800>}
box{<0,0,-0.203200><2.717400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,37.795200>}
box{<0,0,-0.203200><15.138500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.536700,-1.535000,38.201600>}
box{<0,0,-0.203200><14.176000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.780800,-1.535000,38.608000>}
box{<0,0,-0.203200><13.420100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.429400,-1.535000,39.014400>}
box{<0,0,-0.203200><13.068700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.261100,-1.535000,39.420800>}
box{<0,0,-0.203200><12.900400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.213200,-1.535000,39.827200>}
box{<0,0,-0.203200><12.852500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.225800,-1.535000,40.233600>}
box{<0,0,-0.203200><12.865100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.394100,-1.535000,40.640000>}
box{<0,0,-0.203200><13.033400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.695300,-1.535000,41.046400>}
box{<0,0,-0.203200><13.334600,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,41.452800>}
box{<0,0,-0.203200><13.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,41.859200>}
box{<0,0,-0.203200><13.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,42.265600>}
box{<0,0,-0.203200><13.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,42.672000>}
box{<0,0,-0.203200><13.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.360700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.360700,-1.535000,42.942900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.127000,-1.535000,48.709200>}
box{<0,0,-0.203200><8.154780,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.360700,-1.535000,42.942900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.496200,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,43.078400>}
box{<0,0,-0.203200><13.733000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.496200,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.501400,-1.535000,19.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,19.956300>}
box{<0,0,-0.203200><0.502900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.501400,-1.535000,19.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.902600,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.877300,-1.535000,43.484800>}
box{<0,0,-0.203200><12.974700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.902600,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,3.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.359900,-1.535000,4.259200>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.004300,-1.535000,3.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,7.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.359900,-1.535000,6.900700>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<9.004300,-1.535000,7.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,16.603600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,17.585600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.004300,-1.535000,16.603600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.004300,-1.535000,19.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,18.974300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<9.004300,-1.535000,19.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.047000,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.382900,-1.535000,19.913600>}
box{<0,0,-0.203200><2.335900,0.035000,0.203200> rotate<0,0.000000,0> translate<9.047000,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.063100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,16.662400>}
box{<0,0,-0.203200><1.736100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.063100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.164700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.265200,-1.535000,4.064000>}
box{<0,0,-0.203200><2.100500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.164700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,21.325600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.155600,-1.535000,20.343600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<9.173600,-1.535000,21.325600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,22.714300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,21.325600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.173600,-1.535000,21.325600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.173600,-1.535000,22.714300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.155600,-1.535000,23.696300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.173600,-1.535000,22.714300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.309000,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.470900,-1.535000,43.891200>}
box{<0,0,-0.203200><12.161900,0.035000,0.203200> rotate<0,0.000000,0> translate<9.309000,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.351800,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.078100,-1.535000,6.908800>}
box{<0,0,-0.203200><1.726300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.351800,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.359900,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.070000,-1.535000,4.259200>}
box{<0,0,-0.203200><1.710100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.359900,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.359900,-1.535000,6.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.070000,-1.535000,6.900700>}
box{<0,0,-0.203200><1.710100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.359900,-1.535000,6.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.453400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.976500,-1.535000,19.507200>}
box{<0,0,-0.203200><1.523100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.453400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.469500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,17.068800>}
box{<0,0,-0.203200><1.329700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.469500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.715400,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.120600,-1.535000,44.297600>}
box{<0,0,-0.203200><11.405200,0.035000,0.203200> rotate<0,0.000000,0> translate<9.715400,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.859800,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.570100,-1.535000,19.100800>}
box{<0,0,-0.203200><0.710300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.859800,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.875900,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.554000,-1.535000,17.475200>}
box{<0,0,-0.203200><0.678100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.875900,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,17.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,18.974300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<9.986300,-1.535000,18.974300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,17.881600>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.986300,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,18.288000>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.986300,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.986300,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,18.694400>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<9.986300,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.121800,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,44.704000>}
box{<0,0,-0.203200><10.837400,0.035000,0.203200> rotate<0,0.000000,0> translate<10.121800,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.155600,-1.535000,20.343600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,20.343600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<10.155600,-1.535000,20.343600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.155600,-1.535000,23.696300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,23.696300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<10.155600,-1.535000,23.696300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,17.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,17.230000>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<10.443600,-1.535000,17.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,18.974300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,17.585600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.443600,-1.535000,17.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,18.974300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,19.956300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.443600,-1.535000,18.974300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,35.365600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,34.383600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<10.443600,-1.535000,35.365600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,36.754300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,35.365600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.443600,-1.535000,35.365600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.443600,-1.535000,36.754300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,37.736300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.443600,-1.535000,36.754300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.528200,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,45.110400>}
box{<0,0,-0.203200><10.431000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.528200,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,14.817200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.000300,-1.535000,14.331800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<10.799200,-1.535000,14.817200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,15.342700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,14.817200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.799200,-1.535000,14.817200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,17.230000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.799200,-1.535000,15.342700>}
box{<0,0,-0.203200><1.887300,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.799200,-1.535000,15.342700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,29.966300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130700,-1.535000,29.312800>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<10.860000,-1.535000,29.966300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,30.673600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,29.966300>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.860000,-1.535000,29.966300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.860000,-1.535000,30.673600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130700,-1.535000,31.327100>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<10.860000,-1.535000,30.673600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.934600,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,45.516800>}
box{<0,0,-0.203200><10.024600,0.035000,0.203200> rotate<0,0.000000,0> translate<10.934600,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.000300,-1.535000,14.331800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.380300,-1.535000,12.951800>}
box{<0,0,-0.203200><1.951615,0.035000,0.203200> rotate<0,44.997030,0> translate<11.000300,-1.535000,14.331800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.070000,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,3.903600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<11.070000,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.070000,-1.535000,6.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,7.256300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.070000,-1.535000,6.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130700,-1.535000,29.312800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.630800,-1.535000,28.812700>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<11.130700,-1.535000,29.312800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130700,-1.535000,31.327100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.630800,-1.535000,31.827200>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.130700,-1.535000,31.327100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.341000,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.236800,-1.535000,45.923200>}
box{<0,0,-0.203200><4.895800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.341000,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,3.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,3.903600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.425600,-1.535000,3.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,7.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,7.256300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.425600,-1.535000,7.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,19.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,19.956300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.425600,-1.535000,19.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928500,-1.535000,34.383600>}
box{<0,0,-0.203200><0.502900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.425600,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.425600,-1.535000,37.736300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,37.736300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.425600,-1.535000,37.736300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,20.343600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.899900,-1.535000,20.699200>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.544300,-1.535000,20.343600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,23.696300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.899900,-1.535000,23.340700>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<11.544300,-1.535000,23.696300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.630800,-1.535000,28.812700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.284300,-1.535000,28.542000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<11.630800,-1.535000,28.812700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.630800,-1.535000,31.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,32.012900>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,-22.494877,0> translate<11.630800,-1.535000,31.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669400,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.730500,-1.535000,23.571200>}
box{<0,0,-0.203200><11.061100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.669400,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.747400,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.792000,-1.535000,46.329600>}
box{<0,0,-0.203200><4.044600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.747400,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.899900,-1.535000,20.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.032900,-1.535000,20.699200>}
box{<0,0,-0.203200><2.133000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.899900,-1.535000,20.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.899900,-1.535000,23.340700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.317200,-1.535000,23.340700>}
box{<0,0,-0.203200><2.417300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.899900,-1.535000,23.340700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928500,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,34.232900>}
box{<0,0,-0.203200><0.213122,0.035000,0.203200> rotate<0,44.997030,0> translate<11.928500,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,34.232900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.079200,-1.535000,32.012900>}
box{<0,0,-0.203200><2.220000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.079200,-1.535000,32.012900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.153800,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.546500,-1.535000,46.736000>}
box{<0,0,-0.203200><3.392700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.153800,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.284300,-1.535000,28.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.515600,-1.535000,28.542000>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,0.000000,0> translate<12.284300,-1.535000,28.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.380300,-1.535000,12.951800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.751800,-1.535000,12.580300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<12.380300,-1.535000,12.951800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.460300,-1.535000,50.778100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831800,-1.535000,51.149600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.460300,-1.535000,50.778100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.560200,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.142400>}
box{<0,0,-0.203200><2.823700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.560200,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.751800,-1.535000,12.580300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.237200,-1.535000,12.379200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<12.751800,-1.535000,12.580300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,3.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.169900,-1.535000,4.259200>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.814300,-1.535000,3.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,7.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.169900,-1.535000,6.900700>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<12.814300,-1.535000,7.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,19.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.661700,-1.535000,19.108800>}
box{<0,0,-0.203200><1.198475,0.035000,0.203200> rotate<0,45.000410,0> translate<12.814300,-1.535000,19.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.814300,-1.535000,37.736300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796300,-1.535000,36.754300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<12.814300,-1.535000,37.736300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831800,-1.535000,51.149600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317200,-1.535000,51.350700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<12.831800,-1.535000,51.149600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.857000,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.202500,-1.535000,19.913600>}
box{<0,0,-0.203200><1.345500,0.035000,0.203200> rotate<0,0.000000,0> translate<12.857000,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.966600,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.548800>}
box{<0,0,-0.203200><2.417300,0.035000,0.203200> rotate<0,0.000000,0> translate<12.966600,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.974700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,4.064000>}
box{<0,0,-0.203200><52.786100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.974700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.161800,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,6.908800>}
box{<0,0,-0.203200><1.901800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.161800,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.161800,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,37.388800>}
box{<0,0,-0.203200><10.337400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.161800,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.169900,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.237200,-1.535000,4.259200>}
box{<0,0,-0.203200><16.067300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.169900,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.169900,-1.535000,6.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,6.900700>}
box{<0,0,-0.203200><1.893700,0.035000,0.203200> rotate<0,0.000000,0> translate<13.169900,-1.535000,6.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.237200,-1.535000,12.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.049600,-1.535000,12.379200>}
box{<0,0,-0.203200><0.812400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.237200,-1.535000,12.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.263400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.826800,-1.535000,19.507200>}
box{<0,0,-0.203200><0.563400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.263400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317200,-1.535000,51.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.447200,-1.535000,51.350700>}
box{<0,0,-0.203200><20.130000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.317200,-1.535000,51.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.373000,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.427000,-1.535000,47.955200>}
box{<0,0,-0.203200><2.054000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.373000,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.568200,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.371800,-1.535000,36.982400>}
box{<0,0,-0.203200><9.803600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.568200,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.661700,-1.535000,19.108800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.848400,-1.535000,19.559500>}
box{<0,0,-0.203200><0.487840,0.035000,0.203200> rotate<0,-67.494032,0> translate<13.661700,-1.535000,19.108800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.779400,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.595400,-1.535000,48.361600>}
box{<0,0,-0.203200><1.816000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.779400,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796300,-1.535000,36.251400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796300,-1.535000,36.754300>}
box{<0,0,-0.203200><0.502900,0.035000,0.203200> rotate<0,90.000000,0> translate<13.796300,-1.535000,36.754300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796300,-1.535000,36.251400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.519600,-1.535000,35.528100>}
box{<0,0,-0.203200><1.022901,0.035000,0.203200> rotate<0,44.997030,0> translate<13.796300,-1.535000,36.251400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,36.576000>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.796300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.848400,-1.535000,19.559500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.320000,-1.535000,20.031100>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.848400,-1.535000,19.559500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.878100,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,36.169600>}
box{<0,0,-0.203200><9.265500,0.035000,0.203200> rotate<0,0.000000,0> translate<13.878100,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.032900,-1.535000,20.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.589500,-1.535000,20.142700>}
box{<0,0,-0.203200><0.787081,0.035000,0.203200> rotate<0,44.991883,0> translate<14.032900,-1.535000,20.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.049600,-1.535000,12.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.320000,-1.535000,12.108800>}
box{<0,0,-0.203200><0.382403,0.035000,0.203200> rotate<0,44.997030,0> translate<14.049600,-1.535000,12.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.127000,-1.535000,48.709200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851000,-1.535000,48.709200>}
box{<0,0,-0.203200><1.724000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.127000,-1.535000,48.709200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.284500,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,35.763200>}
box{<0,0,-0.203200><8.859100,0.035000,0.203200> rotate<0,0.000000,0> translate<14.284500,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.317200,-1.535000,23.340700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.842700,-1.535000,23.340700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<14.317200,-1.535000,23.340700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.320000,-1.535000,12.108800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.936100,-1.535000,11.853600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<14.320000,-1.535000,12.108800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.320000,-1.535000,20.031100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.589500,-1.535000,20.142700>}
box{<0,0,-0.203200><0.291693,0.035000,0.203200> rotate<0,-22.492971,0> translate<14.320000,-1.535000,20.031100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.515600,-1.535000,28.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.169100,-1.535000,28.812700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<14.515600,-1.535000,28.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.519600,-1.535000,35.528100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,35.042700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<14.519600,-1.535000,35.528100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.590600,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.152400,-1.535000,35.356800>}
box{<0,0,-0.203200><8.561800,0.035000,0.203200> rotate<0,0.000000,0> translate<14.590600,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,32.012900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,34.517200>}
box{<0,0,-0.203200><2.504300,0.035000,0.203200> rotate<0,90.000000,0> translate<14.720700,-1.535000,34.517200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,32.012900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.169100,-1.535000,31.827200>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,22.494877,0> translate<14.720700,-1.535000,32.012900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.237800,-1.535000,32.105600>}
box{<0,0,-0.203200><1.517100,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.644200,-1.535000,32.512000>}
box{<0,0,-0.203200><1.923500,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.317600,-1.535000,32.918400>}
box{<0,0,-0.203200><2.596900,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.729300,-1.535000,33.324800>}
box{<0,0,-0.203200><14.008600,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.063400,-1.535000,33.731200>}
box{<0,0,-0.203200><14.342700,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.469800,-1.535000,34.137600>}
box{<0,0,-0.203200><14.749100,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,34.517200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,35.042700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<14.720700,-1.535000,35.042700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.965200,-1.535000,34.544000>}
box{<0,0,-0.203200><9.244500,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.720700,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.558800,-1.535000,34.950400>}
box{<0,0,-0.203200><8.838100,0.035000,0.203200> rotate<0,0.000000,0> translate<14.720700,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.842700,-1.535000,23.340700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.328100,-1.535000,23.139600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<14.842700,-1.535000,23.340700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.936100,-1.535000,11.853600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.009400,-1.535000,11.853600>}
box{<0,0,-0.203200><1.073300,0.035000,0.203200> rotate<0,0.000000,0> translate<14.936100,-1.535000,11.853600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,8.154300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,6.900700>}
box{<0,0,-0.203200><1.253600,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.063600,-1.535000,6.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.063600,-1.535000,8.154300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.045600,-1.535000,9.136300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.063600,-1.535000,8.154300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.169100,-1.535000,28.812700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.335500,-1.535000,28.979200>}
box{<0,0,-0.203200><0.235396,0.035000,0.203200> rotate<0,-45.014240,0> translate<15.169100,-1.535000,28.812700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.169100,-1.535000,31.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.375500,-1.535000,31.620700>}
box{<0,0,-0.203200><0.291964,0.035000,0.203200> rotate<0,45.010906,0> translate<15.169100,-1.535000,31.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.210700,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,28.854400>}
box{<0,0,-0.203200><13.368500,0.035000,0.203200> rotate<0,0.000000,0> translate<15.210700,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.267300,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.324100,-1.535000,23.164800>}
box{<0,0,-0.203200><7.056800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.267300,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.297100,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.831400,-1.535000,31.699200>}
box{<0,0,-0.203200><0.534300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.297100,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.328100,-1.535000,23.139600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.848100,-1.535000,21.619600>}
box{<0,0,-0.203200><2.149605,0.035000,0.203200> rotate<0,44.997030,0> translate<15.328100,-1.535000,23.139600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.335500,-1.535000,28.979200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.562700,-1.535000,28.979200>}
box{<0,0,-0.203200><1.227200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.335500,-1.535000,28.979200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.375500,-1.535000,31.620700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.752900,-1.535000,31.620700>}
box{<0,0,-0.203200><0.377400,0.035000,0.203200> rotate<0,0.000000,0> translate<15.375500,-1.535000,31.620700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.128700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.660400,-1.535000,46.461200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<15.383900,-1.535000,47.128700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.851200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.128700>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.383900,-1.535000,47.128700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.383900,-1.535000,47.851200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.660400,-1.535000,48.518700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<15.383900,-1.535000,47.851200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.660400,-1.535000,46.461200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.171200,-1.535000,45.950400>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<15.660400,-1.535000,46.461200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.660400,-1.535000,48.518700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851000,-1.535000,48.709200>}
box{<0,0,-0.203200><0.269478,0.035000,0.203200> rotate<0,-44.981997,0> translate<15.660400,-1.535000,48.518700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.709300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.917700,-1.535000,22.758400>}
box{<0,0,-0.203200><6.208400,0.035000,0.203200> rotate<0,0.000000,0> translate<15.709300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.752900,-1.535000,31.620700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.861800,-1.535000,32.729600>}
box{<0,0,-0.203200><1.568221,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.752900,-1.535000,31.620700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773200,-1.535000,10.616500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.028400,-1.535000,10.000400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<15.773200,-1.535000,10.616500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773200,-1.535000,11.283400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773200,-1.535000,10.616500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.773200,-1.535000,10.616500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.773200,-1.535000,11.283400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.009400,-1.535000,11.853600>}
box{<0,0,-0.203200><0.617186,0.035000,0.203200> rotate<0,-67.494222,0> translate<15.773200,-1.535000,11.283400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.028400,-1.535000,10.000400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500000,-1.535000,9.528800>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<16.028400,-1.535000,10.000400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.045600,-1.535000,9.136300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.434300,-1.535000,9.136300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.045600,-1.535000,9.136300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.115700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,22.352000>}
box{<0,0,-0.203200><5.757900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.115700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.171200,-1.535000,45.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.838700,-1.535000,45.673900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<16.171200,-1.535000,45.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500000,-1.535000,9.528800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.116100,-1.535000,9.273600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<16.500000,-1.535000,9.528800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.522100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,21.945600>}
box{<0,0,-0.203200><5.351500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.522100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.562700,-1.535000,28.979200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.048100,-1.535000,29.180300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<16.562700,-1.535000,28.979200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.838700,-1.535000,45.673900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.561200,-1.535000,45.673900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.838700,-1.535000,45.673900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.848100,-1.535000,21.619600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.219600,-1.535000,21.248100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<16.848100,-1.535000,21.619600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.861800,-1.535000,32.729600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.347200,-1.535000,32.930700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<16.861800,-1.535000,32.729600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.928500,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,21.539200>}
box{<0,0,-0.203200><4.945100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.928500,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.048100,-1.535000,29.180300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.419600,-1.535000,29.551800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.048100,-1.535000,29.180300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.116100,-1.535000,9.273600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.103800,-1.535000,9.273600>}
box{<0,0,-0.203200><1.987700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.116100,-1.535000,9.273600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.128600,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,29.260800>}
box{<0,0,-0.203200><11.450600,0.035000,0.203200> rotate<0,0.000000,0> translate<17.128600,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.219600,-1.535000,21.248100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.762700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<17.219600,-1.535000,21.248100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.267400,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.066400,-1.535000,21.132800>}
box{<0,0,-0.203200><4.799000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.267400,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.347200,-1.535000,32.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.872700,-1.535000,32.930700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.347200,-1.535000,32.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.419600,-1.535000,29.551800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157000,-1.535000,30.289200>}
box{<0,0,-0.203200><1.042841,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.419600,-1.535000,29.551800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.080400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.762700>}
box{<0,0,-0.203200><0.682300,0.035000,0.203200> rotate<0,90.000000,0> translate<17.420700,-1.535000,20.762700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.080400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.539900,-1.535000,20.031100>}
box{<0,0,-0.203200><0.128993,0.035000,0.203200> rotate<0,22.468045,0> translate<17.420700,-1.535000,20.080400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,20.320000>}
box{<0,0,-0.203200><4.758500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.420700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.420700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,20.726400>}
box{<0,0,-0.203200><4.758500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.420700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.434300,-1.535000,9.136300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.799900,-1.535000,8.770700>}
box{<0,0,-0.203200><0.517036,0.035000,0.203200> rotate<0,44.997030,0> translate<17.434300,-1.535000,9.136300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.535000,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,29.667200>}
box{<0,0,-0.203200><11.044200,0.035000,0.203200> rotate<0,0.000000,0> translate<17.535000,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.539900,-1.535000,20.031100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.640300,-1.535000,19.930700>}
box{<0,0,-0.203200><0.141987,0.035000,0.203200> rotate<0,44.997030,0> translate<17.539900,-1.535000,20.031100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.561200,-1.535000,45.673900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.228700,-1.535000,45.950400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<17.561200,-1.535000,45.673900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.629800,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.373000,-1.535000,8.940800>}
box{<0,0,-0.203200><1.743200,0.035000,0.203200> rotate<0,0.000000,0> translate<17.629800,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.640300,-1.535000,19.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447200,-1.535000,19.930700>}
box{<0,0,-0.203200><1.806900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.640300,-1.535000,19.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.799900,-1.535000,8.770700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.202900,-1.535000,8.770700>}
box{<0,0,-0.203200><1.403000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.799900,-1.535000,8.770700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.872700,-1.535000,32.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.490100,-1.535000,32.930700>}
box{<0,0,-0.203200><0.617400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.872700,-1.535000,32.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.941400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.705600,-1.535000,30.073600>}
box{<0,0,-0.203200><0.764200,0.035000,0.203200> rotate<0,0.000000,0> translate<17.941400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.157000,-1.535000,30.289200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.490100,-1.535000,30.289200>}
box{<0,0,-0.203200><0.333100,0.035000,0.203200> rotate<0,0.000000,0> translate<18.157000,-1.535000,30.289200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.163000,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,45.923200>}
box{<0,0,-0.203200><2.796200,0.035000,0.203200> rotate<0,0.000000,0> translate<18.163000,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.228700,-1.535000,45.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.447400,-1.535000,46.169200>}
box{<0,0,-0.203200><0.309359,0.035000,0.203200> rotate<0,-45.010125,0> translate<18.228700,-1.535000,45.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.447400,-1.535000,46.169200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,46.169200>}
box{<0,0,-0.203200><2.511800,0.035000,0.203200> rotate<0,0.000000,0> translate<18.447400,-1.535000,46.169200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.490100,-1.535000,30.289200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.845600,-1.535000,29.933600>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,45.005087,0> translate<18.490100,-1.535000,30.289200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.490100,-1.535000,32.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.845600,-1.535000,33.286300>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-45.005087,0> translate<18.490100,-1.535000,32.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.845600,-1.535000,29.933600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.234300,-1.535000,29.933600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<18.845600,-1.535000,29.933600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.845600,-1.535000,33.286300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.234300,-1.535000,33.286300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<18.845600,-1.535000,33.286300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.103800,-1.535000,9.273600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.579200,-1.535000,9.470600>}
box{<0,0,-0.203200><0.514601,0.035000,0.203200> rotate<0,-22.507039,0> translate<19.103800,-1.535000,9.273600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.202900,-1.535000,8.770700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.579200,-1.535000,9.147000>}
box{<0,0,-0.203200><0.532169,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.202900,-1.535000,8.770700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.281400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.579200,-1.535000,9.347200>}
box{<0,0,-0.203200><0.297800,0.035000,0.203200> rotate<0,0.000000,0> translate<19.281400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447200,-1.535000,19.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.972700,-1.535000,19.930700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.447200,-1.535000,19.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.579200,-1.535000,9.470600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.579200,-1.535000,9.147000>}
box{<0,0,-0.203200><0.323600,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.579200,-1.535000,9.147000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.972700,-1.535000,19.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.458100,-1.535000,19.729600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<19.972700,-1.535000,19.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.014000,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.313200,-1.535000,19.913600>}
box{<0,0,-0.203200><2.299200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.014000,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.234300,-1.535000,29.933600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.589800,-1.535000,30.289200>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-45.005087,0> translate<20.234300,-1.535000,29.933600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.234300,-1.535000,33.286300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.589800,-1.535000,32.930700>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,45.005087,0> translate<20.234300,-1.535000,33.286300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.374200,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.955600,-1.535000,30.073600>}
box{<0,0,-0.203200><3.581400,0.035000,0.203200> rotate<0,0.000000,0> translate<20.374200,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.458100,-1.535000,19.729600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.631600,-1.535000,18.556000>}
box{<0,0,-0.203200><1.659650,0.035000,0.203200> rotate<0,44.999471,0> translate<20.458100,-1.535000,19.729600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.589800,-1.535000,30.289200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.740000,-1.535000,30.289200>}
box{<0,0,-0.203200><3.150200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.589800,-1.535000,30.289200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.589800,-1.535000,32.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.800000,-1.535000,32.930700>}
box{<0,0,-0.203200><3.210200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.589800,-1.535000,32.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.680500,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.624900,-1.535000,19.507200>}
box{<0,0,-0.203200><1.944400,0.035000,0.203200> rotate<0,0.000000,0> translate<20.680500,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,44.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.160300,-1.535000,44.201800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<20.959200,-1.535000,44.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,46.169200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959200,-1.535000,44.687200>}
box{<0,0,-0.203200><1.482000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.959200,-1.535000,44.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.086900,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.031400,-1.535000,19.100800>}
box{<0,0,-0.203200><1.944500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.086900,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.160300,-1.535000,44.201800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.531800,-1.535000,43.830300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<21.160300,-1.535000,44.201800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.213200,-1.535000,39.536500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468400,-1.535000,38.920400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<21.213200,-1.535000,39.536500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.213200,-1.535000,40.203400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.213200,-1.535000,39.536500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.213200,-1.535000,39.536500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.213200,-1.535000,40.203400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468400,-1.535000,40.819500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<21.213200,-1.535000,40.203400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.343700,-1.535000,14.923900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.447000,-1.535000,14.820700>}
box{<0,0,-0.203200><0.146018,0.035000,0.203200> rotate<0,44.969286,0> translate<21.343700,-1.535000,14.923900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.343700,-1.535000,14.923900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.941200,-1.535000,14.923900>}
box{<0,0,-0.203200><0.597500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.343700,-1.535000,14.923900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.447000,-1.535000,14.820700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.562700,-1.535000,14.820700>}
box{<0,0,-0.203200><8.115700,0.035000,0.203200> rotate<0,0.000000,0> translate<21.447000,-1.535000,14.820700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468400,-1.535000,38.920400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940000,-1.535000,38.448800>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<21.468400,-1.535000,38.920400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468400,-1.535000,40.819500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940000,-1.535000,41.291100>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.468400,-1.535000,40.819500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.493300,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.437800,-1.535000,18.694400>}
box{<0,0,-0.203200><1.944500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.493300,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.531800,-1.535000,43.830300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,43.132900>}
box{<0,0,-0.203200><0.986273,0.035000,0.203200> rotate<0,44.997030,0> translate<21.531800,-1.535000,43.830300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.631600,-1.535000,18.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.941200,-1.535000,18.556000>}
box{<0,0,-0.203200><0.309600,0.035000,0.203200> rotate<0,0.000000,0> translate<21.631600,-1.535000,18.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,21.325600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,21.020000>}
box{<0,0,-0.203200><0.432184,0.035000,0.203200> rotate<0,44.997030,0> translate<21.873600,-1.535000,21.325600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,22.714300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,21.325600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.873600,-1.535000,21.325600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873600,-1.535000,22.714300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.855600,-1.535000,23.696300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.873600,-1.535000,22.714300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940000,-1.535000,38.448800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.556100,-1.535000,38.193600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<21.940000,-1.535000,38.448800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940000,-1.535000,41.291100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,41.410900>}
box{<0,0,-0.203200><0.313031,0.035000,0.203200> rotate<0,-22.500111,0> translate<21.940000,-1.535000,41.291100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.941200,-1.535000,14.923900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.608700,-1.535000,15.200400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<21.941200,-1.535000,14.923900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.941200,-1.535000,18.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.608700,-1.535000,18.279500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<21.941200,-1.535000,18.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,20.237200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.380300,-1.535000,19.751800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<22.179200,-1.535000,20.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,21.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.179200,-1.535000,20.237200>}
box{<0,0,-0.203200><0.782800,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.179200,-1.535000,20.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.213700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.254800,-1.535000,15.036800>}
box{<0,0,-0.203200><1.041100,0.035000,0.203200> rotate<0,0.000000,0> translate<22.213700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,43.132900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.229200,-1.535000,41.410900>}
box{<0,0,-0.203200><1.722000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.229200,-1.535000,41.410900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.380300,-1.535000,19.751800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.751800,-1.535000,19.380300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<22.380300,-1.535000,19.751800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.556100,-1.535000,38.193600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.358500,-1.535000,38.193600>}
box{<0,0,-0.203200><0.802400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.556100,-1.535000,38.193600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.588200,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.099800,-1.535000,18.288000>}
box{<0,0,-0.203200><0.511600,0.035000,0.203200> rotate<0,0.000000,0> translate<22.588200,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.608700,-1.535000,15.200400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.850000,-1.535000,15.441700>}
box{<0,0,-0.203200><0.341250,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.608700,-1.535000,15.200400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.608700,-1.535000,18.279500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.850000,-1.535000,18.038200>}
box{<0,0,-0.203200><0.341250,0.035000,0.203200> rotate<0,44.997030,0> translate<22.608700,-1.535000,18.279500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.751800,-1.535000,19.380300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.751900,-1.535000,19.380300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<22.751800,-1.535000,19.380300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.751900,-1.535000,19.380300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.576200,-1.535000,18.556000>}
box{<0,0,-0.203200><1.165736,0.035000,0.203200> rotate<0,44.997030,0> translate<22.751900,-1.535000,19.380300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.850000,-1.535000,15.441700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.367700,-1.535000,14.923900>}
box{<0,0,-0.203200><0.732209,0.035000,0.203200> rotate<0,45.002563,0> translate<22.850000,-1.535000,15.441700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.850000,-1.535000,18.038200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.367700,-1.535000,18.556000>}
box{<0,0,-0.203200><0.732209,0.035000,0.203200> rotate<0,-45.002563,0> translate<22.850000,-1.535000,18.038200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.855600,-1.535000,23.696300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.244300,-1.535000,23.696300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.855600,-1.535000,23.696300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,35.365600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,34.383600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<23.143600,-1.535000,35.365600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,36.754300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,35.365600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.143600,-1.535000,35.365600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.143600,-1.535000,36.754300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,37.109800>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<23.143600,-1.535000,36.754300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.358500,-1.535000,38.193600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,38.052900>}
box{<0,0,-0.203200><0.198980,0.035000,0.203200> rotate<0,44.997030,0> translate<23.358500,-1.535000,38.193600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.367700,-1.535000,14.923900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.872200,-1.535000,14.923900>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.367700,-1.535000,14.923900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.367700,-1.535000,18.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.576200,-1.535000,18.556000>}
box{<0,0,-0.203200><0.208500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.367700,-1.535000,18.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.431300,-1.535000,48.709200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,48.184300>}
box{<0,0,-0.203200><0.742391,0.035000,0.203200> rotate<0,44.991573,0> translate<23.431300,-1.535000,48.709200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.431300,-1.535000,48.709200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.162900,-1.535000,48.709200>}
box{<0,0,-0.203200><9.731600,0.035000,0.203200> rotate<0,0.000000,0> translate<23.431300,-1.535000,48.709200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,38.052900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.499200,-1.535000,37.109800>}
box{<0,0,-0.203200><0.943100,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.499200,-1.535000,37.109800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,45.497000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,46.440100>}
box{<0,0,-0.203200><0.943100,0.035000,0.203200> rotate<0,90.000000,0> translate<23.600700,-1.535000,46.440100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,45.497000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.077000,-1.535000,45.020700>}
box{<0,0,-0.203200><0.673590,0.035000,0.203200> rotate<0,44.997030,0> translate<23.600700,-1.535000,45.497000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.986700,-1.535000,45.516800>}
box{<0,0,-0.203200><14.386000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.600700,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.176000,-1.535000,45.923200>}
box{<0,0,-0.203200><10.575300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.600700,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.769600,-1.535000,46.329600>}
box{<0,0,-0.203200><10.168900,0.035000,0.203200> rotate<0,0.000000,0> translate<23.600700,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.600700,-1.535000,46.440100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,46.795600>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<23.600700,-1.535000,46.440100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.740000,-1.535000,30.289200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,29.903600>}
box{<0,0,-0.203200><0.545321,0.035000,0.203200> rotate<0,44.997030,0> translate<23.740000,-1.535000,30.289200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.779000,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.481000,-1.535000,48.361600>}
box{<0,0,-0.203200><9.702000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.779000,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.800000,-1.535000,32.930700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,33.256300>}
box{<0,0,-0.203200><0.460468,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.800000,-1.535000,32.930700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.896600,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.363200,-1.535000,46.736000>}
box{<0,0,-0.203200><9.466600,0.035000,0.203200> rotate<0,0.000000,0> translate<23.896600,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,46.795600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,48.184300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<23.956300,-1.535000,48.184300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,47.142400>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.956300,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,47.548800>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.956300,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.956300,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,47.955200>}
box{<0,0,-0.203200><9.347300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.956300,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.987300,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.492500,-1.535000,45.110400>}
box{<0,0,-0.203200><14.505200,0.035000,0.203200> rotate<0,0.000000,0> translate<23.987300,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.077000,-1.535000,45.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.762700,-1.535000,45.020700>}
box{<0,0,-0.203200><3.685700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.077000,-1.535000,45.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,29.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,29.903600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.125600,-1.535000,29.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,33.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,33.256300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.125600,-1.535000,33.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.125600,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,34.383600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.125600,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.244300,-1.535000,23.696300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,22.714300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<24.244300,-1.535000,23.696300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.369400,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.503400,-1.535000,23.571200>}
box{<0,0,-0.203200><9.134000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.369400,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.775800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.443700,-1.535000,23.164800>}
box{<0,0,-0.203200><2.667900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.775800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,41.410900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,42.379200>}
box{<0,0,-0.203200><0.968300,0.035000,0.203200> rotate<0,90.000000,0> translate<24.870700,-1.535000,42.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,41.410900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.159900,-1.535000,41.291100>}
box{<0,0,-0.203200><0.313031,0.035000,0.203200> rotate<0,22.500111,0> translate<24.870700,-1.535000,41.410900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,41.452800>}
box{<0,0,-0.203200><2.082900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.870700,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.978600,-1.535000,41.859200>}
box{<0,0,-0.203200><2.107900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.870700,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.066600,-1.535000,42.265600>}
box{<0,0,-0.203200><2.195900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.870700,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870700,-1.535000,42.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953000,-1.535000,42.379200>}
box{<0,0,-0.203200><2.082300,0.035000,0.203200> rotate<0,0.000000,0> translate<24.870700,-1.535000,42.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.872200,-1.535000,14.923900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.367500,-1.535000,15.419200>}
box{<0,0,-0.203200><0.700460,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.872200,-1.535000,14.923900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.884100,-1.535000,20.983500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,21.325600>}
box{<0,0,-0.203200><0.483873,0.035000,0.203200> rotate<0,-44.988658,0> translate<24.884100,-1.535000,20.983500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.884100,-1.535000,20.983500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.267000,-1.535000,20.600700>}
box{<0,0,-0.203200><0.541432,0.035000,0.203200> rotate<0,44.989548,0> translate<24.884100,-1.535000,20.983500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.985100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.795300,-1.535000,15.036800>}
box{<0,0,-0.203200><8.810200,0.035000,0.203200> rotate<0,0.000000,0> translate<24.985100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.033400,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.939700,-1.535000,21.132800>}
box{<0,0,-0.203200><1.906300,0.035000,0.203200> rotate<0,0.000000,0> translate<25.033400,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.141300,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.192400,-1.535000,20.726400>}
box{<0,0,-0.203200><2.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<25.141300,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.159900,-1.535000,41.291100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.631500,-1.535000,40.819500>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,44.997030,0> translate<25.159900,-1.535000,41.291100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.182200,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.043900,-1.535000,22.758400>}
box{<0,0,-0.203200><1.861700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.182200,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,21.325600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,22.714300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<25.226300,-1.535000,22.714300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,21.539200>}
box{<0,0,-0.203200><1.566900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.226300,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,21.945600>}
box{<0,0,-0.203200><1.566900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.226300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.226300,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.875500,-1.535000,22.352000>}
box{<0,0,-0.203200><1.649200,0.035000,0.203200> rotate<0,0.000000,0> translate<25.226300,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.267000,-1.535000,20.600700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.318200,-1.535000,20.600700>}
box{<0,0,-0.203200><2.051200,0.035000,0.203200> rotate<0,0.000000,0> translate<25.267000,-1.535000,20.600700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.367500,-1.535000,15.419200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.419600,-1.535000,15.419200>}
box{<0,0,-0.203200><2.052100,0.035000,0.203200> rotate<0,0.000000,0> translate<25.367500,-1.535000,15.419200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.404600,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,41.046400>}
box{<0,0,-0.203200><1.549000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.404600,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,29.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,30.885600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.514300,-1.535000,29.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,33.256300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,32.274300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<25.514300,-1.535000,33.256300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.514300,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,35.365600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.514300,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.631500,-1.535000,40.819500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.886700,-1.535000,40.203400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<25.631500,-1.535000,40.819500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.674700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.876200,-1.535000,34.544000>}
box{<0,0,-0.203200><4.201500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.674700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.684300,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,30.073600>}
box{<0,0,-0.203200><2.894900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.684300,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.705900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,40.640000>}
box{<0,0,-0.203200><1.247700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.705900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.847000,-1.535000,39.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.886700,-1.535000,39.536500>}
box{<0,0,-0.203200><0.103700,0.035000,0.203200> rotate<0,-67.486184,0> translate<25.847000,-1.535000,39.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.847000,-1.535000,39.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.939600,-1.535000,39.348100>}
box{<0,0,-0.203200><0.130956,0.035000,0.203200> rotate<0,44.997030,0> translate<25.847000,-1.535000,39.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.852200,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,32.918400>}
box{<0,0,-0.203200><2.727000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.852200,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.866900,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,39.420800>}
box{<0,0,-0.203200><5.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<25.866900,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.874200,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.165600,-1.535000,40.233600>}
box{<0,0,-0.203200><1.291400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.874200,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.886700,-1.535000,39.536500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.886700,-1.535000,40.203400>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,90.000000,0> translate<25.886700,-1.535000,40.203400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.886700,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.572000,-1.535000,39.827200>}
box{<0,0,-0.203200><1.685300,0.035000,0.203200> rotate<0,0.000000,0> translate<25.886700,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.939600,-1.535000,39.348100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.862700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<25.939600,-1.535000,39.348100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.077900,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,39.014400>}
box{<0,0,-0.203200><5.041300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.077900,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.081100,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.499700,-1.535000,34.950400>}
box{<0,0,-0.203200><5.418600,0.035000,0.203200> rotate<0,0.000000,0> translate<26.081100,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.090700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,30.480000>}
box{<0,0,-0.203200><2.488500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.090700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,37.109800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.337200>}
box{<0,0,-0.203200><1.227400,0.035000,0.203200> rotate<0,90.000000,0> translate<26.140700,-1.535000,38.337200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,37.109800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,36.754300>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,44.988973,0> translate<26.140700,-1.535000,37.109800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,37.388800>}
box{<0,0,-0.203200><4.622900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.140700,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,37.795200>}
box{<0,0,-0.203200><4.622900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.140700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.940900,-1.535000,38.201600>}
box{<0,0,-0.203200><4.800200,0.035000,0.203200> rotate<0,0.000000,0> translate<26.140700,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.862700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<26.140700,-1.535000,38.862700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.140700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,38.608000>}
box{<0,0,-0.203200><4.978500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.140700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.258600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.461400,-1.535000,32.512000>}
box{<0,0,-0.203200><2.202800,0.035000,0.203200> rotate<0,0.000000,0> translate<26.258600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.268200,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,36.982400>}
box{<0,0,-0.203200><4.495400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.268200,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.487500,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.775300,-1.535000,35.356800>}
box{<0,0,-0.203200><11.287800,0.035000,0.203200> rotate<0,0.000000,0> translate<26.487500,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,30.885600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,32.274300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<26.496300,-1.535000,32.274300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,30.886400>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,31.292800>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,31.699200>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,32.105600>}
box{<0,0,-0.203200><1.727300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,35.365600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,36.754300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<26.496300,-1.535000,36.754300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.636000,-1.535000,35.763200>}
box{<0,0,-0.203200><5.139700,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.229600,-1.535000,36.169600>}
box{<0,0,-0.203200><4.733300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.823200,-1.535000,36.576000>}
box{<0,0,-0.203200><4.326900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.496300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,21.486500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.048400,-1.535000,20.870400>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,67.495305,0> translate<26.793200,-1.535000,21.486500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,22.153400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,21.486500>}
box{<0,0,-0.203200><0.666900,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.793200,-1.535000,21.486500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793200,-1.535000,22.153400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.048400,-1.535000,22.769500>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-67.495305,0> translate<26.793200,-1.535000,22.153400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953000,-1.535000,42.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.225800,-1.535000,42.106400>}
box{<0,0,-0.203200><0.385797,0.035000,0.203200> rotate<0,44.997030,0> translate<26.953000,-1.535000,42.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,40.445600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.935600,-1.535000,39.463600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<26.953600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,40.445600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.953600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.953600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.225800,-1.535000,42.106400>}
box{<0,0,-0.203200><0.384878,0.035000,0.203200> rotate<0,-44.986504,0> translate<26.953600,-1.535000,41.834300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.048400,-1.535000,20.870400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.318200,-1.535000,20.600700>}
box{<0,0,-0.203200><0.381484,0.035000,0.203200> rotate<0,44.986411,0> translate<27.048400,-1.535000,20.870400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.048400,-1.535000,22.769500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.520000,-1.535000,23.241100>}
box{<0,0,-0.203200><0.666943,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.048400,-1.535000,22.769500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.419600,-1.535000,15.419200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.520000,-1.535000,15.318800>}
box{<0,0,-0.203200><0.141987,0.035000,0.203200> rotate<0,44.997030,0> translate<27.419600,-1.535000,15.419200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.520000,-1.535000,15.318800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.136100,-1.535000,15.063600>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<27.520000,-1.535000,15.318800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.520000,-1.535000,23.241100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.136100,-1.535000,23.496300>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<27.520000,-1.535000,23.241100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.762700,-1.535000,45.020700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.248100,-1.535000,44.819600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<27.762700,-1.535000,45.020700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.935600,-1.535000,39.463600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.324300,-1.535000,39.463600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.935600,-1.535000,39.463600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.136100,-1.535000,15.063600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.123800,-1.535000,15.063600>}
box{<0,0,-0.203200><1.987700,0.035000,0.203200> rotate<0,0.000000,0> translate<28.136100,-1.535000,15.063600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.136100,-1.535000,23.496300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.123800,-1.535000,23.496300>}
box{<0,0,-0.203200><1.987700,0.035000,0.203200> rotate<0,0.000000,0> translate<28.136100,-1.535000,23.496300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,25.805600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.205600,-1.535000,24.823600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<28.223600,-1.535000,25.805600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,27.194300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,25.805600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.223600,-1.535000,25.805600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,27.194300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,27.549800>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<28.223600,-1.535000,27.194300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,30.885600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,30.530100>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,44.988973,0> translate<28.223600,-1.535000,30.885600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,32.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,30.885600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.223600,-1.535000,30.885600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.223600,-1.535000,32.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,32.629800>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<28.223600,-1.535000,32.274300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.248100,-1.535000,44.819600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.619600,-1.535000,44.448100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<28.248100,-1.535000,44.819600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.363700,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,44.704000>}
box{<0,0,-0.203200><15.315500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.363700,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,30.530100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,27.549800>}
box{<0,0,-0.203200><2.980300,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.579200,-1.535000,27.549800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,32.962700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,32.629800>}
box{<0,0,-0.203200><0.332900,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.579200,-1.535000,32.629800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579200,-1.535000,32.962700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.780300,-1.535000,33.448100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<28.579200,-1.535000,32.962700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.619600,-1.535000,44.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.619600,-1.535000,44.448100>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<28.619600,-1.535000,44.448100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.619600,-1.535000,44.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.749600,-1.535000,43.318100>}
box{<0,0,-0.203200><1.597991,0.035000,0.203200> rotate<0,44.994495,0> translate<28.619600,-1.535000,44.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.770100,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,44.297600>}
box{<0,0,-0.203200><14.909100,0.035000,0.203200> rotate<0,0.000000,0> translate<28.770100,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.780300,-1.535000,33.448100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.151800,-1.535000,33.819600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.780300,-1.535000,33.448100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.151800,-1.535000,33.819600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.971800,-1.535000,34.639600>}
box{<0,0,-0.203200><1.159655,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.151800,-1.535000,33.819600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.176500,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,43.891200>}
box{<0,0,-0.203200><14.502700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.176500,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.205600,-1.535000,24.823600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.594300,-1.535000,24.823600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.205600,-1.535000,24.823600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.237200,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.762700,-1.535000,4.259200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.237200,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.324300,-1.535000,39.463600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,40.445600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.324300,-1.535000,39.463600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.562700,-1.535000,14.820700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.048100,-1.535000,14.619600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<29.562700,-1.535000,14.820700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.582900,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,43.484800>}
box{<0,0,-0.203200><14.096300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.582900,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.687900,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,39.827200>}
box{<0,0,-0.203200><1.431300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.687900,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.749600,-1.535000,43.318100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.832700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<29.749600,-1.535000,43.318100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.762700,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.717200,-1.535000,4.259200>}
box{<0,0,-0.203200><3.954500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.762700,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.849000,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,43.078400>}
box{<0,0,-0.203200><13.830200,0.035000,0.203200> rotate<0,0.000000,0> translate<29.849000,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.189900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.307200>}
box{<0,0,-0.203200><0.117300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.950700,-1.535000,42.307200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.189900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,41.834300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<29.950700,-1.535000,42.189900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.194900,-1.535000,42.265600>}
box{<0,0,-0.203200><1.244200,0.035000,0.203200> rotate<0,0.000000,0> translate<29.950700,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.307200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.832700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<29.950700,-1.535000,42.832700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.950700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.601300,-1.535000,42.672000>}
box{<0,0,-0.203200><1.650600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.950700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.971800,-1.535000,34.639600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.457200,-1.535000,34.840700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<29.971800,-1.535000,34.639600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.022100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.201700,-1.535000,14.630400>}
box{<0,0,-0.203200><4.179600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.022100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.048100,-1.535000,14.619600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.419600,-1.535000,14.248100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<30.048100,-1.535000,14.619600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.094300,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.975600,-1.535000,40.233600>}
box{<0,0,-0.203200><0.881300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.094300,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.123800,-1.535000,15.063600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.739900,-1.535000,15.318800>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<30.123800,-1.535000,15.063600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.123800,-1.535000,23.496300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.739900,-1.535000,23.241100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<30.123800,-1.535000,23.496300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.281400,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.788500,-1.535000,41.859200>}
box{<0,0,-0.203200><0.507100,0.035000,0.203200> rotate<0,0.000000,0> translate<30.281400,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,40.445600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,41.834300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<30.306300,-1.535000,41.834300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,40.640000>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.306300,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,41.046400>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.306300,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.306300,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,41.452800>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.306300,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.419600,-1.535000,14.248100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.047000,-1.535000,10.620700>}
box{<0,0,-0.203200><5.129918,0.035000,0.203200> rotate<0,44.997030,0> translate<30.419600,-1.535000,14.248100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.443700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.608100,-1.535000,14.224000>}
box{<0,0,-0.203200><4.164400,0.035000,0.203200> rotate<0,0.000000,0> translate<30.443700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.457200,-1.535000,34.840700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.982700,-1.535000,34.840700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.457200,-1.535000,34.840700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.594300,-1.535000,24.823600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,25.805600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.594300,-1.535000,24.823600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.739900,-1.535000,15.318800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.800300,-1.535000,15.379200>}
box{<0,0,-0.203200><0.085418,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.739900,-1.535000,15.318800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.739900,-1.535000,23.241100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.840300,-1.535000,23.140700>}
box{<0,0,-0.203200><0.141987,0.035000,0.203200> rotate<0,44.997030,0> translate<30.739900,-1.535000,23.241100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,36.635600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,35.653600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<30.763600,-1.535000,36.635600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,38.024300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,36.635600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.763600,-1.535000,36.635600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,38.024300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,38.379900>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.763600,-1.535000,38.024300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,40.445600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,40.090000>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<30.763600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,40.445600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.763600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.763600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,42.816300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.763600,-1.535000,41.834300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.800300,-1.535000,15.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.452900,-1.535000,15.379200>}
box{<0,0,-0.203200><2.652600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.800300,-1.535000,15.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.816200,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097000,-1.535000,23.164800>}
box{<0,0,-0.203200><2.280800,0.035000,0.203200> rotate<0,0.000000,0> translate<30.816200,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.840300,-1.535000,23.140700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.072900,-1.535000,23.140700>}
box{<0,0,-0.203200><2.232600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.840300,-1.535000,23.140700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.850100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.014500,-1.535000,13.817600>}
box{<0,0,-0.203200><4.164400,0.035000,0.203200> rotate<0,0.000000,0> translate<30.850100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.967500,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,25.196800>}
box{<0,0,-0.203200><2.611700,0.035000,0.203200> rotate<0,0.000000,0> translate<30.967500,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.982700,-1.535000,34.840700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.390000,-1.535000,34.840700>}
box{<0,0,-0.203200><0.407300,0.035000,0.203200> rotate<0,0.000000,0> translate<30.982700,-1.535000,34.840700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.119200,-1.535000,38.379900>}
box{<0,0,-0.203200><1.710100,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.119200,-1.535000,38.379900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,27.549800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,30.530100>}
box{<0,0,-0.203200><2.980300,0.035000,0.203200> rotate<0,90.000000,0> translate<31.220700,-1.535000,30.530100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,27.549800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,27.194300>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,44.988973,0> translate<31.220700,-1.535000,27.549800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,27.635200>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,28.041600>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,28.448000>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,28.854400>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.260800>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.667200>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,30.073600>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,30.480000>}
box{<0,0,-0.203200><2.358500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220700,-1.535000,30.530100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,30.885600>}
box{<0,0,-0.203200><0.502824,0.035000,0.203200> rotate<0,-44.988973,0> translate<31.220700,-1.535000,30.530100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.256500,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.420900,-1.535000,13.411200>}
box{<0,0,-0.203200><4.164400,0.035000,0.203200> rotate<0,0.000000,0> translate<31.256500,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.373900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,25.603200>}
box{<0,0,-0.203200><2.205300,0.035000,0.203200> rotate<0,0.000000,0> translate<31.373900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.390000,-1.535000,34.840700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,35.196300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.390000,-1.535000,34.840700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541800,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,27.228800>}
box{<0,0,-0.203200><2.037400,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541800,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,25.805600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,27.194300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<31.576300,-1.535000,27.194300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,26.009600>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,26.416000>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,26.822400>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,30.885600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,32.013000>}
box{<0,0,-0.203200><1.127400,0.035000,0.203200> rotate<0,90.000000,0> translate<31.576300,-1.535000,32.013000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,30.886400>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,31.292800>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,31.699200>}
box{<0,0,-0.203200><2.002900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.576300,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.576300,-1.535000,32.013000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,31.843600>}
box{<0,0,-0.203200><0.239497,0.035000,0.203200> rotate<0,45.013945,0> translate<31.576300,-1.535000,32.013000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.662900,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.827300,-1.535000,13.004800>}
box{<0,0,-0.203200><4.164400,0.035000,0.203200> rotate<0,0.000000,0> translate<31.662900,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,31.843600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,31.843600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.745600,-1.535000,31.843600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,35.196300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,35.196300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.745600,-1.535000,35.196300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,35.653600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,35.653600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.745600,-1.535000,35.653600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745600,-1.535000,42.816300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,42.816300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.745600,-1.535000,42.816300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.069300,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.292900,-1.535000,12.598400>}
box{<0,0,-0.203200><4.223600,0.035000,0.203200> rotate<0,0.000000,0> translate<32.069300,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.475700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,12.192000>}
box{<0,0,-0.203200><6.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.475700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.882100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.843600,-1.535000,11.785600>}
box{<0,0,-0.203200><18.961500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.882100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.072900,-1.535000,23.140700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,23.647000>}
box{<0,0,-0.203200><0.716016,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.072900,-1.535000,23.140700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,31.843600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.668300,-1.535000,32.377600>}
box{<0,0,-0.203200><0.755190,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.134300,-1.535000,31.843600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,35.196300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,34.214300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<33.134300,-1.535000,35.196300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,35.653600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,36.635600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.134300,-1.535000,35.653600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.134300,-1.535000,42.816300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.529900,-1.535000,42.420700>}
box{<0,0,-0.203200><0.559463,0.035000,0.203200> rotate<0,44.997030,0> translate<33.134300,-1.535000,42.816300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.162900,-1.535000,48.709200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.495800,-1.535000,48.376400>}
box{<0,0,-0.203200><0.470721,0.035000,0.203200> rotate<0,44.988424,0> translate<33.162900,-1.535000,48.709200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.243900,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.368900,-1.535000,35.763200>}
box{<0,0,-0.203200><4.125000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.243900,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.278600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,42.672000>}
box{<0,0,-0.203200><10.400600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.278600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.288500,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.250000,-1.535000,11.379200>}
box{<0,0,-0.203200><18.961500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.288500,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,46.795600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.285600,-1.535000,45.813600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<33.303600,-1.535000,46.795600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,48.184300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,46.795600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.303600,-1.535000,46.795600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.303600,-1.535000,48.184300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.495800,-1.535000,48.376400>}
box{<0,0,-0.203200><0.271741,0.035000,0.203200> rotate<0,-44.982122,0> translate<33.303600,-1.535000,48.184300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.380200,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.181700,-1.535000,34.950400>}
box{<0,0,-0.203200><4.801500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.380200,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.396300,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,32.105600>}
box{<0,0,-0.203200><0.182900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.396300,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.447200,-1.535000,51.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972700,-1.535000,51.350700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.447200,-1.535000,51.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.452900,-1.535000,15.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.191800,-1.535000,12.640300>}
box{<0,0,-0.203200><3.873390,0.035000,0.203200> rotate<0,44.997030,0> translate<33.452900,-1.535000,15.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.529900,-1.535000,42.420700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.362700,-1.535000,42.420700>}
box{<0,0,-0.203200><2.832800,0.035000,0.203200> rotate<0,0.000000,0> translate<33.529900,-1.535000,42.420700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,27.837200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,23.647000>}
box{<0,0,-0.203200><4.190200,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.579200,-1.535000,23.647000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,27.837200>}
box{<0,0,-0.203200><1.600000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.579200,-1.535000,27.837200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.962700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.437200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.579200,-1.535000,29.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,32.162700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,29.962700>}
box{<0,0,-0.203200><2.200000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.579200,-1.535000,29.962700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.579200,-1.535000,32.162700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.668300,-1.535000,32.377600>}
box{<0,0,-0.203200><0.232639,0.035000,0.203200> rotate<0,-67.476091,0> translate<33.579200,-1.535000,32.162700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.650300,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.962500,-1.535000,36.169600>}
box{<0,0,-0.203200><3.312200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.650300,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.694900,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.527100,-1.535000,10.972800>}
box{<0,0,-0.203200><28.832200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.694900,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.717200,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.312700,-1.535000,4.259200>}
box{<0,0,-0.203200><0.595500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.717200,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,38.379900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,39.779200>}
box{<0,0,-0.203200><1.399300,0.035000,0.203200> rotate<0,90.000000,0> translate<33.760700,-1.535000,39.779200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,38.379900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,38.024300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<33.760700,-1.535000,38.379900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,38.608000>}
box{<0,0,-0.203200><2.418500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.760700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,39.014400>}
box{<0,0,-0.203200><2.418500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.760700,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.911300,-1.535000,39.420800>}
box{<0,0,-0.203200><2.150600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.760700,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.760700,-1.535000,39.779200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.553000,-1.535000,39.779200>}
box{<0,0,-0.203200><1.792300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.760700,-1.535000,39.779200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.786600,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.676200,-1.535000,34.544000>}
box{<0,0,-0.203200><1.889600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.786600,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.939000,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,38.201600>}
box{<0,0,-0.203200><2.240200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.939000,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972700,-1.535000,51.350700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.458100,-1.535000,51.149600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<33.972700,-1.535000,51.350700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.047000,-1.535000,10.620700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.762700,-1.535000,10.620700>}
box{<0,0,-0.203200><16.715700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.047000,-1.535000,10.620700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.056700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.556100,-1.535000,36.576000>}
box{<0,0,-0.203200><2.499400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.056700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,32.984000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,34.214300>}
box{<0,0,-0.203200><1.230300,0.035000,0.203200> rotate<0,90.000000,0> translate<34.116300,-1.535000,34.214300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,32.984000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.151800,-1.535000,33.019600>}
box{<0,0,-0.203200><0.050275,0.035000,0.203200> rotate<0,-45.077610,0> translate<34.116300,-1.535000,32.984000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.457000,-1.535000,33.324800>}
box{<0,0,-0.203200><0.340700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.863400,-1.535000,33.731200>}
box{<0,0,-0.203200><0.747100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.269800,-1.535000,34.137600>}
box{<0,0,-0.203200><1.153500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,36.635600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,38.024300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<34.116300,-1.535000,38.024300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.284700,-1.535000,36.982400>}
box{<0,0,-0.203200><2.168400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.388800>}
box{<0,0,-0.203200><2.062900,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.116300,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.795200>}
box{<0,0,-0.203200><2.062900,0.035000,0.203200> rotate<0,0.000000,0> translate<34.116300,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.151800,-1.535000,33.019600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.771800,-1.535000,34.639600>}
box{<0,0,-0.203200><2.291026,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.151800,-1.535000,33.019600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.285600,-1.535000,45.813600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.674300,-1.535000,45.813600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.285600,-1.535000,45.813600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.312700,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.637200,-1.535000,4.259200>}
box{<0,0,-0.203200><0.324500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.312700,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.321100,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.770300,-1.535000,51.206400>}
box{<0,0,-0.203200><31.449200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.321100,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.458100,-1.535000,51.149600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.728100,-1.535000,49.879600>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<34.458100,-1.535000,51.149600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.637200,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.717200,-1.535000,4.259200>}
box{<0,0,-0.203200><2.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.637200,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.807700,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,50.800000>}
box{<0,0,-0.203200><30.953100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.807700,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.214100,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.770200,-1.535000,50.393600>}
box{<0,0,-0.203200><30.556100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.214100,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.553000,-1.535000,39.779200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,39.152900>}
box{<0,0,-0.203200><0.885651,0.035000,0.203200> rotate<0,45.001604,0> translate<35.553000,-1.535000,39.779200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.620500,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.969800,-1.535000,49.987200>}
box{<0,0,-0.203200><3.349300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.620500,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.674300,-1.535000,45.813600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989800,-1.535000,46.129200>}
box{<0,0,-0.203200><0.446255,0.035000,0.203200> rotate<0,-45.006108,0> translate<35.674300,-1.535000,45.813600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.728100,-1.535000,49.879600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.099600,-1.535000,49.508100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<35.728100,-1.535000,49.879600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.771800,-1.535000,34.639600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.257200,-1.535000,34.840700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<35.771800,-1.535000,34.639600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.783800,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.722300,-1.535000,45.923200>}
box{<0,0,-0.203200><1.938500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.783800,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.989800,-1.535000,46.129200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637000,-1.535000,46.129200>}
box{<0,0,-0.203200><1.647200,0.035000,0.203200> rotate<0,0.000000,0> translate<35.989800,-1.535000,46.129200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.026900,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.184400,-1.535000,49.580800>}
box{<0,0,-0.203200><2.157500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.026900,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.099600,-1.535000,49.508100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300700,-1.535000,49.022700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<36.099600,-1.535000,49.508100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.237200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.380300,-1.535000,36.751800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<36.179200,-1.535000,37.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.762700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.237200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.179200,-1.535000,37.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,39.152900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.179200,-1.535000,37.762700>}
box{<0,0,-0.203200><1.390200,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.179200,-1.535000,37.762700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.191800,-1.535000,12.640300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677200,-1.535000,12.439200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<36.191800,-1.535000,12.640300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.237900,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.804200,-1.535000,49.174400>}
box{<0,0,-0.203200><1.566300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.237900,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.257200,-1.535000,34.840700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.782700,-1.535000,34.840700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.257200,-1.535000,34.840700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300700,-1.535000,48.770700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300700,-1.535000,49.022700>}
box{<0,0,-0.203200><0.252000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.300700,-1.535000,49.022700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300700,-1.535000,48.770700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637000,-1.535000,48.770700>}
box{<0,0,-0.203200><1.336300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.300700,-1.535000,48.770700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.362700,-1.535000,42.420700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.848100,-1.535000,42.219600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<36.362700,-1.535000,42.420700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.380300,-1.535000,36.751800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.291500,-1.535000,34.840700>}
box{<0,0,-0.203200><2.702774,0.035000,0.203200> rotate<0,44.995531,0> translate<36.380300,-1.535000,36.751800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.677200,-1.535000,12.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.187200,-1.535000,12.439200>}
box{<0,0,-0.203200><0.510000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.677200,-1.535000,12.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.717200,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.242700,-1.535000,4.259200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.717200,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.737100,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,42.265600>}
box{<0,0,-0.203200><6.942100,0.035000,0.203200> rotate<0,0.000000,0> translate<36.737100,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.782700,-1.535000,34.840700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.291500,-1.535000,34.840700>}
box{<0,0,-0.203200><1.508800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.782700,-1.535000,34.840700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.848100,-1.535000,42.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.219600,-1.535000,41.848100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<36.848100,-1.535000,42.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.187200,-1.535000,12.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.712700,-1.535000,12.439200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.187200,-1.535000,12.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.208500,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.488500,-1.535000,41.859200>}
box{<0,0,-0.203200><6.280000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.208500,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.219600,-1.535000,41.848000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.219600,-1.535000,41.848100>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<37.219600,-1.535000,41.848100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.219600,-1.535000,41.848000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.619600,-1.535000,40.448100>}
box{<0,0,-0.203200><1.979828,0.035000,0.203200> rotate<0,44.994984,0> translate<37.219600,-1.535000,41.848000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.242700,-1.535000,4.259200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.728100,-1.535000,4.460300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<37.242700,-1.535000,4.259200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.614900,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,41.452800>}
box{<0,0,-0.203200><5.848700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.614900,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637000,-1.535000,46.129200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.822700,-1.535000,45.680800>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,67.499184,0> translate<37.637000,-1.535000,46.129200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637000,-1.535000,48.770700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.822700,-1.535000,49.219100>}
box{<0,0,-0.203200><0.485332,0.035000,0.203200> rotate<0,-67.499184,0> translate<37.637000,-1.535000,48.770700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.712700,-1.535000,12.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.582400,-1.535000,12.439200>}
box{<0,0,-0.203200><0.869700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.712700,-1.535000,12.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.728100,-1.535000,4.460300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.847000,-1.535000,5.579200>}
box{<0,0,-0.203200><1.582364,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.728100,-1.535000,4.460300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738200,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.838400,-1.535000,4.470400>}
box{<0,0,-0.203200><28.100200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.738200,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.822700,-1.535000,45.680800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.322800,-1.535000,45.180700>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<37.822700,-1.535000,45.680800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.822700,-1.535000,49.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.322800,-1.535000,49.719200>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.822700,-1.535000,49.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.021300,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,41.046400>}
box{<0,0,-0.203200><5.442300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.021300,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.144600,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.947200,-1.535000,4.876800>}
box{<0,0,-0.203200><27.802600,0.035000,0.203200> rotate<0,0.000000,0> translate<38.144600,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.322800,-1.535000,45.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.976300,-1.535000,44.910000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<38.322800,-1.535000,45.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.322800,-1.535000,49.719200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.976300,-1.535000,49.989900>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<38.322800,-1.535000,49.719200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.427700,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,40.640000>}
box{<0,0,-0.203200><5.035900,0.035000,0.203200> rotate<0,0.000000,0> translate<38.427700,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.551000,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.299400,-1.535000,5.283200>}
box{<0,0,-0.203200><10.748400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.551000,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.582400,-1.535000,12.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.801200,-1.535000,12.220400>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,44.997030,0> translate<38.582400,-1.535000,12.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.619600,-1.535000,40.448100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.962700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<38.619600,-1.535000,40.448100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.708500,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.675600,-1.535000,40.233600>}
box{<0,0,-0.203200><4.967100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.708500,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.801200,-1.535000,12.220400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.468700,-1.535000,11.943900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<38.801200,-1.535000,12.220400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,38.047000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.437200>}
box{<0,0,-0.203200><1.390200,0.035000,0.203200> rotate<0,90.000000,0> translate<38.820700,-1.535000,39.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,38.047000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.047000,-1.535000,36.820700>}
box{<0,0,-0.203200><1.734250,0.035000,0.203200> rotate<0,44.997030,0> translate<38.820700,-1.535000,38.047000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.640900,-1.535000,38.201600>}
box{<0,0,-0.203200><4.820200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820700,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.047300,-1.535000,38.608000>}
box{<0,0,-0.203200><5.226600,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.014400>}
box{<0,0,-0.203200><6.235100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820700,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.420800>}
box{<0,0,-0.203200><6.235100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820700,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.962700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<38.820700,-1.535000,39.962700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820700,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.082000,-1.535000,39.827200>}
box{<0,0,-0.203200><5.261300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820700,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.847000,-1.535000,5.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.798600,-1.535000,5.579200>}
box{<0,0,-0.203200><9.951600,0.035000,0.203200> rotate<0,0.000000,0> translate<38.847000,-1.535000,5.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.976300,-1.535000,44.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.683600,-1.535000,44.910000>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.976300,-1.535000,44.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.976300,-1.535000,49.989900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.683600,-1.535000,49.989900>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.976300,-1.535000,49.989900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.072500,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,37.795200>}
box{<0,0,-0.203200><4.391100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.072500,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.468700,-1.535000,11.943900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.191200,-1.535000,11.943900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.468700,-1.535000,11.943900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.478900,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,37.388800>}
box{<0,0,-0.203200><3.984700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.478900,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.683600,-1.535000,44.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.337100,-1.535000,45.180700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<39.683600,-1.535000,44.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.683600,-1.535000,49.989900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.337100,-1.535000,49.719200>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<39.683600,-1.535000,49.989900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.690200,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.879100,-1.535000,49.987200>}
box{<0,0,-0.203200><26.188900,0.035000,0.203200> rotate<0,0.000000,0> translate<39.690200,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.885300,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,36.982400>}
box{<0,0,-0.203200><3.578300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.885300,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.047000,-1.535000,36.820700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,36.820700>}
box{<0,0,-0.203200><3.416600,0.035000,0.203200> rotate<0,0.000000,0> translate<40.047000,-1.535000,36.820700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.167300,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,45.110400>}
box{<0,0,-0.203200><3.511900,0.035000,0.203200> rotate<0,0.000000,0> translate<40.167300,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.191200,-1.535000,11.943900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.858700,-1.535000,12.220400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<40.191200,-1.535000,11.943900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.337100,-1.535000,45.180700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837200,-1.535000,45.680800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.337100,-1.535000,45.180700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.337100,-1.535000,49.719200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837200,-1.535000,49.219100>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<40.337100,-1.535000,49.719200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.475500,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.028500,-1.535000,49.580800>}
box{<0,0,-0.203200><25.553000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.475500,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.673200,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,45.516800>}
box{<0,0,-0.203200><3.006000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.673200,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.790100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.609400,-1.535000,12.192000>}
box{<0,0,-0.203200><4.819300,0.035000,0.203200> rotate<0,0.000000,0> translate<40.790100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837200,-1.535000,45.680800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,46.334300>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<40.837200,-1.535000,45.680800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837200,-1.535000,49.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,48.565600>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<40.837200,-1.535000,49.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.855800,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.876100,-1.535000,49.174400>}
box{<0,0,-0.203200><9.020300,0.035000,0.203200> rotate<0,0.000000,0> translate<40.855800,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.858700,-1.535000,12.220400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.017500,-1.535000,12.379200>}
box{<0,0,-0.203200><0.224577,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.858700,-1.535000,12.220400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.937600,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.745700,-1.535000,45.923200>}
box{<0,0,-0.203200><2.808100,0.035000,0.203200> rotate<0,0.000000,0> translate<40.937600,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.017500,-1.535000,12.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.162700,-1.535000,12.379200>}
box{<0,0,-0.203200><1.145200,0.035000,0.203200> rotate<0,0.000000,0> translate<41.017500,-1.535000,12.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.024100,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.624200,-1.535000,48.768000>}
box{<0,0,-0.203200><5.600100,0.035000,0.203200> rotate<0,0.000000,0> translate<41.024100,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.105900,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.961800,-1.535000,46.329600>}
box{<0,0,-0.203200><2.855900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.105900,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,46.334300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,48.565600>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,90.000000,0> translate<41.107900,-1.535000,48.565600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.368200,-1.535000,46.736000>}
box{<0,0,-0.203200><3.260300,0.035000,0.203200> rotate<0,0.000000,0> translate<41.107900,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.774600,-1.535000,47.142400>}
box{<0,0,-0.203200><3.666700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.107900,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.181000,-1.535000,47.548800>}
box{<0,0,-0.203200><4.073100,0.035000,0.203200> rotate<0,0.000000,0> translate<41.107900,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.587400,-1.535000,47.955200>}
box{<0,0,-0.203200><4.479500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.107900,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.107900,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.993800,-1.535000,48.361600>}
box{<0,0,-0.203200><4.885900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.107900,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.162700,-1.535000,12.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.648100,-1.535000,12.580300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<42.162700,-1.535000,12.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.648100,-1.535000,12.580300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.019600,-1.535000,12.951800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.648100,-1.535000,12.580300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.666200,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.993200,-1.535000,12.598400>}
box{<0,0,-0.203200><2.327000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.666200,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.019600,-1.535000,12.951800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.319600,-1.535000,14.251800>}
box{<0,0,-0.203200><1.838478,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.019600,-1.535000,12.951800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.072600,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.676700,-1.535000,13.004800>}
box{<0,0,-0.203200><1.604100,0.035000,0.203200> rotate<0,0.000000,0> translate<43.072600,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,38.024300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,36.820700>}
box{<0,0,-0.203200><1.203600,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.463600,-1.535000,36.820700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,38.024300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.445600,-1.535000,39.006300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.463600,-1.535000,38.024300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,40.445600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.445600,-1.535000,39.463600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<43.463600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,40.445600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.463600,-1.535000,40.445600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.463600,-1.535000,41.834300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,42.049900>}
box{<0,0,-0.203200><0.304904,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.463600,-1.535000,41.834300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.479000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.508400,-1.535000,13.411200>}
box{<0,0,-0.203200><1.029400,0.035000,0.203200> rotate<0,0.000000,0> translate<43.479000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,45.762700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,42.049900>}
box{<0,0,-0.203200><3.712800,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.679200,-1.535000,42.049900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.679200,-1.535000,45.762700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.880300,-1.535000,46.248100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<43.679200,-1.535000,45.762700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.880300,-1.535000,46.248100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.251800,-1.535000,46.619600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.880300,-1.535000,46.248100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.885400,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,13.817600>}
box{<0,0,-0.203200><0.578500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.885400,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.251800,-1.535000,46.619600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.241800,-1.535000,48.609600>}
box{<0,0,-0.203200><2.814285,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.251800,-1.535000,46.619600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.291800,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,14.224000>}
box{<0,0,-0.203200><0.172100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.291800,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.319600,-1.535000,14.251800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,14.737200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<44.319600,-1.535000,14.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.445600,-1.535000,39.006300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.006300>}
box{<0,0,-0.203200><0.610200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.445600,-1.535000,39.006300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.445600,-1.535000,39.463600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.463600>}
box{<0,0,-0.203200><0.610200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.445600,-1.535000,39.463600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,13.518700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.740400,-1.535000,12.851200>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,67.494633,0> translate<44.463900,-1.535000,13.518700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,14.241200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,13.518700>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.463900,-1.535000,13.518700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.463900,-1.535000,14.241200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.740400,-1.535000,14.908700>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-67.494633,0> translate<44.463900,-1.535000,14.241200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.476400,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.625200,-1.535000,14.630400>}
box{<0,0,-0.203200><0.148800,0.035000,0.203200> rotate<0,0.000000,0> translate<44.476400,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,14.737200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,15.262700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<44.520700,-1.535000,15.262700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.868600,-1.535000,15.036800>}
box{<0,0,-0.203200><0.347900,0.035000,0.203200> rotate<0,0.000000,0> translate<44.520700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,15.262700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,15.333600>}
box{<0,0,-0.203200><0.070900,0.035000,0.203200> rotate<0,90.000000,0> translate<44.520700,-1.535000,15.333600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.520700,-1.535000,15.333600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.165400,-1.535000,15.333600>}
box{<0,0,-0.203200><0.644700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.520700,-1.535000,15.333600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.740400,-1.535000,12.851200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.251200,-1.535000,12.340400>}
box{<0,0,-0.203200><0.722380,0.035000,0.203200> rotate<0,44.997030,0> translate<44.740400,-1.535000,12.851200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.740400,-1.535000,14.908700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.165400,-1.535000,15.333600>}
box{<0,0,-0.203200><0.600970,0.035000,0.203200> rotate<0,-44.990289,0> translate<44.740400,-1.535000,14.908700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.463600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.055800,-1.535000,39.006300>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.055800,-1.535000,39.006300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.251200,-1.535000,12.340400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.918700,-1.535000,12.063900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<45.251200,-1.535000,12.340400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.918700,-1.535000,12.063900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.641200,-1.535000,12.063900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.918700,-1.535000,12.063900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.241800,-1.535000,48.609600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.727200,-1.535000,48.810700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<46.241800,-1.535000,48.609600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.641200,-1.535000,12.063900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.308700,-1.535000,12.340400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<46.641200,-1.535000,12.063900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.727200,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.252700,-1.535000,48.810700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.727200,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.950400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.519500,-1.535000,12.192000>}
box{<0,0,-0.203200><2.569100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.950400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.252700,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.512400,-1.535000,48.810700>}
box{<0,0,-0.203200><2.259700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.252700,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.308700,-1.535000,12.340400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.647500,-1.535000,12.679200>}
box{<0,0,-0.203200><0.479136,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.308700,-1.535000,12.340400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.566700,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.779300,-1.535000,12.598400>}
box{<0,0,-0.203200><1.212600,0.035000,0.203200> rotate<0,0.000000,0> translate<47.566700,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.647500,-1.535000,12.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.698500,-1.535000,12.679200>}
box{<0,0,-0.203200><1.051000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.647500,-1.535000,12.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.698500,-1.535000,12.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.949600,-1.535000,12.428100>}
box{<0,0,-0.203200><0.355109,0.035000,0.203200> rotate<0,44.997030,0> translate<48.698500,-1.535000,12.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.798600,-1.535000,5.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.949600,-1.535000,5.428100>}
box{<0,0,-0.203200><0.213617,0.035000,0.203200> rotate<0,45.015995,0> translate<48.798600,-1.535000,5.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.949600,-1.535000,5.428100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631100,-1.535000,5.145800>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,22.499481,0> translate<48.949600,-1.535000,5.428100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.949600,-1.535000,12.428100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631100,-1.535000,12.145800>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,22.499481,0> translate<48.949600,-1.535000,12.428100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.512400,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.007700,-1.535000,49.306000>}
box{<0,0,-0.203200><0.700460,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.512400,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631100,-1.535000,5.145800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.368800,-1.535000,5.145800>}
box{<0,0,-0.203200><0.737700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.631100,-1.535000,5.145800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.631100,-1.535000,12.145800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.368800,-1.535000,12.145800>}
box{<0,0,-0.203200><0.737700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.631100,-1.535000,12.145800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.007700,-1.535000,49.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.512200,-1.535000,49.306000>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<50.007700,-1.535000,49.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.368800,-1.535000,5.145800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.050300,-1.535000,5.428100>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,-22.499481,0> translate<50.368800,-1.535000,5.145800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.368800,-1.535000,12.145800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.050300,-1.535000,12.428100>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,-22.499481,0> translate<50.368800,-1.535000,12.145800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.480300,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.437200,-1.535000,12.192000>}
box{<0,0,-0.203200><0.956900,0.035000,0.203200> rotate<0,0.000000,0> translate<50.480300,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.700400,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.175300,-1.535000,5.283200>}
box{<0,0,-0.203200><15.474900,0.035000,0.203200> rotate<0,0.000000,0> translate<50.700400,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.762700,-1.535000,10.620700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.248100,-1.535000,10.419600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<50.762700,-1.535000,10.620700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.893800,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,10.566400>}
box{<0,0,-0.203200><19.907000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.893800,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.050300,-1.535000,5.428100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.571800,-1.535000,5.949600>}
box{<0,0,-0.203200><0.737512,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.050300,-1.535000,5.428100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.050300,-1.535000,12.428100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393600,-1.535000,12.771500>}
box{<0,0,-0.203200><0.485570,0.035000,0.203200> rotate<0,-45.005373,0> translate<51.050300,-1.535000,12.428100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220500,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393600,-1.535000,12.598400>}
box{<0,0,-0.203200><0.173100,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220500,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.248100,-1.535000,10.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.619600,-1.535000,10.048100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<51.248100,-1.535000,10.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.311800,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.472700,-1.535000,5.689600>}
box{<0,0,-0.203200><15.160900,0.035000,0.203200> rotate<0,0.000000,0> translate<51.311800,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393600,-1.535000,12.235600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,11.253600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<51.393600,-1.535000,12.235600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393600,-1.535000,12.771500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393600,-1.535000,12.235600>}
box{<0,0,-0.203200><0.535900,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.393600,-1.535000,12.235600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.507700,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,10.160000>}
box{<0,0,-0.203200><19.293100,0.035000,0.203200> rotate<0,0.000000,0> translate<51.507700,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.512200,-1.535000,49.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.029900,-1.535000,48.788200>}
box{<0,0,-0.203200><0.732209,0.035000,0.203200> rotate<0,45.002563,0> translate<51.512200,-1.535000,49.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.571800,-1.535000,5.949600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.811800,-1.535000,6.529200>}
box{<0,0,-0.203200><0.627325,0.035000,0.203200> rotate<0,-67.502142,0> translate<51.571800,-1.535000,5.949600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.619600,-1.535000,10.048100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258500,-1.535000,9.409100>}
box{<0,0,-0.203200><0.903612,0.035000,0.203200> rotate<0,45.001513,0> translate<51.619600,-1.535000,10.048100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.632400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.901300,-1.535000,6.096000>}
box{<0,0,-0.203200><15.268900,0.035000,0.203200> rotate<0,0.000000,0> translate<51.632400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.643800,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.621100,-1.535000,49.174400>}
box{<0,0,-0.203200><0.977300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.643800,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.800700,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.046800,-1.535000,6.502400>}
box{<0,0,-0.203200><0.246100,0.035000,0.203200> rotate<0,0.000000,0> translate<51.800700,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.811800,-1.535000,6.529200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.020000,-1.535000,6.529200>}
box{<0,0,-0.203200><0.208200,0.035000,0.203200> rotate<0,0.000000,0> translate<51.811800,-1.535000,6.529200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.914100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,9.753600>}
box{<0,0,-0.203200><18.886700,0.035000,0.203200> rotate<0,0.000000,0> translate<51.914100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.020000,-1.535000,6.529200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,6.173600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<52.020000,-1.535000,6.529200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.029900,-1.535000,48.788200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.271200,-1.535000,49.029500>}
box{<0,0,-0.203200><0.341250,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.029900,-1.535000,48.788200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258500,-1.535000,9.409100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,9.526300>}
box{<0,0,-0.203200><0.165675,0.035000,0.203200> rotate<0,-45.021483,0> translate<52.258500,-1.535000,9.409100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.271200,-1.535000,49.029500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.938700,-1.535000,49.306000>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<52.271200,-1.535000,49.029500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,6.173600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,6.173600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.375600,-1.535000,6.173600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,9.526300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,9.526300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.375600,-1.535000,9.526300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.375600,-1.535000,11.253600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,11.253600>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.375600,-1.535000,11.253600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.938700,-1.535000,49.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.661200,-1.535000,49.306000>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.938700,-1.535000,49.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.661200,-1.535000,49.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.328700,-1.535000,49.029500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<53.661200,-1.535000,49.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,6.173600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,7.155600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.764300,-1.535000,6.173600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,9.526300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,8.544300>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,44.997030,0> translate<53.764300,-1.535000,9.526300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.764300,-1.535000,11.253600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189900,-1.535000,11.679200>}
box{<0,0,-0.203200><0.601889,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.764300,-1.535000,11.253600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.889900,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.064300,-1.535000,11.379200>}
box{<0,0,-0.203200><8.174400,0.035000,0.203200> rotate<0,0.000000,0> translate<53.889900,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.943400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,9.347200>}
box{<0,0,-0.203200><16.857400,0.035000,0.203200> rotate<0,0.000000,0> translate<53.943400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.978900,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.263100,-1.535000,49.174400>}
box{<0,0,-0.203200><12.284200,0.035000,0.203200> rotate<0,0.000000,0> translate<53.978900,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.093100,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.736000,-1.535000,6.502400>}
box{<0,0,-0.203200><13.642900,0.035000,0.203200> rotate<0,0.000000,0> translate<54.093100,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189900,-1.535000,11.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.762700,-1.535000,11.679200>}
box{<0,0,-0.203200><4.572800,0.035000,0.203200> rotate<0,0.000000,0> translate<54.189900,-1.535000,11.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.328700,-1.535000,49.029500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.547500,-1.535000,48.810700>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,44.997030,0> translate<54.328700,-1.535000,49.029500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.349800,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,8.940800>}
box{<0,0,-0.203200><16.451000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.349800,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.499500,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,6.908800>}
box{<0,0,-0.203200><16.301300,0.035000,0.203200> rotate<0,0.000000,0> translate<54.499500,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.547500,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.747200,-1.535000,48.810700>}
box{<0,0,-0.203200><6.199700,0.035000,0.203200> rotate<0,0.000000,0> translate<54.547500,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,7.155600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,8.544300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<54.746300,-1.535000,8.544300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,7.315200>}
box{<0,0,-0.203200><16.054500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.746300,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,7.721600>}
box{<0,0,-0.203200><16.054500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.746300,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,8.128000>}
box{<0,0,-0.203200><16.054500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.746300,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.746300,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,8.534400>}
box{<0,0,-0.203200><16.054500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.746300,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.961800,-1.535000,29.094100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.286300,-1.535000,29.094100>}
box{<0,0,-0.203200><0.324500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.961800,-1.535000,29.094100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.961800,-1.535000,29.094100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.748100,-1.535000,29.880300>}
box{<0,0,-0.203200><1.111925,0.035000,0.203200> rotate<0,-44.993387,0> translate<54.961800,-1.535000,29.094100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.128500,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.453000,-1.535000,29.260800>}
box{<0,0,-0.203200><0.324500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.128500,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.286300,-1.535000,29.094100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.751800,-1.535000,29.559600>}
box{<0,0,-0.203200><0.658316,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.286300,-1.535000,29.094100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.534900,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.011600,-1.535000,29.667200>}
box{<0,0,-0.203200><0.476700,0.035000,0.203200> rotate<0,0.000000,0> translate<55.534900,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.748100,-1.535000,29.880300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.119600,-1.535000,30.251800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.748100,-1.535000,29.880300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.751800,-1.535000,29.559600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.053500,-1.535000,29.684600>}
box{<0,0,-0.203200><0.326570,0.035000,0.203200> rotate<0,-22.503664,0> translate<55.751800,-1.535000,29.559600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.941400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.743100,-1.535000,30.073600>}
box{<0,0,-0.203200><0.801700,0.035000,0.203200> rotate<0,0.000000,0> translate<55.941400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.053500,-1.535000,29.684600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.230000,-1.535000,29.861100>}
box{<0,0,-0.203200><0.249609,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.053500,-1.535000,29.684600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.119600,-1.535000,30.251800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,30.737200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<56.119600,-1.535000,30.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.214100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,30.480000>}
box{<0,0,-0.203200><14.586700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.214100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.230000,-1.535000,29.861100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.846100,-1.535000,30.116300>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<56.230000,-1.535000,29.861100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,30.737200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,31.952900>}
box{<0,0,-0.203200><1.215700,0.035000,0.203200> rotate<0,90.000000,0> translate<56.320700,-1.535000,31.952900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,30.886400>}
box{<0,0,-0.203200><14.480100,0.035000,0.203200> rotate<0,0.000000,0> translate<56.320700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,31.292800>}
box{<0,0,-0.203200><14.480100,0.035000,0.203200> rotate<0,0.000000,0> translate<56.320700,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,31.699200>}
box{<0,0,-0.203200><14.480100,0.035000,0.203200> rotate<0,0.000000,0> translate<56.320700,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320700,-1.535000,31.952900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.397300,-1.535000,32.029600>}
box{<0,0,-0.203200><0.108399,0.035000,0.203200> rotate<0,-45.034403,0> translate<56.320700,-1.535000,31.952900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.397300,-1.535000,32.029600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.846100,-1.535000,31.843600>}
box{<0,0,-0.203200><0.485816,0.035000,0.203200> rotate<0,22.509514,0> translate<56.397300,-1.535000,32.029600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.846100,-1.535000,30.116300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.833800,-1.535000,30.116300>}
box{<0,0,-0.203200><1.987700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.846100,-1.535000,30.116300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.846100,-1.535000,31.843600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.833800,-1.535000,31.843600>}
box{<0,0,-0.203200><1.987700,0.035000,0.203200> rotate<0,0.000000,0> translate<56.846100,-1.535000,31.843600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.762700,-1.535000,11.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.248100,-1.535000,11.880300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<58.762700,-1.535000,11.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.833800,-1.535000,30.116300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.449900,-1.535000,29.861100>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,22.498755,0> translate<58.833800,-1.535000,30.116300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.833800,-1.535000,31.843600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.449900,-1.535000,32.098800>}
box{<0,0,-0.203200><0.666863,0.035000,0.203200> rotate<0,-22.498755,0> translate<58.833800,-1.535000,31.843600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.936900,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,30.073600>}
box{<0,0,-0.203200><11.863900,0.035000,0.203200> rotate<0,0.000000,0> translate<58.936900,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.019500,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.817600,-1.535000,11.785600>}
box{<0,0,-0.203200><2.798100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.019500,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.248100,-1.535000,11.880300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.619600,-1.535000,12.251800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.248100,-1.535000,11.880300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.449900,-1.535000,29.861100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.550300,-1.535000,29.760700>}
box{<0,0,-0.203200><0.141987,0.035000,0.203200> rotate<0,44.997030,0> translate<59.449900,-1.535000,29.861100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.449900,-1.535000,32.098800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.550200,-1.535000,32.199200>}
box{<0,0,-0.203200><0.141916,0.035000,0.203200> rotate<0,-45.025576,0> translate<59.449900,-1.535000,32.098800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.456600,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,32.105600>}
box{<0,0,-0.203200><11.344200,0.035000,0.203200> rotate<0,0.000000,0> translate<59.456600,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.550200,-1.535000,32.199200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452700,-1.535000,32.199200>}
box{<0,0,-0.203200><4.902500,0.035000,0.203200> rotate<0,0.000000,0> translate<59.550200,-1.535000,32.199200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.550300,-1.535000,29.760700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.117200,-1.535000,29.760700>}
box{<0,0,-0.203200><0.566900,0.035000,0.203200> rotate<0,0.000000,0> translate<59.550300,-1.535000,29.760700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.559800,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.192000>}
box{<0,0,-0.203200><2.100200,0.035000,0.203200> rotate<0,0.000000,0> translate<59.559800,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.619600,-1.535000,12.251800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.499600,-1.535000,14.131800>}
box{<0,0,-0.203200><2.658721,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.619600,-1.535000,12.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.966200,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.598400>}
box{<0,0,-0.203200><1.693800,0.035000,0.203200> rotate<0,0.000000,0> translate<59.966200,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.117200,-1.535000,29.760700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642700,-1.535000,29.760700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<60.117200,-1.535000,29.760700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.372600,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.714400,-1.535000,13.004800>}
box{<0,0,-0.203200><1.341800,0.035000,0.203200> rotate<0,0.000000,0> translate<60.372600,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642700,-1.535000,29.760700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.128100,-1.535000,29.559600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<60.642700,-1.535000,29.760700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.747200,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.272700,-1.535000,48.810700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<60.747200,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.779000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.882700,-1.535000,13.411200>}
box{<0,0,-0.203200><1.103700,0.035000,0.203200> rotate<0,0.000000,0> translate<60.779000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.868400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,29.667200>}
box{<0,0,-0.203200><9.932400,0.035000,0.203200> rotate<0,0.000000,0> translate<60.868400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.128100,-1.535000,29.559600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.398100,-1.535000,28.289600>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<61.128100,-1.535000,29.559600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.185400,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.221200,-1.535000,13.817600>}
box{<0,0,-0.203200><1.035800,0.035000,0.203200> rotate<0,0.000000,0> translate<61.185400,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.219100,-1.535000,18.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.430300,-1.535000,18.641800>}
box{<0,0,-0.203200><0.228570,0.035000,0.203200> rotate<0,22.479548,0> translate<61.219100,-1.535000,18.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.219100,-1.535000,18.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.672400,-1.535000,18.729200>}
box{<0,0,-0.203200><0.453300,0.035000,0.203200> rotate<0,0.000000,0> translate<61.219100,-1.535000,18.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.272700,-1.535000,48.810700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.758100,-1.535000,48.609600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<61.272700,-1.535000,48.810700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.303200,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.707200,-1.535000,18.694400>}
box{<0,0,-0.203200><0.404000,0.035000,0.203200> rotate<0,0.000000,0> translate<61.303200,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.375800,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.625000,-1.535000,48.768000>}
box{<0,0,-0.203200><5.249200,0.035000,0.203200> rotate<0,0.000000,0> translate<61.375800,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.426900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,29.260800>}
box{<0,0,-0.203200><9.373900,0.035000,0.203200> rotate<0,0.000000,0> translate<61.426900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.430300,-1.535000,18.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.951800,-1.535000,18.120300>}
box{<0,0,-0.203200><0.737512,0.035000,0.203200> rotate<0,44.997030,0> translate<61.430300,-1.535000,18.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.499600,-1.535000,14.131800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,14.617200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<61.499600,-1.535000,14.131800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.537700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.224000>}
box{<0,0,-0.203200><1.331500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.537700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.166300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.930700,-1.535000,11.512800>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<61.660000,-1.535000,12.166300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.873600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.166300>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.660000,-1.535000,12.166300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.660000,-1.535000,12.873600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.930700,-1.535000,13.527100>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<61.660000,-1.535000,12.873600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.672400,-1.535000,18.729200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.891200,-1.535000,18.510400>}
box{<0,0,-0.203200><0.309430,0.035000,0.203200> rotate<0,44.997030,0> translate<61.672400,-1.535000,18.729200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,14.617200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.142700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<61.700700,-1.535000,15.142700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.630400>}
box{<0,0,-0.203200><1.168500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.700700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.995200,-1.535000,15.036800>}
box{<0,0,-0.203200><1.294500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.700700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.142700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.768500>}
box{<0,0,-0.203200><0.625800,0.035000,0.203200> rotate<0,90.000000,0> translate<61.700700,-1.535000,15.768500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.295400,-1.535000,15.443200>}
box{<0,0,-0.203200><1.594700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.700700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.700700,-1.535000,15.768500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.951800,-1.535000,16.019600>}
box{<0,0,-0.203200><0.355109,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.700700,-1.535000,15.768500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.758100,-1.535000,48.609600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.248100,-1.535000,44.119600>}
box{<0,0,-0.203200><6.349819,0.035000,0.203200> rotate<0,44.997030,0> translate<61.758100,-1.535000,48.609600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.781800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.701800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<61.781800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.784100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.428000,-1.535000,18.288000>}
box{<0,0,-0.203200><0.643900,0.035000,0.203200> rotate<0,0.000000,0> translate<61.784100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.833300,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,28.854400>}
box{<0,0,-0.203200><8.967500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.833300,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.891200,-1.535000,18.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.558700,-1.535000,18.233900>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<61.891200,-1.535000,18.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.930700,-1.535000,11.512800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.430800,-1.535000,11.012700>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<61.930700,-1.535000,11.512800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.930700,-1.535000,13.527100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.430800,-1.535000,14.027200>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.930700,-1.535000,13.527100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.951800,-1.535000,16.019600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,16.701100>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,-67.494580,0> translate<61.951800,-1.535000,16.019600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.951800,-1.535000,18.120300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,17.438800>}
box{<0,0,-0.203200><0.737655,0.035000,0.203200> rotate<0,67.494580,0> translate<61.951800,-1.535000,18.120300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.006100,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.164900,-1.535000,48.361600>}
box{<0,0,-0.203200><5.158800,0.035000,0.203200> rotate<0,0.000000,0> translate<62.006100,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.029100,-1.535000,22.953600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,22.458800>}
box{<0,0,-0.203200><0.535586,0.035000,0.203200> rotate<0,67.490888,0> translate<62.029100,-1.535000,22.953600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.029100,-1.535000,22.953600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.344300,-1.535000,22.953600>}
box{<0,0,-0.203200><0.315200,0.035000,0.203200> rotate<0,0.000000,0> translate<62.029100,-1.535000,22.953600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.049700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.108200,-1.535000,16.256000>}
box{<0,0,-0.203200><2.058500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.049700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.050700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,17.881600>}
box{<0,0,-0.203200><2.088500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.050700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.110000,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,22.758400>}
box{<0,0,-0.203200><8.690800,0.035000,0.203200> rotate<0,0.000000,0> translate<62.110000,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.218000,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,16.662400>}
box{<0,0,-0.203200><1.921200,0.035000,0.203200> rotate<0,0.000000,0> translate<62.218000,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.219100,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,17.475200>}
box{<0,0,-0.203200><1.920100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.219100,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,16.701100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,17.438800>}
box{<0,0,-0.203200><0.737700,0.035000,0.203200> rotate<0,90.000000,0> translate<62.234100,-1.535000,17.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,17.068800>}
box{<0,0,-0.203200><1.905100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.234100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,21.731500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,22.458800>}
box{<0,0,-0.203200><0.727300,0.035000,0.203200> rotate<0,90.000000,0> translate<62.234100,-1.535000,22.458800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,21.731500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.558700,-1.535000,21.866000>}
box{<0,0,-0.203200><0.351362,0.035000,0.203200> rotate<0,-22.505487,0> translate<62.234100,-1.535000,21.731500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,21.945600>}
box{<0,0,-0.203200><8.566700,0.035000,0.203200> rotate<0,0.000000,0> translate<62.234100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.234100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,22.352000>}
box{<0,0,-0.203200><8.566700,0.035000,0.203200> rotate<0,0.000000,0> translate<62.234100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.239700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,28.448000>}
box{<0,0,-0.203200><8.561100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.239700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.344300,-1.535000,22.953600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,23.935600>}
box{<0,0,-0.203200><1.388758,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.344300,-1.535000,22.953600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.398100,-1.535000,28.289600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.769600,-1.535000,27.918100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<62.398100,-1.535000,28.289600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.412500,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,47.955200>}
box{<0,0,-0.203200><8.388300,0.035000,0.203200> rotate<0,0.000000,0> translate<62.412500,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.430800,-1.535000,11.012700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.084300,-1.535000,10.742000>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,22.499371,0> translate<62.430800,-1.535000,11.012700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.430800,-1.535000,14.027200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.208700>}
box{<0,0,-0.203200><0.474486,0.035000,0.203200> rotate<0,-22.488338,0> translate<62.430800,-1.535000,14.027200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.555500,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,23.164800>}
box{<0,0,-0.203200><8.245300,0.035000,0.203200> rotate<0,0.000000,0> translate<62.555500,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.558700,-1.535000,18.233900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.281200,-1.535000,18.233900>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.558700,-1.535000,18.233900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.558700,-1.535000,21.866000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.281200,-1.535000,21.866000>}
box{<0,0,-0.203200><0.722500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.558700,-1.535000,21.866000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.646100,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,28.041600>}
box{<0,0,-0.203200><8.154700,0.035000,0.203200> rotate<0,0.000000,0> translate<62.646100,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.769600,-1.535000,27.918100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,27.432700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<62.769600,-1.535000,27.918100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.818900,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,47.548800>}
box{<0,0,-0.203200><7.981900,0.035000,0.203200> rotate<0,0.000000,0> translate<62.818900,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.732700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.208700>}
box{<0,0,-0.203200><0.524000,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.869200,-1.535000,14.208700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.869200,-1.535000,14.732700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.070300,-1.535000,15.218100>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<62.869200,-1.535000,14.732700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.886900,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,27.635200>}
box{<0,0,-0.203200><7.913900,0.035000,0.203200> rotate<0,0.000000,0> translate<62.886900,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.961900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,23.571200>}
box{<0,0,-0.203200><7.838900,0.035000,0.203200> rotate<0,0.000000,0> translate<62.961900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,25.679900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,27.432700>}
box{<0,0,-0.203200><1.752800,0.035000,0.203200> rotate<0,90.000000,0> translate<62.970700,-1.535000,27.432700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,25.679900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,25.324300>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<62.970700,-1.535000,25.679900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,26.009600>}
box{<0,0,-0.203200><7.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.970700,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,26.416000>}
box{<0,0,-0.203200><7.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.970700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,26.822400>}
box{<0,0,-0.203200><7.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.970700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.970700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,27.228800>}
box{<0,0,-0.203200><7.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.970700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.047400,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,25.603200>}
box{<0,0,-0.203200><7.753400,0.035000,0.203200> rotate<0,0.000000,0> translate<63.047400,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.070300,-1.535000,15.218100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.441800,-1.535000,15.589600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.070300,-1.535000,15.218100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.084300,-1.535000,10.742000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.315600,-1.535000,10.742000>}
box{<0,0,-0.203200><2.231300,0.035000,0.203200> rotate<0,0.000000,0> translate<63.084300,-1.535000,10.742000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.225300,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,47.142400>}
box{<0,0,-0.203200><7.575500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.225300,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.281200,-1.535000,18.233900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.948700,-1.535000,18.510400>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,-22.499427,0> translate<63.281200,-1.535000,18.233900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.281200,-1.535000,21.866000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.948700,-1.535000,21.589500>}
box{<0,0,-0.203200><0.722502,0.035000,0.203200> rotate<0,22.499427,0> translate<63.281200,-1.535000,21.866000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,23.935600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,25.324300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<63.326300,-1.535000,25.324300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,23.977600>}
box{<0,0,-0.203200><7.474500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.326300,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,24.384000>}
box{<0,0,-0.203200><7.474500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.326300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,24.790400>}
box{<0,0,-0.203200><7.474500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.326300,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.326300,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,25.196800>}
box{<0,0,-0.203200><7.474500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.326300,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.411800,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,18.288000>}
box{<0,0,-0.203200><0.727400,0.035000,0.203200> rotate<0,0.000000,0> translate<63.411800,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.441800,-1.535000,15.589600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,16.287000>}
box{<0,0,-0.203200><0.986273,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.441800,-1.535000,15.589600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.631700,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,46.736000>}
box{<0,0,-0.203200><7.169100,0.035000,0.203200> rotate<0,0.000000,0> translate<63.631700,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.948700,-1.535000,18.510400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,18.701000>}
box{<0,0,-0.203200><0.269478,0.035000,0.203200> rotate<0,-45.012064,0> translate<63.948700,-1.535000,18.510400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.948700,-1.535000,21.589500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.190000,-1.535000,21.348200>}
box{<0,0,-0.203200><0.341250,0.035000,0.203200> rotate<0,44.997030,0> translate<63.948700,-1.535000,21.589500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.999000,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.381000,-1.535000,21.539200>}
box{<0,0,-0.203200><0.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<63.999000,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.038100,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,46.329600>}
box{<0,0,-0.203200><6.762700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.038100,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.132600,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,18.694400>}
box{<0,0,-0.203200><0.006600,0.035000,0.203200> rotate<0,0.000000,0> translate<64.132600,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,18.701000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.139200,-1.535000,16.287000>}
box{<0,0,-0.203200><2.414000,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.139200,-1.535000,16.287000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.190000,-1.535000,21.348200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.707700,-1.535000,21.866000>}
box{<0,0,-0.203200><0.732209,0.035000,0.203200> rotate<0,-45.002563,0> translate<64.190000,-1.535000,21.348200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.444500,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,45.923200>}
box{<0,0,-0.203200><6.356300,0.035000,0.203200> rotate<0,0.000000,0> translate<64.444500,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452700,-1.535000,32.199200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.938100,-1.535000,32.400300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<64.452700,-1.535000,32.199200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.707700,-1.535000,21.866000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.212200,-1.535000,21.866000>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<64.707700,-1.535000,21.866000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.850900,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,45.516800>}
box{<0,0,-0.203200><5.949900,0.035000,0.203200> rotate<0,0.000000,0> translate<64.850900,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.938100,-1.535000,32.400300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.309600,-1.535000,32.771800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<64.938100,-1.535000,32.400300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.049800,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,32.512000>}
box{<0,0,-0.203200><5.751000,0.035000,0.203200> rotate<0,0.000000,0> translate<65.049800,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.257300,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,45.110400>}
box{<0,0,-0.203200><5.543500,0.035000,0.203200> rotate<0,0.000000,0> translate<65.257300,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.309600,-1.535000,32.771800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.309600,-1.535000,32.771900>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<65.309600,-1.535000,32.771900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.309600,-1.535000,32.771900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.208000,-1.535000,33.670300>}
box{<0,0,-0.203200><1.270529,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.309600,-1.535000,32.771900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.315600,-1.535000,10.742000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.969100,-1.535000,11.012700>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-22.499371,0> translate<65.315600,-1.535000,10.742000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.456100,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,32.918400>}
box{<0,0,-0.203200><5.344700,0.035000,0.203200> rotate<0,0.000000,0> translate<65.456100,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.663700,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,44.704000>}
box{<0,0,-0.203200><5.137100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.663700,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.718600,-1.535000,14.130900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.969100,-1.535000,14.027200>}
box{<0,0,-0.203200><0.271116,0.035000,0.203200> rotate<0,22.486704,0> translate<65.718600,-1.535000,14.130900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.718600,-1.535000,14.130900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.579600,-1.535000,14.991800>}
box{<0,0,-0.203200><1.217567,0.035000,0.203200> rotate<0,-44.993703,0> translate<65.718600,-1.535000,14.130900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<65.760800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<65.760800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<65.760800,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,50.428800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,49.711800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<65.760800,-1.535000,50.428800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,51.171100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,50.428800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<65.760800,-1.535000,50.428800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.760800,-1.535000,51.171100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,51.888100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<65.760800,-1.535000,51.171100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.811700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,14.224000>}
box{<0,0,-0.203200><4.989100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.811700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.862500,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,33.324800>}
box{<0,0,-0.203200><4.938300,0.035000,0.203200> rotate<0,0.000000,0> translate<65.862500,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.872700,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,10.972800>}
box{<0,0,-0.203200><4.928100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.872700,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<65.952900,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<65.952900,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,49.711800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,49.068900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<65.952900,-1.535000,49.711800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.952900,-1.535000,51.888100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,52.531000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<65.952900,-1.535000,51.888100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.969100,-1.535000,11.012700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.469200,-1.535000,11.512800>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.969100,-1.535000,11.012700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.969100,-1.535000,14.027200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.469200,-1.535000,13.527100>}
box{<0,0,-0.203200><0.707248,0.035000,0.203200> rotate<0,44.997030,0> translate<65.969100,-1.535000,14.027200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.070100,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,44.297600>}
box{<0,0,-0.203200><4.730700,0.035000,0.203200> rotate<0,0.000000,0> translate<66.070100,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.178700,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,13.817600>}
box{<0,0,-0.203200><4.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.178700,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.208000,-1.535000,33.670300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.208100,-1.535000,33.670300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.208000,-1.535000,33.670300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.208100,-1.535000,33.670300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.579600,-1.535000,34.041800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<66.208100,-1.535000,33.670300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.212200,-1.535000,21.866000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,20.802200>}
box{<0,0,-0.203200><1.504440,0.035000,0.203200> rotate<0,44.997030,0> translate<66.212200,-1.535000,21.866000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.218100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,14.630400>}
box{<0,0,-0.203200><4.582700,0.035000,0.203200> rotate<0,0.000000,0> translate<66.218100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.248100,-1.535000,44.119600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.619600,-1.535000,43.748100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<66.248100,-1.535000,44.119600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.269000,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,33.731200>}
box{<0,0,-0.203200><4.531800,0.035000,0.203200> rotate<0,0.000000,0> translate<66.269000,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,1.554100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<66.324100,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<66.324100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,49.068900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,48.544100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<66.324100,-1.535000,49.068900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.324100,-1.535000,52.531000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.584000,-1.535000,52.790800>}
box{<0,0,-0.203200><0.367483,0.035000,0.203200> rotate<0,-44.986006,0> translate<66.324100,-1.535000,52.531000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.335600,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,11.379200>}
box{<0,0,-0.203200><4.465200,0.035000,0.203200> rotate<0,0.000000,0> translate<66.335600,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.469200,-1.535000,11.512800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.166300>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,-67.494689,0> translate<66.469200,-1.535000,11.512800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.469200,-1.535000,13.527100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.873600>}
box{<0,0,-0.203200><0.707348,0.035000,0.203200> rotate<0,67.494689,0> translate<66.469200,-1.535000,13.527100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.476500,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,43.891200>}
box{<0,0,-0.203200><4.324300,0.035000,0.203200> rotate<0,0.000000,0> translate<66.476500,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.517300,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,13.411200>}
box{<0,0,-0.203200><4.283500,0.035000,0.203200> rotate<0,0.000000,0> translate<66.517300,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.539000,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,21.539200>}
box{<0,0,-0.203200><4.261800,0.035000,0.203200> rotate<0,0.000000,0> translate<66.539000,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.579600,-1.535000,14.991800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,15.477200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<66.579600,-1.535000,14.991800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.579600,-1.535000,34.041800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,34.527200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<66.579600,-1.535000,34.041800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.582200,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,11.785600>}
box{<0,0,-0.203200><4.218600,0.035000,0.203200> rotate<0,0.000000,0> translate<66.582200,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.598200,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,15.036800>}
box{<0,0,-0.203200><4.202600,0.035000,0.203200> rotate<0,0.000000,0> translate<66.598200,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.619200,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,34.137600>}
box{<0,0,-0.203200><4.181600,0.035000,0.203200> rotate<0,0.000000,0> translate<66.619200,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.619600,-1.535000,43.748100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,43.262700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<66.619600,-1.535000,43.748100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.685600,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,13.004800>}
box{<0,0,-0.203200><4.115200,0.035000,0.203200> rotate<0,0.000000,0> translate<66.685600,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.728700,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,43.484800>}
box{<0,0,-0.203200><4.072100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.728700,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.166300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.873600>}
box{<0,0,-0.203200><0.707300,0.035000,0.203200> rotate<0,90.000000,0> translate<66.739900,-1.535000,12.873600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,12.192000>}
box{<0,0,-0.203200><4.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<66.739900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.739900,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,12.598400>}
box{<0,0,-0.203200><4.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<66.739900,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.766600,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,15.443200>}
box{<0,0,-0.203200><4.034200,0.035000,0.203200> rotate<0,0.000000,0> translate<66.766600,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,15.477200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,16.002700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,90.000000,0> translate<66.780700,-1.535000,16.002700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,15.849600>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,16.002700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,18.802400>}
box{<0,0,-0.203200><2.799700,0.035000,0.203200> rotate<0,90.000000,0> translate<66.780700,-1.535000,18.802400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,16.256000>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,16.662400>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,17.068800>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,17.475200>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,17.881600>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,18.288000>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,18.694400>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,18.802400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,19.297700>}
box{<0,0,-0.203200><0.700460,0.035000,0.203200> rotate<0,-44.997030,0> translate<66.780700,-1.535000,18.802400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,34.527200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,36.280000>}
box{<0,0,-0.203200><1.752800,0.035000,0.203200> rotate<0,90.000000,0> translate<66.780700,-1.535000,36.280000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,34.544000>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,34.950400>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,35.356800>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,35.763200>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,36.169600>}
box{<0,0,-0.203200><4.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.780700,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.780700,-1.535000,36.280000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,36.635600>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<66.780700,-1.535000,36.280000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,38.339900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,43.262700>}
box{<0,0,-0.203200><4.922800,0.035000,0.203200> rotate<0,90.000000,0> translate<66.820700,-1.535000,43.262700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,38.339900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,38.024300>}
box{<0,0,-0.203200><0.446326,0.035000,0.203200> rotate<0,44.997030,0> translate<66.820700,-1.535000,38.339900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,38.608000>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,39.014400>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,39.420800>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,39.827200>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,40.233600>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,40.640000>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,41.046400>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,41.452800>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,41.859200>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,42.265600>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,42.672000>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.820700,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,43.078400>}
box{<0,0,-0.203200><3.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.820700,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.429300,-1.535000,1.219100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,29.991053,0> translate<66.848900,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.491800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<66.848900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.848900,-1.535000,48.544100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.491800,-1.535000,48.172900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<66.848900,-1.535000,48.544100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.945400,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,21.132800>}
box{<0,0,-0.203200><3.855400,0.035000,0.203200> rotate<0,0.000000,0> translate<66.945400,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.959000,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,38.201600>}
box{<0,0,-0.203200><3.841800,0.035000,0.203200> rotate<0,0.000000,0> translate<66.959000,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.076700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,36.576000>}
box{<0,0,-0.203200><3.724100,0.035000,0.203200> rotate<0,0.000000,0> translate<67.076700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.079100,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,19.100800>}
box{<0,0,-0.203200><3.721700,0.035000,0.203200> rotate<0,0.000000,0> translate<67.079100,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,36.635600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,38.024300>}
box{<0,0,-0.203200><1.388700,0.035000,0.203200> rotate<0,90.000000,0> translate<67.136300,-1.535000,38.024300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,36.982400>}
box{<0,0,-0.203200><3.664500,0.035000,0.203200> rotate<0,0.000000,0> translate<67.136300,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,37.388800>}
box{<0,0,-0.203200><3.664500,0.035000,0.203200> rotate<0,0.000000,0> translate<67.136300,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.136300,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,37.795200>}
box{<0,0,-0.203200><3.664500,0.035000,0.203200> rotate<0,0.000000,0> translate<67.136300,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,19.297700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,20.802200>}
box{<0,0,-0.203200><1.504500,0.035000,0.203200> rotate<0,90.000000,0> translate<67.276000,-1.535000,20.802200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,19.507200>}
box{<0,0,-0.203200><3.524800,0.035000,0.203200> rotate<0,0.000000,0> translate<67.276000,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,19.913600>}
box{<0,0,-0.203200><3.524800,0.035000,0.203200> rotate<0,0.000000,0> translate<67.276000,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,20.320000>}
box{<0,0,-0.203200><3.524800,0.035000,0.203200> rotate<0,0.000000,0> translate<67.276000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.276000,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,20.726400>}
box{<0,0,-0.203200><3.524800,0.035000,0.203200> rotate<0,0.000000,0> translate<67.276000,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.491800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.208800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<67.491800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.491800,-1.535000,48.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.208800,-1.535000,47.980800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<67.491800,-1.535000,48.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.208800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.951100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<68.208800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.208800,-1.535000,47.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.951100,-1.535000,47.980800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<68.208800,-1.535000,47.980800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.951100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.668100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<68.951100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.951100,-1.535000,47.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.668100,-1.535000,48.172900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<68.951100,-1.535000,47.980800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.424000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,6.502400>}
box{<0,0,-0.203200><1.376800,0.035000,0.203200> rotate<0,0.000000,0> translate<69.424000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.668100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.311000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<69.668100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.668100,-1.535000,48.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.311000,-1.535000,48.544100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<69.668100,-1.535000,48.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.994900,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,48.361600>}
box{<0,0,-0.203200><0.805900,0.035000,0.203200> rotate<0,0.000000,0> translate<69.994900,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.258700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,6.096000>}
box{<0,0,-0.203200><0.542100,0.035000,0.203200> rotate<0,0.000000,0> translate<70.258700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.311000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,5.575900>}
box{<0,0,-0.203200><0.692753,0.035000,0.203200> rotate<0,45.002878,0> translate<70.311000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.311000,-1.535000,48.544100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,49.034000>}
box{<0,0,-0.203200><0.692753,0.035000,0.203200> rotate<0,-45.002878,0> translate<70.311000,-1.535000,48.544100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.534800,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,48.768000>}
box{<0,0,-0.203200><0.266000,0.035000,0.203200> rotate<0,0.000000,0> translate<70.534800,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.687200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.113600,0.035000,0.203200> rotate<0,0.000000,0> translate<70.687200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,49.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.800800,-1.535000,5.575900>}
box{<0,0,-0.203200><43.458100,0.035000,0.203200> rotate<0,-90.000000,0> translate<70.800800,-1.535000,5.575900> }
texture{col_pol}
}
#end
union{
cylinder{<17.200000,0.038000,47.490000><17.200000,-1.538000,47.490000>0.406400}
cylinder{<17.200000,0.038000,44.950000><17.200000,-1.538000,44.950000>0.406400}
cylinder{<19.540000,0.038000,26.530000><19.540000,-1.538000,26.530000>0.406400}
cylinder{<19.540000,0.038000,31.610000><19.540000,-1.538000,31.610000>0.406400}
cylinder{<28.630000,0.038000,36.060000><28.630000,-1.538000,36.060000>0.406400}
cylinder{<28.630000,0.038000,41.140000><28.630000,-1.538000,41.140000>0.406400}
cylinder{<24.820000,0.038000,31.580000><24.820000,-1.538000,31.580000>0.406400}
cylinder{<29.900000,0.038000,31.580000><29.900000,-1.538000,31.580000>0.406400}
cylinder{<21.580000,0.038000,16.740000><21.580000,-1.538000,16.740000>0.406400}
cylinder{<24.120000,0.038000,16.740000><24.120000,-1.538000,16.740000>0.406400}
cylinder{<24.820000,0.038000,26.500000><24.820000,-1.538000,26.500000>0.406400}
cylinder{<29.900000,0.038000,26.500000><29.900000,-1.538000,26.500000>0.406400}
cylinder{<53.070000,0.038000,12.930000><53.070000,-1.538000,12.930000>0.406400}
cylinder{<53.070000,0.038000,7.850000><53.070000,-1.538000,7.850000>0.406400}
cylinder{<53.300000,0.038000,47.490000><53.300000,-1.538000,47.490000>0.406400}
cylinder{<50.760000,0.038000,47.490000><50.760000,-1.538000,47.490000>0.406400}
cylinder{<46.280000,0.038000,13.880000><46.280000,-1.538000,13.880000>0.406400}
cylinder{<46.280000,0.038000,11.340000><46.280000,-1.538000,11.340000>0.406400}
cylinder{<39.830000,0.038000,13.760000><39.830000,-1.538000,13.760000>0.406400}
cylinder{<39.830000,0.038000,11.220000><39.830000,-1.538000,11.220000>0.406400}
cylinder{<62.920000,0.038000,20.050000><62.920000,-1.538000,20.050000>0.406400}
cylinder{<65.460000,0.038000,20.050000><65.460000,-1.538000,20.050000>0.406400}
cylinder{<13.390000,0.038000,39.870000><13.390000,-1.538000,39.870000>0.406400}
cylinder{<23.550000,0.038000,39.870000><23.550000,-1.538000,39.870000>0.406400}
cylinder{<18.110000,0.038000,10.950000><18.110000,-1.538000,10.950000>0.406400}
cylinder{<28.270000,0.038000,10.950000><28.270000,-1.538000,10.950000>0.406400}
cylinder{<50.220000,0.038000,38.600000><50.220000,-1.538000,38.600000>0.406400}
cylinder{<50.220000,0.038000,36.060000><50.220000,-1.538000,36.060000>0.406400}
cylinder{<50.220000,0.038000,33.520000><50.220000,-1.538000,33.520000>0.406400}
cylinder{<50.220000,0.038000,30.980000><50.220000,-1.538000,30.980000>0.406400}
cylinder{<50.220000,0.038000,28.440000><50.220000,-1.538000,28.440000>0.406400}
cylinder{<50.220000,0.038000,25.900000><50.220000,-1.538000,25.900000>0.406400}
cylinder{<50.220000,0.038000,23.360000><50.220000,-1.538000,23.360000>0.406400}
cylinder{<57.840000,0.038000,23.360000><57.840000,-1.538000,23.360000>0.406400}
cylinder{<57.840000,0.038000,25.900000><57.840000,-1.538000,25.900000>0.406400}
cylinder{<57.840000,0.038000,28.440000><57.840000,-1.538000,28.440000>0.406400}
cylinder{<57.840000,0.038000,30.980000><57.840000,-1.538000,30.980000>0.406400}
cylinder{<57.840000,0.038000,33.520000><57.840000,-1.538000,33.520000>0.406400}
cylinder{<57.840000,0.038000,36.060000><57.840000,-1.538000,36.060000>0.406400}
cylinder{<57.840000,0.038000,38.600000><57.840000,-1.538000,38.600000>0.406400}
cylinder{<13.400000,0.038000,30.320000><13.400000,-1.538000,30.320000>0.508000}
cylinder{<13.400000,0.038000,27.780000><13.400000,-1.538000,27.780000>0.508000}
cylinder{<41.870000,0.038000,47.450000><41.870000,-1.538000,47.450000>0.508000}
cylinder{<39.330000,0.038000,47.450000><39.330000,-1.538000,47.450000>0.508000}
cylinder{<64.200000,0.038000,9.980000><64.200000,-1.538000,9.980000>0.508000}
cylinder{<64.200000,0.038000,12.520000><64.200000,-1.538000,12.520000>0.508000}
cylinder{<29.130000,0.038000,19.280000><29.130000,-1.538000,19.280000>0.406400}
cylinder{<29.130000,0.038000,21.820000><29.130000,-1.538000,21.820000>0.406400}
cylinder{<29.130000,0.038000,16.740000><29.130000,-1.538000,16.740000>0.406400}
cylinder{<15.930000,0.038000,16.070000><15.930000,-1.538000,16.070000>0.406400}
cylinder{<15.930000,0.038000,18.610000><15.930000,-1.538000,18.610000>0.406400}
cylinder{<15.930000,0.038000,13.530000><15.930000,-1.538000,13.530000>0.406400}
cylinder{<12.120000,0.038000,36.060000><12.120000,-1.538000,36.060000>0.406400}
cylinder{<24.820000,0.038000,36.060000><24.820000,-1.538000,36.060000>0.406400}
cylinder{<34.980000,0.038000,47.490000><34.980000,-1.538000,47.490000>0.406400}
cylinder{<22.280000,0.038000,47.490000><22.280000,-1.538000,47.490000>0.406400}
cylinder{<12.120000,0.038000,18.280000><12.120000,-1.538000,18.280000>0.406400}
cylinder{<12.120000,0.038000,5.580000><12.120000,-1.538000,5.580000>0.406400}
cylinder{<23.550000,0.038000,22.020000><23.550000,-1.538000,22.020000>0.406400}
cylinder{<10.850000,0.038000,22.020000><10.850000,-1.538000,22.020000>0.406400}
cylinder{<32.440000,0.038000,33.520000><32.440000,-1.538000,33.520000>0.406400}
cylinder{<45.140000,0.038000,33.520000><45.140000,-1.538000,33.520000>0.406400}
cylinder{<29.440000,0.038000,7.460000><29.440000,-1.538000,7.460000>0.406400}
cylinder{<16.740000,0.038000,7.460000><16.740000,-1.538000,7.460000>0.406400}
cylinder{<37.520000,0.038000,29.710000><37.520000,-1.538000,29.710000>0.406400}
cylinder{<37.520000,0.038000,17.010000><37.520000,-1.538000,17.010000>0.406400}
cylinder{<32.440000,0.038000,41.140000><32.440000,-1.538000,41.140000>0.406400}
cylinder{<45.140000,0.038000,41.140000><45.140000,-1.538000,41.140000>0.406400}
cylinder{<32.440000,0.038000,37.330000><32.440000,-1.538000,37.330000>0.406400}
cylinder{<45.140000,0.038000,37.330000><45.140000,-1.538000,37.330000>0.406400}
cylinder{<33.980000,0.038000,7.380000><33.980000,-1.538000,7.380000>0.406400}
cylinder{<33.980000,0.038000,20.080000><33.980000,-1.538000,20.080000>0.406400}
cylinder{<61.650000,0.038000,24.630000><61.650000,-1.538000,24.630000>0.406400}
cylinder{<61.650000,0.038000,37.330000><61.650000,-1.538000,37.330000>0.406400}
cylinder{<8.310000,0.038000,5.580000><8.310000,-1.538000,5.580000>0.406400}
cylinder{<8.310000,0.038000,18.280000><8.310000,-1.538000,18.280000>0.406400}
cylinder{<65.460000,0.038000,24.630000><65.460000,-1.538000,24.630000>0.406400}
cylinder{<65.460000,0.038000,37.330000><65.460000,-1.538000,37.330000>0.406400}
cylinder{<61.650000,0.038000,42.410000><61.650000,-1.538000,42.410000>0.406400}
cylinder{<48.950000,0.038000,42.410000><48.950000,-1.538000,42.410000>0.406400}
cylinder{<41.330000,0.038000,17.010000><41.330000,-1.538000,17.010000>0.406400}
cylinder{<41.330000,0.038000,29.710000><41.330000,-1.538000,29.710000>0.406400}
cylinder{<45.140000,0.038000,29.710000><45.140000,-1.538000,29.710000>0.406400}
cylinder{<45.140000,0.038000,17.010000><45.140000,-1.538000,17.010000>0.406400}
cylinder{<57.240000,0.038000,5.350000><57.240000,-1.538000,5.350000>0.406400}
cylinder{<57.240000,0.038000,18.050000><57.240000,-1.538000,18.050000>0.406400}
//Holes(fast)/Vias
cylinder{<55.300000,0.038000,27.240000><55.300000,-1.538000,27.240000>0.400000 }
cylinder{<55.300000,0.038000,37.260000><55.300000,-1.538000,37.260000>0.400000 }
cylinder{<46.910000,0.038000,39.370000><46.910000,-1.538000,39.370000>0.400000 }
cylinder{<46.980000,0.038000,31.480000><46.980000,-1.538000,31.480000>0.400000 }
cylinder{<60.380000,0.038000,22.090000><60.380000,-1.538000,22.090000>0.400000 }
cylinder{<60.380000,0.038000,17.070000><60.380000,-1.538000,17.070000>0.400000 }
cylinder{<47.280000,0.038000,28.440000><47.280000,-1.538000,28.440000>0.400000 }
cylinder{<47.280000,0.038000,19.320000><47.280000,-1.538000,19.320000>0.400000 }
cylinder{<53.000000,0.038000,32.200000><53.000000,-1.538000,32.200000>0.400000 }
cylinder{<53.000000,0.038000,19.000000><53.000000,-1.538000,19.000000>0.400000 }
cylinder{<50.000000,0.038000,7.000000><50.000000,-1.538000,7.000000>0.400000 }
cylinder{<50.000000,0.038000,14.000000><50.000000,-1.538000,14.000000>0.400000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,48.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,47.871000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.470000,0.000000,47.871000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.089000,0.000000,47.871000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,47.871000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.089000,0.000000,47.871000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,47.871000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,47.490000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.470000,0.000000,47.490000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,47.871000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.851000,0.000000,47.871000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.470000,0.000000,47.871000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,47.871000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,46.982000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.200000,0.000000,46.982000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,46.982000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,46.982000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.930000,0.000000,46.982000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,46.982000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,46.474000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.930000,0.000000,46.474000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,46.474000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,46.474000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.930000,0.000000,46.474000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,46.474000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,46.982000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.470000,0.000000,46.982000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,46.982000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,46.982000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.200000,0.000000,46.982000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,45.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.200000,0.000000,44.569000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.200000,0.000000,44.569000> }
difference{
cylinder{<17.200000,0,46.220000><17.200000,0.036000,46.220000>2.870200 translate<0,0.000000,0>}
cylinder{<17.200000,-0.1,46.220000><17.200000,0.135000,46.220000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<17.200000,0.000000,45.712000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.905000,0.000000,28.765200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.540000,0.000000,28.765200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.905000,0.000000,28.765200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.540000,0.000000,28.765200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.175000,0.000000,28.765200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.540000,0.000000,28.765200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.540000,0.000000,28.765200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.540000,0.000000,27.546000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.540000,0.000000,27.546000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.905000,0.000000,29.400200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.540000,0.000000,29.400200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.905000,0.000000,29.400200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.540000,0.000000,29.400200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.175000,0.000000,29.400200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.540000,0.000000,29.400200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.540000,0.000000,29.400200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.540000,0.000000,30.594000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<19.540000,0.000000,30.594000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.016000,0.000000,25.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.064000,0.000000,25.387000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.016000,0.000000,25.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.318000,0.000000,25.641000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.318000,0.000000,32.499000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.318000,0.000000,32.499000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.064000,0.000000,32.753000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.016000,0.000000,32.753000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.016000,0.000000,32.753000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.762000,0.000000,32.499000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.762000,0.000000,25.641000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.762000,0.000000,25.641000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.016000,0.000000,32.499000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.064000,0.000000,32.499000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.064000,0.000000,25.641000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.016000,0.000000,25.641000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.995000,0.000000,38.295200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.630000,0.000000,38.295200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.995000,0.000000,38.295200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.630000,0.000000,38.295200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.265000,0.000000,38.295200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<28.630000,0.000000,38.295200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.630000,0.000000,38.295200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.630000,0.000000,37.076000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.630000,0.000000,37.076000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.995000,0.000000,38.930200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.630000,0.000000,38.930200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.995000,0.000000,38.930200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.630000,0.000000,38.930200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.265000,0.000000,38.930200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<28.630000,0.000000,38.930200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.630000,0.000000,38.930200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.630000,0.000000,40.124000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<28.630000,0.000000,40.124000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.106000,0.000000,34.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.154000,0.000000,34.917000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.106000,0.000000,34.917000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.408000,0.000000,35.171000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.408000,0.000000,42.029000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.408000,0.000000,42.029000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.154000,0.000000,42.283000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.106000,0.000000,42.283000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.106000,0.000000,42.283000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.852000,0.000000,42.029000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.852000,0.000000,35.171000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.852000,0.000000,35.171000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.106000,0.000000,42.029000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.154000,0.000000,42.029000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.154000,0.000000,35.171000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.106000,0.000000,35.171000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,32.215000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,31.580000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.055200,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,30.945000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.055200,0.000000,30.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.055200,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.836000,0.000000,31.580000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<25.836000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,32.215000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,31.580000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.690200,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,30.945000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.690200,0.000000,30.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.690200,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.884000,0.000000,31.580000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.690200,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.677000,0.000000,33.104000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.677000,0.000000,30.056000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.677000,0.000000,30.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.931000,0.000000,29.802000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.789000,0.000000,29.802000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.931000,0.000000,29.802000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,30.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,33.104000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.043000,0.000000,33.104000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.789000,0.000000,33.358000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.931000,0.000000,33.358000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.931000,0.000000,33.358000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.789000,0.000000,33.104000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.789000,0.000000,30.056000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.931000,0.000000,30.056000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.931000,0.000000,33.104000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.818000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,18.010000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.818000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,17.629000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,18.010000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.199000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.580000,0.000000,18.010000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.199000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,18.391000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.199000,0.000000,18.391000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.199000,0.000000,16.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,16.740000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.199000,0.000000,16.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,16.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,15.470000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.088000,0.000000,15.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,15.470000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.596000,0.000000,15.470000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.088000,0.000000,15.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.596000,0.000000,15.470000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.596000,0.000000,18.010000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.596000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.596000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,18.010000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.088000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.088000,0.000000,16.740000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.088000,0.000000,16.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.485000,0.000000,16.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.501000,0.000000,16.740000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.485000,0.000000,16.740000> }
difference{
cylinder{<22.850000,0,16.740000><22.850000,0.036000,16.740000>2.870200 translate<0,0.000000,0>}
cylinder{<22.850000,-0.1,16.740000><22.850000,0.135000,16.740000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<23.358000,0.000000,16.740000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,27.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,26.500000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.055200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.055200,0.000000,25.865000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.055200,0.000000,25.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.055200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.836000,0.000000,26.500000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<25.836000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,27.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,26.500000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.690200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.690200,0.000000,25.865000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.690200,0.000000,25.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.690200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.884000,0.000000,26.500000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.690200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.677000,0.000000,28.024000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.677000,0.000000,24.976000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.677000,0.000000,24.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.931000,0.000000,24.722000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.789000,0.000000,24.722000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.931000,0.000000,24.722000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,24.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,28.024000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.043000,0.000000,28.024000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.789000,0.000000,28.278000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.931000,0.000000,28.278000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.931000,0.000000,28.278000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.789000,0.000000,28.024000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.789000,0.000000,24.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.931000,0.000000,24.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.931000,0.000000,28.024000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.705000,0.000000,10.694800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.070000,0.000000,10.694800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.070000,0.000000,10.694800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.070000,0.000000,10.694800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.435000,0.000000,10.694800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<52.435000,0.000000,10.694800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.070000,0.000000,10.694800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.070000,0.000000,11.914000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<53.070000,0.000000,11.914000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.705000,0.000000,10.059800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.070000,0.000000,10.059800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.070000,0.000000,10.059800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.070000,0.000000,10.059800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.435000,0.000000,10.059800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<52.435000,0.000000,10.059800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.070000,0.000000,10.059800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.070000,0.000000,8.866000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.070000,0.000000,8.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.594000,0.000000,14.073000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.546000,0.000000,14.073000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.546000,0.000000,14.073000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.292000,0.000000,13.819000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.292000,0.000000,6.961000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.292000,0.000000,6.961000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.546000,0.000000,6.707000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.594000,0.000000,6.707000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.546000,0.000000,6.707000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.848000,0.000000,6.961000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.848000,0.000000,13.819000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.848000,0.000000,13.819000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.594000,0.000000,6.961000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.546000,0.000000,6.961000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.546000,0.000000,13.819000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.594000,0.000000,13.819000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.062000,0.000000,46.220000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,46.220000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.681000,0.000000,46.220000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,46.601000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,46.220000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.681000,0.000000,46.220000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,46.220000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.300000,0.000000,46.220000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.300000,0.000000,46.220000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,46.220000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,45.839000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.681000,0.000000,45.839000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.681000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,47.490000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.792000,0.000000,47.490000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,48.760000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.792000,0.000000,48.760000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,48.760000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.284000,0.000000,48.760000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.284000,0.000000,48.760000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.284000,0.000000,48.760000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.284000,0.000000,46.220000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.284000,0.000000,46.220000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.284000,0.000000,46.220000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,46.220000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.284000,0.000000,46.220000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,46.220000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.792000,0.000000,47.490000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.792000,0.000000,47.490000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.395000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.379000,0.000000,47.490000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.379000,0.000000,47.490000> }
difference{
cylinder{<52.030000,0,47.490000><52.030000,0.036000,47.490000>2.870200 translate<0,0.000000,0>}
cylinder{<52.030000,-0.1,47.490000><52.030000,0.135000,47.490000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<51.522000,0.000000,47.490000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,14.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,14.261000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.550000,0.000000,14.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.169000,0.000000,14.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,14.261000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.169000,0.000000,14.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,14.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,13.880000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.550000,0.000000,13.880000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,14.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.931000,0.000000,14.261000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.550000,0.000000,14.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,14.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,13.372000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.280000,0.000000,13.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,13.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.010000,0.000000,13.372000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.010000,0.000000,13.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.010000,0.000000,13.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.010000,0.000000,12.864000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.010000,0.000000,12.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.010000,0.000000,12.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,12.864000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.010000,0.000000,12.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,12.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,13.372000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.550000,0.000000,13.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.550000,0.000000,13.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,13.372000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.280000,0.000000,13.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,11.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.280000,0.000000,10.959000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.280000,0.000000,10.959000> }
difference{
cylinder{<46.280000,0,12.610000><46.280000,0.036000,12.610000>2.870200 translate<0,0.000000,0>}
cylinder{<46.280000,-0.1,12.610000><46.280000,0.135000,12.610000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<46.280000,0.000000,12.102000>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,14.522000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,14.141000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.100000,0.000000,14.141000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.719000,0.000000,14.141000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,14.141000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.719000,0.000000,14.141000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,14.141000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,13.760000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.100000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,14.141000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.481000,0.000000,14.141000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.100000,0.000000,14.141000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,14.141000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,13.252000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.830000,0.000000,13.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,13.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.560000,0.000000,13.252000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.560000,0.000000,13.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.560000,0.000000,13.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.560000,0.000000,12.744000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.560000,0.000000,12.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.560000,0.000000,12.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,12.744000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.560000,0.000000,12.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,12.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,13.252000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.100000,0.000000,13.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.100000,0.000000,13.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,13.252000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.830000,0.000000,13.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,11.855000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.830000,0.000000,10.839000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.830000,0.000000,10.839000> }
difference{
cylinder{<39.830000,0,12.490000><39.830000,0.036000,12.490000>2.870200 translate<0,0.000000,0>}
cylinder{<39.830000,-0.1,12.490000><39.830000,0.135000,12.490000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<39.830000,0.000000,11.982000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.158000,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,21.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.158000,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,20.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,21.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.539000,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.920000,0.000000,21.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.539000,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,21.701000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.539000,0.000000,21.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,20.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,20.050000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.539000,0.000000,20.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,20.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,18.780000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.428000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.936000,0.000000,18.780000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.428000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.936000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.936000,0.000000,21.320000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.936000,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.936000,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,21.320000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.428000,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.428000,0.000000,20.050000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.428000,0.000000,20.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.825000,0.000000,20.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.841000,0.000000,20.050000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.825000,0.000000,20.050000> }
difference{
cylinder{<64.190000,0,20.050000><64.190000,0.036000,20.050000>2.870200 translate<0,0.000000,0>}
cylinder{<64.190000,-0.1,20.050000><64.190000,0.135000,20.050000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<64.698000,0.000000,20.050000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.390000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<14.279000,0.000000,39.870000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<13.390000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.550000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<22.661000,0.000000,39.870000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<22.661000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.105000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.470000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.454000,0.000000,39.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.454000,0.000000,40.505000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.454000,0.000000,40.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.454000,0.000000,40.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<17.454000,0.000000,40.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.946000,0.000000,39.870000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.946000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.454000,0.000000,39.235000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<17.454000,0.000000,39.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,40.505000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.470000,0.000000,40.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.216000,0.000000,39.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.235000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.216000,0.000000,39.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.470000,0.000000,39.870000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.470000,0.000000,39.870000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.438000,0.000000,39.108000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.502000,0.000000,39.108000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.502000,0.000000,40.632000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.438000,0.000000,40.632000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.184000,0.000000,39.108000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.184000,0.000000,40.632000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.184000,0.000000,40.632000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.756000,0.000000,39.108000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.756000,0.000000,40.632000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.756000,0.000000,40.632000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.502000,0.000000,38.854000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.438000,0.000000,38.854000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.438000,0.000000,38.854000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.502000,0.000000,40.886000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.438000,0.000000,40.886000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.438000,0.000000,40.886000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<20.121000,0.000000,39.870000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.231500,0.000000,39.870000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.708500,0.000000,39.870000>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.110000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.999000,0.000000,10.950000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<18.110000,0.000000,10.950000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.270000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<27.381000,0.000000,10.950000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<27.381000,0.000000,10.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.825000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.190000,0.000000,10.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,10.315000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,11.585000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.174000,0.000000,11.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,11.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<22.174000,0.000000,11.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.666000,0.000000,10.950000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.666000,0.000000,10.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,10.315000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<22.174000,0.000000,10.315000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.315000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.190000,0.000000,10.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,10.950000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190000,0.000000,11.585000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.190000,0.000000,11.585000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.158000,0.000000,10.188000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.222000,0.000000,10.188000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.222000,0.000000,11.712000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.158000,0.000000,11.712000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,11.712000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,10.188000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,10.188000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.476000,0.000000,10.188000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.476000,0.000000,11.712000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.476000,0.000000,11.712000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,9.934000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.158000,0.000000,9.934000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.158000,0.000000,9.934000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.966000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.158000,0.000000,11.966000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.158000,0.000000,11.966000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<24.841000,0.000000,10.950000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.951500,0.000000,10.950000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.428500,0.000000,10.950000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.951000,0.000000,22.090000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.951000,0.000000,39.870000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.951000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.109000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.109000,0.000000,22.090000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.109000,0.000000,22.090000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.951000,0.000000,22.090000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.109000,0.000000,22.090000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.109000,0.000000,22.090000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.951000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.046000,0.000000,39.870000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.046000,0.000000,39.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.109000,0.000000,39.870000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.014000,0.000000,39.870000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.109000,0.000000,39.870000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<54.030000,0.000000,39.870000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.860000,0.000000,27.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.479000,0.000000,27.780000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.479000,0.000000,27.780000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.400000,0.000000,26.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,26.510000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,26.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,26.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,27.780000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.479000,0.000000,27.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.479000,0.000000,28.034000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.479000,0.000000,27.780000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.479000,0.000000,27.780000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,27.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,29.050000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.479000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.400000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,31.590000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.479000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.479000,0.000000,29.050000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.479000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.400000,0.000000,26.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,26.510000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.400000,0.000000,26.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,26.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,29.050000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.321000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.400000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,31.590000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.400000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,30.955000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.321000,0.000000,30.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,30.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,29.685000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<16.321000,0.000000,29.685000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,29.685000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,29.050000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.321000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,26.764000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.321000,0.000000,27.145000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.321000,0.000000,27.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,26.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,27.145000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.321000,0.000000,27.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,27.145000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,27.145000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.686000,0.000000,27.145000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,27.145000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,28.415000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<15.686000,0.000000,28.415000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,28.415000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,28.415000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.686000,0.000000,28.415000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,28.415000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,29.685000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.321000,0.000000,29.685000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,29.685000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,29.685000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.686000,0.000000,29.685000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,29.685000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,30.955000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<15.686000,0.000000,30.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.686000,0.000000,30.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,30.955000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.686000,0.000000,30.955000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,30.955000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.321000,0.000000,31.590000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.321000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,27.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,27.780000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,27.780000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,27.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,28.034000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.495000,0.000000,28.034000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,28.034000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.066000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.495000,0.000000,30.066000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.066000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.320000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.495000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,30.320000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,27.780000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.003000,0.000000,28.034000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<11.495000,0.000000,27.780000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,28.034000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,28.034000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,28.034000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.003000,0.000000,28.034000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.003000,0.000000,30.066000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<12.003000,0.000000,30.066000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.003000,0.000000,30.066000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.320000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<11.495000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.479000,0.000000,30.066000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.495000,0.000000,30.066000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.479000,0.000000,30.066000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.400000,0.000000,27.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.400000,0.000000,30.320000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,49.990000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,50.371000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.330000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,47.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,50.371000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.060000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,50.371000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.060000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.584000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,50.371000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.330000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.600000,0.000000,50.371000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.330000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.140000,0.000000,47.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.140000,0.000000,50.371000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<43.140000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.140000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.600000,0.000000,50.371000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.600000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,47.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,44.529000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<38.060000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.600000,0.000000,44.529000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.060000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.140000,0.000000,47.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.140000,0.000000,44.529000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<43.140000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.140000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.505000,0.000000,44.529000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<42.505000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.505000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.235000,0.000000,44.529000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.235000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.235000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.600000,0.000000,44.529000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.600000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.314000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.695000,0.000000,44.529000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<38.314000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.060000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.695000,0.000000,44.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.060000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.695000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.695000,0.000000,45.164000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.695000,0.000000,45.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.695000,0.000000,45.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.965000,0.000000,45.164000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.695000,0.000000,45.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.965000,0.000000,45.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.965000,0.000000,44.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.965000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.965000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.235000,0.000000,44.529000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.965000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.235000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.235000,0.000000,45.164000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.235000,0.000000,45.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.235000,0.000000,45.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.505000,0.000000,45.164000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.235000,0.000000,45.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.505000,0.000000,45.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.505000,0.000000,44.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<42.505000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.505000,0.000000,44.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.140000,0.000000,44.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<42.505000,0.000000,44.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,50.371000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<39.330000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,49.355000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.330000,0.000000,49.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,49.355000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.584000,0.000000,49.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.870000,0.000000,49.355000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.616000,0.000000,49.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.870000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.870000,0.000000,50.371000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.870000,0.000000,50.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.330000,0.000000,49.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,48.847000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<39.330000,0.000000,49.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,49.355000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.584000,0.000000,49.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.584000,0.000000,48.847000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,48.847000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.584000,0.000000,48.847000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,48.847000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.870000,0.000000,49.355000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<41.616000,0.000000,48.847000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,50.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.616000,0.000000,49.355000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.616000,0.000000,49.355000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.330000,0.000000,47.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.870000,0.000000,47.450000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.740000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.121000,0.000000,12.520000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<66.740000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.200000,0.000000,13.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,13.790000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.200000,0.000000,13.790000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,13.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,12.520000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.121000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.121000,0.000000,12.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.121000,0.000000,12.520000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.121000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,11.250000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.121000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.200000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,8.710000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.200000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.121000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.121000,0.000000,11.250000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.121000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.200000,0.000000,13.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,13.790000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,13.790000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,13.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,11.250000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.279000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.200000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,8.710000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,9.345000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.279000,0.000000,9.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,9.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,10.615000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<61.279000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,11.250000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.279000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,13.536000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.279000,0.000000,13.155000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.279000,0.000000,13.155000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,13.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,13.155000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.279000,0.000000,13.155000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,13.155000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,13.155000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,13.155000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,13.155000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,11.885000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.914000,0.000000,11.885000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,11.885000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,11.885000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,11.885000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,11.885000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,10.615000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.279000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,10.615000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,9.345000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.914000,0.000000,9.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.914000,0.000000,9.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,9.345000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.279000,0.000000,9.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,9.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.279000,0.000000,8.710000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.279000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,12.520000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.105000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.266000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<66.105000,0.000000,12.266000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.266000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,10.234000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<66.105000,0.000000,10.234000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,10.234000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,9.980000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<66.105000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,9.980000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,9.980000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.105000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.597000,0.000000,12.266000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<65.597000,0.000000,12.266000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,12.266000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,12.266000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.105000,0.000000,12.266000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.597000,0.000000,12.266000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.597000,0.000000,10.234000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<65.597000,0.000000,10.234000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.597000,0.000000,10.234000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,9.980000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<65.597000,0.000000,10.234000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.121000,0.000000,10.234000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.105000,0.000000,10.234000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.105000,0.000000,10.234000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<64.200000,0.000000,12.520000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<64.200000,0.000000,9.980000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.479000,0.000000,21.375000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.479000,0.000000,17.185000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.479000,0.000000,17.185000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<29.130000,0.000000,19.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,18.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,20.416000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.003000,0.000000,20.416000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<29.129900,0.000000,19.280000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<29.130100,0.000000,19.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,20.684000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,21.944000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.003000,0.000000,21.944000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<29.130100,0.000000,19.280500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,20.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,20.684000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.003000,0.000000,20.684000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<29.130100,0.000000,19.280000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<29.129900,0.000000,19.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,16.616000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,17.876000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.003000,0.000000,17.876000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,17.876000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.003000,0.000000,18.144000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.003000,0.000000,18.144000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<29.130100,0.000000,19.279500>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.279000,0.000000,18.165000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.279000,0.000000,13.975000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.279000,0.000000,13.975000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<15.930000,0.000000,16.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,14.934000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,17.206000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.803000,0.000000,17.206000> }
object{ARC(2.667000,0.127000,64.791673,115.208327,0.036000) translate<15.930000,0.000000,16.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,17.474000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,18.734000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.803000,0.000000,18.734000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<15.930100,0.000000,16.070500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,17.206000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,17.474000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.803000,0.000000,17.474000> }
object{ARC(2.667000,0.127000,244.791673,295.208327,0.036000) translate<15.930000,0.000000,16.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,13.406000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,14.666000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.803000,0.000000,14.666000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,14.666000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.803000,0.000000,14.934000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.803000,0.000000,14.934000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<15.930100,0.000000,16.069500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.820000,0.000000,36.060000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.804000,0.000000,36.060000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.804000,0.000000,36.060000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,36.060000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.136000,0.000000,36.060000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<12.120000,0.000000,36.060000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<15.549000,0.000000,36.949000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<15.549000,0.000000,35.171000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.391000,0.000000,35.171000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.391000,0.000000,36.949000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.295000,0.000000,35.171000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.295000,0.000000,36.949000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.295000,0.000000,36.949000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.549000,0.000000,37.203000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,37.203000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.549000,0.000000,37.203000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.057000,0.000000,37.076000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,37.203000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.930000,0.000000,37.203000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.549000,0.000000,34.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,34.917000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.549000,0.000000,34.917000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.057000,0.000000,35.044000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.930000,0.000000,34.917000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.930000,0.000000,34.917000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.883000,0.000000,37.076000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.010000,0.000000,37.203000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.883000,0.000000,37.076000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.883000,0.000000,37.076000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.057000,0.000000,37.076000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.057000,0.000000,37.076000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.883000,0.000000,35.044000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.010000,0.000000,34.917000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.883000,0.000000,35.044000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.883000,0.000000,35.044000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.057000,0.000000,35.044000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.057000,0.000000,35.044000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.391000,0.000000,37.203000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.010000,0.000000,37.203000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.010000,0.000000,37.203000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.391000,0.000000,34.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.010000,0.000000,34.917000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.010000,0.000000,34.917000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.645000,0.000000,35.171000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.645000,0.000000,36.949000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.645000,0.000000,36.949000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.915000,0.000000,36.060000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.534000,0.000000,36.060000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.534000,0.000000,36.060000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.025000,0.000000,36.060000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.406000,0.000000,36.060000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<14.025000,0.000000,36.060000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<22.076800,0.000000,36.060000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<14.863200,0.000000,36.060000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.346800,0.000000,36.060000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<13.593200,0.000000,36.060000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.280000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.296000,0.000000,47.490000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.280000,0.000000,47.490000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.980000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.964000,0.000000,47.490000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<33.964000,0.000000,47.490000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<31.551000,0.000000,46.601000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<31.551000,0.000000,48.379000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.709000,0.000000,48.379000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.709000,0.000000,46.601000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.805000,0.000000,48.379000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.805000,0.000000,46.601000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.805000,0.000000,46.601000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.551000,0.000000,46.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.170000,0.000000,46.347000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.170000,0.000000,46.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,46.474000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.170000,0.000000,46.347000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.043000,0.000000,46.474000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.551000,0.000000,48.633000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.170000,0.000000,48.633000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.170000,0.000000,48.633000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,48.506000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.170000,0.000000,48.633000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.043000,0.000000,48.506000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.217000,0.000000,46.474000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.090000,0.000000,46.347000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.090000,0.000000,46.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.217000,0.000000,46.474000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,46.474000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.217000,0.000000,46.474000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.217000,0.000000,48.506000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.090000,0.000000,48.633000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.090000,0.000000,48.633000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.217000,0.000000,48.506000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.043000,0.000000,48.506000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.217000,0.000000,48.506000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.709000,0.000000,46.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.090000,0.000000,46.347000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.709000,0.000000,46.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.709000,0.000000,48.633000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.090000,0.000000,48.633000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.709000,0.000000,48.633000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.455000,0.000000,48.379000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.455000,0.000000,46.601000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.455000,0.000000,46.601000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.185000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.566000,0.000000,47.490000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<24.185000,0.000000,47.490000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.075000,0.000000,47.490000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.694000,0.000000,47.490000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<32.694000,0.000000,47.490000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<25.023200,0.000000,47.490000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<32.236800,0.000000,47.490000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<23.753200,0.000000,47.490000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<33.506800,0.000000,47.490000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,5.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,6.596000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.120000,0.000000,6.596000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,18.280000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,17.264000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.120000,0.000000,17.264000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.009000,0.000000,14.851000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.231000,0.000000,14.851000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.231000,0.000000,9.009000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.009000,0.000000,9.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.231000,0.000000,15.105000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.009000,0.000000,15.105000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.231000,0.000000,15.105000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,14.851000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,14.470000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.263000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.136000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,14.470000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.136000,0.000000,14.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,14.851000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,14.470000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.977000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.104000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,14.470000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.977000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.136000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,9.390000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.136000,0.000000,9.517000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.136000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.136000,0.000000,14.343000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.136000,0.000000,14.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.104000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,9.390000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.977000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.104000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.104000,0.000000,14.343000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.104000,0.000000,14.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,9.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.263000,0.000000,9.390000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.263000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,9.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.977000,0.000000,9.390000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.977000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.231000,0.000000,8.755000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.009000,0.000000,8.755000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.231000,0.000000,8.755000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,7.485000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,7.866000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.120000,0.000000,7.866000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,16.375000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.120000,0.000000,15.994000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.120000,0.000000,15.994000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.120000,0.000000,8.323200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.120000,0.000000,15.536800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.120000,0.000000,7.053200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.120000,0.000000,16.806800>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.850000,0.000000,22.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.866000,0.000000,22.020000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<10.850000,0.000000,22.020000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.550000,0.000000,22.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.534000,0.000000,22.020000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.534000,0.000000,22.020000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.121000,0.000000,21.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.121000,0.000000,22.909000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.279000,0.000000,22.909000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.279000,0.000000,21.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.375000,0.000000,22.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.375000,0.000000,21.131000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.375000,0.000000,21.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.121000,0.000000,20.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.740000,0.000000,20.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.740000,0.000000,20.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.613000,0.000000,21.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.740000,0.000000,20.877000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.613000,0.000000,21.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.121000,0.000000,23.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.740000,0.000000,23.163000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.740000,0.000000,23.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.613000,0.000000,23.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.740000,0.000000,23.163000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.613000,0.000000,23.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.787000,0.000000,21.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.660000,0.000000,20.877000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.660000,0.000000,20.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.787000,0.000000,21.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.613000,0.000000,21.004000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.787000,0.000000,21.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.787000,0.000000,23.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.660000,0.000000,23.163000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.660000,0.000000,23.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.787000,0.000000,23.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.613000,0.000000,23.036000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.787000,0.000000,23.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.279000,0.000000,20.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.660000,0.000000,20.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.279000,0.000000,20.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.279000,0.000000,23.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.660000,0.000000,23.163000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.279000,0.000000,23.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.025000,0.000000,22.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.025000,0.000000,21.131000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.025000,0.000000,21.131000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.755000,0.000000,22.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.136000,0.000000,22.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<12.755000,0.000000,22.020000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.645000,0.000000,22.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.264000,0.000000,22.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<21.264000,0.000000,22.020000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<13.593200,0.000000,22.020000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<20.806800,0.000000,22.020000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<12.323200,0.000000,22.020000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<22.076800,0.000000,22.020000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,33.520000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.124000,0.000000,33.520000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.124000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.440000,0.000000,33.520000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.456000,0.000000,33.520000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<32.440000,0.000000,33.520000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.869000,0.000000,34.409000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.869000,0.000000,32.631000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.711000,0.000000,32.631000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.711000,0.000000,34.409000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,32.631000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,34.409000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.615000,0.000000,34.409000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,34.663000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,34.663000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,34.663000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,34.536000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,34.663000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.250000,0.000000,34.663000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,32.377000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,32.377000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,32.377000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,32.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,32.377000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.250000,0.000000,32.377000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,34.536000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,34.663000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.203000,0.000000,34.536000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,34.536000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,34.536000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,34.536000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,32.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,32.377000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.203000,0.000000,32.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,32.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,32.504000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,32.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,34.663000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,34.663000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,34.663000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,32.377000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,32.377000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,32.377000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,32.631000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,34.409000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.965000,0.000000,34.409000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.235000,0.000000,33.520000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.854000,0.000000,33.520000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<42.854000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.345000,0.000000,33.520000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.726000,0.000000,33.520000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.345000,0.000000,33.520000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.396800,0.000000,33.520000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<35.183200,0.000000,33.520000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<43.666800,0.000000,33.520000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<33.913200,0.000000,33.520000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.740000,0.000000,7.460000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.756000,0.000000,7.460000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.740000,0.000000,7.460000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.440000,0.000000,7.460000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<28.424000,0.000000,7.460000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<28.424000,0.000000,7.460000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.011000,0.000000,6.571000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.011000,0.000000,8.349000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.169000,0.000000,8.349000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.169000,0.000000,6.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.265000,0.000000,8.349000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.265000,0.000000,6.571000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.265000,0.000000,6.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.011000,0.000000,6.317000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.630000,0.000000,6.317000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.630000,0.000000,6.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.503000,0.000000,6.444000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.630000,0.000000,6.317000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.503000,0.000000,6.444000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.011000,0.000000,8.603000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.630000,0.000000,8.603000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.630000,0.000000,8.603000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.503000,0.000000,8.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.630000,0.000000,8.603000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.503000,0.000000,8.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.677000,0.000000,6.444000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.550000,0.000000,6.317000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.550000,0.000000,6.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.677000,0.000000,6.444000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.503000,0.000000,6.444000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.677000,0.000000,6.444000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.677000,0.000000,8.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.550000,0.000000,8.603000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.550000,0.000000,8.603000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.677000,0.000000,8.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.503000,0.000000,8.476000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.677000,0.000000,8.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.169000,0.000000,6.317000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.550000,0.000000,6.317000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.169000,0.000000,6.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.169000,0.000000,8.603000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.550000,0.000000,8.603000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.169000,0.000000,8.603000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.915000,0.000000,8.349000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.915000,0.000000,6.571000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.915000,0.000000,6.571000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.645000,0.000000,7.460000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.026000,0.000000,7.460000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<18.645000,0.000000,7.460000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.535000,0.000000,7.460000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.154000,0.000000,7.460000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<27.154000,0.000000,7.460000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<19.483200,0.000000,7.460000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<26.696800,0.000000,7.460000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<18.213200,0.000000,7.460000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<27.966800,0.000000,7.460000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,17.010000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,18.026000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<37.520000,0.000000,18.026000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,29.710000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,28.694000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<37.520000,0.000000,28.694000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.409000,0.000000,26.281000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.631000,0.000000,26.281000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.631000,0.000000,20.439000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.409000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.631000,0.000000,26.535000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.409000,0.000000,26.535000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.631000,0.000000,26.535000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.663000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.536000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.536000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.377000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.504000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.377000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.536000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.536000,0.000000,20.947000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.536000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.536000,0.000000,25.773000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.536000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.504000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.377000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.504000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.504000,0.000000,25.773000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.504000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.663000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.663000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.377000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.631000,0.000000,20.185000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.409000,0.000000,20.185000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.631000,0.000000,20.185000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,18.915000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,19.296000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<37.520000,0.000000,19.296000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,27.805000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.520000,0.000000,27.424000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<37.520000,0.000000,27.424000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<37.520000,0.000000,19.753200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<37.520000,0.000000,26.966800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<37.520000,0.000000,18.483200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<37.520000,0.000000,28.236800>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,41.140000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.124000,0.000000,41.140000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.124000,0.000000,41.140000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.440000,0.000000,41.140000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.456000,0.000000,41.140000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<32.440000,0.000000,41.140000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.869000,0.000000,42.029000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.869000,0.000000,40.251000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.711000,0.000000,40.251000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.711000,0.000000,42.029000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,40.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,42.029000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.615000,0.000000,42.029000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,42.283000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,42.283000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,42.283000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,42.156000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,42.283000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.250000,0.000000,42.283000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,39.997000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,39.997000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,39.997000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,40.124000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,39.997000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.250000,0.000000,39.997000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,42.156000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,42.283000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.203000,0.000000,42.156000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,42.156000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,42.156000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,42.156000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,40.124000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,39.997000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.203000,0.000000,40.124000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,40.124000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,40.124000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,40.124000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,42.283000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,42.283000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,42.283000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,39.997000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,39.997000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,39.997000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,40.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,42.029000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.965000,0.000000,42.029000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.235000,0.000000,41.140000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.854000,0.000000,41.140000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<42.854000,0.000000,41.140000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.345000,0.000000,41.140000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.726000,0.000000,41.140000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.345000,0.000000,41.140000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.396800,0.000000,41.140000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<35.183200,0.000000,41.140000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<43.666800,0.000000,41.140000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<33.913200,0.000000,41.140000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.124000,0.000000,37.330000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.124000,0.000000,37.330000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.440000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.456000,0.000000,37.330000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<32.440000,0.000000,37.330000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.869000,0.000000,38.219000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.869000,0.000000,36.441000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.711000,0.000000,36.441000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.711000,0.000000,38.219000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,36.441000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.615000,0.000000,38.219000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.615000,0.000000,38.219000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,38.473000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,38.473000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,38.473000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,38.346000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,38.473000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.250000,0.000000,38.473000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.869000,0.000000,36.187000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,36.187000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.869000,0.000000,36.187000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,36.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.250000,0.000000,36.187000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.250000,0.000000,36.187000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,38.346000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,38.473000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.203000,0.000000,38.346000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,38.346000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,38.346000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,38.346000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,36.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,36.187000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.203000,0.000000,36.314000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.203000,0.000000,36.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.377000,0.000000,36.314000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.377000,0.000000,36.314000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,38.473000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,38.473000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,38.473000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.711000,0.000000,36.187000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.330000,0.000000,36.187000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.330000,0.000000,36.187000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,36.441000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.965000,0.000000,38.219000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.965000,0.000000,38.219000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.235000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.854000,0.000000,37.330000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<42.854000,0.000000,37.330000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.345000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.726000,0.000000,37.330000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.345000,0.000000,37.330000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.396800,0.000000,37.330000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<35.183200,0.000000,37.330000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<43.666800,0.000000,37.330000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<33.913200,0.000000,37.330000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,20.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,19.064000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,19.064000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,7.380000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,8.396000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<33.980000,0.000000,8.396000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<33.091000,0.000000,10.809000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.869000,0.000000,10.809000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.869000,0.000000,16.651000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<33.091000,0.000000,16.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.869000,0.000000,10.555000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.091000,0.000000,10.555000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.091000,0.000000,10.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,10.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,11.190000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.837000,0.000000,11.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.964000,0.000000,11.317000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,11.190000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.837000,0.000000,11.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,10.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,11.190000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.123000,0.000000,11.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.996000,0.000000,11.317000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,11.190000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.996000,0.000000,11.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.964000,0.000000,16.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,16.270000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.837000,0.000000,16.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.964000,0.000000,16.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.964000,0.000000,11.317000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.964000,0.000000,11.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.996000,0.000000,16.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,16.270000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.996000,0.000000,16.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.996000,0.000000,16.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.996000,0.000000,11.317000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.996000,0.000000,11.317000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,16.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.837000,0.000000,16.270000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.837000,0.000000,16.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,16.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.123000,0.000000,16.270000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.123000,0.000000,16.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.869000,0.000000,16.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.091000,0.000000,16.905000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.091000,0.000000,16.905000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,18.175000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,17.794000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,17.794000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,9.285000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.980000,0.000000,9.666000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<33.980000,0.000000,9.666000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,17.336800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,10.123200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,18.606800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.980000,0.000000,8.853200>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,36.314000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,36.314000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,24.630000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,25.646000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<61.650000,0.000000,25.646000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<60.761000,0.000000,28.059000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<62.539000,0.000000,28.059000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<62.539000,0.000000,33.901000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<60.761000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,27.805000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.761000,0.000000,27.805000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.761000,0.000000,27.805000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,28.059000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,28.440000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.507000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.634000,0.000000,28.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,28.440000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.507000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,28.059000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,28.440000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.793000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.666000,0.000000,28.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,28.440000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.666000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.634000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,33.520000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.507000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.634000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.634000,0.000000,28.567000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.634000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.666000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,33.520000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.666000,0.000000,33.393000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.666000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.666000,0.000000,28.567000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.666000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.507000,0.000000,33.520000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.507000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.793000,0.000000,33.520000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.793000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.539000,0.000000,34.155000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.761000,0.000000,34.155000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.761000,0.000000,34.155000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,35.425000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,35.044000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,35.044000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,26.535000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,26.916000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<61.650000,0.000000,26.916000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,34.586800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,27.373200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,35.856800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.650000,0.000000,26.103200>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,18.280000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,17.264000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,17.264000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,5.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,6.596000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.310000,0.000000,6.596000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.421000,0.000000,9.009000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<9.199000,0.000000,9.009000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<9.199000,0.000000,14.851000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.421000,0.000000,14.851000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.199000,0.000000,8.755000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.421000,0.000000,8.755000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.421000,0.000000,8.755000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,9.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,9.390000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.167000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.294000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,9.390000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.167000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,9.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,9.390000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.453000,0.000000,9.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.326000,0.000000,9.517000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,9.390000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.326000,0.000000,9.517000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.294000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,14.470000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.167000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.294000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.294000,0.000000,9.517000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.294000,0.000000,9.517000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.326000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,14.470000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.326000,0.000000,14.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.326000,0.000000,14.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.326000,0.000000,9.517000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.326000,0.000000,9.517000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,14.851000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.167000,0.000000,14.470000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.167000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,14.851000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.453000,0.000000,14.470000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.453000,0.000000,14.470000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.199000,0.000000,15.105000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.421000,0.000000,15.105000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.421000,0.000000,15.105000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,16.375000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,15.994000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,15.994000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,7.485000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.310000,0.000000,7.866000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.310000,0.000000,7.866000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,15.536800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,8.323200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,16.806800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.310000,0.000000,7.053200>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,37.330000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,36.314000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,36.314000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,24.630000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,25.646000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<65.460000,0.000000,25.646000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<64.571000,0.000000,28.059000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.349000,0.000000,28.059000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.349000,0.000000,33.901000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<64.571000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.349000,0.000000,27.805000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.571000,0.000000,27.805000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.571000,0.000000,27.805000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,28.059000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,28.440000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.317000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.444000,0.000000,28.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,28.440000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.317000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,28.059000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,28.440000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.603000,0.000000,28.440000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.476000,0.000000,28.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,28.440000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<66.476000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.444000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,33.520000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<64.317000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.444000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.444000,0.000000,28.567000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.444000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.476000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,33.520000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.476000,0.000000,33.393000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.476000,0.000000,33.393000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.476000,0.000000,28.567000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.476000,0.000000,28.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.317000,0.000000,33.520000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.317000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,33.901000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.603000,0.000000,33.520000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.603000,0.000000,33.520000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.349000,0.000000,34.155000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.571000,0.000000,34.155000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.571000,0.000000,34.155000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,35.425000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,35.044000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,35.044000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,26.535000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.460000,0.000000,26.916000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<65.460000,0.000000,26.916000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,34.586800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,27.373200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,35.856800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.460000,0.000000,26.103200>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.950000,0.000000,42.410000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.966000,0.000000,42.410000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.950000,0.000000,42.410000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.650000,0.000000,42.410000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.634000,0.000000,42.410000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<60.634000,0.000000,42.410000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<58.221000,0.000000,41.521000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<58.221000,0.000000,43.299000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.379000,0.000000,43.299000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.379000,0.000000,41.521000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.475000,0.000000,43.299000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.475000,0.000000,41.521000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.475000,0.000000,41.521000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.221000,0.000000,41.267000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.840000,0.000000,41.267000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.840000,0.000000,41.267000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.713000,0.000000,41.394000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.840000,0.000000,41.267000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.713000,0.000000,41.394000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.221000,0.000000,43.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.840000,0.000000,43.553000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.840000,0.000000,43.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.713000,0.000000,43.426000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.840000,0.000000,43.553000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.713000,0.000000,43.426000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.887000,0.000000,41.394000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.760000,0.000000,41.267000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.760000,0.000000,41.267000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.887000,0.000000,41.394000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.713000,0.000000,41.394000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.887000,0.000000,41.394000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.887000,0.000000,43.426000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.760000,0.000000,43.553000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<52.760000,0.000000,43.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.887000,0.000000,43.426000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.713000,0.000000,43.426000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.887000,0.000000,43.426000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.379000,0.000000,41.267000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.760000,0.000000,41.267000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.379000,0.000000,41.267000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.379000,0.000000,43.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.760000,0.000000,43.553000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.379000,0.000000,43.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.125000,0.000000,43.299000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.125000,0.000000,41.521000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.125000,0.000000,41.521000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.855000,0.000000,42.410000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<51.236000,0.000000,42.410000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<50.855000,0.000000,42.410000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.745000,0.000000,42.410000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.364000,0.000000,42.410000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<59.364000,0.000000,42.410000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<51.693200,0.000000,42.410000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<58.906800,0.000000,42.410000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<50.423200,0.000000,42.410000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<60.176800,0.000000,42.410000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,29.710000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,28.694000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,28.694000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,17.010000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,18.026000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.330000,0.000000,18.026000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.441000,0.000000,20.439000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.219000,0.000000,20.439000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.219000,0.000000,26.281000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.441000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.219000,0.000000,20.185000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.441000,0.000000,20.185000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.441000,0.000000,20.185000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.187000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.314000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.187000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.473000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.346000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.346000,0.000000,20.947000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.314000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.187000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.314000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.314000,0.000000,20.947000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.314000,0.000000,20.947000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.346000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.346000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.346000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.346000,0.000000,20.947000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.346000,0.000000,20.947000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.187000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.187000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.473000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.473000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.219000,0.000000,26.535000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.441000,0.000000,26.535000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.441000,0.000000,26.535000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,27.805000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,27.424000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,27.424000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,18.915000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.330000,0.000000,19.296000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.330000,0.000000,19.296000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,26.966800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,19.753200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,28.236800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.330000,0.000000,18.483200>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,17.010000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,18.026000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.140000,0.000000,18.026000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,29.710000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,28.694000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.140000,0.000000,28.694000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.029000,0.000000,26.281000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<44.251000,0.000000,26.281000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<44.251000,0.000000,20.439000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.029000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.251000,0.000000,26.535000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.029000,0.000000,26.535000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.251000,0.000000,26.535000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.283000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.156000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.156000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,26.281000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,25.900000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.997000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.124000,0.000000,25.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,25.900000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.997000,0.000000,25.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.156000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.156000,0.000000,20.947000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.156000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.156000,0.000000,25.773000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.156000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.124000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,20.820000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.997000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.124000,0.000000,20.947000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.124000,0.000000,25.773000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.124000,0.000000,25.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.283000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.283000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,20.439000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.997000,0.000000,20.820000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.997000,0.000000,20.820000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.251000,0.000000,20.185000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.029000,0.000000,20.185000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.251000,0.000000,20.185000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,18.915000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,19.296000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.140000,0.000000,19.296000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,27.805000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.140000,0.000000,27.424000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.140000,0.000000,27.424000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<45.140000,0.000000,19.753200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<45.140000,0.000000,26.966800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<45.140000,0.000000,18.483200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<45.140000,0.000000,28.236800>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,18.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,17.034000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,17.034000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,5.350000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,6.366000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<57.240000,0.000000,6.366000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<56.351000,0.000000,8.779000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<58.129000,0.000000,8.779000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<58.129000,0.000000,14.621000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<56.351000,0.000000,14.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.129000,0.000000,8.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.351000,0.000000,8.525000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.351000,0.000000,8.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,8.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,9.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.097000,0.000000,9.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.224000,0.000000,9.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,9.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.097000,0.000000,9.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,8.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,9.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.383000,0.000000,9.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.256000,0.000000,9.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,9.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<58.256000,0.000000,9.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.224000,0.000000,14.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,14.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<56.097000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.224000,0.000000,14.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.224000,0.000000,9.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.224000,0.000000,9.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.256000,0.000000,14.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,14.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.256000,0.000000,14.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.256000,0.000000,14.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.256000,0.000000,9.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.256000,0.000000,9.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,14.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.097000,0.000000,14.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.097000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,14.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.383000,0.000000,14.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.383000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.129000,0.000000,14.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.351000,0.000000,14.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.351000,0.000000,14.875000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,16.145000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,15.764000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,15.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,7.255000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.240000,0.000000,7.636000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<57.240000,0.000000,7.636000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,15.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,8.093200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,16.576800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.240000,0.000000,6.823200>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MIC_AMP(-36.010000,0,-27.005000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
