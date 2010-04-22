//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/RF_Front-End/RF_Front-End.brd
//2010. 04. 22. 13:03:14

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
#local cam_y = 150;
#local cam_z = -73;
#local cam_a = 35;
#local cam_look_x = 0;
#local cam_look_y = -3;
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

#local lgt1_pos_x = 26;
#local lgt1_pos_y = 39;
#local lgt1_pos_z = 16;
#local lgt1_intense = 0.731767;
#local lgt2_pos_x = -26;
#local lgt2_pos_y = 39;
#local lgt2_pos_z = 16;
#local lgt2_intense = 0.731767;
#local lgt3_pos_x = 26;
#local lgt3_pos_y = 39;
#local lgt3_pos_z = -11;
#local lgt3_intense = 0.731767;
#local lgt4_pos_x = -26;
#local lgt4_pos_y = 39;
#local lgt4_pos_z = -11;
#local lgt4_intense = 0.731767;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 70.060000;
#declare pcb_y_size = 31.740000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(245);
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
	//translate<-35.030000,0,-15.870000>
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


#macro RF_FRONT_END(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><70.060000,0.000000>
<70.060000,0.000000><70.060000,31.740000>
<70.060000,31.740000><0.000000,31.740000>
<0.000000,31.740000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<6.350000,1,11.430000><6.350000,-5,11.430000>1.000000 texture{col_hls}}
cylinder{<6.350000,1,21.590000><6.350000,-5,21.590000>1.000000 texture{col_hls}}
//Holes(real)/Board
cylinder{<3.810000,1,27.940000><3.810000,-5,27.940000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<66.040000,1,27.940000><66.040000,-5,27.940000>1.600000 texture{col_hls}}
cylinder{<66.040000,1,3.810000><66.040000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,16.510000>}#end		//ceramic disc capacitator C1 22pF C050-035X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<27.940000,0.000000,8.590000>}#end		//ceramic disc capacitator C2 100pF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,16.510000>}#end		//ceramic disc capacitator C3 22pF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.180000,0.000000,8.590000>}#end		//ceramic disc capacitator C4 100pF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.320000,0.000000,24.160000>}#end		//ceramic disc capacitator C5 0.01uF C050-035X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.340000,0.000000,16.510000>}#end		//ceramic disc capacitator C6 22pF C050-035X075
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.200000,0.000000,24.100000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.500000,0.000000,7.600000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.500000,0.000000,25.000000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{Gray45}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.210000,0.000000,21.630000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 82k 0207/10
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<49.530000,0.000000,19.150000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 100E 0207/10
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_L("BF494",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.530000,0.000000,8.890000>}#end		//TO92 straight vertical T1 BF494 TO92-CEB
#ifndef(pack_X1) #declare global_pack_X1=yes; object {CON_BNC_W()translate<0,0,0> rotate<0,0.000000,0>rotate<0,90.000000,0> rotate<0,0,0> translate<3.800000,0.000000,16.510000>}#end		//Connector PHOENIX type MSTBV vertical 10 pins X1 ANT AMP_227161
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<22.860000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.940000,0,6.050000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.940000,0,11.130000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,6.050000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,11.130000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<22.860000,0,24.160000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<17.780000,0,24.160000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<42.880000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<37.800000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.470000,0,24.100000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.930000,0,24.100000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.500000,0,6.330000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.500000,0,8.870000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.500000,0,23.730000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.500000,0,26.270000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<22.570000,0,11.140000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<22.570000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<20.320000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<18.070000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<18.070000,0,11.140000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<24.070000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<16.570000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<37.810000,0,11.140000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<37.810000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<33.310000,0,6.640000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<33.310000,0,11.140000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<39.310000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<31.810000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_L3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.720000,0,20.110000> texture{col_thl}}
#ifndef(global_pack_L3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<63.880000,0,12.490000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<45.290000,0,21.630000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.130000,0,21.630000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,14.070000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,24.230000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.530000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.530000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.530000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,13.970000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.500000,-1.535000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.500000,-1.535000,18.800000>}
box{<0,0,-0.304800><3.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.500000,-1.535000,18.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.500000,-1.535000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.800000,-1.535000,14.000000>}
box{<0,0,-0.304800><1.838478,0.035000,0.304800> rotate<0,44.997030,0> translate<8.500000,-1.535000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,8.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,11.000000>}
box{<0,0,-0.304800><2.400000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.400000,-1.535000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,13.940000>}
box{<0,0,-0.304800><2.940000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.400000,-1.535000,13.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.800000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,14.000000>}
box{<0,0,-0.304800><1.600000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.800000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,13.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,13.970000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.400000,-1.535000,13.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,13.970000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,44.997030,0> translate<11.400000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.540000,-1.535000,11.140000>}
box{<0,0,-0.304800><0.197990,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.400000,-1.535000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.500000,-1.535000,18.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.860000,-1.535000,24.160000>}
box{<0,0,-0.304800><7.580185,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.500000,-1.535000,18.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.400000,-1.535000,8.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.000000,-1.535000,4.000000>}
box{<0,0,-0.304800><6.505382,0.035000,0.304800> rotate<0,44.997030,0> translate<11.400000,-1.535000,8.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.540000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.300000,-1.535000,11.140000>}
box{<0,0,-0.304800><4.760000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.540000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.570000,-1.535000,11.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.570000,-1.535000,8.890000>}
box{<0,0,-0.304800><2.220000,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.570000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.300000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.600000,-1.535000,11.140000>}
box{<0,0,-0.304800><0.300000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.300000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.570000,-1.535000,11.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.600000,-1.535000,11.140000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.570000,-1.535000,11.110000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,16.510000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.430000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.860000,-1.535000,24.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,24.160000>}
box{<0,0,-0.304800><3.920000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.860000,-1.535000,24.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.600000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.070000,-1.535000,11.140000>}
box{<0,0,-0.304800><1.470000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.600000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.000000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,-1.535000,4.000000>}
box{<0,0,-0.304800><9.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.000000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,4.000000>}
box{<0,0,-0.304800><0.300000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.000000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.070000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,7.660000>}
box{<0,0,-0.304800><1.739483,0.035000,0.304800> rotate<0,44.997030,0> translate<24.070000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,7.660000>}
box{<0,0,-0.304800><3.660000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.300000,-1.535000,7.660000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.570000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,11.140000>}
box{<0,0,-0.304800><2.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.570000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,16.510000>}
box{<0,0,-0.304800><5.370000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.300000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,24.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.600000,-1.535000,26.900000>}
box{<0,0,-0.304800><3.874945,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.860000,-1.535000,24.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,8.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,6.090000>}
box{<0,0,-0.304800><1.910000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.900000,-1.535000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,4.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,8.000000>}
box{<0,0,-0.304800><3.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.900000,-1.535000,8.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,21.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,24.120000>}
box{<0,0,-0.304800><2.420000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.900000,-1.535000,24.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,6.090000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,6.050000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,44.997030,0> translate<27.900000,-1.535000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,11.130000>}
box{<0,0,-0.304800><0.010000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.940000,-1.535000,11.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,11.140000>}
box{<0,0,-0.304800><2.640000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.300000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,16.510000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.860000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,16.510000>}
box{<0,0,-0.304800><2.640000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.300000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.100000,-1.535000,4.000000>}
box{<0,0,-0.304800><2.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.300000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,4.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.100000,-1.535000,4.000000>}
box{<0,0,-0.304800><0.282843,0.035000,0.304800> rotate<0,44.997030,0> translate<27.900000,-1.535000,4.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,21.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.000000,-1.535000,20.600000>}
box{<0,0,-0.304800><1.555635,0.035000,0.304800> rotate<0,44.997030,0> translate<27.900000,-1.535000,21.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.000000,-1.535000,20.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.100000,-1.535000,20.600000>}
box{<0,0,-0.304800><1.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.000000,-1.535000,20.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.470000,-1.535000,26.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.470000,-1.535000,24.100000>}
box{<0,0,-0.304800><2.770000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.470000,-1.535000,24.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.600000,-1.535000,26.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,26.900000>}
box{<0,0,-0.304800><4.900000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.600000,-1.535000,26.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.470000,-1.535000,26.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,26.900000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.470000,-1.535000,26.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.490000,-1.535000,26.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,26.900000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.490000,-1.535000,26.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.900000,-1.535000,8.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.040000,-1.535000,11.140000>}
box{<0,0,-0.304800><4.440631,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.900000,-1.535000,8.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.040000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.800000,-1.535000,11.140000>}
box{<0,0,-0.304800><0.760000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.040000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.810000,-1.535000,11.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.810000,-1.535000,8.890000>}
box{<0,0,-0.304800><2.240000,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.810000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.800000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.810000,-1.535000,11.130000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<31.800000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.800000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.310000,-1.535000,11.140000>}
box{<0,0,-0.304800><1.510000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.800000,-1.535000,11.140000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.100000,-1.535000,20.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.060000,-1.535000,20.600000>}
box{<0,0,-0.304800><3.960000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.100000,-1.535000,20.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.060000,-1.535000,20.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.110000,-1.535000,21.650000>}
box{<0,0,-0.304800><1.484924,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.060000,-1.535000,20.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.110000,-1.535000,21.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.130000,-1.535000,21.630000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<35.110000,-1.535000,21.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.800000,-1.535000,16.510000>}
box{<0,0,-0.304800><4.780000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.020000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,11.130000>}
box{<0,0,-0.304800><0.010000,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.810000,-1.535000,11.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.800000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,16.510000>}
box{<0,0,-0.304800><0.010000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.800000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,11.140000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,16.510000>}
box{<0,0,-0.304800><5.370000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.810000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.100000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,-1.535000,4.000000>}
box{<0,0,-0.304800><12.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.100000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.310000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,-1.535000,7.600000>}
box{<0,0,-0.304800><1.824335,0.035000,0.304800> rotate<0,44.997030,0> translate<39.310000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,-1.535000,7.600000>}
box{<0,0,-0.304800><3.600000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.600000,-1.535000,7.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.100000,-1.535000,4.000000>}
box{<0,0,-0.304800><2.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.600000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.100000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,4.080000>}
box{<0,0,-0.304800><0.113137,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.100000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,4.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,6.050000>}
box{<0,0,-0.304800><1.970000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.180000,-1.535000,6.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.810000,-1.535000,11.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,11.130000>}
box{<0,0,-0.304800><5.370000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.810000,-1.535000,11.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.880000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.290000,-1.535000,16.510000>}
box{<0,0,-0.304800><2.410000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.880000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.290000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.290000,-1.535000,21.630000>}
box{<0,0,-0.304800><5.120000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.290000,-1.535000,21.630000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.100000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.500000,-1.535000,4.000000>}
box{<0,0,-0.304800><2.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.100000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.500000,-1.535000,26.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.400000,-1.535000,26.900000>}
box{<0,0,-0.304800><15.900000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.500000,-1.535000,26.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.500000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,5.000000>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.500000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,7.900000>}
box{<0,0,-0.304800><2.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<46.500000,-1.535000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,12.300000>}
box{<0,0,-0.304800><3.000000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.500000,-1.535000,12.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.290000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,15.300000>}
box{<0,0,-0.304800><1.711198,0.035000,0.304800> rotate<0,44.997030,0> translate<45.290000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.400000,-1.535000,26.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.860000,-1.535000,26.900000>}
box{<0,0,-0.304800><0.460000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.400000,-1.535000,26.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,12.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.400000,-1.535000,11.400000>}
box{<0,0,-0.304800><1.272792,0.035000,0.304800> rotate<0,44.997030,0> translate<46.500000,-1.535000,12.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.500000,-1.535000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.490000,-1.535000,8.890000>}
box{<0,0,-0.304800><1.400071,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.500000,-1.535000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.400000,-1.535000,11.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.500000,-1.535000,11.400000>}
box{<0,0,-0.304800><2.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.400000,-1.535000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.490000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,8.890000>}
box{<0,0,-0.304800><2.040000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.490000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.500000,-1.535000,11.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,11.430000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.500000,-1.535000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.860000,-1.535000,26.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,24.230000>}
box{<0,0,-0.304800><3.775950,0.035000,0.304800> rotate<0,44.997030,0> translate<46.860000,-1.535000,26.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.490000,-1.535000,24.190000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,24.230000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.490000,-1.535000,24.190000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.620000,-1.535000,8.800000>}
box{<0,0,-0.304800><0.127279,0.035000,0.304800> rotate<0,44.997030,0> translate<49.530000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.620000,-1.535000,8.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.100000,-1.535000,8.800000>}
box{<0,0,-0.304800><2.480000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.620000,-1.535000,8.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,24.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.650000,-1.535000,20.110000>}
box{<0,0,-0.304800><5.826560,0.035000,0.304800> rotate<0,44.997030,0> translate<49.530000,-1.535000,24.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.650000,-1.535000,20.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.720000,-1.535000,20.110000>}
box{<0,0,-0.304800><0.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.650000,-1.535000,20.110000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,14.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.970000,-1.535000,14.070000>}
box{<0,0,-0.304800><4.440000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.530000,-1.535000,14.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.100000,-1.535000,8.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.000000,-1.535000,14.700000>}
box{<0,0,-0.304800><8.343860,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.100000,-1.535000,8.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.480000,-1.535000,6.350000>}
box{<0,0,-0.304800><8.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.530000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.480000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,6.330000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<58.480000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.970000,-1.535000,14.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,18.600000>}
box{<0,0,-0.304800><6.406387,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.970000,-1.535000,14.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,18.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,23.730000>}
box{<0,0,-0.304800><5.130000,0.035000,0.304800> rotate<0,90.000000,0> translate<58.500000,-1.535000,23.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.500000,-1.535000,6.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.330000,-1.535000,6.330000>}
box{<0,0,-0.304800><2.830000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.500000,-1.535000,6.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.000000,-1.535000,14.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.830000,-1.535000,14.700000>}
box{<0,0,-0.304800><5.830000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.000000,-1.535000,14.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.330000,-1.535000,6.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.900000,-1.535000,8.900000>}
box{<0,0,-0.304800><3.634529,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.330000,-1.535000,6.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.880000,-1.535000,12.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.900000,-1.535000,12.470000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<63.880000,-1.535000,12.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.900000,-1.535000,8.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.900000,-1.535000,12.470000>}
box{<0,0,-0.304800><3.570000,0.035000,0.304800> rotate<0,90.000000,0> translate<63.900000,-1.535000,12.470000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.789300>}
box{<0,0,-0.203200><21.828700,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219100,-1.535000,26.789300> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,6.908800>}
box{<0,0,-0.203200><14.980100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.324800,-1.535000,7.315200>}
box{<0,0,-0.203200><15.105700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.505900,-1.535000,7.721600>}
box{<0,0,-0.203200><15.286800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.912300,-1.535000,8.128000>}
box{<0,0,-0.203200><15.693200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.666600,-1.535000,8.534400>}
box{<0,0,-0.203200><60.447500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.073000,-1.535000,8.940800>}
box{<0,0,-0.203200><60.853900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.579100,-1.535000,9.347200>}
box{<0,0,-0.203200><4.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.887900,-1.535000,9.753600>}
box{<0,0,-0.203200><3.668800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.481500,-1.535000,10.160000>}
box{<0,0,-0.203200><3.262400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.305600,-1.535000,10.566400>}
box{<0,0,-0.203200><3.086500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.137300,-1.535000,10.972800>}
box{<0,0,-0.203200><2.918200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,11.379200>}
box{<0,0,-0.203200><2.911700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,11.785600>}
box{<0,0,-0.203200><2.911700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.263600,-1.535000,12.192000>}
box{<0,0,-0.203200><3.044500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.432000,-1.535000,12.598400>}
box{<0,0,-0.203200><3.212900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.786400,-1.535000,13.004800>}
box{<0,0,-0.203200><3.567300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334200,-1.535000,13.411200>}
box{<0,0,-0.203200><4.115100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,13.817600>}
box{<0,0,-0.203200><22.760100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,14.224000>}
box{<0,0,-0.203200><22.760100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,14.630400>}
box{<0,0,-0.203200><22.760100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.398900,-1.535000,15.036800>}
box{<0,0,-0.203200><9.179800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.992500,-1.535000,15.443200>}
box{<0,0,-0.203200><8.773400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.786800,-1.535000,15.849600>}
box{<0,0,-0.203200><8.567700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.256000>}
box{<0,0,-0.203200><8.440100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.662400>}
box{<0,0,-0.203200><8.440100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.744800,-1.535000,17.068800>}
box{<0,0,-0.203200><8.525700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.913200,-1.535000,17.475200>}
box{<0,0,-0.203200><8.694100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.297400,-1.535000,17.881600>}
box{<0,0,-0.203200><9.078300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,18.288000>}
box{<0,0,-0.203200><42.750100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,18.694400>}
box{<0,0,-0.203200><42.750100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,19.100800>}
box{<0,0,-0.203200><42.750100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.579100,-1.535000,19.507200>}
box{<0,0,-0.203200><4.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.887900,-1.535000,19.913600>}
box{<0,0,-0.203200><3.668800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.481500,-1.535000,20.320000>}
box{<0,0,-0.203200><3.262400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.305600,-1.535000,20.726400>}
box{<0,0,-0.203200><3.086500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.137300,-1.535000,21.132800>}
box{<0,0,-0.203200><2.918200,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,21.539200>}
box{<0,0,-0.203200><2.911700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,21.945600>}
box{<0,0,-0.203200><2.911700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.263600,-1.535000,22.352000>}
box{<0,0,-0.203200><3.044500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.432000,-1.535000,22.758400>}
box{<0,0,-0.203200><3.212900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.786400,-1.535000,23.164800>}
box{<0,0,-0.203200><3.567300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334200,-1.535000,23.571200>}
box{<0,0,-0.203200><4.115100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,23.977600>}
box{<0,0,-0.203200><19.913700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,24.384000>}
box{<0,0,-0.203200><19.913700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,24.790400>}
box{<0,0,-0.203200><19.913700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.155100,-1.535000,25.196800>}
box{<0,0,-0.203200><1.936000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.219000,-1.535000,25.603200>}
box{<0,0,-0.203200><0.999900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.753400,-1.535000,26.009600>}
box{<0,0,-0.203200><0.534300,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.434500,-1.535000,26.416000>}
box{<0,0,-0.203200><0.215400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219100,-1.535000,26.789300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,26.208900>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,60.003007,0> translate<1.219100,-1.535000,26.789300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.554100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.554100,-1.535000,26.208900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,25.684100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<1.554100,-1.535000,26.208900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<2.078900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.078900,-1.535000,25.684100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,25.312900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<2.078900,-1.535000,25.684100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<2.721800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.721800,-1.535000,25.312900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,25.120800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<2.721800,-1.535000,25.312900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.438800,-1.535000,25.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,25.120800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<3.438800,-1.535000,25.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,10.988500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,10.172900>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,67.497499,0> translate<4.130800,-1.535000,10.988500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,11.871400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,10.988500>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.130800,-1.535000,10.988500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,11.871400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,12.687000>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-67.497499,0> translate<4.130800,-1.535000,11.871400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,21.148500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,20.332900>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,67.497499,0> translate<4.130800,-1.535000,21.148500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,22.031400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,21.148500>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.130800,-1.535000,21.148500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.130800,-1.535000,22.031400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,22.847000>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-67.497499,0> translate<4.130800,-1.535000,22.031400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<4.181100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181100,-1.535000,25.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,25.312900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<4.181100,-1.535000,25.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.464700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.454300,-1.535000,25.196800>}
box{<0,0,-0.203200><16.989600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.464700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,10.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,9.548600>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,44.997030,0> translate<4.468600,-1.535000,10.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,12.687000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,13.311300>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.468600,-1.535000,12.687000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,20.332900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,19.708600>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,44.997030,0> translate<4.468600,-1.535000,20.332900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.468600,-1.535000,22.847000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,23.471300>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.468600,-1.535000,22.847000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.654000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,6.502400>}
box{<0,0,-0.203200><11.545200,0.035000,0.203200> rotate<0,0.000000,0> translate<4.654000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<4.898100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898100,-1.535000,25.312900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,25.684100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<4.898100,-1.535000,25.312900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,-29.991053,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960600,-1.535000,1.219100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.889300,-1.535000,1.219100>}
box{<0,0,-0.203200><59.928700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960600,-1.535000,1.219100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960700,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.889100,-1.535000,1.219200>}
box{<0,0,-0.203200><59.928400,0.035000,0.203200> rotate<0,0.000000,0> translate<4.960700,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.977900,-1.535000,30.520800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,30.195800>}
box{<0,0,-0.203200><0.650159,0.035000,0.203200> rotate<0,29.989936,0> translate<4.977900,-1.535000,30.520800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.977900,-1.535000,30.520800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.872000,-1.535000,30.520800>}
box{<0,0,-0.203200><59.894100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.977900,-1.535000,30.520800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.048600,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.801400,-1.535000,30.480000>}
box{<0,0,-0.203200><59.752800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.048600,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,9.548600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,9.210800>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,22.496562,0> translate<5.092900,-1.535000,9.548600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,13.311300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,13.649100>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-22.496562,0> translate<5.092900,-1.535000,13.311300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,19.708600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,19.370800>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,22.496562,0> translate<5.092900,-1.535000,19.708600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.092900,-1.535000,23.471300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,23.809100>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-22.496562,0> translate<5.092900,-1.535000,23.471300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.400800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.860700,-1.535000,25.603200>}
box{<0,0,-0.203200><16.459900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.400800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.270300,-1.535000,6.096000>}
box{<0,0,-0.203200><10.781600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.488700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<5.541000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,25.684100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,26.208900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.541000,-1.535000,25.684100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.541000,-1.535000,30.195800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,29.671000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<5.541000,-1.535000,30.195800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.612500,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.237400,-1.535000,1.625600>}
box{<0,0,-0.203200><58.624900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.612500,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.663200,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.186700,-1.535000,30.073600>}
box{<0,0,-0.203200><58.523500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.663200,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.866500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.841800,-1.535000,26.009600>}
box{<0,0,-0.203200><16.975300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.866500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,9.210800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,9.210800>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.908500,-1.535000,9.210800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,13.649100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,13.649100>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.908500,-1.535000,13.649100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,19.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,19.370800>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.908500,-1.535000,19.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908500,-1.535000,23.809100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,23.809100>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.908500,-1.535000,23.809100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.917200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.438600,-1.535000,5.689600>}
box{<0,0,-0.203200><10.521400,0.035000,0.203200> rotate<0,0.000000,0> translate<5.917200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.018900,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.831000,-1.535000,2.032000>}
box{<0,0,-0.203200><57.812100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.018900,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,26.208900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,26.851800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<6.065800,-1.535000,26.208900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.065800,-1.535000,29.671000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,29.028100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<6.065800,-1.535000,29.671000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.068000,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.782000,-1.535000,29.667200>}
box{<0,0,-0.203200><57.714000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.068000,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.185300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.248200,-1.535000,26.416000>}
box{<0,0,-0.203200><17.062900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.185300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.214700,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781000,-1.535000,5.283200>}
box{<0,0,-0.203200><10.566300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.214700,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.273300,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.576500,-1.535000,2.438400>}
box{<0,0,-0.203200><57.303200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.273300,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.302700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.547300,-1.535000,29.260800>}
box{<0,0,-0.203200><57.244600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.302700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.420000,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.654600,-1.535000,26.822400>}
box{<0,0,-0.203200><17.234600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.420000,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,26.851800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,27.568800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<6.437000,-1.535000,26.851800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.437000,-1.535000,29.028100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,28.311100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<6.437000,-1.535000,29.028100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.442800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.438000,-1.535000,4.876800>}
box{<0,0,-0.203200><10.995200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.442800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.469900,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.379900,-1.535000,2.844800>}
box{<0,0,-0.203200><56.910000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.469900,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.483600,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.366400,-1.535000,28.854400>}
box{<0,0,-0.203200><56.882800,0.035000,0.203200> rotate<0,0.000000,0> translate<6.483600,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.538000,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.061000,-1.535000,27.228800>}
box{<0,0,-0.203200><17.523000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.538000,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.551600,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.298400,-1.535000,4.470400>}
box{<0,0,-0.203200><56.746800,0.035000,0.203200> rotate<0,0.000000,0> translate<6.551600,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.578800,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.271000,-1.535000,3.251200>}
box{<0,0,-0.203200><56.692200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.578800,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.592500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.257500,-1.535000,28.448000>}
box{<0,0,-0.203200><56.665000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.592500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.181100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,3.657600>}
box{<0,0,-0.203200><56.591700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,4.064000>}
box{<0,0,-0.203200><56.591700,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,27.568800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,28.311100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,90.000000,0> translate<6.629100,-1.535000,28.311100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.467400,-1.535000,27.635200>}
box{<0,0,-0.203200><17.838300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.629100,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.905000,-1.535000,28.041600>}
box{<0,0,-0.203200><18.275900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.629100,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,9.210800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,9.548600>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-22.496562,0> translate<6.791400,-1.535000,9.210800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,13.649100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,13.311300>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,22.496562,0> translate<6.791400,-1.535000,13.649100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,19.370800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,19.708600>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-22.496562,0> translate<6.791400,-1.535000,19.370800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791400,-1.535000,23.809100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,23.471300>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,22.496562,0> translate<6.791400,-1.535000,23.809100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120700,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.009400,-1.535000,9.347200>}
box{<0,0,-0.203200><14.888700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120700,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.224900,-1.535000,19.507200>}
box{<0,0,-0.203200><21.104200,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365800,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,13.411200>}
box{<0,0,-0.203200><16.613400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365800,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365800,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,23.571200>}
box{<0,0,-0.203200><13.767000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365800,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,9.548600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,10.172900>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.607000,-1.535000,9.548600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,13.311300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,12.687000>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,44.997030,0> translate<7.607000,-1.535000,13.311300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,19.708600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,20.332900>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.607000,-1.535000,19.708600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607000,-1.535000,23.471300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,22.847000>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,44.997030,0> translate<7.607000,-1.535000,23.471300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.812000,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.310600,-1.535000,9.753600>}
box{<0,0,-0.203200><13.498600,0.035000,0.203200> rotate<0,0.000000,0> translate<7.812000,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.812000,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818500,-1.535000,19.913600>}
box{<0,0,-0.203200><20.006500,0.035000,0.203200> rotate<0,0.000000,0> translate<7.812000,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.913500,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.183600,-1.535000,13.004800>}
box{<0,0,-0.203200><14.270100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.913500,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.913500,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.412600,-1.535000,23.164800>}
box{<0,0,-0.203200><13.499100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.913500,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.218400,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.950900,-1.535000,10.160000>}
box{<0,0,-0.203200><12.732500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.218400,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.218400,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.412100,-1.535000,20.320000>}
box{<0,0,-0.203200><19.193700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.218400,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,10.172900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,10.988500>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-67.497499,0> translate<8.231300,-1.535000,10.172900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,12.687000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,11.871400>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,67.497499,0> translate<8.231300,-1.535000,12.687000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,20.332900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,21.148500>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,-67.497499,0> translate<8.231300,-1.535000,20.332900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.231300,-1.535000,22.847000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,22.031400>}
box{<0,0,-0.203200><0.882787,0.035000,0.203200> rotate<0,67.497499,0> translate<8.231300,-1.535000,22.847000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.268000,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.382700,-1.535000,12.598400>}
box{<0,0,-0.203200><13.114700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.268000,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.268000,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.819000,-1.535000,22.758400>}
box{<0,0,-0.203200><13.551000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.268000,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.394200,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.782600,-1.535000,10.566400>}
box{<0,0,-0.203200><12.388400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.394200,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.394200,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.005700,-1.535000,20.726400>}
box{<0,0,-0.203200><18.611500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.394200,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.436400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980900,-1.535000,12.192000>}
box{<0,0,-0.203200><12.544500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.436400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.436400,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.337800,-1.535000,22.352000>}
box{<0,0,-0.203200><17.901400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.436400,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.562500,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,10.972800>}
box{<0,0,-0.203200><12.136700,0.035000,0.203200> rotate<0,0.000000,0> translate<8.562500,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.562500,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705300,-1.535000,21.132800>}
box{<0,0,-0.203200><18.142800,0.035000,0.203200> rotate<0,0.000000,0> translate<8.562500,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,10.988500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,11.871400>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,90.000000,0> translate<8.569100,-1.535000,11.871400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,11.379200>}
box{<0,0,-0.203200><12.130100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.569100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.812500,-1.535000,11.785600>}
box{<0,0,-0.203200><12.243400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.569100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,21.148500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,22.031400>}
box{<0,0,-0.203200><0.882900,0.035000,0.203200> rotate<0,90.000000,0> translate<8.569100,-1.535000,22.031400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,21.539200>}
box{<0,0,-0.203200><18.010100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.569100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,21.945600>}
box{<0,0,-0.203200><18.010100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.569100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.157700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.928800,-1.535000,15.506900>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,67.493305,0> translate<9.659200,-1.535000,16.157700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.862200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.157700>}
box{<0,0,-0.203200><0.704500,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.659200,-1.535000,16.157700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.659200,-1.535000,16.862200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.928800,-1.535000,17.513000>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,-67.493305,0> translate<9.659200,-1.535000,16.862200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.928800,-1.535000,15.506900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.426900,-1.535000,15.008800>}
box{<0,0,-0.203200><0.704420,0.035000,0.203200> rotate<0,44.997030,0> translate<9.928800,-1.535000,15.506900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.928800,-1.535000,17.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.426900,-1.535000,18.011100>}
box{<0,0,-0.203200><0.704420,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.928800,-1.535000,17.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.426900,-1.535000,15.008800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.077700,-1.535000,14.739200>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,22.500755,0> translate<10.426900,-1.535000,15.008800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.426900,-1.535000,18.011100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.077700,-1.535000,18.280700>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,-22.500755,0> translate<10.426900,-1.535000,18.011100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.077700,-1.535000,14.739200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.782200,-1.535000,14.739200>}
box{<0,0,-0.203200><0.704500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.077700,-1.535000,14.739200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.077700,-1.535000,18.280700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.782200,-1.535000,18.280700>}
box{<0,0,-0.203200><0.704500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.077700,-1.535000,18.280700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.782200,-1.535000,14.739200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.433000,-1.535000,15.008800>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,-22.500755,0> translate<11.782200,-1.535000,14.739200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.782200,-1.535000,18.280700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.433000,-1.535000,18.011100>}
box{<0,0,-0.203200><0.704432,0.035000,0.203200> rotate<0,22.500755,0> translate<11.782200,-1.535000,18.280700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.433000,-1.535000,15.008800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.613400,-1.535000,15.189200>}
box{<0,0,-0.203200><0.255124,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.433000,-1.535000,15.008800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.433000,-1.535000,18.011100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.613400,-1.535000,17.830700>}
box{<0,0,-0.203200><0.255124,0.035000,0.203200> rotate<0,44.997030,0> translate<12.433000,-1.535000,18.011100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.461000,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.810600,-1.535000,15.036800>}
box{<0,0,-0.203200><4.349600,0.035000,0.203200> rotate<0,0.000000,0> translate<12.461000,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.562500,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.709100,-1.535000,17.881600>}
box{<0,0,-0.203200><4.146600,0.035000,0.203200> rotate<0,0.000000,0> translate<12.562500,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.613400,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.658200,-1.535000,15.189200>}
box{<0,0,-0.203200><4.044800,0.035000,0.203200> rotate<0,0.000000,0> translate<12.613400,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.613400,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.658200,-1.535000,17.830700>}
box{<0,0,-0.203200><4.044800,0.035000,0.203200> rotate<0,0.000000,0> translate<12.613400,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,6.267800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.484000,-1.535000,5.580200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<16.199200,-1.535000,6.267800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,7.012100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,6.267800>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.199200,-1.535000,6.267800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.199200,-1.535000,7.012100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.484000,-1.535000,7.699700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<16.199200,-1.535000,7.012100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.484000,-1.535000,5.580200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.010200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<16.484000,-1.535000,5.580200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.484000,-1.535000,7.699700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.010200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.484000,-1.535000,7.699700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.658200,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.064600,-1.535000,14.782800>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<16.658200,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.658200,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.064600,-1.535000,18.237100>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.658200,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.010200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.697800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<17.010200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.010200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.697800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<17.010200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.064600,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.495300,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.064600,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.064600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.495300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.064600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.697800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.442100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.697800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.697800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.442100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.697800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.442100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.129700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<18.442100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.442100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.129700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<18.442100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.495300,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,15.794600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.495300,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.495300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<18.495300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.701800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.688000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.986200,0.035000,0.203200> rotate<0,0.000000,0> translate<18.701800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.749300,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.890600,-1.535000,15.036800>}
box{<0,0,-0.203200><3.141300,0.035000,0.203200> rotate<0,0.000000,0> translate<18.749300,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.850800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.789100,-1.535000,17.881600>}
box{<0,0,-0.203200><2.938300,0.035000,0.203200> rotate<0,0.000000,0> translate<18.850800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.129700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.194900,-1.535000,5.119300>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,-45.040932,0> translate<19.129700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.129700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.194900,-1.535000,8.160600>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,45.040932,0> translate<19.129700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.155700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.484200,-1.535000,15.443200>}
box{<0,0,-0.203200><2.328500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.155700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.194900,-1.535000,5.119300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.260200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,44.997030,0> translate<19.194900,-1.535000,5.119300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.194900,-1.535000,8.160600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.260200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.194900,-1.535000,8.160600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.257200,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.382700,-1.535000,17.475200>}
box{<0,0,-0.203200><2.125500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.257200,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.260200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.947800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<19.260200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.260200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.947800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<19.260200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<19.507100,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.507100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,16.256000>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.507100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,16.662400>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.507100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.507100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,17.068800>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.507100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.947800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.692100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.947800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.947800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.692100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.947800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.692100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.379700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<20.692100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.692100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.379700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<20.692100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,10.767800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.984000,-1.535000,10.080200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<20.699200,-1.535000,10.767800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,11.512100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,10.767800>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.699200,-1.535000,10.767800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.699200,-1.535000,11.512100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.984000,-1.535000,12.199700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<20.699200,-1.535000,11.512100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.951800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.938000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.986200,0.035000,0.203200> rotate<0,0.000000,0> translate<20.951800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.984000,-1.535000,10.080200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,9.554000>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<20.984000,-1.535000,10.080200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.984000,-1.535000,12.199700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,12.725900>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.984000,-1.535000,12.199700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<21.132800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,15.794600>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.132800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.132800,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,23.444600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,22.432800>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<21.132800,-1.535000,23.444600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,24.875300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,23.444600>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.132800,-1.535000,23.444600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.132800,-1.535000,24.875300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,25.887100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.132800,-1.535000,24.875300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.379700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.445000,-1.535000,5.119300>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.379700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.379700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.445000,-1.535000,8.160600>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,44.997030,0> translate<21.379700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.445000,-1.535000,5.119300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,45.040932,0> translate<21.445000,-1.535000,5.119300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.445000,-1.535000,8.160600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,-45.040932,0> translate<21.445000,-1.535000,8.160600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<21.510200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<21.510200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,9.554000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,9.269200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<21.510200,-1.535000,9.554000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.510200,-1.535000,12.725900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,13.010700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<21.510200,-1.535000,12.725900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.144600,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.144600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,22.432800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,22.432800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.144600,-1.535000,22.432800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.144600,-1.535000,25.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.719300,-1.535000,25.887100>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<22.144600,-1.535000,25.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.197800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.197800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,9.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,9.269200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.197800,-1.535000,9.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.197800,-1.535000,13.010700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,13.010700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.197800,-1.535000,13.010700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.719300,-1.535000,25.887100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.480300,-1.535000,27.648100>}
box{<0,0,-0.203200><2.490430,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.719300,-1.535000,25.887100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<22.942100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<22.942100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,9.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,9.554000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<22.942100,-1.535000,9.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942100,-1.535000,13.010700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,12.725900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<22.942100,-1.535000,13.010700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.956400,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,13.004800>}
box{<0,0,-0.203200><1.022800,0.035000,0.203200> rotate<0,0.000000,0> translate<22.956400,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.130400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.249400,-1.535000,9.347200>}
box{<0,0,-0.203200><14.119000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.130400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.201800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.678000,-1.535000,4.876800>}
box{<0,0,-0.203200><9.476200,0.035000,0.203200> rotate<0,0.000000,0> translate<23.201800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,15.186800>}
box{<0,0,-0.203200><0.571272,0.035000,0.203200> rotate<0,-45.004122,0> translate<23.575300,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.981600,-1.535000,17.830700>}
box{<0,0,-0.203200><0.574666,0.035000,0.203200> rotate<0,45.004080,0> translate<23.575300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.575300,-1.535000,22.432800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,23.444600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.575300,-1.535000,22.432800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155900,-1.535000,5.580200>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.629700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155900,-1.535000,7.699700>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<23.629700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,9.554000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.894900,-1.535000,9.819200>}
box{<0,0,-0.203200><0.375049,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.629700,-1.535000,9.554000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.629700,-1.535000,12.725900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.894900,-1.535000,12.460700>}
box{<0,0,-0.203200><0.375049,0.035000,0.203200> rotate<0,44.997030,0> translate<23.629700,-1.535000,12.725900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.727600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.152300,-1.535000,8.128000>}
box{<0,0,-0.203200><8.424700,0.035000,0.203200> rotate<0,0.000000,0> translate<23.727600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.757200,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,12.598400>}
box{<0,0,-0.203200><0.222000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.757200,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.829200,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,15.036800>}
box{<0,0,-0.203200><0.150000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.829200,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.829300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.873800,-1.535000,9.753600>}
box{<0,0,-0.203200><3.044500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.829300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.858900,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.021000,-1.535000,5.283200>}
box{<0,0,-0.203200><8.162100,0.035000,0.203200> rotate<0,0.000000,0> translate<23.858900,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.894900,-1.535000,9.819200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.562700,-1.535000,9.819200>}
box{<0,0,-0.203200><1.667800,0.035000,0.203200> rotate<0,0.000000,0> translate<23.894900,-1.535000,9.819200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.894900,-1.535000,12.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,12.460700>}
box{<0,0,-0.203200><0.084300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.894900,-1.535000,12.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.900900,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.169500,-1.535000,22.758400>}
box{<0,0,-0.203200><2.268600,0.035000,0.203200> rotate<0,0.000000,0> translate<23.900900,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.930800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.869200,-1.535000,17.881600>}
box{<0,0,-0.203200><2.938400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.930800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,15.186800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.979200,-1.535000,12.460700>}
box{<0,0,-0.203200><2.726100,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.979200,-1.535000,12.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.981600,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.037200,-1.535000,17.830700>}
box{<0,0,-0.203200><1.055600,0.035000,0.203200> rotate<0,0.000000,0> translate<23.981600,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.134000,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.745900,-1.535000,7.721600>}
box{<0,0,-0.203200><7.611900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.134000,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155900,-1.535000,5.580200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,6.267800>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<24.155900,-1.535000,5.580200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.155900,-1.535000,7.699700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,7.012100>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<24.155900,-1.535000,7.699700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.201200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.678600,-1.535000,5.689600>}
box{<0,0,-0.203200><7.477400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.201200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.307300,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,23.164800>}
box{<0,0,-0.203200><1.793900,0.035000,0.203200> rotate<0,0.000000,0> translate<24.307300,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.315200,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.564800,-1.535000,7.315200>}
box{<0,0,-0.203200><7.249600,0.035000,0.203200> rotate<0,0.000000,0> translate<24.315200,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.369500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.510300,-1.535000,6.096000>}
box{<0,0,-0.203200><7.140800,0.035000,0.203200> rotate<0,0.000000,0> translate<24.369500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,6.267800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,7.012100>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,90.000000,0> translate<24.440700,-1.535000,7.012100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,6.502400>}
box{<0,0,-0.203200><6.998500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.440700,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.440700,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,6.908800>}
box{<0,0,-0.203200><6.998500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.440700,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.480300,-1.535000,27.648100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.851800,-1.535000,28.019600>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.480300,-1.535000,27.648100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,23.444600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,24.019300>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,90.000000,0> translate<24.587100,-1.535000,24.019300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,23.571200>}
box{<0,0,-0.203200><1.514100,0.035000,0.203200> rotate<0,0.000000,0> translate<24.587100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,23.977600>}
box{<0,0,-0.203200><1.514100,0.035000,0.203200> rotate<0,0.000000,0> translate<24.587100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.587100,-1.535000,24.019300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.147000,-1.535000,25.579200>}
box{<0,0,-0.203200><2.206032,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.587100,-1.535000,24.019300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.851800,-1.535000,28.019600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.337200,-1.535000,28.220700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<24.851800,-1.535000,28.019600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.951800,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,24.384000>}
box{<0,0,-0.203200><1.149400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.951800,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.037200,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.818300,-1.535000,17.830700>}
box{<0,0,-0.203200><1.781100,0.035000,0.203200> rotate<0,0.000000,0> translate<25.037200,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.337200,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.237200,-1.535000,28.220700>}
box{<0,0,-0.203200><4.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.337200,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.358200,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,24.790400>}
box{<0,0,-0.203200><0.743000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.358200,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.562700,-1.535000,9.819200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.808200,-1.535000,9.819200>}
box{<0,0,-0.203200><1.245500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.562700,-1.535000,9.819200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.764600,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,25.196800>}
box{<0,0,-0.203200><0.336600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.764600,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,22.923300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.379600,-1.535000,22.251200>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,67.495031,0> translate<26.101200,-1.535000,22.923300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,25.276600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,22.923300>}
box{<0,0,-0.203200><2.353300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.101200,-1.535000,22.923300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.101200,-1.535000,25.276600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.226600,-1.535000,25.579200>}
box{<0,0,-0.203200><0.327554,0.035000,0.203200> rotate<0,-67.486015,0> translate<26.101200,-1.535000,25.276600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.147000,-1.535000,25.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.226600,-1.535000,25.579200>}
box{<0,0,-0.203200><0.079600,0.035000,0.203200> rotate<0,0.000000,0> translate<26.147000,-1.535000,25.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.379600,-1.535000,22.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,22.051600>}
box{<0,0,-0.203200><0.282277,0.035000,0.203200> rotate<0,44.997030,0> translate<26.379600,-1.535000,22.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,21.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.780300,-1.535000,20.951800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<26.579200,-1.535000,21.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,22.051600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.579200,-1.535000,21.437200>}
box{<0,0,-0.203200><0.614400,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.579200,-1.535000,21.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,12.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,15.189200>}
box{<0,0,-0.203200><2.728500,0.035000,0.203200> rotate<0,90.000000,0> translate<26.620700,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,12.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.828200,-1.535000,12.460700>}
box{<0,0,-0.203200><0.207500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,12.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.965900,-1.535000,12.598400>}
box{<0,0,-0.203200><0.345200,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,13.004800>}
box{<0,0,-0.203200><9.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,13.411200>}
box{<0,0,-0.203200><9.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,13.817600>}
box{<0,0,-0.203200><9.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,14.224000>}
box{<0,0,-0.203200><9.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,14.630400>}
box{<0,0,-0.203200><9.868500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970600,-1.535000,15.036800>}
box{<0,0,-0.203200><0.349900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.620700,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.818300,-1.535000,15.189200>}
box{<0,0,-0.203200><0.197600,0.035000,0.203200> rotate<0,0.000000,0> translate<26.620700,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.780300,-1.535000,20.951800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.151800,-1.535000,20.580300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<26.780300,-1.535000,20.951800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.808200,-1.535000,9.819200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,9.402800>}
box{<0,0,-0.203200><0.588879,0.035000,0.203200> rotate<0,44.997030,0> translate<26.808200,-1.535000,9.819200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.818300,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,14.782800>}
box{<0,0,-0.203200><0.574666,0.035000,0.203200> rotate<0,45.004080,0> translate<26.818300,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.818300,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,18.237100>}
box{<0,0,-0.203200><0.574666,0.035000,0.203200> rotate<0,-45.004080,0> translate<26.818300,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.828200,-1.535000,12.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,12.857100>}
box{<0,0,-0.203200><0.560594,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.828200,-1.535000,12.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.151800,-1.535000,20.580300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.251800,-1.535000,19.480300>}
box{<0,0,-0.203200><1.555635,0.035000,0.203200> rotate<0,44.997030,0> translate<27.151800,-1.535000,20.580300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,9.402800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,9.402800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.224600,-1.535000,9.402800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,12.857100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,12.857100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.224600,-1.535000,12.857100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.224600,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.224600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.224600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.251800,-1.535000,19.480300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737200,-1.535000,19.279200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<28.251800,-1.535000,19.480300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,9.402800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,10.414600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.655300,-1.535000,9.402800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,12.857100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,11.845300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<28.655300,-1.535000,12.857100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,15.794600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.655300,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.655300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<28.655300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737200,-1.535000,19.279200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.262700,-1.535000,19.279200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.737200,-1.535000,19.279200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909300,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.050600,-1.535000,15.036800>}
box{<0,0,-0.203200><3.141300,0.035000,0.203200> rotate<0,0.000000,0> translate<28.909300,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.914000,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,12.598400>}
box{<0,0,-0.203200><7.575200,0.035000,0.203200> rotate<0,0.000000,0> translate<28.914000,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.006100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.550600,-1.535000,9.753600>}
box{<0,0,-0.203200><7.544500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.006100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.010800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.949100,-1.535000,17.881600>}
box{<0,0,-0.203200><2.938300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.010800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.262700,-1.535000,19.279200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.362700,-1.535000,19.279200>}
box{<0,0,-0.203200><1.100000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.262700,-1.535000,19.279200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.315700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.644200,-1.535000,15.443200>}
box{<0,0,-0.203200><2.328500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.315700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.320400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220900,-1.535000,12.192000>}
box{<0,0,-0.203200><6.900500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.320400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.412500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.190900,-1.535000,10.160000>}
box{<0,0,-0.203200><6.778400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.412500,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.417200,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.542700,-1.535000,17.475200>}
box{<0,0,-0.203200><2.125500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.417200,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,10.414600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,11.845300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<29.667100,-1.535000,11.845300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.022600,-1.535000,10.566400>}
box{<0,0,-0.203200><6.355500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,10.972800>}
box{<0,0,-0.203200><6.272100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,11.379200>}
box{<0,0,-0.203200><6.272100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.052500,-1.535000,11.785600>}
box{<0,0,-0.203200><6.385400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<29.667100,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,16.256000>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,16.662400>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.667100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,17.068800>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.667100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.237200,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.762700,-1.535000,28.220700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.237200,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.362700,-1.535000,19.279200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.322700,-1.535000,19.279200>}
box{<0,0,-0.203200><3.960000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.362700,-1.535000,19.279200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.762700,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.137200,-1.535000,28.220700>}
box{<0,0,-0.203200><15.374500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.762700,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.304600,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<31.292800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,15.794600>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.292800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.304600,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.292800,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,6.267800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.724000,-1.535000,5.580200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<31.439200,-1.535000,6.267800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,7.012100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,6.267800>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.439200,-1.535000,6.267800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.439200,-1.535000,7.012100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.724000,-1.535000,7.699700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<31.439200,-1.535000,7.012100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.689700,-1.535000,21.920700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.020300,-1.535000,22.251200>}
box{<0,0,-0.203200><0.467468,0.035000,0.203200> rotate<0,-44.988364,0> translate<31.689700,-1.535000,21.920700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.689700,-1.535000,21.920700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.402800,-1.535000,21.920700>}
box{<0,0,-0.203200><1.713100,0.035000,0.203200> rotate<0,0.000000,0> translate<31.689700,-1.535000,21.920700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.714600,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.402800,-1.535000,21.945600>}
box{<0,0,-0.203200><1.688200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.714600,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.724000,-1.535000,5.580200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.250200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<31.724000,-1.535000,5.580200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.724000,-1.535000,7.699700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.250200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.724000,-1.535000,7.699700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.020300,-1.535000,22.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,22.923300>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-67.495031,0> translate<32.020300,-1.535000,22.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.062000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.409500,-1.535000,22.352000>}
box{<0,0,-0.203200><1.347500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.062000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.173300,-1.535000,25.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,25.276600>}
box{<0,0,-0.203200><0.327554,0.035000,0.203200> rotate<0,67.486015,0> translate<32.173300,-1.535000,25.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.173300,-1.535000,25.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.137200,-1.535000,25.579200>}
box{<0,0,-0.203200><13.963900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.173300,-1.535000,25.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.230300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.815900,-1.535000,22.758400>}
box{<0,0,-0.203200><1.585600,0.035000,0.203200> rotate<0,0.000000,0> translate<32.230300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.250200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.937800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<32.250200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.250200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.937800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<32.250200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,22.923300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,25.276600>}
box{<0,0,-0.203200><2.353300,0.035000,0.203200> rotate<0,90.000000,0> translate<32.298700,-1.535000,25.276600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.222300,-1.535000,23.164800>}
box{<0,0,-0.203200><1.923600,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,23.571200>}
box{<0,0,-0.203200><15.504100,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,23.977600>}
box{<0,0,-0.203200><15.504100,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.508100,-1.535000,24.384000>}
box{<0,0,-0.203200><15.209400,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.101700,-1.535000,24.790400>}
box{<0,0,-0.203200><14.803000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.298700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.695300,-1.535000,25.196800>}
box{<0,0,-0.203200><14.396600,0.035000,0.203200> rotate<0,0.000000,0> translate<32.298700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.304600,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.735300,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<32.304600,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.304600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.735300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<32.304600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.937800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.682100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.937800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.937800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.682100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.937800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.402800,-1.535000,22.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.402800,-1.535000,21.920700>}
box{<0,0,-0.203200><0.424600,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.402800,-1.535000,21.920700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.402800,-1.535000,22.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.414600,-1.535000,23.357100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.402800,-1.535000,22.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.682100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.369700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<33.682100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.682100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.369700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<33.682100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.735300,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.141700,-1.535000,15.189200>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.735300,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.735300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.141700,-1.535000,17.830700>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<33.735300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.941800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.928000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.986200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.941800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.989300,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,15.036800>}
box{<0,0,-0.203200><2.499900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.989300,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.090800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.729100,-1.535000,17.881600>}
box{<0,0,-0.203200><2.638300,0.035000,0.203200> rotate<0,0.000000,0> translate<34.090800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.141700,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,15.189200>}
box{<0,0,-0.203200><2.347500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.141700,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.141700,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.678200,-1.535000,17.830700>}
box{<0,0,-0.203200><2.536500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.141700,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.322700,-1.535000,19.279200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808100,-1.535000,19.480300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<34.322700,-1.535000,19.279200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.369700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.434900,-1.535000,5.119300>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,-45.040932,0> translate<34.369700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.369700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.434900,-1.535000,8.160600>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,45.040932,0> translate<34.369700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.414600,-1.535000,23.357100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.845300,-1.535000,23.357100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.414600,-1.535000,23.357100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.434900,-1.535000,5.119300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.500200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,44.997030,0> translate<34.434900,-1.535000,5.119300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.434900,-1.535000,8.160600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.500200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.434900,-1.535000,8.160600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.500200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.187800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<34.500200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.500200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.187800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<34.500200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808100,-1.535000,19.480300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.179600,-1.535000,19.851800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.808100,-1.535000,19.480300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.835000,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,19.507200>}
box{<0,0,-0.203200><9.134200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.835000,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.179600,-1.535000,19.851800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.230500,-1.535000,19.902800>}
box{<0,0,-0.203200><0.072054,0.035000,0.203200> rotate<0,-45.053254,0> translate<35.179600,-1.535000,19.851800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.187800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.932100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.187800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.187800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.932100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.187800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.230500,-1.535000,19.902800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.845300,-1.535000,19.902800>}
box{<0,0,-0.203200><0.614800,0.035000,0.203200> rotate<0,0.000000,0> translate<35.230500,-1.535000,19.902800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.845300,-1.535000,19.902800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,20.914600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.845300,-1.535000,19.902800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.845300,-1.535000,23.357100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,22.345300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<35.845300,-1.535000,23.357100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.856100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,19.913600>}
box{<0,0,-0.203200><8.113100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.856100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.932100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.619700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<35.932100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.932100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.619700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<35.932100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,10.767800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.224000,-1.535000,10.080200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<35.939200,-1.535000,10.767800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,11.512100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,10.767800>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.939200,-1.535000,10.767800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.939200,-1.535000,11.512100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.224000,-1.535000,12.199700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<35.939200,-1.535000,11.512100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.037600,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.382300,-1.535000,23.164800>}
box{<0,0,-0.203200><8.344700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.037600,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.191800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.178000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.986200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.191800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.224000,-1.535000,10.080200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,9.554000>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<36.224000,-1.535000,10.080200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.224000,-1.535000,12.199700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,12.464900>}
box{<0,0,-0.203200><0.375049,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.224000,-1.535000,12.199700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.262500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,20.320000>}
box{<0,0,-0.203200><7.706700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.262500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.444000,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.975900,-1.535000,22.758400>}
box{<0,0,-0.203200><7.531900,0.035000,0.203200> rotate<0,0.000000,0> translate<36.444000,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.489200,-1.535000,12.464900>}
box{<0,0,-0.203200><2.724300,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.489200,-1.535000,12.464900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.619700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.685000,-1.535000,5.119300>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.619700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.619700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.685000,-1.535000,8.160600>}
box{<0,0,-0.203200><0.092348,0.035000,0.203200> rotate<0,44.997030,0> translate<36.619700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.668900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.751000,-1.535000,20.726400>}
box{<0,0,-0.203200><7.082100,0.035000,0.203200> rotate<0,0.000000,0> translate<36.668900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.678200,-1.535000,17.830700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084600,-1.535000,18.237100>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.678200,-1.535000,17.830700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.685000,-1.535000,5.119300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,5.054000>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,45.040932,0> translate<36.685000,-1.535000,5.119300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.685000,-1.535000,8.160600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,8.225900>}
box{<0,0,-0.203200><0.092277,0.035000,0.203200> rotate<0,-45.040932,0> translate<36.685000,-1.535000,8.160600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<36.750200,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<36.750200,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.750200,-1.535000,9.554000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,9.269200>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<36.750200,-1.535000,9.554000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.850400,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.569500,-1.535000,22.352000>}
box{<0,0,-0.203200><6.719100,0.035000,0.203200> rotate<0,0.000000,0> translate<36.850400,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,20.914600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,22.345300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<36.857100,-1.535000,22.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,21.132800>}
box{<0,0,-0.203200><6.705700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.857100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,21.539200>}
box{<0,0,-0.203200><6.705700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.857100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.857100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,21.945600>}
box{<0,0,-0.203200><6.705700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.857100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.515300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.084600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,4.769200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.437800,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,8.510700>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.437800,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.437800,-1.535000,9.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,9.269200>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.437800,-1.535000,9.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,4.769200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,5.054000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<38.182100,-1.535000,4.769200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,8.510700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,8.225900>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,22.497573,0> translate<38.182100,-1.535000,8.510700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.182100,-1.535000,9.269200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,9.554000>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-22.497573,0> translate<38.182100,-1.535000,9.269200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.370400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.479400,-1.535000,9.347200>}
box{<0,0,-0.203200><24.109000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.370400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.441800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.861800,-1.535000,4.876800>}
box{<0,0,-0.203200><9.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.441800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.515300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<38.515300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,5.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.395900,-1.535000,5.580200>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.869700,-1.535000,5.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,8.225900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.395900,-1.535000,7.699700>}
box{<0,0,-0.203200><0.744159,0.035000,0.203200> rotate<0,44.997030,0> translate<38.869700,-1.535000,8.225900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.869700,-1.535000,9.554000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.124900,-1.535000,9.809200>}
box{<0,0,-0.203200><0.360907,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.869700,-1.535000,9.554000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.870800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.809100,-1.535000,17.881600>}
box{<0,0,-0.203200><2.938300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.870800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.967600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.249200,-1.535000,8.128000>}
box{<0,0,-0.203200><18.281600,0.035000,0.203200> rotate<0,0.000000,0> translate<38.967600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.069300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.113800,-1.535000,9.753600>}
box{<0,0,-0.203200><3.044500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.069300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.098900,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.442900,-1.535000,5.283200>}
box{<0,0,-0.203200><8.344000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.098900,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.124900,-1.535000,9.809200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.058200,-1.535000,9.809200>}
box{<0,0,-0.203200><2.933300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.124900,-1.535000,9.809200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,12.464900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,15.398200>}
box{<0,0,-0.203200><2.933300,0.035000,0.203200> rotate<0,90.000000,0> translate<39.130700,-1.535000,15.398200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,12.464900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.144900,-1.535000,12.450700>}
box{<0,0,-0.203200><0.020082,0.035000,0.203200> rotate<0,44.997030,0> translate<39.130700,-1.535000,12.464900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.205900,-1.535000,12.598400>}
box{<0,0,-0.203200><3.075200,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,13.004800>}
box{<0,0,-0.203200><6.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,13.411200>}
box{<0,0,-0.203200><6.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,13.817600>}
box{<0,0,-0.203200><6.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,14.224000>}
box{<0,0,-0.203200><6.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,14.630400>}
box{<0,0,-0.203200><6.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910600,-1.535000,15.036800>}
box{<0,0,-0.203200><2.779900,0.035000,0.203200> rotate<0,0.000000,0> translate<39.130700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.130700,-1.535000,15.398200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,15.794600>}
box{<0,0,-0.203200><0.560594,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.130700,-1.535000,15.398200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.144900,-1.535000,12.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.058200,-1.535000,12.450700>}
box{<0,0,-0.203200><2.913300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.144900,-1.535000,12.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.175700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.504200,-1.535000,15.443200>}
box{<0,0,-0.203200><2.328500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.175700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.277200,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.402700,-1.535000,17.475200>}
box{<0,0,-0.203200><2.125500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.277200,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.374000,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.747800,-1.535000,7.721600>}
box{<0,0,-0.203200><8.373800,0.035000,0.203200> rotate<0,0.000000,0> translate<39.374000,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.395900,-1.535000,5.580200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,6.267800>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,-67.496487,0> translate<39.395900,-1.535000,5.580200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.395900,-1.535000,7.699700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,7.012100>}
box{<0,0,-0.203200><0.744248,0.035000,0.203200> rotate<0,67.496487,0> translate<39.395900,-1.535000,7.699700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.441200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.222800,-1.535000,5.689600>}
box{<0,0,-0.203200><7.781600,0.035000,0.203200> rotate<0,0.000000,0> translate<39.441200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,17.225300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<39.527100,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.527100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,16.256000>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.527100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,16.662400>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.527100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.527100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,17.068800>}
box{<0,0,-0.203200><1.625700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.527100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.555200,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.349100,-1.535000,7.315200>}
box{<0,0,-0.203200><7.793900,0.035000,0.203200> rotate<0,0.000000,0> translate<39.555200,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.609500,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.096000>}
box{<0,0,-0.203200><7.482100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.609500,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,6.267800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,7.012100>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,90.000000,0> translate<39.680700,-1.535000,7.012100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.502400>}
box{<0,0,-0.203200><7.410900,0.035000,0.203200> rotate<0,0.000000,0> translate<39.680700,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.680700,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.180800,-1.535000,6.908800>}
box{<0,0,-0.203200><7.500100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.680700,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,15.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164600,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<41.152800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,15.794600>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.152800,-1.535000,15.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.152800,-1.535000,17.225300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164600,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.152800,-1.535000,17.225300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.058200,-1.535000,9.809200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464600,-1.535000,9.402800>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<42.058200,-1.535000,9.809200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.058200,-1.535000,12.450700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464600,-1.535000,12.857100>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.058200,-1.535000,12.450700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164600,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.595300,-1.535000,14.782800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.164600,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164600,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.595300,-1.535000,18.237100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.164600,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464600,-1.535000,9.402800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.895300,-1.535000,9.402800>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.464600,-1.535000,9.402800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464600,-1.535000,12.857100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.895300,-1.535000,12.857100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.464600,-1.535000,12.857100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,20.914600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,20.508200>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<43.562800,-1.535000,20.914600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,22.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,20.914600>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.562800,-1.535000,20.914600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.562800,-1.535000,22.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.574600,-1.535000,23.357100>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.562800,-1.535000,22.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.595300,-1.535000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.001700,-1.535000,15.189200>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.595300,-1.535000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.595300,-1.535000,18.237100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,17.863100>}
box{<0,0,-0.203200><0.528845,0.035000,0.203200> rotate<0,45.004691,0> translate<43.595300,-1.535000,18.237100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.849300,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.895300,-1.535000,15.036800>}
box{<0,0,-0.203200><1.046000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.849300,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.895300,-1.535000,9.402800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,10.414600>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.895300,-1.535000,9.402800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.895300,-1.535000,12.857100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,11.845300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<43.895300,-1.535000,12.857100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.950800,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,17.881600>}
box{<0,0,-0.203200><0.018400,0.035000,0.203200> rotate<0,0.000000,0> translate<43.950800,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,20.508200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.969200,-1.535000,17.863100>}
box{<0,0,-0.203200><2.645100,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.969200,-1.535000,17.863100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.001700,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.742900,-1.535000,15.189200>}
box{<0,0,-0.203200><0.741200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.001700,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.154000,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.598400>}
box{<0,0,-0.203200><1.025200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.154000,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.246100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.352500,-1.535000,9.753600>}
box{<0,0,-0.203200><4.106400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.246100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.560400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.192000>}
box{<0,0,-0.203200><0.618800,0.035000,0.203200> rotate<0,0.000000,0> translate<44.560400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.574600,-1.535000,23.357100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.005300,-1.535000,23.357100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.574600,-1.535000,23.357100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.652500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.942100,-1.535000,10.160000>}
box{<0,0,-0.203200><2.289600,0.035000,0.203200> rotate<0,0.000000,0> translate<44.652500,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.742900,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,14.752900>}
box{<0,0,-0.203200><0.617021,0.035000,0.203200> rotate<0,44.997030,0> translate<44.742900,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,10.414600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,11.845300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<44.907100,-1.535000,11.845300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.365700,-1.535000,10.566400>}
box{<0,0,-0.203200><1.458600,0.035000,0.203200> rotate<0,0.000000,0> translate<44.907100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.959300,-1.535000,10.972800>}
box{<0,0,-0.203200><1.052200,0.035000,0.203200> rotate<0,0.000000,0> translate<44.907100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.552900,-1.535000,11.379200>}
box{<0,0,-0.203200><0.645800,0.035000,0.203200> rotate<0,0.000000,0> translate<44.907100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.907100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.283400,-1.535000,11.785600>}
box{<0,0,-0.203200><0.376300,0.035000,0.203200> rotate<0,0.000000,0> translate<44.907100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.037200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.380300,-1.535000,11.551800>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<45.179200,-1.535000,12.037200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.562700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.037200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.179200,-1.535000,12.037200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,14.752900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.179200,-1.535000,12.562700>}
box{<0,0,-0.203200><2.190200,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.179200,-1.535000,12.562700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.380300,-1.535000,11.551800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.280300,-1.535000,10.651800>}
box{<0,0,-0.203200><1.272792,0.035000,0.203200> rotate<0,44.997030,0> translate<45.380300,-1.535000,11.551800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.005300,-1.535000,23.357100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,22.345300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<46.005300,-1.535000,23.357100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.137200,-1.535000,25.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.312900,-1.535000,25.579200>}
box{<0,0,-0.203200><0.175700,0.035000,0.203200> rotate<0,0.000000,0> translate<46.137200,-1.535000,25.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.137200,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.597200,-1.535000,28.220700>}
box{<0,0,-0.203200><0.460000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.137200,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.197600,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.152600,-1.535000,23.164800>}
box{<0,0,-0.203200><1.955000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.197600,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.280300,-1.535000,10.651800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.651800,-1.535000,10.280300>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<46.280300,-1.535000,10.651800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.312900,-1.535000,25.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,24.089300>}
box{<0,0,-0.203200><2.107037,0.035000,0.203200> rotate<0,44.997030,0> translate<46.312900,-1.535000,25.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.597200,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.122700,-1.535000,28.220700>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.597200,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.604000,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.559000,-1.535000,22.758400>}
box{<0,0,-0.203200><1.955000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.604000,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,17.056900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,20.508200>}
box{<0,0,-0.203200><3.451300,0.035000,0.203200> rotate<0,90.000000,0> translate<46.610700,-1.535000,20.508200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,17.056900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.248100,-1.535000,16.419600>}
box{<0,0,-0.203200><0.901349,0.035000,0.203200> rotate<0,44.992536,0> translate<46.610700,-1.535000,17.056900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.101000,-1.535000,17.068800>}
box{<0,0,-0.203200><8.490300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.507400,-1.535000,17.475200>}
box{<0,0,-0.203200><8.896700,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.913800,-1.535000,17.881600>}
box{<0,0,-0.203200><9.303100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.140600,-1.535000,18.288000>}
box{<0,0,-0.203200><6.529900,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.441500,-1.535000,18.694400>}
box{<0,0,-0.203200><5.830800,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.076000,-1.535000,19.100800>}
box{<0,0,-0.203200><5.465300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.907700,-1.535000,19.507200>}
box{<0,0,-0.203200><5.297000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.815000,-1.535000,19.913600>}
box{<0,0,-0.203200><5.204300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.572100,-1.535000,20.320000>}
box{<0,0,-0.203200><4.961400,0.035000,0.203200> rotate<0,0.000000,0> translate<46.610700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.610700,-1.535000,20.508200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,20.914600>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.610700,-1.535000,20.508200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.651800,-1.535000,10.280300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.137200,-1.535000,10.079200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<46.651800,-1.535000,10.280300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.828900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.165700,-1.535000,20.726400>}
box{<0,0,-0.203200><4.336800,0.035000,0.203200> rotate<0,0.000000,0> translate<46.828900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.005300,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.694600,-1.535000,16.662400>}
box{<0,0,-0.203200><7.689300,0.035000,0.203200> rotate<0,0.000000,0> translate<47.005300,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.010400,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.540100,-1.535000,22.352000>}
box{<0,0,-0.203200><2.529700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.010400,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,20.914600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,22.345300>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,90.000000,0> translate<47.017100,-1.535000,22.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.759300,-1.535000,21.132800>}
box{<0,0,-0.203200><3.742200,0.035000,0.203200> rotate<0,0.000000,0> translate<47.017100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.352900,-1.535000,21.539200>}
box{<0,0,-0.203200><3.335800,0.035000,0.203200> rotate<0,0.000000,0> translate<47.017100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.946500,-1.535000,21.945600>}
box{<0,0,-0.203200><2.929400,0.035000,0.203200> rotate<0,0.000000,0> translate<47.017100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.006400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354500,-1.535000,5.371600>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,67.498840,0> translate<47.091600,-1.535000,6.006400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.693500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.006400>}
box{<0,0,-0.203200><0.687100,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.091600,-1.535000,6.006400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.091600,-1.535000,6.693500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354500,-1.535000,7.328300>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,-67.498840,0> translate<47.091600,-1.535000,6.693500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.122700,-1.535000,28.220700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.608100,-1.535000,28.019600>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,22.502619,0> translate<47.122700,-1.535000,28.220700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.137200,-1.535000,10.079200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.726900,-1.535000,10.079200>}
box{<0,0,-0.203200><0.589700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.137200,-1.535000,10.079200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.248100,-1.535000,16.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.619600,-1.535000,16.048100>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,44.997030,0> translate<47.248100,-1.535000,16.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354500,-1.535000,5.371600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,4.885700>}
box{<0,0,-0.203200><0.687166,0.035000,0.203200> rotate<0,44.997030,0> translate<47.354500,-1.535000,5.371600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354500,-1.535000,7.328300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,7.814200>}
box{<0,0,-0.203200><0.687166,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.354500,-1.535000,7.328300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.411700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.288200,-1.535000,16.256000>}
box{<0,0,-0.203200><6.876500,0.035000,0.203200> rotate<0,0.000000,0> translate<47.411700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.555000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.041600>}
box{<0,0,-0.203200><15.665800,0.035000,0.203200> rotate<0,0.000000,0> translate<47.555000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.608100,-1.535000,28.019600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.670600,-1.535000,25.957100>}
box{<0,0,-0.203200><2.916815,0.035000,0.203200> rotate<0,44.997030,0> translate<47.608100,-1.535000,28.019600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.619600,-1.535000,16.048100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,15.562700>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,67.491441,0> translate<47.619600,-1.535000,16.048100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.701900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.881800,-1.535000,15.849600>}
box{<0,0,-0.203200><6.179900,0.035000,0.203200> rotate<0,0.000000,0> translate<47.701900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.726900,-1.535000,10.079200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,9.965700>}
box{<0,0,-0.203200><0.160513,0.035000,0.203200> rotate<0,44.997030,0> translate<47.726900,-1.535000,10.079200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,23.514600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.814600,-1.535000,22.502800>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<47.802800,-1.535000,23.514600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,24.089300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.802800,-1.535000,23.514600>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.802800,-1.535000,23.514600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,14.803100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,15.562700>}
box{<0,0,-0.203200><0.759600,0.035000,0.203200> rotate<0,90.000000,0> translate<47.820700,-1.535000,15.562700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,14.803100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.814600,-1.535000,15.797100>}
box{<0,0,-0.203200><1.405658,0.035000,0.203200> rotate<0,-44.999912,0> translate<47.820700,-1.535000,14.803100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.054400,-1.535000,15.036800>}
box{<0,0,-0.203200><0.233700,0.035000,0.203200> rotate<0,0.000000,0> translate<47.820700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.820700,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.460800,-1.535000,15.443200>}
box{<0,0,-0.203200><0.640100,0.035000,0.203200> rotate<0,0.000000,0> translate<47.820700,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,4.885700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,4.622800>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,22.495220,0> translate<47.840400,-1.535000,4.885700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,7.814200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,8.077100>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,-22.495220,0> translate<47.840400,-1.535000,7.814200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.840400,-1.535000,9.965700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,9.702800>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,22.495220,0> translate<47.840400,-1.535000,9.965700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.992500,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,27.635200>}
box{<0,0,-0.203200><15.228300,0.035000,0.203200> rotate<0,0.000000,0> translate<47.992500,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.398900,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.311800,-1.535000,27.228800>}
box{<0,0,-0.203200><14.912900,0.035000,0.203200> rotate<0,0.000000,0> translate<48.398900,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,4.622800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,4.622800>}
box{<0,0,-0.203200><2.109500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.475200,-1.535000,4.622800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,8.077100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,8.077100>}
box{<0,0,-0.203200><2.109500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.475200,-1.535000,8.077100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.475200,-1.535000,9.702800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,9.702800>}
box{<0,0,-0.203200><2.109500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.475200,-1.535000,9.702800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.805300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.429800,-1.535000,26.822400>}
box{<0,0,-0.203200><14.624500,0.035000,0.203200> rotate<0,0.000000,0> translate<48.805300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.814600,-1.535000,15.797100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.245300,-1.535000,15.797100>}
box{<0,0,-0.203200><1.430700,0.035000,0.203200> rotate<0,0.000000,0> translate<48.814600,-1.535000,15.797100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.814600,-1.535000,22.502800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.389300,-1.535000,22.502800>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<48.814600,-1.535000,22.502800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.211700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.664500,-1.535000,26.416000>}
box{<0,0,-0.203200><14.452800,0.035000,0.203200> rotate<0,0.000000,0> translate<49.211700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.389300,-1.535000,22.502800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.815000,-1.535000,20.077100>}
box{<0,0,-0.203200><3.430458,0.035000,0.203200> rotate<0,44.997030,0> translate<49.389300,-1.535000,22.502800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.618100,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.983400,-1.535000,26.009600>}
box{<0,0,-0.203200><14.365300,0.035000,0.203200> rotate<0,0.000000,0> translate<49.618100,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.670600,-1.535000,25.957100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.245300,-1.535000,25.957100>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.670600,-1.535000,25.957100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.245300,-1.535000,15.797100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.651700,-1.535000,15.390700>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<50.245300,-1.535000,15.797100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.245300,-1.535000,25.957100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.945300>}
box{<0,0,-0.203200><1.430901,0.035000,0.203200> rotate<0,44.997030,0> translate<50.245300,-1.535000,25.957100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,4.622800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,4.885700>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,-22.495220,0> translate<50.584700,-1.535000,4.622800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,8.077100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,7.814200>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,22.495220,0> translate<50.584700,-1.535000,8.077100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.584700,-1.535000,9.702800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,9.965700>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,-22.495220,0> translate<50.584700,-1.535000,9.702800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.599200,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.475400,-1.535000,15.443200>}
box{<0,0,-0.203200><2.876200,0.035000,0.203200> rotate<0,0.000000,0> translate<50.599200,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.599200,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.449000,-1.535000,25.603200>}
box{<0,0,-0.203200><13.849800,0.035000,0.203200> rotate<0,0.000000,0> translate<50.599200,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.651700,-1.535000,15.390700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.422900,-1.535000,15.390700>}
box{<0,0,-0.203200><2.771200,0.035000,0.203200> rotate<0,0.000000,0> translate<50.651700,-1.535000,15.390700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.707300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,9.753600>}
box{<0,0,-0.203200><11.871900,0.035000,0.203200> rotate<0,0.000000,0> translate<50.707300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.005600,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.567700,-1.535000,25.196800>}
box{<0,0,-0.203200><5.562100,0.035000,0.203200> rotate<0,0.000000,0> translate<51.005600,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.198000,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.554000,-1.535000,4.876800>}
box{<0,0,-0.203200><5.356000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.198000,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,4.885700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363000,-1.535000,5.029200>}
box{<0,0,-0.203200><0.202940,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.219500,-1.535000,4.885700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,7.814200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363000,-1.535000,7.670700>}
box{<0,0,-0.203200><0.202940,0.035000,0.203200> rotate<0,44.997030,0> translate<51.219500,-1.535000,7.814200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.219500,-1.535000,9.965700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.705400,-1.535000,10.451600>}
box{<0,0,-0.203200><0.687166,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.219500,-1.535000,9.965700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.370600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.945300>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,90.000000,0> translate<51.257100,-1.535000,24.945300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.370600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.612800,-1.535000,22.014900>}
box{<0,0,-0.203200><3.331463,0.035000,0.203200> rotate<0,44.997030,0> translate<51.257100,-1.535000,24.370600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.978700,-1.535000,24.384000>}
box{<0,0,-0.203200><4.721600,0.035000,0.203200> rotate<0,0.000000,0> translate<51.257100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.161300,-1.535000,24.790400>}
box{<0,0,-0.203200><4.904200,0.035000,0.203200> rotate<0,0.000000,0> translate<51.257100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.312100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.492600,-1.535000,7.721600>}
box{<0,0,-0.203200><5.180500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.312100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363000,-1.535000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.401700,-1.535000,5.029200>}
box{<0,0,-0.203200><5.038700,0.035000,0.203200> rotate<0,0.000000,0> translate<51.363000,-1.535000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363000,-1.535000,7.670700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.441700,-1.535000,7.670700>}
box{<0,0,-0.203200><5.078700,0.035000,0.203200> rotate<0,0.000000,0> translate<51.363000,-1.535000,7.670700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.364400,-1.535000,12.749200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.705400,-1.535000,12.408300>}
box{<0,0,-0.203200><0.482176,0.035000,0.203200> rotate<0,44.988628,0> translate<51.364400,-1.535000,12.749200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.364400,-1.535000,12.749200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.707200,-1.535000,12.749200>}
box{<0,0,-0.203200><2.342800,0.035000,0.203200> rotate<0,0.000000,0> translate<51.364400,-1.535000,12.749200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.413800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,10.160000>}
box{<0,0,-0.203200><11.165400,0.035000,0.203200> rotate<0,0.000000,0> translate<51.413800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.515300,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.598400>}
box{<0,0,-0.203200><10.459700,0.035000,0.203200> rotate<0,0.000000,0> translate<51.515300,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.650100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,23.977600>}
box{<0,0,-0.203200><4.208300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.650100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.705400,-1.535000,10.451600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.968300,-1.535000,11.086400>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,-67.498840,0> translate<51.705400,-1.535000,10.451600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.705400,-1.535000,12.408300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.968300,-1.535000,11.773500>}
box{<0,0,-0.203200><0.687086,0.035000,0.203200> rotate<0,67.498840,0> translate<51.705400,-1.535000,12.408300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752900,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,10.566400>}
box{<0,0,-0.203200><10.826300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.752900,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.795000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.192000>}
box{<0,0,-0.203200><10.180000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.795000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.815000,-1.535000,19.731000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.105000,-1.535000,19.030900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,67.494911,0> translate<51.815000,-1.535000,19.731000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.815000,-1.535000,20.077100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.815000,-1.535000,19.731000>}
box{<0,0,-0.203200><0.346100,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.815000,-1.535000,19.731000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.921200,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,10.972800>}
box{<0,0,-0.203200><10.658000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.921200,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.963300,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.109700,-1.535000,11.785600>}
box{<0,0,-0.203200><10.146400,0.035000,0.203200> rotate<0,0.000000,0> translate<51.963300,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.968300,-1.535000,11.086400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.968300,-1.535000,11.773500>}
box{<0,0,-0.203200><0.687100,0.035000,0.203200> rotate<0,90.000000,0> translate<51.968300,-1.535000,11.773500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.968300,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.296700,-1.535000,11.379200>}
box{<0,0,-0.203200><10.328400,0.035000,0.203200> rotate<0,0.000000,0> translate<51.968300,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.056500,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,23.571200>}
box{<0,0,-0.203200><3.801900,0.035000,0.203200> rotate<0,0.000000,0> translate<52.056500,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.105000,-1.535000,19.030900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.640900,-1.535000,18.495000>}
box{<0,0,-0.203200><0.757877,0.035000,0.203200> rotate<0,44.997030,0> translate<52.105000,-1.535000,19.030900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.462900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.941700,-1.535000,23.164800>}
box{<0,0,-0.203200><3.478800,0.035000,0.203200> rotate<0,0.000000,0> translate<52.462900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.640900,-1.535000,18.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.341000,-1.535000,18.205000>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,22.499150,0> translate<52.640900,-1.535000,18.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.869300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.110100,-1.535000,22.758400>}
box{<0,0,-0.203200><3.240800,0.035000,0.203200> rotate<0,0.000000,0> translate<52.869300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.275700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.478800,-1.535000,22.352000>}
box{<0,0,-0.203200><3.203100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.275700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.341000,-1.535000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.098900,-1.535000,18.205000>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,0.000000,0> translate<53.341000,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.422900,-1.535000,15.390700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,19.147000>}
box{<0,0,-0.203200><5.312210,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.422900,-1.535000,15.390700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.612800,-1.535000,22.014900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.098900,-1.535000,22.014900>}
box{<0,0,-0.203200><0.486100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.612800,-1.535000,22.014900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.707200,-1.535000,12.749200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.232700,-1.535000,12.749200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<53.707200,-1.535000,12.749200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.098900,-1.535000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.799000,-1.535000,18.495000>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,-22.499150,0> translate<54.098900,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.098900,-1.535000,22.014900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.799000,-1.535000,21.724900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,22.499150,0> translate<54.098900,-1.535000,22.014900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.232700,-1.535000,12.749200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.718100,-1.535000,12.950300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<54.232700,-1.535000,12.749200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.266200,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,21.945600>}
box{<0,0,-0.203200><2.913000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.266200,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.299200,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.320200,-1.535000,18.288000>}
box{<0,0,-0.203200><2.021000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.299200,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.718100,-1.535000,12.950300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.248100,-1.535000,17.480300>}
box{<0,0,-0.203200><6.406387,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.718100,-1.535000,12.950300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.772600,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.031300,-1.535000,13.004800>}
box{<0,0,-0.203200><7.258700,0.035000,0.203200> rotate<0,0.000000,0> translate<54.772600,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.799000,-1.535000,18.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.334900,-1.535000,19.030900>}
box{<0,0,-0.203200><0.757877,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.799000,-1.535000,18.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.799000,-1.535000,21.724900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.334900,-1.535000,21.189000>}
box{<0,0,-0.203200><0.757877,0.035000,0.203200> rotate<0,44.997030,0> translate<54.799000,-1.535000,21.724900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.984700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,21.539200>}
box{<0,0,-0.203200><2.194500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.984700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.998400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.726600,-1.535000,18.694400>}
box{<0,0,-0.203200><1.728200,0.035000,0.203200> rotate<0,0.000000,0> translate<54.998400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.179000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.199700,-1.535000,13.411200>}
box{<0,0,-0.203200><7.020700,0.035000,0.203200> rotate<0,0.000000,0> translate<55.179000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.334900,-1.535000,19.030900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,19.731000>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,-67.494911,0> translate<55.334900,-1.535000,19.030900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.334900,-1.535000,21.189000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,20.488900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,67.494911,0> translate<55.334900,-1.535000,21.189000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.358200,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,21.132800>}
box{<0,0,-0.203200><1.821000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.358200,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.363800,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.133000,-1.535000,19.100800>}
box{<0,0,-0.203200><1.769200,0.035000,0.203200> rotate<0,0.000000,0> translate<55.363800,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.526600,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,20.726400>}
box{<0,0,-0.203200><1.652600,0.035000,0.203200> rotate<0,0.000000,0> translate<55.526600,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.532100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,19.507200>}
box{<0,0,-0.203200><1.647100,0.035000,0.203200> rotate<0,0.000000,0> translate<55.532100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.585400,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.513600,-1.535000,13.817600>}
box{<0,0,-0.203200><6.928200,0.035000,0.203200> rotate<0,0.000000,0> translate<55.585400,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,19.731000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,20.488900>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,90.000000,0> translate<55.624900,-1.535000,20.488900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,19.913600>}
box{<0,0,-0.203200><1.554300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.624900,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.624900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,20.320000>}
box{<0,0,-0.203200><1.554300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.624900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,23.366100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.136800,-1.535000,22.694000>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,67.495031,0> translate<55.858400,-1.535000,23.366100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,24.093800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,23.366100>}
box{<0,0,-0.203200><0.727700,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.858400,-1.535000,23.366100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.858400,-1.535000,24.093800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.136800,-1.535000,24.765900>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-67.495031,0> translate<55.858400,-1.535000,24.093800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.991800,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.088500,-1.535000,14.224000>}
box{<0,0,-0.203200><7.096700,0.035000,0.203200> rotate<0,0.000000,0> translate<55.991800,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.136800,-1.535000,22.694000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,22.179600>}
box{<0,0,-0.203200><0.727471,0.035000,0.203200> rotate<0,44.997030,0> translate<56.136800,-1.535000,22.694000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.136800,-1.535000,24.765900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,25.280300>}
box{<0,0,-0.203200><0.727471,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.136800,-1.535000,24.765900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.398200,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,14.630400>}
box{<0,0,-0.203200><12.442600,0.035000,0.203200> rotate<0,0.000000,0> translate<56.398200,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.401700,-1.535000,5.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,4.779600>}
box{<0,0,-0.203200><0.352917,0.035000,0.203200> rotate<0,45.008509,0> translate<56.401700,-1.535000,5.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.441700,-1.535000,7.670700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,7.880300>}
box{<0,0,-0.203200><0.296348,0.035000,0.203200> rotate<0,-45.010700,0> translate<56.441700,-1.535000,7.670700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,4.779600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,4.501200>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,22.499029,0> translate<56.651200,-1.535000,4.779600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,7.880300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,8.158700>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-22.499029,0> translate<56.651200,-1.535000,7.880300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,22.179600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,21.960900>}
box{<0,0,-0.203200><0.571501,0.035000,0.203200> rotate<0,22.498074,0> translate<56.651200,-1.535000,22.179600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.651200,-1.535000,25.280300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,25.558700>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-22.499029,0> translate<56.651200,-1.535000,25.280300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.804600,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,15.036800>}
box{<0,0,-0.203200><12.036200,0.035000,0.203200> rotate<0,0.000000,0> translate<56.804600,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,21.960900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.179200,-1.535000,19.147000>}
box{<0,0,-0.203200><2.813900,0.035000,0.203200> rotate<0,-90.000000,0> translate<57.179200,-1.535000,19.147000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.211000,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,15.443200>}
box{<0,0,-0.203200><11.629800,0.035000,0.203200> rotate<0,0.000000,0> translate<57.211000,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,4.501200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,4.501200>}
box{<0,0,-0.203200><2.353300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.323300,-1.535000,4.501200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,8.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,8.158700>}
box{<0,0,-0.203200><2.353300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.323300,-1.535000,8.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.323300,-1.535000,25.558700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,25.558700>}
box{<0,0,-0.203200><2.353300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.323300,-1.535000,25.558700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.617400,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,15.849600>}
box{<0,0,-0.203200><11.223400,0.035000,0.203200> rotate<0,0.000000,0> translate<57.617400,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.023800,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,16.256000>}
box{<0,0,-0.203200><10.817000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.023800,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.430200,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,16.662400>}
box{<0,0,-0.203200><10.410600,0.035000,0.203200> rotate<0,0.000000,0> translate<58.430200,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.836600,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,17.068800>}
box{<0,0,-0.203200><10.004200,0.035000,0.203200> rotate<0,0.000000,0> translate<58.836600,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.243000,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,17.475200>}
box{<0,0,-0.203200><9.597800,0.035000,0.203200> rotate<0,0.000000,0> translate<59.243000,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.248100,-1.535000,17.480300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.619600,-1.535000,17.851800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.248100,-1.535000,17.480300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.619600,-1.535000,17.851800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,18.337200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<59.619600,-1.535000,17.851800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.631900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,17.881600>}
box{<0,0,-0.203200><9.208900,0.035000,0.203200> rotate<0,0.000000,0> translate<59.631900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,4.501200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,4.779600>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-22.499029,0> translate<59.676600,-1.535000,4.501200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,8.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,7.880300>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,22.499029,0> translate<59.676600,-1.535000,8.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676600,-1.535000,25.558700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,25.280300>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,22.499029,0> translate<59.676600,-1.535000,25.558700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.750800,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.260200,-1.535000,8.128000>}
box{<0,0,-0.203200><1.509400,0.035000,0.203200> rotate<0,0.000000,0> translate<59.750800,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.800300,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,18.288000>}
box{<0,0,-0.203200><9.040500,0.035000,0.203200> rotate<0,0.000000,0> translate<59.800300,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,18.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,21.960900>}
box{<0,0,-0.203200><3.623700,0.035000,0.203200> rotate<0,90.000000,0> translate<59.820700,-1.535000,21.960900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,18.694400>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,19.100800>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,19.507200>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,19.913600>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,20.320000>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,20.726400>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,21.132800>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,21.539200>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,21.945600>}
box{<0,0,-0.203200><9.020100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.820700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.820700,-1.535000,21.960900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,22.179600>}
box{<0,0,-0.203200><0.571501,0.035000,0.203200> rotate<0,-22.498074,0> translate<59.820700,-1.535000,21.960900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,4.779600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.578200,-1.535000,5.009200>}
box{<0,0,-0.203200><0.324633,0.035000,0.203200> rotate<0,-45.009509,0> translate<60.348700,-1.535000,4.779600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,7.880300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.578200,-1.535000,7.650700>}
box{<0,0,-0.203200><0.324633,0.035000,0.203200> rotate<0,45.009509,0> translate<60.348700,-1.535000,7.880300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,22.179600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.863100,-1.535000,22.694000>}
box{<0,0,-0.203200><0.727471,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.348700,-1.535000,22.179600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.348700,-1.535000,25.280300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.863100,-1.535000,24.765900>}
box{<0,0,-0.203200><0.727471,0.035000,0.203200> rotate<0,44.997030,0> translate<60.348700,-1.535000,25.280300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.432200,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.385100,-1.535000,25.196800>}
box{<0,0,-0.203200><4.952900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.432200,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.445800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.407200,-1.535000,4.876800>}
box{<0,0,-0.203200><2.961400,0.035000,0.203200> rotate<0,0.000000,0> translate<60.445800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.507400,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.853800,-1.535000,7.721600>}
box{<0,0,-0.203200><0.346400,0.035000,0.203200> rotate<0,0.000000,0> translate<60.507400,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.521100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,22.352000>}
box{<0,0,-0.203200><8.319700,0.035000,0.203200> rotate<0,0.000000,0> translate<60.521100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.578200,-1.535000,5.009200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.067200,-1.535000,5.009200>}
box{<0,0,-0.203200><0.489000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.578200,-1.535000,5.009200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.578200,-1.535000,7.650700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.782900,-1.535000,7.650700>}
box{<0,0,-0.203200><0.204700,0.035000,0.203200> rotate<0,0.000000,0> translate<60.578200,-1.535000,7.650700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.782900,-1.535000,7.650700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,9.447000>}
box{<0,0,-0.203200><2.540352,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.782900,-1.535000,7.650700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.838600,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,24.790400>}
box{<0,0,-0.203200><8.002200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.838600,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.863100,-1.535000,22.694000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,23.366100>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,-67.495031,0> translate<60.863100,-1.535000,22.694000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.863100,-1.535000,24.765900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,24.093800>}
box{<0,0,-0.203200><0.727479,0.035000,0.203200> rotate<0,67.495031,0> translate<60.863100,-1.535000,24.765900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.889700,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,22.758400>}
box{<0,0,-0.203200><7.951100,0.035000,0.203200> rotate<0,0.000000,0> translate<60.889700,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.021300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,24.384000>}
box{<0,0,-0.203200><7.819500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.021300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.058100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,23.164800>}
box{<0,0,-0.203200><7.782700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.058100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.067200,-1.535000,5.009200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.592700,-1.535000,5.009200>}
box{<0,0,-0.203200><0.525500,0.035000,0.203200> rotate<0,0.000000,0> translate<61.067200,-1.535000,5.009200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,23.366100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,24.093800>}
box{<0,0,-0.203200><0.727700,0.035000,0.203200> rotate<0,90.000000,0> translate<61.141500,-1.535000,24.093800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,23.571200>}
box{<0,0,-0.203200><7.699300,0.035000,0.203200> rotate<0,0.000000,0> translate<61.141500,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.141500,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,23.977600>}
box{<0,0,-0.203200><7.699300,0.035000,0.203200> rotate<0,0.000000,0> translate<61.141500,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.592700,-1.535000,5.009200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.078100,-1.535000,5.210300>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-22.502619,0> translate<61.592700,-1.535000,5.009200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.111000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.265000,-1.535000,11.410900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,67.494911,0> translate<61.975000,-1.535000,12.111000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.868900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.111000>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.975000,-1.535000,12.111000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.975000,-1.535000,12.868900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.265000,-1.535000,13.569000>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,-67.494911,0> translate<61.975000,-1.535000,12.868900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.078100,-1.535000,5.210300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.648100,-1.535000,7.780300>}
box{<0,0,-0.203200><3.634529,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.078100,-1.535000,5.210300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.151000,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.635300,-1.535000,5.283200>}
box{<0,0,-0.203200><1.484300,0.035000,0.203200> rotate<0,0.000000,0> translate<62.151000,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.265000,-1.535000,11.410900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,11.096700>}
box{<0,0,-0.203200><0.444346,0.035000,0.203200> rotate<0,44.997030,0> translate<62.265000,-1.535000,11.410900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.265000,-1.535000,13.569000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.800900,-1.535000,14.104900>}
box{<0,0,-0.203200><0.757877,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.265000,-1.535000,13.569000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.557400,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.932700,-1.535000,5.689600>}
box{<0,0,-0.203200><1.375300,0.035000,0.203200> rotate<0,0.000000,0> translate<62.557400,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,11.096700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.579200,-1.535000,9.447000>}
box{<0,0,-0.203200><1.649700,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.579200,-1.535000,9.447000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.800900,-1.535000,14.104900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.501000,-1.535000,14.394900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,-22.499150,0> translate<62.800900,-1.535000,14.104900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.963800,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.361300,-1.535000,6.096000>}
box{<0,0,-0.203200><1.397500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.963800,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,3.438800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,2.721800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<63.220800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,3.438800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.220800,-1.535000,3.438800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,4.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<63.220800,-1.535000,4.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,27.568800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,26.851800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,74.996509,0> translate<63.220800,-1.535000,27.568800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.311100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,27.568800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.220800,-1.535000,27.568800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220800,-1.535000,28.311100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,29.028100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-74.996509,0> translate<63.220800,-1.535000,28.311100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.370200,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.196000,-1.535000,6.502400>}
box{<0,0,-0.203200><1.825800,0.035000,0.203200> rotate<0,0.000000,0> translate<63.370200,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,2.721800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,2.078900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<63.412900,-1.535000,2.721800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<63.412900,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,26.851800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,26.208900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<63.412900,-1.535000,26.851800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.412900,-1.535000,29.028100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,29.671000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<63.412900,-1.535000,29.028100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.501000,-1.535000,14.394900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.258900,-1.535000,14.394900>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,0.000000,0> translate<63.501000,-1.535000,14.394900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.776600,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,6.908800>}
box{<0,0,-0.203200><5.064200,0.035000,0.203200> rotate<0,0.000000,0> translate<63.776600,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,2.078900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,1.554100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<63.784100,-1.535000,2.078900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.784100,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,26.208900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,25.684100>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<63.784100,-1.535000,26.208900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.784100,-1.535000,29.671000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,30.195800>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.784100,-1.535000,29.671000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.183000,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,7.315200>}
box{<0,0,-0.203200><4.657800,0.035000,0.203200> rotate<0,0.000000,0> translate<64.183000,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.258900,-1.535000,14.394900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.959000,-1.535000,14.104900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,22.499150,0> translate<64.258900,-1.535000,14.394900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,1.554100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.889300,-1.535000,1.219100>}
box{<0,0,-0.203200><0.670141,0.035000,0.203200> rotate<0,29.991053,0> translate<64.308900,-1.535000,1.554100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.951800,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<64.308900,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,25.684100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.951800,-1.535000,25.312900>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<64.308900,-1.535000,25.684100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.308900,-1.535000,30.195800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.872000,-1.535000,30.520800>}
box{<0,0,-0.203200><0.650159,0.035000,0.203200> rotate<0,-29.989936,0> translate<64.308900,-1.535000,30.195800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.589400,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,7.721600>}
box{<0,0,-0.203200><4.251400,0.035000,0.203200> rotate<0,0.000000,0> translate<64.589400,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.648100,-1.535000,7.780300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.019600,-1.535000,8.151800>}
box{<0,0,-0.203200><0.525380,0.035000,0.203200> rotate<0,-44.997030,0> translate<64.648100,-1.535000,7.780300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.671500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,14.224000>}
box{<0,0,-0.203200><4.169300,0.035000,0.203200> rotate<0,0.000000,0> translate<64.671500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.951800,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.668800,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<64.951800,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.951800,-1.535000,25.312900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.668800,-1.535000,25.120800>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<64.951800,-1.535000,25.312900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.959000,-1.535000,14.104900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.494900,-1.535000,13.569000>}
box{<0,0,-0.203200><0.757877,0.035000,0.203200> rotate<0,44.997030,0> translate<64.959000,-1.535000,14.104900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.995800,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,8.128000>}
box{<0,0,-0.203200><3.845000,0.035000,0.203200> rotate<0,0.000000,0> translate<64.995800,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.019600,-1.535000,8.151800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,8.637200>}
box{<0,0,-0.203200><0.525409,0.035000,0.203200> rotate<0,-67.491441,0> translate<65.019600,-1.535000,8.151800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.178100,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,8.534400>}
box{<0,0,-0.203200><3.662700,0.035000,0.203200> rotate<0,0.000000,0> translate<65.178100,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,8.637200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,11.136700>}
box{<0,0,-0.203200><2.499500,0.035000,0.203200> rotate<0,90.000000,0> translate<65.220700,-1.535000,11.136700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,8.940800>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,9.347200>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,9.753600>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,10.160000>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,10.566400>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,10.972800>}
box{<0,0,-0.203200><3.620100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.220700,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.220700,-1.535000,11.136700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.494900,-1.535000,11.410900>}
box{<0,0,-0.203200><0.387777,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.220700,-1.535000,11.136700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.246300,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,13.817600>}
box{<0,0,-0.203200><3.594500,0.035000,0.203200> rotate<0,0.000000,0> translate<65.246300,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.463200,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,11.379200>}
box{<0,0,-0.203200><3.377600,0.035000,0.203200> rotate<0,0.000000,0> translate<65.463200,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.494900,-1.535000,11.410900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.111000>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,-67.494911,0> translate<65.494900,-1.535000,11.410900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.494900,-1.535000,13.569000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.868900>}
box{<0,0,-0.203200><0.757786,0.035000,0.203200> rotate<0,67.494911,0> translate<65.494900,-1.535000,13.569000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.560300,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,13.411200>}
box{<0,0,-0.203200><3.280500,0.035000,0.203200> rotate<0,0.000000,0> translate<65.560300,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.650100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,11.785600>}
box{<0,0,-0.203200><3.190700,0.035000,0.203200> rotate<0,0.000000,0> translate<65.650100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.668800,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.411100,-1.535000,6.629100>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<65.668800,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.668800,-1.535000,25.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.411100,-1.535000,25.120800>}
box{<0,0,-0.203200><0.742300,0.035000,0.203200> rotate<0,0.000000,0> translate<65.668800,-1.535000,25.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.728700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,13.004800>}
box{<0,0,-0.203200><3.112100,0.035000,0.203200> rotate<0,0.000000,0> translate<65.728700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.111000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.868900>}
box{<0,0,-0.203200><0.757900,0.035000,0.203200> rotate<0,90.000000,0> translate<65.784900,-1.535000,12.868900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,12.192000>}
box{<0,0,-0.203200><3.055900,0.035000,0.203200> rotate<0,0.000000,0> translate<65.784900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.784900,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,12.598400>}
box{<0,0,-0.203200><3.055900,0.035000,0.203200> rotate<0,0.000000,0> translate<65.784900,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.411100,-1.535000,6.629100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.128100,-1.535000,6.437000>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,14.997551,0> translate<66.411100,-1.535000,6.629100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.411100,-1.535000,25.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.128100,-1.535000,25.312900>}
box{<0,0,-0.203200><0.742288,0.035000,0.203200> rotate<0,-14.997551,0> translate<66.411100,-1.535000,25.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.694700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,25.196800>}
box{<0,0,-0.203200><2.146100,0.035000,0.203200> rotate<0,0.000000,0> translate<66.694700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.884000,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,6.502400>}
box{<0,0,-0.203200><1.956800,0.035000,0.203200> rotate<0,0.000000,0> translate<66.884000,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.128100,-1.535000,6.437000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.771000,-1.535000,6.065800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,29.999458,0> translate<67.128100,-1.535000,6.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.128100,-1.535000,25.312900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.771000,-1.535000,25.684100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-29.999458,0> translate<67.128100,-1.535000,25.312900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.630800,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,25.603200>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<67.630800,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.718700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,6.096000>}
box{<0,0,-0.203200><1.122100,0.035000,0.203200> rotate<0,0.000000,0> translate<67.718700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.771000,-1.535000,6.065800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.295800,-1.535000,5.541000>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,44.997030,0> translate<67.771000,-1.535000,6.065800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.771000,-1.535000,25.684100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.295800,-1.535000,26.208900>}
box{<0,0,-0.203200><0.742179,0.035000,0.203200> rotate<0,-44.997030,0> translate<67.771000,-1.535000,25.684100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.096500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,26.009600>}
box{<0,0,-0.203200><0.744300,0.035000,0.203200> rotate<0,0.000000,0> translate<68.096500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.147200,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.693600,0.035000,0.203200> rotate<0,0.000000,0> translate<68.147200,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.295800,-1.535000,5.541000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.667000,-1.535000,4.898100>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,59.994602,0> translate<68.295800,-1.535000,5.541000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.295800,-1.535000,26.208900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.667000,-1.535000,26.851800>}
box{<0,0,-0.203200><0.742368,0.035000,0.203200> rotate<0,-59.994602,0> translate<68.295800,-1.535000,26.208900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.415300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,26.416000>}
box{<0,0,-0.203200><0.425500,0.035000,0.203200> rotate<0,0.000000,0> translate<68.415300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.444700,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,5.283200>}
box{<0,0,-0.203200><0.396100,0.035000,0.203200> rotate<0,0.000000,0> translate<68.444700,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.650000,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,26.822400>}
box{<0,0,-0.203200><0.190800,0.035000,0.203200> rotate<0,0.000000,0> translate<68.650000,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.667000,-1.535000,4.898100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,4.249000>}
box{<0,0,-0.203200><0.671965,0.035000,0.203200> rotate<0,75.005412,0> translate<68.667000,-1.535000,4.898100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.667000,-1.535000,26.851800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,27.500900>}
box{<0,0,-0.203200><0.671965,0.035000,0.203200> rotate<0,-75.005412,0> translate<68.667000,-1.535000,26.851800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.672800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,4.876800>}
box{<0,0,-0.203200><0.168000,0.035000,0.203200> rotate<0,0.000000,0> translate<68.672800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.767900,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,27.228800>}
box{<0,0,-0.203200><0.072900,0.035000,0.203200> rotate<0,0.000000,0> translate<68.767900,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.781600,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.059200,0.035000,0.203200> rotate<0,0.000000,0> translate<68.781600,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,27.500900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.840800,-1.535000,4.249000>}
box{<0,0,-0.203200><23.251900,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.840800,-1.535000,4.249000> }
texture{col_pol}
}
#end
union{
cylinder{<17.780000,0.038000,16.510000><17.780000,-1.538000,16.510000>0.406400}
cylinder{<22.860000,0.038000,16.510000><22.860000,-1.538000,16.510000>0.406400}
cylinder{<27.940000,0.038000,6.050000><27.940000,-1.538000,6.050000>0.406400}
cylinder{<27.940000,0.038000,11.130000><27.940000,-1.538000,11.130000>0.406400}
cylinder{<27.940000,0.038000,16.510000><27.940000,-1.538000,16.510000>0.406400}
cylinder{<33.020000,0.038000,16.510000><33.020000,-1.538000,16.510000>0.406400}
cylinder{<43.180000,0.038000,6.050000><43.180000,-1.538000,6.050000>0.406400}
cylinder{<43.180000,0.038000,11.130000><43.180000,-1.538000,11.130000>0.406400}
cylinder{<22.860000,0.038000,24.160000><22.860000,-1.538000,24.160000>0.406400}
cylinder{<17.780000,0.038000,24.160000><17.780000,-1.538000,24.160000>0.406400}
cylinder{<42.880000,0.038000,16.510000><42.880000,-1.538000,16.510000>0.406400}
cylinder{<37.800000,0.038000,16.510000><37.800000,-1.538000,16.510000>0.406400}
cylinder{<30.470000,0.038000,24.100000><30.470000,-1.538000,24.100000>0.508000}
cylinder{<27.930000,0.038000,24.100000><27.930000,-1.538000,24.100000>0.508000}
cylinder{<58.500000,0.038000,6.330000><58.500000,-1.538000,6.330000>0.508000}
cylinder{<58.500000,0.038000,8.870000><58.500000,-1.538000,8.870000>0.508000}
cylinder{<58.500000,0.038000,23.730000><58.500000,-1.538000,23.730000>0.508000}
cylinder{<58.500000,0.038000,26.270000><58.500000,-1.538000,26.270000>0.508000}
cylinder{<22.570000,0.038000,11.140000><22.570000,-1.538000,11.140000>0.550000}
cylinder{<22.570000,0.038000,6.640000><22.570000,-1.538000,6.640000>0.550000}
cylinder{<20.320000,0.038000,6.640000><20.320000,-1.538000,6.640000>0.550000}
cylinder{<18.070000,0.038000,6.640000><18.070000,-1.538000,6.640000>0.550000}
cylinder{<18.070000,0.038000,11.140000><18.070000,-1.538000,11.140000>0.550000}
cylinder{<24.070000,0.038000,8.890000><24.070000,-1.538000,8.890000>0.650000}
cylinder{<16.570000,0.038000,8.890000><16.570000,-1.538000,8.890000>0.650000}
cylinder{<37.810000,0.038000,11.140000><37.810000,-1.538000,11.140000>0.550000}
cylinder{<37.810000,0.038000,6.640000><37.810000,-1.538000,6.640000>0.550000}
cylinder{<35.560000,0.038000,6.640000><35.560000,-1.538000,6.640000>0.550000}
cylinder{<33.310000,0.038000,6.640000><33.310000,-1.538000,6.640000>0.550000}
cylinder{<33.310000,0.038000,11.140000><33.310000,-1.538000,11.140000>0.550000}
cylinder{<39.310000,0.038000,8.890000><39.310000,-1.538000,8.890000>0.650000}
cylinder{<31.810000,0.038000,8.890000><31.810000,-1.538000,8.890000>0.650000}
cylinder{<53.720000,0.038000,20.110000><53.720000,-1.538000,20.110000>0.300000}
cylinder{<63.880000,0.038000,12.490000><63.880000,-1.538000,12.490000>0.300000}
cylinder{<45.290000,0.038000,21.630000><45.290000,-1.538000,21.630000>0.406400}
cylinder{<35.130000,0.038000,21.630000><35.130000,-1.538000,21.630000>0.406400}
cylinder{<49.530000,0.038000,14.070000><49.530000,-1.538000,14.070000>0.406400}
cylinder{<49.530000,0.038000,24.230000><49.530000,-1.538000,24.230000>0.406400}
cylinder{<49.530000,0.038000,11.430000><49.530000,-1.538000,11.430000>0.406400}
cylinder{<49.530000,0.038000,6.350000><49.530000,-1.538000,6.350000>0.406400}
cylinder{<49.530000,0.038000,8.890000><49.530000,-1.538000,8.890000>0.406400}
cylinder{<11.430000,0.038000,16.510000><11.430000,-1.538000,16.510000>0.450000}
cylinder{<11.430000,0.038000,13.970000><11.430000,-1.538000,13.970000>0.450000}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.015200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.015200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.015200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,16.510000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.650200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.650200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.650200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,16.510000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<20.650200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,14.986000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,14.732000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,18.034000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,18.288000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,18.288000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.749000,0.000000,18.034000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.749000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.891000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.891000,0.000000,18.034000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.305000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,8.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.305000,0.000000,8.285200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.575000,0.000000,8.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,8.285200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,7.066000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,7.066000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.305000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,8.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.305000,0.000000,8.920200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.575000,0.000000,8.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,8.920200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,10.114000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,10.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,4.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,4.907000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,4.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,5.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,12.019000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.718000,0.000000,12.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,12.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,12.273000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,12.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,12.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,5.161000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.162000,0.000000,5.161000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.416000,0.000000,12.019000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<29.464000,0.000000,12.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<29.464000,0.000000,5.161000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.416000,0.000000,5.161000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.175200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,16.510000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.810200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,16.510000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.810200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,14.986000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.797000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,14.732000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,18.034000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.163000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,18.288000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,18.288000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.909000,0.000000,18.034000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.909000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.051000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.051000,0.000000,18.034000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.545000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.180000,0.000000,8.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<42.545000,0.000000,8.285200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.180000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.815000,0.000000,8.285200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<43.180000,0.000000,8.285200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,8.285200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,7.066000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.180000,0.000000,7.066000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.545000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.180000,0.000000,8.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<42.545000,0.000000,8.920200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.180000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.815000,0.000000,8.920200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<43.180000,0.000000,8.920200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,8.920200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,10.114000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<43.180000,0.000000,10.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,4.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,4.907000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.656000,0.000000,4.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,5.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,12.019000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.958000,0.000000,12.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,12.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,12.273000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.656000,0.000000,12.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,12.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,5.161000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.402000,0.000000,5.161000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.656000,0.000000,12.019000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.704000,0.000000,12.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.704000,0.000000,5.161000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.656000,0.000000,5.161000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.624800,0.000000,23.525000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.624800,0.000000,24.160000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<20.624800,0.000000,24.160000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.624800,0.000000,24.160000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.624800,0.000000,24.795000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<20.624800,0.000000,24.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.624800,0.000000,24.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,24.160000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<20.624800,0.000000,24.160000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.989800,0.000000,23.525000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.989800,0.000000,24.160000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<19.989800,0.000000,24.160000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.989800,0.000000,24.160000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<19.989800,0.000000,24.795000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<19.989800,0.000000,24.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.989800,0.000000,24.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,24.160000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,24.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,22.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,25.684000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,25.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,25.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,25.938000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,25.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,25.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,22.636000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,22.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,22.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,22.382000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,22.382000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.891000,0.000000,22.636000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.891000,0.000000,25.684000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.749000,0.000000,25.684000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.749000,0.000000,22.636000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.644800,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.644800,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<40.644800,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.644800,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.644800,0.000000,17.145000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<40.644800,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.644800,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.864000,0.000000,16.510000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<40.644800,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.009800,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.009800,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<40.009800,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.009800,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.009800,0.000000,17.145000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<40.009800,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.009800,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.816000,0.000000,16.510000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.816000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.023000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.023000,0.000000,18.034000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.023000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.769000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.911000,0.000000,18.288000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.911000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.657000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.657000,0.000000,14.986000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.657000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.911000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.769000,0.000000,14.732000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.911000,0.000000,14.732000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.911000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.911000,0.000000,18.034000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.769000,0.000000,18.034000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.769000,0.000000,14.986000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.930000,0.000000,26.640000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.930000,0.000000,27.021000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.930000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,27.021000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<26.660000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,27.021000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.660000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.184000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.930000,0.000000,27.021000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.930000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.200000,0.000000,27.021000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.930000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.740000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.740000,0.000000,27.021000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<31.740000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.740000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.200000,0.000000,27.021000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.200000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,21.179000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<26.660000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.200000,0.000000,21.179000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.660000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.740000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.740000,0.000000,21.179000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.740000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.740000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.105000,0.000000,21.179000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.105000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.105000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.835000,0.000000,21.179000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.835000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.835000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.200000,0.000000,21.179000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.200000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.914000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.295000,0.000000,21.179000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.914000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.660000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.295000,0.000000,21.179000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.660000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.295000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.295000,0.000000,21.814000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<27.295000,0.000000,21.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.295000,0.000000,21.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.565000,0.000000,21.814000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.295000,0.000000,21.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.565000,0.000000,21.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.565000,0.000000,21.179000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<28.565000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.565000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.835000,0.000000,21.179000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.565000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.835000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.835000,0.000000,21.814000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<29.835000,0.000000,21.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.835000,0.000000,21.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.105000,0.000000,21.814000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.835000,0.000000,21.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.105000,0.000000,21.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.105000,0.000000,21.179000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.105000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.105000,0.000000,21.179000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.740000,0.000000,21.179000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<31.105000,0.000000,21.179000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,27.021000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<27.930000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,26.005000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<27.930000,0.000000,26.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,26.005000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.184000,0.000000,26.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.470000,0.000000,26.005000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<30.216000,0.000000,26.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.470000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.470000,0.000000,27.021000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<30.470000,0.000000,27.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.930000,0.000000,26.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,25.497000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<27.930000,0.000000,26.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,26.005000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<28.184000,0.000000,26.005000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.184000,0.000000,25.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,25.497000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.184000,0.000000,25.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,25.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.470000,0.000000,26.005000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<30.216000,0.000000,25.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,27.021000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.216000,0.000000,26.005000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.216000,0.000000,26.005000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<27.930000,0.000000,24.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.470000,0.000000,24.100000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.040000,0.000000,8.870000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,8.870000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.040000,0.000000,8.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,10.140000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.500000,0.000000,10.140000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,8.870000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.421000,0.000000,8.870000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,8.616000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,8.870000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.421000,0.000000,8.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,8.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,7.600000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.421000,0.000000,7.600000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,5.060000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.500000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,7.600000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.421000,0.000000,7.600000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,10.140000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,10.140000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,7.600000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,7.600000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,5.060000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,5.695000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.579000,0.000000,5.695000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,5.695000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,6.965000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<55.579000,0.000000,6.965000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,6.965000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,7.600000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.579000,0.000000,7.600000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,9.886000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,9.505000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.579000,0.000000,9.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,9.505000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,9.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,9.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,9.505000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,9.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,9.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,8.235000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.214000,0.000000,8.235000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,8.235000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,8.235000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,8.235000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,8.235000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,6.965000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,6.965000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,6.965000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,6.965000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,6.965000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,6.965000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,5.695000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.214000,0.000000,5.695000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,5.695000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,5.695000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,5.695000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,5.695000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,5.060000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,8.870000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,8.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.616000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,8.616000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.616000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.584000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,6.584000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.584000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.330000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,6.330000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.330000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,6.330000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,6.330000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,8.616000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<59.897000,0.000000,8.616000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,8.616000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,8.616000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,8.616000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,8.616000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,6.584000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.897000,0.000000,6.584000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,6.584000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.330000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<59.897000,0.000000,6.584000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,6.584000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,6.584000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,6.584000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.500000,0.000000,8.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.500000,0.000000,6.330000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.040000,0.000000,26.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,26.270000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.040000,0.000000,26.270000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,27.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,27.540000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.500000,0.000000,27.540000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,27.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,26.270000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.421000,0.000000,26.270000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,26.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,26.270000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.421000,0.000000,26.270000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,26.270000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,25.000000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<61.421000,0.000000,25.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,22.460000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,22.460000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.500000,0.000000,22.460000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,22.460000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.421000,0.000000,25.000000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.421000,0.000000,25.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,27.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,27.540000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,27.540000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,27.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,25.000000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,25.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.500000,0.000000,22.460000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,22.460000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,22.460000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,22.460000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,23.095000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.579000,0.000000,23.095000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,23.095000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,24.365000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<55.579000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,25.000000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.579000,0.000000,25.000000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,27.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.579000,0.000000,26.905000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.579000,0.000000,26.905000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,27.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,26.905000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,26.905000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,26.905000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,26.905000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,26.905000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,26.905000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,25.635000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.214000,0.000000,25.635000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,25.635000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,25.635000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,25.635000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,25.635000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,24.365000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,24.365000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,23.095000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.214000,0.000000,23.095000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.214000,0.000000,23.095000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,23.095000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.579000,0.000000,23.095000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,23.095000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.579000,0.000000,22.460000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.579000,0.000000,22.460000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.270000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,26.270000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,26.270000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.270000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.016000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,26.016000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.016000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.984000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,23.984000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.984000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.730000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<60.405000,0.000000,23.730000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.730000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,23.730000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,23.730000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.270000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,26.016000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<59.897000,0.000000,26.016000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,26.016000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,26.016000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,26.016000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,26.016000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,23.984000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.897000,0.000000,23.984000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.897000,0.000000,23.984000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.730000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<59.897000,0.000000,23.984000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.421000,0.000000,23.984000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.405000,0.000000,23.984000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<60.405000,0.000000,23.984000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.500000,0.000000,26.270000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.500000,0.000000,23.730000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,12.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,10.140000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.970000,0.000000,10.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,7.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,5.240000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.970000,0.000000,5.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,5.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,5.240000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.670000,0.000000,5.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,12.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,12.540000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.670000,0.000000,12.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.970000,0.000000,7.490000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.970000,0.000000,7.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,7.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,10.290000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.670000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,12.540000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.670000,0.000000,12.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,5.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.670000,0.000000,7.640000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.670000,0.000000,7.640000> }
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,12.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,10.140000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.210000,0.000000,10.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,7.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,5.240000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.210000,0.000000,5.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,5.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,5.240000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.910000,0.000000,5.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,12.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,12.540000>}
box{<0,0,-0.101600><7.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.910000,0.000000,12.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.210000,0.000000,7.490000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.210000,0.000000,7.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,7.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,10.290000>}
box{<0,0,-0.101600><2.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<31.910000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,10.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,12.540000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<31.910000,0.000000,12.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,5.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.910000,0.000000,7.640000>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<31.910000,0.000000,7.640000> }
//L3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.150000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.150000,0.000000,18.840000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.150000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.150000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.515000,0.000000,18.840000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.515000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.245000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.610000,0.000000,18.840000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.610000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.975000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.705000,0.000000,18.840000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.705000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.070000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.165000,0.000000,18.840000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<58.165000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.530000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.260000,0.000000,18.840000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.260000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.625000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.990000,0.000000,18.840000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.990000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.720000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450000,0.000000,18.840000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.450000,0.000000,18.840000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450000,0.000000,13.760000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.450000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085000,0.000000,13.760000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.450000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.355000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.990000,0.000000,13.760000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.355000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.625000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.895000,0.000000,13.760000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.625000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.530000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.435000,0.000000,13.760000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.530000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.070000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.340000,0.000000,13.760000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.070000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.975000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.610000,0.000000,13.760000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.975000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.880000,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.150000,0.000000,13.760000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<63.880000,0.000000,13.760000> }
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<64.197500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<63.562500,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.515000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.880000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<63.880000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.880000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.245000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<63.245000,0.000000,13.760000> }
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<64.197500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<63.562500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<62.292500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<60.387500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<57.847500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<55.942500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<54.672500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<54.037500,0.000000,18.840000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<62.927500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<61.657500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<59.752500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<57.212500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<55.307500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<54.037500,0.000000,13.760000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<53.402500,0.000000,13.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.245000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.610000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<62.610000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.610000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.975000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<61.975000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.975000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.340000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<61.340000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.705000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.070000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<60.070000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.070000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.435000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<59.435000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.165000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.530000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<57.530000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.530000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.895000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<56.895000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.260000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.625000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<55.625000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.625000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.990000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<54.990000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.990000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.355000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<54.355000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.355000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.720000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<53.720000,0.000000,13.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.720000,0.000000,18.840000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085000,0.000000,13.760000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<53.085000,0.000000,13.760000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.130000,0.000000,21.630000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.146000,0.000000,21.630000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.130000,0.000000,21.630000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.290000,0.000000,21.630000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.274000,0.000000,21.630000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.274000,0.000000,21.630000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.131000,0.000000,20.741000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.131000,0.000000,22.519000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.289000,0.000000,22.519000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.289000,0.000000,20.741000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.385000,0.000000,22.519000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.385000,0.000000,20.741000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.385000,0.000000,20.741000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.131000,0.000000,20.487000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750000,0.000000,20.487000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.750000,0.000000,20.487000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.623000,0.000000,20.614000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750000,0.000000,20.487000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.623000,0.000000,20.614000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.131000,0.000000,22.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750000,0.000000,22.773000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.750000,0.000000,22.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.623000,0.000000,22.646000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750000,0.000000,22.773000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.623000,0.000000,22.646000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.797000,0.000000,20.614000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.670000,0.000000,20.487000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.670000,0.000000,20.487000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.797000,0.000000,20.614000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.623000,0.000000,20.614000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.797000,0.000000,20.614000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.797000,0.000000,22.646000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.670000,0.000000,22.773000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<37.670000,0.000000,22.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.797000,0.000000,22.646000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.623000,0.000000,22.646000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.797000,0.000000,22.646000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.289000,0.000000,20.487000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.670000,0.000000,20.487000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.289000,0.000000,20.487000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.289000,0.000000,22.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.670000,0.000000,22.773000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.289000,0.000000,22.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.035000,0.000000,22.519000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.035000,0.000000,20.741000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.035000,0.000000,20.741000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<36.603200,0.000000,21.630000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<43.816800,0.000000,21.630000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.530000,0.000000,24.230000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.530000,0.000000,23.214000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<49.530000,0.000000,23.214000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.530000,0.000000,14.070000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.530000,0.000000,15.086000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<49.530000,0.000000,15.086000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.641000,0.000000,16.229000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<50.419000,0.000000,16.229000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<50.419000,0.000000,22.071000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.641000,0.000000,22.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,15.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,15.975000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,15.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,16.229000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,16.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.387000,0.000000,16.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,16.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,16.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.387000,0.000000,16.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,16.229000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,16.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.673000,0.000000,16.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,16.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,16.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.546000,0.000000,16.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,21.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,21.690000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.387000,0.000000,21.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,21.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,16.737000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.514000,0.000000,16.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,21.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,21.690000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.546000,0.000000,21.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,21.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,16.737000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.546000,0.000000,16.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,22.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,21.690000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.387000,0.000000,21.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,22.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,21.690000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.673000,0.000000,21.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,22.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,22.325000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,22.325000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<49.530000,0.000000,22.756800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<49.530000,0.000000,15.543200>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.181000,0.000000,6.795000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.181000,0.000000,10.985000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.181000,0.000000,10.985000> }
object{ARC(2.667000,0.127000,115.208327,244.791673,0.036000) translate<49.530000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,10.026000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,7.754000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,7.754000> }
object{ARC(2.667000,0.127000,244.789729,272.727231,0.036000) translate<49.530100,0.000000,8.890000>}
object{ARC(2.667000,0.127000,272.731522,295.210271,0.036000) translate<49.529900,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,7.486000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,6.226000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,6.226000> }
object{ARC(2.667000,0.127000,295.210271,308.248808,0.036000) translate<49.529900,0.000000,8.889500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,7.754000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,7.486000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,7.486000> }
object{ARC(2.667000,0.127000,64.789729,87.268478,0.036000) translate<49.529900,0.000000,8.890000>}
object{ARC(2.667000,0.127000,87.272769,115.210271,0.036000) translate<49.530100,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,11.554000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,10.294000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,10.294000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,10.294000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,10.026000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,10.026000> }
object{ARC(2.667000,0.127000,51.751192,65.360649,0.036000) translate<49.529900,0.000000,8.890500>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.225000,0.000000,9.235000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.225000,0.000000,23.785000>}
box{<0,0,-0.101600><14.550000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.225000,0.000000,23.785000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  RF_FRONT_END(-25.030000,0,-15.870000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//L1		71K
//L2		71K
//L3	T50_INDUCTOR	T50_INDUCTOR
