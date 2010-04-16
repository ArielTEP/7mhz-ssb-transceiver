//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/Ladder_Filter_IF_Amplifier/Ladder_Filter_IF_Amplifier.brd
//2010. 04. 16. 12:20:30

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
#local cam_y = 238;
#local cam_z = -119;
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

#local lgt1_pos_x = 28;
#local lgt1_pos_y = 42;
#local lgt1_pos_z = 27;
#local lgt1_intense = 0.755481;
#local lgt2_pos_x = -28;
#local lgt2_pos_y = 42;
#local lgt2_pos_z = 27;
#local lgt2_intense = 0.755481;
#local lgt3_pos_x = 28;
#local lgt3_pos_y = 42;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.755481;
#local lgt4_pos_x = -28;
#local lgt4_pos_y = 42;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.755481;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 74.600000;
#declare pcb_y_size = 52.060000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(497);
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
	//translate<-37.300000,0,-26.030000>
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


#macro LADDER_FILTER_IF_AMPLIFIER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><74.600000,0.000000>
<74.600000,0.000000><74.600000,52.060000>
<74.600000,52.060000><0.000000,52.060000>
<0.000000,52.060000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,48.260000><3.810000,-5,48.260000>1.600000 texture{col_hls}}
cylinder{<71.120000,1,48.260000><71.120000,-5,48.260000>1.600000 texture{col_hls}}
cylinder{<71.120000,1,3.810000><71.120000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("15pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<54.610000,0.000000,10.160000>}#end		//ceramic disc capacitator C1 15pF C050-035X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.450000,0.000000,10.160000>}#end		//ceramic disc capacitator C2 22pF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("47pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<34.290000,0.000000,10.160000>}#end		//ceramic disc capacitator C3 47pF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<24.130000,0.000000,10.160000>}#end		//ceramic disc capacitator C4 22pF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("15pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,10.160000>}#end		//ceramic disc capacitator C5 15pF C050-035X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,31.750000>}#end		//ceramic disc capacitator C6 0.01uF C050-035X075
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_50MM_76MM("470pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,22.860000>}#end		//ceramic disc capacitator C7 470pF C050-035X075
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_50MM_76MM("180pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.050000,0.000000,37.846000>}#end		//ceramic disc capacitator C8 180pF C050-035X075
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.210000,0.000000,29.210000>}#end		//ceramic disc capacitator C9 0.01uF C050-035X075
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.910000,0.000000,37.846000>}#end		//ceramic disc capacitator C10 0.01uF C050-035X075
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<34.290000,0.000000,37.846000>}#end		//ceramic disc capacitator C11 0.01uF C050-035X075
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_DIS_CERAMIC_50MM_76MM("180pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,37.846000>}#end		//ceramic disc capacitator C12 180pF C050-035X075
#ifndef(pack_C13) #declare global_pack_C13=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<58.420000,0.000000,29.210000>}#end		//ceramic disc capacitator C13 0.01uF C050-035X075
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<66.040000,0.000000,11.430000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,40.640000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<66.040000,0.000000,39.116000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {SPC_XTAL_5MM("4.43MHz",12,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.530000,0.000000,10.160000>}#end		//Quarz 4,9MM Q1 4.43MHz QS
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {SPC_XTAL_5MM("4.43MHz",12,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.370000,0.000000,10.160000>}#end		//Quarz 4,9MM Q2 4.43MHz QS
#ifndef(pack_Q3) #declare global_pack_Q3=yes; object {SPC_XTAL_5MM("4.43MHz",12,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<29.210000,0.000000,10.160000>}#end		//Quarz 4,9MM Q3 4.43MHz QS
#ifndef(pack_Q4) #declare global_pack_Q4=yes; object {SPC_XTAL_5MM("4.43MHz",12,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.050000,0.000000,10.160000>}#end		//Quarz 4,9MM Q4 4.43MHz QS
#ifndef(pack_Q5) #declare global_pack_Q5=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.320000,0.000000,27.686000>}#end		//TO92 bend vertical Q5 BC548B TO92-EBC
#ifndef(pack_Q6) #declare global_pack_Q6=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.530000,0.000000,27.686000>}#end		//TO92 bend vertical Q6 BC548B TO92-EBC
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<59.690000,0.000000,10.160000>}#end		//Discrete Resistor 0,3W 12MM Grid R1 1k 0207/12
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,10.160000>}#end		//Discrete Resistor 0,3W 12MM Grid R2 1k 0207/12
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.320000,0.000000,44.450000>}#end		//Discrete Resistor 0,3W 12MM Grid R3 150E 0207/12
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_12MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.970000,0.000000,34.036000>}#end		//Discrete Resistor 0,3W 12MM Grid R4 47k 0207/12
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.320000,0.000000,20.320000>}#end		//Discrete Resistor 0,3W 12MM Grid R5 3k3 0207/12
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.210000,0.000000,23.876000>}#end		//Discrete Resistor 0,3W 12MM Grid R6 3k3 0207/12
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<41.910000,0.000000,44.450000>}#end		//Discrete Resistor 0,3W 12MM Grid R7 150E 0207/12
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<38.100000,0.000000,30.226000>}#end		//Discrete Resistor 0,3W 12MM Grid R8 33k 0207/12
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.450000,0.000000,20.320000>}#end		//Discrete Resistor 0,3W 12MM Grid R9 3k3 0207/12
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_12MM(texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<58.420000,0.000000,23.876000>}#end		//Discrete Resistor 0,3W 12MM Grid R10 3k3 0207/12
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<54.610000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<54.610000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.670000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.750000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_C10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_C11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_C11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_C12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_C12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.260000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_C13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<66.040000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<66.040000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<66.040000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<66.040000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.370000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<39.370000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_Q3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_Q4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_Q4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<19.050000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_Q5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<19.050000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_Q5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<19.050000,0,30.226000> texture{col_thl}}
#ifndef(global_pack_Q5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<19.050000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,30.226000> texture{col_thl}}
#ifndef(global_pack_Q6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<59.690000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<59.690000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.670000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,27.686000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.670000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,23.876000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<22.860000,0,23.876000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.260000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,23.876000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,36.576000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.800000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.100000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<64.770000,0,23.876000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<52.070000,0,23.876000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.420000,0,40.350000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<28.920000,0,40.350000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<28.920000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<28.920000,0,35.850000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.420000,0,35.850000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.670000,0,41.850000> texture{col_thl}}
#ifndef(global_pack_TR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.670000,0,34.350000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.630000,0,40.350000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<58.130000,0,40.350000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<58.130000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<58.130000,0,35.850000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.630000,0,35.850000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,41.850000> texture{col_thl}}
#ifndef(global_pack_TR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,34.350000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,20.320000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,43.180000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.906000,-1.535000,27.686000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.890000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,44.450000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.890000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,34.290000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<8.890000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.700000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,20.320000>}
box{<0,0,-0.304800><7.366000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.970000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.906000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,27.686000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.906000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,36.830000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.430000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,40.386000>}
box{<0,0,-0.304800><3.556000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.970000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,44.450000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,27.686000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,35.306000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<19.050000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,40.386000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.086000,-1.535000,40.350000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,44.997030,0> translate<19.050000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,35.306000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.050000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.098000,-1.535000,35.814000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.590000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,23.876000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.860000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,25.146000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.050000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,27.432000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.860000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,7.620000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.050000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.098000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,35.814000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.098000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,43.180000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.384000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.420000,-1.535000,35.850000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.384000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.086000,-1.535000,40.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.420000,-1.535000,40.350000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.086000,-1.535000,40.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.420000,-1.535000,40.350000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,44.997030,0> translate<24.384000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,-1.535000,29.210000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.860000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.384000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.654000,-1.535000,44.450000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.384000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,29.210000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.638000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.654000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,44.450000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.654000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,7.620000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920000,-1.535000,40.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.254000,-1.535000,40.350000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.920000,-1.535000,40.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.210000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,35.306000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.290000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.254000,-1.535000,40.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,40.386000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.254000,-1.535000,40.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,44.450000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.670000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.576000,-1.535000,27.686000>}
box{<0,0,-0.304800><3.232892,0.035000,0.304800> rotate<0,44.997030,0> translate<34.290000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,23.876000>}
box{<0,0,-0.304800><3.556000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.576000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,27.686000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.576000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,27.686000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,39.116000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.290000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,40.386000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.100000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,40.386000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.370000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,7.620000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.370000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,27.686000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.100000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,35.306000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.260000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,40.386000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,44.450000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.260000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,7.620000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.450000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,35.306000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.344000,-1.535000,35.850000>}
box{<0,0,-0.304800><0.769332,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.800000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,23.876000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<52.070000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,25.146000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,27.432000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,90.000000,0> translate<52.070000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,-1.535000,40.386000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.344000,-1.535000,35.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.630000,-1.535000,35.850000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.344000,-1.535000,35.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.630000,-1.535000,40.350000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,44.997030,0> translate<53.594000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.848000,-1.535000,29.210000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.070000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.530000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.848000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.880000,-1.535000,29.210000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.848000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,12.700000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.610000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,16.510000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<59.690000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130000,-1.535000,40.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.004000,-1.535000,40.350000>}
box{<0,0,-0.304800><7.874000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.130000,-1.535000,40.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,12.700000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.690000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.004000,-1.535000,40.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,40.386000>}
box{<0,0,-0.304800><0.050912,0.035000,0.304800> rotate<0,-44.997030,0> translate<66.004000,-1.535000,40.350000> }
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
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,5.339800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,46.730100>}
box{<0,0,-0.304800><41.390300,0.035000,0.304800> rotate<0,90.000000,0> translate<1.320700,-1.535000,46.730100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,5.339800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.472800,-1.535000,5.603400>}
box{<0,0,-0.304800><0.304334,0.035000,0.304800> rotate<0,-60.010637,0> translate<1.320700,-1.535000,5.339800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.405300,-1.535000,5.486400>}
box{<0,0,-0.304800><0.084600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.965400,-1.535000,6.096000>}
box{<0,0,-0.304800><0.644700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.331800,-1.535000,6.705600>}
box{<0,0,-0.304800><2.011100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.315200>}
box{<0,0,-0.304800><11.430100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.924800>}
box{<0,0,-0.304800><11.430100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.160300,-1.535000,8.534400>}
box{<0,0,-0.304800><11.839600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.790100,-1.535000,9.144000>}
box{<0,0,-0.304800><16.469400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.021200,-1.535000,9.753600>}
box{<0,0,-0.304800><62.700500,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.973000,-1.535000,10.363200>}
box{<0,0,-0.304800><62.652300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.182700,-1.535000,10.972800>}
box{<0,0,-0.304800><11.862000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.805900,-1.535000,11.582400>}
box{<0,0,-0.304800><10.485200,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.196300,-1.535000,12.192000>}
box{<0,0,-0.304800><9.875600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.586700,-1.535000,12.801600>}
box{<0,0,-0.304800><9.266000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.977100,-1.535000,13.411200>}
box{<0,0,-0.304800><8.656400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.367500,-1.535000,14.020800>}
box{<0,0,-0.304800><8.046800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.757900,-1.535000,14.630400>}
box{<0,0,-0.304800><7.437200,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.645500,-1.535000,15.240000>}
box{<0,0,-0.304800><6.324800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,15.849600>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,16.459200>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,17.068800>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,17.678400>}
box{<0,0,-0.304800><6.146900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,18.288000>}
box{<0,0,-0.304800><6.146900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,18.897600>}
box{<0,0,-0.304800><6.146900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.188300,-1.535000,19.507200>}
box{<0,0,-0.304800><5.867600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,20.116800>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,20.726400>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.391600,-1.535000,21.336000>}
box{<0,0,-0.304800><6.070900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001200,-1.535000,21.945600>}
box{<0,0,-0.304800><6.680500,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,22.555200>}
box{<0,0,-0.304800><11.226900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,23.164800>}
box{<0,0,-0.304800><11.226900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001100,-1.535000,23.774400>}
box{<0,0,-0.304800><6.680400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.391500,-1.535000,24.384000>}
box{<0,0,-0.304800><6.070800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,24.993600>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,25.603200>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.188400,-1.535000,26.212800>}
box{<0,0,-0.304800><5.867700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,26.822400>}
box{<0,0,-0.304800><6.146900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.666100,-1.535000,27.432000>}
box{<0,0,-0.304800><6.345400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.250100,-1.535000,28.041600>}
box{<0,0,-0.304800><6.929400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.724600,-1.535000,28.651200>}
box{<0,0,-0.304800><6.403900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.260800>}
box{<0,0,-0.304800><6.350100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.826300,-1.535000,29.870400>}
box{<0,0,-0.304800><6.505600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,30.480000>}
box{<0,0,-0.304800><15.290900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.822900,-1.535000,31.089600>}
box{<0,0,-0.304800><15.502200,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.348400,-1.535000,31.699200>}
box{<0,0,-0.304800><16.027700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,32.308800>}
box{<0,0,-0.304800><16.306900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.747100,-1.535000,32.918400>}
box{<0,0,-0.304800><6.426400,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.137500,-1.535000,33.528000>}
box{<0,0,-0.304800><5.816800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,34.137600>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,34.747200>}
box{<0,0,-0.304800><5.791300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.442400,-1.535000,35.356800>}
box{<0,0,-0.304800><6.121700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.052000,-1.535000,35.966400>}
box{<0,0,-0.304800><6.731300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.704400,-1.535000,36.576000>}
box{<0,0,-0.304800><10.383700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.314000,-1.535000,37.185600>}
box{<0,0,-0.304800><10.993300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,37.795200>}
box{<0,0,-0.304800><11.226900,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.225200,-1.535000,38.404800>}
box{<0,0,-0.304800><5.904500,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.854700,-1.535000,39.014400>}
box{<0,0,-0.304800><5.534000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.831000,-1.535000,39.624000>}
box{<0,0,-0.304800><5.510300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.123800,-1.535000,40.233600>}
box{<0,0,-0.304800><5.803100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.536500,-1.535000,40.843200>}
box{<0,0,-0.304800><5.215800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.282800,-1.535000,41.452800>}
box{<0,0,-0.304800><4.962100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.248400,-1.535000,42.062400>}
box{<0,0,-0.304800><4.927700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.409200,-1.535000,42.672000>}
box{<0,0,-0.304800><5.088500,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.841400,-1.535000,43.281600>}
box{<0,0,-0.304800><5.520700,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.645000,-1.535000,43.891200>}
box{<0,0,-0.304800><6.324300,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.199200,-1.535000,44.500800>}
box{<0,0,-0.304800><6.878500,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.808800,-1.535000,45.110400>}
box{<0,0,-0.304800><7.488100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.367700,-1.535000,45.720000>}
box{<0,0,-0.304800><1.047000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.609700,-1.535000,46.329600>}
box{<0,0,-0.304800><0.289000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320700,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320700,-1.535000,46.730100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.472800,-1.535000,46.466500>}
box{<0,0,-0.304800><0.304334,0.035000,0.304800> rotate<0,60.010637,0> translate<1.320700,-1.535000,46.730100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.472800,-1.535000,5.603400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.016500,-1.535000,6.147100>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,-44.997030,0> translate<1.472800,-1.535000,5.603400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.472800,-1.535000,46.466500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.016500,-1.535000,45.922800>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,44.997030,0> translate<1.472800,-1.535000,46.466500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.016500,-1.535000,6.147100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.682600,-1.535000,6.531700>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-29.999761,0> translate<2.016500,-1.535000,6.147100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.016500,-1.535000,45.922800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.682600,-1.535000,45.538200>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,29.999761,0> translate<2.016500,-1.535000,45.922800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.682600,-1.535000,6.531700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.425400,-1.535000,6.730700>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-14.996660,0> translate<2.682600,-1.535000,6.531700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.682600,-1.535000,45.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.425400,-1.535000,45.339200>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,14.996660,0> translate<2.682600,-1.535000,45.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.425400,-1.535000,6.730700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.194500,-1.535000,6.730700>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,0.000000,0> translate<3.425400,-1.535000,6.730700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.425400,-1.535000,45.339200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.194500,-1.535000,45.339200>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,0.000000,0> translate<3.425400,-1.535000,45.339200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.194500,-1.535000,6.730700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.937300,-1.535000,6.531700>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,14.996660,0> translate<4.194500,-1.535000,6.730700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.194500,-1.535000,45.339200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.937300,-1.535000,45.538200>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-14.996660,0> translate<4.194500,-1.535000,45.339200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.288200,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.160200,-1.535000,6.705600>}
box{<0,0,-0.304800><8.872000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.288200,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.937300,-1.535000,6.531700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,6.147100>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,29.999761,0> translate<4.937300,-1.535000,6.531700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.937300,-1.535000,45.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,45.922800>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-29.999761,0> translate<4.937300,-1.535000,45.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.252100,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.509300,-1.535000,45.720000>}
box{<0,0,-0.304800><4.257200,0.035000,0.304800> rotate<0,0.000000,0> translate<5.252100,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.339800,-1.535000,1.320700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,1.472800>}
box{<0,0,-0.304800><0.304334,0.035000,0.304800> rotate<0,-29.983424,0> translate<5.339800,-1.535000,1.320700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.339800,-1.535000,1.320700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.590100,-1.535000,1.320700>}
box{<0,0,-0.304800><64.250300,0.035000,0.304800> rotate<0,0.000000,0> translate<5.339800,-1.535000,1.320700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.357100,-1.535000,50.739200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,50.597100>}
box{<0,0,-0.304800><0.284352,0.035000,0.304800> rotate<0,29.980332,0> translate<5.357100,-1.535000,50.739200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.357100,-1.535000,50.739200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.572800,-1.535000,50.739200>}
box{<0,0,-0.304800><64.215700,0.035000,0.304800> rotate<0,0.000000,0> translate<5.357100,-1.535000,50.739200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,1.472800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,2.016500>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.603400,-1.535000,1.472800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,6.147100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,5.603400>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,44.997030,0> translate<5.603400,-1.535000,6.147100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,45.922800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,46.466500>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.603400,-1.535000,45.922800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603400,-1.535000,50.597100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,50.053400>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,44.997030,0> translate<5.603400,-1.535000,50.597100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.603700,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326200,-1.535000,50.596800>}
box{<0,0,-0.304800><63.722500,0.035000,0.304800> rotate<0,0.000000,0> translate<5.603700,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.654500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.789700,-1.535000,6.096000>}
box{<0,0,-0.304800><12.135200,0.035000,0.304800> rotate<0,0.000000,0> translate<5.654500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.959400,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.970500,-1.535000,1.828800>}
box{<0,0,-0.304800><63.011100,0.035000,0.304800> rotate<0,0.000000,0> translate<5.959400,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.010200,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.919700,-1.535000,46.329600>}
box{<0,0,-0.304800><62.909500,0.035000,0.304800> rotate<0,0.000000,0> translate<6.010200,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,2.016500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,2.682600>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-59.994299,0> translate<6.147100,-1.535000,2.016500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,5.603400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,4.937300>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,59.994299,0> translate<6.147100,-1.535000,5.603400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,46.466500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,47.132600>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-59.994299,0> translate<6.147100,-1.535000,46.466500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.147100,-1.535000,50.053400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,49.387300>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,59.994299,0> translate<6.147100,-1.535000,50.053400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.185400,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.744600,-1.535000,49.987200>}
box{<0,0,-0.304800><62.559200,0.035000,0.304800> rotate<0,0.000000,0> translate<6.185400,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.214700,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.715300,-1.535000,5.486400>}
box{<0,0,-0.304800><62.500600,0.035000,0.304800> rotate<0,0.000000,0> translate<6.214700,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.248400,-1.535000,41.536000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.534500,-1.535000,40.845200>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,67.498287,0> translate<6.248400,-1.535000,41.536000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.248400,-1.535000,42.283900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.248400,-1.535000,41.536000>}
box{<0,0,-0.304800><0.747900,0.035000,0.304800> rotate<0,-90.000000,0> translate<6.248400,-1.535000,41.536000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.248400,-1.535000,42.283900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.534500,-1.535000,42.974700>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-67.498287,0> translate<6.248400,-1.535000,42.283900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.390700,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.539100,-1.535000,2.438400>}
box{<0,0,-0.304800><62.148400,0.035000,0.304800> rotate<0,0.000000,0> translate<6.390700,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.420000,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.509800,-1.535000,46.939200>}
box{<0,0,-0.304800><62.089800,0.035000,0.304800> rotate<0,0.000000,0> translate<6.420000,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,2.682600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,3.425400>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-74.997401,0> translate<6.531700,-1.535000,2.682600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,4.937300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,4.194500>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,74.997401,0> translate<6.531700,-1.535000,4.937300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,47.132600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,47.875400>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-74.997401,0> translate<6.531700,-1.535000,47.132600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.531700,-1.535000,49.387300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,48.644500>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,74.997401,0> translate<6.531700,-1.535000,49.387300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.534300,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395700,-1.535000,49.377600>}
box{<0,0,-0.304800><61.861400,0.035000,0.304800> rotate<0,0.000000,0> translate<6.534300,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.534500,-1.535000,40.845200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.063200,-1.535000,40.316500>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,44.997030,0> translate<6.534500,-1.535000,40.845200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.534500,-1.535000,42.974700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.063200,-1.535000,43.503400>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.534500,-1.535000,42.974700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.548000,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.232700,-1.535000,4.876800>}
box{<0,0,-0.304800><1.684700,0.035000,0.304800> rotate<0,0.000000,0> translate<6.548000,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.629500,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.927800,-1.535000,3.048000>}
box{<0,0,-0.304800><1.298300,0.035000,0.304800> rotate<0,0.000000,0> translate<6.629500,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.643200,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.286600,-1.535000,47.548800>}
box{<0,0,-0.304800><61.643400,0.035000,0.304800> rotate<0,0.000000,0> translate<6.643200,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.697700,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.232300,-1.535000,48.768000>}
box{<0,0,-0.304800><61.534600,0.035000,0.304800> rotate<0,0.000000,0> translate<6.697700,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.711300,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,4.267200>}
box{<0,0,-0.304800><0.959500,0.035000,0.304800> rotate<0,0.000000,0> translate<6.711300,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,3.425400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,4.194500>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,90.000000,0> translate<6.730700,-1.535000,4.194500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.657600>}
box{<0,0,-0.304800><0.940100,0.035000,0.304800> rotate<0,0.000000,0> translate<6.730700,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,47.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,48.644500>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,90.000000,0> translate<6.730700,-1.535000,48.644500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730700,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,48.158400>}
box{<0,0,-0.304800><61.468500,0.035000,0.304800> rotate<0,0.000000,0> translate<6.730700,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.266000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.839700,-1.535000,39.060600>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<6.807200,-1.535000,39.266000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.369400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.266000>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,-90.000000,0> translate<6.807200,-1.535000,39.266000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.369400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,39.369400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<6.807200,-1.535000,39.369400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.370400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,39.370400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<6.807200,-1.535000,39.370400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.473900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.370400>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,-90.000000,0> translate<6.807200,-1.535000,39.370400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.807200,-1.535000,39.473900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.839700,-1.535000,39.679300>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<6.807200,-1.535000,39.473900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.839700,-1.535000,39.060600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.904000,-1.535000,38.862900>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<6.839700,-1.535000,39.060600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.839700,-1.535000,39.679300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.904000,-1.535000,39.877000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<6.839700,-1.535000,39.679300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.904000,-1.535000,38.862900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.998300,-1.535000,38.677700>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<6.904000,-1.535000,38.862900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.904000,-1.535000,39.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.998300,-1.535000,40.062200>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<6.904000,-1.535000,39.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.998300,-1.535000,38.677700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.120500,-1.535000,38.509500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<6.998300,-1.535000,38.677700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.998300,-1.535000,40.062200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.120500,-1.535000,40.230400>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<6.998300,-1.535000,40.062200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.063200,-1.535000,40.316500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164700,-1.535000,40.274500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,22.477951,0> translate<7.063200,-1.535000,40.316500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.063200,-1.535000,43.503400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.571600,-1.535000,43.713900>}
box{<0,0,-0.304800><0.550255,0.035000,0.304800> rotate<0,-22.490226,0> translate<7.063200,-1.535000,43.503400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,15.773500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,14.732000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<7.112000,-1.535000,15.773500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,17.246400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,15.773500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.112000,-1.535000,15.773500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,17.246400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,17.601900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-44.988973,0> translate<7.112000,-1.535000,17.246400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,19.228000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<7.112000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,19.583500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.112000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,22.097900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.112000,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,24.663500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,23.622000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<7.112000,-1.535000,24.663500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,26.136400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,24.663500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.112000,-1.535000,24.663500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,26.136400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,26.492000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.112000,-1.535000,26.136400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,33.553500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,32.512000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<7.112000,-1.535000,33.553500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,35.026400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,33.553500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.112000,-1.535000,33.553500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,-1.535000,35.026400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,36.067900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.112000,-1.535000,35.026400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.120500,-1.535000,38.509500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.267500,-1.535000,38.362500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,44.997030,0> translate<7.120500,-1.535000,38.509500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.120500,-1.535000,40.230400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164700,-1.535000,40.274500>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,-44.932147,0> translate<7.120500,-1.535000,40.230400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.267500,-1.535000,38.362500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.435700,-1.535000,38.240300>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,35.996631,0> translate<7.267500,-1.535000,38.362500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.435700,-1.535000,38.240300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620900,-1.535000,38.146000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,26.982470,0> translate<7.435700,-1.535000,38.240300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,19.228000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,17.601900>}
box{<0,0,-0.304800><1.626100,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.467600,-1.535000,17.601900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,26.952900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,26.492000>}
box{<0,0,-0.304800><0.460900,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.467600,-1.535000,26.492000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.467600,-1.535000,26.952900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.684100,-1.535000,27.475700>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-67.500302,0> translate<7.467600,-1.535000,26.952900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.571600,-1.535000,43.713900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.684100,-1.535000,43.985700>}
box{<0,0,-0.304800><0.294162,0.035000,0.304800> rotate<0,-67.510524,0> translate<7.571600,-1.535000,43.713900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620900,-1.535000,38.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.818600,-1.535000,38.081700>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,18.015423,0> translate<7.620900,-1.535000,38.146000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,2.590800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<7.670800,-1.535000,3.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.305000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.670800,-1.535000,3.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,3.809400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.670800,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,3.810400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.670800,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,4.314900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,3.810400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.670800,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,4.314900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,5.029100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.670800,-1.535000,4.314900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,28.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.292200,-1.535000,28.083700>}
box{<0,0,-0.304800><0.878722,0.035000,0.304800> rotate<0,44.992420,0> translate<7.670800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,28.705000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.670800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.670800,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.670800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.210400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.670800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.670800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,30.429100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.670800,-1.535000,29.714900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.684100,-1.535000,27.475700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.084200,-1.535000,27.875800>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.684100,-1.535000,27.475700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.684100,-1.535000,43.985700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.084200,-1.535000,44.385800>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.684100,-1.535000,43.985700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.818600,-1.535000,38.081700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.024000,-1.535000,38.049200>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,8.990654,0> translate<7.818600,-1.535000,38.081700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.024000,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,38.049200>}
box{<0,0,-0.304800><0.865400,0.035000,0.304800> rotate<0,0.000000,0> translate<8.024000,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.084200,-1.535000,27.875800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.292200,-1.535000,28.083700>}
box{<0,0,-0.304800><0.294086,0.035000,0.304800> rotate<0,-44.983255,0> translate<8.084200,-1.535000,27.875800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.084200,-1.535000,44.385800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.354200,-1.535000,45.655800>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.084200,-1.535000,44.385800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.656300,-1.535000,14.732000>}
box{<0,0,-0.304800><0.502800,0.035000,0.304800> rotate<0,0.000000,0> translate<8.153500,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,22.097900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,22.097900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<8.153500,-1.535000,22.097900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,23.622000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<8.153500,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,32.512000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<8.153500,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.153500,-1.535000,36.067900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,36.067900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<8.153500,-1.535000,36.067900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,2.590800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<8.385000,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,5.029100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<8.385000,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.385000,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<8.385000,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.656300,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.894200,-1.535000,11.494100>}
box{<0,0,-0.304800><4.579082,0.035000,0.304800> rotate<0,44.997030,0> translate<8.656300,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,3.809400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.888900,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,29.209400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.888900,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,39.370400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.888900,-1.535000,39.369400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.888900,-1.535000,39.369400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.808900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<8.889400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.048000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.657600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.808900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,5.029100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<8.889400,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.811000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,4.267200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,4.876800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,30.429100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<8.889400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,29.211000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,29.260800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,29.870400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,39.368900>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,90.000000,0> translate<8.889400,-1.535000,39.368900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,38.404800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,39.014400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.889400,-1.535000,39.368900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,39.368900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.889400,-1.535000,39.368900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,2.590800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890400,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,2.590800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.890400,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,3.811000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.890400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,5.029100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890400,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,29.211000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.890400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.755900,-1.535000,38.049200>}
box{<0,0,-0.304800><0.865500,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890400,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,39.368900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890400,-1.535000,38.049200>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.890400,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,3.810400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.891000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.809400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.810400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,29.210400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.891000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,39.369400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,39.370400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.891000,-1.535000,39.370400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,39.369400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.369400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,39.369400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.891000,-1.535000,39.370400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.370400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<8.891000,-1.535000,39.370400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.354200,-1.535000,45.655800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.877000,-1.535000,45.872300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<9.354200,-1.535000,45.655800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.305000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.394900,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,4.314900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<9.394900,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.394900,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.714900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<9.394900,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.547200,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.032700,-1.535000,4.876800>}
box{<0,0,-0.304800><49.485500,0.035000,0.304800> rotate<0,0.000000,0> translate<9.547200,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,22.097900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,21.056400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<9.626400,-1.535000,22.097900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,24.663500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.626400,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.981900,-1.535000,32.867600>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<9.626400,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.626400,-1.535000,36.067900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.981900,-1.535000,35.712300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<9.626400,-1.535000,36.067900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.727900,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.094800,-1.535000,35.966400>}
box{<0,0,-0.304800><1.366900,0.035000,0.304800> rotate<0,0.000000,0> translate<9.727900,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.755900,-1.535000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.961300,-1.535000,38.081700>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-8.990654,0> translate<9.755900,-1.535000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.778700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,21.945600>}
box{<0,0,-0.304800><2.768900,0.035000,0.304800> rotate<0,0.000000,0> translate<9.778700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.778800,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,23.774400>}
box{<0,0,-0.304800><2.768800,0.035000,0.304800> rotate<0,0.000000,0> translate<9.778800,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.852100,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.727800,-1.535000,3.048000>}
box{<0,0,-0.304800><48.875700,0.035000,0.304800> rotate<0,0.000000,0> translate<9.852100,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.877000,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.442900,-1.535000,45.872300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<9.877000,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.953600,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.612300,-1.535000,29.870400>}
box{<0,0,-0.304800><6.658700,0.035000,0.304800> rotate<0,0.000000,0> translate<9.953600,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.961300,-1.535000,38.081700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.159000,-1.535000,38.146000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-18.015423,0> translate<9.961300,-1.535000,38.081700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.981900,-1.535000,32.867600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.712900,-1.535000,32.867600>}
box{<0,0,-0.304800><1.731000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.981900,-1.535000,32.867600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.981900,-1.535000,35.712300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.840700,-1.535000,35.712300>}
box{<0,0,-0.304800><0.858800,0.035000,0.304800> rotate<0,0.000000,0> translate<9.981900,-1.535000,35.712300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.809400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<10.109100,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.657600>}
box{<0,0,-0.304800><48.361700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.109100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,4.314900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<10.109100,-1.535000,4.314900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,4.267200>}
box{<0,0,-0.304800><48.361700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.109100,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.209400>}
box{<0,0,-0.304800><0.101100,0.035000,0.304800> rotate<0,90.000000,0> translate<10.109100,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.188900,-1.535000,29.108300>}
box{<0,0,-0.304800><0.079800,0.035000,0.304800> rotate<0,0.000000,0> translate<10.109100,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.714900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<10.109100,-1.535000,29.714900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.109100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.030400,-1.535000,29.260800>}
box{<0,0,-0.304800><2.921300,0.035000,0.304800> rotate<0,0.000000,0> translate<10.109100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.159000,-1.535000,38.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.344200,-1.535000,38.240300>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-26.982470,0> translate<10.159000,-1.535000,38.146000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.188900,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.877900,-1.535000,29.108300>}
box{<0,0,-0.304800><2.689000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.188900,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,17.601900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,19.228000>}
box{<0,0,-0.304800><1.626100,0.035000,0.304800> rotate<0,90.000000,0> translate<10.312300,-1.535000,19.228000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,17.601900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,17.246400>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<10.312300,-1.535000,17.601900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.344000,-1.535000,17.678400>}
box{<0,0,-0.304800><48.031700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.312300,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,18.288000>}
box{<0,0,-0.304800><62.966900,0.035000,0.304800> rotate<0,0.000000,0> translate<10.312300,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.877900,-1.535000,18.897600>}
box{<0,0,-0.304800><2.565600,0.035000,0.304800> rotate<0,0.000000,0> translate<10.312300,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312300,-1.535000,19.228000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,19.583500>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-44.988973,0> translate<10.312300,-1.535000,19.228000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.344200,-1.535000,38.240300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.512400,-1.535000,38.362500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-35.996631,0> translate<10.344200,-1.535000,38.240300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.388300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.471600,-1.535000,21.336000>}
box{<0,0,-0.304800><2.083300,0.035000,0.304800> rotate<0,0.000000,0> translate<10.388300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.388400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,24.384000>}
box{<0,0,-0.304800><2.159200,0.035000,0.304800> rotate<0,0.000000,0> translate<10.388400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.442900,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,45.872300>}
box{<0,0,-0.304800><2.435100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.442900,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.512400,-1.535000,38.362500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.659400,-1.535000,38.509500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.512400,-1.535000,38.362500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.540600,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,26.136400>}
box{<0,0,-0.304800><0.179959,0.035000,0.304800> rotate<0,44.974519,0> translate<10.540600,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.540600,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,26.263600>}
box{<0,0,-0.304800><2.007000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.540600,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.554700,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,38.404800>}
box{<0,0,-0.304800><1.992900,0.035000,0.304800> rotate<0,0.000000,0> translate<10.554700,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.591500,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.268300,-1.535000,19.507200>}
box{<0,0,-0.304800><1.676800,0.035000,0.304800> rotate<0,0.000000,0> translate<10.591500,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.591500,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,26.212800>}
box{<0,0,-0.304800><1.956100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.591500,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.615200,-1.535000,40.274500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.659400,-1.535000,40.230400>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,44.932147,0> translate<10.615200,-1.535000,40.274500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.615200,-1.535000,40.274500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.716700,-1.535000,40.316500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,-22.477951,0> translate<10.615200,-1.535000,40.274500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.656200,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,40.233600>}
box{<0,0,-0.304800><1.535800,0.035000,0.304800> rotate<0,0.000000,0> translate<10.656200,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.659400,-1.535000,38.509500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.781600,-1.535000,38.677700>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<10.659400,-1.535000,38.509500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.659400,-1.535000,40.230400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.781600,-1.535000,40.062200>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<10.659400,-1.535000,40.230400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,16.743600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,17.246400>}
box{<0,0,-0.304800><0.502800,0.035000,0.304800> rotate<0,90.000000,0> translate<10.667900,-1.535000,17.246400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,16.743600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.083600,-1.535000,14.327900>}
box{<0,0,-0.304800><3.416316,0.035000,0.304800> rotate<0,44.997030,0> translate<10.667900,-1.535000,16.743600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,17.068800>}
box{<0,0,-0.304800><47.244100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.667900,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,21.056400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<10.667900,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,20.116800>}
box{<0,0,-0.304800><1.524100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.667900,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,20.726400>}
box{<0,0,-0.304800><1.524100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.667900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,24.663500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,26.136400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<10.667900,-1.535000,26.136400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,24.993600>}
box{<0,0,-0.304800><1.879700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.667900,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.667900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,25.603200>}
box{<0,0,-0.304800><1.879700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.667900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.716700,-1.535000,40.316500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.245400,-1.535000,40.845200>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.716700,-1.535000,40.316500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.781600,-1.535000,38.677700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.875900,-1.535000,38.862900>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<10.781600,-1.535000,38.677700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.781600,-1.535000,40.062200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.875900,-1.535000,39.877000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<10.781600,-1.535000,40.062200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.840700,-1.535000,35.712300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,37.419200>}
box{<0,0,-0.304800><2.413921,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.840700,-1.535000,35.712300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.875900,-1.535000,38.862900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.940200,-1.535000,39.060600>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<10.875900,-1.535000,38.862900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.875900,-1.535000,39.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.940200,-1.535000,39.679300>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<10.875900,-1.535000,39.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.925100,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,39.014400>}
box{<0,0,-0.304800><1.622500,0.035000,0.304800> rotate<0,0.000000,0> translate<10.925100,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.940200,-1.535000,39.060600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.266000>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<10.940200,-1.535000,39.060600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.940200,-1.535000,39.679300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.473900>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<10.940200,-1.535000,39.679300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.949000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.217500,-1.535000,39.624000>}
box{<0,0,-0.304800><1.268500,0.035000,0.304800> rotate<0,0.000000,0> translate<10.949000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.952300,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,16.459200>}
box{<0,0,-0.304800><46.959700,0.035000,0.304800> rotate<0,0.000000,0> translate<10.952300,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.266000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.369400>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,90.000000,0> translate<10.972700,-1.535000,39.369400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.370400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.972700,-1.535000,39.473900>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,90.000000,0> translate<10.972700,-1.535000,39.473900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.192400,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.245400,-1.535000,42.974700>}
box{<0,0,-0.304800><0.074883,0.035000,0.304800> rotate<0,44.942930,0> translate<11.192400,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.192400,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,43.027600>}
box{<0,0,-0.304800><1.685600,0.035000,0.304800> rotate<0,0.000000,0> translate<11.192400,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.243400,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,40.843200>}
box{<0,0,-0.304800><0.948600,0.035000,0.304800> rotate<0,0.000000,0> translate<11.243400,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.245400,-1.535000,40.845200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.531500,-1.535000,41.536000>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-67.498287,0> translate<11.245400,-1.535000,40.845200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.245400,-1.535000,42.974700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.531500,-1.535000,42.283900>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,67.498287,0> translate<11.245400,-1.535000,42.974700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.370800,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,42.672000>}
box{<0,0,-0.304800><1.862700,0.035000,0.304800> rotate<0,0.000000,0> translate<11.370800,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.497000,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.522400,-1.535000,41.452800>}
box{<0,0,-0.304800><1.025400,0.035000,0.304800> rotate<0,0.000000,0> translate<11.497000,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.531500,-1.535000,41.536000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.531500,-1.535000,42.283900>}
box{<0,0,-0.304800><0.747900,0.035000,0.304800> rotate<0,90.000000,0> translate<11.531500,-1.535000,42.283900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.531500,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.132000,-1.535000,42.062400>}
box{<0,0,-0.304800><1.600500,0.035000,0.304800> rotate<0,0.000000,0> translate<11.531500,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.561900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,15.849600>}
box{<0,0,-0.304800><46.350100,0.035000,0.304800> rotate<0,0.000000,0> translate<11.561900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.712900,-1.535000,32.867600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.235700,-1.535000,33.084100>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<11.712900,-1.535000,32.867600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.835500,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,32.918400>}
box{<0,0,-0.304800><5.792100,0.035000,0.304800> rotate<0,0.000000,0> translate<11.835500,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.894200,-1.535000,11.494100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.417000,-1.535000,11.277600>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,22.493758,0> translate<11.894200,-1.535000,11.494100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.171500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,15.240000>}
box{<0,0,-0.304800><46.096100,0.035000,0.304800> rotate<0,0.000000,0> translate<12.171500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,18.542000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<12.192000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,19.583500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.192000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,21.412000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.192000,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,39.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,39.294000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<12.192000,-1.535000,39.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,41.122400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,39.649500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.192000,-1.535000,39.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,-1.535000,41.122400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,42.163900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.192000,-1.535000,41.122400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.235700,-1.535000,33.084100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.635800,-1.535000,33.484200>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.235700,-1.535000,33.084100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.417000,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,11.277600>}
box{<0,0,-0.304800><0.461000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.417000,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,21.412000>}
box{<0,0,-0.304800><4.851600,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.547600,-1.535000,21.412000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,39.294000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.547600,-1.535000,37.419200>}
box{<0,0,-0.304800><1.874800,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.547600,-1.535000,37.419200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.635800,-1.535000,33.484200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.175800,-1.535000,36.024200>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.635800,-1.535000,33.484200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.679600,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,33.528000>}
box{<0,0,-0.304800><4.948000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.679600,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.465000,-1.535000,6.400800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<12.750800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.115000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.750800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.968900,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<12.750800,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.968900,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<12.750800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,7.620400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.750800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.750800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.465000,-1.535000,8.839100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.750800,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.781100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,14.630400>}
box{<0,0,-0.304800><45.486500,0.035000,0.304800> rotate<0,0.000000,0> translate<12.781100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.877900,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,29.463900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.877900,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,10.922000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<12.878000,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,42.672000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<12.878000,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.878000,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,46.227900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<12.878000,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.083600,-1.535000,14.327900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,14.477900>}
box{<0,0,-0.304800><0.212061,0.035000,0.304800> rotate<0,-45.016134,0> translate<13.083600,-1.535000,14.327900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,10.922000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,14.477900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,18.542000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,29.463900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,29.463900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,29.463900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,42.163900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,42.672000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.233500,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,46.227900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.233500,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.289200,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,34.137600>}
box{<0,0,-0.304800><4.338400,0.035000,0.304800> rotate<0,0.000000,0> translate<13.289200,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.465000,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<13.465000,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.465000,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<13.465000,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.898800,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,34.747200>}
box{<0,0,-0.304800><3.373200,0.035000,0.304800> rotate<0,0.000000,0> translate<13.898800,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.968900,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.968900,-1.535000,7.619400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.968900,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.618900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<13.969400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,6.705600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.315200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.618900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,8.839100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<13.969400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.621000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.924800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.969400,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,8.534400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.969400,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.474900,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,6.400800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.970400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,7.621000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.970400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.474900,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<13.970400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.971000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.971000,-1.535000,7.620400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.971000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.971000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<13.971000,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.971000,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<13.971000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.474900,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.115000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.474900,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.474900,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,8.124900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<14.474900,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.508400,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,35.356800>}
box{<0,0,-0.304800><2.763600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.508400,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,11.277600>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<14.706400,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,14.122300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<14.706400,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,19.583500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.706400,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,29.463900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.062000,-1.535000,29.108300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<14.706400,-1.535000,29.463900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,41.808300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<14.706400,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,43.713500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.706400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,42.672000>}
box{<0,0,-0.304800><8.255200,0.035000,0.304800> rotate<0,0.000000,0> translate<14.706400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.706400,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<14.706400,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.757100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.502700,-1.535000,10.972800>}
box{<0,0,-0.304800><18.745600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.757100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.779600,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.055500,-1.535000,8.534400>}
box{<0,0,-0.304800><2.275900,0.035000,0.304800> rotate<0,0.000000,0> translate<14.779600,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.779700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.055400,-1.535000,6.705600>}
box{<0,0,-0.304800><2.275700,0.035000,0.304800> rotate<0,0.000000,0> translate<14.779700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.807900,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.212000,-1.535000,42.062400>}
box{<0,0,-0.304800><3.404100,0.035000,0.304800> rotate<0,0.000000,0> translate<14.807900,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.909500,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.864900,-1.535000,29.260800>}
box{<0,0,-0.304800><1.955400,0.035000,0.304800> rotate<0,0.000000,0> translate<14.909500,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.544600,-1.535000,11.277600>}
box{<0,0,-0.304800><2.482700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.061900,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.544600,-1.535000,14.122300>}
box{<0,0,-0.304800><2.482700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.061900,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.061900,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.957900,-1.535000,41.808300>}
box{<0,0,-0.304800><2.896000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.061900,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.062000,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.007900,-1.535000,18.897600>}
box{<0,0,-0.304800><21.945900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.062000,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.062000,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.992900,-1.535000,29.108300>}
box{<0,0,-0.304800><1.930900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.062000,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.118000,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,35.966400>}
box{<0,0,-0.304800><2.154000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.118000,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.175800,-1.535000,36.024200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,36.547000>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-67.500302,0> translate<15.175800,-1.535000,36.024200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.619400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<15.189100,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.315200>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.189100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,8.124900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<15.189100,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.189100,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.924800>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.189100,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.214300,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.003300,-1.535000,45.720000>}
box{<0,0,-0.304800><9.789000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.214300,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.316000,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,43.281600>}
box{<0,0,-0.304800><7.645600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.316000,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,21.412000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,26.263600>}
box{<0,0,-0.304800><4.851600,0.035000,0.304800> rotate<0,90.000000,0> translate<15.392300,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,21.412000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,21.056400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<15.392300,-1.535000,21.412000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,21.945600>}
box{<0,0,-0.304800><21.285300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.666300,-1.535000,22.555200>}
box{<0,0,-0.304800><6.274000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,23.164800>}
box{<0,0,-0.304800><5.689700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.246700,-1.535000,23.774400>}
box{<0,0,-0.304800><1.854400,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.780700,-1.535000,24.384000>}
box{<0,0,-0.304800><1.388400,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,24.993600>}
box{<0,0,-0.304800><1.219300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.654600,-1.535000,25.603200>}
box{<0,0,-0.304800><1.262300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.942100,-1.535000,26.212800>}
box{<0,0,-0.304800><1.549800,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.992900,-1.535000,26.263600>}
box{<0,0,-0.304800><1.600600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,36.547000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,37.112900>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,90.000000,0> translate<15.392300,-1.535000,37.112900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.805600,-1.535000,36.576000>}
box{<0,0,-0.304800><2.413300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,37.112900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,38.963600>}
box{<0,0,-0.304800><1.850700,0.035000,0.304800> rotate<0,90.000000,0> translate<15.392300,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.692600,-1.535000,37.185600>}
box{<0,0,-0.304800><6.300300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,37.795200>}
box{<0,0,-0.304800><11.585100,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,38.404800>}
box{<0,0,-0.304800><11.585100,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.392300,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.957900,-1.535000,38.963600>}
box{<0,0,-0.304800><2.565600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.392300,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.961900,-1.535000,21.336000>}
box{<0,0,-0.304800><10.493600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.468300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.671600,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.758600,-1.535000,19.507200>}
box{<0,0,-0.304800><10.087000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.671600,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,21.056400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<15.747900,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.116800>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.747900,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.726400>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.747900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,43.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<15.747900,-1.535000,45.186400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.139000,-1.535000,43.891200>}
box{<0,0,-0.304800><7.391100,0.035000,0.304800> rotate<0,0.000000,0> translate<15.747900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.693200,-1.535000,44.500800>}
box{<0,0,-0.304800><7.945300,0.035000,0.304800> rotate<0,0.000000,0> translate<15.747900,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.747900,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.302800,-1.535000,45.110400>}
box{<0,0,-0.304800><8.554900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.747900,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,24.792300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,24.138800>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<16.611600,-1.535000,24.792300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,25.499600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,24.792300>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.611600,-1.535000,24.792300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,25.499600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,26.153100>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<16.611600,-1.535000,25.499600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,29.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,29.218800>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<16.611600,-1.535000,29.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,30.579600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,29.872300>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.611600,-1.535000,29.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.611600,-1.535000,30.579600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,31.233100>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<16.611600,-1.535000,30.579600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.286500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.070000,-1.535000,6.670400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<16.814800,-1.535000,7.286500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.953400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.286500>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.814800,-1.535000,7.286500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814800,-1.535000,7.953400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.070000,-1.535000,8.569500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<16.814800,-1.535000,7.953400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,24.138800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.382400,-1.535000,23.638700>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,44.997030,0> translate<16.882300,-1.535000,24.138800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,26.153100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.992900,-1.535000,26.263600>}
box{<0,0,-0.304800><0.156341,0.035000,0.304800> rotate<0,-44.971118,0> translate<16.882300,-1.535000,26.153100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,29.218800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.992900,-1.535000,29.108300>}
box{<0,0,-0.304800><0.156341,0.035000,0.304800> rotate<0,44.971118,0> translate<16.882300,-1.535000,29.218800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.882300,-1.535000,31.233100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.382400,-1.535000,31.733200>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.882300,-1.535000,31.233100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.070000,-1.535000,6.670400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.541600,-1.535000,6.198800>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<17.070000,-1.535000,6.670400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.070000,-1.535000,8.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.541600,-1.535000,9.041100>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.070000,-1.535000,8.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,34.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,34.213900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<17.272000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,34.569500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.272000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.272000,-1.535000,36.042400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.382400,-1.535000,23.638700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.035900,-1.535000,23.368000>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,22.499371,0> translate<17.382400,-1.535000,23.638700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.382400,-1.535000,31.733200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,31.834700>}
box{<0,0,-0.304800><0.265378,0.035000,0.304800> rotate<0,-22.485518,0> translate<17.382400,-1.535000,31.733200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.541600,-1.535000,6.198800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,5.943600>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<17.541600,-1.535000,6.198800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.541600,-1.535000,9.041100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,9.296300>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<17.541600,-1.535000,9.041100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.544600,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,11.023600>}
box{<0,0,-0.304800><0.663632,0.035000,0.304800> rotate<0,22.502157,0> translate<17.544600,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.544600,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,14.376300>}
box{<0,0,-0.304800><0.663632,0.035000,0.304800> rotate<0,-22.502157,0> translate<17.544600,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,34.213900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.627600,-1.535000,31.834700>}
box{<0,0,-0.304800><2.379200,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.627600,-1.535000,31.834700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.957900,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,38.608000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<17.957900,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.957900,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,42.163900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.957900,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.035900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.064000,-1.535000,23.368000>}
box{<0,0,-0.304800><2.028100,0.035000,0.304800> rotate<0,0.000000,0> translate<18.035900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,5.943600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<18.157700,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,9.296300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<18.157700,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,11.023600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<18.157700,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.157700,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,14.376300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<18.157700,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<18.313500,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,38.608000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<18.313500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.313500,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,42.163900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<18.313500,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.142000,-1.535000,36.728300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<19.786400,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.106000,-1.535000,38.927600>}
box{<0,0,-0.304800><0.451983,0.035000,0.304800> rotate<0,-44.997030,0> translate<19.786400,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.786400,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.178000,-1.535000,41.772300>}
box{<0,0,-0.304800><0.553806,0.035000,0.304800> rotate<0,44.997030,0> translate<19.786400,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.887900,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,42.062400>}
box{<0,0,-0.304800><3.073700,0.035000,0.304800> rotate<0,0.000000,0> translate<19.887900,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.555400,-1.535000,6.197600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<19.942200,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.555400,-1.535000,9.042300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<19.942200,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.558300,-1.535000,11.278800>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<19.942200,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.942200,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.558300,-1.535000,14.121100>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<19.942200,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.064000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.717500,-1.535000,23.638700>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-22.499371,0> translate<20.064000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.106000,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.095200,-1.535000,38.927600>}
box{<0,0,-0.304800><2.989200,0.035000,0.304800> rotate<0,0.000000,0> translate<20.106000,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.142000,-1.535000,36.728300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.000700,-1.535000,36.728300>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.142000,-1.535000,36.728300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.178000,-1.535000,41.772300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,41.772300>}
box{<0,0,-0.304800><2.783600,0.035000,0.304800> rotate<0,0.000000,0> translate<20.178000,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.309900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.139600,-1.535000,9.144000>}
box{<0,0,-0.304800><2.829700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.309900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.310100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.139500,-1.535000,6.096000>}
box{<0,0,-0.304800><2.829400,0.035000,0.304800> rotate<0,0.000000,0> translate<20.310100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,31.834700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,33.883600>}
box{<0,0,-0.304800><2.048900,0.035000,0.304800> rotate<0,90.000000,0> translate<20.472300,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,31.834700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.717500,-1.535000,31.733200>}
box{<0,0,-0.304800><0.265378,0.035000,0.304800> rotate<0,22.485518,0> translate<20.472300,-1.535000,31.834700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,32.308800>}
box{<0,0,-0.304800><12.395300,0.035000,0.304800> rotate<0,0.000000,0> translate<20.472300,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.112500,-1.535000,32.918400>}
box{<0,0,-0.304800><5.640200,0.035000,0.304800> rotate<0,0.000000,0> translate<20.472300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.371300,-1.535000,33.528000>}
box{<0,0,-0.304800><4.899000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.472300,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.472300,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.307000,-1.535000,33.883600>}
box{<0,0,-0.304800><0.834700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.472300,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.555400,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.037900,-1.535000,6.197600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<20.555400,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.555400,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.037900,-1.535000,9.042300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<20.555400,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.558300,-1.535000,11.278800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.029900,-1.535000,11.750400>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<20.558300,-1.535000,11.278800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.558300,-1.535000,14.121100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.029900,-1.535000,13.649500>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<20.558300,-1.535000,14.121100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.658600,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.601300,-1.535000,14.020800>}
box{<0,0,-0.304800><6.942700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.658600,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.717500,-1.535000,23.638700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.802300,-1.535000,23.723600>}
box{<0,0,-0.304800><0.119996,0.035000,0.304800> rotate<0,-45.030791,0> translate<20.717500,-1.535000,23.638700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.717500,-1.535000,31.733200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,31.233100>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,44.997030,0> translate<20.717500,-1.535000,31.733200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.751500,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,31.699200>}
box{<0,0,-0.304800><12.116100,0.035000,0.304800> rotate<0,0.000000,0> translate<20.751500,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.802300,-1.535000,23.723600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,23.723600>}
box{<0,0,-0.304800><0.279700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.802300,-1.535000,23.723600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.861900,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.523400,-1.535000,11.582400>}
box{<0,0,-0.304800><2.661500,0.035000,0.304800> rotate<0,0.000000,0> translate<20.861900,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.954700,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,28.693100>}
box{<0,0,-0.304800><0.371797,0.035000,0.304800> rotate<0,44.997030,0> translate<20.954700,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.954700,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,29.218800>}
box{<0,0,-0.304800><0.371726,0.035000,0.304800> rotate<0,-44.986132,0> translate<20.954700,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.000700,-1.535000,36.728300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.292200,-1.535000,37.019800>}
box{<0,0,-0.304800><0.412243,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.000700,-1.535000,36.728300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.029900,-1.535000,11.750400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.285100,-1.535000,12.366500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<21.029900,-1.535000,11.750400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.029900,-1.535000,13.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.285100,-1.535000,13.033400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<21.029900,-1.535000,13.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,23.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.123500,-1.535000,22.098000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<21.082000,-1.535000,23.139500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,23.723600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,23.139500>}
box{<0,0,-0.304800><0.584100,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.082000,-1.535000,23.139500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.128700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.117100,-1.535000,13.411200>}
box{<0,0,-0.304800><1.988400,0.035000,0.304800> rotate<0,0.000000,0> translate<21.128700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.212800,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.913800,-1.535000,12.192000>}
box{<0,0,-0.304800><1.701000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.212800,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,28.693100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,28.039600>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<21.217600,-1.535000,28.693100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,29.218800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,29.872300>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<21.217600,-1.535000,29.218800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.217600,-1.535000,31.233100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,30.579600>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<21.217600,-1.535000,31.233100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.234900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.677200,-1.535000,29.260800>}
box{<0,0,-0.304800><1.442300,0.035000,0.304800> rotate<0,0.000000,0> translate<21.234900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.235000,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.067600,-1.535000,28.651200>}
box{<0,0,-0.304800><0.832600,0.035000,0.304800> rotate<0,0.000000,0> translate<21.235000,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.277100,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,31.089600>}
box{<0,0,-0.304800><11.590500,0.035000,0.304800> rotate<0,0.000000,0> translate<21.277100,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.285100,-1.535000,12.366500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.285100,-1.535000,13.033400>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,90.000000,0> translate<21.285100,-1.535000,13.033400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.285100,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.801600>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<21.285100,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.292200,-1.535000,37.019800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.815000,-1.535000,37.236300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<21.292200,-1.535000,37.019800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.307000,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.872900,-1.535000,33.883600>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<21.307000,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.487500,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.573000,-1.535000,28.041600>}
box{<0,0,-0.304800><0.085500,0.035000,0.304800> rotate<0,0.000000,0> translate<21.487500,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.487500,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.286800,-1.535000,29.870400>}
box{<0,0,-0.304800><1.799300,0.035000,0.304800> rotate<0,0.000000,0> translate<21.487500,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,27.837100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,28.039600>}
box{<0,0,-0.304800><0.202500,0.035000,0.304800> rotate<0,90.000000,0> translate<21.488300,-1.535000,28.039600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,27.837100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.654100,-1.535000,28.237700>}
box{<0,0,-0.304800><0.433555,0.035000,0.304800> rotate<0,-67.511899,0> translate<21.488300,-1.535000,27.837100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,29.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,30.579600>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,90.000000,0> translate<21.488300,-1.535000,30.579600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.488300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.987300,-1.535000,30.480000>}
box{<0,0,-0.304800><2.499000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.488300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.654100,-1.535000,28.237700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.054200,-1.535000,28.637800>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.654100,-1.535000,28.237700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.815000,-1.535000,37.236300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.059100,-1.535000,37.236300>}
box{<0,0,-0.304800><1.244100,0.035000,0.304800> rotate<0,0.000000,0> translate<21.815000,-1.535000,37.236300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.872900,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.395700,-1.535000,34.100100>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<21.872900,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.054200,-1.535000,28.637800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.832200,-1.535000,30.415800>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.054200,-1.535000,28.637800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.123500,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.596400,-1.535000,22.098000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<22.123500,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.395700,-1.535000,34.100100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.687200,-1.535000,34.391600>}
box{<0,0,-0.304800><0.412243,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.395700,-1.535000,34.100100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.433200,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.477700,-1.535000,34.137600>}
box{<0,0,-0.304800><1.044500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.433200,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.687200,-1.535000,34.391600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.131100,-1.535000,34.391600>}
box{<0,0,-0.304800><0.443900,0.035000,0.304800> rotate<0,0.000000,0> translate<22.687200,-1.535000,34.391600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.625000,-1.535000,11.480800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<22.910800,-1.535000,12.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.195000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.910800,-1.535000,12.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.128900,-1.535000,12.699400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<22.910800,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.128900,-1.535000,12.700400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<22.910800,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,13.204900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,12.700400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.910800,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.910800,-1.535000,13.204900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.625000,-1.535000,13.919100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.910800,-1.535000,13.204900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,43.462900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,41.772300>}
box{<0,0,-0.304800><1.690600,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.961600,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,43.462900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.178100,-1.535000,43.985700>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-67.500302,0> translate<22.961600,-1.535000,43.462900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.037900,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.393500,-1.535000,5.842000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<23.037900,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.037900,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.393500,-1.535000,9.397900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.037900,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.059100,-1.535000,37.236300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,37.496800>}
box{<0,0,-0.304800><0.368403,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.059100,-1.535000,37.236300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.095200,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,38.703100>}
box{<0,0,-0.304800><0.317420,0.035000,0.304800> rotate<0,45.009793,0> translate<23.095200,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.131100,-1.535000,34.391600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,34.203100>}
box{<0,0,-0.304800><0.266579,0.035000,0.304800> rotate<0,44.997030,0> translate<23.131100,-1.535000,34.391600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.178100,-1.535000,43.985700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.578200,-1.535000,44.385800>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.178100,-1.535000,43.985700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,34.203100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,33.907400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<23.319600,-1.535000,34.203100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,37.496800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,37.792500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-22.498031,0> translate<23.319600,-1.535000,37.496800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.319600,-1.535000,38.703100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,38.407400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<23.319600,-1.535000,38.703100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.393500,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.866400,-1.535000,5.842000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.393500,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.393500,-1.535000,9.397900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.866400,-1.535000,9.397900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.393500,-1.535000,9.397900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.578200,-1.535000,44.385800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.848200,-1.535000,45.655800>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.578200,-1.535000,44.385800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.596400,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,23.139500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.596400,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.625000,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,11.480800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<23.625000,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.625000,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,13.919100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<23.625000,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.832200,-1.535000,30.415800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.355000,-1.535000,30.632300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<23.832200,-1.535000,30.415800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,33.907400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,33.907400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.033500,-1.535000,33.907400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,37.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,37.792500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.033500,-1.535000,37.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.033500,-1.535000,38.407400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,38.407400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.033500,-1.535000,38.407400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.053600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,22.555200>}
box{<0,0,-0.304800><12.624000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.053600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.128900,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.128900,-1.535000,12.699400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.128900,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.698900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<24.129400,-1.535000,12.698900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,11.582400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.192000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.698900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.698900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,12.698900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,13.919100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<24.129400,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.701000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,12.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.801600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.129400,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,13.411200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.129400,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.634900,-1.535000,11.480800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130400,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.698900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,11.480800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.130400,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,12.701000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.130400,-1.535000,12.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130400,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.634900,-1.535000,13.919100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130400,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.131000,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.131000,-1.535000,12.700400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.131000,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.131000,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.699400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<24.131000,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.131000,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.700400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<24.131000,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,24.968000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,25.428900>}
box{<0,0,-0.304800><0.460900,0.035000,0.304800> rotate<0,90.000000,0> translate<24.282300,-1.535000,25.428900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,24.968000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,24.612400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<24.282300,-1.535000,24.968000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.953500,-1.535000,24.993600>}
box{<0,0,-0.304800><10.671200,0.035000,0.304800> rotate<0,0.000000,0> translate<24.282300,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,25.428900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,26.842700>}
box{<0,0,-0.304800><1.413800,0.035000,0.304800> rotate<0,90.000000,0> translate<24.282300,-1.535000,26.842700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,25.603200>}
box{<0,0,-0.304800><12.395300,0.035000,0.304800> rotate<0,0.000000,0> translate<24.282300,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,26.212800>}
box{<0,0,-0.304800><12.395300,0.035000,0.304800> rotate<0,0.000000,0> translate<24.282300,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.427900,-1.535000,26.822400>}
box{<0,0,-0.304800><11.145600,0.035000,0.304800> rotate<0,0.000000,0> translate<24.282300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.282300,-1.535000,26.842700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.227200,-1.535000,27.787600>}
box{<0,0,-0.304800><1.336290,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.282300,-1.535000,26.842700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.355000,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.920900,-1.535000,30.632300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.355000,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.634900,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.195000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.634900,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.634900,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,13.204900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<24.634900,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,23.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,24.612400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<24.637900,-1.535000,24.612400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.547000,-1.535000,23.164800>}
box{<0,0,-0.304800><9.909100,0.035000,0.304800> rotate<0,0.000000,0> translate<24.637900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.774400>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.637900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.637900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.343900,-1.535000,24.384000>}
box{<0,0,-0.304800><9.706000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.637900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.736500,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.398000,-1.535000,11.582400>}
box{<0,0,-0.304800><2.661500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.736500,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,33.907400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.163800,-1.535000,34.055500>}
box{<0,0,-0.304800><0.386870,0.035000,0.304800> rotate<0,-22.506734,0> translate<24.806400,-1.535000,33.907400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,37.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.520300,-1.535000,37.496800>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<24.806400,-1.535000,37.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.806400,-1.535000,38.407400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.520300,-1.535000,38.703100>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-22.498031,0> translate<24.806400,-1.535000,38.407400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.848200,-1.535000,45.655800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.371000,-1.535000,45.872300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<24.848200,-1.535000,45.655800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.866400,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.222000,-1.535000,6.197600>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.866400,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.866400,-1.535000,9.397900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.222000,-1.535000,9.042300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<24.866400,-1.535000,9.397900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.871600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,27.432000>}
box{<0,0,-0.304800><1.061900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.871600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.920900,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,30.632300>}
box{<0,0,-0.304800><0.657100,0.035000,0.304800> rotate<0,0.000000,0> translate<24.920900,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.120300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.950100,-1.535000,9.144000>}
box{<0,0,-0.304800><2.829800,0.035000,0.304800> rotate<0,0.000000,0> translate<25.120300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.120400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.949700,-1.535000,6.096000>}
box{<0,0,-0.304800><2.829300,0.035000,0.304800> rotate<0,0.000000,0> translate<25.120400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.142800,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.131300,-1.535000,13.411200>}
box{<0,0,-0.304800><1.988500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.142800,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.163800,-1.535000,34.055500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.174000,-1.535000,33.990800>}
box{<0,0,-0.304800><0.065499,0.035000,0.304800> rotate<0,81.035668,0> translate<25.163800,-1.535000,34.055500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.174000,-1.535000,33.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.248600,-1.535000,33.761200>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,71.995601,0> translate<25.174000,-1.535000,33.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.222000,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.704500,-1.535000,6.197600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.222000,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.222000,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.704500,-1.535000,9.042300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.222000,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.227200,-1.535000,27.787600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,27.787600>}
box{<0,0,-0.304800><0.350800,0.035000,0.304800> rotate<0,0.000000,0> translate<25.227200,-1.535000,27.787600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.248600,-1.535000,33.761200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.358200,-1.535000,33.546100>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,62.995615,0> translate<25.248600,-1.535000,33.761200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.346100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.047000,-1.535000,12.192000>}
box{<0,0,-0.304800><1.700900,0.035000,0.304800> rotate<0,0.000000,0> translate<25.346100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.699400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<25.349100,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,13.204900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<25.349100,-1.535000,13.204900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.349100,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.974800,-1.535000,12.801600>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<25.349100,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.358200,-1.535000,33.546100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.500100,-1.535000,33.350800>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,53.995237,0> translate<25.358200,-1.535000,33.546100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.371000,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,45.872300>}
box{<0,0,-0.304800><0.207000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.371000,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,19.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.165000,-1.535000,19.100800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<25.450800,-1.535000,19.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,19.815000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.450800,-1.535000,19.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.668900,-1.535000,20.319400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<25.450800,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.668900,-1.535000,20.320400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<25.450800,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.824900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.320400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.450800,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.450800,-1.535000,20.824900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.165000,-1.535000,21.539100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.450800,-1.535000,20.824900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.500100,-1.535000,33.350800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.670800,-1.535000,33.180100>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,44.997030,0> translate<25.500100,-1.535000,33.350800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.520300,-1.535000,37.496800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.066800,-1.535000,36.950300>}
box{<0,0,-0.304800><0.772868,0.035000,0.304800> rotate<0,44.997030,0> translate<25.520300,-1.535000,37.496800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.520300,-1.535000,38.703100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.066800,-1.535000,39.249600>}
box{<0,0,-0.304800><0.772868,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.520300,-1.535000,38.703100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,27.787600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,27.432000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<25.578000,-1.535000,27.787600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,30.987900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<25.578000,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.578000,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,46.227900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<25.578000,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.670800,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.866100,-1.535000,33.038200>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,35.998823,0> translate<25.670800,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.831500,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.196000,-1.535000,37.185600>}
box{<0,0,-0.304800><1.364500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.831500,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.831600,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.196100,-1.535000,39.014400>}
box{<0,0,-0.304800><1.364500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.831600,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.866100,-1.535000,33.038200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.081200,-1.535000,32.928600>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,26.998446,0> translate<25.866100,-1.535000,33.038200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,27.432000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<25.933500,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,30.987900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,30.987900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<25.933500,-1.535000,30.987900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.933500,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,46.227900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<25.933500,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.066800,-1.535000,36.950300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,36.236400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<26.066800,-1.535000,36.950300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.066800,-1.535000,39.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,39.963500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<26.066800,-1.535000,39.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.081200,-1.535000,32.928600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.310800,-1.535000,32.854000>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,17.998459,0> translate<26.081200,-1.535000,32.928600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.165000,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,19.100800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.165000,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.165000,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,21.539100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.165000,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.221800,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.118000,-1.535000,39.624000>}
box{<0,0,-0.304800><0.896200,0.035000,0.304800> rotate<0,0.000000,0> translate<26.221800,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.221900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.696700,-1.535000,36.576000>}
box{<0,0,-0.304800><1.474800,0.035000,0.304800> rotate<0,0.000000,0> translate<26.221900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.310800,-1.535000,32.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,32.816200>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,9.009053,0> translate<26.310800,-1.535000,32.854000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,35.854100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,36.236400>}
box{<0,0,-0.304800><0.382300,0.035000,0.304800> rotate<0,90.000000,0> translate<26.362500,-1.535000,36.236400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,35.854100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,35.883700>}
box{<0,0,-0.304800><0.189032,0.035000,0.304800> rotate<0,-9.008274,0> translate<26.362500,-1.535000,35.854100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.537400,-1.535000,35.966400>}
box{<0,0,-0.304800><1.174900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.362500,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,39.963500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,40.345800>}
box{<0,0,-0.304800><0.382300,0.035000,0.304800> rotate<0,90.000000,0> translate<26.362500,-1.535000,40.345800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,40.233600>}
box{<0,0,-0.304800><0.614900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.362500,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.362500,-1.535000,40.345800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,40.316200>}
box{<0,0,-0.304800><0.189032,0.035000,0.304800> rotate<0,9.008274,0> translate<26.362500,-1.535000,40.345800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,32.816200>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.549200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,35.883700>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.549200,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549200,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,40.316200>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.549200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.329100>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<26.649600,-1.535000,34.329100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,32.918400>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,33.528000>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.137600>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.329100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.329100>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,34.329100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,35.883700>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<26.649600,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.370800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,34.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.747200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,35.356800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,41.829100>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<26.649600,-1.535000,41.829100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,40.843200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,41.452800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.649600,-1.535000,41.829100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,41.829100>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.649600,-1.535000,41.829100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.668900,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.668900,-1.535000,20.319400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.668900,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.318900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<26.669400,-1.535000,20.318900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,19.507200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.116800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.318900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.318900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,20.318900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,21.539100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<26.669400,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.321000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,20.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.726400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.669400,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,21.336000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.669400,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.174900,-1.535000,19.100800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.670400,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.318900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,19.100800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.670400,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,20.321000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.670400,-1.535000,20.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670400,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.174900,-1.535000,21.539100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.670400,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.671000,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.671000,-1.535000,20.320400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<26.671000,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.671000,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.319400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<26.671000,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.671000,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.320400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<26.671000,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,32.816200>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.690200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.329100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,32.816200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.690200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,34.370800>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.690200,-1.535000,34.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,35.883700>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.690200,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,40.316200>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.690200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,41.829100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690200,-1.535000,40.316200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.690200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690800,-1.535000,34.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690800,-1.535000,34.370200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,90.000000,0> translate<26.690800,-1.535000,34.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690800,-1.535000,34.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.329600>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.690800,-1.535000,34.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690800,-1.535000,34.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.370200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.690800,-1.535000,34.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.029100,-1.535000,32.854000>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,-9.009053,0> translate<26.790700,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.029100,-1.535000,35.845900>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,9.009053,0> translate<26.790700,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790700,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,40.345800>}
box{<0,0,-0.304800><0.189032,0.035000,0.304800> rotate<0,-9.008274,0> translate<26.790700,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.974800,-1.535000,12.366500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,11.750400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<26.974800,-1.535000,12.366500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.974800,-1.535000,13.033400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.974800,-1.535000,12.366500>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.974800,-1.535000,12.366500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.974800,-1.535000,13.033400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,13.649500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<26.974800,-1.535000,13.033400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,37.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,36.999600>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<26.977400,-1.535000,37.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,38.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,37.713500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.977400,-1.535000,37.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,38.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,39.200300>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<26.977400,-1.535000,38.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,39.963500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,39.249600>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<26.977400,-1.535000,39.963500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,40.345800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.977400,-1.535000,39.963500>}
box{<0,0,-0.304800><0.382300,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.977400,-1.535000,39.963500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.029100,-1.535000,32.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.258700,-1.535000,32.928600>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-17.998459,0> translate<27.029100,-1.535000,32.854000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.029100,-1.535000,35.845900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.258700,-1.535000,35.771300>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,17.998459,0> translate<27.029100,-1.535000,35.845900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.174900,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,19.815000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.174900,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.174900,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.824900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<27.174900,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.227300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,32.918400>}
box{<0,0,-0.304800><5.640300,0.035000,0.304800> rotate<0,0.000000,0> translate<27.227300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,11.750400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.701600,-1.535000,11.278800>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<27.230000,-1.535000,11.750400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,13.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.701600,-1.535000,14.121100>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.230000,-1.535000,13.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.258700,-1.535000,32.928600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.473800,-1.535000,33.038200>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-26.998446,0> translate<27.258700,-1.535000,32.928600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.258700,-1.535000,35.771300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.473800,-1.535000,35.661700>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,26.998446,0> translate<27.258700,-1.535000,35.771300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,36.999600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723400,-1.535000,36.549400>}
box{<0,0,-0.304800><0.636750,0.035000,0.304800> rotate<0,44.990668,0> translate<27.273100,-1.535000,36.999600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,39.200300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.297800,-1.535000,39.225000>}
box{<0,0,-0.304800><0.034931,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.273100,-1.535000,39.200300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.273100,-1.535000,39.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.297800,-1.535000,39.225000>}
box{<0,0,-0.304800><0.034860,0.035000,0.304800> rotate<0,44.880819,0> translate<27.273100,-1.535000,39.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.378000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.601700,-1.535000,21.336000>}
box{<0,0,-0.304800><9.223700,0.035000,0.304800> rotate<0,0.000000,0> translate<27.378000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,28.473500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.406400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.818300,-1.535000,27.432000>}
box{<0,0,-0.304800><7.411900,0.035000,0.304800> rotate<0,0.000000,0> translate<27.406400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,30.987900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,29.946400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<27.406400,-1.535000,30.987900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.406400,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.761900,-1.535000,45.872300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<27.406400,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.473800,-1.535000,33.038200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.669100,-1.535000,33.180100>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-35.998823,0> translate<27.473800,-1.535000,33.038200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.473800,-1.535000,35.661700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.558600,-1.535000,35.600100>}
box{<0,0,-0.304800><0.104812,0.035000,0.304800> rotate<0,35.992845,0> translate<27.473800,-1.535000,35.661700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.741000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.558600,-1.535000,35.600100>}
box{<0,0,-0.304800><0.142669,0.035000,0.304800> rotate<0,80.961483,0> translate<27.536200,-1.535000,35.741000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.741000>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.536200,-1.535000,35.741000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.918900,-1.535000,35.849400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<27.536200,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.918900,-1.535000,35.850400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<27.536200,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.958900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.850400>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.536200,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.536200,-1.535000,35.958900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.570300,-1.535000,36.174000>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-80.986468,0> translate<27.536200,-1.535000,35.958900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.570300,-1.535000,36.174000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.637600,-1.535000,36.381200>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-72.001091,0> translate<27.570300,-1.535000,36.174000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.581300,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.398300,-1.535000,19.507200>}
box{<0,0,-0.304800><8.817000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.581300,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.637600,-1.535000,36.381200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723400,-1.535000,36.549400>}
box{<0,0,-0.304800><0.188820,0.035000,0.304800> rotate<0,-62.969397,0> translate<27.637600,-1.535000,36.381200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.669100,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.839800,-1.535000,33.350800>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.669100,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.701600,-1.535000,11.278800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,11.023600>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<27.701600,-1.535000,11.278800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.701600,-1.535000,14.121100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,14.376300>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<27.701600,-1.535000,14.121100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.704500,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,5.943600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<27.704500,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.704500,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,9.296300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<27.704500,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.711600,-1.535000,42.977300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.761900,-1.535000,43.027600>}
box{<0,0,-0.304800><0.071135,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.711600,-1.535000,42.977300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.711600,-1.535000,42.977300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.839800,-1.535000,42.849100>}
box{<0,0,-0.304800><0.181302,0.035000,0.304800> rotate<0,44.997030,0> translate<27.711600,-1.535000,42.977300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.761900,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.467900,-1.535000,43.027600>}
box{<0,0,-0.304800><6.706000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.761900,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.761900,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.467900,-1.535000,45.872300>}
box{<0,0,-0.304800><6.706000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.761900,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.839800,-1.535000,33.350800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.981700,-1.535000,33.546100>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-53.995237,0> translate<27.839800,-1.535000,33.350800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.839800,-1.535000,42.849100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.981700,-1.535000,42.653800>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,53.995237,0> translate<27.839800,-1.535000,42.849100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,19.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.319400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<27.889100,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,20.116800>}
box{<0,0,-0.304800><8.432900,0.035000,0.304800> rotate<0,0.000000,0> translate<27.889100,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.824900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<27.889100,-1.535000,20.824900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.889100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,20.726400>}
box{<0,0,-0.304800><8.432900,0.035000,0.304800> rotate<0,0.000000,0> translate<27.889100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.914300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,30.480000>}
box{<0,0,-0.304800><4.953300,0.035000,0.304800> rotate<0,0.000000,0> translate<27.914300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.968500,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,33.528000>}
box{<0,0,-0.304800><4.899100,0.035000,0.304800> rotate<0,0.000000,0> translate<27.968500,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.968500,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.823500,-1.535000,42.672000>}
box{<0,0,-0.304800><6.855000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.968500,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.981700,-1.535000,33.546100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.091300,-1.535000,33.761200>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-62.995615,0> translate<27.981700,-1.535000,33.546100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.981700,-1.535000,42.653800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.091300,-1.535000,42.438700>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,62.995615,0> translate<27.981700,-1.535000,42.653800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.016000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.194200,-1.535000,28.041600>}
box{<0,0,-0.304800><3.178200,0.035000,0.304800> rotate<0,0.000000,0> translate<28.016000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.091300,-1.535000,33.761200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.165900,-1.535000,33.990800>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-71.995601,0> translate<28.091300,-1.535000,33.761200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.091300,-1.535000,42.438700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.165900,-1.535000,42.209100>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,71.995601,0> translate<28.091300,-1.535000,42.438700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.165900,-1.535000,33.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.229200>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,-80.985008,0> translate<28.165900,-1.535000,33.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.165900,-1.535000,42.209100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.176100,-1.535000,42.144400>}
box{<0,0,-0.304800><0.065499,0.035000,0.304800> rotate<0,81.035668,0> translate<28.165900,-1.535000,42.209100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.169700,-1.535000,34.684700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.194700,-1.535000,34.666500>}
box{<0,0,-0.304800><0.030923,0.035000,0.304800> rotate<0,36.052239,0> translate<28.169700,-1.535000,34.684700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.169700,-1.535000,34.684700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.470700>}
box{<0,0,-0.304800><0.216684,0.035000,0.304800> rotate<0,80.967043,0> translate<28.169700,-1.535000,34.684700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.176100,-1.535000,42.144400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.533500,-1.535000,42.292500>}
box{<0,0,-0.304800><0.386870,0.035000,0.304800> rotate<0,-22.506734,0> translate<28.176100,-1.535000,42.144400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.189100,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,34.137600>}
box{<0,0,-0.304800><4.678500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.189100,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.194700,-1.535000,34.666500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.388700,-1.535000,34.567600>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,27.010423,0> translate<28.194700,-1.535000,34.666500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.229200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.329600>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,90.000000,0> translate<28.203700,-1.535000,34.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.203700,-1.535000,34.470700>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,90.000000,0> translate<28.203700,-1.535000,34.470700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,5.943600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.317700,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,9.296300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.317700,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,11.023600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.317700,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.317700,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,14.376300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.317700,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.388700,-1.535000,34.567600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.595900,-1.535000,34.500300>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,17.992969,0> translate<28.388700,-1.535000,34.567600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,28.473500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,29.946400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<28.447900,-1.535000,29.946400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.584600,-1.535000,28.651200>}
box{<0,0,-0.304800><2.136700,0.035000,0.304800> rotate<0,0.000000,0> translate<28.447900,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.260800>}
box{<0,0,-0.304800><2.082900,0.035000,0.304800> rotate<0,0.000000,0> translate<28.447900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.447900,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.686300,-1.535000,29.870400>}
box{<0,0,-0.304800><2.238400,0.035000,0.304800> rotate<0,0.000000,0> translate<28.447900,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.533500,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.306400,-1.535000,42.292500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<28.533500,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.595900,-1.535000,34.500300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.811000,-1.535000,34.466200>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,9.007592,0> translate<28.595900,-1.535000,34.500300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.811000,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,34.466200>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,0.000000,0> translate<28.811000,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.918900,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.918900,-1.535000,35.849400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.918900,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,35.848900>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,90.000000,0> translate<28.919400,-1.535000,35.848900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,34.747200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.919400,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,35.356800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.919400,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.919400,-1.535000,35.848900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,35.848900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.919400,-1.535000,35.848900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.028900,-1.535000,34.466200>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.920400,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,35.848900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920400,-1.535000,34.466200>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.920400,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.921000,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.921000,-1.535000,35.850400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.921000,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.921000,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.849400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<28.921000,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.921000,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.850400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<28.921000,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.028900,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.244000,-1.535000,34.500300>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-9.007592,0> translate<29.028900,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.244000,-1.535000,34.500300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.451200,-1.535000,34.567600>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-17.992969,0> translate<29.244000,-1.535000,34.500300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.306400,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.020300,-1.535000,41.996800>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<29.306400,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.451200,-1.535000,34.567600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.645200,-1.535000,34.666500>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,-27.010423,0> translate<29.451200,-1.535000,34.567600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.645200,-1.535000,34.666500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.821400,-1.535000,34.794500>}
box{<0,0,-0.304800><0.217785,0.035000,0.304800> rotate<0,-35.994050,0> translate<29.645200,-1.535000,34.666500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.756200,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,34.747200>}
box{<0,0,-0.304800><2.755800,0.035000,0.304800> rotate<0,0.000000,0> translate<29.756200,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.821400,-1.535000,34.794500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.975400,-1.535000,34.948500>}
box{<0,0,-0.304800><0.217789,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.821400,-1.535000,34.794500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.862000,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.452000,-1.535000,42.062400>}
box{<0,0,-0.304800><3.590000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.862000,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.975400,-1.535000,34.948500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.103400,-1.535000,35.124700>}
box{<0,0,-0.304800><0.217785,0.035000,0.304800> rotate<0,-54.000010,0> translate<29.975400,-1.535000,34.948500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.020300,-1.535000,41.996800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.244800,-1.535000,41.772300>}
box{<0,0,-0.304800><0.317491,0.035000,0.304800> rotate<0,44.997030,0> translate<30.020300,-1.535000,41.996800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.718300,-1.535000,6.198800>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<30.102200,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.718300,-1.535000,9.041100>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<30.102200,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.715400,-1.535000,11.277600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<30.102200,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.102200,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.715400,-1.535000,14.122300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<30.102200,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.103400,-1.535000,35.124700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.202300,-1.535000,35.318700>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,-62.983637,0> translate<30.103400,-1.535000,35.124700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.116500,-1.535000,36.549400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.202300,-1.535000,36.381200>}
box{<0,0,-0.304800><0.188820,0.035000,0.304800> rotate<0,62.969397,0> translate<30.116500,-1.535000,36.549400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.116500,-1.535000,36.549400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.566800,-1.535000,36.999600>}
box{<0,0,-0.304800><0.636750,0.035000,0.304800> rotate<0,-44.990668,0> translate<30.116500,-1.535000,36.549400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.143100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.045600,-1.535000,36.576000>}
box{<0,0,-0.304800><2.902500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.143100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.202300,-1.535000,35.318700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.269600,-1.535000,35.525900>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-72.001091,0> translate<30.202300,-1.535000,35.318700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.202300,-1.535000,36.381200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.269600,-1.535000,36.174000>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,72.001091,0> translate<30.202300,-1.535000,36.381200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.214600,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,35.356800>}
box{<0,0,-0.304800><2.297400,0.035000,0.304800> rotate<0,0.000000,0> translate<30.214600,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.244800,-1.535000,41.772300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.161900,-1.535000,41.772300>}
box{<0,0,-0.304800><2.917100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.244800,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.269600,-1.535000,35.525900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.741000>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-80.986468,0> translate<30.269600,-1.535000,35.525900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.269600,-1.535000,36.174000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.958900>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,80.986468,0> translate<30.269600,-1.535000,36.174000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.302600,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,35.966400>}
box{<0,0,-0.304800><2.209400,0.035000,0.304800> rotate<0,0.000000,0> translate<30.302600,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.741000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.849400>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,90.000000,0> translate<30.303700,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.303700,-1.535000,35.958900>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,90.000000,0> translate<30.303700,-1.535000,35.958900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.469900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.110100,-1.535000,9.144000>}
box{<0,0,-0.304800><7.640200,0.035000,0.304800> rotate<0,0.000000,0> translate<30.469900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.470100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.109700,-1.535000,6.096000>}
box{<0,0,-0.304800><7.639600,0.035000,0.304800> rotate<0,0.000000,0> translate<30.470100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,28.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.245000,-1.535000,27.990800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<30.530800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,28.705000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.530800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.748900,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.530800,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.748900,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.530800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.210400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.530800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.530800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.245000,-1.535000,30.429100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.530800,-1.535000,29.714900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.566800,-1.535000,36.999600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,37.713500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<30.566800,-1.535000,36.999600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.643800,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,37.185600>}
box{<0,0,-0.304800><5.678200,0.035000,0.304800> rotate<0,0.000000,0> translate<30.643800,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.679700,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,38.486400>}
box{<0,0,-0.304800><0.477570,0.035000,0.304800> rotate<0,67.490117,0> translate<30.679700,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.679700,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.233900,-1.535000,38.927600>}
box{<0,0,-0.304800><2.554200,0.035000,0.304800> rotate<0,0.000000,0> translate<30.679700,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.715400,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.197900,-1.535000,11.277600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.715400,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.715400,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.197900,-1.535000,14.122300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.715400,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.718300,-1.535000,6.198800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.189900,-1.535000,6.670400>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.718300,-1.535000,6.198800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.718300,-1.535000,9.041100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.189900,-1.535000,8.569500>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<30.718300,-1.535000,9.041100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,37.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,38.486400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,90.000000,0> translate<30.862500,-1.535000,38.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,37.795200>}
box{<0,0,-0.304800><5.815100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.862500,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.862500,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,38.404800>}
box{<0,0,-0.304800><5.815100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.862500,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.189900,-1.535000,6.670400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.286500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<31.189900,-1.535000,6.670400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.189900,-1.535000,8.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.953400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<31.189900,-1.535000,8.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.204400,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.480200,-1.535000,6.705600>}
box{<0,0,-0.304800><2.275800,0.035000,0.304800> rotate<0,0.000000,0> translate<31.204400,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.204500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.480300,-1.535000,8.534400>}
box{<0,0,-0.304800><2.275800,0.035000,0.304800> rotate<0,0.000000,0> translate<31.204500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.245000,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,27.990800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<31.245000,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.245000,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<31.245000,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.286500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.953400>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,90.000000,0> translate<31.445100,-1.535000,7.953400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.315200>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<31.445100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.445100,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.924800>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<31.445100,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.748900,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.748900,-1.535000,29.209400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.748900,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.208900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<31.749400,-1.535000,29.208900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,28.041600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,28.651200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.208900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.208900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,29.208900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,30.429100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<31.749400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.211000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.260800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.749400,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.870400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.749400,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.254900,-1.535000,27.990800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<31.750400,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.208900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,27.990800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.750400,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,29.211000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.750400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.254900,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<31.750400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.751000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.751000,-1.535000,29.210400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<31.751000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.751000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.751000,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.751000,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.751000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.254900,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,28.705000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.254900,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.254900,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,29.816300>}
box{<0,0,-0.304800><0.866559,0.035000,0.304800> rotate<0,45.001705,0> translate<32.254900,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.305700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.208700,-1.535000,28.041600>}
box{<0,0,-0.304800><1.903000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.305700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,34.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,34.213900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<32.512000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,34.569500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.512000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.512000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.512000,-1.535000,36.042400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.813600,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,29.870400>}
box{<0,0,-0.304800><0.054000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.813600,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,34.213900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.867600,-1.535000,29.816300>}
box{<0,0,-0.304800><4.397600,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.867600,-1.535000,29.816300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.915300,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.599100,-1.535000,28.651200>}
box{<0,0,-0.304800><0.683800,0.035000,0.304800> rotate<0,0.000000,0> translate<32.915300,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,28.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.209400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<32.969100,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.444100>}
box{<0,0,-0.304800><0.233700,0.035000,0.304800> rotate<0,90.000000,0> translate<32.969100,-1.535000,29.444100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.044900,-1.535000,29.260800>}
box{<0,0,-0.304800><0.075800,0.035000,0.304800> rotate<0,0.000000,0> translate<32.969100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.969100,-1.535000,29.444100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.084100,-1.535000,29.166200>}
box{<0,0,-0.304800><0.300755,0.035000,0.304800> rotate<0,67.514896,0> translate<32.969100,-1.535000,29.444100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.785000,-1.535000,6.400800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<33.070800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.115000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.070800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.288900,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<33.070800,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.288900,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<33.070800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,7.620400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.070800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.070800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.785000,-1.535000,8.839100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.070800,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.084100,-1.535000,29.166200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.484200,-1.535000,28.766100>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,44.997030,0> translate<33.084100,-1.535000,29.166200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.161900,-1.535000,41.772300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,42.163900>}
box{<0,0,-0.304800><0.553806,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.161900,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.197900,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,10.922000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<33.197900,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.197900,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,14.477900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.197900,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.233900,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,38.608000>}
box{<0,0,-0.304800><0.451983,0.035000,0.304800> rotate<0,44.997030,0> translate<33.233900,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.484200,-1.535000,28.766100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.770200,-1.535000,26.480100>}
box{<0,0,-0.304800><3.232892,0.035000,0.304800> rotate<0,44.997030,0> translate<33.484200,-1.535000,28.766100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,10.922000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.553500,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,14.477900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.553500,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.553500,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,38.608000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.553500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.553500,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,42.163900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.553500,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.785000,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<33.785000,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.785000,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<33.785000,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.288900,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.288900,-1.535000,7.619400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.288900,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.618900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<34.289400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,6.705600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.315200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.618900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,8.839100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<34.289400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.621000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.924800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.289400,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,8.534400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.289400,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.794900,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<34.290400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,6.400800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.290400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,7.621000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.290400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.794900,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<34.290400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.291000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.291000,-1.535000,7.620400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.291000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.291000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<34.291000,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.291000,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<34.291000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.055000,-1.535000,22.656800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<34.340800,-1.535000,23.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.371000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.340800,-1.535000,23.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.558900,-1.535000,23.875400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<34.340800,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.558900,-1.535000,23.876400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<34.340800,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,24.380900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,23.876400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.340800,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.340800,-1.535000,24.380900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.055000,-1.535000,25.095100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.340800,-1.535000,24.380900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.467900,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.823500,-1.535000,42.672000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<34.467900,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.467900,-1.535000,45.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.823500,-1.535000,46.227900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.467900,-1.535000,45.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.794900,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.115000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.794900,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.794900,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,8.124900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<34.794900,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.823500,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.296400,-1.535000,42.672000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<34.823500,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.823500,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.296400,-1.535000,46.227900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<34.823500,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382000,-1.535000,11.277600>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.026400,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382000,-1.535000,14.122300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<35.026400,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,36.042400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<35.026400,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,39.649500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.026400,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026400,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,41.122400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<35.026400,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.055000,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,22.656800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<35.055000,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.055000,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,25.095100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<35.055000,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.077200,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.822700,-1.535000,10.972800>}
box{<0,0,-0.304800><18.745500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.077200,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.099600,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.375500,-1.535000,8.534400>}
box{<0,0,-0.304800><2.275900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.099600,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.099700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.375400,-1.535000,6.705600>}
box{<0,0,-0.304800><2.275700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.099700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.127900,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.072000,-1.535000,42.062400>}
box{<0,0,-0.304800><5.944100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.127900,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382000,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.864500,-1.535000,11.277600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.382000,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382000,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.864500,-1.535000,14.122300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.382000,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.432800,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,39.014400>}
box{<0,0,-0.304800><1.244800,0.035000,0.304800> rotate<0,0.000000,0> translate<35.432800,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.619400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<35.509100,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.315200>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.509100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,8.124900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<35.509100,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.509100,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.924800>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.509100,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.534300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,36.576000>}
box{<0,0,-0.304800><0.787700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.534300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.558900,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.558900,-1.535000,23.875400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.558900,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.874900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<35.559400,-1.535000,23.874900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.164800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.774400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.874900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.874900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,23.874900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,25.095100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<35.559400,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,23.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.877000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,23.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,24.384000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.559400,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,24.993600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.559400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.064900,-1.535000,22.656800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560400,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.874900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,22.656800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.560400,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,23.877000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.560400,-1.535000,23.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560400,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.064900,-1.535000,25.095100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.560400,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,30.561200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,34.213900>}
box{<0,0,-0.304800><3.652700,0.035000,0.304800> rotate<0,90.000000,0> translate<35.712300,-1.535000,34.213900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,30.561200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.165200,-1.535000,29.108300>}
box{<0,0,-0.304800><2.054711,0.035000,0.304800> rotate<0,44.997030,0> translate<35.712300,-1.535000,30.561200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.032900,-1.535000,31.089600>}
box{<0,0,-0.304800><10.320600,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.558400,-1.535000,31.699200>}
box{<0,0,-0.304800><10.846100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,32.308800>}
box{<0,0,-0.304800><11.125300,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,32.918400>}
box{<0,0,-0.304800><11.125300,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,33.528000>}
box{<0,0,-0.304800><11.125300,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.354200,-1.535000,34.137600>}
box{<0,0,-0.304800><5.641900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.712300,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.712300,-1.535000,34.213900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,34.569500>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.712300,-1.535000,34.213900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.737500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.425200,-1.535000,41.452800>}
box{<0,0,-0.304800><2.687700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.737500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.770200,-1.535000,26.480100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.293000,-1.535000,26.263600>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,22.493758,0> translate<35.770200,-1.535000,26.480100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.793500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,30.480000>}
box{<0,0,-0.304800><10.028100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.793500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.042400,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.770900,-1.535000,39.624000>}
box{<0,0,-0.304800><0.728500,0.035000,0.304800> rotate<0,0.000000,0> translate<36.042400,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.064900,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.434800,-1.535000,23.026800>}
box{<0,0,-0.304800><0.523188,0.035000,0.304800> rotate<0,-45.004773,0> translate<36.064900,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.064900,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.434800,-1.535000,24.725100>}
box{<0,0,-0.304800><0.523188,0.035000,0.304800> rotate<0,45.004773,0> translate<36.064900,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,34.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,36.042400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<36.067900,-1.535000,36.042400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.744600,-1.535000,34.747200>}
box{<0,0,-0.304800><4.676700,0.035000,0.304800> rotate<0,0.000000,0> translate<36.067900,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.804700,-1.535000,35.356800>}
box{<0,0,-0.304800><0.736800,0.035000,0.304800> rotate<0,0.000000,0> translate<36.067900,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,35.966400>}
box{<0,0,-0.304800><0.254100,0.035000,0.304800> rotate<0,0.000000,0> translate<36.067900,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,39.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,41.122400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<36.067900,-1.535000,41.122400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.206000,-1.535000,40.233600>}
box{<0,0,-0.304800><1.138100,0.035000,0.304800> rotate<0,0.000000,0> translate<36.067900,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.067900,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.815600,-1.535000,40.843200>}
box{<0,0,-0.304800><1.747700,0.035000,0.304800> rotate<0,0.000000,0> translate<36.067900,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.166400,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,24.993600>}
box{<0,0,-0.304800><0.511200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.166400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.293000,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,26.263600>}
box{<0,0,-0.304800><0.384600,0.035000,0.304800> rotate<0,0.000000,0> translate<36.293000,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.296400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,43.713500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.296400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.296400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,42.672000>}
box{<0,0,-0.304800><10.541200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.296400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.296400,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<36.296400,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.363500,-1.535000,18.542000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<36.322000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,19.583500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.322000,-1.535000,19.583500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,21.056400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,21.411900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-44.988973,0> translate<36.322000,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,35.839500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.363500,-1.535000,34.798000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<36.322000,-1.535000,35.839500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,37.312400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,35.839500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.322000,-1.535000,35.839500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,37.312400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,37.668000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.322000,-1.535000,37.312400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.403100,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.822300,-1.535000,29.870400>}
box{<0,0,-0.304800><9.419200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.403100,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.434800,-1.535000,23.026800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,22.783900>}
box{<0,0,-0.304800><0.343442,0.035000,0.304800> rotate<0,45.008826,0> translate<36.434800,-1.535000,23.026800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.434800,-1.535000,24.725100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,24.968000>}
box{<0,0,-0.304800><0.343442,0.035000,0.304800> rotate<0,-45.008826,0> translate<36.434800,-1.535000,24.725100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,22.783900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,21.411900>}
box{<0,0,-0.304800><1.372000,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.677600,-1.535000,21.411900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,24.968000>}
box{<0,0,-0.304800><1.295600,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.677600,-1.535000,24.968000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,38.833000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,37.668000>}
box{<0,0,-0.304800><1.165000,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.677600,-1.535000,37.668000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,39.398900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,38.833000>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.677600,-1.535000,38.833000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.677600,-1.535000,39.398900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.894100,-1.535000,39.921700>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-67.500302,0> translate<36.677600,-1.535000,39.398900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.804300,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.015600,-1.535000,45.720000>}
box{<0,0,-0.304800><10.211300,0.035000,0.304800> rotate<0,0.000000,0> translate<36.804300,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.894100,-1.535000,39.921700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.564200,-1.535000,41.591800>}
box{<0,0,-0.304800><2.361878,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.894100,-1.535000,39.921700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.906000,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,43.281600>}
box{<0,0,-0.304800><9.931600,0.035000,0.304800> rotate<0,0.000000,0> translate<36.906000,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.012700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.074900,-1.535000,29.260800>}
box{<0,0,-0.304800><9.062200,0.035000,0.304800> rotate<0,0.000000,0> translate<37.012700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.286500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.390000,-1.535000,6.670400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<37.134800,-1.535000,7.286500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.953400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.286500>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.134800,-1.535000,7.286500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.134800,-1.535000,7.953400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.390000,-1.535000,8.569500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<37.134800,-1.535000,7.953400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.165200,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.817000,-1.535000,29.108300>}
box{<0,0,-0.304800><0.651800,0.035000,0.304800> rotate<0,0.000000,0> translate<37.165200,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,43.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<37.337900,-1.535000,45.186400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,43.891200>}
box{<0,0,-0.304800><9.144100,0.035000,0.304800> rotate<0,0.000000,0> translate<37.337900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,44.500800>}
box{<0,0,-0.304800><9.144100,0.035000,0.304800> rotate<0,0.000000,0> translate<37.337900,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.337900,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,45.110400>}
box{<0,0,-0.304800><9.144100,0.035000,0.304800> rotate<0,0.000000,0> translate<37.337900,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.363500,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.836400,-1.535000,18.542000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<37.363500,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.363500,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.836400,-1.535000,34.798000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<37.363500,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.390000,-1.535000,6.670400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.861600,-1.535000,6.198800>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<37.390000,-1.535000,6.670400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.390000,-1.535000,8.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.861600,-1.535000,9.041100>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.390000,-1.535000,8.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.817000,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.382900,-1.535000,29.108300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<37.817000,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.861600,-1.535000,6.198800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,5.943600>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<37.861600,-1.535000,6.198800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.861600,-1.535000,9.041100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,9.296300>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<37.861600,-1.535000,9.041100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.864500,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,11.023600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<37.864500,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.864500,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,14.376300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<37.864500,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.382900,-1.535000,29.108300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.202900,-1.535000,29.108300>}
box{<0,0,-0.304800><7.820000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.382900,-1.535000,29.108300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,5.943600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<38.477700,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,9.296300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<38.477700,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,11.023600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<38.477700,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.477700,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,14.376300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<38.477700,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.564200,-1.535000,41.591800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.087000,-1.535000,41.808300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<38.564200,-1.535000,41.591800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.836400,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,19.583500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.836400,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.836400,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,35.839500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.836400,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.087000,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.652900,-1.535000,41.808300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.087000,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.192000,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,18.897600>}
box{<0,0,-0.304800><34.087200,0.035000,0.304800> rotate<0,0.000000,0> translate<39.192000,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.395200,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.356800>}
box{<0,0,-0.304800><1.295600,0.035000,0.304800> rotate<0,0.000000,0> translate<39.395200,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,21.411900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,22.783900>}
box{<0,0,-0.304800><1.372000,0.035000,0.304800> rotate<0,90.000000,0> translate<39.522300,-1.535000,22.783900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,21.411900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,21.056400>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<39.522300,-1.535000,21.411900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,21.945600>}
box{<0,0,-0.304800><33.756900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.876300,-1.535000,22.555200>}
box{<0,0,-0.304800><11.354000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,22.783900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,23.139500>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.522300,-1.535000,22.783900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,24.968000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,26.263600>}
box{<0,0,-0.304800><1.295600,0.035000,0.304800> rotate<0,90.000000,0> translate<39.522300,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,24.968000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,24.612400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<39.522300,-1.535000,24.968000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,24.993600>}
box{<0,0,-0.304800><6.299300,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.864600,-1.535000,25.603200>}
box{<0,0,-0.304800><6.342300,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.152100,-1.535000,26.212800>}
box{<0,0,-0.304800><6.629800,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,26.263600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.202900,-1.535000,26.263600>}
box{<0,0,-0.304800><6.680600,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,26.263600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,37.668000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,38.526700>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,90.000000,0> translate<39.522300,-1.535000,38.526700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,37.668000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,37.312400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<39.522300,-1.535000,37.668000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,37.795200>}
box{<0,0,-0.304800><16.665100,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,38.404800>}
box{<0,0,-0.304800><16.665100,0.035000,0.304800> rotate<0,0.000000,0> translate<39.522300,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.522300,-1.535000,38.526700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.959200,-1.535000,38.963600>}
box{<0,0,-0.304800><0.617870,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.522300,-1.535000,38.526700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.598300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.091900,-1.535000,21.336000>}
box{<0,0,-0.304800><10.493600,0.035000,0.304800> rotate<0,0.000000,0> translate<39.598300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.652900,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.817900,-1.535000,41.808300>}
box{<0,0,-0.304800><1.165000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.652900,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.801600,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.888600,-1.535000,19.507200>}
box{<0,0,-0.304800><10.087000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.801600,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,19.583500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,21.056400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<39.877900,-1.535000,21.056400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.116800>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.726400>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,23.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,24.612400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<39.877900,-1.535000,24.612400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,-1.535000,23.164800>}
box{<0,0,-0.304800><10.414100,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.456700,-1.535000,23.774400>}
box{<0,0,-0.304800><6.578800,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.990700,-1.535000,24.384000>}
box{<0,0,-0.304800><6.112800,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,35.839500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,37.312400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<39.877900,-1.535000,37.312400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.846300,-1.535000,35.966400>}
box{<0,0,-0.304800><0.968400,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.015600,-1.535000,36.576000>}
box{<0,0,-0.304800><7.137700,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.877900,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.851700,-1.535000,37.185600>}
box{<0,0,-0.304800><10.973800,0.035000,0.304800> rotate<0,0.000000,0> translate<39.877900,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.959200,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.817900,-1.535000,38.963600>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<39.959200,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.875400,-1.535000,6.197600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<40.262200,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.875400,-1.535000,9.042300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<40.262200,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.878300,-1.535000,11.278800>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<40.262200,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.262200,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.878300,-1.535000,14.121100>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<40.262200,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.629900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.459600,-1.535000,9.144000>}
box{<0,0,-0.304800><2.829700,0.035000,0.304800> rotate<0,0.000000,0> translate<40.629900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.630100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.459500,-1.535000,6.096000>}
box{<0,0,-0.304800><2.829400,0.035000,0.304800> rotate<0,0.000000,0> translate<40.630100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,34.801000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.405000,-1.535000,34.086800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<40.690800,-1.535000,34.801000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.305400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,34.801000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<40.690800,-1.535000,34.801000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.305400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.908900,-1.535000,35.305400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<40.690800,-1.535000,35.305400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.306400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.908900,-1.535000,35.306400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<40.690800,-1.535000,35.306400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.810900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.306400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<40.690800,-1.535000,35.306400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690800,-1.535000,35.810900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.405000,-1.535000,36.525100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.690800,-1.535000,35.810900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.817900,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173500,-1.535000,38.608000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<40.817900,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.817900,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173500,-1.535000,42.163900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.817900,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.875400,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.357900,-1.535000,6.197600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<40.875400,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.875400,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.357900,-1.535000,9.042300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<40.875400,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.878300,-1.535000,11.278800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.349900,-1.535000,11.750400>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.878300,-1.535000,11.278800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.878300,-1.535000,14.121100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.349900,-1.535000,13.649500>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<40.878300,-1.535000,14.121100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.978600,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.921300,-1.535000,14.020800>}
box{<0,0,-0.304800><6.942700,0.035000,0.304800> rotate<0,0.000000,0> translate<40.978600,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.646400,-1.535000,38.608000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<41.173500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173500,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.646400,-1.535000,42.163900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<41.173500,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.843400,-1.535000,11.582400>}
box{<0,0,-0.304800><2.661500,0.035000,0.304800> rotate<0,0.000000,0> translate<41.181900,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.349900,-1.535000,11.750400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605100,-1.535000,12.366500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<41.349900,-1.535000,11.750400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.349900,-1.535000,13.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605100,-1.535000,13.033400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<41.349900,-1.535000,13.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.405000,-1.535000,34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,34.086800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<41.405000,-1.535000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.405000,-1.535000,36.525100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,36.525100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<41.405000,-1.535000,36.525100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.448700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.437100,-1.535000,13.411200>}
box{<0,0,-0.304800><1.988400,0.035000,0.304800> rotate<0,0.000000,0> translate<41.448700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.532800,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.233800,-1.535000,12.192000>}
box{<0,0,-0.304800><1.701000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.532800,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605100,-1.535000,12.366500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605100,-1.535000,13.033400>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,90.000000,0> translate<41.605100,-1.535000,13.033400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605100,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.801600>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<41.605100,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.908900,-1.535000,35.306400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.908900,-1.535000,35.305400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.908900,-1.535000,35.305400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.304900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<41.909400,-1.535000,35.304900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,34.137600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,34.747200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.304900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.304900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,35.304900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.307000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,36.525100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<41.909400,-1.535000,36.525100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.307000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.307000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,35.307000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.356800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.909400,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.966400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.909400,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.414900,-1.535000,34.086800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910400,-1.535000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.304900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,34.086800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.910400,-1.535000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,36.525100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,35.307000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.910400,-1.535000,35.307000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910400,-1.535000,36.525100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.414900,-1.535000,36.525100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910400,-1.535000,36.525100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.911000,-1.535000,35.305400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.911000,-1.535000,35.306400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.911000,-1.535000,35.306400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.911000,-1.535000,35.305400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.305400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<41.911000,-1.535000,35.305400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.911000,-1.535000,35.306400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.306400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<41.911000,-1.535000,35.306400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.414900,-1.535000,34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,34.801000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.414900,-1.535000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.414900,-1.535000,36.525100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.810900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<42.414900,-1.535000,36.525100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.465700,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,34.137600>}
box{<0,0,-0.304800><4.371900,0.035000,0.304800> rotate<0,0.000000,0> translate<42.465700,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.646400,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.002000,-1.535000,38.963600>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.646400,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.646400,-1.535000,42.163900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.002000,-1.535000,41.808300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<42.646400,-1.535000,42.163900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.747900,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,42.062400>}
box{<0,0,-0.304800><4.089700,0.035000,0.304800> rotate<0,0.000000,0> translate<42.747900,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.973600,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,35.966400>}
box{<0,0,-0.304800><3.508400,0.035000,0.304800> rotate<0,0.000000,0> translate<42.973600,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.002000,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.168000,-1.535000,38.963600>}
box{<0,0,-0.304800><4.166000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.002000,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.002000,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,41.808300>}
box{<0,0,-0.304800><3.835600,0.035000,0.304800> rotate<0,0.000000,0> translate<43.002000,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.075300,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,34.747200>}
box{<0,0,-0.304800><3.406700,0.035000,0.304800> rotate<0,0.000000,0> translate<43.075300,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,34.801000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.305400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<43.129100,-1.535000,35.305400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.306400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.810900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<43.129100,-1.535000,35.810900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.129100,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,35.356800>}
box{<0,0,-0.304800><3.352900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.129100,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.945000,-1.535000,11.480800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<43.230800,-1.535000,12.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.195000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<43.230800,-1.535000,12.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.448900,-1.535000,12.699400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<43.230800,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.448900,-1.535000,12.700400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<43.230800,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,13.204900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,12.700400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<43.230800,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.230800,-1.535000,13.204900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.945000,-1.535000,13.919100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.230800,-1.535000,13.204900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.357900,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713500,-1.535000,5.842000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<43.357900,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.357900,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713500,-1.535000,9.397900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.357900,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713500,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.186400,-1.535000,5.842000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.713500,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713500,-1.535000,9.397900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.186400,-1.535000,9.397900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.713500,-1.535000,9.397900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.945000,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,11.480800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<43.945000,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.945000,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,13.919100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<43.945000,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.448900,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.448900,-1.535000,12.699400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.448900,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.698900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<44.449400,-1.535000,12.698900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,11.582400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.192000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.698900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.698900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,12.698900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,13.919100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<44.449400,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.701000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,12.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.801600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.449400,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,13.411200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.449400,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.954900,-1.535000,11.480800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.450400,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.698900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,11.480800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.450400,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,12.701000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.450400,-1.535000,12.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450400,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.954900,-1.535000,13.919100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.450400,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.451000,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.451000,-1.535000,12.700400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.451000,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.451000,-1.535000,12.699400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.699400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<44.451000,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.451000,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.700400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<44.451000,-1.535000,12.700400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.954900,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.195000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.954900,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.954900,-1.535000,13.919100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,13.204900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<44.954900,-1.535000,13.919100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.056500,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.718000,-1.535000,11.582400>}
box{<0,0,-0.304800><2.661500,0.035000,0.304800> rotate<0,0.000000,0> translate<45.056500,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.186400,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.542000,-1.535000,6.197600>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.186400,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.186400,-1.535000,9.397900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.542000,-1.535000,9.042300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<45.186400,-1.535000,9.397900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.440300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.270100,-1.535000,9.144000>}
box{<0,0,-0.304800><2.829800,0.035000,0.304800> rotate<0,0.000000,0> translate<45.440300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.440400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.269700,-1.535000,6.096000>}
box{<0,0,-0.304800><2.829300,0.035000,0.304800> rotate<0,0.000000,0> translate<45.440400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.462800,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.451300,-1.535000,13.411200>}
box{<0,0,-0.304800><1.988500,0.035000,0.304800> rotate<0,0.000000,0> translate<45.462800,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.542000,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.024500,-1.535000,6.197600>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<45.542000,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.542000,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.024500,-1.535000,9.042300>}
box{<0,0,-0.304800><2.482500,0.035000,0.304800> rotate<0,0.000000,0> translate<45.542000,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.666100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.367000,-1.535000,12.192000>}
box{<0,0,-0.304800><1.700900,0.035000,0.304800> rotate<0,0.000000,0> translate<45.666100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.699400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<45.669100,-1.535000,12.699400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.700400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,13.204900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<45.669100,-1.535000,13.204900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.669100,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294800,-1.535000,12.801600>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<45.669100,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,24.792300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,24.138800>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<45.821600,-1.535000,24.792300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,25.499600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,24.792300>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.821600,-1.535000,24.792300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,25.499600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,26.153100>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<45.821600,-1.535000,25.499600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,29.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,29.218800>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<45.821600,-1.535000,29.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,30.579600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,29.872300>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.821600,-1.535000,29.872300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.821600,-1.535000,30.579600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,31.233100>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<45.821600,-1.535000,30.579600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,24.138800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.592400,-1.535000,23.638700>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,44.997030,0> translate<46.092300,-1.535000,24.138800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,26.153100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.202900,-1.535000,26.263600>}
box{<0,0,-0.304800><0.156341,0.035000,0.304800> rotate<0,-44.971118,0> translate<46.092300,-1.535000,26.153100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,29.218800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.202900,-1.535000,29.108300>}
box{<0,0,-0.304800><0.156341,0.035000,0.304800> rotate<0,44.971118,0> translate<46.092300,-1.535000,29.218800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.092300,-1.535000,31.233100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.592400,-1.535000,31.733200>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.092300,-1.535000,31.233100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,34.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,34.214000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<46.482000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,34.569500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.482000,-1.535000,34.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,36.042400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.482000,-1.535000,36.042400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,43.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,43.357900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<46.482000,-1.535000,43.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,45.186400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,43.713500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.482000,-1.535000,43.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.482000,-1.535000,45.186400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,46.227900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.482000,-1.535000,45.186400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.592400,-1.535000,23.638700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.245900,-1.535000,23.368000>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,22.499371,0> translate<46.592400,-1.535000,23.638700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.592400,-1.535000,31.733200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,31.834700>}
box{<0,0,-0.304800><0.265378,0.035000,0.304800> rotate<0,-22.485518,0> translate<46.592400,-1.535000,31.733200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,34.214000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,31.834700>}
box{<0,0,-0.304800><2.379300,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.837600,-1.535000,31.834700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,43.357900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.837600,-1.535000,41.808300>}
box{<0,0,-0.304800><1.549600,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.837600,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.168000,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,38.608000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<47.168000,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.245900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.274000,-1.535000,23.368000>}
box{<0,0,-0.304800><2.028100,0.035000,0.304800> rotate<0,0.000000,0> translate<47.245900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294800,-1.535000,12.366500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.550000,-1.535000,11.750400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<47.294800,-1.535000,12.366500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294800,-1.535000,13.033400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294800,-1.535000,12.366500>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,-90.000000,0> translate<47.294800,-1.535000,12.366500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294800,-1.535000,13.033400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.550000,-1.535000,13.649500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<47.294800,-1.535000,13.033400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,37.083900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<47.523500,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,38.608000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<47.523500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.523500,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,46.227900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<47.523500,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.550000,-1.535000,11.750400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.021600,-1.535000,11.278800>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<47.550000,-1.535000,11.750400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.550000,-1.535000,13.649500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.021600,-1.535000,14.121100>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.550000,-1.535000,13.649500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.021600,-1.535000,11.278800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,11.023600>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<48.021600,-1.535000,11.278800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.021600,-1.535000,14.121100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,14.376300>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<48.021600,-1.535000,14.121100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.024500,-1.535000,6.197600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,5.943600>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,22.498854,0> translate<48.024500,-1.535000,6.197600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.024500,-1.535000,9.042300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,9.296300>}
box{<0,0,-0.304800><0.663725,0.035000,0.304800> rotate<0,-22.498854,0> translate<48.024500,-1.535000,9.042300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,5.943600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<48.637700,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,9.296300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<48.637700,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,11.023600>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<48.637700,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.637700,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,14.376300>}
box{<0,0,-0.304800><1.784500,0.035000,0.304800> rotate<0,0.000000,0> translate<48.637700,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,37.083900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.351900,-1.535000,36.728300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<48.996400,-1.535000,37.083900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.351900,-1.535000,38.963600>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<48.996400,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.996400,-1.535000,46.227900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<48.996400,-1.535000,46.227900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.274000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.927500,-1.535000,23.638700>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-22.499371,0> translate<49.274000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.351900,-1.535000,36.728300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.210700,-1.535000,36.728300>}
box{<0,0,-0.304800><0.858800,0.035000,0.304800> rotate<0,0.000000,0> translate<49.351900,-1.535000,36.728300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.351900,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.269100,-1.535000,38.963600>}
box{<0,0,-0.304800><2.917200,0.035000,0.304800> rotate<0,0.000000,0> translate<49.351900,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.504300,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.677700,-1.535000,45.720000>}
box{<0,0,-0.304800><20.173400,0.035000,0.304800> rotate<0,0.000000,0> translate<49.504300,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,19.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.295000,-1.535000,19.100800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<49.580800,-1.535000,19.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,19.815000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.580800,-1.535000,19.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.798900,-1.535000,20.319400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<49.580800,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.798900,-1.535000,20.320400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<49.580800,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.824900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.320400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.580800,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580800,-1.535000,20.824900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.295000,-1.535000,21.539100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.580800,-1.535000,20.824900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,31.834700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,33.883600>}
box{<0,0,-0.304800><2.048900,0.035000,0.304800> rotate<0,90.000000,0> translate<49.682300,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,31.834700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.927500,-1.535000,31.733200>}
box{<0,0,-0.304800><0.265378,0.035000,0.304800> rotate<0,22.485518,0> translate<49.682300,-1.535000,31.834700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,32.308800>}
box{<0,0,-0.304800><23.596900,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.322500,-1.535000,32.918400>}
box{<0,0,-0.304800><5.640200,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.581300,-1.535000,33.528000>}
box{<0,0,-0.304800><4.899000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.082900,-1.535000,33.883600>}
box{<0,0,-0.304800><1.400600,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,43.357900>}
box{<0,0,-0.304800><1.549600,0.035000,0.304800> rotate<0,90.000000,0> translate<49.682300,-1.535000,43.357900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.341100,-1.535000,41.808300>}
box{<0,0,-0.304800><2.658800,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.688000,-1.535000,42.062400>}
box{<0,0,-0.304800><3.005700,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.581500,-1.535000,42.672000>}
box{<0,0,-0.304800><4.899200,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.323000,-1.535000,43.281600>}
box{<0,0,-0.304800><5.640700,0.035000,0.304800> rotate<0,0.000000,0> translate<49.682300,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.682300,-1.535000,43.357900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,43.713500>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.682300,-1.535000,43.357900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.927500,-1.535000,23.638700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.012400,-1.535000,23.723600>}
box{<0,0,-0.304800><0.120067,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.927500,-1.535000,23.638700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.927500,-1.535000,31.733200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,31.233100>}
box{<0,0,-0.304800><0.707248,0.035000,0.304800> rotate<0,44.997030,0> translate<49.927500,-1.535000,31.733200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.961500,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,31.699200>}
box{<0,0,-0.304800><23.317700,0.035000,0.304800> rotate<0,0.000000,0> translate<49.961500,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.012400,-1.535000,23.723600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,-1.535000,23.723600>}
box{<0,0,-0.304800><0.279600,0.035000,0.304800> rotate<0,0.000000,0> translate<50.012400,-1.535000,23.723600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,43.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,45.186400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<50.037900,-1.535000,45.186400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,43.891200>}
box{<0,0,-0.304800><23.241300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.037900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,44.500800>}
box{<0,0,-0.304800><23.241300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.037900,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.037900,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,45.110400>}
box{<0,0,-0.304800><23.241300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.037900,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.164700,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,28.693100>}
box{<0,0,-0.304800><0.371797,0.035000,0.304800> rotate<0,44.997030,0> translate<50.164700,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.164700,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,29.218800>}
box{<0,0,-0.304800><0.371726,0.035000,0.304800> rotate<0,-44.986132,0> translate<50.164700,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.210700,-1.535000,36.728300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.538200,-1.535000,37.055800>}
box{<0,0,-0.304800><0.463155,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.210700,-1.535000,36.728300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,-1.535000,23.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.333500,-1.535000,22.098000>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<50.292000,-1.535000,23.139500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,-1.535000,23.723600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,-1.535000,23.139500>}
box{<0,0,-0.304800><0.584100,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.292000,-1.535000,23.139500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.295000,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,19.100800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<50.295000,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.295000,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,21.539100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<50.295000,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,5.943600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.038300,-1.535000,6.198800>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-22.498755,0> translate<50.422200,-1.535000,5.943600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,9.296300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.038300,-1.535000,9.041100>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,22.498755,0> translate<50.422200,-1.535000,9.296300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,11.023600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.035300,-1.535000,11.277600>}
box{<0,0,-0.304800><0.663632,0.035000,0.304800> rotate<0,-22.502157,0> translate<50.422200,-1.535000,11.023600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.422200,-1.535000,14.376300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.035300,-1.535000,14.122300>}
box{<0,0,-0.304800><0.663632,0.035000,0.304800> rotate<0,22.502157,0> translate<50.422200,-1.535000,14.376300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,28.693100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,28.039600>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<50.427600,-1.535000,28.693100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,29.218800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,29.872300>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,-67.494689,0> translate<50.427600,-1.535000,29.218800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.427600,-1.535000,31.233100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,30.579600>}
box{<0,0,-0.304800><0.707348,0.035000,0.304800> rotate<0,67.494689,0> translate<50.427600,-1.535000,31.233100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.444900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.887200,-1.535000,29.260800>}
box{<0,0,-0.304800><1.442300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.444900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.445000,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.277600,-1.535000,28.651200>}
box{<0,0,-0.304800><0.832600,0.035000,0.304800> rotate<0,0.000000,0> translate<50.445000,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.487100,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,31.089600>}
box{<0,0,-0.304800><22.792100,0.035000,0.304800> rotate<0,0.000000,0> translate<50.487100,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.538200,-1.535000,37.055800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.061000,-1.535000,37.272300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<50.538200,-1.535000,37.055800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.697500,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.783000,-1.535000,28.041600>}
box{<0,0,-0.304800><0.085500,0.035000,0.304800> rotate<0,0.000000,0> translate<50.697500,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.697500,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.496800,-1.535000,29.870400>}
box{<0,0,-0.304800><1.799300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.697500,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,27.837100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,28.039600>}
box{<0,0,-0.304800><0.202500,0.035000,0.304800> rotate<0,90.000000,0> translate<50.698300,-1.535000,28.039600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,27.837100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.864100,-1.535000,28.237700>}
box{<0,0,-0.304800><0.433555,0.035000,0.304800> rotate<0,-67.511899,0> translate<50.698300,-1.535000,27.837100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,29.872300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,30.579600>}
box{<0,0,-0.304800><0.707300,0.035000,0.304800> rotate<0,90.000000,0> translate<50.698300,-1.535000,30.579600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.698300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.197300,-1.535000,30.480000>}
box{<0,0,-0.304800><2.499000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.698300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.789900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.429100,-1.535000,9.144000>}
box{<0,0,-0.304800><13.639200,0.035000,0.304800> rotate<0,0.000000,0> translate<50.789900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.790100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.275400,-1.535000,6.096000>}
box{<0,0,-0.304800><18.485300,0.035000,0.304800> rotate<0,0.000000,0> translate<50.790100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.798900,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.798900,-1.535000,20.319400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.798900,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.318900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<50.799400,-1.535000,20.318900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,19.507200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.116800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.318900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.318900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,20.318900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,21.539100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<50.799400,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.321000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,20.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.726400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.799400,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,21.336000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.799400,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.304900,-1.535000,19.100800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<50.800400,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.318900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,19.100800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.800400,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,20.321000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.800400,-1.535000,20.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800400,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.304900,-1.535000,21.539100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<50.800400,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.801000,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.801000,-1.535000,20.320400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.801000,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.801000,-1.535000,20.319400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.319400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<50.801000,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.801000,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.320400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<50.801000,-1.535000,20.320400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.864100,-1.535000,28.237700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.264200,-1.535000,28.637800>}
box{<0,0,-0.304800><0.565827,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.864100,-1.535000,28.237700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.035300,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.518000,-1.535000,11.277600>}
box{<0,0,-0.304800><2.482700,0.035000,0.304800> rotate<0,0.000000,0> translate<51.035300,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.035300,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.518000,-1.535000,14.122300>}
box{<0,0,-0.304800><2.482700,0.035000,0.304800> rotate<0,0.000000,0> translate<51.035300,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.038300,-1.535000,6.198800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.509900,-1.535000,6.670400>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.038300,-1.535000,6.198800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.038300,-1.535000,9.041100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.509900,-1.535000,8.569500>}
box{<0,0,-0.304800><0.666943,0.035000,0.304800> rotate<0,44.997030,0> translate<51.038300,-1.535000,9.041100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.061000,-1.535000,37.272300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.626900,-1.535000,37.272300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<51.061000,-1.535000,37.272300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.082900,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.605700,-1.535000,34.100100>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<51.082900,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.264200,-1.535000,28.637800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.042200,-1.535000,30.415800>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.264200,-1.535000,28.637800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.304900,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,19.815000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.304900,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.304900,-1.535000,21.539100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.824900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<51.304900,-1.535000,21.539100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.333500,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.806400,-1.535000,22.098000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<51.333500,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.508000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,21.336000>}
box{<0,0,-0.304800><21.771200,0.035000,0.304800> rotate<0,0.000000,0> translate<51.508000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.509900,-1.535000,6.670400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.286500>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,-67.495305,0> translate<51.509900,-1.535000,6.670400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.509900,-1.535000,8.569500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.953400>}
box{<0,0,-0.304800><0.666863,0.035000,0.304800> rotate<0,67.495305,0> translate<51.509900,-1.535000,8.569500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.524400,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800200,-1.535000,6.705600>}
box{<0,0,-0.304800><2.275800,0.035000,0.304800> rotate<0,0.000000,0> translate<51.524400,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.524500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800300,-1.535000,8.534400>}
box{<0,0,-0.304800><2.275800,0.035000,0.304800> rotate<0,0.000000,0> translate<51.524500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.605700,-1.535000,34.100100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.933200,-1.535000,34.427600>}
box{<0,0,-0.304800><0.463155,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.605700,-1.535000,34.100100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.626900,-1.535000,37.272300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.305200,-1.535000,37.272300>}
box{<0,0,-0.304800><0.678300,0.035000,0.304800> rotate<0,0.000000,0> translate<51.626900,-1.535000,37.272300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.643200,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.687700,-1.535000,34.137600>}
box{<0,0,-0.304800><1.044500,0.035000,0.304800> rotate<0,0.000000,0> translate<51.643200,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.711300,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,19.507200>}
box{<0,0,-0.304800><21.567900,0.035000,0.304800> rotate<0,0.000000,0> translate<51.711300,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.286500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.953400>}
box{<0,0,-0.304800><0.666900,0.035000,0.304800> rotate<0,90.000000,0> translate<51.765100,-1.535000,7.953400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.315200>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<51.765100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.765100,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.924800>}
box{<0,0,-0.304800><1.625700,0.035000,0.304800> rotate<0,0.000000,0> translate<51.765100,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.933200,-1.535000,34.427600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.305200,-1.535000,34.427600>}
box{<0,0,-0.304800><0.372000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.933200,-1.535000,34.427600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,19.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.319400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<52.019100,-1.535000,20.319400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,20.116800>}
box{<0,0,-0.304800><21.260100,0.035000,0.304800> rotate<0,0.000000,0> translate<52.019100,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.320400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.824900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<52.019100,-1.535000,20.824900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.019100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,20.726400>}
box{<0,0,-0.304800><21.260100,0.035000,0.304800> rotate<0,0.000000,0> translate<52.019100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.269100,-1.535000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,38.703100>}
box{<0,0,-0.304800><0.368403,0.035000,0.304800> rotate<0,44.997030,0> translate<52.269100,-1.535000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.305200,-1.535000,34.427600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,34.203100>}
box{<0,0,-0.304800><0.317420,0.035000,0.304800> rotate<0,45.009793,0> translate<52.305200,-1.535000,34.427600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.305200,-1.535000,37.272300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,37.496800>}
box{<0,0,-0.304800><0.317420,0.035000,0.304800> rotate<0,-45.009793,0> translate<52.305200,-1.535000,37.272300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.341100,-1.535000,41.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,41.996800>}
box{<0,0,-0.304800><0.266579,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.341100,-1.535000,41.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,34.203100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,33.907400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<52.529600,-1.535000,34.203100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,37.496800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,37.792500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-22.498031,0> translate<52.529600,-1.535000,37.496800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,38.703100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,38.407400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<52.529600,-1.535000,38.703100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.529600,-1.535000,41.996800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,42.292500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-22.498031,0> translate<52.529600,-1.535000,41.996800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.806400,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,23.139500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.806400,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.042200,-1.535000,30.415800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.565000,-1.535000,30.632300>}
box{<0,0,-0.304800><0.565855,0.035000,0.304800> rotate<0,-22.493758,0> translate<53.042200,-1.535000,30.415800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,33.907400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,33.907400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.243500,-1.535000,33.907400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,37.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,37.792500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.243500,-1.535000,37.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,38.407400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,38.407400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.243500,-1.535000,38.407400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.243500,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,42.292500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.243500,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.263600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,22.555200>}
box{<0,0,-0.304800><20.015600,0.035000,0.304800> rotate<0,0.000000,0> translate<53.263600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.105000,-1.535000,6.400800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<53.390800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.115000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<53.390800,-1.535000,7.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.608900,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<53.390800,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.608900,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<53.390800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,7.620400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<53.390800,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.390800,-1.535000,8.124900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.105000,-1.535000,8.839100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.390800,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,24.967900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,25.428900>}
box{<0,0,-0.304800><0.461000,0.035000,0.304800> rotate<0,90.000000,0> translate<53.492300,-1.535000,25.428900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,24.967900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,24.612400>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<53.492300,-1.535000,24.967900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.163500,-1.535000,24.993600>}
box{<0,0,-0.304800><10.671200,0.035000,0.304800> rotate<0,0.000000,0> translate<53.492300,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,25.428900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,26.842700>}
box{<0,0,-0.304800><1.413800,0.035000,0.304800> rotate<0,90.000000,0> translate<53.492300,-1.535000,26.842700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,25.603200>}
box{<0,0,-0.304800><19.786900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.492300,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,26.212800>}
box{<0,0,-0.304800><19.786900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.492300,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,26.822400>}
box{<0,0,-0.304800><19.786900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.492300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.492300,-1.535000,26.842700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.437200,-1.535000,27.787600>}
box{<0,0,-0.304800><1.336290,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.492300,-1.535000,26.842700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.518000,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.873500,-1.535000,10.922000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<53.518000,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.518000,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.873500,-1.535000,14.477900>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<53.518000,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.565000,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.130900,-1.535000,30.632300>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.565000,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,23.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,24.612400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<53.847900,-1.535000,24.612400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.757000,-1.535000,23.164800>}
box{<0,0,-0.304800><9.909100,0.035000,0.304800> rotate<0,0.000000,0> translate<53.847900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.774400>}
box{<0,0,-0.304800><9.702900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.847900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.847900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.553900,-1.535000,24.384000>}
box{<0,0,-0.304800><9.706000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.847900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.873500,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.346400,-1.535000,10.922000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.873500,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.873500,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.346400,-1.535000,14.477900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<53.873500,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,33.907400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.373800,-1.535000,34.055500>}
box{<0,0,-0.304800><0.386870,0.035000,0.304800> rotate<0,-22.506734,0> translate<54.016400,-1.535000,33.907400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,37.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.730300,-1.535000,37.496800>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<54.016400,-1.535000,37.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,38.407400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.730300,-1.535000,38.703100>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-22.498031,0> translate<54.016400,-1.535000,38.407400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.016400,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.373800,-1.535000,42.144400>}
box{<0,0,-0.304800><0.386870,0.035000,0.304800> rotate<0,22.506734,0> translate<54.016400,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.081600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.143500,-1.535000,27.432000>}
box{<0,0,-0.304800><1.061900,0.035000,0.304800> rotate<0,0.000000,0> translate<54.081600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.105000,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<54.105000,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.105000,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<54.105000,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.130900,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787900,-1.535000,30.632300>}
box{<0,0,-0.304800><0.657000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.130900,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.373800,-1.535000,34.055500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.384000,-1.535000,33.990800>}
box{<0,0,-0.304800><0.065499,0.035000,0.304800> rotate<0,81.035668,0> translate<54.373800,-1.535000,34.055500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.373800,-1.535000,42.144400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.384000,-1.535000,42.209100>}
box{<0,0,-0.304800><0.065499,0.035000,0.304800> rotate<0,-81.035668,0> translate<54.373800,-1.535000,42.144400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.384000,-1.535000,33.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.458600,-1.535000,33.761200>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,71.995601,0> translate<54.384000,-1.535000,33.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.384000,-1.535000,42.209100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.458600,-1.535000,42.438700>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-71.995601,0> translate<54.384000,-1.535000,42.209100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.437200,-1.535000,27.787600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787900,-1.535000,27.787600>}
box{<0,0,-0.304800><0.350700,0.035000,0.304800> rotate<0,0.000000,0> translate<54.437200,-1.535000,27.787600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.458600,-1.535000,33.761200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.568200,-1.535000,33.546100>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,62.995615,0> translate<54.458600,-1.535000,33.761200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.458600,-1.535000,42.438700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.568200,-1.535000,42.653800>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-62.995615,0> translate<54.458600,-1.535000,42.438700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.568200,-1.535000,33.546100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.710100,-1.535000,33.350800>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,53.995237,0> translate<54.568200,-1.535000,33.546100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.568200,-1.535000,42.653800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.710100,-1.535000,42.849100>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-53.995237,0> translate<54.568200,-1.535000,42.653800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.608900,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.608900,-1.535000,7.619400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.608900,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.618900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<54.609400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,6.705600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.315200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.618900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,7.618900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,8.839100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<54.609400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.621000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.621000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.924800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.609400,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,8.534400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.609400,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.114900,-1.535000,6.400800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<54.610400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.618900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,6.400800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.610400,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,7.621000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.610400,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610400,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.114900,-1.535000,8.839100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<54.610400,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.611000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.611000,-1.535000,7.620400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<54.611000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.611000,-1.535000,7.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.619400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<54.611000,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.611000,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.620400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<54.611000,-1.535000,7.620400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.710100,-1.535000,33.350800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.880800,-1.535000,33.180100>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,44.997030,0> translate<54.710100,-1.535000,33.350800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.710100,-1.535000,42.849100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.880800,-1.535000,43.019800>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,-44.997030,0> translate<54.710100,-1.535000,42.849100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.730300,-1.535000,37.496800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.276800,-1.535000,36.950300>}
box{<0,0,-0.304800><0.772868,0.035000,0.304800> rotate<0,44.997030,0> translate<54.730300,-1.535000,37.496800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.730300,-1.535000,38.703100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.276800,-1.535000,39.249600>}
box{<0,0,-0.304800><0.772868,0.035000,0.304800> rotate<0,-44.997030,0> translate<54.730300,-1.535000,38.703100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787900,-1.535000,27.787600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.143500,-1.535000,27.432000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<54.787900,-1.535000,27.787600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787900,-1.535000,30.632300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.143500,-1.535000,30.987900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<54.787900,-1.535000,30.632300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.880800,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.076100,-1.535000,33.038200>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,35.998823,0> translate<54.880800,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.880800,-1.535000,43.019800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.076100,-1.535000,43.161700>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-35.998823,0> translate<54.880800,-1.535000,43.019800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.041500,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.406000,-1.535000,37.185600>}
box{<0,0,-0.304800><1.364500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.041500,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.041600,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.406100,-1.535000,39.014400>}
box{<0,0,-0.304800><1.364500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.041600,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.076100,-1.535000,33.038200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.291200,-1.535000,32.928600>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,26.998446,0> translate<55.076100,-1.535000,33.038200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.076100,-1.535000,43.161700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.291200,-1.535000,43.271300>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-26.998446,0> translate<55.076100,-1.535000,43.161700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.114900,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.115000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.114900,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.114900,-1.535000,8.839100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,8.124900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<55.114900,-1.535000,8.839100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.143500,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.616400,-1.535000,27.432000>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.143500,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.143500,-1.535000,30.987900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.616400,-1.535000,30.987900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.143500,-1.535000,30.987900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.276800,-1.535000,36.950300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,36.236400>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<55.276800,-1.535000,36.950300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.276800,-1.535000,39.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,39.963500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<55.276800,-1.535000,39.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.291200,-1.535000,32.928600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.520800,-1.535000,32.854000>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,17.998459,0> translate<55.291200,-1.535000,32.928600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.291200,-1.535000,43.271300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.520800,-1.535000,43.345900>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-17.998459,0> translate<55.291200,-1.535000,43.271300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.346400,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.701900,-1.535000,11.277600>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<55.346400,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.346400,-1.535000,14.477900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.701900,-1.535000,14.122300>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<55.346400,-1.535000,14.477900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.397100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.236000,-1.535000,10.972800>}
box{<0,0,-0.304800><8.838900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.397100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.419600,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,8.534400>}
box{<0,0,-0.304800><17.859600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.419600,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.419700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.641800,-1.535000,6.705600>}
box{<0,0,-0.304800><15.222100,0.035000,0.304800> rotate<0,0.000000,0> translate<55.419700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.431800,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.328000,-1.535000,39.624000>}
box{<0,0,-0.304800><0.896200,0.035000,0.304800> rotate<0,0.000000,0> translate<55.431800,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.431900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.906700,-1.535000,36.576000>}
box{<0,0,-0.304800><1.474800,0.035000,0.304800> rotate<0,0.000000,0> translate<55.431900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.520800,-1.535000,32.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,32.816200>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,9.009053,0> translate<55.520800,-1.535000,32.854000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.520800,-1.535000,43.345900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,43.383700>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,-9.009053,0> translate<55.520800,-1.535000,43.345900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,35.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,36.236400>}
box{<0,0,-0.304800><0.382400,0.035000,0.304800> rotate<0,90.000000,0> translate<55.572500,-1.535000,36.236400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,35.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,35.883700>}
box{<0,0,-0.304800><0.189048,0.035000,0.304800> rotate<0,-9.038206,0> translate<55.572500,-1.535000,35.854000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.747400,-1.535000,35.966400>}
box{<0,0,-0.304800><1.174900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.572500,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,39.963500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,40.345900>}
box{<0,0,-0.304800><0.382400,0.035000,0.304800> rotate<0,90.000000,0> translate<55.572500,-1.535000,40.345900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,40.233600>}
box{<0,0,-0.304800><0.614900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.572500,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.572500,-1.535000,40.345900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,40.316200>}
box{<0,0,-0.304800><0.189048,0.035000,0.304800> rotate<0,9.038206,0> translate<55.572500,-1.535000,40.345900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.701900,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.407000,-1.535000,11.277600>}
box{<0,0,-0.304800><3.705100,0.035000,0.304800> rotate<0,0.000000,0> translate<55.701900,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.701900,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,14.122300>}
box{<0,0,-0.304800><2.565700,0.035000,0.304800> rotate<0,0.000000,0> translate<55.701900,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,32.816200>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<55.759200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,35.883700>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<55.759200,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,40.316200>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<55.759200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.759200,-1.535000,43.383700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,43.383700>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,0.000000,0> translate<55.759200,-1.535000,43.383700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.619400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<55.829100,-1.535000,7.619400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,7.315200>}
box{<0,0,-0.304800><17.450100,0.035000,0.304800> rotate<0,0.000000,0> translate<55.829100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.620400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,8.124900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<55.829100,-1.535000,8.124900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.829100,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,7.924800>}
box{<0,0,-0.304800><17.450100,0.035000,0.304800> rotate<0,0.000000,0> translate<55.829100,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.329100>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<55.859600,-1.535000,34.329100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,32.918400>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,33.528000>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.137600>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.329100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.329100>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,34.329100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,35.883700>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<55.859600,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.370800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,34.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.747200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,35.356800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,41.829100>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<55.859600,-1.535000,41.829100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,40.843200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,41.452800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,41.829100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,41.829100>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,41.829100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,41.870800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,43.383700>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<55.859600,-1.535000,43.383700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,41.870800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,41.870800>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,41.870800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,42.062400>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,42.672000>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.859600,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,43.281600>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,0.000000,0> translate<55.859600,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,32.816200>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.329100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,32.816200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.900200,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,34.370800>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.900200,-1.535000,34.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,35.883700>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900200,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,40.316200>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,41.829100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,40.316200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.900200,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,43.383700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,41.870800>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.900200,-1.535000,41.870800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900200,-1.535000,43.383700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,43.383700>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900200,-1.535000,43.383700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900800,-1.535000,34.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900800,-1.535000,34.370200>}
box{<0,0,-0.304800><0.040600,0.035000,0.304800> rotate<0,90.000000,0> translate<55.900800,-1.535000,34.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900800,-1.535000,34.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.329600>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900800,-1.535000,34.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.900800,-1.535000,34.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.370200>}
box{<0,0,-0.304800><1.512900,0.035000,0.304800> rotate<0,0.000000,0> translate<55.900800,-1.535000,34.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,32.816200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,32.854000>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,-9.009053,0> translate<56.000700,-1.535000,32.816200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,35.883700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,35.845900>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,9.009053,0> translate<56.000700,-1.535000,35.883700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,40.316200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,40.345900>}
box{<0,0,-0.304800><0.189048,0.035000,0.304800> rotate<0,-9.038206,0> translate<56.000700,-1.535000,40.316200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.000700,-1.535000,43.383700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,43.345900>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,9.009053,0> translate<56.000700,-1.535000,43.383700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,37.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,36.999600>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<56.187400,-1.535000,37.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,38.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,37.713500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.187400,-1.535000,37.713500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,38.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,39.200300>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<56.187400,-1.535000,38.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,39.963500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,39.249600>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,67.496029,0> translate<56.187400,-1.535000,39.963500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,40.345900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.187400,-1.535000,39.963500>}
box{<0,0,-0.304800><0.382400,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.187400,-1.535000,39.963500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,32.854000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,32.928600>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-17.998459,0> translate<56.239100,-1.535000,32.854000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,35.845900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,35.771300>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,17.998459,0> translate<56.239100,-1.535000,35.845900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.239100,-1.535000,43.345900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,43.271300>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,17.998459,0> translate<56.239100,-1.535000,43.345900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.437000,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,43.281600>}
box{<0,0,-0.304800><16.842200,0.035000,0.304800> rotate<0,0.000000,0> translate<56.437000,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.437300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,32.918400>}
box{<0,0,-0.304800><16.841900,0.035000,0.304800> rotate<0,0.000000,0> translate<56.437300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,32.928600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,33.038200>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-26.998446,0> translate<56.468700,-1.535000,32.928600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,35.771300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,35.661700>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,26.998446,0> translate<56.468700,-1.535000,35.771300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.468700,-1.535000,43.271300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,43.161700>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,26.998446,0> translate<56.468700,-1.535000,43.271300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,36.999600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.933400,-1.535000,36.549400>}
box{<0,0,-0.304800><0.636750,0.035000,0.304800> rotate<0,44.990668,0> translate<56.483100,-1.535000,36.999600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,39.200300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.507800,-1.535000,39.224900>}
box{<0,0,-0.304800><0.034860,0.035000,0.304800> rotate<0,-44.880819,0> translate<56.483100,-1.535000,39.200300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.483100,-1.535000,39.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.507800,-1.535000,39.224900>}
box{<0,0,-0.304800><0.034931,0.035000,0.304800> rotate<0,44.997030,0> translate<56.483100,-1.535000,39.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.616400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,28.473500>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<56.616400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.616400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,27.432000>}
box{<0,0,-0.304800><16.662800,0.035000,0.304800> rotate<0,0.000000,0> translate<56.616400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.616400,-1.535000,30.987900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,29.946400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<56.616400,-1.535000,30.987900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,33.038200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.879100,-1.535000,33.180100>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-35.998823,0> translate<56.683800,-1.535000,33.038200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,35.661700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.768600,-1.535000,35.600000>}
box{<0,0,-0.304800><0.104871,0.035000,0.304800> rotate<0,36.037045,0> translate<56.683800,-1.535000,35.661700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.683800,-1.535000,43.161700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.879100,-1.535000,43.019800>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,35.998823,0> translate<56.683800,-1.535000,43.161700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.741000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.768600,-1.535000,35.600000>}
box{<0,0,-0.304800><0.142768,0.035000,0.304800> rotate<0,80.967784,0> translate<56.746200,-1.535000,35.741000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.741000>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.746200,-1.535000,35.741000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.128900,-1.535000,35.849400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<56.746200,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.128900,-1.535000,35.850400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<56.746200,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.958900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.850400>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.746200,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.746200,-1.535000,35.958900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.780300,-1.535000,36.174000>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-80.986468,0> translate<56.746200,-1.535000,35.958900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.780300,-1.535000,36.174000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.847600,-1.535000,36.381200>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-72.001091,0> translate<56.780300,-1.535000,36.174000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.847600,-1.535000,36.381200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.933400,-1.535000,36.549400>}
box{<0,0,-0.304800><0.188820,0.035000,0.304800> rotate<0,-62.969397,0> translate<56.847600,-1.535000,36.381200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.879100,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.049800,-1.535000,33.350800>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,-44.997030,0> translate<56.879100,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.879100,-1.535000,43.019800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.049800,-1.535000,42.849100>}
box{<0,0,-0.304800><0.241406,0.035000,0.304800> rotate<0,44.997030,0> translate<56.879100,-1.535000,43.019800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.049800,-1.535000,33.350800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.191700,-1.535000,33.546100>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,-53.995237,0> translate<57.049800,-1.535000,33.350800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.049800,-1.535000,42.849100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.191700,-1.535000,42.653800>}
box{<0,0,-0.304800><0.241408,0.035000,0.304800> rotate<0,53.995237,0> translate<57.049800,-1.535000,42.849100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.124300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,30.480000>}
box{<0,0,-0.304800><16.154900,0.035000,0.304800> rotate<0,0.000000,0> translate<57.124300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.178500,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,33.528000>}
box{<0,0,-0.304800><16.100700,0.035000,0.304800> rotate<0,0.000000,0> translate<57.178500,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.178500,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,42.672000>}
box{<0,0,-0.304800><16.100700,0.035000,0.304800> rotate<0,0.000000,0> translate<57.178500,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.191700,-1.535000,33.546100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.301300,-1.535000,33.761200>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,-62.995615,0> translate<57.191700,-1.535000,33.546100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.191700,-1.535000,42.653800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.301300,-1.535000,42.438700>}
box{<0,0,-0.304800><0.241413,0.035000,0.304800> rotate<0,62.995615,0> translate<57.191700,-1.535000,42.653800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.226000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.404200,-1.535000,28.041600>}
box{<0,0,-0.304800><3.178200,0.035000,0.304800> rotate<0,0.000000,0> translate<57.226000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.301300,-1.535000,33.761200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.375900,-1.535000,33.990800>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,-71.995601,0> translate<57.301300,-1.535000,33.761200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.301300,-1.535000,42.438700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.375900,-1.535000,42.209100>}
box{<0,0,-0.304800><0.241415,0.035000,0.304800> rotate<0,71.995601,0> translate<57.301300,-1.535000,42.438700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.375900,-1.535000,33.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.229200>}
box{<0,0,-0.304800><0.241378,0.035000,0.304800> rotate<0,-80.985008,0> translate<57.375900,-1.535000,33.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.375900,-1.535000,42.209100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.386100,-1.535000,42.144400>}
box{<0,0,-0.304800><0.065499,0.035000,0.304800> rotate<0,81.035668,0> translate<57.375900,-1.535000,42.209100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.379700,-1.535000,34.684700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404700,-1.535000,34.666500>}
box{<0,0,-0.304800><0.030923,0.035000,0.304800> rotate<0,36.052239,0> translate<57.379700,-1.535000,34.684700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.379700,-1.535000,34.684700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.470700>}
box{<0,0,-0.304800><0.216684,0.035000,0.304800> rotate<0,80.967043,0> translate<57.379700,-1.535000,34.684700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.386100,-1.535000,42.144400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.743500,-1.535000,42.292500>}
box{<0,0,-0.304800><0.386870,0.035000,0.304800> rotate<0,-22.506734,0> translate<57.386100,-1.535000,42.144400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.399100,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,34.137600>}
box{<0,0,-0.304800><15.880100,0.035000,0.304800> rotate<0,0.000000,0> translate<57.399100,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404700,-1.535000,34.666500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.598700,-1.535000,34.567600>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,27.010423,0> translate<57.404700,-1.535000,34.666500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.229200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.329600>}
box{<0,0,-0.304800><0.100400,0.035000,0.304800> rotate<0,90.000000,0> translate<57.413700,-1.535000,34.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.413700,-1.535000,34.470700>}
box{<0,0,-0.304800><0.100500,0.035000,0.304800> rotate<0,90.000000,0> translate<57.413700,-1.535000,34.470700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.598700,-1.535000,34.567600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.805900,-1.535000,34.500300>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,17.992969,0> translate<57.598700,-1.535000,34.567600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,28.473500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,29.946400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<57.657900,-1.535000,29.946400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.794600,-1.535000,28.651200>}
box{<0,0,-0.304800><2.136700,0.035000,0.304800> rotate<0,0.000000,0> translate<57.657900,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.260800>}
box{<0,0,-0.304800><2.082900,0.035000,0.304800> rotate<0,0.000000,0> translate<57.657900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.657900,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.896300,-1.535000,29.870400>}
box{<0,0,-0.304800><2.238400,0.035000,0.304800> rotate<0,0.000000,0> translate<57.657900,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.743500,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.516400,-1.535000,42.292500>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,0.000000,0> translate<57.743500,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.805900,-1.535000,34.500300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.021000,-1.535000,34.466200>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,9.007592,0> translate<57.805900,-1.535000,34.500300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,15.773500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,15.418000>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,44.988973,0> translate<57.912000,-1.535000,15.773500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,17.246400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,15.773500>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.912000,-1.535000,15.773500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,17.246400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.953500,-1.535000,18.287900>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,-44.997030,0> translate<57.912000,-1.535000,17.246400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.021000,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,34.466200>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,0.000000,0> translate<58.021000,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.128900,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.128900,-1.535000,35.849400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.128900,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,35.848900>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,90.000000,0> translate<58.129400,-1.535000,35.848900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,34.747200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.129400,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,35.356800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.129400,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.129400,-1.535000,35.848900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,35.848900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.129400,-1.535000,35.848900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.238900,-1.535000,34.466200>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,0.000000,0> translate<58.130400,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,35.848900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.130400,-1.535000,34.466200>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.130400,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.131000,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.131000,-1.535000,35.850400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<58.131000,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.131000,-1.535000,35.849400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.849400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<58.131000,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.131000,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.850400>}
box{<0,0,-0.304800><1.382700,0.035000,0.304800> rotate<0,0.000000,0> translate<58.131000,-1.535000,35.850400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.238900,-1.535000,34.466200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.454000,-1.535000,34.500300>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-9.007592,0> translate<58.238900,-1.535000,34.466200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,15.418000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.267600,-1.535000,14.122300>}
box{<0,0,-0.304800><1.295700,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.267600,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.454000,-1.535000,34.500300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.661200,-1.535000,34.567600>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-17.992969,0> translate<58.454000,-1.535000,34.500300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185000,-1.535000,2.590800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<58.470800,-1.535000,3.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.305000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.470800,-1.535000,3.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.688900,-1.535000,3.809400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<58.470800,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.688900,-1.535000,3.810400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<58.470800,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,4.314900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,3.810400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.470800,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.470800,-1.535000,4.314900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185000,-1.535000,5.029100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<58.470800,-1.535000,4.314900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.516400,-1.535000,42.292500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.230300,-1.535000,41.996800>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,22.498031,0> translate<58.516400,-1.535000,42.292500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.661200,-1.535000,34.567600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.855200,-1.535000,34.666500>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,-27.010423,0> translate<58.661200,-1.535000,34.567600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.855200,-1.535000,34.666500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.031400,-1.535000,34.794500>}
box{<0,0,-0.304800><0.217785,0.035000,0.304800> rotate<0,-35.994050,0> translate<58.855200,-1.535000,34.666500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.953500,-1.535000,18.287900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.426400,-1.535000,18.287900>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,0.000000,0> translate<58.953500,-1.535000,18.287900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.966200,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,34.747200>}
box{<0,0,-0.304800><14.313000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.966200,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.031400,-1.535000,34.794500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185400,-1.535000,34.948500>}
box{<0,0,-0.304800><0.217789,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.031400,-1.535000,34.794500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.072000,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.413700,-1.535000,42.062400>}
box{<0,0,-0.304800><5.341700,0.035000,0.304800> rotate<0,0.000000,0> translate<59.072000,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185000,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,2.590800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<59.185000,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185000,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,5.029100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<59.185000,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.185400,-1.535000,34.948500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.313400,-1.535000,35.124700>}
box{<0,0,-0.304800><0.217785,0.035000,0.304800> rotate<0,-54.000010,0> translate<59.185400,-1.535000,34.948500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.230300,-1.535000,41.996800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.454800,-1.535000,41.772300>}
box{<0,0,-0.304800><0.317491,0.035000,0.304800> rotate<0,44.997030,0> translate<59.230300,-1.535000,41.996800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.313400,-1.535000,35.124700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.412300,-1.535000,35.318700>}
box{<0,0,-0.304800><0.217755,0.035000,0.304800> rotate<0,-62.983637,0> translate<59.313400,-1.535000,35.124700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.326500,-1.535000,36.549400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.412300,-1.535000,36.381200>}
box{<0,0,-0.304800><0.188820,0.035000,0.304800> rotate<0,62.969397,0> translate<59.326500,-1.535000,36.549400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.326500,-1.535000,36.549400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.776800,-1.535000,36.999600>}
box{<0,0,-0.304800><0.636750,0.035000,0.304800> rotate<0,-44.990668,0> translate<59.326500,-1.535000,36.549400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.353100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.912300,-1.535000,36.576000>}
box{<0,0,-0.304800><5.559200,0.035000,0.304800> rotate<0,0.000000,0> translate<59.353100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.407000,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.972900,-1.535000,11.277600>}
box{<0,0,-0.304800><0.565900,0.035000,0.304800> rotate<0,0.000000,0> translate<59.407000,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.412300,-1.535000,35.318700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.479600,-1.535000,35.525900>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,-72.001091,0> translate<59.412300,-1.535000,35.318700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.412300,-1.535000,36.381200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.479600,-1.535000,36.174000>}
box{<0,0,-0.304800><0.217856,0.035000,0.304800> rotate<0,72.001091,0> translate<59.412300,-1.535000,36.381200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.424600,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,35.356800>}
box{<0,0,-0.304800><13.854600,0.035000,0.304800> rotate<0,0.000000,0> translate<59.424600,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.454800,-1.535000,41.772300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.006100,-1.535000,41.772300>}
box{<0,0,-0.304800><4.551300,0.035000,0.304800> rotate<0,0.000000,0> translate<59.454800,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.479600,-1.535000,35.525900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.741000>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,-80.986468,0> translate<59.479600,-1.535000,35.525900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.479600,-1.535000,36.174000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.958900>}
box{<0,0,-0.304800><0.217786,0.035000,0.304800> rotate<0,80.986468,0> translate<59.479600,-1.535000,36.174000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.512600,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,35.966400>}
box{<0,0,-0.304800><13.766600,0.035000,0.304800> rotate<0,0.000000,0> translate<59.512600,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.741000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.849400>}
box{<0,0,-0.304800><0.108400,0.035000,0.304800> rotate<0,90.000000,0> translate<59.513700,-1.535000,35.849400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.850400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.513700,-1.535000,35.958900>}
box{<0,0,-0.304800><0.108500,0.035000,0.304800> rotate<0,90.000000,0> translate<59.513700,-1.535000,35.958900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.688900,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.688900,-1.535000,3.809400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.688900,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.808900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<59.689400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.048000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.657600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.808900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,5.029100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<59.689400,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.811000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,4.267200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.689400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,4.876800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.689400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.194900,-1.535000,2.590800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<59.690400,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,2.590800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.690400,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,3.811000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.690400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690400,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.194900,-1.535000,5.029100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<59.690400,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.691000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.691000,-1.535000,3.810400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<59.691000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.691000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.809400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<59.691000,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.691000,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.810400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<59.691000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,28.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.455000,-1.535000,27.990800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<59.740800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,28.705000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.740800,-1.535000,28.705000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.958900,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<59.740800,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.958900,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<59.740800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.210400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.740800,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.740800,-1.535000,29.714900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.455000,-1.535000,30.429100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.740800,-1.535000,29.714900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.776800,-1.535000,36.999600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,37.713500>}
box{<0,0,-0.304800><0.772717,0.035000,0.304800> rotate<0,-67.496029,0> translate<59.776800,-1.535000,36.999600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.853800,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.132000,-1.535000,37.185600>}
box{<0,0,-0.304800><4.278200,0.035000,0.304800> rotate<0,0.000000,0> translate<59.853800,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.889700,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,38.486400>}
box{<0,0,-0.304800><0.477570,0.035000,0.304800> rotate<0,67.490117,0> translate<59.889700,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.889700,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.078100,-1.535000,38.927600>}
box{<0,0,-0.304800><4.188400,0.035000,0.304800> rotate<0,0.000000,0> translate<59.889700,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.972900,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.042200,-1.535000,11.277600>}
box{<0,0,-0.304800><4.069300,0.035000,0.304800> rotate<0,0.000000,0> translate<59.972900,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,37.713500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,38.486400>}
box{<0,0,-0.304800><0.772900,0.035000,0.304800> rotate<0,90.000000,0> translate<60.072500,-1.535000,38.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.795200>}
box{<0,0,-0.304800><3.884700,0.035000,0.304800> rotate<0,0.000000,0> translate<60.072500,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.072500,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.080400,-1.535000,38.404800>}
box{<0,0,-0.304800><4.007900,0.035000,0.304800> rotate<0,0.000000,0> translate<60.072500,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.194900,-1.535000,2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.305000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<60.194900,-1.535000,2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.194900,-1.535000,5.029100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,4.314900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<60.194900,-1.535000,5.029100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.347200,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.382000,-1.535000,4.876800>}
box{<0,0,-0.304800><8.034800,0.035000,0.304800> rotate<0,0.000000,0> translate<60.347200,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.426400,-1.535000,18.287900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,17.246400>}
box{<0,0,-0.304800><1.472903,0.035000,0.304800> rotate<0,44.997030,0> translate<60.426400,-1.535000,18.287900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.455000,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,27.990800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<60.455000,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.455000,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<60.455000,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.652100,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.300300,-1.535000,3.048000>}
box{<0,0,-0.304800><7.648200,0.035000,0.304800> rotate<0,0.000000,0> translate<60.652100,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.809400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<60.909100,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,3.657600>}
box{<0,0,-0.304800><7.290100,0.035000,0.304800> rotate<0,0.000000,0> translate<60.909100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,4.314900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<60.909100,-1.535000,4.314900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.909100,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.218700,-1.535000,4.267200>}
box{<0,0,-0.304800><7.309600,0.035000,0.304800> rotate<0,0.000000,0> translate<60.909100,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.958900,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.958900,-1.535000,29.209400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.958900,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.208900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<60.959400,-1.535000,29.208900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,28.041600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,28.651200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.208900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.208900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,29.208900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,30.429100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<60.959400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.211000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.211000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.260800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.959400,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.870400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.959400,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.464900,-1.535000,27.990800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<60.960400,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.208900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,27.990800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.960400,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,29.211000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.960400,-1.535000,29.211000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960400,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.464900,-1.535000,30.429100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<60.960400,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.961000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.961000,-1.535000,29.210400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<60.961000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.961000,-1.535000,29.209400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.209400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<60.961000,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.961000,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.210400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<60.961000,-1.535000,29.210400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.035900,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,17.678400>}
box{<0,0,-0.304800><12.243300,0.035000,0.304800> rotate<0,0.000000,0> translate<61.035900,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,15.418000>}
box{<0,0,-0.304800><1.295700,0.035000,0.304800> rotate<0,90.000000,0> translate<61.112300,-1.535000,15.418000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.042200,-1.535000,14.122300>}
box{<0,0,-0.304800><2.929900,0.035000,0.304800> rotate<0,0.000000,0> translate<61.112300,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,14.630400>}
box{<0,0,-0.304800><12.166900,0.035000,0.304800> rotate<0,0.000000,0> translate<61.112300,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,15.240000>}
box{<0,0,-0.304800><12.166900,0.035000,0.304800> rotate<0,0.000000,0> translate<61.112300,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.112300,-1.535000,15.418000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,15.773500>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-44.988973,0> translate<61.112300,-1.535000,15.418000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.464900,-1.535000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,28.705000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.464900,-1.535000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.464900,-1.535000,30.429100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.714900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<61.464900,-1.535000,30.429100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,15.773500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,17.246400>}
box{<0,0,-0.304800><1.472900,0.035000,0.304800> rotate<0,90.000000,0> translate<61.467900,-1.535000,17.246400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,15.849600>}
box{<0,0,-0.304800><11.811300,0.035000,0.304800> rotate<0,0.000000,0> translate<61.467900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,16.459200>}
box{<0,0,-0.304800><11.811300,0.035000,0.304800> rotate<0,0.000000,0> translate<61.467900,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.467900,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,17.068800>}
box{<0,0,-0.304800><11.811300,0.035000,0.304800> rotate<0,0.000000,0> translate<61.467900,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.515700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,28.041600>}
box{<0,0,-0.304800><11.763500,0.035000,0.304800> rotate<0,0.000000,0> translate<61.515700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.023600,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,29.870400>}
box{<0,0,-0.304800><11.255600,0.035000,0.304800> rotate<0,0.000000,0> translate<62.023600,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.125300,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,28.651200>}
box{<0,0,-0.304800><11.153900,0.035000,0.304800> rotate<0,0.000000,0> translate<62.125300,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,28.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.209400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<62.179100,-1.535000,29.209400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.210400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.714900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<62.179100,-1.535000,29.714900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.179100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,29.260800>}
box{<0,0,-0.304800><11.100100,0.035000,0.304800> rotate<0,0.000000,0> translate<62.179100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.265000,-1.535000,22.656800>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<63.550800,-1.535000,23.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.371000>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.550800,-1.535000,23.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.768900,-1.535000,23.875400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<63.550800,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.768900,-1.535000,23.876400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<63.550800,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,24.380900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,23.876400>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.550800,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.550800,-1.535000,24.380900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.265000,-1.535000,25.095100>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<63.550800,-1.535000,24.380900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.056000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,9.850600>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<63.957200,-1.535000,10.056000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.056000>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.957200,-1.535000,10.056000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,10.159400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<63.957200,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,10.160400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<63.957200,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.263900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.160400>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.957200,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,10.263900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,10.469300>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<63.957200,-1.535000,10.263900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.742000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,37.536600>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<63.957200,-1.535000,37.742000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.845400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.742000>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.957200,-1.535000,37.742000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.845400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,37.845400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<63.957200,-1.535000,37.845400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.846400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,37.846400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<63.957200,-1.535000,37.846400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.949900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.846400>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.957200,-1.535000,37.846400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.957200,-1.535000,37.949900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,38.155300>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<63.957200,-1.535000,37.949900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,9.850600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,9.652900>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<63.989700,-1.535000,9.850600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,10.469300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,10.667000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<63.989700,-1.535000,10.469300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,37.536600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,37.338900>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<63.989700,-1.535000,37.536600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.989700,-1.535000,38.155300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,38.353000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<63.989700,-1.535000,38.155300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.006100,-1.535000,41.772300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,41.979400>}
box{<0,0,-0.304800><0.292884,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.006100,-1.535000,41.772300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.042200,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,11.106500>}
box{<0,0,-0.304800><0.241901,0.035000,0.304800> rotate<0,45.013777,0> translate<64.042200,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.042200,-1.535000,14.122300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,14.293400>}
box{<0,0,-0.304800><0.241901,0.035000,0.304800> rotate<0,-45.013777,0> translate<64.042200,-1.535000,14.122300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,9.652900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,9.467700>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<64.054000,-1.535000,9.652900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,10.667000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,10.852200>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<64.054000,-1.535000,10.667000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,37.338900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,37.153700>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<64.054000,-1.535000,37.338900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.054000,-1.535000,38.353000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,38.538200>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<64.054000,-1.535000,38.353000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.078100,-1.535000,38.927600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,38.792500>}
box{<0,0,-0.304800><0.191060,0.035000,0.304800> rotate<0,44.997030,0> translate<64.078100,-1.535000,38.927600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,9.467700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,9.299500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<64.148300,-1.535000,9.467700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,10.852200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,11.020400>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<64.148300,-1.535000,10.852200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,37.153700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,36.985500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<64.148300,-1.535000,37.153700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.148300,-1.535000,38.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,38.706400>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<64.148300,-1.535000,38.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,11.106500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.314700,-1.535000,11.064500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,22.477951,0> translate<64.213200,-1.535000,11.106500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,14.293400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.904000,-1.535000,14.579500>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-22.495773,0> translate<64.213200,-1.535000,14.293400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,38.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.314700,-1.535000,38.750500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,22.477951,0> translate<64.213200,-1.535000,38.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.213200,-1.535000,41.979400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.904000,-1.535000,42.265500>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-22.495773,0> translate<64.213200,-1.535000,41.979400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.265000,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,22.656800>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<64.265000,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.265000,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,25.095100>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,0.000000,0> translate<64.265000,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,9.299500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.417500,-1.535000,9.152500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,44.997030,0> translate<64.270500,-1.535000,9.299500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,11.020400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.314700,-1.535000,11.064500>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,-44.932147,0> translate<64.270500,-1.535000,11.020400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,36.985500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.417500,-1.535000,36.838500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,44.997030,0> translate<64.270500,-1.535000,36.985500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.270500,-1.535000,38.706400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.314700,-1.535000,38.750500>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,-44.932147,0> translate<64.270500,-1.535000,38.706400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.417500,-1.535000,9.152500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.585700,-1.535000,9.030300>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,35.996631,0> translate<64.417500,-1.535000,9.152500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.417500,-1.535000,36.838500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.585700,-1.535000,36.716300>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,35.996631,0> translate<64.417500,-1.535000,36.838500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.585700,-1.535000,9.030300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770900,-1.535000,8.936000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,26.982470,0> translate<64.585700,-1.535000,9.030300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.585700,-1.535000,36.716300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770900,-1.535000,36.622000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,26.982470,0> translate<64.585700,-1.535000,36.716300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.768900,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.768900,-1.535000,23.875400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.768900,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.874900>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<64.769400,-1.535000,23.874900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.164800>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.774400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.874900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.874900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,23.874900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,25.095100>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,90.000000,0> translate<64.769400,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,23.877000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.877000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,23.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,24.384000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.769400,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,24.993600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.769400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.274900,-1.535000,22.656800>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<64.770400,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.874900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,22.656800>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.770400,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,23.877000>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.770400,-1.535000,23.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770400,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.274900,-1.535000,25.095100>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,0.000000,0> translate<64.770400,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770900,-1.535000,8.936000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.968600,-1.535000,8.871700>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,18.015423,0> translate<64.770900,-1.535000,8.936000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770900,-1.535000,36.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.968600,-1.535000,36.557700>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,18.015423,0> translate<64.770900,-1.535000,36.622000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.771000,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.771000,-1.535000,23.876400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<64.771000,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.771000,-1.535000,23.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.875400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<64.771000,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.771000,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.876400>}
box{<0,0,-0.304800><1.218100,0.035000,0.304800> rotate<0,0.000000,0> translate<64.771000,-1.535000,23.876400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.904000,-1.535000,14.579500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.175900,-1.535000,14.579500>}
box{<0,0,-0.304800><2.271900,0.035000,0.304800> rotate<0,0.000000,0> translate<64.904000,-1.535000,14.579500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.904000,-1.535000,42.265500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.175900,-1.535000,42.265500>}
box{<0,0,-0.304800><2.271900,0.035000,0.304800> rotate<0,0.000000,0> translate<64.904000,-1.535000,42.265500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.968600,-1.535000,8.871700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.174000,-1.535000,8.839200>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,8.990654,0> translate<64.968600,-1.535000,8.871700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.968600,-1.535000,36.557700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.174000,-1.535000,36.525200>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,8.990654,0> translate<64.968600,-1.535000,36.557700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.174000,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,8.839200>}
box{<0,0,-0.304800><0.865400,0.035000,0.304800> rotate<0,0.000000,0> translate<65.174000,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.174000,-1.535000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,36.525200>}
box{<0,0,-0.304800><0.865400,0.035000,0.304800> rotate<0,0.000000,0> translate<65.174000,-1.535000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.274900,-1.535000,22.656800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.371000>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,-44.997030,0> translate<65.274900,-1.535000,22.656800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.274900,-1.535000,25.095100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,24.380900>}
box{<0,0,-0.304800><1.010031,0.035000,0.304800> rotate<0,44.997030,0> translate<65.274900,-1.535000,25.095100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.376400,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,24.993600>}
box{<0,0,-0.304800><7.902800,0.035000,0.304800> rotate<0,0.000000,0> translate<65.376400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.782900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,23.164800>}
box{<0,0,-0.304800><7.496300,0.035000,0.304800> rotate<0,0.000000,0> translate<65.782900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.986000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,24.384000>}
box{<0,0,-0.304800><7.293200,0.035000,0.304800> rotate<0,0.000000,0> translate<65.986000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.875400>}
box{<0,0,-0.304800><0.504400,0.035000,0.304800> rotate<0,90.000000,0> translate<65.989100,-1.535000,23.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,23.774400>}
box{<0,0,-0.304800><7.290100,0.035000,0.304800> rotate<0,0.000000,0> translate<65.989100,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,23.876400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.989100,-1.535000,24.380900>}
box{<0,0,-0.304800><0.504500,0.035000,0.304800> rotate<0,90.000000,0> translate<65.989100,-1.535000,24.380900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,10.159400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.038900,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,37.846400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.038900,-1.535000,37.845400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.038900,-1.535000,37.845400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,10.158900>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,90.000000,0> translate<66.039400,-1.535000,10.158900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,9.144000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,9.753600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,10.158900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,10.158900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,10.158900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,37.844900>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,90.000000,0> translate<66.039400,-1.535000,37.844900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,36.576000>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,37.185600>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,37.795200>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.039400,-1.535000,37.844900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,37.844900>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.039400,-1.535000,37.844900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.905900,-1.535000,8.839200>}
box{<0,0,-0.304800><0.865500,0.035000,0.304800> rotate<0,0.000000,0> translate<66.040400,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,10.158900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,8.839200>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.040400,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.905900,-1.535000,36.525200>}
box{<0,0,-0.304800><0.865500,0.035000,0.304800> rotate<0,0.000000,0> translate<66.040400,-1.535000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,37.844900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040400,-1.535000,36.525200>}
box{<0,0,-0.304800><1.319700,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.040400,-1.535000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,10.160400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<66.041000,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,10.159400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.159400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<66.041000,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.160400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<66.041000,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,37.845400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,37.846400>}
box{<0,0,-0.304800><0.001000,0.035000,0.304800> rotate<0,90.000000,0> translate<66.041000,-1.535000,37.846400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,37.845400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.845400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<66.041000,-1.535000,37.845400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.041000,-1.535000,37.846400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.846400>}
box{<0,0,-0.304800><2.081700,0.035000,0.304800> rotate<0,0.000000,0> translate<66.041000,-1.535000,37.846400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.905900,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.111300,-1.535000,8.871700>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-8.990654,0> translate<66.905900,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.905900,-1.535000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.111300,-1.535000,36.557700>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-8.990654,0> translate<66.905900,-1.535000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.111300,-1.535000,8.871700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.309000,-1.535000,8.936000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-18.015423,0> translate<67.111300,-1.535000,8.871700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.111300,-1.535000,36.557700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.309000,-1.535000,36.622000>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-18.015423,0> translate<67.111300,-1.535000,36.557700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.167500,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,36.576000>}
box{<0,0,-0.304800><6.111700,0.035000,0.304800> rotate<0,0.000000,0> translate<67.167500,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.175900,-1.535000,14.579500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,14.293400>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,22.495773,0> translate<67.175900,-1.535000,14.579500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.175900,-1.535000,42.265500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,41.979400>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,22.495773,0> translate<67.175900,-1.535000,42.265500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.309000,-1.535000,8.936000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.494200,-1.535000,9.030300>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-26.982470,0> translate<67.309000,-1.535000,8.936000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.309000,-1.535000,36.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.494200,-1.535000,36.716300>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-26.982470,0> translate<67.309000,-1.535000,36.622000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.494200,-1.535000,9.030300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.662400,-1.535000,9.152500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-35.996631,0> translate<67.494200,-1.535000,9.030300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.494200,-1.535000,36.716300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.662400,-1.535000,36.838500>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-35.996631,0> translate<67.494200,-1.535000,36.716300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.650700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,9.144000>}
box{<0,0,-0.304800><5.628500,0.035000,0.304800> rotate<0,0.000000,0> translate<67.650700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.662400,-1.535000,9.152500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,9.299500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.662400,-1.535000,9.152500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.662400,-1.535000,36.838500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,36.985500>}
box{<0,0,-0.304800><0.207889,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.662400,-1.535000,36.838500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.666300,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,42.062400>}
box{<0,0,-0.304800><5.612900,0.035000,0.304800> rotate<0,0.000000,0> translate<67.666300,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.765200,-1.535000,11.064500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,11.020400>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,44.932147,0> translate<67.765200,-1.535000,11.064500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.765200,-1.535000,11.064500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,11.106500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,-22.477951,0> translate<67.765200,-1.535000,11.064500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.765200,-1.535000,38.750500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,38.706400>}
box{<0,0,-0.304800><0.062438,0.035000,0.304800> rotate<0,44.932147,0> translate<67.765200,-1.535000,38.750500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.765200,-1.535000,38.750500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,38.792500>}
box{<0,0,-0.304800><0.109846,0.035000,0.304800> rotate<0,-22.477951,0> translate<67.765200,-1.535000,38.750500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,9.299500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,9.467700>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<67.809400,-1.535000,9.299500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,11.020400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,10.852200>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<67.809400,-1.535000,11.020400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,36.985500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,37.153700>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,-53.997429,0> translate<67.809400,-1.535000,36.985500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.809400,-1.535000,38.706400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,38.538200>}
box{<0,0,-0.304800><0.207904,0.035000,0.304800> rotate<0,53.997429,0> translate<67.809400,-1.535000,38.706400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.844000,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,10.972800>}
box{<0,0,-0.304800><5.435200,0.035000,0.304800> rotate<0,0.000000,0> translate<67.844000,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,11.106500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,11.635200>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.866700,-1.535000,11.106500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,14.293400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,13.764700>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,44.997030,0> translate<67.866700,-1.535000,14.293400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,38.792500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,39.321200>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.866700,-1.535000,38.792500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.866700,-1.535000,41.979400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,41.450700>}
box{<0,0,-0.304800><0.747695,0.035000,0.304800> rotate<0,44.997030,0> translate<67.866700,-1.535000,41.979400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,9.467700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,9.652900>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<67.931600,-1.535000,9.467700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,10.852200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,10.667000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<67.931600,-1.535000,10.852200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,37.153700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,37.338900>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,-63.011590,0> translate<67.931600,-1.535000,37.153700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.931600,-1.535000,38.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,38.353000>}
box{<0,0,-0.304800><0.207826,0.035000,0.304800> rotate<0,63.011590,0> translate<67.931600,-1.535000,38.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.947800,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,37.185600>}
box{<0,0,-0.304800><5.331400,0.035000,0.304800> rotate<0,0.000000,0> translate<67.947800,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.999600,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,38.404800>}
box{<0,0,-0.304800><5.279600,0.035000,0.304800> rotate<0,0.000000,0> translate<67.999600,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,9.652900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,9.850600>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<68.025900,-1.535000,9.652900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,10.667000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,10.469300>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<68.025900,-1.535000,10.667000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,37.338900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,37.536600>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,-71.978638,0> translate<68.025900,-1.535000,37.338900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.025900,-1.535000,38.353000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,38.155300>}
box{<0,0,-0.304800><0.207894,0.035000,0.304800> rotate<0,71.978638,0> translate<68.025900,-1.535000,38.353000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.058600,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,9.753600>}
box{<0,0,-0.304800><5.220600,0.035000,0.304800> rotate<0,0.000000,0> translate<68.058600,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.088600,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,39.014400>}
box{<0,0,-0.304800><5.190600,0.035000,0.304800> rotate<0,0.000000,0> translate<68.088600,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,9.850600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.056000>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<68.090200,-1.535000,9.850600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,10.469300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.263900>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<68.090200,-1.535000,10.469300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,37.536600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.742000>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,-81.003406,0> translate<68.090200,-1.535000,37.536600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.090200,-1.535000,38.155300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.949900>}
box{<0,0,-0.304800><0.207955,0.035000,0.304800> rotate<0,81.003406,0> translate<68.090200,-1.535000,38.155300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.107000,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,10.363200>}
box{<0,0,-0.304800><5.172200,0.035000,0.304800> rotate<0,0.000000,0> translate<68.107000,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.056000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.159400>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,90.000000,0> translate<68.122700,-1.535000,10.159400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,10.263900>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,90.000000,0> translate<68.122700,-1.535000,10.263900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.742000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.845400>}
box{<0,0,-0.304800><0.103400,0.035000,0.304800> rotate<0,90.000000,0> translate<68.122700,-1.535000,37.845400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,37.795200>}
box{<0,0,-0.304800><5.156500,0.035000,0.304800> rotate<0,0.000000,0> translate<68.122700,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.846400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.122700,-1.535000,37.949900>}
box{<0,0,-0.304800><0.103500,0.035000,0.304800> rotate<0,90.000000,0> translate<68.122700,-1.535000,37.949900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.139300,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,14.020800>}
box{<0,0,-0.304800><5.139900,0.035000,0.304800> rotate<0,0.000000,0> translate<68.139300,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,3.425400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,2.682600>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,74.997401,0> translate<68.199200,-1.535000,3.425400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,4.194500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,3.425400>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,-90.000000,0> translate<68.199200,-1.535000,3.425400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,4.194500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,4.937300>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-74.997401,0> translate<68.199200,-1.535000,4.194500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,47.875400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,47.132600>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,74.997401,0> translate<68.199200,-1.535000,47.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,48.644500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,47.875400>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,-90.000000,0> translate<68.199200,-1.535000,47.875400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199200,-1.535000,48.644500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,49.387300>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-74.997401,0> translate<68.199200,-1.535000,48.644500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.342600,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,11.582400>}
box{<0,0,-0.304800><4.936600,0.035000,0.304800> rotate<0,0.000000,0> translate<68.342600,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.393300,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,41.452800>}
box{<0,0,-0.304800><4.885900,0.035000,0.304800> rotate<0,0.000000,0> translate<68.393300,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,11.635200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,12.326000>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-67.498287,0> translate<68.395400,-1.535000,11.635200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,13.764700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,13.073900>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,67.498287,0> translate<68.395400,-1.535000,13.764700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,39.321200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,40.012000>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,-67.498287,0> translate<68.395400,-1.535000,39.321200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395400,-1.535000,41.450700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,40.759900>}
box{<0,0,-0.304800><0.747702,0.035000,0.304800> rotate<0,67.498287,0> translate<68.395400,-1.535000,41.450700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,2.682600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,2.016500>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,59.994299,0> translate<68.398200,-1.535000,2.682600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,4.937300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,5.603400>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-59.994299,0> translate<68.398200,-1.535000,4.937300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,47.132600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,46.466500>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,59.994299,0> translate<68.398200,-1.535000,47.132600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.398200,-1.535000,49.387300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,50.053400>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-59.994299,0> translate<68.398200,-1.535000,49.387300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.520800,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,39.624000>}
box{<0,0,-0.304800><4.758400,0.035000,0.304800> rotate<0,0.000000,0> translate<68.520800,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.541900,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,13.411200>}
box{<0,0,-0.304800><4.737300,0.035000,0.304800> rotate<0,0.000000,0> translate<68.541900,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.626000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,12.192000>}
box{<0,0,-0.304800><4.653200,0.035000,0.304800> rotate<0,0.000000,0> translate<68.626000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.647100,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,40.843200>}
box{<0,0,-0.304800><4.632100,0.035000,0.304800> rotate<0,0.000000,0> translate<68.647100,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,12.326000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,13.073900>}
box{<0,0,-0.304800><0.747900,0.035000,0.304800> rotate<0,90.000000,0> translate<68.681500,-1.535000,13.073900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,12.801600>}
box{<0,0,-0.304800><4.597700,0.035000,0.304800> rotate<0,0.000000,0> translate<68.681500,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,40.012000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,40.759900>}
box{<0,0,-0.304800><0.747900,0.035000,0.304800> rotate<0,90.000000,0> translate<68.681500,-1.535000,40.759900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.681500,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,40.233600>}
box{<0,0,-0.304800><4.597700,0.035000,0.304800> rotate<0,0.000000,0> translate<68.681500,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,2.016500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,1.472800>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,44.997030,0> translate<68.782800,-1.535000,2.016500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,5.603400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,6.147100>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.782800,-1.535000,5.603400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,46.466500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,45.922800>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,44.997030,0> translate<68.782800,-1.535000,46.466500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.782800,-1.535000,50.053400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,50.597100>}
box{<0,0,-0.304800><0.768908,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.782800,-1.535000,50.053400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,1.472800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.590100,-1.535000,1.320700>}
box{<0,0,-0.304800><0.304334,0.035000,0.304800> rotate<0,29.983424,0> translate<69.326500,-1.535000,1.472800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,6.147100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.992600,-1.535000,6.531700>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-29.999761,0> translate<69.326500,-1.535000,6.147100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,45.922800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.992600,-1.535000,45.538200>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,29.999761,0> translate<69.326500,-1.535000,45.922800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.326500,-1.535000,50.597100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.572800,-1.535000,50.739200>}
box{<0,0,-0.304800><0.284352,0.035000,0.304800> rotate<0,-29.980332,0> translate<69.326500,-1.535000,50.597100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.992600,-1.535000,6.531700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.735400,-1.535000,6.730700>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-14.996660,0> translate<69.992600,-1.535000,6.531700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.992600,-1.535000,45.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.735400,-1.535000,45.339200>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,14.996660,0> translate<69.992600,-1.535000,45.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.735400,-1.535000,6.730700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.504500,-1.535000,6.730700>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,0.000000,0> translate<70.735400,-1.535000,6.730700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.735400,-1.535000,45.339200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.504500,-1.535000,45.339200>}
box{<0,0,-0.304800><0.769100,0.035000,0.304800> rotate<0,0.000000,0> translate<70.735400,-1.535000,45.339200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.504500,-1.535000,6.730700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.247300,-1.535000,6.531700>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,14.996660,0> translate<71.504500,-1.535000,6.730700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.504500,-1.535000,45.339200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.247300,-1.535000,45.538200>}
box{<0,0,-0.304800><0.768995,0.035000,0.304800> rotate<0,-14.996660,0> translate<71.504500,-1.535000,45.339200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.598200,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,6.705600>}
box{<0,0,-0.304800><1.681000,0.035000,0.304800> rotate<0,0.000000,0> translate<71.598200,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.247300,-1.535000,6.531700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913400,-1.535000,6.147100>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,29.999761,0> translate<72.247300,-1.535000,6.531700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.247300,-1.535000,45.538200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913400,-1.535000,45.922800>}
box{<0,0,-0.304800><0.769160,0.035000,0.304800> rotate<0,-29.999761,0> translate<72.247300,-1.535000,45.538200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.562100,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,45.720000>}
box{<0,0,-0.304800><0.717100,0.035000,0.304800> rotate<0,0.000000,0> translate<72.562100,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913400,-1.535000,6.147100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,5.781200>}
box{<0,0,-0.304800><0.517390,0.035000,0.304800> rotate<0,45.004860,0> translate<72.913400,-1.535000,6.147100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913400,-1.535000,45.922800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,46.288700>}
box{<0,0,-0.304800><0.517390,0.035000,0.304800> rotate<0,-45.004860,0> translate<72.913400,-1.535000,45.922800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.964500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,6.096000>}
box{<0,0,-0.304800><0.314700,0.035000,0.304800> rotate<0,0.000000,0> translate<72.964500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,46.288700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279200,-1.535000,5.781200>}
box{<0,0,-0.304800><40.507500,0.035000,0.304800> rotate<0,-90.000000,0> translate<73.279200,-1.535000,5.781200> }
texture{col_pol}
}
#end
union{
cylinder{<54.610000,0.038000,12.700000><54.610000,-1.538000,12.700000>0.406400}
cylinder{<54.610000,0.038000,7.620000><54.610000,-1.538000,7.620000>0.406400}
cylinder{<44.450000,0.038000,7.620000><44.450000,-1.538000,7.620000>0.406400}
cylinder{<44.450000,0.038000,12.700000><44.450000,-1.538000,12.700000>0.406400}
cylinder{<34.290000,0.038000,12.700000><34.290000,-1.538000,12.700000>0.406400}
cylinder{<34.290000,0.038000,7.620000><34.290000,-1.538000,7.620000>0.406400}
cylinder{<24.130000,0.038000,7.620000><24.130000,-1.538000,7.620000>0.406400}
cylinder{<24.130000,0.038000,12.700000><24.130000,-1.538000,12.700000>0.406400}
cylinder{<13.970000,0.038000,12.700000><13.970000,-1.538000,12.700000>0.406400}
cylinder{<13.970000,0.038000,7.620000><13.970000,-1.538000,7.620000>0.406400}
cylinder{<8.890000,0.038000,29.210000><8.890000,-1.538000,29.210000>0.406400}
cylinder{<8.890000,0.038000,34.290000><8.890000,-1.538000,34.290000>0.406400}
cylinder{<8.890000,0.038000,20.320000><8.890000,-1.538000,20.320000>0.406400}
cylinder{<8.890000,0.038000,25.400000><8.890000,-1.538000,25.400000>0.406400}
cylinder{<19.050000,0.038000,40.386000><19.050000,-1.538000,40.386000>0.406400}
cylinder{<19.050000,0.038000,35.306000><19.050000,-1.538000,35.306000>0.406400}
cylinder{<26.670000,0.038000,29.210000><26.670000,-1.538000,29.210000>0.406400}
cylinder{<31.750000,0.038000,29.210000><31.750000,-1.538000,29.210000>0.406400}
cylinder{<41.910000,0.038000,35.306000><41.910000,-1.538000,35.306000>0.406400}
cylinder{<41.910000,0.038000,40.386000><41.910000,-1.538000,40.386000>0.406400}
cylinder{<34.290000,0.038000,40.386000><34.290000,-1.538000,40.386000>0.406400}
cylinder{<34.290000,0.038000,35.306000><34.290000,-1.538000,35.306000>0.406400}
cylinder{<48.260000,0.038000,40.386000><48.260000,-1.538000,40.386000>0.406400}
cylinder{<48.260000,0.038000,35.306000><48.260000,-1.538000,35.306000>0.406400}
cylinder{<55.880000,0.038000,29.210000><55.880000,-1.538000,29.210000>0.406400}
cylinder{<60.960000,0.038000,29.210000><60.960000,-1.538000,29.210000>0.406400}
cylinder{<66.040000,0.038000,10.160000><66.040000,-1.538000,10.160000>0.508000}
cylinder{<66.040000,0.038000,12.700000><66.040000,-1.538000,12.700000>0.508000}
cylinder{<8.890000,0.038000,41.910000><8.890000,-1.538000,41.910000>0.508000}
cylinder{<8.890000,0.038000,39.370000><8.890000,-1.538000,39.370000>0.508000}
cylinder{<66.040000,0.038000,37.846000><66.040000,-1.538000,37.846000>0.508000}
cylinder{<66.040000,0.038000,40.386000><66.040000,-1.538000,40.386000>0.508000}
cylinder{<49.530000,0.038000,12.700000><49.530000,-1.538000,12.700000>0.304800}
cylinder{<49.530000,0.038000,7.620000><49.530000,-1.538000,7.620000>0.304800}
cylinder{<39.370000,0.038000,7.620000><39.370000,-1.538000,7.620000>0.304800}
cylinder{<39.370000,0.038000,12.700000><39.370000,-1.538000,12.700000>0.304800}
cylinder{<29.210000,0.038000,12.700000><29.210000,-1.538000,12.700000>0.304800}
cylinder{<29.210000,0.038000,7.620000><29.210000,-1.538000,7.620000>0.304800}
cylinder{<19.050000,0.038000,7.620000><19.050000,-1.538000,7.620000>0.304800}
cylinder{<19.050000,0.038000,12.700000><19.050000,-1.538000,12.700000>0.304800}
cylinder{<19.050000,0.038000,27.686000><19.050000,-1.538000,27.686000>0.406400}
cylinder{<19.050000,0.038000,30.226000><19.050000,-1.538000,30.226000>0.406400}
cylinder{<19.050000,0.038000,25.146000><19.050000,-1.538000,25.146000>0.406400}
cylinder{<48.260000,0.038000,27.686000><48.260000,-1.538000,27.686000>0.406400}
cylinder{<48.260000,0.038000,30.226000><48.260000,-1.538000,30.226000>0.406400}
cylinder{<48.260000,0.038000,25.146000><48.260000,-1.538000,25.146000>0.406400}
cylinder{<59.690000,0.038000,3.810000><59.690000,-1.538000,3.810000>0.406400}
cylinder{<59.690000,0.038000,16.510000><59.690000,-1.538000,16.510000>0.406400}
cylinder{<8.890000,0.038000,3.810000><8.890000,-1.538000,3.810000>0.406400}
cylinder{<8.890000,0.038000,16.510000><8.890000,-1.538000,16.510000>0.406400}
cylinder{<26.670000,0.038000,44.450000><26.670000,-1.538000,44.450000>0.406400}
cylinder{<13.970000,0.038000,44.450000><13.970000,-1.538000,44.450000>0.406400}
cylinder{<13.970000,0.038000,27.686000><13.970000,-1.538000,27.686000>0.406400}
cylinder{<13.970000,0.038000,40.386000><13.970000,-1.538000,40.386000>0.406400}
cylinder{<26.670000,0.038000,20.320000><26.670000,-1.538000,20.320000>0.406400}
cylinder{<13.970000,0.038000,20.320000><13.970000,-1.538000,20.320000>0.406400}
cylinder{<35.560000,0.038000,23.876000><35.560000,-1.538000,23.876000>0.406400}
cylinder{<22.860000,0.038000,23.876000><22.860000,-1.538000,23.876000>0.406400}
cylinder{<48.260000,0.038000,44.450000><48.260000,-1.538000,44.450000>0.406400}
cylinder{<35.560000,0.038000,44.450000><35.560000,-1.538000,44.450000>0.406400}
cylinder{<38.100000,0.038000,23.876000><38.100000,-1.538000,23.876000>0.406400}
cylinder{<38.100000,0.038000,36.576000><38.100000,-1.538000,36.576000>0.406400}
cylinder{<50.800000,0.038000,20.320000><50.800000,-1.538000,20.320000>0.406400}
cylinder{<38.100000,0.038000,20.320000><38.100000,-1.538000,20.320000>0.406400}
cylinder{<64.770000,0.038000,23.876000><64.770000,-1.538000,23.876000>0.406400}
cylinder{<52.070000,0.038000,23.876000><52.070000,-1.538000,23.876000>0.406400}
cylinder{<24.420000,0.038000,40.350000><24.420000,-1.538000,40.350000>0.550000}
cylinder{<28.920000,0.038000,40.350000><28.920000,-1.538000,40.350000>0.550000}
cylinder{<28.920000,0.038000,38.100000><28.920000,-1.538000,38.100000>0.550000}
cylinder{<28.920000,0.038000,35.850000><28.920000,-1.538000,35.850000>0.550000}
cylinder{<24.420000,0.038000,35.850000><24.420000,-1.538000,35.850000>0.550000}
cylinder{<26.670000,0.038000,41.850000><26.670000,-1.538000,41.850000>0.650000}
cylinder{<26.670000,0.038000,34.350000><26.670000,-1.538000,34.350000>0.650000}
cylinder{<53.630000,0.038000,40.350000><53.630000,-1.538000,40.350000>0.550000}
cylinder{<58.130000,0.038000,40.350000><58.130000,-1.538000,40.350000>0.550000}
cylinder{<58.130000,0.038000,38.100000><58.130000,-1.538000,38.100000>0.550000}
cylinder{<58.130000,0.038000,35.850000><58.130000,-1.538000,35.850000>0.550000}
cylinder{<53.630000,0.038000,35.850000><53.630000,-1.538000,35.850000>0.550000}
cylinder{<55.880000,0.038000,41.850000><55.880000,-1.538000,41.850000>0.650000}
cylinder{<55.880000,0.038000,34.350000><55.880000,-1.538000,34.350000>0.650000}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<55.245000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<54.610000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.975000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.975000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,11.684000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<55.245000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<54.610000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.975000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.975000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,8.636000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.086000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.832000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.086000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,13.589000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<56.134000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<53.086000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<53.086000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<56.134000,0.000000,13.589000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.815000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.450000,0.000000,9.855200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<43.815000,0.000000,9.855200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.450000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.085000,0.000000,9.855200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<44.450000,0.000000,9.855200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,8.636000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.815000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.450000,0.000000,10.490200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<43.815000,0.000000,10.490200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.450000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.085000,0.000000,10.490200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<44.450000,0.000000,10.490200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,11.684000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.450000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.926000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.228000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.926000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.672000,0.000000,6.731000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.926000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.974000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.974000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.926000,0.000000,6.731000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.925000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<34.290000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.655000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,11.684000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.925000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<34.290000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.655000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,8.636000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.512000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.068000,0.000000,13.589000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.814000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.766000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.766000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.814000,0.000000,13.589000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.495000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.130000,0.000000,9.855200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<23.495000,0.000000,9.855200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.130000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.765000,0.000000,9.855200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<24.130000,0.000000,9.855200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,9.855200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,8.636000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.495000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.130000,0.000000,10.490200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<23.495000,0.000000,10.490200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.130000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.765000,0.000000,10.490200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<24.130000,0.000000,10.490200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,10.490200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,11.684000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<24.130000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.908000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.908000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.908000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.352000,0.000000,6.731000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<22.606000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.654000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.654000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<22.606000,0.000000,6.731000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.684000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<14.605000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.970000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.335000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<13.335000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,8.636000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.446000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.192000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.446000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.748000,0.000000,13.589000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.494000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.446000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.446000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.494000,0.000000,13.589000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,31.445200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,31.445200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,31.445200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,31.445200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,30.226000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.890000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,32.080200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,32.080200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,32.080200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,32.080200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,33.274000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,28.067000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,35.179000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.668000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,35.433000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,28.321000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.112000,0.000000,28.321000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.366000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.414000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.414000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.366000,0.000000,28.321000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,22.555200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,22.555200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,22.555200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,22.555200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,22.555200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,22.555200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,22.555200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,21.336000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.890000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.255000,0.000000,23.190200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,23.190200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.255000,0.000000,23.190200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.890000,0.000000,23.190200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.525000,0.000000,23.190200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<8.890000,0.000000,23.190200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,23.190200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,24.384000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,19.177000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,26.289000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.668000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,26.543000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,19.431000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.112000,0.000000,19.431000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.366000,0.000000,26.289000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.414000,0.000000,26.289000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.414000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.366000,0.000000,19.431000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.050000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.050000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.050000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.415000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.415000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,39.370000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<19.050000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.685000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.050000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<19.050000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.050000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.415000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.415000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,36.322000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,41.529000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.526000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,34.417000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.272000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,34.163000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.526000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,41.275000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.828000,0.000000,41.275000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.574000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.526000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.526000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.574000,0.000000,41.275000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,29.210000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<28.905200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,28.575000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<28.905200,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,29.210000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<27.686000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,29.210000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<29.540200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,28.575000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<29.540200,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.540200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,29.210000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<29.540200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,27.686000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,27.432000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,30.734000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,30.988000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,30.988000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,30.734000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,27.686000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.781000,0.000000,27.686000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.781000,0.000000,30.734000>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.275000,0.000000,37.541200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,0.000000,37.541200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<41.275000,0.000000,37.541200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,0.000000,37.541200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.545000,0.000000,37.541200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<41.910000,0.000000,37.541200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,37.541200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,36.322000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.275000,0.000000,38.176200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,0.000000,38.176200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<41.275000,0.000000,38.176200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,0.000000,38.176200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.545000,0.000000,38.176200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<41.910000,0.000000,38.176200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,38.176200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,39.370000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<41.910000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,34.163000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.386000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.688000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.688000,0.000000,41.275000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.688000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,41.529000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.386000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,34.417000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.132000,0.000000,34.417000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.386000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.434000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.434000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.386000,0.000000,34.417000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.925000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<34.290000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.655000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,39.370000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.925000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<34.290000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.290000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.655000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,36.322000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,41.529000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,34.417000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.512000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,34.163000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.068000,0.000000,41.275000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.068000,0.000000,41.275000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.814000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.766000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.766000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.814000,0.000000,41.275000>}
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,38.150800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,38.150800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,38.150800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,39.370000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<48.260000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.260000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,37.515800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,37.515800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,36.322000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,41.529000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,34.417000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,34.163000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,41.275000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.038000,0.000000,41.275000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.784000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.736000,0.000000,34.417000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.736000,0.000000,41.275000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.784000,0.000000,41.275000>}
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.115200,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.115200,0.000000,29.210000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<58.115200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.115200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.115200,0.000000,28.575000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<58.115200,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.115200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.896000,0.000000,29.210000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<56.896000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.750200,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.750200,0.000000,29.210000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<58.750200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.750200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.750200,0.000000,28.575000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<58.750200,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.750200,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,29.210000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<58.750200,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,27.686000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.737000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,27.432000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.991000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,30.734000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.103000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,30.988000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.991000,0.000000,30.988000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.849000,0.000000,30.734000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.849000,0.000000,27.686000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<54.991000,0.000000,27.686000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<54.991000,0.000000,30.734000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,12.700000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<68.580000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.040000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,12.700000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<68.961000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,12.700000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.961000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,11.430000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<68.961000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.040000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,11.430000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.961000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,11.430000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,9.525000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<63.119000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<63.119000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,11.430000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<63.119000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,13.335000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.119000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.754000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,12.065000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,10.795000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,9.525000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.754000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,9.525000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,8.890000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,12.700000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.446000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.414000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.160000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,10.160000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,12.446000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<67.437000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,12.446000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,10.414000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.437000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.160000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<67.437000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,10.414000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,10.414000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.040000,0.000000,12.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.040000,0.000000,10.160000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.350000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,39.370000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.969000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,38.100000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,39.370000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.969000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,39.370000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,40.640000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.969000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,43.180000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,40.640000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,38.100000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.890000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,40.640000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.811000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,43.180000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.890000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,42.545000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.811000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,41.275000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.811000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,40.640000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.811000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.811000,0.000000,38.735000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.811000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,38.735000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.811000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,38.735000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,40.005000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.176000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,40.005000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,41.275000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.811000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,41.275000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,42.545000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.176000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,42.545000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.811000,0.000000,43.180000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.811000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,39.370000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.624000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.985000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.656000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.985000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.910000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.985000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,41.910000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.493000,0.000000,39.624000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<6.985000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,39.624000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.493000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.493000,0.000000,41.656000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<7.493000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.493000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.910000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<6.985000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.969000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.985000,0.000000,41.656000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.969000,0.000000,41.656000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.890000,0.000000,39.370000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.890000,0.000000,41.910000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,40.386000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<68.580000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,41.656000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.040000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,40.386000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<68.961000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,40.386000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.961000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,39.116000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<68.961000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,36.576000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<66.040000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.961000,0.000000,39.116000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.961000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,41.656000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,39.116000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<66.040000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,36.576000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,37.211000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<63.119000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,38.481000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<63.119000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,39.116000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<63.119000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.119000,0.000000,41.021000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.119000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,41.021000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,41.021000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,39.751000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.754000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,39.751000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,38.481000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,38.481000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,37.211000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.754000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.754000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,37.211000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.119000,0.000000,36.576000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.119000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,40.386000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.132000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,38.100000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,37.846000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.945000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,37.846000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,40.132000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<67.437000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,40.132000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,38.100000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<67.437000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.437000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,37.846000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<67.437000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.961000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.945000,0.000000,38.100000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.945000,0.000000,38.100000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.040000,0.000000,40.386000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.040000,0.000000,37.846000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.244000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.816000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<47.752000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<47.752000,0.000000,6.731000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<47.752000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.308000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.308000,0.000000,13.589000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<51.308000,0.000000,13.589000> }
object{ARC(1.778000,0.050800,180.000000,360.000000,0.036000) translate<49.530000,0.000000,6.731000>}
object{ARC(2.286000,0.152400,180.000000,360.000000,0.036000) translate<49.530000,0.000000,6.731000>}
object{ARC(2.286000,0.152400,0.000000,180.000000,0.036000) translate<49.530000,0.000000,13.589000>}
object{ARC(1.778000,0.050800,0.000000,180.000000,0.036000) translate<49.530000,0.000000,13.589000>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.656000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<41.148000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<41.148000,0.000000,13.589000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<41.148000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.592000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.592000,0.000000,6.731000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<37.592000,0.000000,6.731000> }
object{ARC(1.778000,0.050800,0.000000,180.000000,0.036000) translate<39.370000,0.000000,13.589000>}
object{ARC(2.286000,0.152400,0.000000,180.000000,0.036000) translate<39.370000,0.000000,13.589000>}
object{ARC(2.286000,0.152400,180.000000,360.000000,0.036000) translate<39.370000,0.000000,6.731000>}
object{ARC(1.778000,0.050800,180.000000,360.000000,0.036000) translate<39.370000,0.000000,6.731000>}
//Q3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.924000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.496000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.432000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.432000,0.000000,6.731000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<27.432000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.988000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.988000,0.000000,13.589000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<30.988000,0.000000,13.589000> }
object{ARC(1.778000,0.050800,180.000000,360.000000,0.036000) translate<29.210000,0.000000,6.731000>}
object{ARC(2.286000,0.152400,180.000000,360.000000,0.036000) translate<29.210000,0.000000,6.731000>}
object{ARC(2.286000,0.152400,0.000000,180.000000,0.036000) translate<29.210000,0.000000,13.589000>}
object{ARC(1.778000,0.050800,0.000000,180.000000,0.036000) translate<29.210000,0.000000,13.589000>}
//Q4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.336000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.764000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<20.828000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<20.828000,0.000000,13.589000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<20.828000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.272000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.272000,0.000000,6.731000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<17.272000,0.000000,6.731000> }
object{ARC(1.778000,0.050800,0.000000,180.000000,0.036000) translate<19.050000,0.000000,13.589000>}
object{ARC(2.286000,0.152400,0.000000,180.000000,0.036000) translate<19.050000,0.000000,13.589000>}
object{ARC(2.286000,0.152400,180.000000,360.000000,0.036000) translate<19.050000,0.000000,6.731000>}
object{ARC(1.778000,0.050800,180.000000,360.000000,0.036000) translate<19.050000,0.000000,6.731000>}
//Q5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.399000,0.000000,29.781000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.399000,0.000000,25.591000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.399000,0.000000,25.591000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<19.050000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,26.550000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,28.822000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.923000,0.000000,28.822000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<19.049900,0.000000,27.686000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<19.050100,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,29.090000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,30.350000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.923000,0.000000,30.350000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<19.050100,0.000000,27.686500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,28.822000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,29.090000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.923000,0.000000,29.090000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<19.050100,0.000000,27.686000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<19.049900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,25.022000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,26.282000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.923000,0.000000,26.282000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,26.282000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.923000,0.000000,26.550000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.923000,0.000000,26.550000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<19.050100,0.000000,27.685500>}
//Q6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.609000,0.000000,29.781000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.609000,0.000000,25.591000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.609000,0.000000,25.591000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<48.260000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,26.550000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,28.822000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,28.822000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<48.259900,0.000000,27.686000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<48.260100,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,29.090000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,30.350000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,30.350000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<48.260100,0.000000,27.686500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,28.822000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,29.090000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,29.090000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<48.260100,0.000000,27.686000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<48.259900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,25.022000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,26.282000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,26.282000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,26.282000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,26.550000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,26.550000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<48.260100,0.000000,27.685500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,15.494000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<59.690000,0.000000,4.826000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<58.801000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<60.579000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<60.579000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<58.801000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.579000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,6.985000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.801000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.547000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.547000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.833000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.706000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<58.547000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,7.747000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.674000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.706000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,7.747000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.706000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.547000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.833000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.579000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.801000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,14.224000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,6.096000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<59.690000,0.000000,6.096000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,13.766800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,6.553200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,15.036800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.690000,0.000000,5.283200>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,15.494000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,4.826000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.890000,0.000000,4.826000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<8.001000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<9.779000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<9.779000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<8.001000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,6.985000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.001000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.747000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.747000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.033000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.906000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.747000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,7.747000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.874000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.906000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,7.747000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.906000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.747000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.033000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.001000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,14.224000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,6.096000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.890000,0.000000,6.096000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,13.766800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,6.553200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,15.036800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,5.283200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.986000,0.000000,44.450000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.970000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.654000,0.000000,44.450000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<25.654000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,43.561000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.495000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.434000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,45.466000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,43.561000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.875000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.256000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<15.875000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.765000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.384000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<24.384000,0.000000,44.450000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<16.713200,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<23.926800,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<15.443200,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<25.196800,0.000000,44.450000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,39.370000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,28.702000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<13.970000,0.000000,28.702000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<13.081000,0.000000,31.115000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.859000,0.000000,31.115000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.859000,0.000000,36.957000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<13.081000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,30.861000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,31.496000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.827000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,31.496000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.827000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,31.496000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.113000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,31.496000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.986000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,36.576000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.827000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,31.623000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.954000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,36.576000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.986000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,31.623000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.986000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,36.576000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.827000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,36.576000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.113000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,37.211000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,38.100000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,29.972000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<13.970000,0.000000,29.972000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,37.642800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,30.429200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,38.912800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,29.159200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.986000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.970000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.654000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<25.654000,0.000000,20.320000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.495000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,19.304000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,21.336000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.875000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.256000,0.000000,20.320000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<15.875000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.765000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.384000,0.000000,20.320000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<24.384000,0.000000,20.320000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<16.713200,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<23.926800,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<15.443200,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<25.196800,0.000000,20.320000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.876000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.860000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.544000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.544000,0.000000,23.876000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.131000,0.000000,22.987000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.131000,0.000000,24.765000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.289000,0.000000,24.765000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.289000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,22.987000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.623000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,25.019000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.750000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,25.019000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.623000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.670000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,22.860000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.797000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,25.019000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.670000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,24.892000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.797000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.289000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,25.019000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.289000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,22.987000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.035000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.765000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.146000,0.000000,23.876000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<24.765000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.655000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.274000,0.000000,23.876000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<33.274000,0.000000,23.876000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<25.603200,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<32.816800,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<24.333200,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<34.086800,0.000000,23.876000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.576000,0.000000,44.450000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.560000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.244000,0.000000,44.450000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.244000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.831000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.831000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.989000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.989000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,43.561000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.085000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.370000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,43.434000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.370000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,45.466000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,43.561000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.735000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.465000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.846000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<37.465000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<46.355000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.974000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<45.974000,0.000000,44.450000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<38.303200,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<45.516800,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<37.033200,0.000000,44.450000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<46.786800,0.000000,44.450000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,35.560000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,24.892000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<38.100000,0.000000,24.892000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.211000,0.000000,27.305000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.989000,0.000000,27.305000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.989000,0.000000,33.147000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.211000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,27.051000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,27.686000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.957000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,27.686000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.957000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,27.686000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.243000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,27.686000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.116000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,32.766000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.957000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,27.813000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,32.766000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.116000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,27.813000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.116000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,32.766000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.957000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,32.766000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.243000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,33.401000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,34.290000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,26.162000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<38.100000,0.000000,26.162000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,33.832800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,26.619200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,35.102800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,25.349200>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.100000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,20.320000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.371000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.371000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.529000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.529000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.625000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.863000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.863000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.910000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,19.304000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.910000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,21.336000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.529000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.529000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.275000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.005000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.386000,0.000000,20.320000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.005000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.895000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.514000,0.000000,20.320000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<48.514000,0.000000,20.320000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<40.843200,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<48.056800,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<39.573200,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<49.326800,0.000000,20.320000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.086000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<52.070000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<64.770000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.754000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<63.754000,0.000000,23.876000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.341000,0.000000,22.987000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.341000,0.000000,24.765000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<55.499000,0.000000,24.765000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<55.499000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,22.987000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.595000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.833000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,25.019000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,25.019000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.833000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.880000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,22.860000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,25.019000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.880000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,24.892000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.499000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,25.019000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.499000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,22.987000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.245000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.975000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.356000,0.000000,23.876000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<53.975000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<62.865000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<62.484000,0.000000,23.876000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<62.484000,0.000000,23.876000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<54.813200,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<62.026800,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<53.543200,0.000000,23.876000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<63.296800,0.000000,23.876000>}
//TR1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.020000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,41.750000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.020000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.920000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.320000,0.000000,41.750000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.920000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.320000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.320000,0.000000,34.450000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.320000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.020000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.020000,0.000000,41.750000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<23.020000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.270000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.070000,0.000000,41.750000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.270000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.070000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.270000,0.000000,34.450000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.270000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.020000,0.000000,34.450000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.020000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.320000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.920000,0.000000,34.450000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.920000,0.000000,34.450000> }
//TR2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.230000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.630000,0.000000,41.750000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.230000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.130000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.530000,0.000000,41.750000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.130000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.530000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.530000,0.000000,34.450000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.530000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.230000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.230000,0.000000,41.750000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<52.230000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,41.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.280000,0.000000,41.750000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.480000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.280000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,34.450000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.480000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.630000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.230000,0.000000,34.450000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.230000,0.000000,34.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.530000,0.000000,34.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.130000,0.000000,34.450000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.130000,0.000000,34.450000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  LADDER_FILTER_IF_AMPLIFIER(-37.300000,0,-26.030000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//TR1	71K-1524	71K
//TR2	71K-1524	71K
