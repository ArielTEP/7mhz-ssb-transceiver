//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/VFO/VFO.brd
//2010. 04. 14. 15:54:31

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
#local cam_y = 234;
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

#local lgt1_pos_x = 27;
#local lgt1_pos_y = 41;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.745224;
#local lgt2_pos_x = -27;
#local lgt2_pos_y = 41;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.745224;
#local lgt3_pos_x = 27;
#local lgt3_pos_y = 41;
#local lgt3_pos_z = -15;
#local lgt3_intense = 0.745224;
#local lgt4_pos_x = -27;
#local lgt4_pos_y = 41;
#local lgt4_pos_z = -15;
#local lgt4_intense = 0.745224;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 73.330000;
#declare pcb_y_size = 43.170000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(284);
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
	//translate<-36.665000,0,-21.585000>
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


#macro VFO(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<1.270000,0.000000><74.600000,0.000000>
<74.600000,0.000000><74.600000,43.170000>
<74.600000,43.170000><1.270000,43.170000>
<1.270000,43.170000><1.270000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<71.120000,1,3.810000><71.120000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<71.120000,1,39.370000><71.120000,-5,39.370000>1.600000 texture{col_hls}}
cylinder{<5.080000,1,39.370000><5.080000,-5,39.370000>1.600000 texture{col_hls}}
cylinder{<5.080000,1,3.810000><5.080000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("120pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.780000,0.000000,26.670000>}#end		//ceramic disc capacitator C1 120pF C050-035X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.860000,0.000000,26.670000>}#end		//ceramic disc capacitator C2 100pF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.860000,0.000000,36.830000>}#end		//ceramic disc capacitator C3 0.1uF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("470pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.940000,0.000000,26.670000>}#end		//ceramic disc capacitator C4 470pF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.020000,0.000000,19.050000>}#end		//ceramic disc capacitator C5  C050-035X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.020000,0.000000,10.160000>}#end		//ceramic disc capacitator C6  C050-035X075
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<44.450000,0.000000,35.560000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C7 10uF E2,5-6
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_50MM_76MM("22pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.530000,0.000000,16.510000>}#end		//ceramic disc capacitator C8 22pF C050-035X075
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,20.320000>}#end		//ceramic disc capacitator C9 100pF C050-035X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("8Z2",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<38.100000,0.000000,31.750000>}#end		//Diode DO35 10mm hor. D1 8Z2 DO35Z10
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.050000,0.000000,13.970000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<67.310000,0.000000,29.210000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<67.310000,0.000000,11.430000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_L1) #declare global_pack_L1=yes; object {RES_DIS_0207_15MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,26.670000>}#end		//Discrete Resistor 0,3W 15MM Grid L1  0207/15
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,24.130000>}#end		//TO92 bend vertical Q1 BC548B TO92-EBC
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {TR_TO92_L("BC548B",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<59.690000,0.000000,26.670000>}#end		//TO92 bend vertical Q2 BC548B TO92-EBC
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.670000,0.000000,13.970000>}#end		//Discrete Resistor 0,3W 12MM Grid R1 10k 0207/12
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.910000,0.000000,22.860000>}#end		//Discrete Resistor 0,3W 12MM Grid R2 1k 0207/12
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<55.880000,0.000000,13.970000>}#end		//Discrete Resistor 0,3W 12MM Grid R3 1k 0207/12
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Yellow}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 12MM Grid R4 270k 0207/12
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_12MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.020000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 12MM Grid R5 10k 0207/12
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_12MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<60.960000,0.000000,36.830000>}#end		//Discrete Resistor 0,3W 12MM Grid R6 270E 0207/12
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<17.780000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<17.780000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.860000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.860000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<44.450000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<44.450000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<46.990000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<52.070000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<38.100000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<38.100000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<67.310000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<67.310000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<67.310000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<67.310000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<58.420000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<26.670000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<26.670000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.070000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.070000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<67.310000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.610000,0,36.830000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,34.290000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<8.890000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,17.780000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<17.780000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,19.050000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,0.000000,0> translate<8.890000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,24.130000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.780000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,29.210000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<17.780000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,31.750000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<15.240000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,19.050000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<20.320000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,7.620000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,44.997030,0> translate<17.780000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,21.590000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.320000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,24.130000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<22.860000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,29.210000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<22.860000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,31.750000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.780000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,7.620000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,22.860000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.670000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,31.750000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,24.130000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<26.670000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,29.210000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<27.940000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,30.480000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<26.670000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,7.620000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<26.670000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,16.510000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<33.020000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,21.590000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<33.020000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,24.130000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.940000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,36.830000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,0.000000,0> translate<25.400000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,-1.535000,36.830000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.370000,-1.535000,7.620000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,16.510000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,27.940000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<41.910000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,-1.535000,24.130000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,24.130000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<43.180000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,36.830000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<38.100000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,16.510000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<41.910000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,16.510000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<45.720000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,21.590000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<46.990000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,24.130000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<44.450000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,26.670000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,-90.000000,0> translate<46.990000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,36.830000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<44.450000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,24.130000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,90.000000,0> translate<52.070000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,25.400000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<52.070000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,36.830000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.990000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,-1.535000,26.670000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<52.070000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,-1.535000,36.830000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<52.070000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.370000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,-1.535000,7.620000>}
box{<0,0,-0.406400><16.510000,0.035000,0.406400> rotate<0,0.000000,0> translate<39.370000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,36.830000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<54.610000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,20.320000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<55.880000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,24.130000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<58.420000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,26.670000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<53.340000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,29.210000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,-90.000000,0> translate<58.420000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,35.560000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<57.150000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,-1.535000,20.320000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<58.420000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<66.040000,-1.535000,7.620000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,0.000000,0> translate<55.880000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<66.040000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,8.890000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<66.040000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,20.320000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,36.830000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,36.830000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,4.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,38.725900>}
box{<0,0,-0.127000><34.271900,0.035000,0.127000> rotate<0,90.000000,0> translate<2.412900,-1.535000,38.725900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,4.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.523900,-1.535000,4.868700>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,-75.010330,0> translate<2.412900,-1.535000,4.454000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.444500,-1.535000,4.572000>}
box{<0,0,-0.127000><0.031600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.512500,-1.535000,4.826000>}
box{<0,0,-0.127000><0.099600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.645900,-1.535000,5.080000>}
box{<0,0,-0.127000><0.233000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.792600,-1.535000,5.334000>}
box{<0,0,-0.127000><0.379700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.978800,-1.535000,5.588000>}
box{<0,0,-0.127000><0.565900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.232800,-1.535000,5.842000>}
box{<0,0,-0.127000><0.819900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.553600,-1.535000,6.096000>}
box{<0,0,-0.127000><1.140700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.993500,-1.535000,6.350000>}
box{<0,0,-0.127000><1.580600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.213200,-1.535000,6.604000>}
box{<0,0,-0.127000><23.800300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.959200,-1.535000,6.858000>}
box{<0,0,-0.127000><23.546300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.705200,-1.535000,7.112000>}
box{<0,0,-0.127000><23.292300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.366000>}
box{<0,0,-0.127000><23.215700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,7.620000>}
box{<0,0,-0.127000><24.180200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.874000>}
box{<0,0,-0.127000><23.215700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.705300,-1.535000,8.128000>}
box{<0,0,-0.127000><23.292400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.959300,-1.535000,8.382000>}
box{<0,0,-0.127000><23.546400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.213300,-1.535000,8.636000>}
box{<0,0,-0.127000><23.800400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,8.890000>}
box{<0,0,-0.127000><71.044100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.024200,-1.535000,9.144000>}
box{<0,0,-0.127000><63.611300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.693500,-1.535000,9.398000>}
box{<0,0,-0.127000><63.280600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.523900,-1.535000,9.652000>}
box{<0,0,-0.127000><63.111000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.430900,-1.535000,9.906000>}
box{<0,0,-0.127000><63.018000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,10.160000>}
box{<0,0,-0.127000><64.769600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.431000,-1.535000,10.414000>}
box{<0,0,-0.127000><63.018100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.524100,-1.535000,10.668000>}
box{<0,0,-0.127000><63.111200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.693600,-1.535000,10.922000>}
box{<0,0,-0.127000><63.280700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281000,-1.535000,11.176000>}
box{<0,0,-0.127000><29.868100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.027000,-1.535000,11.430000>}
box{<0,0,-0.127000><29.614100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.552200,-1.535000,11.684000>}
box{<0,0,-0.127000><17.139300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.183300,-1.535000,11.938000>}
box{<0,0,-0.127000><16.770400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.256200,-1.535000,12.192000>}
box{<0,0,-0.127000><14.843300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.925500,-1.535000,12.446000>}
box{<0,0,-0.127000><14.512600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.755900,-1.535000,12.700000>}
box{<0,0,-0.127000><14.343000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.662900,-1.535000,12.954000>}
box{<0,0,-0.127000><14.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.208000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.462000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.716000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.652500,-1.535000,13.970000>}
box{<0,0,-0.127000><15.239600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.224000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.478000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.732000>}
box{<0,0,-0.127000><14.224100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.663000,-1.535000,14.986000>}
box{<0,0,-0.127000><14.250100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.756100,-1.535000,15.240000>}
box{<0,0,-0.127000><14.343200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.925600,-1.535000,15.494000>}
box{<0,0,-0.127000><14.512700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.256500,-1.535000,15.748000>}
box{<0,0,-0.127000><14.843600,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,16.002000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,16.256000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,16.510000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,16.764000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,17.018000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,17.272000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,17.526000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,17.780000>}
box{<0,0,-0.127000><16.560900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.433200,-1.535000,18.034000>}
box{<0,0,-0.127000><6.020300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.179200,-1.535000,18.288000>}
box{<0,0,-0.127000><5.766300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.925200,-1.535000,18.542000>}
box{<0,0,-0.127000><5.512300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,18.796000>}
box{<0,0,-0.127000><5.435700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,19.050000>}
box{<0,0,-0.127000><6.400200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,19.304000>}
box{<0,0,-0.127000><5.435700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.925300,-1.535000,19.558000>}
box{<0,0,-0.127000><5.512400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.179300,-1.535000,19.812000>}
box{<0,0,-0.127000><5.766400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.433300,-1.535000,20.066000>}
box{<0,0,-0.127000><6.020400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.686200,-1.535000,20.320000>}
box{<0,0,-0.127000><17.273300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.940200,-1.535000,20.574000>}
box{<0,0,-0.127000><17.527300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.194200,-1.535000,20.828000>}
box{<0,0,-0.127000><17.781300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.448200,-1.535000,21.082000>}
box{<0,0,-0.127000><18.035300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.702200,-1.535000,21.336000>}
box{<0,0,-0.127000><18.289300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.956200,-1.535000,21.590000>}
box{<0,0,-0.127000><18.543300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210200,-1.535000,21.844000>}
box{<0,0,-0.127000><18.797300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.464200,-1.535000,22.098000>}
box{<0,0,-0.127000><19.051300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,22.352000>}
box{<0,0,-0.127000><19.100900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,22.606000>}
box{<0,0,-0.127000><19.100900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,22.860000>}
box{<0,0,-0.127000><19.100900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.323200,-1.535000,23.114000>}
box{<0,0,-0.127000><14.910300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.069200,-1.535000,23.368000>}
box{<0,0,-0.127000><14.656300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.815200,-1.535000,23.622000>}
box{<0,0,-0.127000><14.402300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,23.876000>}
box{<0,0,-0.127000><14.325700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703100,-1.535000,24.130000>}
box{<0,0,-0.127000><15.290200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.384000>}
box{<0,0,-0.127000><14.325700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.815300,-1.535000,24.638000>}
box{<0,0,-0.127000><14.402400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.069300,-1.535000,24.892000>}
box{<0,0,-0.127000><14.656400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.323300,-1.535000,25.146000>}
box{<0,0,-0.127000><14.910400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.867100,-1.535000,25.400000>}
box{<0,0,-0.127000><19.454200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.121100,-1.535000,25.654000>}
box{<0,0,-0.127000><19.708200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.061600,-1.535000,25.908000>}
box{<0,0,-0.127000><34.648700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.162000>}
box{<0,0,-0.127000><34.645700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.416000>}
box{<0,0,-0.127000><34.645700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023100,-1.535000,26.670000>}
box{<0,0,-0.127000><35.610200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.924000>}
box{<0,0,-0.127000><34.645700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,27.178000>}
box{<0,0,-0.127000><34.645700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.061800,-1.535000,27.432000>}
box{<0,0,-0.127000><34.648900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.041000,-1.535000,27.686000>}
box{<0,0,-0.127000><14.628100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.787000,-1.535000,27.940000>}
box{<0,0,-0.127000><14.374100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.533000,-1.535000,28.194000>}
box{<0,0,-0.127000><14.120100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.279000,-1.535000,28.448000>}
box{<0,0,-0.127000><13.866100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,28.702000>}
box{<0,0,-0.127000><13.766900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,28.956000>}
box{<0,0,-0.127000><13.766900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,29.210000>}
box{<0,0,-0.127000><13.766900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,29.464000>}
box{<0,0,-0.127000><13.766900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,29.718000>}
box{<0,0,-0.127000><13.766900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.279200,-1.535000,29.972000>}
box{<0,0,-0.127000><13.866300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.226000>}
box{<0,0,-0.127000><14.020900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.480000>}
box{<0,0,-0.127000><14.020900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.734000>}
box{<0,0,-0.127000><14.020900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.988000>}
box{<0,0,-0.127000><14.020900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.384100,-1.535000,31.242000>}
box{<0,0,-0.127000><13.971200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.130100,-1.535000,31.496000>}
box{<0,0,-0.127000><13.717200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.876100,-1.535000,31.750000>}
box{<0,0,-0.127000><13.463200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.622100,-1.535000,32.004000>}
box{<0,0,-0.127000><13.209200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.368100,-1.535000,32.258000>}
box{<0,0,-0.127000><12.955200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.114100,-1.535000,32.512000>}
box{<0,0,-0.127000><12.701200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.151000,-1.535000,32.766000>}
box{<0,0,-0.127000><5.738100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.897000,-1.535000,33.020000>}
box{<0,0,-0.127000><5.484100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.643000,-1.535000,33.274000>}
box{<0,0,-0.127000><5.230100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.389000,-1.535000,33.528000>}
box{<0,0,-0.127000><4.976100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,33.782000>}
box{<0,0,-0.127000><4.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.036000>}
box{<0,0,-0.127000><4.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.290000>}
box{<0,0,-0.127000><4.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.544000>}
box{<0,0,-0.127000><4.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.798000>}
box{<0,0,-0.127000><4.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.389100,-1.535000,35.052000>}
box{<0,0,-0.127000><4.976200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.643100,-1.535000,35.306000>}
box{<0,0,-0.127000><5.230200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.897100,-1.535000,35.560000>}
box{<0,0,-0.127000><5.484200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.151100,-1.535000,35.814000>}
box{<0,0,-0.127000><5.738200,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.609200,-1.535000,36.068000>}
box{<0,0,-0.127000><17.196300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.355200,-1.535000,36.322000>}
box{<0,0,-0.127000><16.942300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.576000>}
box{<0,0,-0.127000><16.865700,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.993300,-1.535000,36.830000>}
box{<0,0,-0.127000><1.580400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.553300,-1.535000,37.084000>}
box{<0,0,-0.127000><1.140400,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.232700,-1.535000,37.338000>}
box{<0,0,-0.127000><0.819800,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.978700,-1.535000,37.592000>}
box{<0,0,-0.127000><0.565800,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.792400,-1.535000,37.846000>}
box{<0,0,-0.127000><0.379500,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.645800,-1.535000,38.100000>}
box{<0,0,-0.127000><0.232900,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.512400,-1.535000,38.354000>}
box{<0,0,-0.127000><0.099500,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.444400,-1.535000,38.608000>}
box{<0,0,-0.127000><0.031500,0.035000,0.127000> rotate<0,0.000000,0> translate<2.412900,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.412900,-1.535000,38.725900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.523900,-1.535000,38.311200>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,75.010330,0> translate<2.412900,-1.535000,38.725900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.523900,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.885000,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<2.523900,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.523900,-1.535000,38.311200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.885000,-1.535000,37.685700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<2.523900,-1.535000,38.311200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.885000,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.395700,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.885000,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.885000,-1.535000,37.685700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.395700,-1.535000,37.175000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<2.885000,-1.535000,37.685700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.395700,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.021200,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<3.395700,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.395700,-1.535000,37.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.021200,-1.535000,36.813900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<3.395700,-1.535000,37.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.021200,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.718800,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<4.021200,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.021200,-1.535000,36.813900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.718800,-1.535000,36.627000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<4.021200,-1.535000,36.813900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.718800,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.441100,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<4.718800,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.718800,-1.535000,36.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.441100,-1.535000,36.627000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<4.718800,-1.535000,36.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.441100,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<5.441100,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.441100,-1.535000,36.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,36.813900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<5.441100,-1.535000,36.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.724000,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,1.253900>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,-14.983731,0> translate<5.724000,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.724000,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.475900,-1.535000,1.142900>}
box{<0,0,-0.127000><64.751900,0.035000,0.127000> rotate<0,0.000000,0> translate<5.724000,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.761300,-1.535000,42.027000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,41.926000>}
box{<0,0,-0.127000><0.390681,0.035000,0.127000> rotate<0,14.981442,0> translate<5.761300,-1.535000,42.027000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.761300,-1.535000,42.027000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.438600,-1.535000,42.027000>}
box{<0,0,-0.127000><64.677300,0.035000,0.127000> rotate<0,0.000000,0> translate<5.761300,-1.535000,42.027000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,1.253900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,1.615000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<6.138700,-1.535000,1.253900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<6.138700,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,36.813900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,37.175000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<6.138700,-1.535000,36.813900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.138700,-1.535000,41.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,41.564900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<6.138700,-1.535000,41.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.166500,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.033300,-1.535000,1.270000>}
box{<0,0,-0.127000><63.866800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.166500,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.166500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.033500,-1.535000,6.350000>}
box{<0,0,-0.127000><63.867000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.166500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.166500,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,36.830000>}
box{<0,0,-0.127000><14.076600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.166500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.166500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.033500,-1.535000,41.910000>}
box{<0,0,-0.127000><63.867000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.166500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.606400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.593600,-1.535000,6.096000>}
box{<0,0,-0.127000><62.987200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.606400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.606400,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.593600,-1.535000,41.656000>}
box{<0,0,-0.127000><62.987200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.606400,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.606500,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.593300,-1.535000,1.524000>}
box{<0,0,-0.127000><62.986800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.606500,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.606500,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,37.084000>}
box{<0,0,-0.127000><12.672100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.606500,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,1.615000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,2.125700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.764200,-1.535000,1.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<6.764200,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,37.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,37.685700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.764200,-1.535000,37.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.764200,-1.535000,41.564900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,41.054200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<6.764200,-1.535000,41.564900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927100,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.272800,-1.535000,5.842000>}
box{<0,0,-0.127000><62.345700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.927100,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927100,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.272800,-1.535000,41.402000>}
box{<0,0,-0.127000><62.345700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.927100,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927200,-1.535000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.272700,-1.535000,1.778000>}
box{<0,0,-0.127000><62.345500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.927200,-1.535000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927200,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.355300,-1.535000,37.338000>}
box{<0,0,-0.127000><12.428100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.927200,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.181100,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.018800,-1.535000,5.588000>}
box{<0,0,-0.127000><61.837700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.181100,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.181100,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.018800,-1.535000,41.148000>}
box{<0,0,-0.127000><61.837700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.181100,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.181200,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.018700,-1.535000,2.032000>}
box{<0,0,-0.127000><61.837500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.181200,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.181200,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.609300,-1.535000,37.592000>}
box{<0,0,-0.127000><12.428100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.181200,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,2.125700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,2.751200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<7.274900,-1.535000,2.125700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,4.868700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<7.274900,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,37.685700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,38.311200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<7.274900,-1.535000,37.685700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.274900,-1.535000,41.054200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,40.428700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<7.274900,-1.535000,41.054200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,33.627200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,32.689800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<7.289800,-1.535000,33.627200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.952700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,33.627200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.289800,-1.535000,33.627200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289800,-1.535000,34.952700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,35.890100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.289800,-1.535000,34.952700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.367400,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832400,-1.535000,2.286000>}
box{<0,0,-0.127000><61.465000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.367400,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.367400,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832600,-1.535000,5.334000>}
box{<0,0,-0.127000><61.465200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.367400,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.367400,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.863300,-1.535000,37.846000>}
box{<0,0,-0.127000><12.495900,0.035000,0.127000> rotate<0,0.000000,0> translate<7.367400,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.367400,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832600,-1.535000,40.894000>}
box{<0,0,-0.127000><61.465200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.367400,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.514000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.685800,-1.535000,2.540000>}
box{<0,0,-0.127000><61.171800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.514000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.514000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.407100,-1.535000,38.100000>}
box{<0,0,-0.127000><16.893100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.514000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.514100,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.685900,-1.535000,5.080000>}
box{<0,0,-0.127000><61.171800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.514100,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.514100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.685900,-1.535000,40.640000>}
box{<0,0,-0.127000><61.171800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.514100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,2.751200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,3.448800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<7.636000,-1.535000,2.751200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,4.171100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<7.636000,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,38.311200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.008800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<7.636000,-1.535000,38.311200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636000,-1.535000,40.428700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.731100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<7.636000,-1.535000,40.428700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.647400,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.552400,-1.535000,2.794000>}
box{<0,0,-0.127000><60.905000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.647400,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.647400,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.661100,-1.535000,38.354000>}
box{<0,0,-0.127000><17.013700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.647400,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.647500,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.552500,-1.535000,4.826000>}
box{<0,0,-0.127000><60.905000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.647500,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.647500,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.552500,-1.535000,40.386000>}
box{<0,0,-0.127000><60.905000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.647500,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.715500,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.484300,-1.535000,3.048000>}
box{<0,0,-0.127000><60.768800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.715500,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.715500,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.484500,-1.535000,4.572000>}
box{<0,0,-0.127000><60.769000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.715500,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.715500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.954600,-1.535000,38.608000>}
box{<0,0,-0.127000><29.239100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.715500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.715500,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.484500,-1.535000,40.132000>}
box{<0,0,-0.127000><60.769000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.715500,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.783500,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.416300,-1.535000,3.302000>}
box{<0,0,-0.127000><60.632800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.783500,-1.535000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.783500,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.230000,-1.535000,38.862000>}
box{<0,0,-0.127000><29.446500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.783500,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.783600,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.416400,-1.535000,4.318000>}
box{<0,0,-0.127000><60.632800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.783600,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.783600,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.416400,-1.535000,39.878000>}
box{<0,0,-0.127000><60.632800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.783600,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,3.448800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,4.171100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<7.822900,-1.535000,4.171100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,3.556000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,3.810000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,4.064000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.008800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.731100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<7.822900,-1.535000,39.731100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.116000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.370000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.822900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.624000>}
box{<0,0,-0.127000><60.554100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.822900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,18.618600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,18.008600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<7.848600,-1.535000,18.618600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,18.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,18.618600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.848600,-1.535000,18.618600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,18.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,18.973600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.848600,-1.535000,18.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,19.126200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,19.126200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.848600,-1.535000,19.126200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,19.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,19.126200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.848600,-1.535000,19.126200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.848600,-1.535000,19.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,20.091300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.848600,-1.535000,19.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,32.689800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,32.689800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.227200,-1.535000,32.689800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.227200,-1.535000,35.890100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,35.890100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.227200,-1.535000,35.890100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.008600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.458600,-1.535000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.458600,-1.535000,20.091300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,20.091300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.458600,-1.535000,20.091300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,19.126200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813100,-1.535000,18.973600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.813100,-1.535000,18.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.973100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.813600,-1.535000,18.973100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.034000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.288000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.542000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.796000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,18.973100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.973100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,18.973100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,19.126800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,20.091300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.813600,-1.535000,20.091300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,19.126800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,19.126800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,19.126800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,19.304000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,19.558000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,19.812000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.813600,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,20.066000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.813600,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,18.008600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966200,-1.535000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.973100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,18.008600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.966200,-1.535000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,20.091300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,19.126800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.966200,-1.535000,19.126800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966200,-1.535000,20.091300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,20.091300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966200,-1.535000,20.091300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,18.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,19.126200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<8.966800,-1.535000,19.126200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,18.973600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,18.973600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,18.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,19.050000>}
box{<0,0,-0.127000><10.007000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.966800,-1.535000,19.126200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,19.126200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.966800,-1.535000,19.126200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,18.618600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.321300,-1.535000,18.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.321300,-1.535000,20.091300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,19.481300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<9.321300,-1.535000,20.091300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.346600,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.432200,-1.535000,20.066000>}
box{<0,0,-0.127000><10.085600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.346600,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.346700,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,18.034000>}
box{<0,0,-0.127000><9.627100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.346700,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,32.689800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.806600,-1.535000,32.943800>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-45.008310,0> translate<9.552700,-1.535000,32.689800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.552700,-1.535000,35.890100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.806600,-1.535000,35.636100>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,45.008310,0> translate<9.552700,-1.535000,35.890100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.600600,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.178500,-1.535000,19.812000>}
box{<0,0,-0.127000><9.577900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.600600,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.600700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,18.288000>}
box{<0,0,-0.127000><9.373100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.600700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.628800,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.860100,-1.535000,32.766000>}
box{<0,0,-0.127000><5.231300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.628800,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.628800,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.863200,-1.535000,35.814000>}
box{<0,0,-0.127000><10.234400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.628800,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.806600,-1.535000,32.943800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.682300,-1.535000,32.943800>}
box{<0,0,-0.127000><4.875700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.806600,-1.535000,32.943800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.806600,-1.535000,35.636100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.972100,-1.535000,35.636100>}
box{<0,0,-0.127000><5.165500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.806600,-1.535000,35.636100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.854600,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.073300,-1.535000,19.558000>}
box{<0,0,-0.127000><9.218700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.854600,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.854700,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,18.542000>}
box{<0,0,-0.127000><9.119100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.854700,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,18.618600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,18.973600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.931300,-1.535000,18.973600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,18.796000>}
box{<0,0,-0.127000><9.042500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.931300,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,19.126200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,19.481300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<9.931300,-1.535000,19.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.931300,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,19.304000>}
box{<0,0,-0.127000><9.042500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.931300,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.682300,-1.535000,32.943800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,31.192300>}
box{<0,0,-0.127000><2.476995,0.035000,0.127000> rotate<0,44.997030,0> translate<14.682300,-1.535000,32.943800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.972100,-1.535000,35.636100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.507800,-1.535000,35.636100>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.972100,-1.535000,35.636100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.507800,-1.535000,35.636100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002500,-1.535000,35.431200>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,22.497383,0> translate<15.507800,-1.535000,35.636100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.691600,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.407000,-1.535000,35.560000>}
box{<0,0,-0.127000><8.715400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.691600,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002500,-1.535000,35.431200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.337600,-1.535000,33.096100>}
box{<0,0,-0.127000><3.302330,0.035000,0.127000> rotate<0,44.997030,0> translate<16.002500,-1.535000,35.431200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.127700,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.661000,-1.535000,35.306000>}
box{<0,0,-0.127000><8.533300,0.035000,0.127000> rotate<0,0.000000,0> translate<16.127700,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.117200,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<16.179800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.179800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.179800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.126600>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-44.985750,0> translate<16.179800,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.381700,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.954500,-1.535000,35.052000>}
box{<0,0,-0.127000><20.572800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.381700,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,31.192300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,30.126600>}
box{<0,0,-0.127000><1.065700,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.433800,-1.535000,30.126600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.635700,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.229700,-1.535000,34.798000>}
box{<0,0,-0.127000><20.594000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.635700,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.118000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.665100,-1.535000,12.940300>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,81.008781,0> translate<16.637000,-1.535000,13.118000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.118000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.637000,-1.535000,13.118000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.652500,-1.535000,13.843000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.637000,-1.535000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.096800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.652500,-1.535000,14.096800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.637000,-1.535000,14.096800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.821900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.096800>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.637000,-1.535000,14.096800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,14.821900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.665100,-1.535000,14.999600>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-81.008781,0> translate<16.637000,-1.535000,14.821900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.665100,-1.535000,12.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.720700,-1.535000,12.769200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<16.665100,-1.535000,12.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.665100,-1.535000,14.999600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.720700,-1.535000,15.170700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<16.665100,-1.535000,14.999600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.720700,-1.535000,12.769200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.802400,-1.535000,12.608900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<16.720700,-1.535000,12.769200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.720700,-1.535000,15.170700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.802400,-1.535000,15.331000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<16.720700,-1.535000,15.170700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,23.698600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348600,-1.535000,23.088600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<16.738600,-1.535000,23.698600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.053600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,23.698600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.738600,-1.535000,23.698600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.053600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703100,-1.535000,24.053600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.738600,-1.535000,24.053600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703100,-1.535000,24.206200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.738600,-1.535000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.561300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.206200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.738600,-1.535000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,24.561300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348600,-1.535000,25.171300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.738600,-1.535000,24.561300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.802400,-1.535000,12.608900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.908100,-1.535000,12.463400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<16.802400,-1.535000,12.608900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.802400,-1.535000,15.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.908100,-1.535000,15.476500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<16.802400,-1.535000,15.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.889700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.544000>}
box{<0,0,-0.127000><26.379200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.889700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.908100,-1.535000,12.463400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.035400,-1.535000,12.336100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<16.908100,-1.535000,12.463400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.908100,-1.535000,15.476500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.035400,-1.535000,15.603800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.908100,-1.535000,15.476500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.035400,-1.535000,12.336100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180900,-1.535000,12.230400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<17.035400,-1.535000,12.336100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.035400,-1.535000,15.603800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180900,-1.535000,15.709500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<17.035400,-1.535000,15.603800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.117200,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.442700,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.117200,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.143700,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,34.290000>}
box{<0,0,-0.127000><27.229400,0.035000,0.127000> rotate<0,0.000000,0> translate<17.143700,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180900,-1.535000,12.230400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.341200,-1.535000,12.148700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<17.180900,-1.535000,12.230400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180900,-1.535000,15.709500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.341200,-1.535000,15.791200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<17.180900,-1.535000,15.709500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.341200,-1.535000,12.148700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.512300,-1.535000,12.093100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<17.341200,-1.535000,12.148700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.341200,-1.535000,15.791200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.512300,-1.535000,15.846800>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<17.341200,-1.535000,15.791200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348600,-1.535000,23.088600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.088600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.348600,-1.535000,23.088600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348600,-1.535000,25.171300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,25.171300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.348600,-1.535000,25.171300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.397700,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.036000>}
box{<0,0,-0.127000><25.871200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.397700,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.512300,-1.535000,12.093100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.070800>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,9.005487,0> translate<17.512300,-1.535000,12.093100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.512300,-1.535000,15.846800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,15.869000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-8.965761,0> translate<17.512300,-1.535000,15.846800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.651700,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.287700,-1.535000,33.782000>}
box{<0,0,-0.127000><25.636000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.651700,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.652500,-1.535000,14.096800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.652500,-1.535000,13.843000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.652500,-1.535000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.070800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,13.842500>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,90.000000,0> translate<17.653000,-1.535000,13.842500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.192000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.446000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.700000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.954000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,13.208000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,13.462000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,13.716000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,13.842500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,13.842500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,13.842500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.097400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,15.869000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,90.000000,0> translate<17.653000,-1.535000,15.869000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.097400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.097400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,14.097400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.224000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.478000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.732000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.986000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,15.240000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,15.494000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,15.748000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703100,-1.535000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703100,-1.535000,24.053600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.703100,-1.535000,24.053600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.088600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.053100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<17.703600,-1.535000,24.053100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.114000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.368000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.622000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.876000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.053100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.053100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,24.053100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.206800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,25.171300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<17.703600,-1.535000,25.171300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.206800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.206800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,24.206800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.384000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.638000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.892000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703600,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,25.146000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703600,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.088600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.211300,-1.535000,23.088600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.856200,-1.535000,23.088600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.053100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,23.088600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.856200,-1.535000,23.088600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,25.171300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,24.206800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.856200,-1.535000,24.206800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856200,-1.535000,25.171300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.211300,-1.535000,25.171300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.856200,-1.535000,25.171300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856800,-1.535000,24.053600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856800,-1.535000,24.206200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<17.856800,-1.535000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856800,-1.535000,24.053600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.053600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.856800,-1.535000,24.053600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856800,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,24.130000>}
box{<0,0,-0.127000><3.403000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.856800,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.856800,-1.535000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.206200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.856800,-1.535000,24.206200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.905700,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.541700,-1.535000,33.528000>}
box{<0,0,-0.127000><25.636000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.905700,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.070800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.047600,-1.535000,12.093100>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-8.999196,0> translate<17.906800,-1.535000,12.070800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,13.842500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,12.070800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.906800,-1.535000,12.070800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,15.869000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,14.097400>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.906800,-1.535000,14.097400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.906800,-1.535000,15.869000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.047600,-1.535000,15.846800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,8.959497,0> translate<17.906800,-1.535000,15.869000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.047600,-1.535000,12.093100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.218700,-1.535000,12.148700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<18.047600,-1.535000,12.093100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.047600,-1.535000,15.846800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.218700,-1.535000,15.791200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<18.047600,-1.535000,15.846800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.159700,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.795700,-1.535000,33.274000>}
box{<0,0,-0.127000><25.636000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.159700,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.211300,-1.535000,23.088600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,23.698600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.211300,-1.535000,23.088600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.211300,-1.535000,25.171300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.561300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<18.211300,-1.535000,25.171300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.218700,-1.535000,12.148700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.379000,-1.535000,12.230400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<18.218700,-1.535000,12.148700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.218700,-1.535000,15.791200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.379000,-1.535000,15.709500>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<18.218700,-1.535000,15.791200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.236600,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.613100,-1.535000,25.146000>}
box{<0,0,-0.127000><3.376500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.236600,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.236700,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,23.114000>}
box{<0,0,-0.127000><3.277100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.236700,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.303500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.929500,-1.535000,15.748000>}
box{<0,0,-0.127000><0.626000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.303500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.303600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.929300,-1.535000,12.192000>}
box{<0,0,-0.127000><0.625700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.303600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.337600,-1.535000,33.096100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.592100,-1.535000,33.096100>}
box{<0,0,-0.127000><4.254500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.337600,-1.535000,33.096100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.379000,-1.535000,12.230400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.524500,-1.535000,12.336100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<18.379000,-1.535000,12.230400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.379000,-1.535000,15.709500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.524500,-1.535000,15.603800>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<18.379000,-1.535000,15.709500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.442700,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.442700,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.490600,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.359100,-1.535000,24.892000>}
box{<0,0,-0.127000><2.868500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.490600,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.490700,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.359000,-1.535000,23.368000>}
box{<0,0,-0.127000><2.868300,0.035000,0.127000> rotate<0,0.000000,0> translate<18.490700,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.518900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.121000,-1.535000,27.686000>}
box{<0,0,-0.127000><3.602100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.518900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.524500,-1.535000,12.336100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.651800,-1.535000,12.463400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.524500,-1.535000,12.336100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.524500,-1.535000,15.603800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.651800,-1.535000,15.476500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<18.524500,-1.535000,15.603800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.634300,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.793700,-1.535000,15.494000>}
box{<0,0,-0.127000><0.159400,0.035000,0.127000> rotate<0,0.000000,0> translate<18.634300,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.634400,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.793600,-1.535000,12.446000>}
box{<0,0,-0.127000><0.159200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.634400,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.651800,-1.535000,12.463400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.737500,-1.535000,12.581500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-54.029685,0> translate<18.651800,-1.535000,12.463400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.651800,-1.535000,15.476500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.737500,-1.535000,15.358400>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,54.029685,0> translate<18.651800,-1.535000,15.476500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.737500,-1.535000,12.581500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.877300,-1.535000,12.244000>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,67.495122,0> translate<18.737500,-1.535000,12.581500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.737500,-1.535000,15.358400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.877300,-1.535000,15.695900>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-67.495122,0> translate<18.737500,-1.535000,15.358400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.744600,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,24.638000>}
box{<0,0,-0.127000><2.515200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.744600,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.744700,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,23.622000>}
box{<0,0,-0.127000><2.515100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.744700,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.772900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.867000,-1.535000,27.940000>}
box{<0,0,-0.127000><3.094100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.772900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,23.698600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.053600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.821300,-1.535000,24.053600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,23.876000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.821300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.206200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.561300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<18.821300,-1.535000,24.561300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.821300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,24.384000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.821300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.877300,-1.535000,12.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.356000,-1.535000,11.765300>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<18.877300,-1.535000,12.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.877300,-1.535000,15.695900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,15.792300>}
box{<0,0,-0.127000><0.136401,0.035000,0.127000> rotate<0,-44.967330,0> translate<18.877300,-1.535000,15.695900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,19.317800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,15.792300>}
box{<0,0,-0.127000><3.525500,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.973800,-1.535000,15.792300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.973800,-1.535000,19.317800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.178700,-1.535000,19.812500>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,-67.496677,0> translate<18.973800,-1.535000,19.317800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.026900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.613000,-1.535000,28.194000>}
box{<0,0,-0.127000><2.586100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.026900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126100,-1.535000,30.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126100,-1.535000,30.403800>}
box{<0,0,-0.127000><0.277200,0.035000,0.127000> rotate<0,90.000000,0> translate<19.126100,-1.535000,30.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126100,-1.535000,30.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,29.872700>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,44.985750,0> translate<19.126100,-1.535000,30.126600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126100,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,30.226000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.126100,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126100,-1.535000,30.403800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,30.403800>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.126100,-1.535000,30.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.178700,-1.535000,19.812500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.557400,-1.535000,20.191200>}
box{<0,0,-0.127000><0.535563,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.178700,-1.535000,19.812500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.398600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,35.788600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<19.278600,-1.535000,36.398600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.753600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.398600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,36.398600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.753600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,36.753600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,36.753600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.906200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,36.906200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.278600,-1.535000,36.906200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,37.261300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,36.906200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.278600,-1.535000,36.906200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.278600,-1.535000,37.261300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,37.871300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.278600,-1.535000,37.261300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.280800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.359100,-1.535000,29.972000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.280800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.280900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.359000,-1.535000,28.448000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.280900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.356000,-1.535000,11.765300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.981400,-1.535000,11.506200>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<19.356000,-1.535000,11.765300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,29.872700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<19.380100,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,28.702000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.380100,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,28.956000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.380100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,29.210000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.380100,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,29.464000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.380100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.380100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,29.718000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.380100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.557400,-1.535000,20.191200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,22.147600>}
box{<0,0,-0.127000><2.766767,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.557400,-1.535000,20.191200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,35.788600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.888600,-1.535000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.888600,-1.535000,37.871300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.871300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.888600,-1.535000,37.871300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.981400,-1.535000,11.506200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.658500,-1.535000,11.506200>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.981400,-1.535000,11.506200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,36.906200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243100,-1.535000,36.753600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.243100,-1.535000,36.753600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.753100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,36.753100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,35.814000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.068000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.322000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.576000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.753100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.753100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,36.753100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.906800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.871300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.243600,-1.535000,37.871300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,36.906800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.906800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,36.906800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.084000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.338000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.592000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.243600,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.846000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.243600,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,35.788600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.753100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,35.788600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.871300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,36.906800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.396200,-1.535000,36.906800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396200,-1.535000,37.871300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,37.871300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396200,-1.535000,37.871300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,36.753600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,36.906200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.396800,-1.535000,36.906200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,36.753600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.753600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,36.753600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,36.830000>}
box{<0,0,-0.127000><3.403000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.396800,-1.535000,36.906200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.906200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.396800,-1.535000,36.906200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.658500,-1.535000,11.506200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.283900,-1.535000,11.765300>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<20.658500,-1.535000,11.506200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.398600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.751300,-1.535000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.751300,-1.535000,37.871300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,37.261300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<20.751300,-1.535000,37.871300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.776600,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.153100,-1.535000,37.846000>}
box{<0,0,-0.127000><3.376500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.776600,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.776700,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.153000,-1.535000,35.814000>}
box{<0,0,-0.127000><3.376300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.776700,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.030600,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.899100,-1.535000,37.592000>}
box{<0,0,-0.127000><2.868500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.030600,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.030700,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.899000,-1.535000,36.068000>}
box{<0,0,-0.127000><2.868300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.030700,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.087600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.773000,-1.535000,11.684000>}
box{<0,0,-0.127000><10.685400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.087600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,23.213300>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,44.985750,0> translate<21.259800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,23.467200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.259800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.197200,-1.535000,25.730100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.259800,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.197200,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<21.259800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.259800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.259800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,30.126700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.259800,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.283900,-1.535000,11.765300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.762600,-1.535000,12.244000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.283900,-1.535000,11.765300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.284600,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,37.338000>}
box{<0,0,-0.127000><2.515200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.284600,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.284700,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,36.322000>}
box{<0,0,-0.127000><2.515100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.284700,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.398600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.753600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,36.753600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,36.576000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,36.906200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,37.261300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.361300,-1.535000,37.261300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.361300,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,37.084000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.361300,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.456600,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519000,-1.535000,11.938000>}
box{<0,0,-0.127000><10.062400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.456600,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,23.213300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,22.147600>}
box{<0,0,-0.127000><1.065700,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.513800,-1.535000,22.147600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,30.403800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,-1.535000,30.126700>}
box{<0,0,-0.127000><0.277100,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.513800,-1.535000,30.126700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,15.792300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,18.492300>}
box{<0,0,-0.127000><2.700000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.666100,-1.535000,18.492300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,15.792300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.762600,-1.535000,15.695900>}
box{<0,0,-0.127000><0.136401,0.035000,0.127000> rotate<0,44.967330,0> translate<21.666100,-1.535000,15.792300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,16.002000>}
box{<0,0,-0.127000><9.753700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,16.256000>}
box{<0,0,-0.127000><9.753700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,16.510000>}
box{<0,0,-0.127000><9.753700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,16.764000>}
box{<0,0,-0.127000><9.753700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,17.018000>}
box{<0,0,-0.127000><9.753700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519100,-1.535000,17.272000>}
box{<0,0,-0.127000><9.853000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.773100,-1.535000,17.526000>}
box{<0,0,-0.127000><10.107000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.027100,-1.535000,17.780000>}
box{<0,0,-0.127000><10.361000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281100,-1.535000,18.034000>}
box{<0,0,-0.127000><10.615000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,18.288000>}
box{<0,0,-0.127000><23.977700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.666100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.666100,-1.535000,18.492300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.001200,-1.535000,20.827400>}
box{<0,0,-0.127000><3.302330,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.666100,-1.535000,18.492300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.710500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519000,-1.535000,15.748000>}
box{<0,0,-0.127000><9.808500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.710500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.710600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.192000>}
box{<0,0,-0.127000><9.709200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.710600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.715800,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,18.542000>}
box{<0,0,-0.127000><23.928000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.715800,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.762600,-1.535000,12.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,12.869400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<21.762600,-1.535000,12.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.762600,-1.535000,15.695900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,15.070500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<21.762600,-1.535000,15.695900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.846200,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.446000>}
box{<0,0,-0.127000><9.573600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.846200,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.846300,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,15.494000>}
box{<0,0,-0.127000><9.827500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.846300,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.951500,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.700000>}
box{<0,0,-0.127000><9.468300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.951500,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.951500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,15.240000>}
box{<0,0,-0.127000><9.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.951500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.969800,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.931000,-1.535000,18.796000>}
box{<0,0,-0.127000><3.961200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.969800,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,12.869400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,15.070500>}
box{<0,0,-0.127000><2.201100,0.035000,0.127000> rotate<0,90.000000,0> translate<22.021700,-1.535000,15.070500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.954000>}
box{<0,0,-0.127000><9.398100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,13.208000>}
box{<0,0,-0.127000><9.398100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519100,-1.535000,13.462000>}
box{<0,0,-0.127000><9.497400,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,13.716000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,13.970000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,14.224000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,14.478000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,14.732000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.021700,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,14.986000>}
box{<0,0,-0.127000><9.652100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.021700,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.197200,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.522700,-1.535000,25.730100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.197200,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.197200,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.522700,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.197200,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.223800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.677000,-1.535000,19.050000>}
box{<0,0,-0.127000><3.453200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.223800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.477800,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.423000,-1.535000,19.304000>}
box{<0,0,-0.127000><2.945200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.477800,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.592100,-1.535000,33.096100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.402100,-1.535000,33.096100>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.592100,-1.535000,33.096100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.731800,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169000,-1.535000,19.558000>}
box{<0,0,-0.127000><2.437200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.731800,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.985800,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,19.812000>}
box{<0,0,-0.127000><2.084000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.985800,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.239800,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.066000>}
box{<0,0,-0.127000><1.830000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.239800,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.493800,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.320000>}
box{<0,0,-0.127000><1.576000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.493800,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.522700,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,24.792700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<23.522700,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.522700,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.522700,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.598800,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.201100,-1.535000,25.654000>}
box{<0,0,-0.127000><3.602300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.598800,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.598900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.201000,-1.535000,27.686000>}
box{<0,0,-0.127000><3.602100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.598900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.747800,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.574000>}
box{<0,0,-0.127000><1.322000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.747800,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,36.167200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<23.799800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,36.167200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.799800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.799800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.799800,-1.535000,37.492700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.852800,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.947100,-1.535000,25.400000>}
box{<0,0,-0.127000><3.094300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.852800,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.852900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.947000,-1.535000,27.940000>}
box{<0,0,-0.127000><3.094100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.852900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.001200,-1.535000,20.827400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.322100>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,-67.496677,0> translate<24.001200,-1.535000,20.827400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.001400,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.828000>}
box{<0,0,-0.127000><1.068400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.001400,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.106600,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169100,-1.535000,21.082000>}
box{<0,0,-0.127000><1.062500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.106600,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.106800,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.693100,-1.535000,25.146000>}
box{<0,0,-0.127000><2.586300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.106800,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.106900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.693000,-1.535000,28.194000>}
box{<0,0,-0.127000><2.586100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.106900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.322100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.857800>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,90.000000,0> translate<24.206100,-1.535000,21.857800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,21.336000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,21.590000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,21.844000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,21.857800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,23.213300>}
box{<0,0,-0.127000><1.355500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.206100,-1.535000,23.213300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,22.098000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,22.352000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,22.606000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,22.860000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,23.114000>}
box{<0,0,-0.127000><1.117700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,23.213300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,23.467200>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-44.985750,0> translate<24.206100,-1.535000,23.213300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,30.126700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,30.403800>}
box{<0,0,-0.127000><0.277100,0.035000,0.127000> rotate<0,90.000000,0> translate<24.206100,-1.535000,30.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,30.126700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,29.872700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<24.206100,-1.535000,30.126700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.290100,-1.535000,30.226000>}
box{<0,0,-0.127000><2.084000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206100,-1.535000,30.403800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.112300,-1.535000,30.403800>}
box{<0,0,-0.127000><1.906200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.206100,-1.535000,30.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.360800,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.423300,-1.535000,23.368000>}
box{<0,0,-0.127000><1.062500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.360800,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.360800,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.439100,-1.535000,24.892000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.360800,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.360800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.439200,-1.535000,29.972000>}
box{<0,0,-0.127000><2.078400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.360800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.360900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.439000,-1.535000,28.448000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.360900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,24.792700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.460100,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.528500,-1.535000,23.622000>}
box{<0,0,-0.127000><1.068400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.782200,-1.535000,23.876000>}
box{<0,0,-0.127000><1.322100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.036300,-1.535000,24.130000>}
box{<0,0,-0.127000><1.576200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.290300,-1.535000,24.384000>}
box{<0,0,-0.127000><1.830200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,24.638000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,29.872700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.460100,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,28.702000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,28.956000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,29.210000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,29.464000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,29.718000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.460100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.737200,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.737200,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.737200,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.007200,-1.535000,18.719800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<25.069800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,19.657200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.069800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.069800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,21.236700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.069800,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,23.127800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,21.236700>}
box{<0,0,-0.127000><1.891100,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.323800,-1.535000,21.236700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.323800,-1.535000,23.127800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.528700,-1.535000,23.622500>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,-67.496677,0> translate<25.323800,-1.535000,23.127800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.528700,-1.535000,23.622500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.907400,-1.535000,24.001200>}
box{<0,0,-0.127000><0.535563,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.528700,-1.535000,23.622500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<25.628600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.188600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.628600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.628600,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.628600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,7.696200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.628600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.628600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.628600,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.907400,-1.535000,24.001200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.907500,-1.535000,24.001200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<25.907400,-1.535000,24.001200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.907500,-1.535000,24.001200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,24.433500>}
box{<0,0,-0.127000><0.611365,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.907500,-1.535000,24.001200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.007200,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.332700,-1.535000,18.719800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.007200,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.316700,-1.535000,35.483800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.062700,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.062700,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.316700,-1.535000,38.176100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<26.062700,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.112300,-1.535000,30.403800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.491700,-1.535000,30.024500>}
box{<0,0,-0.127000><0.536482,0.035000,0.127000> rotate<0,44.989479,0> translate<26.112300,-1.535000,30.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.138800,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281100,-1.535000,38.354000>}
box{<0,0,-0.127000><6.142300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.138800,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.138900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281000,-1.535000,35.306000>}
box{<0,0,-0.127000><6.142100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.138900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.238600,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.238600,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.238600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.316700,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,35.483800>}
box{<0,0,-0.127000><5.786500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.316700,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.316700,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,38.176100>}
box{<0,0,-0.127000><5.786500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.316700,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,24.433500>}
box{<0,0,-0.127000><0.359200,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.339800,-1.535000,24.433500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.277200,-1.535000,25.730100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.339800,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.277200,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<26.339800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.339800,-1.535000,28.547200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339800,-1.535000,29.872700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.491700,-1.535000,30.024500>}
box{<0,0,-0.127000><0.214748,0.035000,0.127000> rotate<0,-44.978166,0> translate<26.339800,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.402100,-1.535000,33.096100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.937800,-1.535000,33.096100>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.402100,-1.535000,33.096100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.593100,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.543100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.593600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.604000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.858000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.112000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.366000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.543100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.593600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.874000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,8.128000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,8.382000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.593600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,8.636000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.593600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,6.578600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.746200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.746200,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746200,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,7.696200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.746800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943100,-1.535000,7.620000>}
box{<0,0,-0.127000><6.196300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.746800,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.746800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.937800,-1.535000,33.096100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.432500,-1.535000,32.891200>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,22.497383,0> translate<26.937800,-1.535000,33.096100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.188600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.101300,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.101300,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<27.101300,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.121600,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,33.020000>}
box{<0,0,-0.127000><18.522200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.121600,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.126600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.563300,-1.535000,8.636000>}
box{<0,0,-0.127000><5.436700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.126600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.126700,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.563200,-1.535000,6.604000>}
box{<0,0,-0.127000><5.436500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.126700,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.277200,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,25.730100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.277200,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.277200,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,27.609800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.277200,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.332700,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,19.657200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.332700,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.380600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.309300,-1.535000,8.382000>}
box{<0,0,-0.127000><4.928700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.380600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.380700,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.309200,-1.535000,6.858000>}
box{<0,0,-0.127000><4.928500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.380700,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.408900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,18.796000>}
box{<0,0,-0.127000><18.234900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.408900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.432500,-1.535000,32.891200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.702500,-1.535000,31.621200>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<27.432500,-1.535000,32.891200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.557700,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,32.766000>}
box{<0,0,-0.127000><18.086100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.557700,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.634600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.055300,-1.535000,8.128000>}
box{<0,0,-0.127000><4.420700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.634600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.634700,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.055200,-1.535000,7.112000>}
box{<0,0,-0.127000><4.420500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.634700,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.662900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,19.050000>}
box{<0,0,-0.127000><17.980900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.662900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.711300,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.366000>}
box{<0,0,-0.127000><4.267300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.711300,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<27.711300,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.711300,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.874000>}
box{<0,0,-0.127000><4.267300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.711300,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.811700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,32.512000>}
box{<0,0,-0.127000><17.832100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.811700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.916900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,19.304000>}
box{<0,0,-0.127000><17.726900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.916900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,21.236700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,22.302400>}
box{<0,0,-0.127000><1.065700,0.035000,0.127000> rotate<0,90.000000,0> translate<28.016100,-1.535000,22.302400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,21.236700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.982700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<28.016100,-1.535000,21.236700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,21.336000>}
box{<0,0,-0.127000><3.403700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.016100,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,21.590000>}
box{<0,0,-0.127000><3.403700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.016100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,21.844000>}
box{<0,0,-0.127000><3.403700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.016100,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,22.098000>}
box{<0,0,-0.127000><3.403700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.016100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.016100,-1.535000,22.302400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.243500,-1.535000,22.529800>}
box{<0,0,-0.127000><0.321592,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.016100,-1.535000,22.302400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.065700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519100,-1.535000,22.352000>}
box{<0,0,-0.127000><3.453400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.065700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.065700,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,32.258000>}
box{<0,0,-0.127000><17.578100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.065700,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170800,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,21.082000>}
box{<0,0,-0.127000><3.249000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170800,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,19.558000>}
box{<0,0,-0.127000><17.472900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.243500,-1.535000,22.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,22.529800>}
box{<0,0,-0.127000><0.359200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.243500,-1.535000,22.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.982700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<28.270100,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,19.812000>}
box{<0,0,-0.127000><17.373700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281000,-1.535000,20.066000>}
box{<0,0,-0.127000><4.010900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.027000,-1.535000,20.320000>}
box{<0,0,-0.127000><3.756900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.773000,-1.535000,20.574000>}
box{<0,0,-0.127000><3.502900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.270100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.519000,-1.535000,20.828000>}
box{<0,0,-0.127000><3.248900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.270100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.319700,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,32.004000>}
box{<0,0,-0.127000><17.324100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.319700,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.573700,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,31.750000>}
box{<0,0,-0.127000><17.070100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.573700,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,22.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.856700,-1.535000,22.783800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.602700,-1.535000,22.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.856700,-1.535000,25.476100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<28.602700,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.602700,-1.535000,27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,28.547200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.602700,-1.535000,27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.678800,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.281100,-1.535000,25.654000>}
box{<0,0,-0.127000><3.602300,0.035000,0.127000> rotate<0,0.000000,0> translate<28.678800,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.678900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,22.606000>}
box{<0,0,-0.127000><2.994900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.678900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.678900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.120600,-1.535000,27.686000>}
box{<0,0,-0.127000><8.441700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.678900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.702500,-1.535000,31.621200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.081200,-1.535000,31.242500>}
box{<0,0,-0.127000><0.535563,0.035000,0.127000> rotate<0,44.997030,0> translate<28.702500,-1.535000,31.621200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.827700,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,31.496000>}
box{<0,0,-0.127000><16.816100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.827700,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.856700,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,22.783800>}
box{<0,0,-0.127000><2.817100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.856700,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.856700,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,25.476100>}
box{<0,0,-0.127000><3.246500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.856700,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.932900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.255700,-1.535000,27.940000>}
box{<0,0,-0.127000><8.322800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.932900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.081200,-1.535000,31.242500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.747800>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,67.496677,0> translate<29.081200,-1.535000,31.242500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.081500,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,31.242000>}
box{<0,0,-0.127000><16.562300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.081500,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.186700,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,30.988000>}
box{<0,0,-0.127000><16.457100,0.035000,0.127000> rotate<0,0.000000,0> translate<29.186700,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.186900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.517000,-1.535000,28.194000>}
box{<0,0,-0.127000><8.330100,0.035000,0.127000> rotate<0,0.000000,0> translate<29.186900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.747800>}
box{<0,0,-0.127000><0.621200,0.035000,0.127000> rotate<0,90.000000,0> translate<29.286100,-1.535000,30.747800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,29.872700>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,44.985750,0> translate<29.286100,-1.535000,30.126600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.453300,-1.535000,30.226000>}
box{<0,0,-0.127000><12.167200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.286100,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,30.480000>}
box{<0,0,-0.127000><16.357700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.286100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.286100,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,30.734000>}
box{<0,0,-0.127000><16.357700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.286100,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.440800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.199300,-1.535000,29.972000>}
box{<0,0,-0.127000><11.758500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.440800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.440900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.199200,-1.535000,28.448000>}
box{<0,0,-0.127000><11.758300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.440900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,28.547200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,29.872700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<29.540100,-1.535000,29.872700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.945200,-1.535000,28.702000>}
box{<0,0,-0.127000><11.405100,0.035000,0.127000> rotate<0,0.000000,0> translate<29.540100,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,28.956000>}
box{<0,0,-0.127000><11.328500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.540100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833100,-1.535000,29.210000>}
box{<0,0,-0.127000><12.293000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.540100,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.464000>}
box{<0,0,-0.127000><11.328500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.540100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.540100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.945300,-1.535000,29.718000>}
box{<0,0,-0.127000><11.405200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.540100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.037200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,11.099800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<31.419800,-1.535000,12.037200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,13.362700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,12.037200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.419800,-1.535000,12.037200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,13.362700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,13.616700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.419800,-1.535000,13.362700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,15.847200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,15.593200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<31.419800,-1.535000,15.847200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,17.172700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,15.847200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.419800,-1.535000,15.847200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,17.172700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,18.110100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.419800,-1.535000,17.172700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,20.927200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,19.989800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<31.419800,-1.535000,20.927200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,22.252700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,20.927200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.419800,-1.535000,20.927200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.419800,-1.535000,22.252700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,22.506700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.419800,-1.535000,22.252700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,15.593200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,13.616700>}
box{<0,0,-0.127000><1.976500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.673800,-1.535000,13.616700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.673800,-1.535000,22.506700>}
box{<0,0,-0.127000><0.277100,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.673800,-1.535000,22.506700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<31.978600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.188600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.978600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.978600,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943100,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.978600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,7.696200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.978600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.978600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.978600,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,25.730100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.103200,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,35.229800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<32.103200,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.103200,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,38.430100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.103200,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,11.099800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,11.099800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,11.099800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,18.110100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,18.110100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,18.110100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,19.989800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,19.989800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,19.989800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,25.730100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.357200,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.357200,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.588600,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588600,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.588600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943100,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.943100,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.543100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.943600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,6.604000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,6.858000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.112000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.366000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.543100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.943600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.874000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,8.128000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,8.382000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.943600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,8.636000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.943600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.451300,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.096200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,6.578600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.096200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.096200,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.451300,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.096200,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096800,-1.535000,7.696200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<33.096800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.096800,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096800,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803100,-1.535000,7.620000>}
box{<0,0,-0.127000><22.706300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.096800,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.096800,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.096800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.451300,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.188600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.451300,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.451300,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<33.451300,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.476600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.423300,-1.535000,8.636000>}
box{<0,0,-0.127000><21.946700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.476600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.476700,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.423200,-1.535000,6.604000>}
box{<0,0,-0.127000><21.946500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.476700,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,11.099800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.037200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.682700,-1.535000,11.099800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,18.110100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,17.856100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<33.682700,-1.535000,18.110100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,19.989800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,20.927200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.682700,-1.535000,19.989800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,25.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,25.476100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<33.682700,-1.535000,25.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,35.483800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.682700,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.682700,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,38.176100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<33.682700,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.730600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.169300,-1.535000,8.382000>}
box{<0,0,-0.127000><21.438700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.730600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.730700,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.169200,-1.535000,6.858000>}
box{<0,0,-0.127000><21.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.730700,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758800,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.171100,-1.535000,18.034000>}
box{<0,0,-0.127000><7.412300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758800,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758800,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.120500,-1.535000,25.654000>}
box{<0,0,-0.127000><3.361700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758800,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758800,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.725700,-1.535000,38.354000>}
box{<0,0,-0.127000><2.966900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758800,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758900,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.780200,-1.535000,11.176000>}
box{<0,0,-0.127000><32.021300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758900,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758900,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,20.066000>}
box{<0,0,-0.127000><11.884900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758900,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.758900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.725600,-1.535000,35.306000>}
box{<0,0,-0.127000><2.966700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.758900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,17.856100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.993200,-1.535000,17.856100>}
box{<0,0,-0.127000><7.056500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.936700,-1.535000,17.856100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.203000,-1.535000,25.476100>}
box{<0,0,-0.127000><3.266300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.936700,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.652000,-1.535000,35.483800>}
box{<0,0,-0.127000><2.715300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.936700,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.936700,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.652000,-1.535000,38.176100>}
box{<0,0,-0.127000><2.715300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.936700,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.984600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.915300,-1.535000,8.128000>}
box{<0,0,-0.127000><20.930700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.984600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.984700,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.915200,-1.535000,7.112000>}
box{<0,0,-0.127000><20.930500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.984700,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.012900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.411300,-1.535000,11.430000>}
box{<0,0,-0.127000><31.398400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.012900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.012900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336500,-1.535000,20.320000>}
box{<0,0,-0.127000><11.323600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.012900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.061300,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.366000>}
box{<0,0,-0.127000><20.777300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<34.061300,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.874000>}
box{<0,0,-0.127000><20.777300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.266900,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.157300,-1.535000,11.684000>}
box{<0,0,-0.127000><30.890400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.266900,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.266900,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.082500,-1.535000,20.574000>}
box{<0,0,-0.127000><10.815600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.266900,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,13.616700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,15.163800>}
box{<0,0,-0.127000><1.547100,0.035000,0.127000> rotate<0,90.000000,0> translate<34.366100,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,13.616700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,13.362700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<34.366100,-1.535000,13.616700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.157400,-1.535000,13.716000>}
box{<0,0,-0.127000><30.791300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.411400,-1.535000,13.970000>}
box{<0,0,-0.127000><31.045300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.780600,-1.535000,14.224000>}
box{<0,0,-0.127000><31.414500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,14.478000>}
box{<0,0,-0.127000><31.597700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,14.732000>}
box{<0,0,-0.127000><31.597700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.171000,-1.535000,14.986000>}
box{<0,0,-0.127000><6.804900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.993200,-1.535000,15.163800>}
box{<0,0,-0.127000><6.627100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,22.506700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,22.783800>}
box{<0,0,-0.127000><0.277100,0.035000,0.127000> rotate<0,90.000000,0> translate<34.366100,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,22.506700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,22.252700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<34.366100,-1.535000,22.506700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.082700,-1.535000,22.606000>}
box{<0,0,-0.127000><10.716600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366100,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.912100,-1.535000,22.783800>}
box{<0,0,-0.127000><8.546000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.366100,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.520800,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.021700,-1.535000,13.462000>}
box{<0,0,-0.127000><30.500900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.520800,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.520800,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.913200,-1.535000,22.352000>}
box{<0,0,-0.127000><10.392400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.520800,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.520900,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.021600,-1.535000,11.938000>}
box{<0,0,-0.127000><30.500700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.520900,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.520900,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.913100,-1.535000,20.828000>}
box{<0,0,-0.127000><10.392200,0.035000,0.127000> rotate<0,0.000000,0> translate<34.520900,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.037200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,13.362700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.620100,-1.535000,13.362700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.916300,-1.535000,12.192000>}
box{<0,0,-0.127000><30.296200,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,12.446000>}
box{<0,0,-0.127000><30.226100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,12.700000>}
box{<0,0,-0.127000><30.226100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,12.954000>}
box{<0,0,-0.127000><30.226100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.916500,-1.535000,13.208000>}
box{<0,0,-0.127000><30.296400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,20.927200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,22.252700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.620100,-1.535000,22.252700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.807900,-1.535000,21.082000>}
box{<0,0,-0.127000><10.187800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.336000>}
box{<0,0,-0.127000><10.109300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.590000>}
box{<0,0,-0.127000><10.109300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.844000>}
box{<0,0,-0.127000><10.109300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.808000,-1.535000,22.098000>}
box{<0,0,-0.127000><10.187900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.620100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.652000,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.743400,-1.535000,35.263100>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,67.499297,0> translate<36.652000,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.652000,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.743400,-1.535000,38.396800>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-67.499297,0> translate<36.652000,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.743400,-1.535000,35.263100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.193500,-1.535000,34.813000>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<36.743400,-1.535000,35.263100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.743400,-1.535000,38.396800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.193500,-1.535000,38.846900>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.743400,-1.535000,38.396800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,25.927500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084200,-1.535000,25.765700>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,81.003844,0> translate<37.058600,-1.535000,25.927500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,25.927500>}
box{<0,0,-0.127000><0.666100,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.058600,-1.535000,25.927500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023100,-1.535000,26.593600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<37.058600,-1.535000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023100,-1.535000,26.746200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<37.058600,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,27.412400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,26.746200>}
box{<0,0,-0.127000><0.666200,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.058600,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.058600,-1.535000,27.412400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084200,-1.535000,27.574200>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-81.003844,0> translate<37.058600,-1.535000,27.412400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084200,-1.535000,25.765700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.134900,-1.535000,25.609800>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,71.980285,0> translate<37.084200,-1.535000,25.765700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084200,-1.535000,27.574200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.134900,-1.535000,27.730100>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-71.980285,0> translate<37.084200,-1.535000,27.574200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.134900,-1.535000,25.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.203000,-1.535000,25.476100>}
box{<0,0,-0.127000><0.150044,0.035000,0.127000> rotate<0,63.003855,0> translate<37.134900,-1.535000,25.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.134900,-1.535000,27.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.209300,-1.535000,27.876200>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-63.008816,0> translate<37.134900,-1.535000,27.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.193500,-1.535000,34.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.781600,-1.535000,34.569400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<37.193500,-1.535000,34.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.193500,-1.535000,38.846900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.781600,-1.535000,39.090500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<37.193500,-1.535000,38.846900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.209300,-1.535000,27.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.305600,-1.535000,28.008800>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-54.007619,0> translate<37.209300,-1.535000,27.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.305600,-1.535000,28.008800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.421500,-1.535000,28.124700>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.305600,-1.535000,28.008800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.421500,-1.535000,28.124700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.554100,-1.535000,28.221000>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,-35.986441,0> translate<37.421500,-1.535000,28.124700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.554100,-1.535000,28.221000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.700200,-1.535000,28.295400>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,-26.985245,0> translate<37.554100,-1.535000,28.221000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.700200,-1.535000,28.295400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.856100,-1.535000,28.346100>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-18.013775,0> translate<37.700200,-1.535000,28.295400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.781600,-1.535000,34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.418300,-1.535000,34.569400>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.781600,-1.535000,34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.781600,-1.535000,39.090500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.418300,-1.535000,39.090500>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.781600,-1.535000,39.090500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.856100,-1.535000,28.346100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.017900,-1.535000,28.371700>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-8.990217,0> translate<37.856100,-1.535000,28.346100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.017900,-1.535000,28.371700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,28.371700>}
box{<0,0,-0.127000><0.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.017900,-1.535000,28.371700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023100,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023100,-1.535000,26.593600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.023100,-1.535000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,26.746800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,28.371700>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,90.000000,0> translate<38.023600,-1.535000,28.371700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,26.746800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,26.746800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,26.746800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,26.924000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,27.178000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,27.432000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,27.686000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,27.940000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.023600,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,28.194000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.023600,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,28.371700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,26.746800>}
box{<0,0,-0.127000><1.624900,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.176200,-1.535000,26.746800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176200,-1.535000,28.371700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.182000,-1.535000,28.371700>}
box{<0,0,-0.127000><0.005800,0.035000,0.127000> rotate<0,0.000000,0> translate<38.176200,-1.535000,28.371700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176800,-1.535000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176800,-1.535000,26.746200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<38.176800,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176800,-1.535000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.593600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.176800,-1.535000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176800,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.670000>}
box{<0,0,-0.127000><6.552600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.176800,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.176800,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.746200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.176800,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.182000,-1.535000,28.371700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.343800,-1.535000,28.346100>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,8.990217,0> translate<38.182000,-1.535000,28.371700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.343800,-1.535000,28.346100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.499700,-1.535000,28.295400>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,18.013775,0> translate<38.343800,-1.535000,28.346100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.418300,-1.535000,34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.006400,-1.535000,34.813000>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<38.418300,-1.535000,34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.418300,-1.535000,39.090500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.006400,-1.535000,38.846900>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<38.418300,-1.535000,39.090500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.499700,-1.535000,28.295400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.645800,-1.535000,28.221000>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,26.985245,0> translate<38.499700,-1.535000,28.295400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.645800,-1.535000,28.221000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.778400,-1.535000,28.124700>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,35.986441,0> translate<38.645800,-1.535000,28.221000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.683000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.453200,-1.535000,28.194000>}
box{<0,0,-0.127000><2.770200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.683000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.778400,-1.535000,28.124700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.894300,-1.535000,28.008800>}
box{<0,0,-0.127000><0.163907,0.035000,0.127000> rotate<0,44.997030,0> translate<38.778400,-1.535000,28.124700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.894300,-1.535000,28.008800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.990600,-1.535000,27.876200>}
box{<0,0,-0.127000><0.163879,0.035000,0.127000> rotate<0,54.007619,0> translate<38.894300,-1.535000,28.008800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.944300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336600,-1.535000,27.940000>}
box{<0,0,-0.127000><6.392300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.944300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.970000,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.416300,-1.535000,38.862000>}
box{<0,0,-0.127000><29.446300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.970000,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.970100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.287900,-1.535000,34.798000>}
box{<0,0,-0.127000><4.317800,0.035000,0.127000> rotate<0,0.000000,0> translate<38.970100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.990600,-1.535000,27.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.065000,-1.535000,27.730100>}
box{<0,0,-0.127000><0.163953,0.035000,0.127000> rotate<0,63.008816,0> translate<38.990600,-1.535000,27.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.996900,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.065000,-1.535000,25.609800>}
box{<0,0,-0.127000><0.150044,0.035000,0.127000> rotate<0,-63.003855,0> translate<38.996900,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.996900,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.912100,-1.535000,25.476100>}
box{<0,0,-0.127000><3.915200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.996900,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.006400,-1.535000,34.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.456500,-1.535000,35.263100>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.006400,-1.535000,34.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.006400,-1.535000,38.846900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.456500,-1.535000,38.396800>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<39.006400,-1.535000,38.846900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.065000,-1.535000,25.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.115700,-1.535000,25.765700>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,-71.980285,0> translate<39.065000,-1.535000,25.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.065000,-1.535000,27.730100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.115700,-1.535000,27.574200>}
box{<0,0,-0.127000><0.163937,0.035000,0.127000> rotate<0,71.980285,0> translate<39.065000,-1.535000,27.730100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.079300,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.082500,-1.535000,25.654000>}
box{<0,0,-0.127000><6.003200,0.035000,0.127000> rotate<0,0.000000,0> translate<39.079300,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.079400,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.082600,-1.535000,27.686000>}
box{<0,0,-0.127000><6.003200,0.035000,0.127000> rotate<0,0.000000,0> translate<39.079400,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.115700,-1.535000,25.765700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,25.927500>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,-81.003844,0> translate<39.115700,-1.535000,25.765700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.115700,-1.535000,27.574200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,27.412400>}
box{<0,0,-0.127000><0.163813,0.035000,0.127000> rotate<0,81.003844,0> translate<39.115700,-1.535000,27.574200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.138200,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.913100,-1.535000,25.908000>}
box{<0,0,-0.127000><5.774900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.138200,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.138200,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.913200,-1.535000,27.432000>}
box{<0,0,-0.127000><5.775000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.138200,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,25.927500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.593600>}
box{<0,0,-0.127000><0.666100,0.035000,0.127000> rotate<0,90.000000,0> translate<39.141300,-1.535000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.807900,-1.535000,26.162000>}
box{<0,0,-0.127000><5.666600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.141300,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.416000>}
box{<0,0,-0.127000><5.588100,0.035000,0.127000> rotate<0,0.000000,0> translate<39.141300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,27.412400>}
box{<0,0,-0.127000><0.666200,0.035000,0.127000> rotate<0,90.000000,0> translate<39.141300,-1.535000,27.412400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.924000>}
box{<0,0,-0.127000><5.588100,0.035000,0.127000> rotate<0,0.000000,0> translate<39.141300,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.141300,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.808000,-1.535000,27.178000>}
box{<0,0,-0.127000><5.666700,0.035000,0.127000> rotate<0,0.000000,0> translate<39.141300,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.245300,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.484300,-1.535000,38.608000>}
box{<0,0,-0.127000><29.239000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.245300,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.245400,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.541900,-1.535000,35.052000>}
box{<0,0,-0.127000><4.296500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.245400,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.456500,-1.535000,35.263100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.547900,-1.535000,35.483800>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-67.499297,0> translate<39.456500,-1.535000,35.263100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.456500,-1.535000,38.396800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.547900,-1.535000,38.176100>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,67.499297,0> translate<39.456500,-1.535000,38.396800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.474200,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.582700,-1.535000,35.306000>}
box{<0,0,-0.127000><4.108500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.474200,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.474300,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.583000,-1.535000,38.354000>}
box{<0,0,-0.127000><4.108700,0.035000,0.127000> rotate<0,0.000000,0> translate<39.474300,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.547900,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.335700,-1.535000,35.483800>}
box{<0,0,-0.127000><3.787800,0.035000,0.127000> rotate<0,0.000000,0> translate<39.547900,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.547900,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.335700,-1.535000,38.176100>}
box{<0,0,-0.127000><3.787800,0.035000,0.127000> rotate<0,0.000000,0> translate<39.547900,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,28.778600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.478600,-1.535000,28.168600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<40.868600,-1.535000,28.778600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.133600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,28.778600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.868600,-1.535000,28.778600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.133600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833100,-1.535000,29.133600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.868600,-1.535000,29.133600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.286200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833100,-1.535000,29.286200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.868600,-1.535000,29.286200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.641300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.286200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.868600,-1.535000,29.286200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.868600,-1.535000,29.641300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.478600,-1.535000,30.251300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.868600,-1.535000,29.641300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.993200,-1.535000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.247200,-1.535000,14.909800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<40.993200,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.993200,-1.535000,17.856100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.247200,-1.535000,18.110100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.993200,-1.535000,17.856100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.247200,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.572700,-1.535000,14.909800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.247200,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.247200,-1.535000,18.110100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.572700,-1.535000,18.110100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.247200,-1.535000,18.110100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.478600,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.168600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.478600,-1.535000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.478600,-1.535000,30.251300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,30.251300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.478600,-1.535000,30.251300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833100,-1.535000,29.286200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833100,-1.535000,29.133600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.833100,-1.535000,29.133600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.133100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<41.833600,-1.535000,29.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.194000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.448000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.702000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.956000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.133100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,29.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,30.251300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<41.833600,-1.535000,30.251300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.286800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,29.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.464000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.718000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.972000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.833600,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,30.226000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.833600,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.341300,-1.535000,28.168600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<41.986200,-1.535000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,28.168600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.986200,-1.535000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,30.251300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,29.286800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.986200,-1.535000,29.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,30.251300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.341300,-1.535000,30.251300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<41.986200,-1.535000,30.251300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986800,-1.535000,29.133600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986800,-1.535000,29.286200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<41.986800,-1.535000,29.286200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986800,-1.535000,29.133600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.133600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.986800,-1.535000,29.133600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,29.210000>}
box{<0,0,-0.127000><3.657000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.986800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986800,-1.535000,29.286200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.286200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.986800,-1.535000,29.286200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.341300,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,28.778600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.341300,-1.535000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.341300,-1.535000,30.251300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.641300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<42.341300,-1.535000,30.251300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.366600,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,30.226000>}
box{<0,0,-0.127000><3.277200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.366600,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.366700,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.194000>}
box{<0,0,-0.127000><3.277100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.366700,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.572700,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.826700,-1.535000,15.163800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.572700,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.572700,-1.535000,18.110100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.826700,-1.535000,17.856100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<42.572700,-1.535000,18.110100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.620600,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,29.972000>}
box{<0,0,-0.127000><3.023200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.620600,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.620700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.448000>}
box{<0,0,-0.127000><3.023100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.620700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.648800,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,18.034000>}
box{<0,0,-0.127000><2.995000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.648800,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.648900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.251000,-1.535000,14.986000>}
box{<0,0,-0.127000><3.602100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.648900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.826700,-1.535000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.452100,-1.535000,15.163800>}
box{<0,0,-0.127000><2.625400,0.035000,0.127000> rotate<0,0.000000,0> translate<42.826700,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.826700,-1.535000,17.856100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.452100,-1.535000,17.856100>}
box{<0,0,-0.127000><2.625400,0.035000,0.127000> rotate<0,0.000000,0> translate<42.826700,-1.535000,17.856100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.874600,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,29.718000>}
box{<0,0,-0.127000><2.769200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.874600,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.874700,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.702000>}
box{<0,0,-0.127000><2.769100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.874700,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.912100,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.182100,-1.535000,22.783800>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.912100,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.912100,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.182100,-1.535000,25.476100>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.912100,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,28.778600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.133600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.951300,-1.535000,29.133600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.956000>}
box{<0,0,-0.127000><2.692500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.951300,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.286200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.641300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<42.951300,-1.535000,29.641300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951300,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,29.464000>}
box{<0,0,-0.127000><2.692500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.951300,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,33.800800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.960800,-1.535000,33.108900>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,44.997030,0> translate<43.268900,-1.535000,33.800800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.213600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,33.800800>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.268900,-1.535000,33.800800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.213600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,34.213600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.268900,-1.535000,34.213600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.366200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,34.366200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.268900,-1.535000,34.366200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.779100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.366200>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.268900,-1.535000,34.366200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.268900,-1.535000,34.779100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.733500,-1.535000,35.243600>}
box{<0,0,-0.127000><0.656973,0.035000,0.127000> rotate<0,-44.990864,0> translate<43.268900,-1.535000,34.779100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.335700,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.464400,-1.535000,35.355000>}
box{<0,0,-0.127000><0.182080,0.035000,0.127000> rotate<0,45.019279,0> translate<43.335700,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.335700,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.464400,-1.535000,38.304900>}
box{<0,0,-0.127000><0.182080,0.035000,0.127000> rotate<0,-45.019279,0> translate<43.335700,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.464400,-1.535000,35.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.733500,-1.535000,35.243600>}
box{<0,0,-0.127000><0.291247,0.035000,0.127000> rotate<0,22.486726,0> translate<43.464400,-1.535000,35.355000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.464400,-1.535000,38.304900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.103800,-1.535000,38.569800>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,-22.502480,0> translate<43.464400,-1.535000,38.304900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.960800,-1.535000,33.108900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,33.108900>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,0.000000,0> translate<43.960800,-1.535000,33.108900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.103800,-1.535000,38.569800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.796100,-1.535000,38.569800>}
box{<0,0,-0.127000><0.692300,0.035000,0.127000> rotate<0,0.000000,0> translate<44.103800,-1.535000,38.569800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.182100,-1.535000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260500,-1.535000,22.783800>}
box{<0,0,-0.127000><1.078400,0.035000,0.127000> rotate<0,0.000000,0> translate<44.182100,-1.535000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.182100,-1.535000,25.476100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260500,-1.535000,25.476100>}
box{<0,0,-0.127000><1.078400,0.035000,0.127000> rotate<0,0.000000,0> translate<44.182100,-1.535000,25.476100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,34.366200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373100,-1.535000,34.213600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.373100,-1.535000,34.213600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,33.108900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,34.213100>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,90.000000,0> translate<44.373600,-1.535000,34.213100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,33.274000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,33.528000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,33.782000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,34.036000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.373600,-1.535000,34.213100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,34.213100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.373600,-1.535000,34.213100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,33.108900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.939100,-1.535000,33.108900>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526200,-1.535000,33.108900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,34.213100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526200,-1.535000,33.108900>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.526200,-1.535000,33.108900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,34.213600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,34.366200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.526800,-1.535000,34.366200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,34.213600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.213600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,34.213600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,34.290000>}
box{<0,0,-0.127000><1.117000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.526800,-1.535000,34.366200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.366200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<44.526800,-1.535000,34.366200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.271600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,20.683500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<44.729400,-1.535000,21.271600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.908300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.271600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.729400,-1.535000,21.271600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,21.908300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,22.496400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<44.729400,-1.535000,21.908300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.351600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,25.763500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<44.729400,-1.535000,26.351600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.988300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.351600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.729400,-1.535000,26.351600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.729400,-1.535000,26.988300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,27.576400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<44.729400,-1.535000,26.988300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.796100,-1.535000,38.569800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.435500,-1.535000,38.304900>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,22.502480,0> translate<44.796100,-1.535000,38.569800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.939100,-1.535000,33.108900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,33.800800>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.939100,-1.535000,33.108900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,20.683500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.423100,-1.535000,20.233400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<44.973000,-1.535000,20.683500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,22.496400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260500,-1.535000,22.783800>}
box{<0,0,-0.127000><0.406516,0.035000,0.127000> rotate<0,-44.987065,0> translate<44.973000,-1.535000,22.496400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,25.763500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260500,-1.535000,25.476100>}
box{<0,0,-0.127000><0.406516,0.035000,0.127000> rotate<0,44.987065,0> translate<44.973000,-1.535000,25.763500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.973000,-1.535000,27.576400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.423100,-1.535000,28.026500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.973000,-1.535000,27.576400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.104200,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,33.274000>}
box{<0,0,-0.127000><0.539600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.104200,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.166400,-1.535000,35.243600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.435500,-1.535000,35.355000>}
box{<0,0,-0.127000><0.291247,0.035000,0.127000> rotate<0,-22.486726,0> translate<45.166400,-1.535000,35.243600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.166400,-1.535000,35.243600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.779100>}
box{<0,0,-0.127000><0.656973,0.035000,0.127000> rotate<0,44.990864,0> translate<45.166400,-1.535000,35.243600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.317000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.331100,-1.535000,38.354000>}
box{<0,0,-0.127000><6.014100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.317000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.317100,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,35.306000>}
box{<0,0,-0.127000><0.326700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.317100,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.358100,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,35.052000>}
box{<0,0,-0.127000><0.285700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.358100,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.358200,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,33.528000>}
box{<0,0,-0.127000><0.285600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.358200,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.423100,-1.535000,20.233400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,20.142000>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,22.494763,0> translate<45.423100,-1.535000,20.233400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.423100,-1.535000,28.026500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.117900>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-22.494763,0> translate<45.423100,-1.535000,28.026500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.435500,-1.535000,35.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.564200,-1.535000,35.483800>}
box{<0,0,-0.127000><0.182080,0.035000,0.127000> rotate<0,-45.019279,0> translate<45.435500,-1.535000,35.355000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.435500,-1.535000,38.304900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.564200,-1.535000,38.176100>}
box{<0,0,-0.127000><0.182080,0.035000,0.127000> rotate<0,45.019279,0> translate<45.435500,-1.535000,38.304900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.452100,-1.535000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.073200,-1.535000,15.163800>}
box{<0,0,-0.127000><0.621100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.452100,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.452100,-1.535000,17.856100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,17.856100>}
box{<0,0,-0.127000><0.191700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.452100,-1.535000,17.856100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.564200,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,35.483800>}
box{<0,0,-0.127000><0.079600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.564200,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.564200,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.722100,-1.535000,38.176100>}
box{<0,0,-0.127000><1.157900,0.035000,0.127000> rotate<0,0.000000,0> translate<45.564200,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.612100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,34.798000>}
box{<0,0,-0.127000><0.031700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.612100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.612200,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,33.782000>}
box{<0,0,-0.127000><0.031600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.612200,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,33.800800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.213600>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,90.000000,0> translate<45.631000,-1.535000,34.213600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,34.036000>}
box{<0,0,-0.127000><0.012800,0.035000,0.127000> rotate<0,0.000000,0> translate<45.631000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.366200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.779100>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,90.000000,0> translate<45.631000,-1.535000,34.779100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.631000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,34.544000>}
box{<0,0,-0.127000><0.012800,0.035000,0.127000> rotate<0,0.000000,0> translate<45.631000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,20.142000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,17.856100>}
box{<0,0,-0.127000><2.285900,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.643800,-1.535000,17.856100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.643800,-1.535000,28.117900>}
box{<0,0,-0.127000><7.365900,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.643800,-1.535000,28.117900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.073200,-1.535000,15.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.327200,-1.535000,14.909800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<46.073200,-1.535000,15.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.327200,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.652700,-1.535000,14.909800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.327200,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.722100,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.257800,-1.535000,38.176100>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<46.722100,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.257800,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.153200,-1.535000,38.176100>}
box{<0,0,-0.127000><3.895400,0.035000,0.127000> rotate<0,0.000000,0> translate<47.257800,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.652700,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,15.847200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.652700,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.728900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.331000,-1.535000,14.986000>}
box{<0,0,-0.127000><3.602100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.728900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.982900,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.077000,-1.535000,15.240000>}
box{<0,0,-0.127000><3.094100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.982900,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.236900,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.823000,-1.535000,15.494000>}
box{<0,0,-0.127000><2.586100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.236900,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,17.426700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,20.142000>}
box{<0,0,-0.127000><2.715300,0.035000,0.127000> rotate<0,90.000000,0> translate<48.336100,-1.535000,20.142000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,17.426700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,17.172700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<48.336100,-1.535000,17.426700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,17.526000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,17.780000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,18.034000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,18.288000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,18.542000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,18.796000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,19.050000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,19.304000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,19.558000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,19.812000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,20.066000>}
box{<0,0,-0.127000><2.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,20.142000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.556800,-1.535000,20.233400>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-22.494763,0> translate<48.336100,-1.535000,20.142000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.117900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,35.483800>}
box{<0,0,-0.127000><7.365900,0.035000,0.127000> rotate<0,90.000000,0> translate<48.336100,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.117900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.556800,-1.535000,28.026500>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,22.494763,0> translate<48.336100,-1.535000,28.117900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.512500,-1.535000,28.194000>}
box{<0,0,-0.127000><8.176400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.343100,-1.535000,28.448000>}
box{<0,0,-0.127000><8.007000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.237900,-1.535000,28.702000>}
box{<0,0,-0.127000><7.901800,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,28.956000>}
box{<0,0,-0.127000><7.823300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,29.210000>}
box{<0,0,-0.127000><7.823300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,29.464000>}
box{<0,0,-0.127000><7.823300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.238000,-1.535000,29.718000>}
box{<0,0,-0.127000><7.901900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.343200,-1.535000,29.972000>}
box{<0,0,-0.127000><8.007100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.512600,-1.535000,30.226000>}
box{<0,0,-0.127000><8.176500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.766600,-1.535000,30.480000>}
box{<0,0,-0.127000><8.430500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,30.734000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,30.988000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,31.242000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,31.496000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,31.750000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,32.004000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,32.258000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,32.512000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,32.766000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,33.020000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,33.274000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,33.528000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,33.782000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,34.036000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,34.290000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,34.544000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,34.798000>}
box{<0,0,-0.127000><8.737700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.024100,-1.535000,35.052000>}
box{<0,0,-0.127000><8.688000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.331000,-1.535000,35.306000>}
box{<0,0,-0.127000><2.994900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.336100,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.153200,-1.535000,35.483800>}
box{<0,0,-0.127000><2.817100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.336100,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490800,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.569100,-1.535000,17.272000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.490800,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490900,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.569000,-1.535000,15.748000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.490900,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.556800,-1.535000,20.233400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,20.683500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.556800,-1.535000,20.233400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.556800,-1.535000,28.026500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,27.576400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<48.556800,-1.535000,28.026500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,15.847200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,17.172700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<48.590100,-1.535000,17.172700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,16.002000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.590100,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,16.256000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.590100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,16.510000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.590100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,16.764000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.590100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,17.018000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.590100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,22.859900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,22.496400>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,44.989151,0> translate<48.643300,-1.535000,22.859900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,22.859900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,23.223500>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.643300,-1.535000,22.859900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,25.036400>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,44.997030,0> translate<48.643300,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,25.763500>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,-44.989151,0> translate<48.643300,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.400000>}
box{<0,0,-0.127000><2.080500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.643300,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.888400,-1.535000,27.940000>}
box{<0,0,-0.127000><4.245100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.643300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643400,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,20.320000>}
box{<0,0,-0.127000><2.080400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.643400,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.643400,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,22.860000>}
box{<0,0,-0.127000><2.080400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.643400,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897300,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,22.606000>}
box{<0,0,-0.127000><1.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897300,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897300,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.146000>}
box{<0,0,-0.127000><1.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897300,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897300,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.654000>}
box{<0,0,-0.127000><1.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897300,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897300,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.452200,-1.535000,27.686000>}
box{<0,0,-0.127000><3.554900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897300,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897400,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,20.574000>}
box{<0,0,-0.127000><1.826400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897400,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.897400,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,23.114000>}
box{<0,0,-0.127000><1.826400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.897400,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,20.683500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.271600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<49.006900,-1.535000,20.683500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,22.496400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.908300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<49.006900,-1.535000,22.496400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,23.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,23.811600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<49.006900,-1.535000,23.223500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,25.036400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,24.448300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<49.006900,-1.535000,25.036400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,25.763500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.351600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<49.006900,-1.535000,25.763500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.006900,-1.535000,27.576400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.988300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<49.006900,-1.535000,27.576400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066700,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,20.828000>}
box{<0,0,-0.127000><1.657100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066700,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066700,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.569000,-1.535000,23.368000>}
box{<0,0,-0.127000><1.502300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066700,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066700,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.823300,-1.535000,25.908000>}
box{<0,0,-0.127000><1.756600,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066700,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066800,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,22.352000>}
box{<0,0,-0.127000><1.657000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066800,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066800,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.569100,-1.535000,24.892000>}
box{<0,0,-0.127000><1.502300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066800,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.066800,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.198200,-1.535000,27.432000>}
box{<0,0,-0.127000><3.131400,0.035000,0.127000> rotate<0,0.000000,0> translate<49.066800,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.171900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,21.082000>}
box{<0,0,-0.127000><1.551900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.171900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.171900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,23.622000>}
box{<0,0,-0.127000><1.297900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.171900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.171900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.928500,-1.535000,26.162000>}
box{<0,0,-0.127000><1.756600,0.035000,0.127000> rotate<0,0.000000,0> translate<49.171900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.172000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,22.098000>}
box{<0,0,-0.127000><1.551800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.172000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.172000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,24.638000>}
box{<0,0,-0.127000><1.297800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.172000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.172000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.944200,-1.535000,27.178000>}
box{<0,0,-0.127000><2.772200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.172000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.271600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.908300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<49.250500,-1.535000,21.908300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,21.336000>}
box{<0,0,-0.127000><1.473300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,21.590000>}
box{<0,0,-0.127000><1.473300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,21.844000>}
box{<0,0,-0.127000><1.473300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,23.811600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,24.448300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<49.250500,-1.535000,24.448300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,23.876000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,24.130000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,24.384000>}
box{<0,0,-0.127000><1.219300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.351600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.988300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<49.250500,-1.535000,26.988300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.182200,-1.535000,26.416000>}
box{<0,0,-0.127000><1.931700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.436200,-1.535000,26.670000>}
box{<0,0,-0.127000><2.185700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.250500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.690200,-1.535000,26.924000>}
box{<0,0,-0.127000><2.439700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.250500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,15.847200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,14.909800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<50.469800,-1.535000,15.847200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,17.172700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,15.847200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.469800,-1.535000,15.847200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,17.172700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,17.426700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.469800,-1.535000,17.172700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,23.213200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<50.469800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,23.467200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.469800,-1.535000,23.467200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.469800,-1.535000,24.792700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.046700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.469800,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,23.213200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,17.426700>}
box{<0,0,-0.127000><5.786500,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.723800,-1.535000,17.426700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.667800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.046700>}
box{<0,0,-0.127000><0.621100,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.723800,-1.535000,25.046700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.723800,-1.535000,25.667800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.928700,-1.535000,26.162500>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,-67.496677,0> translate<50.723800,-1.535000,25.667800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.928700,-1.535000,26.162500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.307400,-1.535000,26.541200>}
box{<0,0,-0.127000><0.535563,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.928700,-1.535000,26.162500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.153200,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,35.229800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<51.153200,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.153200,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,38.430100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.153200,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.307400,-1.535000,26.541200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.577400,-1.535000,27.811200>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.307400,-1.535000,26.541200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,14.909800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<51.407200,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<51.407200,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.407200,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<51.407200,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.577400,-1.535000,27.811200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.072100,-1.535000,28.016100>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,-22.497383,0> translate<52.577400,-1.535000,27.811200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,15.847200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.732700,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.986700,-1.535000,35.483800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.732700,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.732700,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.986700,-1.535000,38.176100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<52.732700,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.808800,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.871200,-1.535000,38.354000>}
box{<0,0,-0.127000><1.062400,0.035000,0.127000> rotate<0,0.000000,0> translate<52.808800,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.808900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,14.986000>}
box{<0,0,-0.127000><13.154900,0.035000,0.127000> rotate<0,0.000000,0> translate<52.808900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.808900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.871000,-1.535000,35.306000>}
box{<0,0,-0.127000><1.062100,0.035000,0.127000> rotate<0,0.000000,0> translate<52.808900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.986700,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.693300,-1.535000,35.483800>}
box{<0,0,-0.127000><0.706600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.986700,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.986700,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.693300,-1.535000,38.176100>}
box{<0,0,-0.127000><0.706600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.986700,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.062900,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,15.240000>}
box{<0,0,-0.127000><12.900900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.062900,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.072100,-1.535000,28.016100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.607800,-1.535000,28.016100>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.072100,-1.535000,28.016100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.316900,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,15.494000>}
box{<0,0,-0.127000><12.646900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.316900,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,17.426700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,23.213200>}
box{<0,0,-0.127000><5.786500,0.035000,0.127000> rotate<0,90.000000,0> translate<53.416100,-1.535000,23.213200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,17.426700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,17.172700>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<53.416100,-1.535000,17.426700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,17.526000>}
box{<0,0,-0.127000><12.547700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,17.780000>}
box{<0,0,-0.127000><12.547700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,18.034000>}
box{<0,0,-0.127000><12.547700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,18.288000>}
box{<0,0,-0.127000><12.547700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,18.542000>}
box{<0,0,-0.127000><12.547700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.141000,-1.535000,18.796000>}
box{<0,0,-0.127000><1.724900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.887000,-1.535000,19.050000>}
box{<0,0,-0.127000><1.470900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.633000,-1.535000,19.304000>}
box{<0,0,-0.127000><1.216900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.379000,-1.535000,19.558000>}
box{<0,0,-0.127000><0.962900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,19.812000>}
box{<0,0,-0.127000><0.863700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.066000>}
box{<0,0,-0.127000><0.863700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.320000>}
box{<0,0,-0.127000><0.863700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.574000>}
box{<0,0,-0.127000><0.863700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.828000>}
box{<0,0,-0.127000><0.863700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.379100,-1.535000,21.082000>}
box{<0,0,-0.127000><0.963000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.633100,-1.535000,21.336000>}
box{<0,0,-0.127000><1.217000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.887100,-1.535000,21.590000>}
box{<0,0,-0.127000><1.471000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.141100,-1.535000,21.844000>}
box{<0,0,-0.127000><1.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,22.098000>}
box{<0,0,-0.127000><3.657700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,22.352000>}
box{<0,0,-0.127000><3.657700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,22.606000>}
box{<0,0,-0.127000><3.657700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.766500,-1.535000,22.860000>}
box{<0,0,-0.127000><3.350400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.512500,-1.535000,23.114000>}
box{<0,0,-0.127000><3.096400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.416100,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.416100,-1.535000,23.213200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,23.467200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.416100,-1.535000,23.213200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.518200,-1.535000,24.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,24.792700>}
box{<0,0,-0.127000><0.214748,0.035000,0.127000> rotate<0,44.978166,0> translate<53.518200,-1.535000,24.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.518200,-1.535000,24.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.897600,-1.535000,25.323800>}
box{<0,0,-0.127000><0.536482,0.035000,0.127000> rotate<0,-44.989479,0> translate<53.518200,-1.535000,24.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.570800,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,17.272000>}
box{<0,0,-0.127000><12.393000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.570800,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.570800,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.343200,-1.535000,24.892000>}
box{<0,0,-0.127000><2.772400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.570800,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.570900,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,15.748000>}
box{<0,0,-0.127000><12.392900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.570900,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.570900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.343100,-1.535000,23.368000>}
box{<0,0,-0.127000><2.772200,0.035000,0.127000> rotate<0,0.000000,0> translate<53.570900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.607800,-1.535000,28.016100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.690500,-1.535000,28.016100>}
box{<0,0,-0.127000><3.082700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.607800,-1.535000,28.016100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,15.847200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,17.172700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<53.670100,-1.535000,17.172700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,16.002000>}
box{<0,0,-0.127000><12.293700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,16.256000>}
box{<0,0,-0.127000><12.293700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,16.510000>}
box{<0,0,-0.127000><12.293700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,16.764000>}
box{<0,0,-0.127000><12.293700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,17.018000>}
box{<0,0,-0.127000><12.293700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,23.467200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,24.792700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<53.670100,-1.535000,24.792700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.237900,-1.535000,23.622000>}
box{<0,0,-0.127000><2.567800,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,23.876000>}
box{<0,0,-0.127000><2.489300,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,24.130000>}
box{<0,0,-0.127000><2.489300,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,24.384000>}
box{<0,0,-0.127000><2.489300,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.670100,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.238000,-1.535000,24.638000>}
box{<0,0,-0.127000><2.567900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.670100,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.693300,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.947200,-1.535000,35.229800>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,45.008310,0> translate<53.693300,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.693300,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.947200,-1.535000,38.430100>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-45.008310,0> translate<53.693300,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.719700,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.512700,-1.535000,25.146000>}
box{<0,0,-0.127000><2.793000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.719700,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.897600,-1.535000,25.323800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.690500,-1.535000,25.323800>}
box{<0,0,-0.127000><2.792900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.897600,-1.535000,25.323800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.947200,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.272700,-1.535000,35.229800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.947200,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.947200,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.272700,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.947200,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.217200,-1.535000,18.719800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<54.279800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,19.657200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.279800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.279800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.217200,-1.535000,21.920100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.279800,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.448600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<54.838600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.188600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.838600,-1.535000,7.188600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.838600,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803100,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.838600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,7.696200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.838600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.838600,-1.535000,8.051300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.448600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.838600,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.217200,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.542700,-1.535000,18.719800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.217200,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.217200,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.542700,-1.535000,21.920100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.217200,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.272700,-1.535000,35.229800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.526600,-1.535000,35.483800>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-45.008310,0> translate<55.272700,-1.535000,35.229800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.272700,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.526600,-1.535000,38.176100>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,45.008310,0> translate<55.272700,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.348800,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.770100,-1.535000,35.306000>}
box{<0,0,-0.127000><1.421300,0.035000,0.127000> rotate<0,0.000000,0> translate<55.348800,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.348800,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.571100,-1.535000,38.354000>}
box{<0,0,-0.127000><11.222300,0.035000,0.127000> rotate<0,0.000000,0> translate<55.348800,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.448600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.448600,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.448600,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.448600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.526600,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.592300,-1.535000,35.483800>}
box{<0,0,-0.127000><1.065700,0.035000,0.127000> rotate<0,0.000000,0> translate<55.526600,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.526600,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.882100,-1.535000,38.176100>}
box{<0,0,-0.127000><1.355500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.526600,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803100,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803100,-1.535000,7.543600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<55.803100,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.543100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<55.803600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,6.604000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,6.858000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.112000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.366000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.543100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,7.543100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,8.661300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<55.803600,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.874000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,8.128000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,8.382000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.803600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,8.636000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.803600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.311300,-1.535000,6.578600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.956200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.543100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,6.578600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<55.956200,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,7.696800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<55.956200,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.311300,-1.535000,8.661300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.956200,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956800,-1.535000,7.696200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<55.956800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956800,-1.535000,7.543600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.956800,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956800,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,7.620000>}
box{<0,0,-0.127000><17.500200,0.035000,0.127000> rotate<0,0.000000,0> translate<55.956800,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956800,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.696200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.956800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,23.811600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,23.223500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<56.159400,-1.535000,23.811600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,24.448300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,23.811600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.159400,-1.535000,23.811600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,24.448300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,25.036400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<56.159400,-1.535000,24.448300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,28.891600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,28.303500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<56.159400,-1.535000,28.891600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,29.528300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,28.891600>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.159400,-1.535000,28.891600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159400,-1.535000,29.528300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,30.116400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<56.159400,-1.535000,29.528300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.311300,-1.535000,6.578600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.188600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.311300,-1.535000,6.578600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.311300,-1.535000,8.661300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<56.311300,-1.535000,8.661300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.336600,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,8.636000>}
box{<0,0,-0.127000><17.120400,0.035000,0.127000> rotate<0,0.000000,0> translate<56.336600,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.336700,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,6.604000>}
box{<0,0,-0.127000><17.120300,0.035000,0.127000> rotate<0,0.000000,0> translate<56.336700,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,23.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.853100,-1.535000,22.773400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<56.403000,-1.535000,23.223500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,25.036400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.690500,-1.535000,25.323800>}
box{<0,0,-0.127000><0.406516,0.035000,0.127000> rotate<0,-44.987065,0> translate<56.403000,-1.535000,25.036400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,28.303500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.690500,-1.535000,28.016100>}
box{<0,0,-0.127000><0.406516,0.035000,0.127000> rotate<0,44.987065,0> translate<56.403000,-1.535000,28.303500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.403000,-1.535000,30.116400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.853100,-1.535000,30.566500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.403000,-1.535000,30.116400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.542700,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.796700,-1.535000,18.973800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.542700,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.542700,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.796700,-1.535000,21.666100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<56.542700,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.590600,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,8.382000>}
box{<0,0,-0.127000><16.866400,0.035000,0.127000> rotate<0,0.000000,0> translate<56.590600,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.590700,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,6.858000>}
box{<0,0,-0.127000><16.866300,0.035000,0.127000> rotate<0,0.000000,0> translate<56.590700,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.592300,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,35.002300>}
box{<0,0,-0.127000><0.680944,0.035000,0.127000> rotate<0,44.997030,0> translate<56.592300,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.618800,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,21.844000>}
box{<0,0,-0.127000><0.455000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.618800,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.618900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.491000,-1.535000,18.796000>}
box{<0,0,-0.127000><4.872100,0.035000,0.127000> rotate<0,0.000000,0> translate<56.618900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.796700,-1.535000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.152100,-1.535000,18.973800>}
box{<0,0,-0.127000><1.355400,0.035000,0.127000> rotate<0,0.000000,0> translate<56.796700,-1.535000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.796700,-1.535000,21.666100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,21.666100>}
box{<0,0,-0.127000><0.277100,0.035000,0.127000> rotate<0,0.000000,0> translate<56.796700,-1.535000,21.666100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.844600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,8.128000>}
box{<0,0,-0.127000><16.612400,0.035000,0.127000> rotate<0,0.000000,0> translate<56.844600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.844700,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,7.112000>}
box{<0,0,-0.127000><16.612300,0.035000,0.127000> rotate<0,0.000000,0> translate<56.844700,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.853100,-1.535000,22.773400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,22.682000>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,22.494763,0> translate<56.853100,-1.535000,22.773400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.853100,-1.535000,30.566500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,30.657900>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-22.494763,0> translate<56.853100,-1.535000,30.566500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.882100,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.417800,-1.535000,38.176100>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<56.882100,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.543600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<56.921300,-1.535000,7.543600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,7.366000>}
box{<0,0,-0.127000><16.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<56.921300,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,8.051300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<56.921300,-1.535000,8.051300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921300,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,7.874000>}
box{<0,0,-0.127000><16.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<56.921300,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,22.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,21.666100>}
box{<0,0,-0.127000><1.015900,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.073800,-1.535000,21.666100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,35.002300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.073800,-1.535000,30.657900>}
box{<0,0,-0.127000><4.344400,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.073800,-1.535000,30.657900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.417800,-1.535000,38.176100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.912500,-1.535000,37.971200>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,22.497383,0> translate<57.417800,-1.535000,38.176100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.601600,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.317100,-1.535000,38.100000>}
box{<0,0,-0.127000><8.715500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.601600,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.912500,-1.535000,37.971200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182500,-1.535000,36.701200>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<57.912500,-1.535000,37.971200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.037700,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.063100,-1.535000,37.846000>}
box{<0,0,-0.127000><8.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.037700,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.152100,-1.535000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.687800,-1.535000,18.973800>}
box{<0,0,-0.127000><0.535700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.152100,-1.535000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.291700,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.809100,-1.535000,37.592000>}
box{<0,0,-0.127000><7.517400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.291700,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.545700,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,37.338000>}
box{<0,0,-0.127000><7.164100,0.035000,0.127000> rotate<0,0.000000,0> translate<58.545700,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.687800,-1.535000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.313200,-1.535000,18.973800>}
box{<0,0,-0.127000><2.625400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.687800,-1.535000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.799700,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,37.084000>}
box{<0,0,-0.127000><6.910100,0.035000,0.127000> rotate<0,0.000000,0> translate<58.799700,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.053700,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,36.830000>}
box{<0,0,-0.127000><6.656100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.053700,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182500,-1.535000,36.701200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.561200,-1.535000,36.322500>}
box{<0,0,-0.127000><0.535563,0.035000,0.127000> rotate<0,44.997030,0> translate<59.182500,-1.535000,36.701200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.307700,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,36.576000>}
box{<0,0,-0.127000><6.402100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.307700,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.561200,-1.535000,36.322500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.827800>}
box{<0,0,-0.127000><0.535455,0.035000,0.127000> rotate<0,67.496677,0> translate<59.561200,-1.535000,36.322500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.561500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,36.322000>}
box{<0,0,-0.127000><6.148300,0.035000,0.127000> rotate<0,0.000000,0> translate<59.561500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.666700,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.809000,-1.535000,36.068000>}
box{<0,0,-0.127000><6.142300,0.035000,0.127000> rotate<0,0.000000,0> translate<59.666700,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,21.666100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,22.682000>}
box{<0,0,-0.127000><1.015900,0.035000,0.127000> rotate<0,90.000000,0> translate<59.766100,-1.535000,22.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,21.666100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.313200,-1.535000,21.666100>}
box{<0,0,-0.127000><1.547100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,21.666100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.491100,-1.535000,21.844000>}
box{<0,0,-0.127000><1.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,22.098000>}
box{<0,0,-0.127000><13.690900,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,22.352000>}
box{<0,0,-0.127000><13.690900,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,22.606000>}
box{<0,0,-0.127000><13.690900,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,22.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.986800,-1.535000,22.773400>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,-22.494763,0> translate<59.766100,-1.535000,22.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,30.657900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.827800>}
box{<0,0,-0.127000><5.169900,0.035000,0.127000> rotate<0,90.000000,0> translate<59.766100,-1.535000,35.827800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,30.657900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.986800,-1.535000,30.566500>}
box{<0,0,-0.127000><0.238877,0.035000,0.127000> rotate<0,22.494763,0> translate<59.766100,-1.535000,30.657900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.734000>}
box{<0,0,-0.127000><5.080100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.916500,-1.535000,30.988000>}
box{<0,0,-0.127000><5.150400,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.021700,-1.535000,31.242000>}
box{<0,0,-0.127000><5.255600,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.157400,-1.535000,31.496000>}
box{<0,0,-0.127000><5.391300,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.411400,-1.535000,31.750000>}
box{<0,0,-0.127000><5.645300,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.780600,-1.535000,32.004000>}
box{<0,0,-0.127000><6.014500,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,32.258000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,32.512000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,32.766000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,33.020000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,33.274000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,33.528000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,33.782000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,34.036000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,34.290000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,34.544000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,34.798000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.052000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.306000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.560000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.766100,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.814000>}
box{<0,0,-0.127000><6.197700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.766100,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.986800,-1.535000,22.773400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,23.223500>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.986800,-1.535000,22.773400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.986800,-1.535000,30.566500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,30.116400>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<59.986800,-1.535000,30.566500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,25.399900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,25.036400>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,44.989151,0> translate<60.073300,-1.535000,25.399900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,25.399900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,25.763500>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.073300,-1.535000,25.399900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,27.576400>}
box{<0,0,-0.127000><0.514208,0.035000,0.127000> rotate<0,44.997030,0> translate<60.073300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,28.303500>}
box{<0,0,-0.127000><0.514137,0.035000,0.127000> rotate<0,-44.989151,0> translate<60.073300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,27.940000>}
box{<0,0,-0.127000><7.109200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.073300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.480000>}
box{<0,0,-0.127000><4.772900,0.035000,0.127000> rotate<0,0.000000,0> translate<60.073300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073400,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,22.860000>}
box{<0,0,-0.127000><13.383600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.073400,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.073400,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,25.400000>}
box{<0,0,-0.127000><13.383600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.073400,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327300,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,25.146000>}
box{<0,0,-0.127000><13.129700,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327300,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327300,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.430900,-1.535000,27.686000>}
box{<0,0,-0.127000><5.103600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327300,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327300,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.431000,-1.535000,28.194000>}
box{<0,0,-0.127000><5.103700,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327300,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327300,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.226000>}
box{<0,0,-0.127000><4.518900,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327300,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327400,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,23.114000>}
box{<0,0,-0.127000><13.129600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327400,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.327400,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,25.654000>}
box{<0,0,-0.127000><13.129600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.327400,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,23.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,23.811600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<60.436900,-1.535000,23.223500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,25.036400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,24.448300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<60.436900,-1.535000,25.036400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,25.763500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.351600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<60.436900,-1.535000,25.763500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,27.576400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.988300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<60.436900,-1.535000,27.576400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,28.303500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,28.891600>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<60.436900,-1.535000,28.303500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.436900,-1.535000,30.116400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,29.528300>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<60.436900,-1.535000,30.116400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496700,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,23.368000>}
box{<0,0,-0.127000><12.960300,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496700,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496700,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,25.908000>}
box{<0,0,-0.127000><12.960300,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496700,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.524100,-1.535000,28.448000>}
box{<0,0,-0.127000><5.027400,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496800,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,24.892000>}
box{<0,0,-0.127000><12.960200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496800,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496800,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.523900,-1.535000,27.432000>}
box{<0,0,-0.127000><5.027100,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496800,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.496800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.916300,-1.535000,29.972000>}
box{<0,0,-0.127000><4.419500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.496800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.601900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,23.622000>}
box{<0,0,-0.127000><12.855100,0.035000,0.127000> rotate<0,0.000000,0> translate<60.601900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.601900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,26.162000>}
box{<0,0,-0.127000><12.855100,0.035000,0.127000> rotate<0,0.000000,0> translate<60.601900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.601900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.693600,-1.535000,28.702000>}
box{<0,0,-0.127000><5.091700,0.035000,0.127000> rotate<0,0.000000,0> translate<60.601900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.602000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,24.638000>}
box{<0,0,-0.127000><12.855000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.602000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.602000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.693500,-1.535000,27.178000>}
box{<0,0,-0.127000><5.091500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.602000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.602000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.021600,-1.535000,29.718000>}
box{<0,0,-0.127000><4.419600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.602000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,23.811600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,24.448300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<60.680500,-1.535000,24.448300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,23.876000>}
box{<0,0,-0.127000><12.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,24.130000>}
box{<0,0,-0.127000><12.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,24.384000>}
box{<0,0,-0.127000><12.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.351600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.988300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<60.680500,-1.535000,26.988300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,26.416000>}
box{<0,0,-0.127000><12.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,26.670000>}
box{<0,0,-0.127000><12.776500,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.024200,-1.535000,26.924000>}
box{<0,0,-0.127000><5.343700,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,28.891600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,29.528300>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,90.000000,0> translate<60.680500,-1.535000,29.528300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.780200,-1.535000,28.956000>}
box{<0,0,-0.127000><5.099700,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.411300,-1.535000,29.210000>}
box{<0,0,-0.127000><4.730800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.680500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.157300,-1.535000,29.464000>}
box{<0,0,-0.127000><4.476800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.680500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.313200,-1.535000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.567200,-1.535000,18.719800>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<61.313200,-1.535000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.313200,-1.535000,21.666100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.567200,-1.535000,21.920100>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.313200,-1.535000,21.666100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.567200,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.892700,-1.535000,18.719800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.567200,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.567200,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.892700,-1.535000,21.920100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.567200,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.892700,-1.535000,18.719800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,19.657200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.892700,-1.535000,18.719800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.892700,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.982700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<62.892700,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.968800,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.571100,-1.535000,21.844000>}
box{<0,0,-0.127000><3.602300,0.035000,0.127000> rotate<0,0.000000,0> translate<62.968800,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.968900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,18.796000>}
box{<0,0,-0.127000><2.994900,0.035000,0.127000> rotate<0,0.000000,0> translate<62.968900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.222800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.317100,-1.535000,21.590000>}
box{<0,0,-0.127000><3.094300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.222800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.222900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,19.050000>}
box{<0,0,-0.127000><2.740900,0.035000,0.127000> rotate<0,0.000000,0> translate<63.222900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.476800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.063100,-1.535000,21.336000>}
box{<0,0,-0.127000><2.586300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.476800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.476900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,19.304000>}
box{<0,0,-0.127000><2.486900,0.035000,0.127000> rotate<0,0.000000,0> translate<63.476900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.730800,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.809100,-1.535000,21.082000>}
box{<0,0,-0.127000><2.078300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.730800,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.730900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.809000,-1.535000,19.558000>}
box{<0,0,-0.127000><2.078100,0.035000,0.127000> rotate<0,0.000000,0> translate<63.730900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.982700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<63.830100,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,19.812000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.830100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.066000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.830100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.320000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.830100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.574000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.830100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.830100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.828000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.830100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,12.361400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,11.736000>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<64.846200,-1.535000,12.361400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,13.038500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,12.361400>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,-90.000000,0> translate<64.846200,-1.535000,12.361400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,13.038500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,13.663900>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<64.846200,-1.535000,13.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.141400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,29.516000>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<64.846200,-1.535000,30.141400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.818500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.141400>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,-90.000000,0> translate<64.846200,-1.535000,30.141400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.846200,-1.535000,30.818500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,31.443900>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<64.846200,-1.535000,30.818500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,11.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,11.257300>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<65.105300,-1.535000,11.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,13.663900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,14.142600>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.105300,-1.535000,13.663900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,29.516000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,29.037300>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<65.105300,-1.535000,29.516000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.105300,-1.535000,31.443900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,31.922600>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.105300,-1.535000,31.443900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,9.892300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<65.410800,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,10.033000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<65.410800,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,10.427600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<65.410800,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,10.286800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<65.410800,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,27.672300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<65.410800,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,27.813000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<65.410800,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,28.066800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,28.207600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<65.410800,-1.535000,28.066800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.410800,-1.535000,28.066800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,28.066800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<65.410800,-1.535000,28.066800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,9.892300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,9.721200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<65.433100,-1.535000,9.892300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,10.427600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,10.598700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<65.433100,-1.535000,10.427600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,27.672300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,27.501200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<65.433100,-1.535000,27.672300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.433100,-1.535000,28.207600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,28.378700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<65.433100,-1.535000,28.207600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,9.721200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,9.560900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<65.488700,-1.535000,9.721200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,10.598700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,10.759000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<65.488700,-1.535000,10.598700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,27.501200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,27.340900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<65.488700,-1.535000,27.501200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.488700,-1.535000,28.378700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,28.539000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<65.488700,-1.535000,28.378700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,9.560900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,9.415400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<65.570400,-1.535000,9.560900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,10.759000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,10.904500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<65.570400,-1.535000,10.759000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,27.340900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,27.195400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<65.570400,-1.535000,27.340900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.570400,-1.535000,28.539000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,28.684500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<65.570400,-1.535000,28.539000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,11.257300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.921500,-1.535000,11.117500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<65.584000,-1.535000,11.257300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,14.142600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,14.299900>}
box{<0,0,-0.127000><0.411086,0.035000,0.127000> rotate<0,-22.496157,0> translate<65.584000,-1.535000,14.142600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,29.037300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.921500,-1.535000,28.897500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<65.584000,-1.535000,29.037300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.584000,-1.535000,31.922600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,32.079900>}
box{<0,0,-0.127000><0.411086,0.035000,0.127000> rotate<0,-22.496157,0> translate<65.584000,-1.535000,31.922600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,9.415400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,9.288100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<65.676100,-1.535000,9.415400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,10.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,11.031800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.676100,-1.535000,10.904500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,27.195400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,27.068100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<65.676100,-1.535000,27.195400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.676100,-1.535000,28.684500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,28.811800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.676100,-1.535000,28.684500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,19.403300>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,44.985750,0> translate<65.709800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,19.657200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<65.709800,-1.535000,19.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,20.982700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.647200,-1.535000,21.920100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.709800,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,36.167200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.913200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<65.709800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,36.167200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<65.709800,-1.535000,36.167200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.709800,-1.535000,37.492700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.647200,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.709800,-1.535000,37.492700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,9.288100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.948900,-1.535000,9.182400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<65.803400,-1.535000,9.288100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,11.031800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.921500,-1.535000,11.117500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<65.803400,-1.535000,11.031800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,27.068100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.948900,-1.535000,26.962400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<65.803400,-1.535000,27.068100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.803400,-1.535000,28.811800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.921500,-1.535000,28.897500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<65.803400,-1.535000,28.811800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.948900,-1.535000,9.182400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.109200,-1.535000,9.100700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<65.948900,-1.535000,9.182400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.948900,-1.535000,26.962400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.109200,-1.535000,26.880700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<65.948900,-1.535000,26.962400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,19.403300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,14.299900>}
box{<0,0,-0.127000><5.103400,0.035000,0.127000> rotate<0,-90.000000,0> translate<65.963800,-1.535000,14.299900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,35.913200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.963800,-1.535000,32.079900>}
box{<0,0,-0.127000><3.833300,0.035000,0.127000> rotate<0,-90.000000,0> translate<65.963800,-1.535000,32.079900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.109200,-1.535000,9.100700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.280300,-1.535000,9.045100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<66.109200,-1.535000,9.100700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.109200,-1.535000,26.880700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.280300,-1.535000,26.825100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<66.109200,-1.535000,26.880700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.280300,-1.535000,9.045100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.458000,-1.535000,9.017000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<66.280300,-1.535000,9.045100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.280300,-1.535000,26.825100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.458000,-1.535000,26.797000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<66.280300,-1.535000,26.825100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.458000,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.017000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.458000,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.458000,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,26.797000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.458000,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.647200,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.972700,-1.535000,21.920100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<66.647200,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.647200,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.972700,-1.535000,38.430100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<66.647200,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,10.033000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<67.182500,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,28.066800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.182500,-1.535000,27.813000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<67.182500,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,10.032500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<67.183000,-1.535000,10.032500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.144000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.398000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.652000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.906000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,10.032500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,10.032500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,10.032500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,27.812500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<67.183000,-1.535000,27.812500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,26.924000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,27.178000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,27.432000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,27.686000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,27.812500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,27.812500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,27.812500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.161900,-1.535000,9.017000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<67.436800,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,10.032500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,9.017000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<67.436800,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.161900,-1.535000,26.797000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<67.436800,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,27.812500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.436800,-1.535000,26.797000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<67.436800,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,10.286800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<67.437400,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,10.033000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,10.160000>}
box{<0,0,-0.127000><6.019600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,10.286800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,10.286800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,10.286800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,28.066800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<67.437400,-1.535000,28.066800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,27.813000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,27.940000>}
box{<0,0,-0.127000><6.019600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.437400,-1.535000,28.066800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,28.066800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<67.437400,-1.535000,28.066800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.972700,-1.535000,21.920100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.982700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<67.972700,-1.535000,21.920100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.972700,-1.535000,38.430100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,37.492700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<67.972700,-1.535000,38.430100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.048800,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,21.844000>}
box{<0,0,-0.127000><5.408200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.048800,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.048800,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.552400,-1.535000,38.354000>}
box{<0,0,-0.127000><0.503600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.048800,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.161900,-1.535000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.339600,-1.535000,9.045100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<68.161900,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.161900,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.339600,-1.535000,26.825100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<68.161900,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.302800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,21.590000>}
box{<0,0,-0.127000><5.154200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.302800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.302800,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.685800,-1.535000,38.100000>}
box{<0,0,-0.127000><0.383000,0.035000,0.127000> rotate<0,0.000000,0> translate<68.302800,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.339600,-1.535000,9.045100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.510700,-1.535000,9.100700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<68.339600,-1.535000,9.045100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.339600,-1.535000,26.825100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.510700,-1.535000,26.880700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<68.339600,-1.535000,26.825100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,3.448800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,2.751200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<68.377000,-1.535000,3.448800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,4.171100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,3.448800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<68.377000,-1.535000,3.448800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,4.171100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,4.868700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<68.377000,-1.535000,4.171100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.008800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,38.311200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<68.377000,-1.535000,39.008800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.731100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.008800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<68.377000,-1.535000,39.008800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.377000,-1.535000,39.731100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,40.428700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<68.377000,-1.535000,39.731100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.510700,-1.535000,9.100700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.671000,-1.535000,9.182400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<68.510700,-1.535000,9.100700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.510700,-1.535000,26.880700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.671000,-1.535000,26.962400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<68.510700,-1.535000,26.880700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.556800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,21.336000>}
box{<0,0,-0.127000><4.900200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.556800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.556800,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832400,-1.535000,37.846000>}
box{<0,0,-0.127000><0.275600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.556800,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,2.751200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,2.125700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<68.563900,-1.535000,2.751200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,4.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<68.563900,-1.535000,4.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,38.311200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,37.685700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<68.563900,-1.535000,38.311200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.563900,-1.535000,40.428700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,41.054200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<68.563900,-1.535000,40.428700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.595600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,9.144000>}
box{<0,0,-0.127000><4.861400,0.035000,0.127000> rotate<0,0.000000,0> translate<68.595600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.595600,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,26.924000>}
box{<0,0,-0.127000><4.861400,0.035000,0.127000> rotate<0,0.000000,0> translate<68.595600,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,14.299900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,19.403300>}
box{<0,0,-0.127000><5.103400,0.035000,0.127000> rotate<0,90.000000,0> translate<68.656100,-1.535000,19.403300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,14.299900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,14.142600>}
box{<0,0,-0.127000><0.411086,0.035000,0.127000> rotate<0,22.496157,0> translate<68.656100,-1.535000,14.299900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,14.478000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,14.732000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,14.986000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,15.240000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,15.494000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,15.748000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,16.002000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,16.256000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,16.510000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,16.764000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,17.018000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,17.272000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,17.526000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,17.780000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,18.034000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,18.288000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,18.542000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,18.796000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,19.050000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,19.304000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,19.403300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,19.657200>}
box{<0,0,-0.127000><0.359140,0.035000,0.127000> rotate<0,-44.985750,0> translate<68.656100,-1.535000,19.403300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,32.079900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.913200>}
box{<0,0,-0.127000><3.833300,0.035000,0.127000> rotate<0,90.000000,0> translate<68.656100,-1.535000,35.913200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,32.079900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,31.922600>}
box{<0,0,-0.127000><0.411086,0.035000,0.127000> rotate<0,22.496157,0> translate<68.656100,-1.535000,32.079900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,32.258000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,32.512000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,32.766000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,33.020000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,33.274000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,33.528000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,33.782000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,34.036000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,34.290000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,34.544000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,34.798000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,35.052000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,35.306000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,35.560000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,35.814000>}
box{<0,0,-0.127000><4.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.656100,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.656100,-1.535000,35.913200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,36.167200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.656100,-1.535000,35.913200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.671000,-1.535000,9.182400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,9.288100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<68.671000,-1.535000,9.182400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.671000,-1.535000,26.962400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,27.068100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<68.671000,-1.535000,26.962400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.698400,-1.535000,11.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,11.031800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<68.698400,-1.535000,11.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.698400,-1.535000,11.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,11.257300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<68.698400,-1.535000,11.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.698400,-1.535000,28.897500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,28.811800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<68.698400,-1.535000,28.897500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.698400,-1.535000,28.897500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,29.037300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<68.698400,-1.535000,28.897500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.810800,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,19.558000>}
box{<0,0,-0.127000><4.646200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.810800,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.810800,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,21.082000>}
box{<0,0,-0.127000><4.646200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.810800,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.810800,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.018700,-1.535000,37.592000>}
box{<0,0,-0.127000><0.207900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.810800,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.810900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,36.068000>}
box{<0,0,-0.127000><4.646100,0.035000,0.127000> rotate<0,0.000000,0> translate<68.810900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,9.288100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,9.415400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.816500,-1.535000,9.288100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,11.031800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,10.904500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<68.816500,-1.535000,11.031800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,27.068100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,27.195400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.816500,-1.535000,27.068100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.816500,-1.535000,28.811800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,28.684500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<68.816500,-1.535000,28.811800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.839400,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,14.224000>}
box{<0,0,-0.127000><4.617600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.839400,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.839400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,32.004000>}
box{<0,0,-0.127000><4.617600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.839400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.839600,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,11.176000>}
box{<0,0,-0.127000><4.617400,0.035000,0.127000> rotate<0,0.000000,0> translate<68.839600,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.839600,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,28.956000>}
box{<0,0,-0.127000><4.617400,0.035000,0.127000> rotate<0,0.000000,0> translate<68.839600,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,19.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.982700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<68.910100,-1.535000,20.982700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,19.812000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,20.066000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,20.320000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,20.574000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,20.828000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,36.167200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,37.492700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<68.910100,-1.535000,37.492700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,36.322000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,36.576000>}
box{<0,0,-0.127000><4.546900,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.033300,-1.535000,36.830000>}
box{<0,0,-0.127000><1.123200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.593300,-1.535000,37.084000>}
box{<0,0,-0.127000><0.683200,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.910100,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.272700,-1.535000,37.338000>}
box{<0,0,-0.127000><0.362600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.910100,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,2.125700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,1.615000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<68.925000,-1.535000,2.125700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.925000,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,37.685700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,37.175000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<68.925000,-1.535000,37.685700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.925000,-1.535000,41.054200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,41.564900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.925000,-1.535000,41.054200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.926300,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,10.922000>}
box{<0,0,-0.127000><4.530700,0.035000,0.127000> rotate<0,0.000000,0> translate<68.926300,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.926300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,28.702000>}
box{<0,0,-0.127000><4.530700,0.035000,0.127000> rotate<0,0.000000,0> translate<68.926300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.926400,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,9.398000>}
box{<0,0,-0.127000><4.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.926400,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.926400,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,27.178000>}
box{<0,0,-0.127000><4.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<68.926400,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,9.415400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,9.560900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<68.943800,-1.535000,9.415400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,10.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,10.759000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<68.943800,-1.535000,10.904500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,27.195400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,27.340900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<68.943800,-1.535000,27.195400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.943800,-1.535000,28.684500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,28.539000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<68.943800,-1.535000,28.684500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,11.257300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,11.736000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<69.035900,-1.535000,11.257300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,14.142600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,13.663900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<69.035900,-1.535000,14.142600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,29.037300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,29.516000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<69.035900,-1.535000,29.037300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.035900,-1.535000,31.922600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,31.443900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<69.035900,-1.535000,31.922600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,9.560900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,9.721200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<69.049500,-1.535000,9.560900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,10.759000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,10.598700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<69.049500,-1.535000,10.759000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,27.340900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,27.501200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<69.049500,-1.535000,27.340900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.049500,-1.535000,28.539000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,28.378700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<69.049500,-1.535000,28.539000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.095900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,9.652000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.095900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.095900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,10.668000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.095900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.095900,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,27.432000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.095900,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.095900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,28.448000>}
box{<0,0,-0.127000><4.361100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.095900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,9.721200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,9.892300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<69.131200,-1.535000,9.721200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,10.598700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,10.427600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<69.131200,-1.535000,10.598700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,27.501200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,27.672300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<69.131200,-1.535000,27.501200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.131200,-1.535000,28.378700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,28.207600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<69.131200,-1.535000,28.378700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,9.892300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,10.033000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<69.186800,-1.535000,9.892300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,10.427600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,10.286800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<69.186800,-1.535000,10.427600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,27.672300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,27.813000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<69.186800,-1.535000,27.672300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.186800,-1.535000,28.207600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.209000,-1.535000,28.066800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<69.186800,-1.535000,28.207600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.188900,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,9.906000>}
box{<0,0,-0.127000><4.268100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.188900,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.188900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,27.686000>}
box{<0,0,-0.127000><4.268100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.188900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.189000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,10.414000>}
box{<0,0,-0.127000><4.268000,0.035000,0.127000> rotate<0,0.000000,0> translate<69.189000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.189000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,28.194000>}
box{<0,0,-0.127000><4.268000,0.035000,0.127000> rotate<0,0.000000,0> translate<69.189000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.208500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,13.970000>}
box{<0,0,-0.127000><4.248500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.208500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.208500,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,31.750000>}
box{<0,0,-0.127000><4.248500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.208500,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.208600,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,11.430000>}
box{<0,0,-0.127000><4.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<69.208600,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.208600,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,29.210000>}
box{<0,0,-0.127000><4.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<69.208600,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,1.615000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,1.253900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<69.435700,-1.535000,1.615000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<69.435700,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,37.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,36.813900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<69.435700,-1.535000,37.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.435700,-1.535000,41.564900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,41.926000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<69.435700,-1.535000,41.564900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.462500,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,13.716000>}
box{<0,0,-0.127000><3.994500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.462500,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.462500,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,31.496000>}
box{<0,0,-0.127000><3.994500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.462500,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.462600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,11.684000>}
box{<0,0,-0.127000><3.994400,0.035000,0.127000> rotate<0,0.000000,0> translate<69.462600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.462600,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,29.464000>}
box{<0,0,-0.127000><3.994400,0.035000,0.127000> rotate<0,0.000000,0> translate<69.462600,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,11.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,12.361400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<69.514600,-1.535000,11.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,13.663900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,13.038500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<69.514600,-1.535000,13.663900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,29.516000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.141400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<69.514600,-1.535000,29.516000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.514600,-1.535000,31.443900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.818500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<69.514600,-1.535000,31.443900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.598200,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,11.938000>}
box{<0,0,-0.127000><3.858800,0.035000,0.127000> rotate<0,0.000000,0> translate<69.598200,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.598200,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,29.718000>}
box{<0,0,-0.127000><3.858800,0.035000,0.127000> rotate<0,0.000000,0> translate<69.598200,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.598300,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,13.462000>}
box{<0,0,-0.127000><3.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<69.598300,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.598300,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,31.242000>}
box{<0,0,-0.127000><3.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<69.598300,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.703500,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,12.192000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.703500,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.703500,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,13.208000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.703500,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.703500,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,29.972000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.703500,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.703500,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,30.988000>}
box{<0,0,-0.127000><3.753500,0.035000,0.127000> rotate<0,0.000000,0> translate<69.703500,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,12.361400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,13.038500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<69.773700,-1.535000,13.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,12.446000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,12.700000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,12.954000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.141400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.818500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<69.773700,-1.535000,30.818500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,30.226000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,30.480000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.773700,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,30.734000>}
box{<0,0,-0.127000><3.683300,0.035000,0.127000> rotate<0,0.000000,0> translate<69.773700,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,1.253900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.475900,-1.535000,1.142900>}
box{<0,0,-0.127000><0.429298,0.035000,0.127000> rotate<0,14.983731,0> translate<70.061200,-1.535000,1.253900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.758800,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<70.061200,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,36.813900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.758800,-1.535000,36.627000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<70.061200,-1.535000,36.813900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.061200,-1.535000,41.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.438600,-1.535000,42.027000>}
box{<0,0,-0.127000><0.390681,0.035000,0.127000> rotate<0,-14.981442,0> translate<70.061200,-1.535000,41.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.758800,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.481100,-1.535000,6.552900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<70.758800,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.758800,-1.535000,36.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.481100,-1.535000,36.627000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<70.758800,-1.535000,36.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.481100,-1.535000,6.552900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.178700,-1.535000,6.366000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<71.481100,-1.535000,6.552900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.481100,-1.535000,36.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.178700,-1.535000,36.813900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<71.481100,-1.535000,36.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.178700,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.804200,-1.535000,6.004900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<72.178700,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.178700,-1.535000,36.813900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.804200,-1.535000,37.175000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<72.178700,-1.535000,36.813900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.206500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,6.350000>}
box{<0,0,-0.127000><1.250500,0.035000,0.127000> rotate<0,0.000000,0> translate<72.206500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.206500,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,36.830000>}
box{<0,0,-0.127000><1.250500,0.035000,0.127000> rotate<0,0.000000,0> translate<72.206500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.646400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,6.096000>}
box{<0,0,-0.127000><0.810600,0.035000,0.127000> rotate<0,0.000000,0> translate<72.646400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.646500,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.084000>}
box{<0,0,-0.127000><0.810500,0.035000,0.127000> rotate<0,0.000000,0> translate<72.646500,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.804200,-1.535000,6.004900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.314900,-1.535000,5.494200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<72.804200,-1.535000,6.004900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.804200,-1.535000,37.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.314900,-1.535000,37.685700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.804200,-1.535000,37.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.967100,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,5.842000>}
box{<0,0,-0.127000><0.489900,0.035000,0.127000> rotate<0,0.000000,0> translate<72.967100,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.967200,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.338000>}
box{<0,0,-0.127000><0.489800,0.035000,0.127000> rotate<0,0.000000,0> translate<72.967200,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.221100,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,5.588000>}
box{<0,0,-0.127000><0.235900,0.035000,0.127000> rotate<0,0.000000,0> translate<73.221100,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.221200,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.592000>}
box{<0,0,-0.127000><0.235800,0.035000,0.127000> rotate<0,0.000000,0> translate<73.221200,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.314900,-1.535000,5.494200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,5.247800>}
box{<0,0,-0.127000><0.284439,0.035000,0.127000> rotate<0,60.023794,0> translate<73.314900,-1.535000,5.494200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.314900,-1.535000,37.685700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.932100>}
box{<0,0,-0.127000><0.284439,0.035000,0.127000> rotate<0,-60.023794,0> translate<73.314900,-1.535000,37.685700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.407300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,5.334000>}
box{<0,0,-0.127000><0.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<73.407300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.407300,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.846000>}
box{<0,0,-0.127000><0.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<73.407300,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,37.932100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.457000,-1.535000,5.247800>}
box{<0,0,-0.127000><32.684300,0.035000,0.127000> rotate<0,-90.000000,0> translate<73.457000,-1.535000,5.247800> }
texture{col_pol}
}
#end
union{
cylinder{<17.780000,0.038000,29.210000><17.780000,-1.538000,29.210000>0.406400}
cylinder{<17.780000,0.038000,24.130000><17.780000,-1.538000,24.130000>0.406400}
cylinder{<22.860000,0.038000,29.210000><22.860000,-1.538000,29.210000>0.406400}
cylinder{<22.860000,0.038000,24.130000><22.860000,-1.538000,24.130000>0.406400}
cylinder{<20.320000,0.038000,36.830000><20.320000,-1.538000,36.830000>0.406400}
cylinder{<25.400000,0.038000,36.830000><25.400000,-1.538000,36.830000>0.406400}
cylinder{<27.940000,0.038000,29.210000><27.940000,-1.538000,29.210000>0.406400}
cylinder{<27.940000,0.038000,24.130000><27.940000,-1.538000,24.130000>0.406400}
cylinder{<33.020000,0.038000,21.590000><33.020000,-1.538000,21.590000>0.406400}
cylinder{<33.020000,0.038000,16.510000><33.020000,-1.538000,16.510000>0.406400}
cylinder{<33.020000,0.038000,12.700000><33.020000,-1.538000,12.700000>0.406400}
cylinder{<33.020000,0.038000,7.620000><33.020000,-1.538000,7.620000>0.406400}
cylinder{<44.450000,0.038000,36.830000><44.450000,-1.538000,36.830000>0.406400}
cylinder{<44.450000,0.038000,34.290000><44.450000,-1.538000,34.290000>0.406400}
cylinder{<46.990000,0.038000,16.510000><46.990000,-1.538000,16.510000>0.406400}
cylinder{<52.070000,0.038000,16.510000><52.070000,-1.538000,16.510000>0.406400}
cylinder{<62.230000,0.038000,20.320000><62.230000,-1.538000,20.320000>0.406400}
cylinder{<67.310000,0.038000,20.320000><67.310000,-1.538000,20.320000>0.406400}
cylinder{<38.100000,0.038000,26.670000><38.100000,-1.538000,26.670000>0.406400}
cylinder{<38.100000,0.038000,36.830000><38.100000,-1.538000,36.830000>0.406400}
cylinder{<20.320000,0.038000,13.970000><20.320000,-1.538000,13.970000>0.508000}
cylinder{<17.780000,0.038000,13.970000><17.780000,-1.538000,13.970000>0.508000}
cylinder{<67.310000,0.038000,30.480000><67.310000,-1.538000,30.480000>0.508000}
cylinder{<67.310000,0.038000,27.940000><67.310000,-1.538000,27.940000>0.508000}
cylinder{<67.310000,0.038000,12.700000><67.310000,-1.538000,12.700000>0.508000}
cylinder{<67.310000,0.038000,10.160000><67.310000,-1.538000,10.160000>0.508000}
cylinder{<8.890000,0.038000,19.050000><8.890000,-1.538000,19.050000>0.406400}
cylinder{<8.890000,0.038000,34.290000><8.890000,-1.538000,34.290000>0.406400}
cylinder{<46.990000,0.038000,24.130000><46.990000,-1.538000,24.130000>0.406400}
cylinder{<46.990000,0.038000,26.670000><46.990000,-1.538000,26.670000>0.406400}
cylinder{<46.990000,0.038000,21.590000><46.990000,-1.538000,21.590000>0.406400}
cylinder{<58.420000,0.038000,26.670000><58.420000,-1.538000,26.670000>0.406400}
cylinder{<58.420000,0.038000,29.210000><58.420000,-1.538000,29.210000>0.406400}
cylinder{<58.420000,0.038000,24.130000><58.420000,-1.538000,24.130000>0.406400}
cylinder{<26.670000,0.038000,20.320000><26.670000,-1.538000,20.320000>0.406400}
cylinder{<26.670000,0.038000,7.620000><26.670000,-1.538000,7.620000>0.406400}
cylinder{<41.910000,0.038000,16.510000><41.910000,-1.538000,16.510000>0.406400}
cylinder{<41.910000,0.038000,29.210000><41.910000,-1.538000,29.210000>0.406400}
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.406400}
cylinder{<55.880000,0.038000,7.620000><55.880000,-1.538000,7.620000>0.406400}
cylinder{<52.070000,0.038000,36.830000><52.070000,-1.538000,36.830000>0.406400}
cylinder{<52.070000,0.038000,24.130000><52.070000,-1.538000,24.130000>0.406400}
cylinder{<33.020000,0.038000,36.830000><33.020000,-1.538000,36.830000>0.406400}
cylinder{<33.020000,0.038000,24.130000><33.020000,-1.538000,24.130000>0.406400}
cylinder{<67.310000,0.038000,36.830000><67.310000,-1.538000,36.830000>0.406400}
cylinder{<54.610000,0.038000,36.830000><54.610000,-1.538000,36.830000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.415000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.780000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.780000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.780000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.145000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.145000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,28.194000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.415000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.780000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.780000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.780000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.145000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.145000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,25.146000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,30.353000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,23.241000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.002000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,22.987000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,30.099000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.558000,0.000000,30.099000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.304000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.256000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.256000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.304000,0.000000,30.099000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.495000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.860000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.860000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.860000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.225000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.225000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,28.194000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.495000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.860000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.860000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.860000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.225000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.225000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,25.146000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.860000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,30.353000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.336000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,23.241000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.082000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,22.987000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.336000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,30.099000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.638000,0.000000,30.099000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<24.384000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.336000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.336000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<24.384000,0.000000,30.099000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,36.830000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.555200,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,36.195000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.555200,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.555200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,36.830000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.336000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,36.830000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<23.190200,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,36.195000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<23.190200,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,36.830000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<23.190200,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,35.306000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.177000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,35.052000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,38.354000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.543000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,38.608000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,38.608000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.289000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.289000,0.000000,35.306000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<19.431000,0.000000,35.306000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<19.431000,0.000000,38.354000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.575000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.305000,0.000000,26.974800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.305000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,28.194000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.575000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.305000,0.000000,26.339800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.305000,0.000000,26.339800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,26.339800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,25.146000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,30.353000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,23.241000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.162000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,0.000000,22.987000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,30.099000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.718000,0.000000,30.099000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<29.464000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.416000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.416000,0.000000,30.099000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<29.464000,0.000000,30.099000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,19.354800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.020000,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.385000,0.000000,19.354800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.385000,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,20.574000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<33.020000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,18.719800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,18.719800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.020000,0.000000,18.719800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,18.719800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.385000,0.000000,18.719800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.385000,0.000000,18.719800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,18.719800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,17.526000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,22.733000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.496000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,15.621000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.242000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,15.367000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.496000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,22.479000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.798000,0.000000,22.479000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.544000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.496000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.496000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.544000,0.000000,22.479000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.020000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.385000,0.000000,10.464800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.385000,0.000000,10.464800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,10.464800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,11.684000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<33.020000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.655000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<33.020000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.385000,0.000000,9.829800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.385000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,8.636000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,13.843000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.496000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,6.731000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.242000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,6.477000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.496000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,13.589000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.798000,0.000000,13.589000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.544000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.496000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.496000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.544000,0.000000,13.589000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,37.211000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,37.211000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,37.211000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.720000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,36.322000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,36.322000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,35.814000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.180000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,35.814000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,36.322000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.720000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,36.322000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,33.909000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,33.909000> }
difference{
cylinder{<44.450000,0,35.560000><44.450000,0.036000,35.560000>2.870200 translate<0,0.000000,0>}
cylinder{<44.450000,-0.1,35.560000><44.450000,0.135000,35.560000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<44.450000,0.000000,35.052000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.225200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.225200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<49.225200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.225200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.225200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<49.225200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.225200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,16.510000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<48.006000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.860200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.860200,0.000000,16.510000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<49.860200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.860200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.860200,0.000000,15.875000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<49.860200,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.860200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,16.510000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<49.860200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,14.986000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.847000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,14.732000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.101000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,18.034000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.213000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,18.288000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.101000,0.000000,18.288000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.959000,0.000000,18.034000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.959000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.101000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.101000,0.000000,18.034000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.465200,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.465200,0.000000,20.320000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<64.465200,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.465200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.465200,0.000000,19.685000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<64.465200,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.465200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,20.320000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.100200,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.100200,0.000000,20.320000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<65.100200,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.100200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.100200,0.000000,19.685000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<65.100200,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.100200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,20.320000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<65.100200,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,18.796000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.087000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.199000,0.000000,18.542000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.341000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.453000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.453000,0.000000,21.844000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.453000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.199000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,22.098000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.341000,0.000000,22.098000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<68.199000,0.000000,21.844000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<68.199000,0.000000,18.796000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<61.341000,0.000000,18.796000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<61.341000,0.000000,21.844000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<38.100000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<38.100000,0.000000,27.559000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<38.100000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<38.100000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<38.100000,0.000000,35.941000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<38.100000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,30.734000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<37.465000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,30.226000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,30.734000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<38.100000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,31.750000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.750000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.735000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,31.750000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.100000,0.000000,31.750000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.862000,0.000000,29.718000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.862000,0.000000,33.782000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.338000,0.000000,33.782000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.338000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,29.464000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.338000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,34.036000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.338000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,29.718000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.116000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,29.718000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,29.718000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<38.100000,0.000000,33.401000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<38.100000,0.000000,28.511500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<38.100000,0.000000,34.988500>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,16.891000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.780000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,16.891000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,16.891000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.034000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,16.891000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.780000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.050000,0.000000,16.891000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.780000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.590000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.590000,0.000000,16.891000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<21.590000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,16.891000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,11.049000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<16.510000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.050000,0.000000,11.049000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.590000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.590000,0.000000,11.049000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<21.590000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,11.049000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.955000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.955000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,11.049000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<19.685000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,11.049000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.145000,0.000000,11.049000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.764000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,11.049000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,11.684000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<17.145000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,11.684000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,11.049000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<18.415000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,11.049000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,11.684000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<19.685000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.955000,0.000000,11.684000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<19.685000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.955000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.955000,0.000000,11.049000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<20.955000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.955000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.590000,0.000000,11.049000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.955000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,16.891000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<17.780000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,15.875000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.780000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,15.875000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.034000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.320000,0.000000,15.875000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.066000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.320000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.320000,0.000000,16.891000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<20.320000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.780000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,15.367000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<17.780000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,15.875000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<18.034000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,15.367000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.034000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.320000,0.000000,15.875000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<20.066000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.066000,0.000000,15.875000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<20.066000,0.000000,15.875000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.780000,0.000000,13.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.320000,0.000000,13.970000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.770000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,27.940000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.389000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,26.670000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,27.940000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.389000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,27.940000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.389000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,29.210000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.389000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,31.750000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,29.210000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.389000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,26.670000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.310000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,29.210000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,31.750000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.310000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,31.115000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<70.231000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<70.231000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,29.210000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<70.231000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,27.305000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<70.231000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,27.305000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,27.305000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,28.575000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.596000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,28.575000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,29.845000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,31.115000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.596000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,31.115000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,31.750000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,27.940000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,28.194000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.226000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.480000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,30.480000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,28.194000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<65.405000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,28.194000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,30.226000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.913000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.480000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<65.405000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,30.226000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,30.226000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<67.310000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<67.310000,0.000000,30.480000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.770000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,10.160000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.389000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,10.160000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.389000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,10.160000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.389000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,11.430000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.389000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.389000,0.000000,11.430000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.389000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,8.890000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.310000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,11.430000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<67.310000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,13.970000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<67.310000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,13.335000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<70.231000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<70.231000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,11.430000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<70.231000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.231000,0.000000,9.525000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<70.231000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,9.525000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,9.525000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.596000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,10.795000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,12.065000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,13.335000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.596000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.596000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,13.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<70.231000,0.000000,13.970000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<70.231000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,10.160000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.414000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.446000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.700000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.405000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,12.700000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,10.414000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<65.405000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,10.414000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,12.446000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<65.913000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.913000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.700000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<65.405000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.389000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.405000,0.000000,12.446000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,12.446000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<67.310000,0.000000,10.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<67.310000,0.000000,12.700000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,33.274000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,20.066000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.890000,0.000000,20.066000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<8.001000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<9.779000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<9.779000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<8.001000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.001000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.747000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.747000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.033000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.906000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.747000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.874000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.906000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.906000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.747000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.033000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.001000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,30.734000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.890000,0.000000,22.606000>}
box{<0,0,-0.304800><1.651000,0.036000,0.304800> rotate<0,90.000000,0> translate<8.890000,0.000000,22.606000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,30.276800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,23.063200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,32.816800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<8.890000,0.000000,20.523200>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.339000,0.000000,26.225000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.339000,0.000000,22.035000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<45.339000,0.000000,22.035000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<46.990000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,22.994000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,25.266000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,25.266000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<46.989900,0.000000,24.130000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<46.990100,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,25.534000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,26.794000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,26.794000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<46.990100,0.000000,24.130500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,25.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,25.534000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,25.534000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<46.990100,0.000000,24.130000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<46.989900,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,21.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,22.726000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,22.726000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,22.726000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,22.994000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,22.994000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<46.990100,0.000000,24.129500>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.769000,0.000000,28.765000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.769000,0.000000,24.575000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,-90.000000,0> translate<56.769000,0.000000,24.575000> }
object{ARC(2.667000,0.127000,295.208327,424.791673,0.036000) translate<58.420000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,25.534000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,27.806000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.293000,0.000000,27.806000> }
object{ARC(2.667000,0.127000,64.789729,92.727231,0.036000) translate<58.419900,0.000000,26.670000>}
object{ARC(2.667000,0.127000,92.731522,115.210271,0.036000) translate<58.420100,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,28.074000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,29.334000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.293000,0.000000,29.334000> }
object{ARC(2.667000,0.127000,115.210271,128.248808,0.036000) translate<58.420100,0.000000,26.670500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,27.806000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,28.074000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.293000,0.000000,28.074000> }
object{ARC(2.667000,0.127000,244.789729,267.268478,0.036000) translate<58.420100,0.000000,26.670000>}
object{ARC(2.667000,0.127000,267.272769,295.210271,0.036000) translate<58.419900,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,24.006000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,25.266000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.293000,0.000000,25.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,25.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.293000,0.000000,25.534000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.293000,0.000000,25.534000> }
object{ARC(2.667000,0.127000,231.751192,245.360649,0.036000) translate<58.420100,0.000000,26.669500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,8.636000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<26.670000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,19.304000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,19.304000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.559000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.781000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.781000,0.000000,11.049000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.559000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,17.145000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,16.510000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.813000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,16.510000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.686000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,16.510000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,16.510000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.527000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.686000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,16.383000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.686000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.527000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,16.383000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.654000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,11.430000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.813000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,11.430000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.527000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,10.795000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,9.906000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<26.670000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.670000,0.000000,18.034000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<26.670000,0.000000,18.034000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<26.670000,0.000000,10.363200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<26.670000,0.000000,17.576800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<26.670000,0.000000,9.093200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<26.670000,0.000000,18.846800>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,28.194000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,17.526000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.910000,0.000000,17.526000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.021000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.799000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.799000,0.000000,25.781000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.021000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.053000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.926000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,20.447000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.894000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.926000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,20.447000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.926000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.767000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.053000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,26.924000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,18.796000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.910000,0.000000,18.796000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,26.466800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,19.253200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,27.736800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,17.983200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,8.636000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<55.880000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,19.304000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<55.880000,0.000000,19.304000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<56.769000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<54.991000,0.000000,16.891000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<54.991000,0.000000,11.049000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<56.769000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,17.145000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.991000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,16.510000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.023000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.896000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,16.510000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.896000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,16.510000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.737000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,16.510000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<54.737000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.896000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<56.896000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.896000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.896000,0.000000,16.383000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.896000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.737000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,16.383000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.864000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,11.430000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.023000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.737000,0.000000,11.430000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.737000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,10.795000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.991000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,9.906000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<55.880000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.880000,0.000000,18.034000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<55.880000,0.000000,18.034000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.880000,0.000000,10.363200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.880000,0.000000,17.576800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.880000,0.000000,9.093200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<55.880000,0.000000,18.846800>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,25.146000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.070000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,35.814000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,0.000000,35.814000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.959000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.181000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.181000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.959000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,33.655000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.213000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.086000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.927000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.927000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.086000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.086000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.927000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.054000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.213000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.927000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,26.416000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.070000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,34.544000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,0.000000,34.544000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<52.070000,0.000000,26.873200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<52.070000,0.000000,34.086800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<52.070000,0.000000,25.603200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<52.070000,0.000000,35.356800>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,25.146000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,35.814000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.020000,0.000000,35.814000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.909000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.131000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.131000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.909000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,33.655000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.163000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.036000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.877000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.877000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.036000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.036000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.877000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.004000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.163000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.877000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,26.416000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,34.544000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.020000,0.000000,34.544000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,26.873200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,34.086800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,25.603200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,35.356800>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.626000,0.000000,36.830000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<54.610000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.310000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<66.294000,0.000000,36.830000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<66.294000,0.000000,36.830000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<63.881000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<63.881000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<58.039000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<58.039000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,35.941000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.135000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.881000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.373000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.881000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.373000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.420000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,35.814000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.547000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<58.420000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.547000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,37.846000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.547000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.039000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.039000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,35.941000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.785000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.515000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.896000,0.000000,36.830000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<56.515000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.405000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.024000,0.000000,36.830000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<65.024000,0.000000,36.830000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<57.353200,0.000000,36.830000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<64.566800,0.000000,36.830000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<56.083200,0.000000,36.830000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<65.836800,0.000000,36.830000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  VFO(-37.935000,0,-21.585000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
