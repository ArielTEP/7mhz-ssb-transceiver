//POVRay-File created by 3d41.ulp v1.05
//D:/Projects/7MHz_SSB_Transceiver/RX_Mixer_Balanced_Modulator/RX_Mixer_Balanced_Modulator.brd
//2010. 04. 14. 18:58:32

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
#local cam_y = 220;
#local cam_z = -113;
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

#local lgt1_pos_x = 26;
#local lgt1_pos_y = 39;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.748539;
#local lgt2_pos_x = -26;
#local lgt2_pos_y = 39;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.748539;
#local lgt3_pos_x = 26;
#local lgt3_pos_y = 39;
#local lgt3_pos_z = -17;
#local lgt3_intense = 0.748539;
#local lgt4_pos_x = -26;
#local lgt4_pos_y = 39;
#local lgt4_pos_z = -17;
#local lgt4_intense = 0.748539;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 68.850000;
#declare pcb_y_size = 49.350000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(61);
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
	//translate<-34.425000,0,-24.675000>
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


#macro RX_MIXER_BALANCED_MODULATOR(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><68.850000,0.000000>
<68.850000,0.000000><68.850000,49.350000>
<68.850000,49.350000><0.000000,49.350000>
<0.000000,49.350000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.000000,1,46.400000><3.000000,-5,46.400000>1.600000 texture{col_hls}}
cylinder{<65.800000,1,46.400000><65.800000,-5,46.400000>1.600000 texture{col_hls}}
cylinder{<3.000000,1,3.000000><3.000000,-5,3.000000>1.600000 texture{col_hls}}
cylinder{<65.800000,1,3.000000><65.800000,-5,3.000000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.380000,0.000000,39.200000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C1 10uF 35V E2,5-6
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("220pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.240000,0.000000,26.500000>}#end		//ceramic disc capacitator C2 220pF C050-035X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.160000,0.000000,39.100000>}#end		//ceramic disc capacitator C3 0.1uF C050-035X075
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.01uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.940000,0.000000,17.610000>}#end		//ceramic disc capacitator C4 0.01uF C050-035X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.190000,0.000000,16.340000>}#end		//ceramic disc capacitator C5 0.1uF C050-035X075
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.270000,0.000000,16.340000>}#end		//ceramic disc capacitator C6 0.1uF C050-035X075
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uF 35V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<27.270000,0.000000,8.420000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C7 10uF 35V E2,5-6
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.380000,0.000000,8.720000>}#end		//ceramic disc capacitator C8 0.1uF C050-035X075
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_CERAMIC_50MM_76MM("470pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<60.290000,0.000000,37.930000>}#end		//ceramic disc capacitator C9 470pF C050-035X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.220000,0.000000,21.420000>}#end		//Diode DO35 10mm hor. D1 1N4148 DO35-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP14("MC1496","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.970000,0.000000,22.690000>}#end		//DIP14 IC1 MC1496 MC1496
#ifndef(pack_J1) #declare global_pack_J1=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.250000,0.000000,9.980000>}#end		//Molex 53047 J1  6410-02
#ifndef(pack_J2) #declare global_pack_J2=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.990000,0.000000,40.450000>}#end		//Molex 53047 J2  6410-02
#ifndef(pack_J3) #declare global_pack_J3=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<61.550000,0.000000,19.040000>}#end		//Molex 53047 J3  6410-02
#ifndef(pack_J4) #declare global_pack_J4=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<55.270000,0.000000,9.950000>}#end		//Molex 53047 J4  6410-02
#ifndef(pack_J5) #declare global_pack_J5=yes; object {MOLEX_PSL2G()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<61.550000,0.000000,27.700000>}#end		//Molex 53047 J5  6410-02
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Blue}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.110000,0.000000,26.500000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 5k6 0207/10
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{Gray45}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<11.300000,0.000000,31.580000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 820E 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.110000,0.000000,17.610000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 1k 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<25.070000,0.000000,31.580000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 1k 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_10MM(texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.860000,0.000000,15.070000>}#end		//Discrete Resistor 0,3W 10MM Grid R5 51E 0207/10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.270000,0.000000,22.690000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 1k 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.300000,0.000000,17.610000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 1k2 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.990000,0.000000,30.330000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 1k 0207/10
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.350000,0.000000,13.800000>}#end		//Discrete Resistor 0,3W 10MM Grid R9 10k 0207/10
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.970000,0.000000,9.990000>}#end		//Discrete Resistor 0,3W 10MM Grid R10 100e 0207/10
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.400000,0.000000,39.200000>}#end		//Discrete Resistor 0,3W 10MM Grid R11 1k 0207/10
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<17.380000,0,37.930000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.380000,0,40.470000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.700000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<29.780000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.620000,0,39.100000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.700000,0,39.100000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.940000,0,15.070000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.940000,0,20.150000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.190000,0,18.880000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.190000,0,13.800000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.270000,0,18.880000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.270000,0,13.800000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<27.270000,0,7.150000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.270000,0,9.690000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.840000,0,8.720000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.920000,0,8.720000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.290000,0,35.390000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.290000,0,40.470000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<8.220000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<8.220000,0,16.340000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,30.310000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,27.770000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,25.230000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,20.150000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,17.610000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<36.160000,0,15.070000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,15.070000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,17.610000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,20.150000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,25.230000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,27.770000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.780000,0,30.310000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.250000,0,11.250000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.250000,0,8.710000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.260000,0,40.450000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.720000,0,40.450000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<61.550000,0,17.770000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<61.550000,0,20.310000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<54.000000,0,9.950000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<56.540000,0,9.950000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<61.550000,0,26.430000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<61.550000,0,28.970000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<30.180000,0,35.390000> texture{col_thl}}
#ifndef(global_pack_L1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<22.560000,0,43.010000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<56.480000,0,34.120000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<48.860000,0,29.040000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<56.480000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<48.860000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<56.480000,0,29.040000> texture{col_thl}}
#ifndef(global_pack_L2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<48.860000,0,23.960000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<22.190000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.030000,0,26.500000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.380000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.220000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.110000,0,12.530000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.110000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.990000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.150000,0,31.580000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.860000,0,20.150000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<48.860000,0,9.990000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<22.190000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<32.350000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.300000,0,22.690000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.300000,0,12.530000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.990000,0,35.410000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.990000,0,25.250000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.350000,0,18.880000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.350000,0,8.720000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<34.890000,0,9.990000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.050000,0,9.990000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<46.320000,0,39.200000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<56.480000,0,39.200000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<51.700000,0,36.850000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<51.700000,0,29.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,0,0) translate<51.700000,0,36.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<46.700000,0,22.550000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<46.700000,0,32.650000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<22.200000,0,28.950000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<10.400000,0,28.950000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<53.800000,0,34.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.600000,1,16,1,0) translate<53.800000,0,29.100000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,7.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,22.650000>}
box{<0,0,-0.304800><15.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,22.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,22.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,24.150000>}
box{<0,0,-0.304800><1.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,24.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,24.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,25.700000>}
box{<0,0,-0.304800><1.550000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,25.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,25.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,29.750000>}
box{<0,0,-0.304800><4.050000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,29.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,29.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,31.600000>}
box{<0,0,-0.304800><1.850000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,31.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,31.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,37.380000>}
box{<0,0,-0.304800><5.780000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.900000,-1.535000,37.380000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,31.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.920000,-1.535000,31.580000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<4.900000,-1.535000,31.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,22.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.940000,-1.535000,22.690000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,-44.997030,0> translate<4.900000,-1.535000,22.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.920000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.220000,-1.535000,31.580000>}
box{<0,0,-0.304800><1.300000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.920000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,37.380000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.620000,-1.535000,39.100000>}
box{<0,0,-0.304800><2.432447,0.035000,0.304800> rotate<0,-44.997030,0> translate<4.900000,-1.535000,37.380000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.900000,-1.535000,7.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.150000,-1.535000,4.950000>}
box{<0,0,-0.304800><3.253460,0.035000,0.304800> rotate<0,46.242312,0> translate<4.900000,-1.535000,7.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.200000,-1.535000,26.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.200000,-1.535000,28.150000>}
box{<0,0,-0.304800><1.630000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.200000,-1.535000,28.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.200000,-1.535000,26.520000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.220000,-1.535000,26.500000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<8.200000,-1.535000,26.520000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.220000,-1.535000,16.340000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.250000,-1.535000,16.340000>}
box{<0,0,-0.203200><0.030000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.220000,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.250000,-1.535000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.250000,-1.535000,16.340000>}
box{<0,0,-0.304800><5.090000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.250000,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.940000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.460000,-1.535000,22.690000>}
box{<0,0,-0.304800><3.520000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.940000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.200000,-1.535000,28.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.000000,-1.535000,28.950000>}
box{<0,0,-0.304800><1.131371,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.200000,-1.535000,28.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.000000,-1.535000,28.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,-1.535000,28.950000>}
box{<0,0,-0.304800><1.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.000000,-1.535000,28.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.220000,-1.535000,8.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.100000,-1.535000,9.600000>}
box{<0,0,-0.304800><1.244508,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.220000,-1.535000,8.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.100000,-1.535000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.100000,-1.535000,14.600000>}
box{<0,0,-0.304800><5.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.100000,-1.535000,14.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.100000,-1.535000,14.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300000,-1.535000,15.800000>}
box{<0,0,-0.304800><1.697056,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.100000,-1.535000,14.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.700000,-1.535000,39.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,39.100000>}
box{<0,0,-0.304800><1.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.700000,-1.535000,39.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,8.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,12.530000>}
box{<0,0,-0.304800><4.030000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.300000,-1.535000,12.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.460000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,22.690000>}
box{<0,0,-0.304800><4.840000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.460000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.030000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,26.500000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.030000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,34.650000>}
box{<0,0,-0.304800><8.150000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.300000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,39.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,38.500000>}
box{<0,0,-0.304800><0.848528,0.035000,0.304800> rotate<0,44.997030,0> translate<12.700000,-1.535000,39.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,38.500000>}
box{<0,0,-0.304800><3.850000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.300000,-1.535000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,8.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.900000,-1.535000,7.900000>}
box{<0,0,-0.304800><0.848528,0.035000,0.304800> rotate<0,44.997030,0> translate<13.300000,-1.535000,8.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.900000,-1.535000,26.500000>}
box{<0,0,-0.304800><0.600000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.300000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.900000,-1.535000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,-1.535000,7.100000>}
box{<0,0,-0.304800><1.131371,0.035000,0.304800> rotate<0,44.997030,0> translate<13.900000,-1.535000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.198300,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.198300,-1.535000,15.701700>}
box{<0,0,-0.304800><0.098300,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.198300,-1.535000,15.701700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300000,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.198300,-1.535000,15.800000>}
box{<0,0,-0.304800><2.898300,0.035000,0.304800> rotate<0,0.000000,0> translate<12.300000,-1.535000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.198300,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,15.806700>}
box{<0,0,-0.304800><0.009475,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.198300,-1.535000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,15.806700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,24.696700>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.205000,-1.535000,24.696700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.900000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,25.195000>}
box{<0,0,-0.304800><1.845549,0.035000,0.304800> rotate<0,44.997030,0> translate<13.900000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,24.696700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.205000,-1.535000,25.195000>}
box{<0,0,-0.304800><0.498300,0.035000,0.304800> rotate<0,90.000000,0> translate<15.205000,-1.535000,25.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.700000,-1.535000,7.100000>}
box{<0,0,-0.304800><1.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.700000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.840000,-1.535000,7.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.840000,-1.535000,8.720000>}
box{<0,0,-0.304800><1.360000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.840000,-1.535000,8.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.700000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,7.100000>}
box{<0,0,-0.304800><0.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.700000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.840000,-1.535000,7.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,7.100000>}
box{<0,0,-0.304800><0.367696,0.035000,0.304800> rotate<0,44.997030,0> translate<15.840000,-1.535000,7.360000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.198300,-1.535000,15.701700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.100000,-1.535000,13.800000>}
box{<0,0,-0.304800><2.689410,0.035000,0.304800> rotate<0,44.997030,0> translate<15.198300,-1.535000,15.701700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.110000,-1.535000,13.790000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.110000,-1.535000,12.530000>}
box{<0,0,-0.304800><1.260000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.110000,-1.535000,12.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.100000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.110000,-1.535000,13.790000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<17.100000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.380000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.400000,-1.535000,40.490000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.380000,-1.535000,40.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.400000,-1.535000,40.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.400000,-1.535000,41.800000>}
box{<0,0,-0.304800><1.310000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.400000,-1.535000,41.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.450000,-1.535000,34.650000>}
box{<0,0,-0.304800><4.150000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.300000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.450000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.850000,-1.535000,34.650000>}
box{<0,0,-0.304800><0.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.450000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.110000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,22.690000>}
box{<0,0,-0.304800><1.340000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.110000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.380000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,31.580000>}
box{<0,0,-0.304800><2.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.380000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,31.580000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,90.000000,0> translate<18.450000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.400000,-1.535000,41.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.610000,-1.535000,43.010000>}
box{<0,0,-0.304800><1.711198,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.400000,-1.535000,41.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.990000,-1.535000,31.580000>}
box{<0,0,-0.304800><1.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.450000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.990000,-1.535000,31.580000>}
box{<0,0,-0.304800><1.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.450000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.100000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.800000>}
box{<0,0,-0.304800><3.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.100000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.920000,-1.535000,13.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.920000,-1.535000,8.720000>}
box{<0,0,-0.304800><5.060000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.920000,-1.535000,8.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.920000,-1.535000,13.780000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<20.900000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.850000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.750000,-1.535000,34.650000>}
box{<0,0,-0.304800><3.900000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.850000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.900000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,13.800000>}
box{<0,0,-0.304800><1.290000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.900000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,18.880000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.190000,-1.535000,18.880000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.450000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,22.690000>}
box{<0,0,-0.304800><3.740000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.450000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,28.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,26.500000>}
box{<0,0,-0.304800><2.440000,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.190000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,0.000000,28.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.200000,0.000000,28.950000>}
box{<0,0,-0.304800><11.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.400000,0.000000,28.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,28.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.200000,-1.535000,28.950000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.190000,-1.535000,28.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.610000,-1.535000,43.010000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.560000,-1.535000,43.010000>}
box{<0,0,-0.304800><3.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.610000,-1.535000,43.010000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.380000,-1.535000,37.930000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.680000,-1.535000,37.930000>}
box{<0,0,-0.304800><5.300000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.380000,-1.535000,37.930000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.750000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.250000,-1.535000,34.650000>}
box{<0,0,-0.304800><1.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.750000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.600000,-1.535000,26.500000>}
box{<0,0,-0.304800><2.410000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.190000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.600000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.700000,-1.535000,26.500000>}
box{<0,0,-0.304800><0.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.600000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.680000,-1.535000,37.930000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,40.550000>}
box{<0,0,-0.304800><3.705240,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.680000,-1.535000,37.930000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.250000,-1.535000,34.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.800000,-1.535000,37.200000>}
box{<0,0,-0.304800><3.606245,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.250000,-1.535000,34.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.800000,-1.535000,37.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.250000,-1.535000,37.650000>}
box{<0,0,-0.304800><0.636396,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.800000,-1.535000,37.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.200000,-1.535000,7.100000>}
box{<0,0,-0.304800><11.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.100000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.200000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,7.150000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.200000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,18.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,20.800000>}
box{<0,0,-0.304800><1.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.250000,-1.535000,20.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,7.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.270000,-1.535000,7.150000>}
box{<0,0,-0.304800><0.020000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.250000,-1.535000,7.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.270000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.270000,-1.535000,9.690000>}
box{<0,0,-0.304800><4.110000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.270000,-1.535000,9.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.190000,-1.535000,13.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.270000,-1.535000,13.800000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.190000,-1.535000,13.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,18.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.270000,-1.535000,18.880000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<27.250000,-1.535000,18.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.250000,-1.535000,20.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.140000,-1.535000,22.690000>}
box{<0,0,-0.304800><2.672864,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.250000,-1.535000,20.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.150000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.180000,-1.535000,31.610000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.150000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.180000,-1.535000,31.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.180000,-1.535000,35.390000>}
box{<0,0,-0.304800><3.780000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.180000,-1.535000,35.390000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.780000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.420000,-1.535000,28.240000>}
box{<0,0,-0.304800><2.391067,0.035000,0.304800> rotate<0,-46.691565,0> translate<29.780000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.150000,-1.535000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.420000,-1.535000,30.310000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<30.150000,-1.535000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.420000,-1.535000,28.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.420000,-1.535000,30.310000>}
box{<0,0,-0.304800><2.070000,0.035000,0.304800> rotate<0,90.000000,0> translate<31.420000,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,7.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,8.720000>}
box{<0,0,-0.304800><1.570000,0.035000,0.304800> rotate<0,90.000000,0> translate<32.350000,-1.535000,8.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.140000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,22.690000>}
box{<0,0,-0.304800><3.210000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.140000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.200000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.400000,-1.535000,7.100000>}
box{<0,0,-0.304800><5.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.200000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,7.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.400000,-1.535000,7.100000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,44.997030,0> translate<32.350000,-1.535000,7.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,18.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.620000,-1.535000,20.150000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.350000,-1.535000,18.880000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.400000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,7.100000>}
box{<0,0,-0.304800><2.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.400000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.890000,-1.535000,9.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,9.980000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<34.890000,-1.535000,9.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,9.980000>}
box{<0,0,-0.304800><2.880000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.900000,-1.535000,9.980000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.900000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.100000,-1.535000,7.100000>}
box{<0,0,-0.304800><1.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.900000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.990000,-1.535000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.140000,-1.535000,25.250000>}
box{<0,0,-0.304800><3.150000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.990000,-1.535000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.620000,-1.535000,20.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,20.150000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.620000,-1.535000,20.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.350000,-1.535000,22.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,22.690000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.350000,-1.535000,22.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.140000,-1.535000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,25.230000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<36.140000,-1.535000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.420000,-1.535000,30.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,30.310000>}
box{<0,0,-0.304800><4.740000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.420000,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,27.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.190000,-1.535000,27.800000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.160000,-1.535000,27.770000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.150000,-1.535000,4.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.500000,-1.535000,4.950000>}
box{<0,0,-0.304800><29.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.150000,-1.535000,4.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.990000,-1.535000,35.410000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.790000,-1.535000,35.410000>}
box{<0,0,-0.304800><3.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.990000,-1.535000,35.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.190000,-1.535000,27.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.900000,-1.535000,27.800000>}
box{<0,0,-0.304800><1.710000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.190000,-1.535000,27.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.900000,-1.535000,27.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,28.300000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.900000,-1.535000,27.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.790000,-1.535000,35.410000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,33.800000>}
box{<0,0,-0.304800><2.276884,0.035000,0.304800> rotate<0,44.997030,0> translate<36.790000,-1.535000,35.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,28.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,33.800000>}
box{<0,0,-0.304800><5.500000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.400000,-1.535000,33.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.300000,-1.535000,40.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.620000,-1.535000,40.550000>}
box{<0,0,-0.304800><13.320000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.300000,-1.535000,40.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.250000,-1.535000,37.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.000000,-1.535000,37.650000>}
box{<0,0,-0.304800><12.750000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.250000,-1.535000,37.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.160000,-1.535000,17.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.210000,-1.535000,17.610000>}
box{<0,0,-0.304800><3.050000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.160000,-1.535000,17.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.210000,-1.535000,17.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.100000,-1.535000,18.500000>}
box{<0,0,-0.304800><1.258650,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.210000,-1.535000,17.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.100000,-1.535000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.100000,-1.535000,32.700000>}
box{<0,0,-0.304800><14.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.100000,-1.535000,32.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.000000,-1.535000,37.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.450000,-1.535000,37.650000>}
box{<0,0,-0.304800><1.450000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.000000,-1.535000,37.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.450000,-1.535000,37.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.300000,-1.535000,38.500000>}
box{<0,0,-0.304800><1.202082,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.450000,-1.535000,37.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.300000,-1.535000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.300000,-1.535000,40.410000>}
box{<0,0,-0.304800><1.910000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.300000,-1.535000,40.410000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.100000,-1.535000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,12.600000>}
box{<0,0,-0.304800><7.778175,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.100000,-1.535000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,12.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,29.600000>}
box{<0,0,-0.304800><17.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.600000,-1.535000,29.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,29.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,31.200000>}
box{<0,0,-0.304800><1.600000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.600000,-1.535000,31.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.100000,-1.535000,32.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.200000,-1.535000,34.800000>}
box{<0,0,-0.304800><2.969848,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.100000,-1.535000,32.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.600000,-1.535000,31.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.050000,-1.535000,32.650000>}
box{<0,0,-0.304800><2.050610,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.600000,-1.535000,31.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.500000,-1.535000,4.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,12.280000>}
box{<0,0,-0.304800><10.330891,0.035000,0.304800> rotate<0,-45.193101,0> translate<36.500000,-1.535000,4.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,12.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,15.070000>}
box{<0,0,-0.304800><2.790000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.780000,-1.535000,15.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,25.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.810000,-1.535000,25.200000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,44.997030,0> translate<43.780000,-1.535000,25.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,15.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.850000,-1.535000,15.000000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,44.997030,0> translate<43.780000,-1.535000,15.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.810000,-1.535000,25.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.900000,-1.535000,25.200000>}
box{<0,0,-0.304800><2.090000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.810000,-1.535000,25.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.300000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.300000,-1.535000,39.220000>}
box{<0,0,-0.304800><1.250000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.300000,-1.535000,39.220000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.300000,-1.535000,39.220000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.320000,-1.535000,39.200000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<46.300000,-1.535000,39.220000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,12.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.570000,-1.535000,12.280000>}
box{<0,0,-0.304800><2.790000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.780000,-1.535000,12.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.700000,0.000000,32.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.700000,0.000000,22.550000>}
box{<0,0,-0.304800><10.100000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.700000,0.000000,22.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.050000,-1.535000,32.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.700000,-1.535000,32.650000>}
box{<0,0,-0.304800><3.650000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.050000,-1.535000,32.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.900000,-1.535000,25.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.200000,-1.535000,26.500000>}
box{<0,0,-0.304800><1.838478,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.900000,-1.535000,25.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.050000,-1.535000,9.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.240000,-1.535000,7.800000>}
box{<0,0,-0.304800><3.097128,0.035000,0.304800> rotate<0,44.997030,0> translate<45.050000,-1.535000,9.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.700000,-1.535000,22.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.450000,-1.535000,22.550000>}
box{<0,0,-0.304800><0.750000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.700000,-1.535000,22.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,30.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.590000,-1.535000,30.310000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.780000,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.200000,-1.535000,34.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.700000,-1.535000,34.800000>}
box{<0,0,-0.304800><5.500000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.200000,-1.535000,34.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.570000,-1.535000,12.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,9.990000>}
box{<0,0,-0.304800><3.238549,0.035000,0.304800> rotate<0,44.997030,0> translate<46.570000,-1.535000,12.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.780000,-1.535000,20.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,20.150000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.780000,-1.535000,20.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.450000,-1.535000,22.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,23.960000>}
box{<0,0,-0.304800><1.994041,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.450000,-1.535000,22.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.200000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,26.500000>}
box{<0,0,-0.304800><1.660000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.200000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.590000,-1.535000,30.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,29.040000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<47.590000,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.240000,-1.535000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.000000,-1.535000,7.800000>}
box{<0,0,-0.304800><1.760000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.240000,-1.535000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.300000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.930000,-1.535000,40.470000>}
box{<0,0,-0.304800><3.630000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.300000,-1.535000,40.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,29.040000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.350000,-1.535000,27.550000>}
box{<0,0,-0.304800><2.107178,0.035000,0.304800> rotate<0,44.997030,0> translate<48.860000,-1.535000,29.040000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.930000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.400000,-1.535000,40.000000>}
box{<0,0,-0.304800><0.664680,0.035000,0.304800> rotate<0,44.997030,0> translate<49.930000,-1.535000,40.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.350000,-1.535000,27.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.400000,-1.535000,26.500000>}
box{<0,0,-0.304800><1.484924,0.035000,0.304800> rotate<0,44.997030,0> translate<50.350000,-1.535000,27.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.400000,-1.535000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.650000,-1.535000,38.750000>}
box{<0,0,-0.304800><1.767767,0.035000,0.304800> rotate<0,44.997030,0> translate<50.400000,-1.535000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.650000,-1.535000,36.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.650000,-1.535000,38.750000>}
box{<0,0,-0.304800><1.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.650000,-1.535000,38.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.350000,-1.535000,27.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,28.900000>}
box{<0,0,-0.304800><1.909188,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.350000,-1.535000,27.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,28.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,29.050000>}
box{<0,0,-0.304800><0.150000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.700000,-1.535000,29.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.650000,-1.535000,36.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,36.800000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,44.997030,0> translate<51.650000,-1.535000,36.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,0.000000,36.800000>}
box{<0,0,-0.304800><7.750000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.700000,0.000000,36.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,36.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.700000,-1.535000,36.850000>}
box{<0,0,-0.304800><0.050000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.700000,-1.535000,36.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.000000,-1.535000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.750000,-1.535000,7.800000>}
box{<0,0,-0.304800><2.750000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.000000,-1.535000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.750000,-1.535000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.850000,-1.535000,7.800000>}
box{<0,0,-0.304800><0.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.750000,-1.535000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800000,0.000000,34.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800000,0.000000,29.100000>}
box{<0,0,-0.304800><5.700000,0.035000,0.304800> rotate<0,-90.000000,0> translate<53.800000,0.000000,29.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.700000,-1.535000,34.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800000,-1.535000,34.800000>}
box{<0,0,-0.304800><6.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.700000,-1.535000,34.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.860000,-1.535000,20.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.940000,-1.535000,20.150000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.860000,-1.535000,20.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.850000,-1.535000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.000000,-1.535000,9.950000>}
box{<0,0,-0.304800><3.040559,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.850000,-1.535000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.700000,-1.535000,32.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.410000,-1.535000,32.650000>}
box{<0,0,-0.304800><8.710000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.700000,-1.535000,32.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.800000,-1.535000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.420000,-1.535000,29.100000>}
box{<0,0,-0.304800><2.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.800000,-1.535000,29.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.420000,-1.535000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.480000,-1.535000,29.040000>}
box{<0,0,-0.304800><0.084853,0.035000,0.304800> rotate<0,44.997030,0> translate<56.420000,-1.535000,29.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.410000,-1.535000,32.650000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.480000,-1.535000,31.580000>}
box{<0,0,-0.304800><1.513209,0.035000,0.304800> rotate<0,44.997030,0> translate<55.410000,-1.535000,32.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.480000,-1.535000,39.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.750000,-1.535000,40.470000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<56.480000,-1.535000,39.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.480000,-1.535000,34.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.020000,-1.535000,34.120000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.480000,-1.535000,34.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.940000,-1.535000,15.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.180000,-1.535000,20.310000>}
box{<0,0,-0.304800><7.410479,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.940000,-1.535000,15.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.020000,-1.535000,34.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.290000,-1.535000,35.390000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.020000,-1.535000,34.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.750000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.290000,-1.535000,40.470000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.750000,-1.535000,40.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.290000,-1.535000,40.470000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.320000,-1.535000,40.500000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<60.290000,-1.535000,40.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.180000,-1.535000,20.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.550000,-1.535000,20.310000>}
box{<0,0,-0.304800><2.370000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.180000,-1.535000,20.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.320000,-1.535000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.600000,-1.535000,40.500000>}
box{<0,0,-0.304800><2.280000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.320000,-1.535000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.550000,-1.535000,28.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.370000,-1.535000,28.970000>}
box{<0,0,-0.304800><1.820000,0.035000,0.304800> rotate<0,0.000000,0> translate<61.550000,-1.535000,28.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.370000,-1.535000,28.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.440000,-1.535000,29.040000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,-44.997030,0> translate<63.370000,-1.535000,28.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.440000,-1.535000,29.040000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.300000,-1.535000,29.900000>}
box{<0,0,-0.304800><1.216224,0.035000,0.304800> rotate<0,-44.997030,0> translate<63.440000,-1.535000,29.040000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.600000,-1.535000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.300000,-1.535000,38.800000>}
box{<0,0,-0.304800><2.404163,0.035000,0.304800> rotate<0,44.997030,0> translate<62.600000,-1.535000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.300000,-1.535000,29.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.300000,-1.535000,38.800000>}
box{<0,0,-0.304800><8.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<64.300000,-1.535000,38.800000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,44.377900>}
box{<0,0,-0.127000><39.355900,0.035000,0.127000> rotate<0,90.000000,0> translate<1.142900,-1.535000,44.377900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.315700,-1.535000,5.194900>}
box{<0,0,-0.127000><0.244447,0.035000,0.127000> rotate<0,-45.013603,0> translate<1.142900,-1.535000,5.022000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.200900,-1.535000,5.080000>}
box{<0,0,-0.127000><0.058000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.556700,-1.535000,5.334000>}
box{<0,0,-0.127000><0.413800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.060700,-1.535000,5.588000>}
box{<0,0,-0.127000><0.917800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.572800,-1.535000,5.842000>}
box{<0,0,-0.127000><3.429900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.329600,-1.535000,6.096000>}
box{<0,0,-0.127000><3.186700,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.086400,-1.535000,6.350000>}
box{<0,0,-0.127000><2.943500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.841100,-1.535000,6.604000>}
box{<0,0,-0.127000><2.698200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.735900,-1.535000,6.858000>}
box{<0,0,-0.127000><2.593000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.651100,-1.535000,7.112000>}
box{<0,0,-0.127000><2.508200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.366000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.620000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.874000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,8.128000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,8.382000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,8.636000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,8.890000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,9.144000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,9.398000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,9.652000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,9.906000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,10.160000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,10.414000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,10.668000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,10.922000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,11.176000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,11.430000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,11.684000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,11.938000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,12.192000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,12.446000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,12.700000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,12.954000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,13.208000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,13.462000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,13.716000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,13.970000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,14.224000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,14.478000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,14.732000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,14.986000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,15.240000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,15.494000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,15.748000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,16.002000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,16.256000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,16.510000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,16.764000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,17.018000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,17.272000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,17.526000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,17.780000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,18.034000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,18.288000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,18.542000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,18.796000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,19.050000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,19.304000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,19.558000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,19.812000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,20.066000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,20.320000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,20.574000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,20.828000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,21.082000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,21.336000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,21.590000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,21.844000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.098000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.352000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.606000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.860000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.114000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.368000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.622000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.876000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,24.130000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,24.384000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,24.638000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,24.892000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.146000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.400000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.654000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.908000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,26.162000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,26.416000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,26.670000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,26.924000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,27.178000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,27.432000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,27.686000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,27.940000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,28.194000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,28.448000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,28.702000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,28.956000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.210000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.464000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.718000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.972000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,30.226000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,30.480000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,30.734000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,30.988000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.242000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.496000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.750000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,32.004000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,32.258000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,32.512000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,32.766000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,33.020000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,33.274000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,33.528000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,33.782000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,34.036000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,34.290000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,34.544000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,34.798000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,35.052000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,35.306000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,35.560000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,35.814000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,36.068000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,36.322000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,36.576000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,36.830000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.084000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.338000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.592000>}
box{<0,0,-0.127000><2.512500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.746000,-1.535000,37.846000>}
box{<0,0,-0.127000><2.603100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.859900,-1.535000,38.100000>}
box{<0,0,-0.127000><2.717000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.113900,-1.535000,38.354000>}
box{<0,0,-0.127000><2.971000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.367900,-1.535000,38.608000>}
box{<0,0,-0.127000><3.225000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.621900,-1.535000,38.862000>}
box{<0,0,-0.127000><3.479000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.875900,-1.535000,39.116000>}
box{<0,0,-0.127000><3.733000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.370000>}
box{<0,0,-0.127000><3.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.624000>}
box{<0,0,-0.127000><3.876900,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.135100,-1.535000,39.878000>}
box{<0,0,-0.127000><3.992200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.389100,-1.535000,40.132000>}
box{<0,0,-0.127000><4.246200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.643100,-1.535000,40.386000>}
box{<0,0,-0.127000><4.500200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.897100,-1.535000,40.640000>}
box{<0,0,-0.127000><4.754200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,40.894000>}
box{<0,0,-0.127000><14.497200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,41.148000>}
box{<0,0,-0.127000><14.497200,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.851500,-1.535000,41.402000>}
box{<0,0,-0.127000><14.708600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.105500,-1.535000,41.656000>}
box{<0,0,-0.127000><14.962600,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.155400,-1.535000,41.910000>}
box{<0,0,-0.127000><15.012500,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.203700,-1.535000,42.164000>}
box{<0,0,-0.127000><15.060800,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.308900,-1.535000,42.418000>}
box{<0,0,-0.127000><15.166000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.511900,-1.535000,42.672000>}
box{<0,0,-0.127000><15.369000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.766000,-1.535000,42.926000>}
box{<0,0,-0.127000><15.623100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.020000,-1.535000,43.180000>}
box{<0,0,-0.127000><15.877100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.274000,-1.535000,43.434000>}
box{<0,0,-0.127000><16.131100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.523000,-1.535000,43.688000>}
box{<0,0,-0.127000><1.380100,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.771200,-1.535000,43.942000>}
box{<0,0,-0.127000><0.628300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.331200,-1.535000,44.196000>}
box{<0,0,-0.127000><0.188300,0.035000,0.127000> rotate<0,0.000000,0> translate<1.142900,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.142900,-1.535000,44.377900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.315700,-1.535000,44.205000>}
box{<0,0,-0.127000><0.244447,0.035000,0.127000> rotate<0,45.013603,0> translate<1.142900,-1.535000,44.377900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.315700,-1.535000,5.194900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.941200,-1.535000,5.556000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<1.315700,-1.535000,5.194900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.315700,-1.535000,44.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.941200,-1.535000,43.843900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<1.315700,-1.535000,44.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.941200,-1.535000,5.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.638800,-1.535000,5.742900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<1.941200,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.941200,-1.535000,43.843900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.638800,-1.535000,43.657000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<1.941200,-1.535000,43.843900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.638800,-1.535000,5.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.361100,-1.535000,5.742900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.638800,-1.535000,5.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.638800,-1.535000,43.657000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.361100,-1.535000,43.657000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<2.638800,-1.535000,43.657000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.361100,-1.535000,5.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.058700,-1.535000,5.556000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<3.361100,-1.535000,5.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.361100,-1.535000,43.657000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.058700,-1.535000,43.843900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<3.361100,-1.535000,43.657000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.476800,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.528000,-1.535000,43.688000>}
box{<0,0,-0.127000><14.051200,0.035000,0.127000> rotate<0,0.000000,0> translate<3.476800,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.650300,-1.535000,7.079500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.066400>}
box{<0,0,-0.127000><0.014058,0.035000,0.127000> rotate<0,68.723855,0> translate<3.650300,-1.535000,7.079500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.650300,-1.535000,7.079500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.313200>}
box{<0,0,-0.127000><0.233756,0.035000,0.127000> rotate<0,-88.743984,0> translate<3.650300,-1.535000,7.079500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.052400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.744700,-1.535000,6.837000>}
box{<0,0,-0.127000><0.233177,0.035000,0.127000> rotate<0,67.477749,0> translate<3.655400,-1.535000,7.052400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.066400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.052400>}
box{<0,0,-0.127000><0.014000,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,7.052400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.402400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,7.313200>}
box{<0,0,-0.127000><15.089200,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,7.313200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.897500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.402400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,22.402400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.902400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,22.897500>}
box{<0,0,-0.127000><1.004900,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,22.897500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.452400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,23.902400>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,23.902400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.502400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,25.452400>}
box{<0,0,-0.127000><4.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,25.452400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.352400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,29.502400>}
box{<0,0,-0.127000><1.850000,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,29.502400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.847500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.352400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,31.352400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.132400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,31.847500>}
box{<0,0,-0.127000><5.284900,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,31.847500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.627500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.132400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.655400,-1.535000,37.132400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.655400,-1.535000,37.627500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.844900,-1.535000,38.085000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<3.655400,-1.535000,37.627500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.744700,-1.535000,6.837000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.829800,-1.535000,6.618000>}
box{<0,0,-0.127000><0.234953,0.035000,0.127000> rotate<0,68.760108,0> translate<3.744700,-1.535000,6.837000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.829800,-1.535000,6.618000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.839600,-1.535000,6.607900>}
box{<0,0,-0.127000><0.014073,0.035000,0.127000> rotate<0,45.860663,0> translate<3.829800,-1.535000,6.618000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.839600,-1.535000,6.607900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.844900,-1.535000,6.594900>}
box{<0,0,-0.127000><0.014039,0.035000,0.127000> rotate<0,67.815180,0> translate<3.839600,-1.535000,6.607900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.844900,-1.535000,6.594900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.009900,-1.535000,6.430000>}
box{<0,0,-0.127000><0.233275,0.035000,0.127000> rotate<0,44.979664,0> translate<3.844900,-1.535000,6.594900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.844900,-1.535000,38.085000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.259900>}
box{<0,0,-0.127000><1.661560,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.844900,-1.535000,38.085000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.939300,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.816000,-1.535000,5.588000>}
box{<0,0,-0.127000><0.876700,0.035000,0.127000> rotate<0,0.000000,0> translate<3.939300,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.009900,-1.535000,6.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.089600,-1.535000,4.257900>}
box{<0,0,-0.127000><3.007186,0.035000,0.127000> rotate<0,46.241902,0> translate<4.009900,-1.535000,6.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.058700,-1.535000,5.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.684200,-1.535000,5.194900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<4.058700,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.058700,-1.535000,43.843900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.684200,-1.535000,44.205000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<4.058700,-1.535000,43.843900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.228600,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.782000,-1.535000,43.942000>}
box{<0,0,-0.127000><13.553400,0.035000,0.127000> rotate<0,0.000000,0> translate<4.228600,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.443300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.059200,-1.535000,5.334000>}
box{<0,0,-0.127000><0.615900,0.035000,0.127000> rotate<0,0.000000,0> translate<4.443300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.668600,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.221200,-1.535000,44.196000>}
box{<0,0,-0.127000><13.552600,0.035000,0.127000> rotate<0,0.000000,0> translate<4.668600,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.684200,-1.535000,5.194900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,4.684200>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<4.684200,-1.535000,5.194900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.684200,-1.535000,44.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,44.715700>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.684200,-1.535000,44.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.799100,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.302400,-1.535000,5.080000>}
box{<0,0,-0.127000><0.503300,0.035000,0.127000> rotate<0,0.000000,0> translate<4.799100,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.929200,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.413700,-1.535000,44.450000>}
box{<0,0,-0.127000><16.484500,0.035000,0.127000> rotate<0,0.000000,0> translate<4.929200,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.762700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.259900>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.019800,-1.535000,39.259900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.019800,-1.535000,39.762700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.957200,-1.535000,40.700100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.019800,-1.535000,39.762700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.053100,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.545600,-1.535000,4.826000>}
box{<0,0,-0.127000><0.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<5.053100,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.072000,-1.535000,48.207000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,48.084200>}
box{<0,0,-0.127000><0.173736,0.035000,0.127000> rotate<0,44.973712,0> translate<5.072000,-1.535000,48.207000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.072000,-1.535000,48.207000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.727900,-1.535000,48.207000>}
box{<0,0,-0.127000><58.655900,0.035000,0.127000> rotate<0,0.000000,0> translate<5.072000,-1.535000,48.207000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.183200,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.871000,-1.535000,44.704000>}
box{<0,0,-0.127000><16.687800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.183200,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,4.684200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,4.058700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<5.194900,-1.535000,4.684200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,44.715700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,45.341200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<5.194900,-1.535000,44.715700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.194900,-1.535000,48.084200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,47.458700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<5.194900,-1.535000,48.084200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.240100,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.559900,-1.535000,48.006000>}
box{<0,0,-0.127000><58.319800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.240100,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.243500,-1.535000,1.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,1.941200>}
box{<0,0,-0.127000><0.624943,0.035000,0.127000> rotate<0,-59.993021,0> translate<5.243500,-1.535000,1.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.243500,-1.535000,1.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.556400,-1.535000,1.400000>}
box{<0,0,-0.127000><58.312900,0.035000,0.127000> rotate<0,0.000000,0> translate<5.243500,-1.535000,1.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.259700,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.788800,-1.535000,4.572000>}
box{<0,0,-0.127000><0.529100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.259700,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.315100,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.484700,-1.535000,1.524000>}
box{<0,0,-0.127000><58.169600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.315100,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.334700,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.465100,-1.535000,44.958000>}
box{<0,0,-0.127000><58.130400,0.035000,0.127000> rotate<0,0.000000,0> translate<5.334700,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.386700,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.413300,-1.535000,47.752000>}
box{<0,0,-0.127000><58.026600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.386700,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.406400,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.032000,-1.535000,4.318000>}
box{<0,0,-0.127000><0.625600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.406400,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.461700,-1.535000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.338100,-1.535000,1.778000>}
box{<0,0,-0.127000><57.876400,0.035000,0.127000> rotate<0,0.000000,0> translate<5.461700,-1.535000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.481400,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.318400,-1.535000,45.212000>}
box{<0,0,-0.127000><57.837000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.481400,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.533400,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.266600,-1.535000,47.498000>}
box{<0,0,-0.127000><57.733200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.533400,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.553000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.275200,-1.535000,4.064000>}
box{<0,0,-0.127000><0.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.553000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,1.941200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,2.638800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<5.556000,-1.535000,1.941200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,4.058700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,3.361100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<5.556000,-1.535000,4.058700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,45.341200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.038800>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<5.556000,-1.535000,45.341200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.556000,-1.535000,47.458700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.761100>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<5.556000,-1.535000,47.458700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.580300,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.219500,-1.535000,2.032000>}
box{<0,0,-0.127000><57.639200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.580300,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.589400,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.210400,-1.535000,45.466000>}
box{<0,0,-0.127000><57.621000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.589400,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.613600,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.186400,-1.535000,47.244000>}
box{<0,0,-0.127000><57.572800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.613600,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.622700,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.649900,-1.535000,3.810000>}
box{<0,0,-0.127000><1.027200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.622700,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.648300,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.151500,-1.535000,2.286000>}
box{<0,0,-0.127000><57.503200,0.035000,0.127000> rotate<0,0.000000,0> translate<5.648300,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.657400,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.142400,-1.535000,45.720000>}
box{<0,0,-0.127000><57.485000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.657400,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.681600,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.118400,-1.535000,46.990000>}
box{<0,0,-0.127000><57.436800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.681600,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.690700,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.109300,-1.535000,3.556000>}
box{<0,0,-0.127000><57.418600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.690700,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.716400,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.083400,-1.535000,2.540000>}
box{<0,0,-0.127000><57.367000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.716400,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.725500,-1.535000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.074300,-1.535000,45.974000>}
box{<0,0,-0.127000><57.348800,0.035000,0.127000> rotate<0,0.000000,0> translate<5.725500,-1.535000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,2.638800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,3.361100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<5.742900,-1.535000,3.361100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,2.794000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,3.048000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,3.302000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.038800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.761100>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,90.000000,0> translate<5.742900,-1.535000,46.761100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.228000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.482000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.742900,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.736000>}
box{<0,0,-0.127000><57.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<5.742900,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.957200,-1.535000,40.700100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.282700,-1.535000,40.700100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<5.957200,-1.535000,40.700100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.089600,-1.535000,4.257900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.094900,-1.535000,4.244900>}
box{<0,0,-0.127000><0.014039,0.035000,0.127000> rotate<0,67.815180,0> translate<6.089600,-1.535000,4.257900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.094900,-1.535000,4.244900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.260200,-1.535000,4.079700>}
box{<0,0,-0.127000><0.233699,0.035000,0.127000> rotate<0,44.979695,0> translate<6.094900,-1.535000,4.244900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,7.799700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,10.186900>}
box{<0,0,-0.127000><2.387200,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,10.186900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,7.799700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.681400,-1.535000,6.194500>}
box{<0,0,-0.127000><2.222325,0.035000,0.127000> rotate<0,46.242193,0> translate<6.144500,-1.535000,7.799700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.707500,-1.535000,7.874000>}
box{<0,0,-0.127000><0.563000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.501600,-1.535000,8.128000>}
box{<0,0,-0.127000><0.357100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.392600,-1.535000,8.382000>}
box{<0,0,-0.127000><0.248100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.122500,-1.535000,8.636000>}
box{<0,0,-0.127000><1.978000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.359300,-1.535000,8.890000>}
box{<0,0,-0.127000><0.214800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.427200,-1.535000,9.144000>}
box{<0,0,-0.127000><0.282700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.575100,-1.535000,9.398000>}
box{<0,0,-0.127000><0.430600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.840200,-1.535000,9.652000>}
box{<0,0,-0.127000><0.695700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.425300,-1.535000,9.906000>}
box{<0,0,-0.127000><0.280800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.171300,-1.535000,10.160000>}
box{<0,0,-0.127000><0.026800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,10.186900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.524000,-1.535000,9.807300>}
box{<0,0,-0.127000><0.536765,0.035000,0.127000> rotate<0,45.004578,0> translate<6.144500,-1.535000,10.186900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,12.313000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,21.445400>}
box{<0,0,-0.127000><9.132400,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,12.313000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.524000,-1.535000,12.692600>}
box{<0,0,-0.127000><0.536765,0.035000,0.127000> rotate<0,-45.004578,0> translate<6.144500,-1.535000,12.313000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.277500,-1.535000,12.446000>}
box{<0,0,-0.127000><0.133000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.541900,-1.535000,12.700000>}
box{<0,0,-0.127000><0.397400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,12.954000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,13.208000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,13.462000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,13.716000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,13.970000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,14.224000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,14.478000>}
box{<0,0,-0.127000><0.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.904500,-1.535000,14.732000>}
box{<0,0,-0.127000><0.760000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.775200,-1.535000,14.986000>}
box{<0,0,-0.127000><0.630700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.670000,-1.535000,15.240000>}
box{<0,0,-0.127000><0.525500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,15.494000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,15.748000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,16.002000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,16.256000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,16.510000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,16.764000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,17.018000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,17.272000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.705700,-1.535000,17.526000>}
box{<0,0,-0.127000><0.561200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.810900,-1.535000,17.780000>}
box{<0,0,-0.127000><0.666400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.990600,-1.535000,18.034000>}
box{<0,0,-0.127000><0.846100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.244600,-1.535000,18.288000>}
box{<0,0,-0.127000><1.100100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.760400,-1.535000,18.542000>}
box{<0,0,-0.127000><1.615900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,18.796000>}
box{<0,0,-0.127000><14.445300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,19.050000>}
box{<0,0,-0.127000><14.445300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,19.304000>}
box{<0,0,-0.127000><14.445300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605100,-1.535000,19.558000>}
box{<0,0,-0.127000><14.460600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.859100,-1.535000,19.812000>}
box{<0,0,-0.127000><14.714600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,20.066000>}
box{<0,0,-0.127000><14.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,20.320000>}
box{<0,0,-0.127000><14.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,20.574000>}
box{<0,0,-0.127000><14.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,20.828000>}
box{<0,0,-0.127000><14.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,21.082000>}
box{<0,0,-0.127000><14.800900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.391000,-1.535000,21.336000>}
box{<0,0,-0.127000><6.246500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.707500,-1.535000,21.445400>}
box{<0,0,-0.127000><2.563000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.452400>}
box{<0,0,-0.127000><1.517900,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,25.452400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.707500,-1.535000,23.934500>}
box{<0,0,-0.127000><2.563000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.477100,-1.535000,24.130000>}
box{<0,0,-0.127000><6.332600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.552500,-1.535000,24.384000>}
box{<0,0,-0.127000><1.408000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.158500,-1.535000,24.638000>}
box{<0,0,-0.127000><1.014000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.904500,-1.535000,24.892000>}
box{<0,0,-0.127000><0.760000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.775200,-1.535000,25.146000>}
box{<0,0,-0.127000><0.630700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.670000,-1.535000,25.400000>}
box{<0,0,-0.127000><0.525500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.452400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.502400>}
box{<0,0,-0.127000><4.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,29.502400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,25.654000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,26.416000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,26.670000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,26.924000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,27.178000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,27.432000>}
box{<0,0,-0.127000><0.475300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.705700,-1.535000,27.686000>}
box{<0,0,-0.127000><0.561200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.810900,-1.535000,27.940000>}
box{<0,0,-0.127000><0.666400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.955400,-1.535000,28.194000>}
box{<0,0,-0.127000><0.810900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.976400,-1.535000,28.448000>}
box{<0,0,-0.127000><0.831900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.081600,-1.535000,28.702000>}
box{<0,0,-0.127000><0.937100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.245900,-1.535000,28.956000>}
box{<0,0,-0.127000><1.101400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.499900,-1.535000,29.210000>}
box{<0,0,-0.127000><1.355400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.753900,-1.535000,29.464000>}
box{<0,0,-0.127000><1.609400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.502400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.979800>}
box{<0,0,-0.127000><0.477400,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.007900,-1.535000,29.718000>}
box{<0,0,-0.127000><1.863400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.261900,-1.535000,29.972000>}
box{<0,0,-0.127000><2.117400,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.882700,-1.535000,29.979800>}
box{<0,0,-0.127000><0.738200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.864400>}
box{<0,0,-0.127000><3.684300,0.035000,0.127000> rotate<0,90.000000,0> translate<6.144500,-1.535000,36.864400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.882700,-1.535000,33.180100>}
box{<0,0,-0.127000><0.738200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,33.274000>}
box{<0,0,-0.127000><22.790900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,33.528000>}
box{<0,0,-0.127000><22.790900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,33.782000>}
box{<0,0,-0.127000><22.790900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,34.036000>}
box{<0,0,-0.127000><22.790900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.693600,-1.535000,34.290000>}
box{<0,0,-0.127000><22.549100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.550800,-1.535000,34.544000>}
box{<0,0,-0.127000><22.406300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.445600,-1.535000,34.798000>}
box{<0,0,-0.127000><22.301100,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.052000>}
box{<0,0,-0.127000><22.206700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.306000>}
box{<0,0,-0.127000><22.206700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.560000>}
box{<0,0,-0.127000><22.206700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.376200,-1.535000,35.814000>}
box{<0,0,-0.127000><22.231700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.481400,-1.535000,36.068000>}
box{<0,0,-0.127000><22.336900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.715400,-1.535000,36.322000>}
box{<0,0,-0.127000><10.570900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.273400,-1.535000,36.576000>}
box{<0,0,-0.127000><10.128900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.019400,-1.535000,36.830000>}
box{<0,0,-0.127000><9.874900,0.035000,0.127000> rotate<0,0.000000,0> translate<6.144500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.144500,-1.535000,36.864400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.779900,-1.535000,37.499800>}
box{<0,0,-0.127000><0.898591,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.144500,-1.535000,36.864400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.260200,-1.535000,4.079700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.422200,-1.535000,3.910400>}
box{<0,0,-0.127000><0.234321,0.035000,0.127000> rotate<0,46.259221,0> translate<6.260200,-1.535000,4.079700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.316600,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.143600,-1.535000,7.620000>}
box{<0,0,-0.127000><0.827000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.316600,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350800,-1.535000,8.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.373100,-1.535000,8.442300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<6.350800,-1.535000,8.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350800,-1.535000,8.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.122500,-1.535000,8.583000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.350800,-1.535000,8.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350800,-1.535000,8.836800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.373100,-1.535000,8.977600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<6.350800,-1.535000,8.836800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350800,-1.535000,8.836800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.122500,-1.535000,8.836800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<6.350800,-1.535000,8.836800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.364100,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.847100,-1.535000,37.084000>}
box{<0,0,-0.127000><9.483000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.364100,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.373100,-1.535000,8.442300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.428700,-1.535000,8.271200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<6.373100,-1.535000,8.442300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.373100,-1.535000,8.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.428700,-1.535000,9.148700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<6.373100,-1.535000,8.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.422200,-1.535000,3.910400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.435100,-1.535000,3.904800>}
box{<0,0,-0.127000><0.014063,0.035000,0.127000> rotate<0,23.464527,0> translate<6.422200,-1.535000,3.910400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.428700,-1.535000,8.271200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.510400,-1.535000,8.110900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<6.428700,-1.535000,8.271200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.428700,-1.535000,9.148700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.510400,-1.535000,9.309000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<6.428700,-1.535000,9.148700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.435100,-1.535000,3.904800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.444900,-1.535000,3.894900>}
box{<0,0,-0.127000><0.013930,0.035000,0.127000> rotate<0,45.287850,0> translate<6.435100,-1.535000,3.904800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.444900,-1.535000,3.894900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.660800,-1.535000,3.805500>}
box{<0,0,-0.127000><0.233677,0.035000,0.127000> rotate<0,22.492012,0> translate<6.444900,-1.535000,3.894900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.510400,-1.535000,8.110900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.616100,-1.535000,7.965400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<6.510400,-1.535000,8.110900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.510400,-1.535000,9.309000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.616100,-1.535000,9.454500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<6.510400,-1.535000,9.309000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.524000,-1.535000,9.807300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.861500,-1.535000,9.667500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<6.524000,-1.535000,9.807300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.524000,-1.535000,12.692600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,12.892000>}
box{<0,0,-0.127000><0.521063,0.035000,0.127000> rotate<0,-22.498270,0> translate<6.524000,-1.535000,12.692600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.559800,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.673800,-1.535000,7.366000>}
box{<0,0,-0.127000><6.114000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.559800,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.616100,-1.535000,7.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.743400,-1.535000,7.838100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<6.616100,-1.535000,7.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.616100,-1.535000,9.454500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.743400,-1.535000,9.581800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.616100,-1.535000,9.454500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.618100,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.741900,-1.535000,37.338000>}
box{<0,0,-0.127000><9.123800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.618100,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,15.361200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,14.773100>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<6.619800,-1.535000,15.361200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,17.318700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,15.361200>}
box{<0,0,-0.127000><1.957500,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.619800,-1.535000,15.361200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,17.318700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,17.906800>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<6.619800,-1.535000,17.318700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,25.521200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,24.933100>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<6.619800,-1.535000,25.521200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,27.478700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,25.521200>}
box{<0,0,-0.127000><1.957500,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.619800,-1.535000,25.521200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.619800,-1.535000,27.478700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,28.066800>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<6.619800,-1.535000,27.478700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.660800,-1.535000,3.805500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.875400,-1.535000,3.711100>}
box{<0,0,-0.127000><0.234445,0.035000,0.127000> rotate<0,23.742559,0> translate<6.660800,-1.535000,3.805500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.743400,-1.535000,7.838100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.888900,-1.535000,7.732400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<6.743400,-1.535000,7.838100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.743400,-1.535000,9.581800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.861500,-1.535000,9.667500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<6.743400,-1.535000,9.581800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.779900,-1.535000,37.499800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.282700,-1.535000,37.499800>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.779900,-1.535000,37.499800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.803000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.927800,-1.535000,7.112000>}
box{<0,0,-0.127000><6.124800,0.035000,0.127000> rotate<0,0.000000,0> translate<6.803000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,14.773100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,14.631100>}
box{<0,0,-0.127000><0.200818,0.035000,0.127000> rotate<0,44.997030,0> translate<6.863400,-1.535000,14.773100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,17.906800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.313500,-1.535000,18.356900>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.863400,-1.535000,17.906800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,24.933100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.313500,-1.535000,24.483000>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<6.863400,-1.535000,24.933100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.863400,-1.535000,28.066800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.955400,-1.535000,28.158700>}
box{<0,0,-0.127000><0.130037,0.035000,0.127000> rotate<0,-44.965876,0> translate<6.863400,-1.535000,28.066800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.875400,-1.535000,3.711100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.889400,-1.535000,3.710800>}
box{<0,0,-0.127000><0.014003,0.035000,0.127000> rotate<0,1.227498,0> translate<6.875400,-1.535000,3.711100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.882700,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,30.917200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.882700,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.882700,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,32.242700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<6.882700,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.888900,-1.535000,7.732400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.049200,-1.535000,7.650700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<6.888900,-1.535000,7.732400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.889400,-1.535000,3.710800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.902400,-1.535000,3.705400>}
box{<0,0,-0.127000><0.014077,0.035000,0.127000> rotate<0,22.555758,0> translate<6.889400,-1.535000,3.710800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.902400,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.136600,-1.535000,3.705400>}
box{<0,0,-0.127000><0.234200,0.035000,0.127000> rotate<0,0.000000,0> translate<6.902400,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.955400,-1.535000,28.397500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.955400,-1.535000,28.158700>}
box{<0,0,-0.127000><0.238800,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.955400,-1.535000,28.158700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.955400,-1.535000,28.397500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.144900,-1.535000,28.855000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<6.955400,-1.535000,28.397500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,14.631100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.005400,-1.535000,12.892000>}
box{<0,0,-0.127000><1.739100,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.005400,-1.535000,12.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.042800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557100,-1.535000,33.020000>}
box{<0,0,-0.127000><8.514300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.042800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.046200,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.181800,-1.535000,6.858000>}
box{<0,0,-0.127000><6.135600,0.035000,0.127000> rotate<0,0.000000,0> translate<7.046200,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.049200,-1.535000,7.650700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.220300,-1.535000,7.595100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<7.049200,-1.535000,7.650700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.128900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.341100,-1.535000,30.226000>}
box{<0,0,-0.127000><2.212200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.128900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.136600,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.370400,-1.535000,3.700300>}
box{<0,0,-0.127000><0.233856,0.035000,0.127000> rotate<0,1.249542,0> translate<7.136600,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.144900,-1.535000,28.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.494900,-1.535000,29.205000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.144900,-1.535000,28.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.220300,-1.535000,7.595100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.398000,-1.535000,7.567000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<7.220300,-1.535000,7.595100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.282700,-1.535000,37.499800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,38.437200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.282700,-1.535000,37.499800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.282700,-1.535000,40.700100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,39.762700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<7.282700,-1.535000,40.700100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.289400,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.435800,-1.535000,6.604000>}
box{<0,0,-0.127000><6.146400,0.035000,0.127000> rotate<0,0.000000,0> translate<7.289400,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.296800,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.303100,-1.535000,32.766000>}
box{<0,0,-0.127000><8.006300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.296800,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.313500,-1.535000,18.356900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.901600,-1.535000,18.600500>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<7.313500,-1.535000,18.356900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.313500,-1.535000,24.483000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.901600,-1.535000,24.239400>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<7.313500,-1.535000,24.483000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.342800,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,40.640000>}
box{<0,0,-0.127000><8.297300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.342800,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.370400,-1.535000,3.700300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.383500,-1.535000,3.705400>}
box{<0,0,-0.127000><0.014058,0.035000,0.127000> rotate<0,-21.270205,0> translate<7.370400,-1.535000,3.700300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.374900,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,37.592000>}
box{<0,0,-0.127000><8.265200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.374900,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.382900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779600,-1.535000,30.480000>}
box{<0,0,-0.127000><2.396700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.382900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.383500,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.254700,-1.535000,3.705400>}
box{<0,0,-0.127000><28.871200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.383500,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.398000,-1.535000,7.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,7.567000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.398000,-1.535000,7.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.494900,-1.535000,29.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.294900,-1.535000,30.005000>}
box{<0,0,-0.127000><1.131371,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.494900,-1.535000,29.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.532600,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.689800,-1.535000,6.350000>}
box{<0,0,-0.127000><6.157200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.532600,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.550800,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.049100,-1.535000,32.512000>}
box{<0,0,-0.127000><7.498300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.550800,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.596800,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,40.386000>}
box{<0,0,-0.127000><8.043300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.596800,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.628900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,37.846000>}
box{<0,0,-0.127000><8.011200,0.035000,0.127000> rotate<0,0.000000,0> translate<7.628900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.636900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.963000,-1.535000,30.734000>}
box{<0,0,-0.127000><7.326100,0.035000,0.127000> rotate<0,0.000000,0> translate<7.636900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.681400,-1.535000,6.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.845400,-1.535000,6.194500>}
box{<0,0,-0.127000><6.164000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.681400,-1.535000,6.194500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.804800,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.795100,-1.535000,32.258000>}
box{<0,0,-0.127000><6.990300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.804800,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,30.917200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,32.242700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<7.820100,-1.535000,32.242700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,30.988000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.820100,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,31.242000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.820100,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,31.496000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.820100,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,31.750000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.820100,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.820100,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,32.004000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.820100,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.850800,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.259300,-1.535000,40.132000>}
box{<0,0,-0.127000><3.408500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.850800,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.882900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.227200,-1.535000,38.100000>}
box{<0,0,-0.127000><3.344300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.882900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.901600,-1.535000,18.600500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.538300,-1.535000,18.600500>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.901600,-1.535000,18.600500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.901600,-1.535000,24.239400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.538300,-1.535000,24.239400>}
box{<0,0,-0.127000><0.636700,0.035000,0.127000> rotate<0,0.000000,0> translate<7.901600,-1.535000,24.239400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.104800,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.005300,-1.535000,39.878000>}
box{<0,0,-0.127000><2.900500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.104800,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.122500,-1.535000,8.836800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.122500,-1.535000,8.583000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.122500,-1.535000,8.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,7.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,8.582500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.123000,-1.535000,8.582500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,7.620000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<8.123000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,7.874000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<8.123000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,8.128000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<8.123000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,8.382000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<8.123000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.123000,-1.535000,8.582500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,8.582500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<8.123000,-1.535000,8.582500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.136900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.973200,-1.535000,38.354000>}
box{<0,0,-0.127000><2.836300,0.035000,0.127000> rotate<0,0.000000,0> translate<8.136900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,38.437200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,39.762700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<8.220100,-1.535000,39.762700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.719200,-1.535000,38.608000>}
box{<0,0,-0.127000><2.499100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.220100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,38.862000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.220100,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623100,-1.535000,39.116000>}
box{<0,0,-0.127000><3.403000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.220100,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.370000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<8.220100,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.220100,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.751300,-1.535000,39.624000>}
box{<0,0,-0.127000><2.531200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.220100,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.294900,-1.535000,30.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.752400,-1.535000,30.194500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<8.294900,-1.535000,30.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,7.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.101900,-1.535000,7.567000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.376800,-1.535000,7.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,8.582500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.376800,-1.535000,7.567000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.376800,-1.535000,7.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.377400,-1.535000,8.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.377400,-1.535000,8.836800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<8.377400,-1.535000,8.836800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.377400,-1.535000,8.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.149000,-1.535000,8.583000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.377400,-1.535000,8.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.377400,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,8.636000>}
box{<0,0,-0.127000><3.678000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.377400,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.377400,-1.535000,8.836800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.149000,-1.535000,8.836800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<8.377400,-1.535000,8.836800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.538300,-1.535000,18.600500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.126400,-1.535000,18.356900>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,22.498599,0> translate<8.538300,-1.535000,18.600500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.538300,-1.535000,24.239400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.126400,-1.535000,24.483000>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-22.498599,0> translate<8.538300,-1.535000,24.239400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.679600,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,18.542000>}
box{<0,0,-0.127000><11.910200,0.035000,0.127000> rotate<0,0.000000,0> translate<8.679600,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.707500,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.281600,-1.535000,21.445400>}
box{<0,0,-0.127000><3.574100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.707500,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.707500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.281600,-1.535000,23.934500>}
box{<0,0,-0.127000><3.574100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.707500,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.752400,-1.535000,30.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.247500,-1.535000,30.194500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.752400,-1.535000,30.194500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.887300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,24.384000>}
box{<0,0,-0.127000><8.318100,0.035000,0.127000> rotate<0,0.000000,0> translate<8.887300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.101900,-1.535000,7.567000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.279600,-1.535000,7.595100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<9.101900,-1.535000,7.567000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.126400,-1.535000,18.356900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,17.906800>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,44.997030,0> translate<9.126400,-1.535000,18.356900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.126400,-1.535000,24.483000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,24.933100>}
box{<0,0,-0.127000><0.636538,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.126400,-1.535000,24.483000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.195300,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,18.288000>}
box{<0,0,-0.127000><11.394500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.195300,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.247500,-1.535000,30.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.309600,-1.535000,30.194500>}
box{<0,0,-0.127000><0.062100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.247500,-1.535000,30.194500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.279600,-1.535000,7.595100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.450700,-1.535000,7.650700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<9.279600,-1.535000,7.595100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.281400,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,24.638000>}
box{<0,0,-0.127000><7.924000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.281400,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.309600,-1.535000,30.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.464700,-1.535000,30.349600>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.309600,-1.535000,30.194500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.356200,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.419800,-1.535000,7.620000>}
box{<0,0,-0.127000><3.063600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.356200,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.449300,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.773000,-1.535000,18.034000>}
box{<0,0,-0.127000><11.323700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.449300,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.450700,-1.535000,7.650700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.611000,-1.535000,7.732400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<9.450700,-1.535000,7.650700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.464700,-1.535000,30.349600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071500,-1.535000,30.600900>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<9.464700,-1.535000,30.349600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,12.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,14.691100>}
box{<0,0,-0.127000><1.799100,0.035000,0.127000> rotate<0,90.000000,0> translate<9.494500,-1.535000,14.691100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,12.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.975900,-1.535000,12.692600>}
box{<0,0,-0.127000><0.521063,0.035000,0.127000> rotate<0,22.498270,0> translate<9.494500,-1.535000,12.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,12.954000>}
box{<0,0,-0.127000><2.205300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.715100,-1.535000,13.208000>}
box{<0,0,-0.127000><2.220600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.969100,-1.535000,13.462000>}
box{<0,0,-0.127000><2.474600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.223100,-1.535000,13.716000>}
box{<0,0,-0.127000><2.728600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.477100,-1.535000,13.970000>}
box{<0,0,-0.127000><2.982600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,14.224000>}
box{<0,0,-0.127000><11.654100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.395300,-1.535000,14.478000>}
box{<0,0,-0.127000><11.900800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.494500,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.494500,-1.535000,14.691100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,14.773100>}
box{<0,0,-0.127000><0.115966,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.494500,-1.535000,14.691100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.535400,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.649300,-1.535000,14.732000>}
box{<0,0,-0.127000><12.113900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.535400,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.535400,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,24.892000>}
box{<0,0,-0.127000><7.670000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.535400,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,14.773100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,15.361200>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<9.576500,-1.535000,14.773100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,17.906800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,17.318700>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,67.495462,0> translate<9.576500,-1.535000,17.906800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.576500,-1.535000,24.933100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,25.521200>}
box{<0,0,-0.127000><0.636555,0.035000,0.127000> rotate<0,-67.495462,0> translate<9.576500,-1.535000,24.933100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.611000,-1.535000,7.732400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.756500,-1.535000,7.838100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<9.611000,-1.535000,7.732400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.629100,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.027000,-1.535000,17.780000>}
box{<0,0,-0.127000><11.397900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.629100,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.638400,-1.535000,9.667500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.756500,-1.535000,9.581800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<9.638400,-1.535000,9.667500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.638400,-1.535000,9.667500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.975900,-1.535000,9.807300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<9.638400,-1.535000,9.667500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.659800,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,9.652000>}
box{<0,0,-0.127000><2.395600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.659800,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.664600,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,14.986000>}
box{<0,0,-0.127000><24.247600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.664600,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.664600,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,25.146000>}
box{<0,0,-0.127000><7.540800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.664600,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.734300,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.281000,-1.535000,17.526000>}
box{<0,0,-0.127000><11.546700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.734300,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.756500,-1.535000,7.838100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.883800,-1.535000,7.965400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.756500,-1.535000,7.838100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.756500,-1.535000,9.581800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.883800,-1.535000,9.454500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<9.756500,-1.535000,9.581800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.769800,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,15.240000>}
box{<0,0,-0.127000><24.142400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.769800,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.769800,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,25.400000>}
box{<0,0,-0.127000><7.435600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.769800,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.792400,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.212100,-1.535000,7.874000>}
box{<0,0,-0.127000><2.419700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.792400,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,15.361200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,17.318700>}
box{<0,0,-0.127000><1.957500,0.035000,0.127000> rotate<0,90.000000,0> translate<9.820100,-1.535000,17.318700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.956600,-1.535000,15.494000>}
box{<0,0,-0.127000><24.136500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061800,-1.535000,15.748000>}
box{<0,0,-0.127000><24.241700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.184000,-1.535000,16.002000>}
box{<0,0,-0.127000><24.363900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.438000,-1.535000,16.256000>}
box{<0,0,-0.127000><24.617900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.351900,-1.535000,16.510000>}
box{<0,0,-0.127000><24.531800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.131200,-1.535000,16.764000>}
box{<0,0,-0.127000><24.311100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.026000,-1.535000,17.018000>}
box{<0,0,-0.127000><24.205900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.920800,-1.535000,17.272000>}
box{<0,0,-0.127000><24.100700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,25.521200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,27.403200>}
box{<0,0,-0.127000><1.882000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.820100,-1.535000,27.403200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.403200,-1.535000,25.654000>}
box{<0,0,-0.127000><1.583100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.149200,-1.535000,25.908000>}
box{<0,0,-0.127000><1.329100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.162000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.416000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.670000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.924000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.235300,-1.535000,27.178000>}
box{<0,0,-0.127000><1.415200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.820100,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.820100,-1.535000,27.403200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071500,-1.535000,27.299000>}
box{<0,0,-0.127000><0.272139,0.035000,0.127000> rotate<0,22.511490,0> translate<9.820100,-1.535000,27.403200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.883800,-1.535000,7.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.989500,-1.535000,8.110900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<9.883800,-1.535000,7.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.883800,-1.535000,9.454500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.989500,-1.535000,9.309000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<9.883800,-1.535000,9.454500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.924900,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,9.398000>}
box{<0,0,-0.127000><2.130500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.924900,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.958100,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,12.700000>}
box{<0,0,-0.127000><1.741700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.958100,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.975900,-1.535000,9.807300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.454600,-1.535000,10.286000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.975900,-1.535000,9.807300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.975900,-1.535000,12.692600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.454600,-1.535000,12.213900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<9.975900,-1.535000,12.692600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.989500,-1.535000,8.110900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071200,-1.535000,8.271200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<9.989500,-1.535000,8.110900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.989500,-1.535000,9.309000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071200,-1.535000,9.148700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<9.989500,-1.535000,9.309000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.998200,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106900,-1.535000,8.128000>}
box{<0,0,-0.127000><2.108700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.998200,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071200,-1.535000,8.271200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.126800,-1.535000,8.442300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<10.071200,-1.535000,8.271200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071200,-1.535000,9.148700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.126800,-1.535000,8.977600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<10.071200,-1.535000,9.148700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071500,-1.535000,27.299000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.728400,-1.535000,27.299000>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.071500,-1.535000,27.299000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.071500,-1.535000,30.600900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.728400,-1.535000,30.600900>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<10.071500,-1.535000,30.600900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.072800,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,9.144000>}
box{<0,0,-0.127000><1.982600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.072800,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.074600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,9.906000>}
box{<0,0,-0.127000><1.980800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.074600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.107200,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,8.382000>}
box{<0,0,-0.127000><1.948200,0.035000,0.127000> rotate<0,0.000000,0> translate<10.107200,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.126800,-1.535000,8.442300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.149000,-1.535000,8.583000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<10.126800,-1.535000,8.442300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.126800,-1.535000,8.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.149000,-1.535000,8.836800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<10.126800,-1.535000,8.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.140700,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,8.890000>}
box{<0,0,-0.127000><1.914700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.140700,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.222500,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,12.446000>}
box{<0,0,-0.127000><1.477300,0.035000,0.127000> rotate<0,0.000000,0> translate<10.222500,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.328600,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,10.160000>}
box{<0,0,-0.127000><1.726800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.328600,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.454600,-1.535000,10.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,10.911400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<10.454600,-1.535000,10.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.454600,-1.535000,12.213900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,11.588500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<10.454600,-1.535000,12.213900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.463700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,12.192000>}
box{<0,0,-0.127000><1.236100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.463700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.507600,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,10.414000>}
box{<0,0,-0.127000><1.547800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.507600,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.569000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,11.938000>}
box{<0,0,-0.127000><1.130800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.569000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.612800,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,10.668000>}
box{<0,0,-0.127000><1.442600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.612800,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,38.668600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.268600,-1.535000,38.058600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<10.658600,-1.535000,38.668600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.023600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,38.668600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.658600,-1.535000,38.668600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.023600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623100,-1.535000,39.023600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.658600,-1.535000,39.023600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623100,-1.535000,39.176200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.658600,-1.535000,39.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.531300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.176200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.658600,-1.535000,39.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.658600,-1.535000,39.531300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.268600,-1.535000,40.141300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.658600,-1.535000,39.531300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.674200,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.883000,-1.535000,11.684000>}
box{<0,0,-0.127000><1.208800,0.035000,0.127000> rotate<0,0.000000,0> translate<10.674200,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,10.911400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,11.588500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<10.713700,-1.535000,11.588500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,10.922000>}
box{<0,0,-0.127000><1.341700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.713700,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,11.176000>}
box{<0,0,-0.127000><1.341700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.713700,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.713700,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,11.430000>}
box{<0,0,-0.127000><1.341700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.713700,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.728400,-1.535000,27.299000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.335200,-1.535000,27.550300>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<10.728400,-1.535000,27.299000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.728400,-1.535000,30.600900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.335200,-1.535000,30.349600>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<10.728400,-1.535000,30.600900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.068600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.598600,-1.535000,25.458600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<10.988600,-1.535000,26.068600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.423600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.068600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.988600,-1.535000,26.068600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.423600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953100,-1.535000,26.423600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.988600,-1.535000,26.423600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.576200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953100,-1.535000,26.576200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.988600,-1.535000,26.576200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.576200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.988600,-1.535000,26.576200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.988600,-1.535000,26.931300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.598600,-1.535000,27.541300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.988600,-1.535000,26.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.020400,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.217000,-1.535000,30.480000>}
box{<0,0,-0.127000><4.196600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.020400,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.049500,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.489300,-1.535000,27.432000>}
box{<0,0,-0.127000><0.439800,0.035000,0.127000> rotate<0,0.000000,0> translate<11.049500,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.268600,-1.535000,38.058600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.058600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.268600,-1.535000,38.058600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.268600,-1.535000,40.141300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,40.141300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.268600,-1.535000,40.141300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.335200,-1.535000,27.550300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.799600,-1.535000,28.014700>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.335200,-1.535000,27.550300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.335200,-1.535000,30.349600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.799600,-1.535000,29.885200>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,44.997030,0> translate<11.335200,-1.535000,30.349600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.458800,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.471000,-1.535000,30.226000>}
box{<0,0,-0.127000><4.012200,0.035000,0.127000> rotate<0,0.000000,0> translate<11.458800,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.470900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,27.686000>}
box{<0,0,-0.127000><5.734500,0.035000,0.127000> rotate<0,0.000000,0> translate<11.470900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.598600,-1.535000,25.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,25.458600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.598600,-1.535000,25.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.598600,-1.535000,27.541300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,27.541300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.598600,-1.535000,27.541300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623100,-1.535000,39.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623100,-1.535000,39.023600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.623100,-1.535000,39.023600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.058600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.023100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<11.623600,-1.535000,39.023100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.100000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.354000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.608000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.862000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.023100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.023100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,39.023100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.176800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,40.141300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<11.623600,-1.535000,40.141300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.176800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.176800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,39.176800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.370000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.624000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.878000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.623600,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,40.132000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.623600,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,11.867200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,11.511600>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<11.699800,-1.535000,11.867200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,13.192700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,11.867200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.699800,-1.535000,11.867200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.699800,-1.535000,13.192700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,14.130100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.699800,-1.535000,13.192700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.712800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,29.972000>}
box{<0,0,-0.127000><5.492600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.712800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.724900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,27.940000>}
box{<0,0,-0.127000><5.480500,0.035000,0.127000> rotate<0,0.000000,0> translate<11.724900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.058600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.131300,-1.535000,38.058600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.776200,-1.535000,38.058600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.023100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,38.058600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.776200,-1.535000,38.058600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,40.141300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,39.176800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.776200,-1.535000,39.176800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776200,-1.535000,40.141300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.131300,-1.535000,40.141300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.776200,-1.535000,40.141300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776800,-1.535000,39.023600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776800,-1.535000,39.176200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<11.776800,-1.535000,39.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776800,-1.535000,39.023600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.023600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<11.776800,-1.535000,39.023600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776800,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.105500,-1.535000,39.116000>}
box{<0,0,-0.127000><4.328700,0.035000,0.127000> rotate<0,0.000000,0> translate<11.776800,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.776800,-1.535000,39.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.176200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<11.776800,-1.535000,39.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.799600,-1.535000,28.014700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,28.621500>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-67.499155,0> translate<11.799600,-1.535000,28.014700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.799600,-1.535000,29.885200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,29.278400>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,67.499155,0> translate<11.799600,-1.535000,29.885200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.868900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,29.718000>}
box{<0,0,-0.127000><5.336500,0.035000,0.127000> rotate<0,0.000000,0> translate<11.868900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.873800,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,28.194000>}
box{<0,0,-0.127000><5.331600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.873800,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953100,-1.535000,26.576200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953100,-1.535000,26.423600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.953100,-1.535000,26.423600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,25.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.423100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<11.953600,-1.535000,26.423100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,25.654000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,25.908000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.162000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.416000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.423100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.423100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.423100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.576800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,27.541300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<11.953600,-1.535000,27.541300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.576800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.576800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.576800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.670000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.924000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,27.178000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.953600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,27.432000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<11.953600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.974100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,29.464000>}
box{<0,0,-0.127000><5.231300,0.035000,0.127000> rotate<0,0.000000,0> translate<11.974100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.979000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,28.448000>}
box{<0,0,-0.127000><5.226400,0.035000,0.127000> rotate<0,0.000000,0> translate<11.979000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,28.621500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,29.278400>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,90.000000,0> translate<12.050900,-1.535000,29.278400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,28.702000>}
box{<0,0,-0.127000><5.154500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.050900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,28.956000>}
box{<0,0,-0.127000><5.154500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.050900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,29.210000>}
box{<0,0,-0.127000><5.154500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.050900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,8.252400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.244900,-1.535000,7.794900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,67.495834,0> translate<12.055400,-1.535000,8.252400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,11.511600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.055400,-1.535000,8.252400>}
box{<0,0,-0.127000><3.259200,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.055400,-1.535000,8.252400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,25.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.461300,-1.535000,25.458600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<12.106200,-1.535000,25.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.423100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,25.458600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.106200,-1.535000,25.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,27.541300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,26.576800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.106200,-1.535000,26.576800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106200,-1.535000,27.541300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.461300,-1.535000,27.541300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<12.106200,-1.535000,27.541300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106800,-1.535000,26.423600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106800,-1.535000,26.576200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<12.106800,-1.535000,26.576200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106800,-1.535000,26.423600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.423600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.106800,-1.535000,26.423600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.106800,-1.535000,26.576200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.576200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.106800,-1.535000,26.576200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.131300,-1.535000,38.058600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,38.668600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.131300,-1.535000,38.058600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.131300,-1.535000,40.141300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.531300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<12.131300,-1.535000,40.141300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.140600,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,40.132000>}
box{<0,0,-0.127000><3.499500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.140600,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.172700,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,38.100000>}
box{<0,0,-0.127000><3.467400,0.035000,0.127000> rotate<0,0.000000,0> translate<12.172700,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.244900,-1.535000,7.794900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.594900,-1.535000,7.444900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,44.997030,0> translate<12.244900,-1.535000,7.794900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.281600,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,21.089800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<12.281600,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.281600,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,24.290100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.281600,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.394600,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,39.878000>}
box{<0,0,-0.127000><3.245500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.394600,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.426700,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.672400,-1.535000,38.354000>}
box{<0,0,-0.127000><3.245700,0.035000,0.127000> rotate<0,0.000000,0> translate<12.426700,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.461300,-1.535000,25.458600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.068600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.461300,-1.535000,25.458600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.461300,-1.535000,27.541300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.931300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<12.461300,-1.535000,27.541300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.570600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,27.432000>}
box{<0,0,-0.127000><4.634800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.570600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.594900,-1.535000,7.444900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.194900,-1.535000,6.844900>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,44.997030,0> translate<12.594900,-1.535000,7.444900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,14.130100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,14.130100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.637200,-1.535000,14.130100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,21.089800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,21.089800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.637200,-1.535000,21.089800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.637200,-1.535000,24.290100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,24.290100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.637200,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.648600,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.765400,-1.535000,39.624000>}
box{<0,0,-0.127000><3.116800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.648600,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.656700,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,25.654000>}
box{<0,0,-0.127000><4.548700,0.035000,0.127000> rotate<0,0.000000,0> translate<12.656700,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.680700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.777700,-1.535000,38.608000>}
box{<0,0,-0.127000><3.097000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.680700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,38.668600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.023600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.741300,-1.535000,39.023600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.882900,-1.535000,38.862000>}
box{<0,0,-0.127000><3.141600,0.035000,0.127000> rotate<0,0.000000,0> translate<12.741300,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.531300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<12.741300,-1.535000,39.531300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.741300,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.019400,-1.535000,39.370000>}
box{<0,0,-0.127000><3.278100,0.035000,0.127000> rotate<0,0.000000,0> translate<12.741300,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.824600,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,27.178000>}
box{<0,0,-0.127000><4.380800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.824600,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.910700,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,25.908000>}
box{<0,0,-0.127000><4.294700,0.035000,0.127000> rotate<0,0.000000,0> translate<12.910700,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.068600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.423600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<13.071300,-1.535000,26.423600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,26.162000>}
box{<0,0,-0.127000><4.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.071300,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,26.416000>}
box{<0,0,-0.127000><4.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.071300,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.576200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.931300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<13.071300,-1.535000,26.931300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,26.670000>}
box{<0,0,-0.127000><4.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.071300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.071300,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,26.924000>}
box{<0,0,-0.127000><4.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.071300,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.194900,-1.535000,6.844900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.845400,-1.535000,6.194500>}
box{<0,0,-0.127000><0.919875,0.035000,0.127000> rotate<0,44.992626,0> translate<13.194900,-1.535000,6.844900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,14.130100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,13.192700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<13.962700,-1.535000,14.130100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,21.089800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.027200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.962700,-1.535000,21.089800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.962700,-1.535000,24.290100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,23.352700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<13.962700,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.122800,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.970000>}
box{<0,0,-0.127000><7.025800,0.035000,0.127000> rotate<0,0.000000,0> translate<14.122800,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.122800,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.287100,-1.535000,24.130000>}
box{<0,0,-0.127000><2.164300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.122800,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.208900,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.201000,-1.535000,21.336000>}
box{<0,0,-0.127000><1.992100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.208900,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.376800,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.716000>}
box{<0,0,-0.127000><6.771800,0.035000,0.127000> rotate<0,0.000000,0> translate<14.376800,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.376800,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.033100,-1.535000,23.876000>}
box{<0,0,-0.127000><1.656300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.376800,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.462900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.947000,-1.535000,21.590000>}
box{<0,0,-0.127000><1.484100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.462900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,9.687300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,11.511600>}
box{<0,0,-0.127000><1.824300,0.035000,0.127000> rotate<0,90.000000,0> translate<14.544500,-1.535000,11.511600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,9.687300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.177200,-1.535000,10.320100>}
box{<0,0,-0.127000><0.894844,0.035000,0.127000> rotate<0,-45.001557,0> translate<14.544500,-1.535000,9.687300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.763200,-1.535000,9.906000>}
box{<0,0,-0.127000><0.218700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.017200,-1.535000,10.160000>}
box{<0,0,-0.127000><0.472700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.323800,-1.535000,10.414000>}
box{<0,0,-0.127000><11.779300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.577800,-1.535000,10.668000>}
box{<0,0,-0.127000><12.033300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.559100,-1.535000,10.922000>}
box{<0,0,-0.127000><19.014600,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.813100,-1.535000,11.176000>}
box{<0,0,-0.127000><19.268600,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.067100,-1.535000,11.430000>}
box{<0,0,-0.127000><19.522600,0.035000,0.127000> rotate<0,0.000000,0> translate<14.544500,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.544500,-1.535000,11.511600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,11.867200>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.544500,-1.535000,11.511600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.630800,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.569300,-1.535000,13.462000>}
box{<0,0,-0.127000><1.938500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.630800,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.630800,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.779100,-1.535000,23.622000>}
box{<0,0,-0.127000><1.148300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.630800,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.716900,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.483200,-1.535000,11.684000>}
box{<0,0,-0.127000><1.766300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.716900,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.716900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.693000,-1.535000,21.844000>}
box{<0,0,-0.127000><0.976100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.716900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,30.917200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.717200,-1.535000,29.979800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<14.779800,-1.535000,30.917200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,32.242700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,30.917200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.779800,-1.535000,30.917200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.779800,-1.535000,32.242700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.717200,-1.535000,33.180100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.779800,-1.535000,32.242700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.884800,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.315300,-1.535000,13.208000>}
box{<0,0,-0.127000><1.430500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.884800,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.884800,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.525100,-1.535000,23.368000>}
box{<0,0,-0.127000><0.640300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.884800,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,11.867200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,13.192700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<14.900100,-1.535000,13.192700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.229200,-1.535000,11.938000>}
box{<0,0,-0.127000><1.329100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.192000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.446000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.700000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.954000>}
box{<0,0,-0.127000><1.168500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.027200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,23.352700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<14.900100,-1.535000,23.352700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.098000>}
box{<0,0,-0.127000><0.609700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.352000>}
box{<0,0,-0.127000><0.609700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.606000>}
box{<0,0,-0.127000><0.609700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.860000>}
box{<0,0,-0.127000><0.609700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.900100,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,23.114000>}
box{<0,0,-0.127000><0.609700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.900100,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.177200,-1.535000,10.320100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.502700,-1.535000,10.320100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.177200,-1.535000,10.320100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.027200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.447200,-1.535000,21.089800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<15.509800,-1.535000,22.027200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,23.352700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,22.027200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.509800,-1.535000,22.027200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.509800,-1.535000,23.352700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.447200,-1.535000,24.290100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.509800,-1.535000,23.352700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,37.583800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.905000,-1.535000,36.944400>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,67.491580,0> translate<15.640100,-1.535000,37.583800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,38.276100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,37.583800>}
box{<0,0,-0.127000><0.692300,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.640100,-1.535000,37.583800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,38.276100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.905000,-1.535000,38.915500>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,-67.491580,0> translate<15.640100,-1.535000,38.276100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,39.749300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.189500,-1.535000,39.200000>}
box{<0,0,-0.127000><0.776898,0.035000,0.127000> rotate<0,44.991816,0> translate<15.640100,-1.535000,39.749300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,41.190600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,39.749300>}
box{<0,0,-0.127000><1.441300,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.640100,-1.535000,39.749300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.640100,-1.535000,41.190600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.155400,-1.535000,41.705900>}
box{<0,0,-0.127000><0.728744,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.640100,-1.535000,41.190600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.717200,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.042700,-1.535000,29.979800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.717200,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.717200,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.042700,-1.535000,33.180100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.717200,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.905000,-1.535000,36.944400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.394400,-1.535000,36.455000>}
box{<0,0,-0.127000><0.692116,0.035000,0.127000> rotate<0,44.997030,0> translate<15.905000,-1.535000,36.944400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.905000,-1.535000,38.915500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.189500,-1.535000,39.200000>}
box{<0,0,-0.127000><0.402344,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.905000,-1.535000,38.915500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.098600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.678600,-1.535000,11.488600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<16.068600,-1.535000,12.098600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.098600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.068600,-1.535000,12.098600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033100,-1.535000,12.453600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.068600,-1.535000,12.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033100,-1.535000,12.606200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.068600,-1.535000,12.606200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.961300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.606200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.068600,-1.535000,12.606200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.068600,-1.535000,12.961300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.678600,-1.535000,13.571300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.068600,-1.535000,12.961300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.155400,-1.535000,42.047500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.155400,-1.535000,41.705900>}
box{<0,0,-0.127000><0.341600,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.155400,-1.535000,41.705900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.155400,-1.535000,42.047500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.344900,-1.535000,42.505000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<16.155400,-1.535000,42.047500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.344900,-1.535000,42.505000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.694900,-1.535000,42.855000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.344900,-1.535000,42.505000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.394400,-1.535000,36.455000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033800,-1.535000,36.190100>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,22.502480,0> translate<16.394400,-1.535000,36.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.447200,-1.535000,21.089800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.772700,-1.535000,21.089800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.447200,-1.535000,21.089800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.447200,-1.535000,24.290100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,24.290100>}
box{<0,0,-0.127000><0.758200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.447200,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.502700,-1.535000,10.320100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,9.382700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<16.502700,-1.535000,10.320100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.662800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,10.160000>}
box{<0,0,-0.127000><9.426100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.662800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.678600,-1.535000,11.488600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,11.488600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.678600,-1.535000,11.488600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.678600,-1.535000,13.571300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,13.571300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.678600,-1.535000,13.571300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.694900,-1.535000,42.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.695000,-1.535000,42.855000>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.694900,-1.535000,42.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.695000,-1.535000,42.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.904900,-1.535000,44.065000>}
box{<0,0,-0.127000><1.711128,0.035000,0.127000> rotate<0,-44.999398,0> translate<16.695000,-1.535000,42.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.916800,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.906000>}
box{<0,0,-0.127000><9.172100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.916800,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033100,-1.535000,12.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033100,-1.535000,12.453600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.033100,-1.535000,12.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,11.488600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.453100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<17.033600,-1.535000,12.453100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,11.684000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,11.938000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.192000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.446000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.453100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.453100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.453100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,13.571300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<17.033600,-1.535000,13.571300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.606800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.700000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.954000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,13.208000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033600,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,13.462000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033600,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.033800,-1.535000,36.190100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.726100,-1.535000,36.190100>}
box{<0,0,-0.127000><0.692300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.033800,-1.535000,36.190100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.042700,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,30.142600>}
box{<0,0,-0.127000><0.230163,0.035000,0.127000> rotate<0,-45.014631,0> translate<17.042700,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.042700,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.398200,-1.535000,32.824500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<17.042700,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.170800,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.379300,-1.535000,9.652000>}
box{<0,0,-0.127000><3.208500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.170800,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,11.488600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.541300,-1.535000,11.488600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.186200,-1.535000,11.488600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.453100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,11.488600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.186200,-1.535000,11.488600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,13.571300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,12.606800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.186200,-1.535000,12.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186200,-1.535000,13.571300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.541300,-1.535000,13.571300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.186200,-1.535000,13.571300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186800,-1.535000,12.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186800,-1.535000,12.606200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<17.186800,-1.535000,12.606200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186800,-1.535000,12.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.453600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.186800,-1.535000,12.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.186800,-1.535000,12.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.606200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.186800,-1.535000,12.606200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.202800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.167100,-1.535000,33.020000>}
box{<0,0,-0.127000><1.964300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.202800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,30.142600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.205400,-1.535000,24.290100>}
box{<0,0,-0.127000><5.852500,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.205400,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.398200,-1.535000,32.824500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.697500,-1.535000,32.824500>}
box{<0,0,-0.127000><1.299300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.398200,-1.535000,32.824500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.424800,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.125300,-1.535000,9.398000>}
box{<0,0,-0.127000><2.700500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.424800,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,9.382700>}
box{<0,0,-0.127000><1.038200,0.035000,0.127000> rotate<0,90.000000,0> translate<17.440100,-1.535000,9.382700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.344500>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.440100,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.382000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.440100,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.636000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.440100,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.890000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.440100,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.440100,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,9.144000>}
box{<0,0,-0.127000><2.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.440100,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.541300,-1.535000,11.488600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.098600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.541300,-1.535000,11.488600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.541300,-1.535000,13.571300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.961300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<17.541300,-1.535000,13.571300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.650600,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.462000>}
box{<0,0,-0.127000><3.498000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.650600,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.726100,-1.535000,36.190100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.365500,-1.535000,36.455000>}
box{<0,0,-0.127000><0.692101,0.035000,0.127000> rotate<0,-22.502480,0> translate<17.726100,-1.535000,36.190100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.736700,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.924000,-1.535000,11.684000>}
box{<0,0,-0.127000><21.187300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.736700,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.772700,-1.535000,21.089800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.128200,-1.535000,21.445400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<17.772700,-1.535000,21.089800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.904600,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.309200,-1.535000,13.208000>}
box{<0,0,-0.127000><3.404600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.904600,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.904900,-1.535000,44.065000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.362400,-1.535000,44.254500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<17.904900,-1.535000,44.065000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.990700,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.178000,-1.535000,11.938000>}
box{<0,0,-0.127000><21.187300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.990700,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.018800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,21.336000>}
box{<0,0,-0.127000><2.926600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.018800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.044400,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.586600,-1.535000,36.322000>}
box{<0,0,-0.127000><10.542200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.044400,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.128200,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.202400,-1.535000,21.445400>}
box{<0,0,-0.127000><0.074200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.128200,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.098600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.453600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.151300,-1.535000,12.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.432000,-1.535000,12.192000>}
box{<0,0,-0.127000><21.280700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.151300,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.686000,-1.535000,12.446000>}
box{<0,0,-0.127000><21.534700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.151300,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.961300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<18.151300,-1.535000,12.961300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.940000,-1.535000,12.700000>}
box{<0,0,-0.127000><21.788700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.151300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.151300,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.563200,-1.535000,12.954000>}
box{<0,0,-0.127000><3.411900,0.035000,0.127000> rotate<0,0.000000,0> translate<18.151300,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.202400,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,21.445400>}
box{<0,0,-0.127000><2.743000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.202400,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.362400,-1.535000,44.254500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.857500,-1.535000,44.254500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.362400,-1.535000,44.254500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.365500,-1.535000,36.455000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.595900,-1.535000,36.685400>}
box{<0,0,-0.127000><0.325835,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.365500,-1.535000,36.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.486500,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.779700,-1.535000,36.576000>}
box{<0,0,-0.127000><10.293200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.486500,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.570400,-1.535000,39.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.595900,-1.535000,39.174500>}
box{<0,0,-0.127000><0.036062,0.035000,0.127000> rotate<0,44.997030,0> translate<18.570400,-1.535000,39.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.570400,-1.535000,39.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,39.749300>}
box{<0,0,-0.127000><0.776898,0.035000,0.127000> rotate<0,-44.991816,0> translate<18.570400,-1.535000,39.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.595900,-1.535000,36.685400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.432400,-1.535000,36.685400>}
box{<0,0,-0.127000><3.836500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.595900,-1.535000,36.685400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.595900,-1.535000,39.174500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.164400,-1.535000,39.174500>}
box{<0,0,-0.127000><3.568500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.595900,-1.535000,39.174500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.697500,-1.535000,32.824500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.971600,-1.535000,32.824500>}
box{<0,0,-0.127000><0.274100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.697500,-1.535000,32.824500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.740400,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.359900,-1.535000,39.370000>}
box{<0,0,-0.127000><3.619500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.740400,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.835200,-1.535000,41.475200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,41.190600>}
box{<0,0,-0.127000><0.402485,0.035000,0.127000> rotate<0,44.997030,0> translate<18.835200,-1.535000,41.475200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.835200,-1.535000,41.475200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.125500,-1.535000,41.765400>}
box{<0,0,-0.127000><0.410475,0.035000,0.127000> rotate<0,-44.987161,0> translate<18.835200,-1.535000,41.475200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.857500,-1.535000,44.254500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.218200,-1.535000,44.254500>}
box{<0,0,-0.127000><2.360700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.857500,-1.535000,44.254500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.908400,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.663000,-1.535000,41.402000>}
box{<0,0,-0.127000><2.754600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.908400,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.971600,-1.535000,32.824500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327200,-1.535000,33.180100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.971600,-1.535000,32.824500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.994400,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.613900,-1.535000,39.624000>}
box{<0,0,-0.127000><3.619500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.994400,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.016000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.327600,-1.535000,41.656000>}
box{<0,0,-0.127000><2.311600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.016000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,39.749300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,41.190600>}
box{<0,0,-0.127000><1.441300,0.035000,0.127000> rotate<0,90.000000,0> translate<19.119800,-1.535000,41.190600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.867900,-1.535000,39.878000>}
box{<0,0,-0.127000><3.748100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.121900,-1.535000,40.132000>}
box{<0,0,-0.127000><4.002100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.375900,-1.535000,40.386000>}
box{<0,0,-0.127000><4.256100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.629900,-1.535000,40.640000>}
box{<0,0,-0.127000><4.510100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.883900,-1.535000,40.894000>}
box{<0,0,-0.127000><4.764100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.119800,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.137900,-1.535000,41.148000>}
box{<0,0,-0.127000><5.018100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.119800,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.125500,-1.535000,41.765400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.218200,-1.535000,41.765400>}
box{<0,0,-0.127000><2.092700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.125500,-1.535000,41.765400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.327200,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.652700,-1.535000,33.180100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.327200,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.979800>}
box{<0,0,-0.127000><6.045300,0.035000,0.127000> rotate<0,90.000000,0> translate<19.694500,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.171700,-1.535000,23.934500>}
box{<0,0,-0.127000><1.477200,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.367200,-1.535000,24.130000>}
box{<0,0,-0.127000><1.672700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.593000,-1.535000,24.384000>}
box{<0,0,-0.127000><11.898500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,24.638000>}
box{<0,0,-0.127000><11.695300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,24.892000>}
box{<0,0,-0.127000><11.695300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.281000,-1.535000,25.146000>}
box{<0,0,-0.127000><1.586500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.027000,-1.535000,25.400000>}
box{<0,0,-0.127000><1.332500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.773000,-1.535000,25.654000>}
box{<0,0,-0.127000><1.078500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.895300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.895300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,26.416000>}
box{<0,0,-0.127000><0.895300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,26.670000>}
box{<0,0,-0.127000><0.895300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,26.924000>}
box{<0,0,-0.127000><0.895300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605100,-1.535000,27.178000>}
box{<0,0,-0.127000><0.910600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.859100,-1.535000,27.432000>}
box{<0,0,-0.127000><1.164600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,27.686000>}
box{<0,0,-0.127000><1.250900,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875000,-1.535000,27.940000>}
box{<0,0,-0.127000><1.180500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.726000,-1.535000,28.194000>}
box{<0,0,-0.127000><1.031500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.620800,-1.535000,28.448000>}
box{<0,0,-0.127000><0.926300,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,28.702000>}
box{<0,0,-0.127000><0.854500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.854500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,29.210000>}
box{<0,0,-0.127000><0.854500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.625900,-1.535000,29.464000>}
box{<0,0,-0.127000><0.931400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.731100,-1.535000,29.718000>}
box{<0,0,-0.127000><1.036600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.887100,-1.535000,29.972000>}
box{<0,0,-0.127000><1.192600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.694500,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.652700,-1.535000,29.979800>}
box{<0,0,-0.127000><0.958200,0.035000,0.127000> rotate<0,0.000000,0> translate<19.694500,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.643600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.344500>}
box{<0,0,-0.127000><0.299100,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.878600,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.643600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843100,-1.535000,8.643600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.878600,-1.535000,8.643600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.796200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843100,-1.535000,8.796200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.878600,-1.535000,8.796200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,9.151300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,8.796200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.878600,-1.535000,8.796200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.878600,-1.535000,9.151300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.488600,-1.535000,9.761300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.878600,-1.535000,9.151300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.488600,-1.535000,9.761300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,9.761300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.488600,-1.535000,9.761300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,28.621500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.800300,-1.535000,28.014700>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,67.499155,0> translate<20.549000,-1.535000,28.621500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,29.278400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,28.621500>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.549000,-1.535000,28.621500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.549000,-1.535000,29.278400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.800300,-1.535000,29.885200>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-67.499155,0> translate<20.549000,-1.535000,29.278400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<20.589800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.589800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,19.898300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.589800,-1.535000,19.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,25.837200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,24.899800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<20.589800,-1.535000,25.837200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,27.162700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,25.837200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.589800,-1.535000,25.837200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.589800,-1.535000,27.162700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,27.518300>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.589800,-1.535000,27.162700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.652700,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,30.917200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.652700,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.652700,-1.535000,33.180100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,32.242700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<20.652700,-1.535000,33.180100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.800300,-1.535000,28.014700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,27.869600>}
box{<0,0,-0.127000><0.205202,0.035000,0.127000> rotate<0,44.997030,0> translate<20.800300,-1.535000,28.014700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.800300,-1.535000,29.885200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.264700,-1.535000,30.349600>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.800300,-1.535000,29.885200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.812800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,33.020000>}
box{<0,0,-0.127000><8.122600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.812800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843100,-1.535000,8.796200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843100,-1.535000,8.643600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.843100,-1.535000,8.643600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,8.796800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,9.761300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.843600,-1.535000,9.761300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,8.796800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,8.796800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.843600,-1.535000,8.796800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,8.890000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.843600,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,9.144000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.843600,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,9.398000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.843600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.843600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,9.652000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.843600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.898900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.141100,-1.535000,30.226000>}
box{<0,0,-0.127000><0.242200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.898900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,19.898300>}
box{<0,0,-0.127000><1.547100,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.945400,-1.535000,19.898300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,27.869600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.945400,-1.535000,27.518300>}
box{<0,0,-0.127000><0.351300,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.945400,-1.535000,27.518300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,9.761300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,8.796800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.996200,-1.535000,8.796800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996200,-1.535000,9.761300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.351300,-1.535000,9.761300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.996200,-1.535000,9.761300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996800,-1.535000,8.643600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996800,-1.535000,8.796200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.996800,-1.535000,8.796200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996800,-1.535000,8.643600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.643600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.996800,-1.535000,8.643600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.996800,-1.535000,8.796200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.796200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.996800,-1.535000,8.796200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.066800,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,32.766000>}
box{<0,0,-0.127000><7.868600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.066800,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.368600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.758600,-1.535000,12.758600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<21.148600,-1.535000,13.368600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.368600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.148600,-1.535000,13.368600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113100,-1.535000,13.723600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.148600,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113100,-1.535000,13.876200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.148600,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,14.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,13.876200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.148600,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.148600,-1.535000,14.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.758600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.148600,-1.535000,14.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.152900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.579600,-1.535000,30.480000>}
box{<0,0,-0.127000><0.426700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.152900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.171700,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,24.290100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<21.171700,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.218200,-1.535000,41.765400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.524000,-1.535000,41.459600>}
box{<0,0,-0.127000><0.432467,0.035000,0.127000> rotate<0,44.997030,0> translate<21.218200,-1.535000,41.765400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.218200,-1.535000,44.254500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.524000,-1.535000,44.560300>}
box{<0,0,-0.127000><0.432467,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.218200,-1.535000,44.254500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.264700,-1.535000,30.349600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.871500,-1.535000,30.600900>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<21.264700,-1.535000,30.349600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.320800,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.819100,-1.535000,32.512000>}
box{<0,0,-0.127000><7.498300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.320800,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.351300,-1.535000,9.761300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,9.151300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<21.351300,-1.535000,9.761300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.406900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.733000,-1.535000,30.734000>}
box{<0,0,-0.127000><7.326100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.406900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.460600,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,9.652000>}
box{<0,0,-0.127000><5.732500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.460600,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.524000,-1.535000,41.459600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.196100,-1.535000,41.181200>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,22.499029,0> translate<21.524000,-1.535000,41.459600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.524000,-1.535000,44.560300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.196100,-1.535000,44.838700>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<21.524000,-1.535000,44.560300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.527200,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,24.290100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,24.290100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.527200,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.527200,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,24.899800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.527200,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.574800,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.565100,-1.535000,32.258000>}
box{<0,0,-0.127000><6.990300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.574800,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,30.917200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,32.242700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<21.590100,-1.535000,32.242700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,30.988000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590100,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,31.242000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590100,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,31.496000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590100,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,31.750000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590100,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590100,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,32.004000>}
box{<0,0,-0.127000><6.959700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590100,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.714600,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.398000>}
box{<0,0,-0.127000><4.374300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.714600,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.758600,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,12.758600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.758600,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.758600,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.758600,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.871500,-1.535000,30.600900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.528400,-1.535000,30.600900>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.871500,-1.535000,30.600900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.643600>}
box{<0,0,-0.127000><0.299100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.961300,-1.535000,8.643600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.004100,-1.535000,8.344500>}
box{<0,0,-0.127000><4.042800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.961300,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.041600,-1.535000,8.382000>}
box{<0,0,-0.127000><4.080300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.961300,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.311300,-1.535000,8.636000>}
box{<0,0,-0.127000><4.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.961300,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.796200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,9.151300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.961300,-1.535000,9.151300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.399700,-1.535000,8.890000>}
box{<0,0,-0.127000><4.438400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.961300,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.961300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.145700,-1.535000,9.144000>}
box{<0,0,-0.127000><4.184400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.961300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113100,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113100,-1.535000,13.723600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.113100,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.723100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<22.113600,-1.535000,13.723100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,12.954000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.208000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.462000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.716000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.723100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.723100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.723100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.876800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<22.113600,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.876800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.876800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.876800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.970000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,14.224000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,14.478000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.113600,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,14.732000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.113600,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.164400,-1.535000,39.174500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.244900,-1.535000,41.255000>}
box{<0,0,-0.127000><2.942271,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.164400,-1.535000,39.174500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.196100,-1.535000,41.181200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.923800,-1.535000,41.181200>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.196100,-1.535000,41.181200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.196100,-1.535000,44.838700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.923800,-1.535000,44.838700>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.196100,-1.535000,44.838700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.621300,-1.535000,12.758600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.266200,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.723100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,12.758600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.266200,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,13.876800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.266200,-1.535000,13.876800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266200,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.621300,-1.535000,14.841300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.266200,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266800,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266800,-1.535000,13.876200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<22.266800,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266800,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.723600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.266800,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.266800,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.876200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.266800,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.432400,-1.535000,36.685400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.927500,-1.535000,36.685400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.432400,-1.535000,36.685400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.528400,-1.535000,30.600900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.135200,-1.535000,30.349600>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<22.528400,-1.535000,30.600900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.621300,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.368600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.621300,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.621300,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,14.231300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<22.621300,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.730600,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.729300,-1.535000,14.732000>}
box{<0,0,-0.127000><3.998700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.730600,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.816700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.643200,-1.535000,12.954000>}
box{<0,0,-0.127000><3.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.816700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.820400,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.987000,-1.535000,30.480000>}
box{<0,0,-0.127000><6.166600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.820400,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.852700,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,24.290100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,23.352700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<22.852700,-1.535000,24.290100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852700,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.208200,-1.535000,25.255400>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<22.852700,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.923800,-1.535000,41.181200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.595900,-1.535000,41.459600>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<22.923800,-1.535000,41.181200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.923800,-1.535000,44.838700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.595900,-1.535000,44.560300>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,22.499029,0> translate<22.923800,-1.535000,44.838700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.927500,-1.535000,36.685400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.385000,-1.535000,36.874900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<22.927500,-1.535000,36.685400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.984600,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.475300,-1.535000,14.478000>}
box{<0,0,-0.127000><3.490700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.984600,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.012800,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.527200,-1.535000,24.130000>}
box{<0,0,-0.127000><8.514400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.012800,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.070700,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.389200,-1.535000,13.208000>}
box{<0,0,-0.127000><3.318500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.070700,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.098800,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.791000,-1.535000,25.146000>}
box{<0,0,-0.127000><0.692200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.098800,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.098900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.361000,-1.535000,17.526000>}
box{<0,0,-0.127000><3.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.098900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.135200,-1.535000,30.349600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.599600,-1.535000,29.885200>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,44.997030,0> translate<23.135200,-1.535000,30.349600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.208200,-1.535000,25.255400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.681700,-1.535000,25.255400>}
box{<0,0,-0.127000><0.473500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.208200,-1.535000,25.255400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.368600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.723600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.231300,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.462000>}
box{<0,0,-0.127000><2.997300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.231300,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.716000>}
box{<0,0,-0.127000><2.997300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.231300,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,14.231300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<23.231300,-1.535000,14.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.970000>}
box{<0,0,-0.127000><2.997300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.231300,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.231300,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,14.224000>}
box{<0,0,-0.127000><2.997300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.231300,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.249000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.616700,-1.535000,44.704000>}
box{<0,0,-0.127000><40.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.249000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.258800,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.241000,-1.535000,30.226000>}
box{<0,0,-0.127000><5.982200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.258800,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.266800,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.751200,-1.535000,23.876000>}
box{<0,0,-0.127000><5.484400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.266800,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.276600,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.033700,-1.535000,36.830000>}
box{<0,0,-0.127000><5.757100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.276600,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.352900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.107000,-1.535000,17.780000>}
box{<0,0,-0.127000><2.754100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.352900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.385000,-1.535000,36.874900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.815500,-1.535000,39.305400>}
box{<0,0,-0.127000><3.437246,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.385000,-1.535000,36.874900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,19.898300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,21.671700>}
box{<0,0,-0.127000><1.773400,0.035000,0.127000> rotate<0,90.000000,0> translate<23.434500,-1.535000,21.671700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,19.898300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,19.542700>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<23.434500,-1.535000,19.898300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,20.066000>}
box{<0,0,-0.127000><2.570900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,20.320000>}
box{<0,0,-0.127000><2.570900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,20.574000>}
box{<0,0,-0.127000><2.570900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,20.828000>}
box{<0,0,-0.127000><2.570900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.019700,-1.535000,21.082000>}
box{<0,0,-0.127000><2.585200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.124900,-1.535000,21.336000>}
box{<0,0,-0.127000><2.690400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.279900,-1.535000,21.590000>}
box{<0,0,-0.127000><2.845400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,21.671700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.027200>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-44.988973,0> translate<23.434500,-1.535000,21.671700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,27.849600>}
box{<0,0,-0.127000><0.105100,0.035000,0.127000> rotate<0,90.000000,0> translate<23.434500,-1.535000,27.849600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.681700,-1.535000,27.744500>}
box{<0,0,-0.127000><0.247200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.434500,-1.535000,27.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.434500,-1.535000,27.849600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.599600,-1.535000,28.014700>}
box{<0,0,-0.127000><0.233487,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.434500,-1.535000,27.849600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.456800,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.391900,-1.535000,41.402000>}
box{<0,0,-0.127000><0.935100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.456800,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.512800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.997800,-1.535000,29.972000>}
box{<0,0,-0.127000><6.485000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.512800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.520800,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.939200,-1.535000,19.812000>}
box{<0,0,-0.127000><2.418400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.520800,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.520800,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311900,-1.535000,23.622000>}
box{<0,0,-0.127000><4.791100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.520800,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.524900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.877200,-1.535000,27.940000>}
box{<0,0,-0.127000><0.352300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.524900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.594100,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.491000,-1.535000,37.084000>}
box{<0,0,-0.127000><5.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.594100,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.595900,-1.535000,41.459600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.110300,-1.535000,41.974000>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.595900,-1.535000,41.459600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.595900,-1.535000,44.560300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.110300,-1.535000,44.045900>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,44.997030,0> translate<23.595900,-1.535000,44.560300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.599600,-1.535000,28.014700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,28.621500>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-67.499155,0> translate<23.599600,-1.535000,28.014700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.599600,-1.535000,29.885200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,29.278400>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,67.499155,0> translate<23.599600,-1.535000,29.885200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.606800,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.533900,-1.535000,21.844000>}
box{<0,0,-0.127000><2.927100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.606800,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.606900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.853000,-1.535000,18.034000>}
box{<0,0,-0.127000><2.246100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.606900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.668900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,29.718000>}
box{<0,0,-0.127000><6.506500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.668900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.673800,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.666500,-1.535000,28.194000>}
box{<0,0,-0.127000><5.992700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.673800,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.681700,-1.535000,25.255400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.037200,-1.535000,24.899800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<23.681700,-1.535000,25.255400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.681700,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.037200,-1.535000,28.100100>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,-45.005087,0> translate<23.681700,-1.535000,27.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.706200,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.870700,-1.535000,44.450000>}
box{<0,0,-0.127000><40.164500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.706200,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.774100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,29.464000>}
box{<0,0,-0.127000><6.401300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.774100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.774800,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.685200,-1.535000,19.558000>}
box{<0,0,-0.127000><1.910400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.774800,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.774800,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.057900,-1.535000,23.368000>}
box{<0,0,-0.127000><4.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.774800,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.779000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.905900,-1.535000,28.448000>}
box{<0,0,-0.127000><6.126900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.779000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,19.542700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<23.790100,-1.535000,19.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,18.288000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,18.542000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,18.796000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,19.050000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,19.304000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.027200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,23.352700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<23.790100,-1.535000,23.352700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.787900,-1.535000,22.098000>}
box{<0,0,-0.127000><2.997800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.041900,-1.535000,22.352000>}
box{<0,0,-0.127000><3.251800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.295900,-1.535000,22.606000>}
box{<0,0,-0.127000><3.505800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.549900,-1.535000,22.860000>}
box{<0,0,-0.127000><3.759800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.790100,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.803900,-1.535000,23.114000>}
box{<0,0,-0.127000><4.013800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.790100,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.792300,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.718100,-1.535000,41.656000>}
box{<0,0,-0.127000><0.925800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.792300,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.848100,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,37.338000>}
box{<0,0,-0.127000><39.207300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.848100,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,28.621500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,29.278400>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,90.000000,0> translate<23.850900,-1.535000,29.278400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.145300,-1.535000,28.702000>}
box{<0,0,-0.127000><6.294400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.850900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,28.956000>}
box{<0,0,-0.127000><6.324500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.850900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.850900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,29.210000>}
box{<0,0,-0.127000><6.324500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.850900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.960200,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.131200,-1.535000,44.196000>}
box{<0,0,-0.127000><40.171000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.960200,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.037200,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.362700,-1.535000,24.899800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.037200,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.037200,-1.535000,28.100100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.362700,-1.535000,28.100100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.037200,-1.535000,28.100100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.046300,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.167200,-1.535000,41.910000>}
box{<0,0,-0.127000><13.120900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.046300,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.102100,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,37.592000>}
box{<0,0,-0.127000><38.953300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.102100,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.110300,-1.535000,41.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,42.646100>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<24.110300,-1.535000,41.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.110300,-1.535000,44.045900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,43.373800>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<24.110300,-1.535000,44.045900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.153400,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.571200,-1.535000,43.942000>}
box{<0,0,-0.127000><40.417800,0.035000,0.127000> rotate<0,0.000000,0> translate<24.153400,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.189000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.272400,-1.535000,42.164000>}
box{<0,0,-0.127000><13.083400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.189000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.244900,-1.535000,41.255000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.594900,-1.535000,41.605000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.244900,-1.535000,41.255000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.258600,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.323000,-1.535000,43.688000>}
box{<0,0,-0.127000><41.064400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.258600,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.294200,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.519400,-1.535000,42.418000>}
box{<0,0,-0.127000><13.225200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.294200,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.356100,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.571000,-1.535000,37.846000>}
box{<0,0,-0.127000><31.214900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.356100,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.363800,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,43.434000>}
box{<0,0,-0.127000><43.343200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.363800,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,42.646100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,43.373800>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,90.000000,0> translate<24.388700,-1.535000,43.373800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.798000,-1.535000,42.672000>}
box{<0,0,-0.127000><13.409300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.388700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,42.926000>}
box{<0,0,-0.127000><43.318300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.388700,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.388700,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,43.180000>}
box{<0,0,-0.127000><43.318300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.388700,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.594900,-1.535000,41.605000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.052400,-1.535000,41.794500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<24.594900,-1.535000,41.605000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.610100,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.106700,-1.535000,38.100000>}
box{<0,0,-0.127000><13.496600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.610100,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.864100,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.647300,-1.535000,38.354000>}
box{<0,0,-0.127000><12.783200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.864100,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.052400,-1.535000,41.794500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.119300,-1.535000,41.794500>}
box{<0,0,-0.127000><12.066900,0.035000,0.127000> rotate<0,0.000000,0> translate<25.052400,-1.535000,41.794500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.118100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.393300,-1.535000,38.608000>}
box{<0,0,-0.127000><12.275200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.118100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.362700,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,25.837200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.362700,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.362700,-1.535000,28.100100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,27.162700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<25.362700,-1.535000,28.100100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.372100,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.220100,-1.535000,38.862000>}
box{<0,0,-0.127000><11.848000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.372100,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.522800,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.957100,-1.535000,27.940000>}
box{<0,0,-0.127000><3.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<25.522800,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.608900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.871000,-1.535000,25.146000>}
box{<0,0,-0.127000><3.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<25.608900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.626100,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.114900,-1.535000,39.116000>}
box{<0,0,-0.127000><11.488800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.626100,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.607200,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<25.669800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.669800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.669800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,19.878200>}
box{<0,0,-0.127000><0.474539,0.035000,0.127000> rotate<0,-44.988493,0> translate<25.669800,-1.535000,19.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.776800,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.703100,-1.535000,27.686000>}
box{<0,0,-0.127000><2.926300,0.035000,0.127000> rotate<0,0.000000,0> translate<25.776800,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.815500,-1.535000,39.305400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.036500,-1.535000,39.305400>}
box{<0,0,-0.127000><11.221000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.815500,-1.535000,39.305400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.862900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.617000,-1.535000,25.400000>}
box{<0,0,-0.127000><2.754100,0.035000,0.127000> rotate<0,0.000000,0> translate<25.862900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.004100,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.284400,-1.535000,8.624900>}
box{<0,0,-0.127000><0.396475,0.035000,0.127000> rotate<0,-45.007248,0> translate<26.004100,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,21.047500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,19.878200>}
box{<0,0,-0.127000><1.169300,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.005400,-1.535000,19.878200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.005400,-1.535000,21.047500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.194900,-1.535000,21.505000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<26.005400,-1.535000,21.047500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.030800,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.449100,-1.535000,27.432000>}
box{<0,0,-0.127000><2.418300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.030800,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.200800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.553400,-1.535000,8.736300>}
box{<0,0,-0.127000><0.656902,0.035000,0.127000> rotate<0,44.997030,0> translate<26.088900,-1.535000,9.200800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.613600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.200800>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.088900,-1.535000,9.200800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.613600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,9.613600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<26.088900,-1.535000,9.613600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.766200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,9.766200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<26.088900,-1.535000,9.766200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,10.179100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,9.766200>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.088900,-1.535000,9.766200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.088900,-1.535000,10.179100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.780800,-1.535000,10.871000>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.088900,-1.535000,10.179100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.116900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.363000,-1.535000,25.654000>}
box{<0,0,-0.127000><2.246100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.116900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.194900,-1.535000,21.505000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.544900,-1.535000,21.855000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.194900,-1.535000,21.505000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.368600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.838600,-1.535000,12.758600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<26.228600,-1.535000,13.368600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.368600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.228600,-1.535000,13.368600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,13.723600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.228600,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,13.876200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.228600,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,14.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,13.876200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.228600,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.228600,-1.535000,14.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.838600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.228600,-1.535000,14.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.284400,-1.535000,8.624900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.553400,-1.535000,8.736300>}
box{<0,0,-0.127000><0.291155,0.035000,0.127000> rotate<0,-22.494252,0> translate<26.284400,-1.535000,8.624900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.284800,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.195100,-1.535000,27.178000>}
box{<0,0,-0.127000><1.910300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.284800,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,25.837200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,27.162700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.300100,-1.535000,27.162700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,25.908000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.300100,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,26.162000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.300100,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,26.416000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.300100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,26.670000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.300100,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.300100,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,26.924000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.300100,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.544900,-1.535000,21.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.434900,-1.535000,23.745000>}
box{<0,0,-0.127000><2.672864,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.544900,-1.535000,21.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.607200,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.932700,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.607200,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.780800,-1.535000,10.871000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,10.871000>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.780800,-1.535000,10.871000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.838600,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,12.758600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.838600,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.838600,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.838600,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,9.766200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,9.613600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.193100,-1.535000,9.613600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193100,-1.535000,13.723600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.193100,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,9.766800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,10.871000>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,90.000000,0> translate<27.193600,-1.535000,10.871000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,9.766800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,9.766800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,9.766800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,9.906000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,10.160000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,10.414000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,10.668000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.723100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.193600,-1.535000,13.723100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,12.954000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.208000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.462000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.716000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.723100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.723100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.723100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.876800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,14.841300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.193600,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.876800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.876800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.876800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.970000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,14.224000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,14.478000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.193600,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,14.732000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.193600,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,10.871000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,9.766800>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.346200,-1.535000,9.766800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,10.871000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.759100,-1.535000,10.871000>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346200,-1.535000,10.871000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.701300,-1.535000,12.758600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346200,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.723100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,12.758600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.346200,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,13.876800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.346200,-1.535000,13.876800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346200,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.701300,-1.535000,14.841300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346200,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,9.613600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,9.766200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<27.346800,-1.535000,9.766200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,9.613600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.613600>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346800,-1.535000,9.613600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.019100,-1.535000,9.652000>}
box{<0,0,-0.127000><3.672300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346800,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,9.766200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.766200>}
box{<0,0,-0.127000><1.104200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346800,-1.535000,9.766200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,13.876200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<27.346800,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,13.723600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.723600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346800,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.346800,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.876200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.346800,-1.535000,13.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.701300,-1.535000,12.758600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.368600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.701300,-1.535000,12.758600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.701300,-1.535000,14.841300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,14.231300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<27.701300,-1.535000,14.841300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.759100,-1.535000,10.871000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,10.179100>}
box{<0,0,-0.127000><0.978494,0.035000,0.127000> rotate<0,44.997030,0> translate<27.759100,-1.535000,10.871000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.810600,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.920800,-1.535000,14.732000>}
box{<0,0,-0.127000><6.110200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.810600,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.896700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.194000,-1.535000,12.954000>}
box{<0,0,-0.127000><12.297300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.896700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.932700,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.932700,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.962100,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.305100,-1.535000,10.668000>}
box{<0,0,-0.127000><5.343000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.962100,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.986500,-1.535000,8.736300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.255500,-1.535000,8.624900>}
box{<0,0,-0.127000><0.291155,0.035000,0.127000> rotate<0,22.494252,0> translate<27.986500,-1.535000,8.736300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.986500,-1.535000,8.736300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.200800>}
box{<0,0,-0.127000><0.656902,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.986500,-1.535000,8.736300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.064600,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.026000,-1.535000,14.478000>}
box{<0,0,-0.127000><5.961400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.064600,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,8.890000>}
box{<0,0,-0.127000><2.609600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.140200,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.150700,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.208000>}
box{<0,0,-0.127000><12.204700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.150700,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.178900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.441000,-1.535000,17.526000>}
box{<0,0,-0.127000><3.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.178900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,25.837200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.117200,-1.535000,24.899800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<28.179800,-1.535000,25.837200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,27.162700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,25.837200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.179800,-1.535000,25.837200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.179800,-1.535000,27.162700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.117200,-1.535000,28.100100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.179800,-1.535000,27.162700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.216100,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.414000>}
box{<0,0,-0.127000><5.073700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.216100,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.228700,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,8.636000>}
box{<0,0,-0.127000><2.521100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.228700,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.255500,-1.535000,8.624900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.535900,-1.535000,8.344500>}
box{<0,0,-0.127000><0.396545,0.035000,0.127000> rotate<0,44.997030,0> translate<28.255500,-1.535000,8.624900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.368600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.723600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.311300,-1.535000,13.723600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.462000>}
box{<0,0,-0.127000><12.044100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.311300,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.609800,-1.535000,13.716000>}
box{<0,0,-0.127000><6.298500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.311300,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,14.231300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<28.311300,-1.535000,14.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.351900,-1.535000,13.970000>}
box{<0,0,-0.127000><6.040600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.311300,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.311300,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.131200,-1.535000,14.224000>}
box{<0,0,-0.127000><5.819900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.311300,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.026100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.629600,-1.535000,34.354000>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<28.351200,-1.535000,35.026100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.753800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.026100>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.351200,-1.535000,35.026100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.351200,-1.535000,35.753800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.629600,-1.535000,36.425900>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<28.351200,-1.535000,35.753800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.394200,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,9.144000>}
box{<0,0,-0.127000><2.355600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.394200,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.432900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.187000,-1.535000,17.780000>}
box{<0,0,-0.127000><2.754100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.432900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.434900,-1.535000,23.745000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.892400,-1.535000,23.934500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<28.434900,-1.535000,23.745000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.200800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.613600>}
box{<0,0,-0.127000><0.412800,0.035000,0.127000> rotate<0,90.000000,0> translate<28.451000,-1.535000,9.613600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.765100,-1.535000,9.398000>}
box{<0,0,-0.127000><2.314100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.451000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.766200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,10.179100>}
box{<0,0,-0.127000><0.412900,0.035000,0.127000> rotate<0,90.000000,0> translate<28.451000,-1.535000,10.179100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.273100,-1.535000,9.906000>}
box{<0,0,-0.127000><2.822100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.451000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.451000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.527100,-1.535000,10.160000>}
box{<0,0,-0.127000><3.076100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.451000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494500,-1.535000,19.918200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494500,-1.535000,20.284400>}
box{<0,0,-0.127000><0.366200,0.035000,0.127000> rotate<0,90.000000,0> translate<28.494500,-1.535000,20.284400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494500,-1.535000,19.918200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,19.542700>}
box{<0,0,-0.127000><0.531108,0.035000,0.127000> rotate<0,44.989402,0> translate<28.494500,-1.535000,19.918200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494500,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.273100,-1.535000,20.066000>}
box{<0,0,-0.127000><2.778600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.494500,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494500,-1.535000,20.284400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.655500,-1.535000,21.445400>}
box{<0,0,-0.127000><1.641902,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.494500,-1.535000,20.284400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.498400,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,8.382000>}
box{<0,0,-0.127000><2.251400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.498400,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.530100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.527100,-1.535000,20.320000>}
box{<0,0,-0.127000><2.997000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.530100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.535900,-1.535000,8.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,8.344500>}
box{<0,0,-0.127000><2.213900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.535900,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,30.917200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.487200,-1.535000,29.979800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<28.549800,-1.535000,30.917200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,32.242700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,30.917200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.549800,-1.535000,30.917200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.549800,-1.535000,32.242700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,32.628300>}
box{<0,0,-0.127000><0.545321,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.549800,-1.535000,32.242700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.600800,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.019100,-1.535000,19.812000>}
box{<0,0,-0.127000><2.418300,0.035000,0.127000> rotate<0,0.000000,0> translate<28.600800,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.629600,-1.535000,34.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,34.048300>}
box{<0,0,-0.127000><0.432396,0.035000,0.127000> rotate<0,44.987661,0> translate<28.629600,-1.535000,34.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.629600,-1.535000,36.425900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.144000,-1.535000,36.940300>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.629600,-1.535000,36.425900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.686900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.933000,-1.535000,18.034000>}
box{<0,0,-0.127000><2.246100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.686900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.784100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.284000,-1.535000,20.574000>}
box{<0,0,-0.127000><3.499900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.784100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.854800,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.765100,-1.535000,19.558000>}
box{<0,0,-0.127000><1.910300,0.035000,0.127000> rotate<0,0.000000,0> translate<28.854800,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,19.542700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<28.870100,-1.535000,19.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,18.288000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.870100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,18.542000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.870100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,18.796000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.870100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,19.050000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.870100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.870100,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,19.304000>}
box{<0,0,-0.127000><1.879700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.870100,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.892400,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.387500,-1.535000,23.934500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.892400,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,34.048300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,32.628300>}
box{<0,0,-0.127000><1.420000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.935400,-1.535000,32.628300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.038100,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.538000,-1.535000,20.828000>}
box{<0,0,-0.127000><3.499900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.038100,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.117200,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.442700,-1.535000,24.899800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.117200,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.117200,-1.535000,28.100100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.578000,-1.535000,28.100100>}
box{<0,0,-0.127000><0.460800,0.035000,0.127000> rotate<0,0.000000,0> translate<29.117200,-1.535000,28.100100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.144000,-1.535000,36.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.816100,-1.535000,37.218700>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<29.144000,-1.535000,36.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.292100,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.792000,-1.535000,21.082000>}
box{<0,0,-0.127000><3.499900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.292100,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.387500,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.331700,-1.535000,23.934500>}
box{<0,0,-0.127000><1.944200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.387500,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.487200,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.990000,-1.535000,29.979800>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<29.487200,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.546100,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.441000,-1.535000,21.336000>}
box{<0,0,-0.127000><1.894900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.546100,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.578000,-1.535000,28.100100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,28.734000>}
box{<0,0,-0.127000><0.871043,0.035000,0.127000> rotate<0,-46.694866,0> translate<29.578000,-1.535000,28.100100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.655500,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.331700,-1.535000,21.445400>}
box{<0,0,-0.127000><1.676200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.655500,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.816100,-1.535000,37.218700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.543800,-1.535000,37.218700>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.816100,-1.535000,37.218700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.990000,-1.535000,29.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,29.794400>}
box{<0,0,-0.127000><0.262195,0.035000,0.127000> rotate<0,44.997030,0> translate<29.990000,-1.535000,29.979800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,29.794400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.175400,-1.535000,28.734000>}
box{<0,0,-0.127000><1.060400,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.175400,-1.535000,28.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.442700,-1.535000,24.899800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,25.837200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.442700,-1.535000,24.899800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.543800,-1.535000,37.218700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.215900,-1.535000,36.940300>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,22.499029,0> translate<30.543800,-1.535000,37.218700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.688900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.146000>}
box{<0,0,-0.127000><0.700900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.688900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,9.382700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,8.344500>}
box{<0,0,-0.127000><1.038200,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.749800,-1.535000,8.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,9.382700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,10.320100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.749800,-1.535000,9.382700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<30.749800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.749800,-1.535000,18.217200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.749800,-1.535000,19.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,20.480100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.749800,-1.535000,19.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.869000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,37.084000>}
box{<0,0,-0.127000><32.186400,0.035000,0.127000> rotate<0,0.000000,0> translate<30.869000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.942900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.400000>}
box{<0,0,-0.127000><0.446900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.942900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.196900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.654000>}
box{<0,0,-0.127000><0.192900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.196900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.215900,-1.535000,36.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.730300,-1.535000,36.425900>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,44.997030,0> translate<31.215900,-1.535000,36.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.326200,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.147200,-1.535000,36.830000>}
box{<0,0,-0.127000><0.821000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.326200,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.331700,-1.535000,21.445400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,21.089800>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<31.331700,-1.535000,21.445400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.331700,-1.535000,23.934500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687100,-1.535000,24.289900>}
box{<0,0,-0.127000><0.502612,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.331700,-1.535000,23.934500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,25.837200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,26.383200>}
box{<0,0,-0.127000><0.546000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.380100,-1.535000,26.383200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.009700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.380100,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.639100,-1.535000,26.162000>}
box{<0,0,-0.127000><0.259000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.380100,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.380100,-1.535000,26.383200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.312600,-1.535000,27.372600>}
box{<0,0,-0.127000><1.359584,0.035000,0.127000> rotate<0,-46.692729,0> translate<31.380100,-1.535000,26.383200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687100,-1.535000,24.289900>}
box{<0,0,-0.127000><0.420446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.389800,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.912700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,24.587200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.389800,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.389800,-1.535000,25.912700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.327200,-1.535000,26.850100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.389800,-1.535000,25.912700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.411000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.893100,-1.535000,26.416000>}
box{<0,0,-0.127000><0.482100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.411000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.580200,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.893200,-1.535000,36.576000>}
box{<0,0,-0.127000><0.313000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.580200,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.650400,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.147100,-1.535000,26.670000>}
box{<0,0,-0.127000><0.496700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.650400,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,10.320100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012700,-1.535000,10.320100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.687200,-1.535000,10.320100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012700,-1.535000,17.279800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.687200,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,20.480100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.190000,-1.535000,20.480100>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.687200,-1.535000,20.480100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.687200,-1.535000,21.089800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799800,-1.535000,21.089800>}
box{<0,0,-0.127000><1.112600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.687200,-1.535000,21.089800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.730300,-1.535000,36.425900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.734000,-1.535000,36.416800>}
box{<0,0,-0.127000><0.009823,0.035000,0.127000> rotate<0,67.869186,0> translate<31.730300,-1.535000,36.425900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.734000,-1.535000,36.416800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.327200,-1.535000,37.010100>}
box{<0,0,-0.127000><0.838982,0.035000,0.127000> rotate<0,-45.001859,0> translate<31.734000,-1.535000,36.416800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889700,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.131200,-1.535000,26.924000>}
box{<0,0,-0.127000><2.241500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.889700,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.129100,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.026000,-1.535000,27.178000>}
box{<0,0,-0.127000><1.896900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.129100,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.190000,-1.535000,20.480100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799800,-1.535000,21.089800>}
box{<0,0,-0.127000><0.862317,0.035000,0.127000> rotate<0,-44.992332,0> translate<32.190000,-1.535000,20.480100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.312600,-1.535000,27.372600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.475000,-1.535000,27.534900>}
box{<0,0,-0.127000><0.229598,0.035000,0.127000> rotate<0,-44.979386,0> translate<32.312600,-1.535000,27.372600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.327200,-1.535000,26.850100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.652700,-1.535000,26.850100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.327200,-1.535000,26.850100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.327200,-1.535000,37.010100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.652700,-1.535000,37.010100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.327200,-1.535000,37.010100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.372000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.920800,-1.535000,27.432000>}
box{<0,0,-0.127000><1.548800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.372000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.475000,-1.535000,27.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.482300,-1.535000,27.552600>}
box{<0,0,-0.127000><0.019146,0.035000,0.127000> rotate<0,-67.582850,0> translate<32.475000,-1.535000,27.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.482300,-1.535000,27.552600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.495400,-1.535000,27.566500>}
box{<0,0,-0.127000><0.019100,0.035000,0.127000> rotate<0,-46.694074,0> translate<32.482300,-1.535000,27.552600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.495400,-1.535000,27.566500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.577300,-1.535000,27.782000>}
box{<0,0,-0.127000><0.230538,0.035000,0.127000> rotate<0,-69.186319,0> translate<32.495400,-1.535000,27.566500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.540800,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,27.686000>}
box{<0,0,-0.127000><1.371400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.540800,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.577300,-1.535000,27.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,27.992400>}
box{<0,0,-0.127000><0.227754,0.035000,0.127000> rotate<0,-67.484049,0> translate<32.577300,-1.535000,27.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.642700,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,27.940000>}
box{<0,0,-0.127000><1.269500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.642700,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,27.992400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.011400>}
box{<0,0,-0.127000><0.019000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.664500,-1.535000,28.011400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.011400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.671300,-1.535000,28.029300>}
box{<0,0,-0.127000><0.019148,0.035000,0.127000> rotate<0,-69.194236,0> translate<32.664500,-1.535000,28.011400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.259500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,29.065400>}
box{<0,0,-0.127000><0.805900,0.035000,0.127000> rotate<0,90.000000,0> translate<32.664500,-1.535000,29.065400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.259500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.671300,-1.535000,28.029300>}
box{<0,0,-0.127000><0.230300,0.035000,0.127000> rotate<0,88.302174,0> translate<32.664500,-1.535000,28.259500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061800,-1.535000,28.448000>}
box{<0,0,-0.127000><1.397300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.184000,-1.535000,28.702000>}
box{<0,0,-0.127000><1.519500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664500,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.438000,-1.535000,28.956000>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664500,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664500,-1.535000,29.065400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.496600,-1.535000,29.065400>}
box{<0,0,-0.127000><1.832100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664500,-1.535000,29.065400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.666500,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.956600,-1.535000,28.194000>}
box{<0,0,-0.127000><1.290100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.666500,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012700,-1.535000,10.320100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.042900>}
box{<0,0,-0.127000><0.391949,0.035000,0.127000> rotate<0,45.007366,0> translate<33.012700,-1.535000,10.320100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012700,-1.535000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.217200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.012700,-1.535000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.172800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.160000>}
box{<0,0,-0.127000><0.117000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.172800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.258900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.526000>}
box{<0,0,-0.127000><0.653300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.258900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.652700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.042900>}
box{<0,0,-0.127000><0.609800,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.289800,-1.535000,10.042900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.289800,-1.535000,10.652700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.227200,-1.535000,11.590100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.289800,-1.535000,10.652700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.512900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.780000>}
box{<0,0,-0.127000><0.399300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.512900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.652700,-1.535000,26.850100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.008200,-1.535000,26.494500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<33.652700,-1.535000,26.850100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.652700,-1.535000,37.010100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.008200,-1.535000,36.654500>}
box{<0,0,-0.127000><0.502824,0.035000,0.127000> rotate<0,45.005087,0> translate<33.652700,-1.535000,37.010100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.766900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.956600,-1.535000,18.034000>}
box{<0,0,-0.127000><0.189700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.766900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.832800,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.351900,-1.535000,26.670000>}
box{<0,0,-0.127000><0.519100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.832800,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.832800,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.467100,-1.535000,36.830000>}
box{<0,0,-0.127000><25.634300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.832800,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,14.752900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,14.167100>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<33.912200,-1.535000,14.752900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,15.387000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,14.752900>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.912200,-1.535000,14.752900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,15.387000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,15.972800>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<33.912200,-1.535000,15.387000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.292900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,16.707100>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<33.912200,-1.535000,17.292900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.927000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.292900>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.912200,-1.535000,17.292900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,17.927000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,18.512800>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<33.912200,-1.535000,17.927000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,27.452900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,26.867100>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<33.912200,-1.535000,27.452900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,28.087000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,27.452900>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.912200,-1.535000,27.452900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.912200,-1.535000,28.087000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,28.672800>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<33.912200,-1.535000,28.087000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.217200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.720000>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,90.000000,0> translate<33.950100,-1.535000,18.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061800,-1.535000,18.288000>}
box{<0,0,-0.127000><0.111700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.950100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.184000,-1.535000,18.542000>}
box{<0,0,-0.127000><0.233900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.950100,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.950100,-1.535000,18.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.135500,-1.535000,18.905400>}
box{<0,0,-0.127000><0.262195,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.950100,-1.535000,18.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.008200,-1.535000,26.494500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.516500,-1.535000,26.494500>}
box{<0,0,-0.127000><0.508300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.008200,-1.535000,26.494500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.008200,-1.535000,36.654500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.542400,-1.535000,36.654500>}
box{<0,0,-0.127000><2.534200,0.035000,0.127000> rotate<0,0.000000,0> translate<34.008200,-1.535000,36.654500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.026100,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.438000,-1.535000,18.796000>}
box{<0,0,-0.127000><0.411900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.026100,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.135500,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.496500,-1.535000,18.905400>}
box{<0,0,-0.127000><0.361000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.135500,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,14.167100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.603100,-1.535000,13.718800>}
box{<0,0,-0.127000><0.633992,0.035000,0.127000> rotate<0,44.997030,0> translate<34.154800,-1.535000,14.167100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,15.972800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,16.340000>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.154800,-1.535000,15.972800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,16.707100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,16.340000>}
box{<0,0,-0.127000><0.519229,0.035000,0.127000> rotate<0,44.989228,0> translate<34.154800,-1.535000,16.707100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,18.512800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,18.880000>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.154800,-1.535000,18.512800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,26.867100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,26.500000>}
box{<0,0,-0.127000><0.519229,0.035000,0.127000> rotate<0,44.989228,0> translate<34.154800,-1.535000,26.867100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.154800,-1.535000,28.672800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,29.040000>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.154800,-1.535000,28.672800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.227200,-1.535000,11.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.552700,-1.535000,11.590100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.227200,-1.535000,11.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.496500,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,18.880000>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,44.884472,0> translate<34.496500,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.496600,-1.535000,29.065400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,29.040000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<34.496600,-1.535000,29.065400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.516500,-1.535000,26.494500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.522000,-1.535000,26.500000>}
box{<0,0,-0.127000><0.007778,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.516500,-1.535000,26.494500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.603100,-1.535000,13.718800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.188900,-1.535000,13.476200>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,22.494650,0> translate<34.603100,-1.535000,13.718800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.188900,-1.535000,13.476200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.131000,-1.535000,13.476200>}
box{<0,0,-0.127000><1.942100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.188900,-1.535000,13.476200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.552700,-1.535000,11.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,10.652700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<35.552700,-1.535000,11.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.712800,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.670000,-1.535000,11.430000>}
box{<0,0,-0.127000><2.957200,0.035000,0.127000> rotate<0,0.000000,0> translate<35.712800,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.966800,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.416000,-1.535000,11.176000>}
box{<0,0,-0.127000><2.449200,0.035000,0.127000> rotate<0,0.000000,0> translate<35.966800,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144500,-1.535000,8.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144500,-1.535000,8.981600>}
box{<0,0,-0.127000><0.077100,0.035000,0.127000> rotate<0,90.000000,0> translate<36.144500,-1.535000,8.981600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144500,-1.535000,8.904500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.115500>}
box{<0,0,-0.127000><5.955183,0.035000,0.127000> rotate<0,-44.997710,0> translate<36.144500,-1.535000,8.904500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144500,-1.535000,8.981600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,9.327200>}
box{<0,0,-0.127000><0.488752,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.144500,-1.535000,8.981600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.220800,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.162000,-1.535000,10.922000>}
box{<0,0,-0.127000><1.941200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.220800,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.254700,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.256600,-1.535000,3.704600>}
box{<0,0,-0.127000><0.002062,0.035000,0.127000> rotate<0,22.832147,0> translate<36.254700,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.256600,-1.535000,3.704600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.489300,-1.535000,3.705400>}
box{<0,0,-0.127000><0.232701,0.035000,0.127000> rotate<0,-0.196964,0> translate<36.256600,-1.535000,3.704600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.306900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.384000,-1.535000,9.144000>}
box{<0,0,-0.127000><0.077100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.306900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.474800,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.908000,-1.535000,10.668000>}
box{<0,0,-0.127000><1.433200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.474800,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.489300,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.747500,-1.535000,3.705400>}
box{<0,0,-0.127000><0.258200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.489300,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,9.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,10.652700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<36.490100,-1.535000,10.652700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.638000,-1.535000,9.398000>}
box{<0,0,-0.127000><0.147900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.490100,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.892000,-1.535000,9.652000>}
box{<0,0,-0.127000><0.401900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.490100,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.146000,-1.535000,9.906000>}
box{<0,0,-0.127000><0.655900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.490100,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.400000,-1.535000,10.160000>}
box{<0,0,-0.127000><0.909900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.490100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.490100,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.654000,-1.535000,10.414000>}
box{<0,0,-0.127000><1.163900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.490100,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.542400,-1.535000,36.654500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.037500,-1.535000,36.654500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.542400,-1.535000,36.654500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.747500,-1.535000,3.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.749600,-1.535000,3.706300>}
box{<0,0,-0.127000><0.002285,0.035000,0.127000> rotate<0,-23.197059,0> translate<36.747500,-1.535000,3.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.749600,-1.535000,3.706300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.751800,-1.535000,3.706300>}
box{<0,0,-0.127000><0.002200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.749600,-1.535000,3.706300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.751800,-1.535000,3.706300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.976300,-1.535000,3.800200>}
box{<0,0,-0.127000><0.243346,0.035000,0.127000> rotate<0,-22.696246,0> translate<36.751800,-1.535000,3.706300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.976300,-1.535000,3.800200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.205000,-1.535000,3.894900>}
box{<0,0,-0.127000><0.247531,0.035000,0.127000> rotate<0,-22.491963,0> translate<36.976300,-1.535000,3.800200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.999900,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.177300,-1.535000,3.810000>}
box{<0,0,-0.127000><26.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<36.999900,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.036500,-1.535000,39.305400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.277300,-1.535000,38.724000>}
box{<0,0,-0.127000><0.629294,0.035000,0.127000> rotate<0,67.497544,0> translate<37.036500,-1.535000,39.305400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.037500,-1.535000,36.654500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.495000,-1.535000,36.465000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<37.037500,-1.535000,36.654500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.119300,-1.535000,41.794500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.277300,-1.535000,42.175900>}
box{<0,0,-0.127000><0.412832,0.035000,0.127000> rotate<0,-67.493116,0> translate<37.119300,-1.535000,41.794500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.131000,-1.535000,13.476200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.716800,-1.535000,13.718800>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-22.494650,0> translate<37.131000,-1.535000,13.476200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.205000,-1.535000,3.894900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.206500,-1.535000,3.896500>}
box{<0,0,-0.127000><0.002193,0.035000,0.127000> rotate<0,-46.844519,0> translate<37.205000,-1.535000,3.894900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.206500,-1.535000,3.896500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.208600,-1.535000,3.897300>}
box{<0,0,-0.127000><0.002247,0.035000,0.127000> rotate<0,-20.853082,0> translate<37.206500,-1.535000,3.896500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.208600,-1.535000,3.897300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.382700,-1.535000,4.072700>}
box{<0,0,-0.127000><0.247136,0.035000,0.127000> rotate<0,-45.210132,0> translate<37.208600,-1.535000,3.897300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.227100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.213100,-1.535000,36.576000>}
box{<0,0,-0.127000><21.986000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.227100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.277300,-1.535000,38.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.756000,-1.535000,38.245300>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<37.277300,-1.535000,38.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.277300,-1.535000,42.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.756000,-1.535000,42.654600>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.277300,-1.535000,42.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.374000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.247000,-1.535000,4.064000>}
box{<0,0,-0.127000><25.873000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.374000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.382700,-1.535000,4.072700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.555000,-1.535000,4.244900>}
box{<0,0,-0.127000><0.243598,0.035000,0.127000> rotate<0,-44.980400,0> translate<37.382700,-1.535000,4.072700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.495000,-1.535000,36.465000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.105000,-1.535000,34.855000>}
box{<0,0,-0.127000><2.276884,0.035000,0.127000> rotate<0,44.997030,0> translate<37.495000,-1.535000,36.465000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.555000,-1.535000,4.244900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.555800,-1.535000,4.247000>}
box{<0,0,-0.127000><0.002247,0.035000,0.127000> rotate<0,-69.140979,0> translate<37.555000,-1.535000,4.244900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.555800,-1.535000,4.247000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,10.181600>}
box{<0,0,-0.127000><8.364133,0.035000,0.127000> rotate<0,-45.193676,0> translate<37.555800,-1.535000,4.247000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.626300,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.393600,-1.535000,4.318000>}
box{<0,0,-0.127000><25.767300,0.035000,0.127000> rotate<0,0.000000,0> translate<37.626300,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.638000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.160300,-1.535000,36.322000>}
box{<0,0,-0.127000><15.522300,0.035000,0.127000> rotate<0,0.000000,0> translate<37.638000,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.710000,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.716000>}
box{<0,0,-0.127000><2.645400,0.035000,0.127000> rotate<0,0.000000,0> translate<37.710000,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.716800,-1.535000,13.718800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.165100,-1.535000,14.167100>}
box{<0,0,-0.127000><0.633992,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.716800,-1.535000,13.718800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.756000,-1.535000,38.245300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.381400,-1.535000,37.986200>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<37.756000,-1.535000,38.245300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.756000,-1.535000,42.654600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.381400,-1.535000,42.913700>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<37.756000,-1.535000,42.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.797900,-1.535000,16.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.823400,-1.535000,16.365400>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,-44.884472,0> translate<37.797900,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.797900,-1.535000,16.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.165100,-1.535000,15.972800>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,44.997030,0> translate<37.797900,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.823400,-1.535000,16.365400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.962400,-1.535000,16.365400>}
box{<0,0,-0.127000><1.139000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.823400,-1.535000,16.365400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.878500,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.540300,-1.535000,4.572000>}
box{<0,0,-0.127000><25.661800,0.035000,0.127000> rotate<0,0.000000,0> translate<37.878500,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.881900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.256000>}
box{<0,0,-0.127000><2.473500,0.035000,0.127000> rotate<0,0.000000,0> translate<37.881900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.892000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.733100,-1.535000,36.068000>}
box{<0,0,-0.127000><14.841100,0.035000,0.127000> rotate<0,0.000000,0> translate<37.892000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.968000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.970000>}
box{<0,0,-0.127000><2.387400,0.035000,0.127000> rotate<0,0.000000,0> translate<37.968000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.130800,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.746800,-1.535000,4.826000>}
box{<0,0,-0.127000><25.616000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.130800,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.135900,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.002000>}
box{<0,0,-0.127000><2.219500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.135900,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.146000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.454000,-1.535000,35.814000>}
box{<0,0,-0.127000><3.308000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.146000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.165100,-1.535000,14.167100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,14.752900>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<38.165100,-1.535000,14.167100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.165100,-1.535000,15.972800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,15.387000>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<38.165100,-1.535000,15.972800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.188600,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,14.224000>}
box{<0,0,-0.127000><2.166800,0.035000,0.127000> rotate<0,0.000000,0> translate<38.188600,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.258200,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,15.748000>}
box{<0,0,-0.127000><2.097200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.258200,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.293800,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,14.478000>}
box{<0,0,-0.127000><2.061600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.293800,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.363400,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,15.494000>}
box{<0,0,-0.127000><1.992000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.363400,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.381400,-1.535000,37.986200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.058500,-1.535000,37.986200>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.381400,-1.535000,37.986200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.381400,-1.535000,42.913700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.058500,-1.535000,42.913700>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.381400,-1.535000,42.913700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.383100,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.000800,-1.535000,5.080000>}
box{<0,0,-0.127000><25.617700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.383100,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.399000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,14.732000>}
box{<0,0,-0.127000><1.956400,0.035000,0.127000> rotate<0,0.000000,0> translate<38.399000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.400000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.200000,-1.535000,35.560000>}
box{<0,0,-0.127000><2.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.400000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,14.752900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,15.387000>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,90.000000,0> translate<38.407700,-1.535000,15.387000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,14.986000>}
box{<0,0,-0.127000><1.947700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.407700,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.407700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,15.240000>}
box{<0,0,-0.127000><1.947700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.407700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.635300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.356700,-1.535000,5.334000>}
box{<0,0,-0.127000><25.721400,0.035000,0.127000> rotate<0,0.000000,0> translate<38.635300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.654000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.946000,-1.535000,35.306000>}
box{<0,0,-0.127000><2.292000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.654000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.887600,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.860700,-1.535000,5.588000>}
box{<0,0,-0.127000><25.973100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.887600,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.908000,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.692000,-1.535000,35.052000>}
box{<0,0,-0.127000><1.784000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.908000,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.962400,-1.535000,16.365400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.457500,-1.535000,16.365400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.962400,-1.535000,16.365400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.058500,-1.535000,37.986200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.683900,-1.535000,38.245300>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<39.058500,-1.535000,37.986200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.058500,-1.535000,42.913700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.683900,-1.535000,42.654600>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<39.058500,-1.535000,42.913700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.105000,-1.535000,34.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.455000,-1.535000,34.505000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,44.997030,0> translate<39.105000,-1.535000,34.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.139800,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,5.842000>}
box{<0,0,-0.127000><28.567200,0.035000,0.127000> rotate<0,0.000000,0> translate<39.139800,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.162000,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.438000,-1.535000,34.798000>}
box{<0,0,-0.127000><1.276000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.162000,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.333100,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.317000,-1.535000,38.100000>}
box{<0,0,-0.127000><15.983900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.333100,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.392100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,6.096000>}
box{<0,0,-0.127000><28.314900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.392100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.416000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.184000,-1.535000,34.544000>}
box{<0,0,-0.127000><0.768000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.416000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.455000,-1.535000,34.505000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644500,-1.535000,34.047500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,67.495834,0> translate<39.455000,-1.535000,34.505000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.457500,-1.535000,16.365400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.915000,-1.535000,16.554900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<39.457500,-1.535000,16.365400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.544100,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.930000,-1.535000,34.290000>}
box{<0,0,-0.127000><0.385900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.544100,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.642000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,42.672000>}
box{<0,0,-0.127000><28.065000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.642000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644400,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,6.350000>}
box{<0,0,-0.127000><28.062600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.644400,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644500,-1.535000,34.004500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644500,-1.535000,34.047500>}
box{<0,0,-0.127000><0.043000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.644500,-1.535000,34.047500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644500,-1.535000,34.004500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.494900,-1.535000,35.855000>}
box{<0,0,-0.127000><2.616931,0.035000,0.127000> rotate<0,-44.998578,0> translate<39.644500,-1.535000,34.004500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.644500,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.676000,-1.535000,34.036000>}
box{<0,0,-0.127000><0.031500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.644500,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.683900,-1.535000,38.245300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.162600,-1.535000,38.724000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.683900,-1.535000,38.245300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.683900,-1.535000,42.654600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.162600,-1.535000,42.175900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<39.683900,-1.535000,42.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.792600,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.693200,-1.535000,38.354000>}
box{<0,0,-0.127000><5.900600,0.035000,0.127000> rotate<0,0.000000,0> translate<39.792600,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.806600,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.510000>}
box{<0,0,-0.127000><0.548800,0.035000,0.127000> rotate<0,0.000000,0> translate<39.806600,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.896600,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.875000,-1.535000,6.604000>}
box{<0,0,-0.127000><6.978400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.896600,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.915000,-1.535000,16.554900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.995400>}
box{<0,0,-0.127000><0.622890,0.035000,0.127000> rotate<0,-45.003534,0> translate<39.915000,-1.535000,16.554900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.920500,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,42.418000>}
box{<0,0,-0.127000><27.786500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.920500,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.046600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.884900,-1.535000,38.608000>}
box{<0,0,-0.127000><0.838300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.046600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.124000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.764000>}
box{<0,0,-0.127000><0.231400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.124000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.148900,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.421800,-1.535000,6.858000>}
box{<0,0,-0.127000><6.272900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.148900,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.162600,-1.535000,38.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.302400,-1.535000,39.061500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-67.495122,0> translate<40.162600,-1.535000,38.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.162600,-1.535000,42.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.302400,-1.535000,41.838400>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,67.495122,0> translate<40.162600,-1.535000,42.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.167600,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.625800,-1.535000,42.164000>}
box{<0,0,-0.127000><0.458200,0.035000,0.127000> rotate<0,0.000000,0> translate<40.167600,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.219700,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.469500,-1.535000,38.862000>}
box{<0,0,-0.127000><0.249800,0.035000,0.127000> rotate<0,0.000000,0> translate<40.219700,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.272800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.354400,-1.535000,41.910000>}
box{<0,0,-0.127000><0.081600,0.035000,0.127000> rotate<0,0.000000,0> translate<40.272800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.302400,-1.535000,39.061500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.388100,-1.535000,38.943400>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,54.029685,0> translate<40.302400,-1.535000,39.061500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.302400,-1.535000,41.838400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.388100,-1.535000,41.956500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-54.029685,0> translate<40.302400,-1.535000,41.838400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,16.995400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355400,-1.535000,13.115500>}
box{<0,0,-0.127000><3.879900,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.355400,-1.535000,13.115500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.388100,-1.535000,38.943400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.515400,-1.535000,38.816100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<40.388100,-1.535000,38.943400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.388100,-1.535000,41.956500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.515400,-1.535000,42.083800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.388100,-1.535000,41.956500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.401100,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.167800,-1.535000,7.112000>}
box{<0,0,-0.127000><5.766700,0.035000,0.127000> rotate<0,0.000000,0> translate<40.401100,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.515400,-1.535000,38.816100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660900,-1.535000,38.710400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<40.515400,-1.535000,38.816100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.515400,-1.535000,42.083800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660900,-1.535000,42.189500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<40.515400,-1.535000,42.083800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.653400,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.913800,-1.535000,7.366000>}
box{<0,0,-0.127000><5.260400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.653400,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660900,-1.535000,38.710400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.821200,-1.535000,38.628700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<40.660900,-1.535000,38.710400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660900,-1.535000,42.189500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.821200,-1.535000,42.271200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<40.660900,-1.535000,42.189500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.821200,-1.535000,38.628700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.992300,-1.535000,38.573100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<40.821200,-1.535000,38.628700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.821200,-1.535000,42.271200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.992300,-1.535000,42.326800>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<40.821200,-1.535000,42.271200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.905700,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.659800,-1.535000,7.620000>}
box{<0,0,-0.127000><4.754100,0.035000,0.127000> rotate<0,0.000000,0> translate<40.905700,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.992300,-1.535000,38.573100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,38.550800>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,9.005487,0> translate<40.992300,-1.535000,38.573100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.992300,-1.535000,42.326800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,42.349000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-8.965761,0> translate<40.992300,-1.535000,42.326800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,38.550800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.322500>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,90.000000,0> translate<41.133000,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,38.608000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,38.862000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,39.116000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,39.370000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,39.624000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,39.878000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.132000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.322500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.577400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,42.349000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,90.000000,0> translate<41.133000,-1.535000,42.349000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.577400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.577400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,40.577400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.640000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.894000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,41.148000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,41.402000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,41.656000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,41.910000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.133000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,42.164000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.133000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.157900,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.405800,-1.535000,7.874000>}
box{<0,0,-0.127000><4.247900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.157900,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,38.550800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.527600,-1.535000,38.573100>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-8.999196,0> translate<41.386800,-1.535000,38.550800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,38.550800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.386800,-1.535000,38.550800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,42.349000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,40.577400>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.386800,-1.535000,40.577400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.386800,-1.535000,42.349000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.527600,-1.535000,42.326800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,8.959497,0> translate<41.386800,-1.535000,42.349000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.387400,-1.535000,40.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.387400,-1.535000,40.576800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<41.387400,-1.535000,40.576800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.387400,-1.535000,40.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.323000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.387400,-1.535000,40.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.387400,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.403100,-1.535000,40.386000>}
box{<0,0,-0.127000><14.015700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.387400,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.387400,-1.535000,40.576800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.576800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.387400,-1.535000,40.576800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.410200,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.151800,-1.535000,8.128000>}
box{<0,0,-0.127000><3.741600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.410200,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.494900,-1.535000,35.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.952400,-1.535000,36.044500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<41.494900,-1.535000,35.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.527600,-1.535000,38.573100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.698700,-1.535000,38.628700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<41.527600,-1.535000,38.573100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.527600,-1.535000,42.326800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.698700,-1.535000,42.271200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<41.527600,-1.535000,42.326800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.634900,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.439200,-1.535000,38.608000>}
box{<0,0,-0.127000><3.804300,0.035000,0.127000> rotate<0,0.000000,0> translate<41.634900,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.662500,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.897800,-1.535000,8.382000>}
box{<0,0,-0.127000><3.235300,0.035000,0.127000> rotate<0,0.000000,0> translate<41.662500,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.698700,-1.535000,38.628700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.859000,-1.535000,38.710400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<41.698700,-1.535000,38.628700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.698700,-1.535000,42.271200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.859000,-1.535000,42.189500>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<41.698700,-1.535000,42.271200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.859000,-1.535000,38.710400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.004500,-1.535000,38.816100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<41.859000,-1.535000,38.710400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.859000,-1.535000,42.189500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.004500,-1.535000,42.083800>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<41.859000,-1.535000,42.189500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.894200,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,42.164000>}
box{<0,0,-0.127000><25.812800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.894200,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.914700,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.141000,-1.535000,8.636000>}
box{<0,0,-0.127000><2.226300,0.035000,0.127000> rotate<0,0.000000,0> translate<41.914700,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.952400,-1.535000,36.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.447500,-1.535000,36.044500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<41.952400,-1.535000,36.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.004500,-1.535000,38.816100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.131800,-1.535000,38.943400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.004500,-1.535000,38.816100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.004500,-1.535000,42.083800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.131800,-1.535000,41.956500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<42.004500,-1.535000,42.083800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.050400,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,38.862000>}
box{<0,0,-0.127000><3.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.050400,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.131800,-1.535000,38.943400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.237500,-1.535000,39.088900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<42.131800,-1.535000,38.943400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.131800,-1.535000,41.956500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.237500,-1.535000,41.811000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<42.131800,-1.535000,41.956500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.165600,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.467100,-1.535000,41.910000>}
box{<0,0,-0.127000><17.301500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.165600,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.167000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.887000,-1.535000,8.890000>}
box{<0,0,-0.127000><1.720000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.167000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.237500,-1.535000,39.088900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.319200,-1.535000,39.249200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<42.237500,-1.535000,39.088900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.237500,-1.535000,41.811000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.319200,-1.535000,41.650700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<42.237500,-1.535000,41.811000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.251300,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.116000>}
box{<0,0,-0.127000><3.027300,0.035000,0.127000> rotate<0,0.000000,0> translate<42.251300,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.316500,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.361200,-1.535000,41.656000>}
box{<0,0,-0.127000><15.044700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.316500,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.319200,-1.535000,39.249200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.374800,-1.535000,39.420300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<42.319200,-1.535000,39.249200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.319200,-1.535000,41.650700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.374800,-1.535000,41.479600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<42.319200,-1.535000,41.650700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.358400,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.370000>}
box{<0,0,-0.127000><2.920200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.358400,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.374800,-1.535000,39.420300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,39.598000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-81.008781,0> translate<42.374800,-1.535000,39.420300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.374800,-1.535000,41.479600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,41.301900>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,81.008781,0> translate<42.374800,-1.535000,41.479600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.387100,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921900,-1.535000,41.402000>}
box{<0,0,-0.127000><14.534800,0.035000,0.127000> rotate<0,0.000000,0> translate<42.387100,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,39.598000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.323000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.402900,-1.535000,40.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.624000>}
box{<0,0,-0.127000><2.875700,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.525300,-1.535000,39.878000>}
box{<0,0,-0.127000><3.122400,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.779300,-1.535000,40.132000>}
box{<0,0,-0.127000><3.376400,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.576800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,41.301900>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,90.000000,0> translate<42.402900,-1.535000,41.301900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.657100,-1.535000,40.640000>}
box{<0,0,-0.127000><13.254200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.414000,-1.535000,40.894000>}
box{<0,0,-0.127000><14.011100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.402900,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.668000,-1.535000,41.148000>}
box{<0,0,-0.127000><14.265100,0.035000,0.127000> rotate<0,0.000000,0> translate<42.402900,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.419200,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.633000,-1.535000,9.144000>}
box{<0,0,-0.127000><1.213800,0.035000,0.127000> rotate<0,0.000000,0> translate<42.419200,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.447500,-1.535000,36.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.947500,-1.535000,36.044500>}
box{<0,0,-0.127000><5.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.447500,-1.535000,36.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.671500,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,9.398000>}
box{<0,0,-0.127000><0.778300,0.035000,0.127000> rotate<0,0.000000,0> translate<42.671500,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.923800,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,9.652000>}
box{<0,0,-0.127000><0.526000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.923800,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.176000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,9.906000>}
box{<0,0,-0.127000><0.273800,0.035000,0.127000> rotate<0,0.000000,0> translate<43.176000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.428300,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,10.160000>}
box{<0,0,-0.127000><0.021500,0.035000,0.127000> rotate<0,0.000000,0> translate<43.428300,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,9.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.387200,-1.535000,8.389800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<43.449800,-1.535000,9.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,10.181600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.449800,-1.535000,9.327200>}
box{<0,0,-0.127000><0.854400,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.449800,-1.535000,9.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.504900,-1.535000,31.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.565500,-1.535000,31.405400>}
box{<0,0,-0.127000><0.085631,0.035000,0.127000> rotate<0,-44.949721,0> translate<43.504900,-1.535000,31.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.504900,-1.535000,31.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,31.344900>}
box{<0,0,-0.127000><0.201900,0.035000,0.127000> rotate<0,0.000000,0> translate<43.504900,-1.535000,31.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.565500,-1.535000,31.405400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.609600,-1.535000,31.405400>}
box{<0,0,-0.127000><2.044100,0.035000,0.127000> rotate<0,0.000000,0> translate<43.565500,-1.535000,31.405400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,30.383600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,31.344900>}
box{<0,0,-0.127000><0.961300,0.035000,0.127000> rotate<0,90.000000,0> translate<43.706800,-1.535000,31.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,30.383600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,30.383600>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.706800,-1.535000,30.383600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,30.480000>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.706800,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,30.734000>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.706800,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,30.988000>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.706800,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.706800,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,31.242000>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.706800,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,31.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,30.383600>}
box{<0,0,-0.127000><0.961300,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.853000,-1.535000,30.383600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853000,-1.535000,31.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.515400,-1.535000,31.344900>}
box{<0,0,-0.127000><0.662400,0.035000,0.127000> rotate<0,0.000000,0> translate<43.853000,-1.535000,31.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853600,-1.535000,30.236800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853600,-1.535000,30.383000>}
box{<0,0,-0.127000><0.146200,0.035000,0.127000> rotate<0,90.000000,0> translate<43.853600,-1.535000,30.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853600,-1.535000,30.236800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.236800>}
box{<0,0,-0.127000><1.615300,0.035000,0.127000> rotate<0,0.000000,0> translate<43.853600,-1.535000,30.236800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.853600,-1.535000,30.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.383000>}
box{<0,0,-0.127000><1.615300,0.035000,0.127000> rotate<0,0.000000,0> translate<43.853600,-1.535000,30.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.387200,-1.535000,8.389800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.890100,-1.535000,8.389800>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.387200,-1.535000,8.389800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.515400,-1.535000,31.344900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.676300,-1.535000,31.319400>}
box{<0,0,-0.127000><0.162908,0.035000,0.127000> rotate<0,9.004944,0> translate<44.515400,-1.535000,31.344900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.676300,-1.535000,31.319400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831300,-1.535000,31.269100>}
box{<0,0,-0.127000><0.162957,0.035000,0.127000> rotate<0,17.977896,0> translate<44.676300,-1.535000,31.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.803600,-1.535000,29.341900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831300,-1.535000,29.350800>}
box{<0,0,-0.127000><0.029095,0.035000,0.127000> rotate<0,-17.811018,0> translate<44.803600,-1.535000,29.341900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.803600,-1.535000,29.341900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336800,-1.535000,29.121100>}
box{<0,0,-0.127000><0.577109,0.035000,0.127000> rotate<0,22.493134,0> translate<44.803600,-1.535000,29.341900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831300,-1.535000,29.350800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.976400,-1.535000,29.424800>}
box{<0,0,-0.127000><0.162880,0.035000,0.127000> rotate<0,-27.019485,0> translate<44.831300,-1.535000,29.350800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831300,-1.535000,31.269100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.976400,-1.535000,31.195100>}
box{<0,0,-0.127000><0.162880,0.035000,0.127000> rotate<0,27.019485,0> translate<44.831300,-1.535000,31.269100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.884500,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.784700,-1.535000,31.242000>}
box{<0,0,-0.127000><0.900200,0.035000,0.127000> rotate<0,0.000000,0> translate<44.884500,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.890100,-1.535000,8.389800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.534900,-1.535000,6.744900>}
box{<0,0,-0.127000><2.326169,0.035000,0.127000> rotate<0,44.998772,0> translate<44.890100,-1.535000,8.389800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.976400,-1.535000,29.424800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.108200,-1.535000,29.520500>}
box{<0,0,-0.127000><0.162879,0.035000,0.127000> rotate<0,-35.981032,0> translate<44.976400,-1.535000,29.424800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.976400,-1.535000,31.195100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.108200,-1.535000,31.099400>}
box{<0,0,-0.127000><0.162879,0.035000,0.127000> rotate<0,35.981032,0> translate<44.976400,-1.535000,31.195100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.024500,-1.535000,13.524500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.024500,-1.535000,13.589500>}
box{<0,0,-0.127000><0.065000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.024500,-1.535000,13.589500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.024500,-1.535000,13.524500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.817500,-1.535000,13.524500>}
box{<0,0,-0.127000><1.793000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.024500,-1.535000,13.524500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.024500,-1.535000,13.589500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336800,-1.535000,13.718800>}
box{<0,0,-0.127000><0.338009,0.035000,0.127000> rotate<0,-22.489292,0> translate<45.024500,-1.535000,13.589500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.030300,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.662400,-1.535000,29.464000>}
box{<0,0,-0.127000><2.632100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.030300,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.108200,-1.535000,29.520500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.223400,-1.535000,29.635700>}
box{<0,0,-0.127000><0.162917,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.108200,-1.535000,29.520500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.108200,-1.535000,31.099400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.223400,-1.535000,30.984200>}
box{<0,0,-0.127000><0.162917,0.035000,0.127000> rotate<0,44.997030,0> translate<45.108200,-1.535000,31.099400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.122200,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.601200,-1.535000,29.210000>}
box{<0,0,-0.127000><2.479000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.122200,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.219600,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.745600,-1.535000,30.988000>}
box{<0,0,-0.127000><9.526000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.219600,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.223400,-1.535000,29.635700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.319100,-1.535000,29.767500>}
box{<0,0,-0.127000><0.162879,0.035000,0.127000> rotate<0,-54.013028,0> translate<45.223400,-1.535000,29.635700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.223400,-1.535000,30.984200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.319100,-1.535000,30.852400>}
box{<0,0,-0.127000><0.162879,0.035000,0.127000> rotate<0,54.013028,0> translate<45.223400,-1.535000,30.984200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,38.768600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.888600,-1.535000,38.158600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<45.278600,-1.535000,38.768600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.123600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,38.768600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.278600,-1.535000,38.768600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.123600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243100,-1.535000,39.123600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.278600,-1.535000,39.123600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.276200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243100,-1.535000,39.276200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.278600,-1.535000,39.276200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.631300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.276200>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.278600,-1.535000,39.276200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.278600,-1.535000,39.631300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.888600,-1.535000,40.241300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.278600,-1.535000,39.631300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.283100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.782900,-1.535000,29.718000>}
box{<0,0,-0.127000><2.499800,0.035000,0.127000> rotate<0,0.000000,0> translate<45.283100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.319100,-1.535000,29.767500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.393100,-1.535000,29.912600>}
box{<0,0,-0.127000><0.162880,0.035000,0.127000> rotate<0,-62.974575,0> translate<45.319100,-1.535000,29.767500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.319100,-1.535000,30.852400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.393100,-1.535000,30.707300>}
box{<0,0,-0.127000><0.162880,0.035000,0.127000> rotate<0,62.974575,0> translate<45.319100,-1.535000,30.852400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.330000,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.031000,-1.535000,13.716000>}
box{<0,0,-0.127000><7.701000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.330000,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336800,-1.535000,13.718800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,14.167100>}
box{<0,0,-0.127000><0.633992,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.336800,-1.535000,13.718800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.336800,-1.535000,29.121100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,28.672800>}
box{<0,0,-0.127000><0.633992,0.035000,0.127000> rotate<0,44.997030,0> translate<45.336800,-1.535000,29.121100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.379500,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.430700,-1.535000,30.734000>}
box{<0,0,-0.127000><8.051200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.379500,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.393100,-1.535000,29.912600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,30.067600>}
box{<0,0,-0.127000><0.162957,0.035000,0.127000> rotate<0,-72.016164,0> translate<45.393100,-1.535000,29.912600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.393100,-1.535000,30.707300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,30.552300>}
box{<0,0,-0.127000><0.162957,0.035000,0.127000> rotate<0,72.016164,0> translate<45.393100,-1.535000,30.707300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.412300,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.996000,-1.535000,29.972000>}
box{<0,0,-0.127000><2.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.412300,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,16.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,15.972800>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,44.997030,0> translate<45.417900,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,16.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,16.707100>}
box{<0,0,-0.127000><0.519229,0.035000,0.127000> rotate<0,-44.989228,0> translate<45.417900,-1.535000,16.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,18.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,18.905400>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,-44.884472,0> translate<45.417900,-1.535000,18.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,18.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,18.512800>}
box{<0,0,-0.127000><0.519299,0.035000,0.127000> rotate<0,44.997030,0> translate<45.417900,-1.535000,18.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.428900,-1.535000,26.488900>}
box{<0,0,-0.127000><0.015627,0.035000,0.127000> rotate<0,45.256268,0> translate<45.417900,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.417900,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,26.867100>}
box{<0,0,-0.127000><0.519229,0.035000,0.127000> rotate<0,-44.989228,0> translate<45.417900,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.428900,-1.535000,26.488900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.494900,-1.535000,27.555000>}
box{<0,0,-0.127000><1.507622,0.035000,0.127000> rotate<0,-44.999717,0> translate<45.428900,-1.535000,26.488900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.841600,-1.535000,18.905400>}
box{<0,0,-0.127000><2.398200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.443400,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,30.067600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.228500>}
box{<0,0,-0.127000><0.162908,0.035000,0.127000> rotate<0,-80.989116,0> translate<45.443400,-1.535000,30.067600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.443400,-1.535000,30.552300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.391400>}
box{<0,0,-0.127000><0.162908,0.035000,0.127000> rotate<0,80.989116,0> translate<45.443400,-1.535000,30.552300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.454900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.845100,-1.535000,30.480000>}
box{<0,0,-0.127000><7.390200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.454900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468500,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400500,-1.535000,30.226000>}
box{<0,0,-0.127000><2.932000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.468500,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.228500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.236800>}
box{<0,0,-0.127000><0.008300,0.035000,0.127000> rotate<0,90.000000,0> translate<45.468900,-1.535000,30.236800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.468900,-1.535000,30.391400>}
box{<0,0,-0.127000><0.008400,0.035000,0.127000> rotate<0,90.000000,0> translate<45.468900,-1.535000,30.391400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.501900,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.863100,-1.535000,16.256000>}
box{<0,0,-0.127000><7.361200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.501900,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.501900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.951000,-1.535000,18.796000>}
box{<0,0,-0.127000><2.449100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.501900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.501900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,28.956000>}
box{<0,0,-0.127000><2.088100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.501900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.587900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.117100,-1.535000,16.510000>}
box{<0,0,-0.127000><7.529200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.587900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.587900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.610000,-1.535000,26.670000>}
box{<0,0,-0.127000><0.022100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.587900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.588000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.777000,-1.535000,13.970000>}
box{<0,0,-0.127000><7.189000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.588000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.609600,-1.535000,31.405400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.764700,-1.535000,31.250300>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,44.997030,0> translate<45.609600,-1.535000,31.405400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.755900,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.609100,-1.535000,16.002000>}
box{<0,0,-0.127000><6.853200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.755900,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.755900,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.651900,-1.535000,18.542000>}
box{<0,0,-0.127000><9.896000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.755900,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.755900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.634400,-1.535000,28.702000>}
box{<0,0,-0.127000><1.878500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.755900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.764700,-1.535000,31.250300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.371500,-1.535000,30.999000>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<45.764700,-1.535000,31.250300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,14.167100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,14.752900>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<45.785100,-1.535000,14.167100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,15.972800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,15.387000>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<45.785100,-1.535000,15.972800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,16.707100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.292900>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<45.785100,-1.535000,16.707100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,18.512800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.927000>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<45.785100,-1.535000,18.512800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,26.867100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,27.452900>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,-67.499411,0> translate<45.785100,-1.535000,26.867100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.785100,-1.535000,28.672800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,28.087000>}
box{<0,0,-0.127000><0.634048,0.035000,0.127000> rotate<0,67.499411,0> translate<45.785100,-1.535000,28.672800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.808600,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.523000,-1.535000,14.224000>}
box{<0,0,-0.127000><6.714400,0.035000,0.127000> rotate<0,0.000000,0> translate<45.808600,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.808600,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.873900,-1.535000,16.764000>}
box{<0,0,-0.127000><8.065300,0.035000,0.127000> rotate<0,0.000000,0> translate<45.808600,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.808600,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.864000,-1.535000,26.924000>}
box{<0,0,-0.127000><0.055400,0.035000,0.127000> rotate<0,0.000000,0> translate<45.808600,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.878200,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.355100,-1.535000,15.748000>}
box{<0,0,-0.127000><6.476900,0.035000,0.127000> rotate<0,0.000000,0> translate<45.878200,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.878200,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.397900,-1.535000,18.288000>}
box{<0,0,-0.127000><9.519700,0.035000,0.127000> rotate<0,0.000000,0> translate<45.878200,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.878200,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.736200,-1.535000,28.448000>}
box{<0,0,-0.127000><1.858000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.878200,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.888600,-1.535000,38.158600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,38.158600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.888600,-1.535000,38.158600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.888600,-1.535000,40.241300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,40.241300>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.888600,-1.535000,40.241300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.913800,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,14.478000>}
box{<0,0,-0.127000><6.426000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.913800,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.913800,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.127900,-1.535000,17.018000>}
box{<0,0,-0.127000><8.214100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.913800,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.913800,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.118000,-1.535000,27.178000>}
box{<0,0,-0.127000><0.204200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.913800,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.983400,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,15.494000>}
box{<0,0,-0.127000><6.356400,0.035000,0.127000> rotate<0,0.000000,0> translate<45.983400,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.983400,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.143900,-1.535000,18.034000>}
box{<0,0,-0.127000><9.160500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.983400,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.983400,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.909900,-1.535000,28.194000>}
box{<0,0,-0.127000><1.926500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.983400,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.019000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,14.732000>}
box{<0,0,-0.127000><6.320800,0.035000,0.127000> rotate<0,0.000000,0> translate<46.019000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.019000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.381900,-1.535000,17.272000>}
box{<0,0,-0.127000><8.362900,0.035000,0.127000> rotate<0,0.000000,0> translate<46.019000,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.019000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.372000,-1.535000,27.432000>}
box{<0,0,-0.127000><0.353000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.019000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,14.752900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,15.387000>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,90.000000,0> translate<46.027700,-1.535000,15.387000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,14.986000>}
box{<0,0,-0.127000><6.312100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,15.240000>}
box{<0,0,-0.127000><6.312100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.292900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.927000>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,90.000000,0> translate<46.027700,-1.535000,17.927000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.635900,-1.535000,17.526000>}
box{<0,0,-0.127000><8.608200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.889900,-1.535000,17.780000>}
box{<0,0,-0.127000><8.862200,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,27.452900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,28.087000>}
box{<0,0,-0.127000><0.634100,0.035000,0.127000> rotate<0,90.000000,0> translate<46.027700,-1.535000,28.087000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.811200,-1.535000,27.686000>}
box{<0,0,-0.127000><0.783500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.027700,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.713700,-1.535000,27.940000>}
box{<0,0,-0.127000><1.686000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.027700,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243100,-1.535000,39.276200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243100,-1.535000,39.123600>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.243100,-1.535000,39.123600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,38.158600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.123100>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<46.243600,-1.535000,39.123100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,38.354000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,38.608000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,38.862000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.116000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.123100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.123100>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.123100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.276800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,40.241300>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,90.000000,0> translate<46.243600,-1.535000,40.241300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.276800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.276800>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.276800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.370000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.624000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.878000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.243600,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,40.132000>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.243600,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.371500,-1.535000,30.999000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.028400,-1.535000,30.999000>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<46.371500,-1.535000,30.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,38.158600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.751300,-1.535000,38.158600>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.396200,-1.535000,38.158600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.123100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,38.158600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.396200,-1.535000,38.158600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,40.241300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,39.276800>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.396200,-1.535000,39.276800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396200,-1.535000,40.241300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.751300,-1.535000,40.241300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.396200,-1.535000,40.241300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396800,-1.535000,39.123600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396800,-1.535000,39.276200>}
box{<0,0,-0.127000><0.152600,0.035000,0.127000> rotate<0,90.000000,0> translate<46.396800,-1.535000,39.276200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396800,-1.535000,39.123600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.123600>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.396800,-1.535000,39.123600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.396800,-1.535000,39.276200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.276200>}
box{<0,0,-0.127000><0.964500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.396800,-1.535000,39.276200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.494900,-1.535000,27.555000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.952400,-1.535000,27.744500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<46.494900,-1.535000,27.555000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.534900,-1.535000,6.744900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.992400,-1.535000,6.555400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<46.534900,-1.535000,6.744900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.751300,-1.535000,38.158600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,38.768600>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.751300,-1.535000,38.158600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.751300,-1.535000,40.241300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.631300>}
box{<0,0,-0.127000><0.862670,0.035000,0.127000> rotate<0,44.997030,0> translate<46.751300,-1.535000,40.241300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.817500,-1.535000,13.524500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.275000,-1.535000,13.335000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<46.817500,-1.535000,13.524500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.860600,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.149100,-1.535000,40.132000>}
box{<0,0,-0.127000><8.288500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.860600,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.946700,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.063000,-1.535000,38.354000>}
box{<0,0,-0.127000><8.116300,0.035000,0.127000> rotate<0,0.000000,0> translate<46.946700,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.952400,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.447500,-1.535000,27.744500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.952400,-1.535000,27.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.968400,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,13.462000>}
box{<0,0,-0.127000><20.738600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.968400,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.992400,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.487500,-1.535000,6.555400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.992400,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.028400,-1.535000,30.999000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.635200,-1.535000,31.250300>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<47.028400,-1.535000,30.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.114600,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.895100,-1.535000,39.878000>}
box{<0,0,-0.127000><7.780500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.114600,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.200700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,38.608000>}
box{<0,0,-0.127000><7.679100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.200700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.275000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.625000,-1.535000,12.985000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,44.997030,0> translate<47.275000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,38.768600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.123600>}
box{<0,0,-0.127000><0.355000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.361300,-1.535000,39.123600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,38.862000>}
box{<0,0,-0.127000><7.518500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.361300,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,39.116000>}
box{<0,0,-0.127000><7.518500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.361300,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.276200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.631300>}
box{<0,0,-0.127000><0.355100,0.035000,0.127000> rotate<0,90.000000,0> translate<47.361300,-1.535000,39.631300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,39.370000>}
box{<0,0,-0.127000><7.518500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.361300,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.361300,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,39.624000>}
box{<0,0,-0.127000><7.518500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.361300,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.402000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,13.208000>}
box{<0,0,-0.127000><20.305000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.402000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.447500,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.518200,-1.535000,27.744500>}
box{<0,0,-0.127000><0.070700,0.035000,0.127000> rotate<0,0.000000,0> translate<47.447500,-1.535000,27.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.487500,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.247500,-1.535000,6.555400>}
box{<0,0,-0.127000><1.760000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.487500,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.518200,-1.535000,27.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.824000,-1.535000,28.050300>}
box{<0,0,-0.127000><0.432467,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.518200,-1.535000,27.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,28.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.621300,-1.535000,28.742500>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,80.989257,0> translate<47.590000,-1.535000,28.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.016800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,28.940000>}
box{<0,0,-0.127000><0.076800,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.590000,-1.535000,28.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.016800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836300,-1.535000,29.016800>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,0.000000,0> translate<47.590000,-1.535000,29.016800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.063000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836300,-1.535000,29.063000>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,0.000000,0> translate<47.590000,-1.535000,29.063000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.139900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.063000>}
box{<0,0,-0.127000><0.076900,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.590000,-1.535000,29.063000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.590000,-1.535000,29.139900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.621300,-1.535000,29.337400>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,-80.989257,0> translate<47.590000,-1.535000,29.139900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.615100,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.651200,-1.535000,31.242000>}
box{<0,0,-0.127000><7.036100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.615100,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.621300,-1.535000,28.742500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.683000,-1.535000,28.552400>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,72.013578,0> translate<47.621300,-1.535000,28.742500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.621300,-1.535000,29.337400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.683000,-1.535000,29.527500>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,-72.013578,0> translate<47.621300,-1.535000,29.337400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.625000,-1.535000,12.985000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.019900,-1.535000,11.590100>}
box{<0,0,-0.127000><1.972686,0.035000,0.127000> rotate<0,44.997030,0> translate<47.625000,-1.535000,12.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.635200,-1.535000,31.250300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790300,-1.535000,31.405400>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.635200,-1.535000,31.250300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.656000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,12.954000>}
box{<0,0,-0.127000><20.051000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.656000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.683000,-1.535000,28.552400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.773800,-1.535000,28.374300>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,62.982176,0> translate<47.683000,-1.535000,28.552400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.683000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.773800,-1.535000,29.705600>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,-62.982176,0> translate<47.683000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.773800,-1.535000,28.374300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.891300,-1.535000,28.212600>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,53.992245,0> translate<47.773800,-1.535000,28.374300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.773800,-1.535000,29.705600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.891300,-1.535000,29.867300>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,-53.992245,0> translate<47.773800,-1.535000,29.705600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790300,-1.535000,31.405400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.651200,-1.535000,31.405400>}
box{<0,0,-0.127000><6.860900,0.035000,0.127000> rotate<0,0.000000,0> translate<47.790300,-1.535000,31.405400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.824000,-1.535000,28.050300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.986400,-1.535000,28.117500>}
box{<0,0,-0.127000><0.175754,0.035000,0.127000> rotate<0,-22.477951,0> translate<47.824000,-1.535000,28.050300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.841600,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.197200,-1.535000,18.549800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<47.841600,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.891300,-1.535000,28.212600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.986400,-1.535000,28.117500>}
box{<0,0,-0.127000><0.134492,0.035000,0.127000> rotate<0,44.997030,0> translate<47.891300,-1.535000,28.212600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.891300,-1.535000,29.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.032600,-1.535000,30.008600>}
box{<0,0,-0.127000><0.199828,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.891300,-1.535000,29.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.910000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,12.700000>}
box{<0,0,-0.127000><19.797000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.910000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.947500,-1.535000,36.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.709600,-1.535000,36.044500>}
box{<0,0,-0.127000><4.762100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.947500,-1.535000,36.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.032600,-1.535000,30.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.194300,-1.535000,30.126100>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,-36.001815,0> translate<48.032600,-1.535000,30.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.164000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,12.446000>}
box{<0,0,-0.127000><19.543000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.164000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.194300,-1.535000,30.126100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.372400,-1.535000,30.216900>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,-27.011884,0> translate<48.194300,-1.535000,30.126100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.197200,-1.535000,18.549800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,18.549800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<48.197200,-1.535000,18.549800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.372400,-1.535000,30.216900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.562500,-1.535000,30.278600>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,-17.980482,0> translate<48.372400,-1.535000,30.216900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.410100,-1.535000,21.750100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.791200,-1.535000,22.131200>}
box{<0,0,-0.127000><0.538957,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.410100,-1.535000,21.750100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.410100,-1.535000,21.750100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,21.750100>}
box{<0,0,-0.127000><1.112600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.410100,-1.535000,21.750100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.418000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.126300,-1.535000,12.192000>}
box{<0,0,-0.127000><4.708300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.418000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.504000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.044700,-1.535000,21.844000>}
box{<0,0,-0.127000><11.540700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.504000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.562500,-1.535000,30.278600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,-1.535000,30.309900>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,-9.004803,0> translate<48.562500,-1.535000,30.278600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.672000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.819400,-1.535000,11.938000>}
box{<0,0,-0.127000><4.147400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.672000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.758000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,22.098000>}
box{<0,0,-0.127000><18.949000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.758000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,-1.535000,30.309900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,30.309900>}
box{<0,0,-0.127000><0.076800,0.035000,0.127000> rotate<0,0.000000,0> translate<48.760000,-1.535000,30.309900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.791200,-1.535000,22.131200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.223800,-1.535000,22.131200>}
box{<0,0,-0.127000><0.432600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.791200,-1.535000,22.131200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836300,-1.535000,29.063000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836300,-1.535000,29.016800>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.836300,-1.535000,29.016800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.063600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,30.309900>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,90.000000,0> translate<48.836800,-1.535000,30.309900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.063600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.063600>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,29.063600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.210000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.464000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.718000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.972000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.836800,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,30.226000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.836800,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,30.309900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,29.063600>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.883000,-1.535000,29.063600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883000,-1.535000,30.309900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.959900,-1.535000,30.309900>}
box{<0,0,-0.127000><0.076900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.883000,-1.535000,30.309900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883600,-1.535000,29.016800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883600,-1.535000,29.063000>}
box{<0,0,-0.127000><0.046200,0.035000,0.127000> rotate<0,90.000000,0> translate<48.883600,-1.535000,29.063000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883600,-1.535000,29.016800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.016800>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.883600,-1.535000,29.016800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.883600,-1.535000,29.063000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.063000>}
box{<0,0,-0.127000><1.246300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.883600,-1.535000,29.063000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.926000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.565400,-1.535000,11.684000>}
box{<0,0,-0.127000><3.639400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.926000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.959900,-1.535000,30.309900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.157400,-1.535000,30.278600>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,9.004803,0> translate<48.959900,-1.535000,30.309900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.019900,-1.535000,11.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,11.590100>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.019900,-1.535000,11.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.157400,-1.535000,30.278600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.347500,-1.535000,30.216900>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,17.980482,0> translate<49.157400,-1.535000,30.278600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.223800,-1.535000,22.131200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.895900,-1.535000,22.409600>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<49.223800,-1.535000,22.131200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.247500,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.502400,-1.535000,6.555400>}
box{<0,0,-0.127000><2.254900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.247500,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.319500,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.591100,-1.535000,30.226000>}
box{<0,0,-0.127000><3.271600,0.035000,0.127000> rotate<0,0.000000,0> translate<49.319500,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.347500,-1.535000,30.216900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.525600,-1.535000,30.126100>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,27.011884,0> translate<49.347500,-1.535000,30.216900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,11.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,10.652700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<49.522700,-1.535000,11.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,18.549800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.878300,-1.535000,18.905400>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.522700,-1.535000,18.549800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522700,-1.535000,21.750100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.878300,-1.535000,21.394500>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<49.522700,-1.535000,21.750100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.525600,-1.535000,30.126100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.687300,-1.535000,30.008600>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,36.001815,0> translate<49.525600,-1.535000,30.126100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.682800,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.455500,-1.535000,11.430000>}
box{<0,0,-0.127000><2.772700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.682800,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.682800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.117100,-1.535000,21.590000>}
box{<0,0,-0.127000><3.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.682800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.687300,-1.535000,30.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.828600,-1.535000,29.867300>}
box{<0,0,-0.127000><0.199828,0.035000,0.127000> rotate<0,44.997030,0> translate<49.687300,-1.535000,30.008600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.723900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.374200,-1.535000,29.972000>}
box{<0,0,-0.127000><2.650300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.723900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.733500,-1.535000,28.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.828600,-1.535000,28.212600>}
box{<0,0,-0.127000><0.134492,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.733500,-1.535000,28.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.733500,-1.535000,28.117500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.895900,-1.535000,28.050300>}
box{<0,0,-0.127000><0.175754,0.035000,0.127000> rotate<0,22.477951,0> translate<49.733500,-1.535000,28.117500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.756800,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,22.352000>}
box{<0,0,-0.127000><17.950200,0.035000,0.127000> rotate<0,0.000000,0> translate<49.756800,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.768900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.031000,-1.535000,18.796000>}
box{<0,0,-0.127000><3.262100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.768900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.810000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.388100,-1.535000,28.194000>}
box{<0,0,-0.127000><2.578100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.810000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.828600,-1.535000,28.212600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.946100,-1.535000,28.374300>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,-53.992245,0> translate<49.828600,-1.535000,28.212600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.828600,-1.535000,29.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.946100,-1.535000,29.705600>}
box{<0,0,-0.127000><0.199883,0.035000,0.127000> rotate<0,53.992245,0> translate<49.828600,-1.535000,29.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.878300,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921600,-1.535000,18.905400>}
box{<0,0,-0.127000><3.043300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.878300,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.878300,-1.535000,21.394500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921600,-1.535000,21.394500>}
box{<0,0,-0.127000><3.043300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.878300,-1.535000,21.394500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.895900,-1.535000,22.409600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,22.924000>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.895900,-1.535000,22.409600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.895900,-1.535000,28.050300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,27.535900>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,44.997030,0> translate<49.895900,-1.535000,28.050300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.936800,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.350200,-1.535000,11.176000>}
box{<0,0,-0.127000><2.413400,0.035000,0.127000> rotate<0,0.000000,0> translate<49.936800,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.937100,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.269000,-1.535000,29.718000>}
box{<0,0,-0.127000><2.331900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.937100,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.946100,-1.535000,28.374300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.036900,-1.535000,28.552400>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,-62.982176,0> translate<49.946100,-1.535000,28.374300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.946100,-1.535000,29.705600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.036900,-1.535000,29.527500>}
box{<0,0,-0.127000><0.199911,0.035000,0.127000> rotate<0,62.982176,0> translate<49.946100,-1.535000,29.705600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.983600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.282900,-1.535000,28.448000>}
box{<0,0,-0.127000><2.299300,0.035000,0.127000> rotate<0,0.000000,0> translate<49.983600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.006200,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.625000,-1.535000,27.940000>}
box{<0,0,-0.127000><2.618800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.006200,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.036900,-1.535000,28.552400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.098600,-1.535000,28.742500>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,-72.013578,0> translate<50.036900,-1.535000,28.552400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.036900,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.098600,-1.535000,29.337400>}
box{<0,0,-0.127000><0.199862,0.035000,0.127000> rotate<0,72.013578,0> translate<50.036900,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.057600,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.163800,-1.535000,29.464000>}
box{<0,0,-0.127000><2.106200,0.035000,0.127000> rotate<0,0.000000,0> translate<50.057600,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.085400,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.177700,-1.535000,28.702000>}
box{<0,0,-0.127000><2.092300,0.035000,0.127000> rotate<0,0.000000,0> translate<50.085400,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.092300,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,22.606000>}
box{<0,0,-0.127000><17.614700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.092300,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.098600,-1.535000,28.742500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,28.940000>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,-80.989257,0> translate<50.098600,-1.535000,28.742500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.098600,-1.535000,29.337400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.139900>}
box{<0,0,-0.127000><0.199965,0.035000,0.127000> rotate<0,80.989257,0> translate<50.098600,-1.535000,29.337400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.118800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,29.210000>}
box{<0,0,-0.127000><2.030200,0.035000,0.127000> rotate<0,0.000000,0> translate<50.118800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,28.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.016800>}
box{<0,0,-0.127000><0.076800,0.035000,0.127000> rotate<0,90.000000,0> translate<50.129900,-1.535000,29.016800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,28.956000>}
box{<0,0,-0.127000><2.019100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.129900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.063000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.129900,-1.535000,29.139900>}
box{<0,0,-0.127000><0.076900,0.035000,0.127000> rotate<0,90.000000,0> translate<50.129900,-1.535000,29.139900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.176200,-1.535000,25.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,24.995900>}
box{<0,0,-0.127000><0.331067,0.035000,0.127000> rotate<0,44.997030,0> translate<50.176200,-1.535000,25.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.176200,-1.535000,25.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,25.464000>}
box{<0,0,-0.127000><0.330997,0.035000,0.127000> rotate<0,-44.984791,0> translate<50.176200,-1.535000,25.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.177300,-1.535000,9.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,9.327200>}
box{<0,0,-0.127000><0.399869,0.035000,0.127000> rotate<0,-44.986899,0> translate<50.177300,-1.535000,9.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.177300,-1.535000,9.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.334400,-1.535000,9.044500>}
box{<0,0,-0.127000><1.157100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.177300,-1.535000,9.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190800,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.922000>}
box{<0,0,-0.127000><2.107400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.190800,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260200,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,25.146000>}
box{<0,0,-0.127000><17.446800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.260200,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260200,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.899200,-1.535000,27.686000>}
box{<0,0,-0.127000><2.639000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.260200,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.276800,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.434000,-1.535000,9.144000>}
box{<0,0,-0.127000><1.157200,0.035000,0.127000> rotate<0,0.000000,0> translate<50.276800,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.346200,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.291700,-1.535000,25.400000>}
box{<0,0,-0.127000><9.945500,0.035000,0.127000> rotate<0,0.000000,0> translate<50.346200,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.346300,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,22.860000>}
box{<0,0,-0.127000><17.360700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.346300,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,22.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,23.596100>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<50.410300,-1.535000,22.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,24.995900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,24.323800>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<50.410300,-1.535000,24.995900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,25.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.136100>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<50.410300,-1.535000,25.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.410300,-1.535000,27.535900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.863800>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<50.410300,-1.535000,27.535900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.444800,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.668000>}
box{<0,0,-0.127000><1.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.444800,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453400,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,24.892000>}
box{<0,0,-0.127000><17.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<50.453400,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.453400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.583000,-1.535000,27.432000>}
box{<0,0,-0.127000><5.129600,0.035000,0.127000> rotate<0,0.000000,0> translate<50.453400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,9.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,10.652700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<50.460100,-1.535000,10.652700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.688000,-1.535000,9.398000>}
box{<0,0,-0.127000><1.227900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.460100,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.942000,-1.535000,9.652000>}
box{<0,0,-0.127000><1.481900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.460100,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.196000,-1.535000,9.906000>}
box{<0,0,-0.127000><1.735900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.460100,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.160000>}
box{<0,0,-0.127000><1.838100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.460100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.460100,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.414000>}
box{<0,0,-0.127000><1.838100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.460100,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.489000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,23.114000>}
box{<0,0,-0.127000><17.218000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.489000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.489000,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.947500,-1.535000,25.654000>}
box{<0,0,-0.127000><9.458500,0.035000,0.127000> rotate<0,0.000000,0> translate<50.489000,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.558600,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,24.638000>}
box{<0,0,-0.127000><17.148400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.558600,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.558600,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.919600,-1.535000,27.178000>}
box{<0,0,-0.127000><9.361000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.558600,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.594200,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,23.368000>}
box{<0,0,-0.127000><17.112800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.594200,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.594200,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.771100,-1.535000,25.908000>}
box{<0,0,-0.127000><9.176900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.594200,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.663800,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,24.384000>}
box{<0,0,-0.127000><17.043200,0.035000,0.127000> rotate<0,0.000000,0> translate<50.663800,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.663800,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.756900,-1.535000,26.924000>}
box{<0,0,-0.127000><9.093100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.663800,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,23.596100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,24.323800>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,90.000000,0> translate<50.688700,-1.535000,24.323800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,23.622000>}
box{<0,0,-0.127000><17.018300,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,23.876000>}
box{<0,0,-0.127000><17.018300,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,24.130000>}
box{<0,0,-0.127000><17.018300,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.136100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.863800>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,90.000000,0> translate<50.688700,-1.535000,26.863800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,26.162000>}
box{<0,0,-0.127000><8.984400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,26.416000>}
box{<0,0,-0.127000><10.733800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.688700,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.668800,-1.535000,26.670000>}
box{<0,0,-0.127000><8.980100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.688700,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.334400,-1.535000,9.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.008200>}
box{<0,0,-0.127000><1.362948,0.035000,0.127000> rotate<0,-44.994058,0> translate<51.334400,-1.535000,9.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.502400,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.602400,-1.535000,6.555400>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.502400,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.602400,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.097500,-1.535000,6.555400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<51.602400,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.097500,-1.535000,6.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.555000,-1.535000,6.744900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<52.097500,-1.535000,6.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,28.771500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400300,-1.535000,28.164700>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,67.499155,0> translate<52.149000,-1.535000,28.771500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,29.428400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,28.771500>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.149000,-1.535000,28.771500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.149000,-1.535000,29.428400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400300,-1.535000,30.035200>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-67.499155,0> translate<52.149000,-1.535000,29.428400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.214800,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,6.604000>}
box{<0,0,-0.127000><15.492200,0.035000,0.127000> rotate<0,0.000000,0> translate<52.214800,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,11.050500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,10.008200>}
box{<0,0,-0.127000><1.042300,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.298200,-1.535000,10.008200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.298200,-1.535000,11.050500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.557300,-1.535000,11.675900>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<52.298200,-1.535000,11.050500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,14.407200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,13.469800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<52.339800,-1.535000,14.407200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,15.732700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,14.407200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.339800,-1.535000,14.407200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.339800,-1.535000,15.732700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,16.670100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.339800,-1.535000,15.732700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400300,-1.535000,28.164700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,27.700300>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,44.997030,0> translate<52.400300,-1.535000,28.164700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400300,-1.535000,30.035200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,30.499600>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.400300,-1.535000,30.035200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.555000,-1.535000,6.744900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.403200,-1.535000,7.593200>}
box{<0,0,-0.127000><1.199607,0.035000,0.127000> rotate<0,-45.000407,0> translate<52.555000,-1.535000,6.744900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.557300,-1.535000,11.675900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.036000,-1.535000,12.154600>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.557300,-1.535000,11.675900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.668000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,6.858000>}
box{<0,0,-0.127000><15.039000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.668000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.709600,-1.535000,36.044500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,36.199600>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.709600,-1.535000,36.044500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,27.700300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,27.449000>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<52.864700,-1.535000,27.700300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,30.499600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,30.750900>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<52.864700,-1.535000,30.499600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.864700,-1.535000,36.199600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,36.450900>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<52.864700,-1.535000,36.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921600,-1.535000,18.905400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,18.549800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<52.921600,-1.535000,18.905400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.921600,-1.535000,21.394500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,21.750100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.921600,-1.535000,21.394500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.922000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,7.112000>}
box{<0,0,-0.127000><14.785000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.922000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.036000,-1.535000,12.154600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.661400,-1.535000,12.413700>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<53.036000,-1.535000,12.154600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.176000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,7.366000>}
box{<0,0,-0.127000><14.531000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.176000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,13.469800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,13.469800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.277200,-1.535000,13.469800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,16.670100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.780000,-1.535000,16.670100>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<53.277200,-1.535000,16.670100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,18.549800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,18.549800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.277200,-1.535000,18.549800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.277200,-1.535000,21.750100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,21.750100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<53.277200,-1.535000,21.750100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.403200,-1.535000,7.593200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.661400,-1.535000,7.486200>}
box{<0,0,-0.127000><0.279493,0.035000,0.127000> rotate<0,22.507995,0> translate<53.403200,-1.535000,7.593200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,27.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,27.449000>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.471500,-1.535000,27.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,30.750900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,30.750900>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.471500,-1.535000,30.750900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.471500,-1.535000,36.450900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,36.450900>}
box{<0,0,-0.127000><0.656900,0.035000,0.127000> rotate<0,0.000000,0> translate<53.471500,-1.535000,36.450900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.661400,-1.535000,7.486200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.338500,-1.535000,7.486200>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.661400,-1.535000,7.486200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.661400,-1.535000,12.413700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.338500,-1.535000,12.413700>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,0.000000,0> translate<53.661400,-1.535000,12.413700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.780000,-1.535000,16.670100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.474900,-1.535000,21.365000>}
box{<0,0,-0.127000><6.639591,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.780000,-1.535000,16.670100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,27.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,27.700300>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,-22.494905,0> translate<54.128400,-1.535000,27.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,30.750900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,30.499600>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<54.128400,-1.535000,30.750900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.128400,-1.535000,36.450900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,36.199600>}
box{<0,0,-0.127000><0.656778,0.035000,0.127000> rotate<0,22.494905,0> translate<54.128400,-1.535000,36.450900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.169300,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.850800,-1.535000,30.734000>}
box{<0,0,-0.127000><0.681500,0.035000,0.127000> rotate<0,0.000000,0> translate<54.169300,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.338500,-1.535000,7.486200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.963900,-1.535000,7.745300>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<54.338500,-1.535000,7.486200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.338500,-1.535000,12.413700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.963900,-1.535000,12.154600>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<54.338500,-1.535000,12.413700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.439700,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.959100,-1.535000,36.322000>}
box{<0,0,-0.127000><4.519400,0.035000,0.127000> rotate<0,0.000000,0> translate<54.439700,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,13.469800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.407200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.602700,-1.535000,13.469800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,18.549800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,19.487200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.602700,-1.535000,18.549800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.602700,-1.535000,21.750100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,20.812700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<54.602700,-1.535000,21.750100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.651200,-1.535000,31.216100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.929600,-1.535000,30.544000>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<54.651200,-1.535000,31.216100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.651200,-1.535000,31.405400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.651200,-1.535000,31.216100>}
box{<0,0,-0.127000><0.189300,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.651200,-1.535000,31.216100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.661400,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,7.620000>}
box{<0,0,-0.127000><13.045600,0.035000,0.127000> rotate<0,0.000000,0> translate<54.661400,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.700600,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.247600,-1.535000,27.686000>}
box{<0,0,-0.127000><0.547000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.700600,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,27.700300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.890300,-1.535000,27.855400>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.735200,-1.535000,27.700300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,30.499600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.890300,-1.535000,30.344500>}
box{<0,0,-0.127000><0.219345,0.035000,0.127000> rotate<0,44.997030,0> translate<54.735200,-1.535000,30.499600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.735200,-1.535000,36.199600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.199600,-1.535000,35.735200>}
box{<0,0,-0.127000><0.656761,0.035000,0.127000> rotate<0,44.997030,0> translate<54.735200,-1.535000,36.199600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.754800,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.993600,-1.535000,30.480000>}
box{<0,0,-0.127000><0.238800,0.035000,0.127000> rotate<0,0.000000,0> translate<54.754800,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.762800,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.661400,-1.535000,21.590000>}
box{<0,0,-0.127000><4.898600,0.035000,0.127000> rotate<0,0.000000,0> translate<54.762800,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,13.716000>}
box{<0,0,-0.127000><12.858100,0.035000,0.127000> rotate<0,0.000000,0> translate<54.848900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.905900,-1.535000,18.796000>}
box{<0,0,-0.127000><1.057000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.848900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.866800,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.705100,-1.535000,36.068000>}
box{<0,0,-0.127000><3.838300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.866800,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.873700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,12.192000>}
box{<0,0,-0.127000><12.833300,0.035000,0.127000> rotate<0,0.000000,0> translate<54.873700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,38.537200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.817200,-1.535000,37.599800>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<54.879800,-1.535000,38.537200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,39.862700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,38.537200>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.879800,-1.535000,38.537200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.879800,-1.535000,39.862700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.817200,-1.535000,40.800100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.879800,-1.535000,39.862700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.890300,-1.535000,27.855400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.078200,-1.535000,27.855400>}
box{<0,0,-0.127000><0.187900,0.035000,0.127000> rotate<0,0.000000,0> translate<54.890300,-1.535000,27.855400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.890300,-1.535000,30.344500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.129200,-1.535000,30.344500>}
box{<0,0,-0.127000><0.238900,0.035000,0.127000> rotate<0,0.000000,0> translate<54.890300,-1.535000,30.344500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.929600,-1.535000,30.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.129200,-1.535000,30.344500>}
box{<0,0,-0.127000><0.282206,0.035000,0.127000> rotate<0,44.982675,0> translate<54.929600,-1.535000,30.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.963900,-1.535000,7.745300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.442600,-1.535000,8.224000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.963900,-1.535000,7.745300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.963900,-1.535000,12.154600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.442600,-1.535000,11.675900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<54.963900,-1.535000,12.154600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.016800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.445900,-1.535000,21.336000>}
box{<0,0,-0.127000><3.429100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.016800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.078200,-1.535000,27.855400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.444000,-1.535000,27.489600>}
box{<0,0,-0.127000><0.517319,0.035000,0.127000> rotate<0,44.997030,0> translate<55.078200,-1.535000,27.855400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.092600,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,7.874000>}
box{<0,0,-0.127000><12.614400,0.035000,0.127000> rotate<0,0.000000,0> translate<55.092600,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.102900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,13.970000>}
box{<0,0,-0.127000><12.604100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.102900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.102900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.159900,-1.535000,19.050000>}
box{<0,0,-0.127000><1.057000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.102900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.120800,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.791000,-1.535000,35.814000>}
box{<0,0,-0.127000><0.670200,0.035000,0.127000> rotate<0,0.000000,0> translate<55.120800,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.180500,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,11.938000>}
box{<0,0,-0.127000><12.526500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.180500,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.199600,-1.535000,35.735200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.290200,-1.535000,35.516400>}
box{<0,0,-0.127000><0.236816,0.035000,0.127000> rotate<0,67.502234,0> translate<55.199600,-1.535000,35.735200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.270800,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.191900,-1.535000,21.082000>}
box{<0,0,-0.127000><2.921100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.270800,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.272200,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.333800,-1.535000,35.560000>}
box{<0,0,-0.127000><0.061600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.272200,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.290200,-1.535000,35.516400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.444000,-1.535000,35.670300>}
box{<0,0,-0.127000><0.217577,0.035000,0.127000> rotate<0,-45.015650,0> translate<55.290200,-1.535000,35.516400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.346600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.103300,-1.535000,8.128000>}
box{<0,0,-0.127000><0.756700,0.035000,0.127000> rotate<0,0.000000,0> translate<55.346600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.356900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,14.224000>}
box{<0,0,-0.127000><12.350100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.356900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.356900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413900,-1.535000,19.304000>}
box{<0,0,-0.127000><1.057000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.356900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.434500,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.933400,-1.535000,11.684000>}
box{<0,0,-0.127000><0.498900,0.035000,0.127000> rotate<0,0.000000,0> translate<55.434500,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.442600,-1.535000,8.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.582400,-1.535000,8.561500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-67.495122,0> translate<55.442600,-1.535000,8.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.442600,-1.535000,11.675900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.582400,-1.535000,11.338400>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,67.495122,0> translate<55.442600,-1.535000,11.675900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.444000,-1.535000,27.489600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.116100,-1.535000,27.211200>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,22.499029,0> translate<55.444000,-1.535000,27.489600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.444000,-1.535000,35.670300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.116100,-1.535000,35.948700>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<55.444000,-1.535000,35.670300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.508000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.729500,-1.535000,8.382000>}
box{<0,0,-0.127000><0.221500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.508000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.524800,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.937900,-1.535000,20.828000>}
box{<0,0,-0.127000><2.413100,0.035000,0.127000> rotate<0,0.000000,0> translate<55.524800,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.407200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.910000>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,90.000000,0> translate<55.540100,-1.535000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,14.478000>}
box{<0,0,-0.127000><12.166900,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,14.732000>}
box{<0,0,-0.127000><12.166900,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.660700,-1.535000,19.030700>}
box{<0,0,-0.127000><5.827479,0.035000,0.127000> rotate<0,-44.997725,0> translate<55.540100,-1.535000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,19.487200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,20.812700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<55.540100,-1.535000,20.812700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667900,-1.535000,19.558000>}
box{<0,0,-0.127000><1.127800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.921900,-1.535000,19.812000>}
box{<0,0,-0.127000><1.381800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.175900,-1.535000,20.066000>}
box{<0,0,-0.127000><1.635800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.429900,-1.535000,20.320000>}
box{<0,0,-0.127000><1.889800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.540100,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.683900,-1.535000,20.574000>}
box{<0,0,-0.127000><2.143800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.540100,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.544500,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.648900,-1.535000,11.430000>}
box{<0,0,-0.127000><0.104400,0.035000,0.127000> rotate<0,0.000000,0> translate<55.544500,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.582400,-1.535000,8.561500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.668100,-1.535000,8.443400>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,54.029685,0> translate<55.582400,-1.535000,8.561500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.582400,-1.535000,11.338400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.668100,-1.535000,11.456500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-54.029685,0> translate<55.582400,-1.535000,11.338400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.616000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,14.986000>}
box{<0,0,-0.127000><12.091000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.616000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.668100,-1.535000,8.443400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.795400,-1.535000,8.316100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<55.668100,-1.535000,8.443400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.668100,-1.535000,11.456500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.795400,-1.535000,11.583800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.668100,-1.535000,11.456500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.795400,-1.535000,8.316100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.940900,-1.535000,8.210400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<55.795400,-1.535000,8.316100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.795400,-1.535000,11.583800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.940900,-1.535000,11.689500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<55.795400,-1.535000,11.583800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.817200,-1.535000,37.599800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.142700,-1.535000,37.599800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.817200,-1.535000,37.599800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.817200,-1.535000,40.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.320100,-1.535000,40.800100>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,0.000000,0> translate<55.817200,-1.535000,40.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.870000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,15.240000>}
box{<0,0,-0.127000><11.837000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.870000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.940900,-1.535000,8.210400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.101200,-1.535000,8.128700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<55.940900,-1.535000,8.210400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.940900,-1.535000,11.689500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.101200,-1.535000,11.771200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<55.940900,-1.535000,11.689500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.101200,-1.535000,8.128700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.272300,-1.535000,8.073100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<56.101200,-1.535000,8.128700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.101200,-1.535000,11.771200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.272300,-1.535000,11.826800>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<56.101200,-1.535000,11.771200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.116100,-1.535000,27.211200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.843800,-1.535000,27.211200>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,0.000000,0> translate<56.116100,-1.535000,27.211200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.116100,-1.535000,35.948700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.843800,-1.535000,35.948700>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,0.000000,0> translate<56.116100,-1.535000,35.948700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.124000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,15.494000>}
box{<0,0,-0.127000><11.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.124000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.272300,-1.535000,8.073100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.050800>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,9.005487,0> translate<56.272300,-1.535000,8.073100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.272300,-1.535000,11.826800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,11.849000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-8.965761,0> translate<56.272300,-1.535000,11.826800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.320100,-1.535000,40.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.694900,-1.535000,41.174900>}
box{<0,0,-0.127000><0.530047,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.320100,-1.535000,40.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.378000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,15.748000>}
box{<0,0,-0.127000><11.329000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.378000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.050800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,9.822500>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,90.000000,0> translate<56.413000,-1.535000,9.822500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.128000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.382000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.636000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.890000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,9.144000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,9.398000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,9.652000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,9.822500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,9.822500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,9.822500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.077400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,11.849000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,90.000000,0> translate<56.413000,-1.535000,11.849000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.077400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.077400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,10.077400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.160000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.414000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.668000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.922000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,11.176000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,11.430000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,11.684000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<56.413000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.632000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,16.002000>}
box{<0,0,-0.127000><11.075000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.632000,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.050800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.807600,-1.535000,8.073100>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-8.999196,0> translate<56.666800,-1.535000,8.050800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,9.822500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,8.050800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.666800,-1.535000,8.050800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,11.849000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,10.077400>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.666800,-1.535000,10.077400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.666800,-1.535000,11.849000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.807600,-1.535000,11.826800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,8.959497,0> translate<56.666800,-1.535000,11.849000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667400,-1.535000,9.823000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667400,-1.535000,10.076800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<56.667400,-1.535000,10.076800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667400,-1.535000,9.823000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.823000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<56.667400,-1.535000,9.823000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667400,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,9.906000>}
box{<0,0,-0.127000><11.039600,0.035000,0.127000> rotate<0,0.000000,0> translate<56.667400,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.667400,-1.535000,10.076800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.076800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<56.667400,-1.535000,10.076800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.694900,-1.535000,41.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.694900,-1.535000,41.174900>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.694900,-1.535000,41.174900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.694900,-1.535000,41.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.044900,-1.535000,41.525000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.694900,-1.535000,41.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.807600,-1.535000,8.073100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.978700,-1.535000,8.128700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<56.807600,-1.535000,8.073100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.807600,-1.535000,11.826800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.978700,-1.535000,11.771200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<56.807600,-1.535000,11.826800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.843800,-1.535000,27.211200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.515900,-1.535000,27.489600>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-22.499029,0> translate<56.843800,-1.535000,27.211200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.843800,-1.535000,35.948700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.515900,-1.535000,35.670300>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,22.499029,0> translate<56.843800,-1.535000,35.948700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.886000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,16.256000>}
box{<0,0,-0.127000><10.821000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.886000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.976500,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,8.128000>}
box{<0,0,-0.127000><10.730500,0.035000,0.127000> rotate<0,0.000000,0> translate<56.976500,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.978700,-1.535000,8.128700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.139000,-1.535000,8.210400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<56.978700,-1.535000,8.128700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.978700,-1.535000,11.771200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.139000,-1.535000,11.689500>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<56.978700,-1.535000,11.771200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.044900,-1.535000,41.525000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.502400,-1.535000,41.714500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<57.044900,-1.535000,41.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.139000,-1.535000,8.210400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.284500,-1.535000,8.316100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<57.139000,-1.535000,8.210400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.139000,-1.535000,11.689500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.284500,-1.535000,11.583800>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<57.139000,-1.535000,11.689500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.140000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,16.510000>}
box{<0,0,-0.127000><10.567000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.140000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.142700,-1.535000,37.599800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,38.537200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.142700,-1.535000,37.599800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.146600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,11.684000>}
box{<0,0,-0.127000><10.560400,0.035000,0.127000> rotate<0,0.000000,0> translate<57.146600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.169000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,35.814000>}
box{<0,0,-0.127000><1.520800,0.035000,0.127000> rotate<0,0.000000,0> translate<57.169000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.284500,-1.535000,8.316100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.411800,-1.535000,8.443400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.284500,-1.535000,8.316100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.284500,-1.535000,11.583800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.411800,-1.535000,11.456500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<57.284500,-1.535000,11.583800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.350400,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,8.382000>}
box{<0,0,-0.127000><10.356600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.350400,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.376800,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.054000,-1.535000,27.432000>}
box{<0,0,-0.127000><2.677200,0.035000,0.127000> rotate<0,0.000000,0> translate<57.376800,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.388900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,37.846000>}
box{<0,0,-0.127000><5.666500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.388900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.394000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.244600,-1.535000,16.764000>}
box{<0,0,-0.127000><2.850600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.394000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.411800,-1.535000,8.443400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.517500,-1.535000,8.588900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<57.411800,-1.535000,8.443400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.411800,-1.535000,11.456500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.517500,-1.535000,11.311000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<57.411800,-1.535000,11.456500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.431100,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,11.430000>}
box{<0,0,-0.127000><10.275900,0.035000,0.127000> rotate<0,0.000000,0> translate<57.431100,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.502400,-1.535000,41.714500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.271600,-1.535000,41.714500>}
box{<0,0,-0.127000><1.769200,0.035000,0.127000> rotate<0,0.000000,0> translate<57.502400,-1.535000,41.714500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.515900,-1.535000,27.489600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,28.004000>}
box{<0,0,-0.127000><0.727471,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.515900,-1.535000,27.489600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.515900,-1.535000,35.670300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.821700,-1.535000,35.364500>}
box{<0,0,-0.127000><0.432467,0.035000,0.127000> rotate<0,44.997030,0> translate<57.515900,-1.535000,35.670300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.517500,-1.535000,8.588900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.599200,-1.535000,8.749200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<57.517500,-1.535000,8.588900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.517500,-1.535000,11.311000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.599200,-1.535000,11.150700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<57.517500,-1.535000,11.311000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.541500,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,8.636000>}
box{<0,0,-0.127000><10.165500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.541500,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.586400,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,11.176000>}
box{<0,0,-0.127000><10.120600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.586400,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.599200,-1.535000,8.749200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.654800,-1.535000,8.920300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<57.599200,-1.535000,8.749200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.599200,-1.535000,11.150700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.654800,-1.535000,10.979600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<57.599200,-1.535000,11.150700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.626200,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,35.560000>}
box{<0,0,-0.127000><1.063600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.626200,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.642900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,38.100000>}
box{<0,0,-0.127000><5.412500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.642900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.644900,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,8.890000>}
box{<0,0,-0.127000><10.062100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.644900,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.648000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.923500,-1.535000,17.018000>}
box{<0,0,-0.127000><2.275500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.648000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.654800,-1.535000,8.920300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.098000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-81.008781,0> translate<57.654800,-1.535000,8.920300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.654800,-1.535000,10.979600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.801900>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,81.008781,0> translate<57.654800,-1.535000,10.979600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.664000,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,10.922000>}
box{<0,0,-0.127000><10.043000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.664000,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.823000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,90.000000,0> translate<57.682900,-1.535000,9.823000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,9.144000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,9.398000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,9.652000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.076800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.801900>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,90.000000,0> translate<57.682900,-1.535000,10.801900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,10.160000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,10.414000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.682900,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,10.668000>}
box{<0,0,-0.127000><10.024100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.682900,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.712300,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.665300,-1.535000,27.686000>}
box{<0,0,-0.127000><1.953000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.712300,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.796200,-1.535000,30.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,30.075900>}
box{<0,0,-0.127000><0.331067,0.035000,0.127000> rotate<0,44.997030,0> translate<57.796200,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.796200,-1.535000,30.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,30.544000>}
box{<0,0,-0.127000><0.330997,0.035000,0.127000> rotate<0,-44.984791,0> translate<57.796200,-1.535000,30.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.796200,-1.535000,32.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.821700,-1.535000,32.875400>}
box{<0,0,-0.127000><0.035992,0.035000,0.127000> rotate<0,-44.884472,0> translate<57.796200,-1.535000,32.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.796200,-1.535000,32.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,32.615900>}
box{<0,0,-0.127000><0.331067,0.035000,0.127000> rotate<0,44.997030,0> translate<57.796200,-1.535000,32.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.821700,-1.535000,32.875400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.772400,-1.535000,32.875400>}
box{<0,0,-0.127000><0.950700,0.035000,0.127000> rotate<0,0.000000,0> translate<57.821700,-1.535000,32.875400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.821700,-1.535000,35.364500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.504400,-1.535000,35.364500>}
box{<0,0,-0.127000><0.682700,0.035000,0.127000> rotate<0,0.000000,0> translate<57.821700,-1.535000,35.364500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.880200,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.637400,-1.535000,30.226000>}
box{<0,0,-0.127000><1.757200,0.035000,0.127000> rotate<0,0.000000,0> translate<57.880200,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.880200,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,32.766000>}
box{<0,0,-0.127000><5.175200,0.035000,0.127000> rotate<0,0.000000,0> translate<57.880200,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.896900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.985800,-1.535000,38.354000>}
box{<0,0,-0.127000><5.088900,0.035000,0.127000> rotate<0,0.000000,0> translate<57.896900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.902000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.758800,-1.535000,17.272000>}
box{<0,0,-0.127000><1.856800,0.035000,0.127000> rotate<0,0.000000,0> translate<57.902000,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.966200,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.986700,-1.535000,30.480000>}
box{<0,0,-0.127000><2.020500,0.035000,0.127000> rotate<0,0.000000,0> translate<57.966200,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.966300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.411300,-1.535000,27.940000>}
box{<0,0,-0.127000><1.445000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.966300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,28.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,28.676100>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<58.030300,-1.535000,28.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,30.075900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,29.403800>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<58.030300,-1.535000,30.075900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,30.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.216100>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,-67.495031,0> translate<58.030300,-1.535000,30.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.030300,-1.535000,32.615900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.943800>}
box{<0,0,-0.127000><0.727479,0.035000,0.127000> rotate<0,67.495031,0> translate<58.030300,-1.535000,32.615900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.073400,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.383400,-1.535000,29.972000>}
box{<0,0,-0.127000><1.310000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.073400,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.073400,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,32.512000>}
box{<0,0,-0.127000><4.982000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.073400,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,38.537200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,39.040100>}
box{<0,0,-0.127000><0.502900,0.035000,0.127000> rotate<0,90.000000,0> translate<58.080100,-1.535000,39.040100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.731800,-1.535000,38.608000>}
box{<0,0,-0.127000><4.651700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.080100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.477800,-1.535000,38.862000>}
box{<0,0,-0.127000><4.397700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.080100,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.080100,-1.535000,39.040100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.265500,-1.535000,39.225400>}
box{<0,0,-0.127000><0.262124,0.035000,0.127000> rotate<0,-44.981575,0> translate<58.080100,-1.535000,39.040100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.109000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.267400,-1.535000,28.194000>}
box{<0,0,-0.127000><1.158400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.109000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.109000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,30.734000>}
box{<0,0,-0.127000><4.946400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.109000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.156000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.669300,-1.535000,17.526000>}
box{<0,0,-0.127000><1.513300,0.035000,0.127000> rotate<0,0.000000,0> translate<58.156000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.156000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.381000,-1.535000,39.116000>}
box{<0,0,-0.127000><1.225000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.156000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.178600,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.255900,-1.535000,29.718000>}
box{<0,0,-0.127000><1.077300,0.035000,0.127000> rotate<0,0.000000,0> translate<58.178600,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.178600,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,32.258000>}
box{<0,0,-0.127000><4.876800,0.035000,0.127000> rotate<0,0.000000,0> translate<58.178600,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.214200,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.162100,-1.535000,28.448000>}
box{<0,0,-0.127000><0.947900,0.035000,0.127000> rotate<0,0.000000,0> translate<58.214200,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.214200,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,30.988000>}
box{<0,0,-0.127000><4.841200,0.035000,0.127000> rotate<0,0.000000,0> translate<58.214200,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.265500,-1.535000,39.225400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.271600,-1.535000,39.225400>}
box{<0,0,-0.127000><1.006100,0.035000,0.127000> rotate<0,0.000000,0> translate<58.265500,-1.535000,39.225400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.283800,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.150700,-1.535000,29.464000>}
box{<0,0,-0.127000><0.866900,0.035000,0.127000> rotate<0,0.000000,0> translate<58.283800,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.283800,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,32.004000>}
box{<0,0,-0.127000><4.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<58.283800,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,28.676100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,29.403800>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,90.000000,0> translate<58.308700,-1.535000,29.403800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,28.702000>}
box{<0,0,-0.127000><0.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,28.956000>}
box{<0,0,-0.127000><0.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,29.210000>}
box{<0,0,-0.127000><0.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.216100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.943800>}
box{<0,0,-0.127000><0.727700,0.035000,0.127000> rotate<0,90.000000,0> translate<58.308700,-1.535000,31.943800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,31.242000>}
box{<0,0,-0.127000><4.746700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,31.496000>}
box{<0,0,-0.127000><4.746700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.308700,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,31.750000>}
box{<0,0,-0.127000><4.746700,0.035000,0.127000> rotate<0,0.000000,0> translate<58.308700,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.410000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,17.780000>}
box{<0,0,-0.127000><3.012500,0.035000,0.127000> rotate<0,0.000000,0> translate<58.410000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.474900,-1.535000,21.365000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.932400,-1.535000,21.554500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<58.474900,-1.535000,21.365000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.504400,-1.535000,35.364500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,35.549900>}
box{<0,0,-0.127000><0.262195,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.504400,-1.535000,35.364500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.664000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.672600,-1.535000,18.034000>}
box{<0,0,-0.127000><1.008600,0.035000,0.127000> rotate<0,0.000000,0> translate<58.664000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,36.052700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,35.549900>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,-90.000000,0> translate<58.689800,-1.535000,35.549900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.689800,-1.535000,36.052700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,36.990100>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.689800,-1.535000,36.052700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.772400,-1.535000,32.875400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.267500,-1.535000,32.875400>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<58.772400,-1.535000,32.875400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.918000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.769200,-1.535000,18.288000>}
box{<0,0,-0.127000><0.851200,0.035000,0.127000> rotate<0,0.000000,0> translate<58.918000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.932400,-1.535000,21.554500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.427500,-1.535000,21.554500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,0.000000,0> translate<58.932400,-1.535000,21.554500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,28.631400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.345300,-1.535000,28.006000>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<59.086200,-1.535000,28.631400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,29.308500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,28.631400>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,-90.000000,0> translate<59.086200,-1.535000,28.631400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.086200,-1.535000,29.308500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.345300,-1.535000,29.933900>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<59.086200,-1.535000,29.308500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.172000,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.943600,-1.535000,18.542000>}
box{<0,0,-0.127000><0.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<59.172000,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.267500,-1.535000,32.875400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.725000,-1.535000,33.064900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<59.267500,-1.535000,32.875400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.271600,-1.535000,39.225400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,38.869800>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<59.271600,-1.535000,39.225400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.271600,-1.535000,41.714500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,42.070100>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.271600,-1.535000,41.714500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.345300,-1.535000,28.006000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,27.527300>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<59.345300,-1.535000,28.006000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.345300,-1.535000,29.933900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,30.412600>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.345300,-1.535000,29.933900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.426000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.996100,-1.535000,18.796000>}
box{<0,0,-0.127000><0.570100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.426000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.427500,-1.535000,21.554500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.625900,-1.535000,21.554500>}
box{<0,0,-0.127000><0.198400,0.035000,0.127000> rotate<0,0.000000,0> translate<59.427500,-1.535000,21.554500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.616600,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,33.020000>}
box{<0,0,-0.127000><3.438800,0.035000,0.127000> rotate<0,0.000000,0> translate<59.616600,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.625900,-1.535000,21.554500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,21.752600>}
box{<0,0,-0.127000><0.280156,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.625900,-1.535000,21.554500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,36.990100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,36.990100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<59.627200,-1.535000,36.990100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,38.869800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,38.869800>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<59.627200,-1.535000,38.869800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.627200,-1.535000,42.070100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,42.070100>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,0.000000,0> translate<59.627200,-1.535000,42.070100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,17.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,17.502300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<59.650800,-1.535000,17.643000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,17.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,17.643000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.650800,-1.535000,17.643000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,17.896800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,18.037600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<59.650800,-1.535000,17.896800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,17.896800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,17.896800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.650800,-1.535000,17.896800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,26.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,26.162300>}
box{<0,0,-0.127000><0.142456,0.035000,0.127000> rotate<0,80.988573,0> translate<59.650800,-1.535000,26.303000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,26.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,26.303000>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.650800,-1.535000,26.303000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,26.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,26.697600>}
box{<0,0,-0.127000><0.142555,0.035000,0.127000> rotate<0,-80.994864,0> translate<59.650800,-1.535000,26.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.650800,-1.535000,26.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,26.556800>}
box{<0,0,-0.127000><1.771700,0.035000,0.127000> rotate<0,0.000000,0> translate<59.650800,-1.535000,26.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.660700,-1.535000,19.030700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,18.867300>}
box{<0,0,-0.127000><0.231012,0.035000,0.127000> rotate<0,45.014567,0> translate<59.660700,-1.535000,19.030700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,17.502300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,17.331200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<59.673100,-1.535000,17.502300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,18.037600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,18.208700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<59.673100,-1.535000,18.037600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,26.162300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,25.991200>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<59.673100,-1.535000,26.162300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.673100,-1.535000,26.697600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,26.868700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<59.673100,-1.535000,26.697600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.725000,-1.535000,33.064900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449900,-1.535000,33.789800>}
box{<0,0,-0.127000><1.025163,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.725000,-1.535000,33.064900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,17.331200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,17.170900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<59.728700,-1.535000,17.331200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,18.208700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,18.369000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<59.728700,-1.535000,18.208700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,25.991200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,25.830900>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<59.728700,-1.535000,25.991200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.728700,-1.535000,26.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,27.029000>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<59.728700,-1.535000,26.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,17.170900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,17.025400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<59.810400,-1.535000,17.170900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,18.369000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,18.514500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<59.810400,-1.535000,18.369000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,25.830900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,25.685400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<59.810400,-1.535000,25.830900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.810400,-1.535000,27.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,27.174500>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<59.810400,-1.535000,27.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,18.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.161500,-1.535000,18.727500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<59.824000,-1.535000,18.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,21.752600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449400,-1.535000,22.011700>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<59.824000,-1.535000,21.752600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,27.527300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.161500,-1.535000,27.387500>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,22.498939,0> translate<59.824000,-1.535000,27.527300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.824000,-1.535000,30.412600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449400,-1.535000,30.671700>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-22.502490,0> translate<59.824000,-1.535000,30.412600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,17.025400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,16.898100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<59.916100,-1.535000,17.025400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,18.514500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,18.641800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.916100,-1.535000,18.514500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,25.685400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,25.558100>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<59.916100,-1.535000,25.685400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.916100,-1.535000,27.174500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,27.301800>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.916100,-1.535000,27.174500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.934100,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,33.274000>}
box{<0,0,-0.127000><3.121300,0.035000,0.127000> rotate<0,0.000000,0> translate<59.934100,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,16.898100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.188900,-1.535000,16.792400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<60.043400,-1.535000,16.898100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,18.641800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.161500,-1.535000,18.727500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<60.043400,-1.535000,18.641800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,25.558100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.188900,-1.535000,25.452400>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,35.994547,0> translate<60.043400,-1.535000,25.558100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.043400,-1.535000,27.301800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.161500,-1.535000,27.387500>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,-35.964375,0> translate<60.043400,-1.535000,27.301800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.188100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,33.528000>}
box{<0,0,-0.127000><2.867300,0.035000,0.127000> rotate<0,0.000000,0> translate<60.188100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.188900,-1.535000,16.792400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.349200,-1.535000,16.710700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<60.188900,-1.535000,16.792400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.188900,-1.535000,25.452400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.349200,-1.535000,25.370700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,27.004764,0> translate<60.188900,-1.535000,25.452400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.349200,-1.535000,16.710700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.520300,-1.535000,16.655100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<60.349200,-1.535000,16.710700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.349200,-1.535000,25.370700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.520300,-1.535000,25.315100>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,18.000702,0> translate<60.349200,-1.535000,25.370700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.442100,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,33.782000>}
box{<0,0,-0.127000><2.613300,0.035000,0.127000> rotate<0,0.000000,0> translate<60.442100,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449400,-1.535000,22.011700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.650500,-1.535000,22.011700>}
box{<0,0,-0.127000><2.201100,0.035000,0.127000> rotate<0,0.000000,0> translate<60.449400,-1.535000,22.011700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449400,-1.535000,30.671700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.650500,-1.535000,30.671700>}
box{<0,0,-0.127000><2.201100,0.035000,0.127000> rotate<0,0.000000,0> translate<60.449400,-1.535000,30.671700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.449900,-1.535000,33.789800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,33.789800>}
box{<0,0,-0.127000><0.502800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.449900,-1.535000,33.789800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.520300,-1.535000,16.655100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.698000,-1.535000,16.627000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<60.520300,-1.535000,16.655100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.520300,-1.535000,25.315100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.698000,-1.535000,25.287000>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,8.985279,0> translate<60.520300,-1.535000,25.315100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.698000,-1.535000,16.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,16.627000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.698000,-1.535000,16.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.698000,-1.535000,25.287000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,25.287000>}
box{<0,0,-0.127000><0.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.698000,-1.535000,25.287000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,33.789800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,34.727200>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.952700,-1.535000,33.789800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,36.990100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,36.052700>}
box{<0,0,-0.127000><1.325684,0.035000,0.127000> rotate<0,44.997030,0> translate<60.952700,-1.535000,36.990100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,38.869800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.338300,-1.535000,39.255400>}
box{<0,0,-0.127000><0.545321,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.952700,-1.535000,38.869800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.952700,-1.535000,42.070100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.278300,-1.535000,41.744500>}
box{<0,0,-0.127000><0.460468,0.035000,0.127000> rotate<0,44.997030,0> translate<60.952700,-1.535000,42.070100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.112800,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,36.830000>}
box{<0,0,-0.127000><1.942600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.112800,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.112800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,41.910000>}
box{<0,0,-0.127000><6.594200,0.035000,0.127000> rotate<0,0.000000,0> translate<61.112800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.198900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,34.036000>}
box{<0,0,-0.127000><1.856500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.198900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.198900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.223800,-1.535000,39.116000>}
box{<0,0,-0.127000><1.024900,0.035000,0.127000> rotate<0,0.000000,0> translate<61.198900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.278300,-1.535000,41.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.847500,-1.535000,41.744500>}
box{<0,0,-0.127000><1.569200,0.035000,0.127000> rotate<0,0.000000,0> translate<61.278300,-1.535000,41.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.338300,-1.535000,39.255400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.084400,-1.535000,39.255400>}
box{<0,0,-0.127000><0.746100,0.035000,0.127000> rotate<0,0.000000,0> translate<61.338300,-1.535000,39.255400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.366800,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,36.576000>}
box{<0,0,-0.127000><1.688600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.366800,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,17.896800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,17.643000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<61.422500,-1.535000,17.643000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,26.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.422500,-1.535000,26.303000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<61.422500,-1.535000,26.303000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,16.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,17.642500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<61.423000,-1.535000,17.642500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,16.764000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,17.018000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,17.272000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,17.526000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,17.642500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,17.642500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,17.642500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,25.287000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,26.302500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<61.423000,-1.535000,26.302500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,25.400000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,25.654000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.423000,-1.535000,26.302500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,26.302500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.423000,-1.535000,26.302500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.452900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,34.290000>}
box{<0,0,-0.127000><1.602500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.452900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.620800,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,36.322000>}
box{<0,0,-0.127000><1.434600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.620800,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,16.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.401900,-1.535000,16.627000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<61.676800,-1.535000,16.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,17.642500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,16.627000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<61.676800,-1.535000,16.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,25.287000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.401900,-1.535000,25.287000>}
box{<0,0,-0.127000><0.725100,0.035000,0.127000> rotate<0,0.000000,0> translate<61.676800,-1.535000,25.287000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,26.302500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.676800,-1.535000,25.287000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<61.676800,-1.535000,25.287000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,17.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,17.896800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<61.677400,-1.535000,17.896800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,17.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,17.643000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,17.643000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,17.780000>}
box{<0,0,-0.127000><6.029600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,17.896800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,17.896800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,17.896800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,26.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,26.556800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<61.677400,-1.535000,26.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,26.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,26.303000>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,26.303000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,26.416000>}
box{<0,0,-0.127000><6.029600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.677400,-1.535000,26.556800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,26.556800>}
box{<0,0,-0.127000><1.771600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.677400,-1.535000,26.556800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.706900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,34.544000>}
box{<0,0,-0.127000><1.348500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.706900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.874800,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,36.068000>}
box{<0,0,-0.127000><1.180600,0.035000,0.127000> rotate<0,0.000000,0> translate<61.874800,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,34.727200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,36.052700>}
box{<0,0,-0.127000><1.325500,0.035000,0.127000> rotate<0,90.000000,0> translate<61.890100,-1.535000,36.052700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,34.798000>}
box{<0,0,-0.127000><1.165300,0.035000,0.127000> rotate<0,0.000000,0> translate<61.890100,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,35.052000>}
box{<0,0,-0.127000><1.165300,0.035000,0.127000> rotate<0,0.000000,0> translate<61.890100,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,35.306000>}
box{<0,0,-0.127000><1.165300,0.035000,0.127000> rotate<0,0.000000,0> translate<61.890100,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,35.560000>}
box{<0,0,-0.127000><1.165300,0.035000,0.127000> rotate<0,0.000000,0> translate<61.890100,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.890100,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,35.814000>}
box{<0,0,-0.127000><1.165300,0.035000,0.127000> rotate<0,0.000000,0> translate<61.890100,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.084400,-1.535000,39.255400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,38.284400>}
box{<0,0,-0.127000><1.373201,0.035000,0.127000> rotate<0,44.997030,0> translate<62.084400,-1.535000,39.255400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.401900,-1.535000,16.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.579600,-1.535000,16.655100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<62.401900,-1.535000,16.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.401900,-1.535000,25.287000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.579600,-1.535000,25.315100>}
box{<0,0,-0.127000><0.179908,0.035000,0.127000> rotate<0,-8.985279,0> translate<62.401900,-1.535000,25.287000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.579600,-1.535000,16.655100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.750700,-1.535000,16.710700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<62.579600,-1.535000,16.655100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.579600,-1.535000,25.315100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.750700,-1.535000,25.370700>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-18.000702,0> translate<62.579600,-1.535000,25.315100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.650500,-1.535000,22.011700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,21.752600>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,22.502490,0> translate<62.650500,-1.535000,22.011700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.650500,-1.535000,30.671700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,30.503900>}
box{<0,0,-0.127000><0.438293,0.035000,0.127000> rotate<0,22.508772,0> translate<62.650500,-1.535000,30.671700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.750700,-1.535000,16.710700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.911000,-1.535000,16.792400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<62.750700,-1.535000,16.710700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.750700,-1.535000,25.370700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.911000,-1.535000,25.452400>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-27.004764,0> translate<62.750700,-1.535000,25.370700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.808100,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,25.400000>}
box{<0,0,-0.127000><4.898900,0.035000,0.127000> rotate<0,0.000000,0> translate<62.808100,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.847500,-1.535000,41.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.305000,-1.535000,41.555000>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,22.498226,0> translate<62.847500,-1.535000,41.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.855200,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,16.764000>}
box{<0,0,-0.127000><4.851800,0.035000,0.127000> rotate<0,0.000000,0> translate<62.855200,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.911000,-1.535000,16.792400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,16.898100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<62.911000,-1.535000,16.792400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.911000,-1.535000,25.452400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,25.558100>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-35.994547,0> translate<62.911000,-1.535000,25.452400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.938400,-1.535000,18.727500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,18.641800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<62.938400,-1.535000,18.727500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.938400,-1.535000,18.727500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,18.867300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<62.938400,-1.535000,18.727500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.938400,-1.535000,27.387500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,27.301800>}
box{<0,0,-0.127000><0.145918,0.035000,0.127000> rotate<0,35.964375,0> translate<62.938400,-1.535000,27.387500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.938400,-1.535000,27.387500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,27.527300>}
box{<0,0,-0.127000><0.365308,0.035000,0.127000> rotate<0,-22.498939,0> translate<62.938400,-1.535000,27.387500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.045800,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,27.432000>}
box{<0,0,-0.127000><4.661200,0.035000,0.127000> rotate<0,0.000000,0> translate<63.045800,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055300,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,21.844000>}
box{<0,0,-0.127000><4.651700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.055300,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,38.284400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.055400,-1.535000,30.503900>}
box{<0,0,-0.127000><7.780500,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.055400,-1.535000,30.503900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,16.898100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,17.025400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.056500,-1.535000,16.898100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,18.641800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,18.514500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<63.056500,-1.535000,18.641800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,25.558100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,25.685400>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.056500,-1.535000,25.558100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.056500,-1.535000,27.301800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,27.174500>}
box{<0,0,-0.127000><0.180029,0.035000,0.127000> rotate<0,44.997030,0> translate<63.056500,-1.535000,27.301800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,2.638800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,1.941200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<63.057000,-1.535000,2.638800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,3.361100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,2.638800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.057000,-1.535000,2.638800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,3.361100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,4.058700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<63.057000,-1.535000,3.361100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.038800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,45.341200>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,74.996687,0> translate<63.057000,-1.535000,46.038800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.761100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.038800>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.057000,-1.535000,46.038800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.057000,-1.535000,46.761100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,47.458700>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-74.996687,0> translate<63.057000,-1.535000,46.761100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.061200,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,41.656000>}
box{<0,0,-0.127000><4.645800,0.035000,0.127000> rotate<0,0.000000,0> translate<63.061200,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.103700,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,18.796000>}
box{<0,0,-0.127000><4.603300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.103700,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.152400,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,25.654000>}
box{<0,0,-0.127000><4.554600,0.035000,0.127000> rotate<0,0.000000,0> translate<63.152400,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.156300,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,18.542000>}
box{<0,0,-0.127000><4.550700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.156300,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.176400,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,17.018000>}
box{<0,0,-0.127000><4.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<63.176400,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.180300,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,27.178000>}
box{<0,0,-0.127000><4.526700,0.035000,0.127000> rotate<0,0.000000,0> translate<63.180300,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,17.025400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,17.170900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<63.183800,-1.535000,17.025400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,18.514500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,18.369000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<63.183800,-1.535000,18.514500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,25.685400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,25.830900>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,-53.999513,0> translate<63.183800,-1.535000,25.685400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.183800,-1.535000,27.174500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,27.029000>}
box{<0,0,-0.127000><0.179841,0.035000,0.127000> rotate<0,53.999513,0> translate<63.183800,-1.535000,27.174500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,1.941200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.556400,-1.535000,1.400000>}
box{<0,0,-0.127000><0.624943,0.035000,0.127000> rotate<0,59.993021,0> translate<63.243900,-1.535000,1.941200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,4.058700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,4.684200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<63.243900,-1.535000,4.058700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,45.341200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,44.715700>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,59.998279,0> translate<63.243900,-1.535000,45.341200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.243900,-1.535000,47.458700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,48.084200>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-59.998279,0> translate<63.243900,-1.535000,47.458700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,18.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.754600,-1.535000,19.346000>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.275900,-1.535000,18.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,21.752600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.754600,-1.535000,21.273900>}
box{<0,0,-0.127000><0.676984,0.035000,0.127000> rotate<0,44.997030,0> translate<63.275900,-1.535000,21.752600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.275900,-1.535000,27.527300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.474000,-1.535000,27.725400>}
box{<0,0,-0.127000><0.280156,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.275900,-1.535000,27.527300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,17.170900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,17.331200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<63.289500,-1.535000,17.170900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,18.369000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,18.208700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<63.289500,-1.535000,18.369000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,25.830900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,25.991200>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,-62.989297,0> translate<63.289500,-1.535000,25.830900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.289500,-1.535000,27.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,26.868700>}
box{<0,0,-0.127000><0.179919,0.035000,0.127000> rotate<0,62.989297,0> translate<63.289500,-1.535000,27.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.305000,-1.535000,41.555000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.655000,-1.535000,41.205000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,44.997030,0> translate<63.305000,-1.535000,41.555000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.328700,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,25.908000>}
box{<0,0,-0.127000><4.378300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.328700,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.330800,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,18.288000>}
box{<0,0,-0.127000><4.376200,0.035000,0.127000> rotate<0,0.000000,0> translate<63.330800,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.341000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,17.272000>}
box{<0,0,-0.127000><4.366000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.341000,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.343100,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,26.924000>}
box{<0,0,-0.127000><4.363900,0.035000,0.127000> rotate<0,0.000000,0> translate<63.343100,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,17.331200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,17.502300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<63.371200,-1.535000,17.331200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,18.208700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,18.037600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<63.371200,-1.535000,18.208700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,25.991200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,26.162300>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,-71.993358,0> translate<63.371200,-1.535000,25.991200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.371200,-1.535000,26.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,26.697600>}
box{<0,0,-0.127000><0.179907,0.035000,0.127000> rotate<0,71.993358,0> translate<63.371200,-1.535000,26.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426700,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,26.162000>}
box{<0,0,-0.127000><4.280300,0.035000,0.127000> rotate<0,0.000000,0> translate<63.426700,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,17.502300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,17.643000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<63.426800,-1.535000,17.502300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,18.037600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,17.896800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<63.426800,-1.535000,18.037600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,26.162300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,26.303000>}
box{<0,0,-0.127000><0.142441,0.035000,0.127000> rotate<0,-81.028299,0> translate<63.426800,-1.535000,26.162300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.426800,-1.535000,26.697600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.449000,-1.535000,26.556800>}
box{<0,0,-0.127000><0.142539,0.035000,0.127000> rotate<0,81.034563,0> translate<63.426800,-1.535000,26.697600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.427400,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,18.034000>}
box{<0,0,-0.127000><4.279600,0.035000,0.127000> rotate<0,0.000000,0> translate<63.427400,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.430500,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,17.526000>}
box{<0,0,-0.127000><4.276500,0.035000,0.127000> rotate<0,0.000000,0> translate<63.430500,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.431200,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,26.670000>}
box{<0,0,-0.127000><4.275800,0.035000,0.127000> rotate<0,0.000000,0> translate<63.431200,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.434600,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,27.686000>}
box{<0,0,-0.127000><4.272400,0.035000,0.127000> rotate<0,0.000000,0> translate<63.434600,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.438500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,21.590000>}
box{<0,0,-0.127000><4.268500,0.035000,0.127000> rotate<0,0.000000,0> translate<63.438500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.458000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,41.402000>}
box{<0,0,-0.127000><4.249000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.458000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.458600,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,19.050000>}
box{<0,0,-0.127000><4.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<63.458600,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.474000,-1.535000,27.725400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.617500,-1.535000,27.725400>}
box{<0,0,-0.127000><0.143500,0.035000,0.127000> rotate<0,0.000000,0> translate<63.474000,-1.535000,27.725400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,4.684200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.115700,-1.535000,5.194900>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.605000,-1.535000,4.684200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,44.715700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.115700,-1.535000,44.205000>}
box{<0,0,-0.127000><0.722239,0.035000,0.127000> rotate<0,44.997030,0> translate<63.605000,-1.535000,44.715700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.605000,-1.535000,48.084200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.727900,-1.535000,48.207000>}
box{<0,0,-0.127000><0.173736,0.035000,0.127000> rotate<0,-44.973712,0> translate<63.605000,-1.535000,48.084200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.617500,-1.535000,27.725400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.075000,-1.535000,27.914900>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-22.498226,0> translate<63.617500,-1.535000,27.725400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.655000,-1.535000,41.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.355000,-1.535000,39.505000>}
box{<0,0,-0.127000><2.404163,0.035000,0.127000> rotate<0,44.997030,0> translate<63.655000,-1.535000,41.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.692500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,21.336000>}
box{<0,0,-0.127000><4.014500,0.035000,0.127000> rotate<0,0.000000,0> translate<63.692500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.712000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,41.148000>}
box{<0,0,-0.127000><3.995000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.712000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.712600,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,19.304000>}
box{<0,0,-0.127000><3.994400,0.035000,0.127000> rotate<0,0.000000,0> translate<63.712600,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.754600,-1.535000,19.346000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,19.971400>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,-67.491570,0> translate<63.754600,-1.535000,19.346000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.754600,-1.535000,21.273900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,20.648500>}
box{<0,0,-0.127000><0.676948,0.035000,0.127000> rotate<0,67.491570,0> translate<63.754600,-1.535000,21.273900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.834200,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,21.082000>}
box{<0,0,-0.127000><3.872800,0.035000,0.127000> rotate<0,0.000000,0> translate<63.834200,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.842400,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,19.558000>}
box{<0,0,-0.127000><3.864600,0.035000,0.127000> rotate<0,0.000000,0> translate<63.842400,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.939400,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,20.828000>}
box{<0,0,-0.127000><3.767600,0.035000,0.127000> rotate<0,0.000000,0> translate<63.939400,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.947600,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,19.812000>}
box{<0,0,-0.127000><3.759400,0.035000,0.127000> rotate<0,0.000000,0> translate<63.947600,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.966000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,40.894000>}
box{<0,0,-0.127000><3.741000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.966000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,19.971400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,20.648500>}
box{<0,0,-0.127000><0.677100,0.035000,0.127000> rotate<0,90.000000,0> translate<64.013700,-1.535000,20.648500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,20.066000>}
box{<0,0,-0.127000><3.693300,0.035000,0.127000> rotate<0,0.000000,0> translate<64.013700,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,20.320000>}
box{<0,0,-0.127000><3.693300,0.035000,0.127000> rotate<0,0.000000,0> translate<64.013700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.013700,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,20.574000>}
box{<0,0,-0.127000><3.693300,0.035000,0.127000> rotate<0,0.000000,0> translate<64.013700,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.075000,-1.535000,27.914900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.425000,-1.535000,28.264900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<64.075000,-1.535000,27.914900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.100100,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,27.940000>}
box{<0,0,-0.127000><3.606900,0.035000,0.127000> rotate<0,0.000000,0> translate<64.100100,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.115700,-1.535000,5.194900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.741200,-1.535000,5.556000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<64.115700,-1.535000,5.194900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.115700,-1.535000,44.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.741200,-1.535000,43.843900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<64.115700,-1.535000,44.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.220000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,40.640000>}
box{<0,0,-0.127000><3.487000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.220000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.354100,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,28.194000>}
box{<0,0,-0.127000><3.352900,0.035000,0.127000> rotate<0,0.000000,0> translate<64.354100,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.425000,-1.535000,28.264900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.495000,-1.535000,28.334900>}
box{<0,0,-0.127000><0.098995,0.035000,0.127000> rotate<0,-44.997030,0> translate<64.425000,-1.535000,28.264900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.474000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,40.386000>}
box{<0,0,-0.127000><3.233000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.474000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.495000,-1.535000,28.334900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.495000,-1.535000,28.335000>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<64.495000,-1.535000,28.335000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.495000,-1.535000,28.335000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.005000,-1.535000,28.844900>}
box{<0,0,-0.127000><0.721178,0.035000,0.127000> rotate<0,-44.991413,0> translate<64.495000,-1.535000,28.335000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.608000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,28.448000>}
box{<0,0,-0.127000><3.099000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.608000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.728000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,40.132000>}
box{<0,0,-0.127000><2.979000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.728000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.741200,-1.535000,5.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.438800,-1.535000,5.742900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<64.741200,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.741200,-1.535000,43.843900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.438800,-1.535000,43.657000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<64.741200,-1.535000,43.843900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.862000,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,28.702000>}
box{<0,0,-0.127000><2.845000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.862000,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.982000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,39.878000>}
box{<0,0,-0.127000><2.725000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.982000,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.005000,-1.535000,28.844900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.355000,-1.535000,29.194900>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.005000,-1.535000,28.844900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.116100,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,28.956000>}
box{<0,0,-0.127000><2.590900,0.035000,0.127000> rotate<0,0.000000,0> translate<65.116100,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.236000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,39.624000>}
box{<0,0,-0.127000><2.471000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.236000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.355000,-1.535000,29.194900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,29.652400>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,-67.495834,0> translate<65.355000,-1.535000,29.194900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.355000,-1.535000,39.505000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,39.047500>}
box{<0,0,-0.127000><0.495193,0.035000,0.127000> rotate<0,67.495834,0> translate<65.355000,-1.535000,39.505000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.361200,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,29.210000>}
box{<0,0,-0.127000><2.345800,0.035000,0.127000> rotate<0,0.000000,0> translate<65.361200,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.411000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,39.370000>}
box{<0,0,-0.127000><2.296000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.411000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.438800,-1.535000,5.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.161100,-1.535000,5.742900>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<65.438800,-1.535000,5.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.438800,-1.535000,43.657000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.161100,-1.535000,43.657000>}
box{<0,0,-0.127000><0.722300,0.035000,0.127000> rotate<0,0.000000,0> translate<65.438800,-1.535000,43.657000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.466400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,29.464000>}
box{<0,0,-0.127000><2.240600,0.035000,0.127000> rotate<0,0.000000,0> translate<65.466400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.516200,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,39.116000>}
box{<0,0,-0.127000><2.190800,0.035000,0.127000> rotate<0,0.000000,0> translate<65.516200,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,29.652400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.552400>}
box{<0,0,-0.127000><8.900000,0.035000,0.127000> rotate<0,90.000000,0> translate<65.544500,-1.535000,38.552400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,29.718000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,29.972000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,30.226000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,30.480000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,30.734000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,30.988000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,31.242000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,31.496000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,31.750000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,32.004000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,32.258000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,32.512000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,32.766000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,33.020000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,33.274000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,33.528000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,33.782000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,34.036000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,34.290000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,34.544000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,34.798000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,35.052000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,35.306000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,35.560000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,35.814000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,36.068000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,36.322000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,36.576000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,36.830000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,37.084000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,37.338000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,37.592000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,37.846000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,38.100000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,38.354000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.552400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,39.047500>}
box{<0,0,-0.127000><0.495100,0.035000,0.127000> rotate<0,90.000000,0> translate<65.544500,-1.535000,39.047500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,38.608000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.544500,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,38.862000>}
box{<0,0,-0.127000><2.162500,0.035000,0.127000> rotate<0,0.000000,0> translate<65.544500,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.161100,-1.535000,5.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.858700,-1.535000,5.556000>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,14.997374,0> translate<66.161100,-1.535000,5.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.161100,-1.535000,43.657000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.858700,-1.535000,43.843900>}
box{<0,0,-0.127000><0.722203,0.035000,0.127000> rotate<0,-14.997374,0> translate<66.161100,-1.535000,43.657000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.276800,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,43.688000>}
box{<0,0,-0.127000><1.430200,0.035000,0.127000> rotate<0,0.000000,0> translate<66.276800,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.739300,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,5.588000>}
box{<0,0,-0.127000><0.967700,0.035000,0.127000> rotate<0,0.000000,0> translate<66.739300,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.858700,-1.535000,5.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.484200,-1.535000,5.194900>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,29.995781,0> translate<66.858700,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.858700,-1.535000,43.843900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.484200,-1.535000,44.205000>}
box{<0,0,-0.127000><0.722249,0.035000,0.127000> rotate<0,-29.995781,0> translate<66.858700,-1.535000,43.843900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.028600,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,43.942000>}
box{<0,0,-0.127000><0.678400,0.035000,0.127000> rotate<0,0.000000,0> translate<67.028600,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.243300,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,5.334000>}
box{<0,0,-0.127000><0.463700,0.035000,0.127000> rotate<0,0.000000,0> translate<67.243300,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.468600,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,44.196000>}
box{<0,0,-0.127000><0.238400,0.035000,0.127000> rotate<0,0.000000,0> translate<67.468600,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.484200,-1.535000,5.194900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,4.972000>}
box{<0,0,-0.127000><0.315158,0.035000,0.127000> rotate<0,45.009885,0> translate<67.484200,-1.535000,5.194900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.484200,-1.535000,44.205000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,44.427900>}
box{<0,0,-0.127000><0.315158,0.035000,0.127000> rotate<0,-45.009885,0> translate<67.484200,-1.535000,44.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.599100,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,5.080000>}
box{<0,0,-0.127000><0.107900,0.035000,0.127000> rotate<0,0.000000,0> translate<67.599100,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,44.427900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.707000,-1.535000,4.972000>}
box{<0,0,-0.127000><39.455900,0.035000,0.127000> rotate<0,-90.000000,0> translate<67.707000,-1.535000,4.972000> }
texture{col_pol}
}
#end
union{
cylinder{<17.380000,0.038000,37.930000><17.380000,-1.538000,37.930000>0.406400}
cylinder{<17.380000,0.038000,40.470000><17.380000,-1.538000,40.470000>0.406400}
cylinder{<24.700000,0.038000,26.500000><24.700000,-1.538000,26.500000>0.406400}
cylinder{<29.780000,0.038000,26.500000><29.780000,-1.538000,26.500000>0.406400}
cylinder{<6.620000,0.038000,39.100000><6.620000,-1.538000,39.100000>0.406400}
cylinder{<11.700000,0.038000,39.100000><11.700000,-1.538000,39.100000>0.406400}
cylinder{<53.940000,0.038000,15.070000><53.940000,-1.538000,15.070000>0.406400}
cylinder{<53.940000,0.038000,20.150000><53.940000,-1.538000,20.150000>0.406400}
cylinder{<22.190000,0.038000,18.880000><22.190000,-1.538000,18.880000>0.406400}
cylinder{<22.190000,0.038000,13.800000><22.190000,-1.538000,13.800000>0.406400}
cylinder{<27.270000,0.038000,18.880000><27.270000,-1.538000,18.880000>0.406400}
cylinder{<27.270000,0.038000,13.800000><27.270000,-1.538000,13.800000>0.406400}
cylinder{<27.270000,0.038000,7.150000><27.270000,-1.538000,7.150000>0.406400}
cylinder{<27.270000,0.038000,9.690000><27.270000,-1.538000,9.690000>0.406400}
cylinder{<15.840000,0.038000,8.720000><15.840000,-1.538000,8.720000>0.406400}
cylinder{<20.920000,0.038000,8.720000><20.920000,-1.538000,8.720000>0.406400}
cylinder{<60.290000,0.038000,35.390000><60.290000,-1.538000,35.390000>0.406400}
cylinder{<60.290000,0.038000,40.470000><60.290000,-1.538000,40.470000>0.406400}
cylinder{<8.220000,0.038000,26.500000><8.220000,-1.538000,26.500000>0.406400}
cylinder{<8.220000,0.038000,16.340000><8.220000,-1.538000,16.340000>0.406400}
cylinder{<36.160000,0.038000,30.310000><36.160000,-1.538000,30.310000>0.400000}
cylinder{<36.160000,0.038000,27.770000><36.160000,-1.538000,27.770000>0.400000}
cylinder{<36.160000,0.038000,25.230000><36.160000,-1.538000,25.230000>0.400000}
cylinder{<36.160000,0.038000,22.690000><36.160000,-1.538000,22.690000>0.400000}
cylinder{<36.160000,0.038000,20.150000><36.160000,-1.538000,20.150000>0.400000}
cylinder{<36.160000,0.038000,17.610000><36.160000,-1.538000,17.610000>0.400000}
cylinder{<36.160000,0.038000,15.070000><36.160000,-1.538000,15.070000>0.400000}
cylinder{<43.780000,0.038000,15.070000><43.780000,-1.538000,15.070000>0.400000}
cylinder{<43.780000,0.038000,17.610000><43.780000,-1.538000,17.610000>0.400000}
cylinder{<43.780000,0.038000,20.150000><43.780000,-1.538000,20.150000>0.400000}
cylinder{<43.780000,0.038000,22.690000><43.780000,-1.538000,22.690000>0.400000}
cylinder{<43.780000,0.038000,25.230000><43.780000,-1.538000,25.230000>0.400000}
cylinder{<43.780000,0.038000,27.770000><43.780000,-1.538000,27.770000>0.400000}
cylinder{<43.780000,0.038000,30.310000><43.780000,-1.538000,30.310000>0.400000}
cylinder{<8.250000,0.038000,11.250000><8.250000,-1.538000,11.250000>0.508000}
cylinder{<8.250000,0.038000,8.710000><8.250000,-1.538000,8.710000>0.508000}
cylinder{<41.260000,0.038000,40.450000><41.260000,-1.538000,40.450000>0.508000}
cylinder{<38.720000,0.038000,40.450000><38.720000,-1.538000,40.450000>0.508000}
cylinder{<61.550000,0.038000,17.770000><61.550000,-1.538000,17.770000>0.508000}
cylinder{<61.550000,0.038000,20.310000><61.550000,-1.538000,20.310000>0.508000}
cylinder{<54.000000,0.038000,9.950000><54.000000,-1.538000,9.950000>0.508000}
cylinder{<56.540000,0.038000,9.950000><56.540000,-1.538000,9.950000>0.508000}
cylinder{<61.550000,0.038000,26.430000><61.550000,-1.538000,26.430000>0.508000}
cylinder{<61.550000,0.038000,28.970000><61.550000,-1.538000,28.970000>0.508000}
cylinder{<30.180000,0.038000,35.390000><30.180000,-1.538000,35.390000>0.300000}
cylinder{<22.560000,0.038000,43.010000><22.560000,-1.538000,43.010000>0.300000}
cylinder{<56.480000,0.038000,34.120000><56.480000,-1.538000,34.120000>0.300000}
cylinder{<48.860000,0.038000,29.040000><48.860000,-1.538000,29.040000>0.300000}
cylinder{<56.480000,0.038000,31.580000><56.480000,-1.538000,31.580000>0.300000}
cylinder{<48.860000,0.038000,26.500000><48.860000,-1.538000,26.500000>0.300000}
cylinder{<56.480000,0.038000,29.040000><56.480000,-1.538000,29.040000>0.300000}
cylinder{<48.860000,0.038000,23.960000><48.860000,-1.538000,23.960000>0.300000}
cylinder{<22.190000,0.038000,26.500000><22.190000,-1.538000,26.500000>0.406400}
cylinder{<12.030000,0.038000,26.500000><12.030000,-1.538000,26.500000>0.406400}
cylinder{<16.380000,0.038000,31.580000><16.380000,-1.538000,31.580000>0.406400}
cylinder{<6.220000,0.038000,31.580000><6.220000,-1.538000,31.580000>0.406400}
cylinder{<17.110000,0.038000,12.530000><17.110000,-1.538000,12.530000>0.406400}
cylinder{<17.110000,0.038000,22.690000><17.110000,-1.538000,22.690000>0.406400}
cylinder{<19.990000,0.038000,31.580000><19.990000,-1.538000,31.580000>0.406400}
cylinder{<30.150000,0.038000,31.580000><30.150000,-1.538000,31.580000>0.406400}
cylinder{<48.860000,0.038000,20.150000><48.860000,-1.538000,20.150000>0.406400}
cylinder{<48.860000,0.038000,9.990000><48.860000,-1.538000,9.990000>0.406400}
cylinder{<22.190000,0.038000,22.690000><22.190000,-1.538000,22.690000>0.406400}
cylinder{<32.350000,0.038000,22.690000><32.350000,-1.538000,22.690000>0.406400}
cylinder{<13.300000,0.038000,22.690000><13.300000,-1.538000,22.690000>0.406400}
cylinder{<13.300000,0.038000,12.530000><13.300000,-1.538000,12.530000>0.406400}
cylinder{<32.990000,0.038000,35.410000><32.990000,-1.538000,35.410000>0.406400}
cylinder{<32.990000,0.038000,25.250000><32.990000,-1.538000,25.250000>0.406400}
cylinder{<32.350000,0.038000,18.880000><32.350000,-1.538000,18.880000>0.406400}
cylinder{<32.350000,0.038000,8.720000><32.350000,-1.538000,8.720000>0.406400}
cylinder{<34.890000,0.038000,9.990000><34.890000,-1.538000,9.990000>0.406400}
cylinder{<45.050000,0.038000,9.990000><45.050000,-1.538000,9.990000>0.406400}
cylinder{<46.320000,0.038000,39.200000><46.320000,-1.538000,39.200000>0.406400}
cylinder{<56.480000,0.038000,39.200000><56.480000,-1.538000,39.200000>0.406400}
//Holes(fast)/Vias
cylinder{<51.700000,0.038000,36.850000><51.700000,-1.538000,36.850000>0.300000 }
cylinder{<51.700000,0.038000,29.050000><51.700000,-1.538000,29.050000>0.300000 }
cylinder{<51.700000,0.038000,36.800000><51.700000,-1.538000,36.800000>0.300000 }
cylinder{<46.700000,0.038000,22.550000><46.700000,-1.538000,22.550000>0.300000 }
cylinder{<46.700000,0.038000,32.650000><46.700000,-1.538000,32.650000>0.300000 }
cylinder{<22.200000,0.038000,28.950000><22.200000,-1.538000,28.950000>0.300000 }
cylinder{<10.400000,0.038000,28.950000><10.400000,-1.538000,28.950000>0.300000 }
cylinder{<53.800000,0.038000,34.800000><53.800000,-1.538000,34.800000>0.300000 }
cylinder{<53.800000,0.038000,29.100000><53.800000,-1.538000,29.100000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.168000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.549000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.110000,0.000000,37.549000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.491000,0.000000,37.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.549000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.110000,0.000000,37.549000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.930000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.110000,0.000000,37.930000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,37.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.729000,0.000000,37.549000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.729000,0.000000,37.549000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,37.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,38.438000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.380000,0.000000,38.438000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,38.438000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.650000,0.000000,38.438000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.380000,0.000000,38.438000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.650000,0.000000,38.438000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.650000,0.000000,38.946000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.650000,0.000000,38.946000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.650000,0.000000,38.946000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,38.946000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.110000,0.000000,38.946000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,38.946000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,38.438000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.110000,0.000000,38.438000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.110000,0.000000,38.438000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,38.438000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.110000,0.000000,38.438000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,39.835000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.380000,0.000000,40.851000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.380000,0.000000,40.851000> }
difference{
cylinder{<17.380000,0,39.200000><17.380000,0.036000,39.200000>2.870200 translate<0,0.000000,0>}
cylinder{<17.380000,-0.1,39.200000><17.380000,0.135000,39.200000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<17.380000,0.000000,39.708000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.935200,0.000000,27.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.935200,0.000000,26.500000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<26.935200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.935200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.935200,0.000000,25.865000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<26.935200,0.000000,25.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.935200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.716000,0.000000,26.500000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<25.716000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.570200,0.000000,27.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.570200,0.000000,26.500000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.570200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.570200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.570200,0.000000,25.865000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.570200,0.000000,25.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.570200,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.764000,0.000000,26.500000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.570200,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557000,0.000000,28.024000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557000,0.000000,24.976000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.557000,0.000000,24.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.811000,0.000000,24.722000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.669000,0.000000,24.722000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.811000,0.000000,24.722000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.923000,0.000000,24.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.923000,0.000000,28.024000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.923000,0.000000,28.024000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.669000,0.000000,28.278000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.811000,0.000000,28.278000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.811000,0.000000,28.278000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.669000,0.000000,28.024000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.669000,0.000000,24.976000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.811000,0.000000,24.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.811000,0.000000,28.024000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.855200,0.000000,39.735000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.855200,0.000000,39.100000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<8.855200,0.000000,39.100000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.855200,0.000000,39.100000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.855200,0.000000,38.465000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<8.855200,0.000000,38.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.855200,0.000000,39.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.636000,0.000000,39.100000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<7.636000,0.000000,39.100000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.490200,0.000000,39.735000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.490200,0.000000,39.100000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<9.490200,0.000000,39.100000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.490200,0.000000,39.100000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.490200,0.000000,38.465000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<9.490200,0.000000,38.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.490200,0.000000,39.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.684000,0.000000,39.100000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<9.490200,0.000000,39.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.477000,0.000000,40.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.477000,0.000000,37.576000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.477000,0.000000,37.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.731000,0.000000,37.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.589000,0.000000,37.322000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.731000,0.000000,37.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.843000,0.000000,37.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.843000,0.000000,40.624000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.843000,0.000000,40.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.589000,0.000000,40.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.731000,0.000000,40.878000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.731000,0.000000,40.878000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<12.589000,0.000000,40.624000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<12.589000,0.000000,37.576000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.731000,0.000000,37.576000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.731000,0.000000,40.624000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.305000,0.000000,17.305200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.940000,0.000000,17.305200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.305000,0.000000,17.305200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.940000,0.000000,17.305200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.575000,0.000000,17.305200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.940000,0.000000,17.305200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,17.305200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,16.086000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.940000,0.000000,16.086000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.305000,0.000000,17.940200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.940000,0.000000,17.940200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.305000,0.000000,17.940200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.940000,0.000000,17.940200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.575000,0.000000,17.940200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<53.940000,0.000000,17.940200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,17.940200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,19.134000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<53.940000,0.000000,19.134000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.416000,0.000000,13.927000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.464000,0.000000,13.927000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.416000,0.000000,13.927000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.718000,0.000000,14.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.718000,0.000000,21.039000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.718000,0.000000,21.039000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.464000,0.000000,21.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.416000,0.000000,21.293000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.416000,0.000000,21.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.162000,0.000000,21.039000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.162000,0.000000,14.181000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.162000,0.000000,14.181000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.416000,0.000000,21.039000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<55.464000,0.000000,21.039000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<55.464000,0.000000,14.181000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.416000,0.000000,14.181000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.825000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.190000,0.000000,16.644800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.190000,0.000000,16.644800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.190000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.555000,0.000000,16.644800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<21.555000,0.000000,16.644800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,17.864000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<22.190000,0.000000,17.864000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.825000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.190000,0.000000,16.009800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.190000,0.000000,16.009800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.190000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<21.555000,0.000000,16.009800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<21.555000,0.000000,16.009800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,14.816000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.190000,0.000000,14.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.714000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.666000,0.000000,20.023000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.666000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.412000,0.000000,19.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.412000,0.000000,12.911000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.412000,0.000000,12.911000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.666000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.714000,0.000000,12.657000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.666000,0.000000,12.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.968000,0.000000,12.911000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.968000,0.000000,19.769000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.968000,0.000000,19.769000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.714000,0.000000,12.911000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.666000,0.000000,12.911000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.666000,0.000000,19.769000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.714000,0.000000,19.769000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.905000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.270000,0.000000,16.644800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.270000,0.000000,16.644800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.270000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.635000,0.000000,16.644800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<26.635000,0.000000,16.644800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,16.644800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,17.864000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<27.270000,0.000000,17.864000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.905000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.270000,0.000000,16.009800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<27.270000,0.000000,16.009800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.270000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.635000,0.000000,16.009800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<26.635000,0.000000,16.009800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,16.009800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,14.816000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.270000,0.000000,14.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.794000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.746000,0.000000,20.023000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.746000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.492000,0.000000,19.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.492000,0.000000,12.911000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.492000,0.000000,12.911000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.746000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.794000,0.000000,12.657000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.746000,0.000000,12.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.048000,0.000000,12.911000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.048000,0.000000,19.769000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.048000,0.000000,19.769000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.794000,0.000000,12.911000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.746000,0.000000,12.911000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.746000,0.000000,19.769000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.794000,0.000000,19.769000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,6.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,6.769000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.000000,0.000000,6.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.381000,0.000000,6.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,6.769000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.000000,0.000000,6.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,6.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,7.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.000000,0.000000,7.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,6.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.619000,0.000000,6.769000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.619000,0.000000,6.769000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,6.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,7.658000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.270000,0.000000,7.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,7.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,7.658000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.270000,0.000000,7.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,7.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,8.166000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.540000,0.000000,8.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,8.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,8.166000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.000000,0.000000,8.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,8.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,7.658000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.000000,0.000000,7.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.000000,0.000000,7.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,7.658000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.000000,0.000000,7.658000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,9.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.270000,0.000000,10.071000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.270000,0.000000,10.071000> }
difference{
cylinder{<27.270000,0,8.420000><27.270000,0.036000,8.420000>2.870200 translate<0,0.000000,0>}
cylinder{<27.270000,-0.1,8.420000><27.270000,0.135000,8.420000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<27.270000,0.000000,8.928000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.075200,0.000000,9.355000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.075200,0.000000,8.720000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<18.075200,0.000000,8.720000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.075200,0.000000,8.720000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.075200,0.000000,8.085000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<18.075200,0.000000,8.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.075200,0.000000,8.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.856000,0.000000,8.720000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<16.856000,0.000000,8.720000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.710200,0.000000,9.355000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.710200,0.000000,8.720000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<18.710200,0.000000,8.720000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.710200,0.000000,8.720000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.710200,0.000000,8.085000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<18.710200,0.000000,8.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.710200,0.000000,8.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.904000,0.000000,8.720000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.710200,0.000000,8.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,10.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,7.196000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.697000,0.000000,7.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.951000,0.000000,6.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,6.942000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.951000,0.000000,6.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.063000,0.000000,7.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.063000,0.000000,10.244000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.063000,0.000000,10.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,10.498000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.951000,0.000000,10.498000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.951000,0.000000,10.498000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<21.809000,0.000000,10.244000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<21.809000,0.000000,7.196000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.951000,0.000000,7.196000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.951000,0.000000,10.244000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<59.655000,0.000000,37.625200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.290000,0.000000,37.625200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<59.655000,0.000000,37.625200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.290000,0.000000,37.625200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.925000,0.000000,37.625200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<60.290000,0.000000,37.625200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.290000,0.000000,37.625200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.290000,0.000000,36.406000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.290000,0.000000,36.406000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<59.655000,0.000000,38.260200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.290000,0.000000,38.260200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<59.655000,0.000000,38.260200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.290000,0.000000,38.260200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.925000,0.000000,38.260200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<60.290000,0.000000,38.260200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.290000,0.000000,38.260200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.290000,0.000000,39.454000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<60.290000,0.000000,39.454000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.766000,0.000000,34.247000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.814000,0.000000,34.247000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.766000,0.000000,34.247000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.068000,0.000000,34.501000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.068000,0.000000,41.359000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.068000,0.000000,41.359000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.814000,0.000000,41.613000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.766000,0.000000,41.613000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.766000,0.000000,41.613000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.512000,0.000000,41.359000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.512000,0.000000,34.501000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.512000,0.000000,34.501000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<58.766000,0.000000,41.359000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.814000,0.000000,41.359000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.814000,0.000000,34.501000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<58.766000,0.000000,34.501000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.220000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.220000,0.000000,25.611000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.220000,0.000000,25.611000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.220000,0.000000,16.340000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.220000,0.000000,17.229000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<8.220000,0.000000,17.229000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,20.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.220000,0.000000,21.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.585000,0.000000,22.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.855000,0.000000,22.436000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.585000,0.000000,22.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.855000,0.000000,22.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<8.220000,0.000000,21.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,22.944000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.220000,0.000000,22.944000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.585000,0.000000,22.436000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<7.585000,0.000000,22.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.585000,0.000000,21.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.585000,0.000000,21.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,0.000000,21.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.855000,0.000000,21.420000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.220000,0.000000,21.420000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.458000,0.000000,23.452000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.458000,0.000000,19.388000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.982000,0.000000,19.388000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.982000,0.000000,23.452000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.982000,0.000000,23.706000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.458000,0.000000,23.706000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.458000,0.000000,23.706000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.458000,0.000000,19.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.982000,0.000000,19.134000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.458000,0.000000,19.134000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.204000,0.000000,19.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.204000,0.000000,23.452000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.204000,0.000000,23.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.236000,0.000000,19.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.236000,0.000000,23.452000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.236000,0.000000,23.452000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<8.220000,0.000000,19.769000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.220000,0.000000,24.658500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.220000,0.000000,18.181500>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.891000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.891000,0.000000,13.800000>}
box{<0,0,-0.063500><17.780000,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.891000,0.000000,13.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.891000,0.000000,13.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.510000,0.000000,13.800000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<42.510000,0.000000,13.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.510000,0.000000,13.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.049000,0.000000,13.800000>}
box{<0,0,-0.063500><5.461000,0.036000,0.063500> rotate<0,0.000000,0> translate<37.049000,0.000000,13.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.049000,0.000000,13.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.049000,0.000000,31.580000>}
box{<0,0,-0.063500><17.780000,0.036000,0.063500> rotate<0,90.000000,0> translate<37.049000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.049000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.954000,0.000000,31.580000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<37.049000,0.000000,31.580000> }
object{ARC(1.016000,0.127000,180.000000,360.000000,0.036000) translate<39.970000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.891000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.986000,0.000000,31.580000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.986000,0.000000,31.580000> }
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.710000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.329000,0.000000,8.710000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.329000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.250000,0.000000,7.440000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,7.440000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,7.440000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,7.440000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,8.710000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.329000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.329000,0.000000,8.964000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.329000,0.000000,8.710000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.329000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,9.980000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.329000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.250000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,12.520000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.329000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.329000,0.000000,9.980000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.329000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.250000,0.000000,7.440000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,7.440000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.250000,0.000000,7.440000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,7.440000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,9.980000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.171000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.250000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,12.520000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.250000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,11.885000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.171000,0.000000,11.885000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,11.885000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,10.615000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.171000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,9.980000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.171000,0.000000,9.980000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,7.694000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.171000,0.000000,8.075000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.171000,0.000000,8.075000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,7.440000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,8.075000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.171000,0.000000,8.075000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,8.075000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,8.075000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.536000,0.000000,8.075000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,8.075000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,9.345000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.536000,0.000000,9.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,9.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,9.345000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.536000,0.000000,9.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,9.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,10.615000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.171000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,10.615000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.536000,0.000000,10.615000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,10.615000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,11.885000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.536000,0.000000,11.885000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.536000,0.000000,11.885000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,11.885000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.536000,0.000000,11.885000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,11.885000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.171000,0.000000,12.520000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.171000,0.000000,12.520000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,8.710000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.964000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.345000,0.000000,8.964000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.964000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,10.996000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.345000,0.000000,10.996000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,10.996000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,11.250000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.345000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,11.250000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.710000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.853000,0.000000,8.964000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<6.345000,0.000000,8.710000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,8.964000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,8.964000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,8.964000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.853000,0.000000,8.964000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.853000,0.000000,10.996000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.853000,0.000000,10.996000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.853000,0.000000,10.996000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,11.250000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<6.345000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.329000,0.000000,10.996000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.345000,0.000000,10.996000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.329000,0.000000,10.996000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.250000,0.000000,8.710000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.250000,0.000000,11.250000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.720000,0.000000,42.990000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.720000,0.000000,43.371000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,90.000000,0> translate<38.720000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,40.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,43.371000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<37.450000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,43.371000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<37.450000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.974000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.720000,0.000000,43.371000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<38.720000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.990000,0.000000,43.371000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.720000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.530000,0.000000,40.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.530000,0.000000,43.371000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<42.530000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.530000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.990000,0.000000,43.371000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.990000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,40.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,37.529000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<37.450000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.990000,0.000000,37.529000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<37.450000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.530000,0.000000,40.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.530000,0.000000,37.529000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<42.530000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.530000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.895000,0.000000,37.529000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.895000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.895000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.625000,0.000000,37.529000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<40.625000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.625000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.990000,0.000000,37.529000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.990000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.704000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.085000,0.000000,37.529000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<37.704000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.450000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.085000,0.000000,37.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<37.450000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.085000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.085000,0.000000,38.164000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.085000,0.000000,38.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.085000,0.000000,38.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.355000,0.000000,38.164000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.085000,0.000000,38.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.355000,0.000000,38.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.355000,0.000000,37.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.355000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.355000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.625000,0.000000,37.529000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<39.355000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.625000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.625000,0.000000,38.164000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<40.625000,0.000000,38.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.625000,0.000000,38.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.895000,0.000000,38.164000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<40.625000,0.000000,38.164000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.895000,0.000000,38.164000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.895000,0.000000,37.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.895000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.895000,0.000000,37.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.530000,0.000000,37.529000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.895000,0.000000,37.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,43.371000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.720000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,42.355000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.720000,0.000000,42.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,42.355000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.974000,0.000000,42.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.260000,0.000000,42.355000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.006000,0.000000,42.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.260000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.260000,0.000000,43.371000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.260000,0.000000,43.371000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.720000,0.000000,42.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,41.847000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<38.720000,0.000000,42.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,42.355000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<38.974000,0.000000,42.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.974000,0.000000,41.847000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,41.847000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.974000,0.000000,41.847000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,41.847000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.260000,0.000000,42.355000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<41.006000,0.000000,41.847000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,43.371000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.006000,0.000000,42.355000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.006000,0.000000,42.355000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.720000,0.000000,40.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.260000,0.000000,40.450000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.090000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,20.310000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.090000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,21.580000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.550000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,20.310000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.471000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,20.056000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,20.310000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<64.471000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,19.040000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.471000,0.000000,19.040000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,16.500000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.550000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,19.040000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<64.471000,0.000000,19.040000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,21.580000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,19.040000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,19.040000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,16.500000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,17.135000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.629000,0.000000,17.135000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,17.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,18.405000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<58.629000,0.000000,18.405000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,18.405000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,19.040000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.629000,0.000000,19.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,21.326000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,20.945000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.629000,0.000000,20.945000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,20.945000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,20.945000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,20.945000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,20.945000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,20.945000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,20.945000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,19.675000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.264000,0.000000,19.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,19.675000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,19.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,18.405000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,18.405000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,18.405000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,18.405000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,18.405000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,18.405000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,17.135000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.264000,0.000000,17.135000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,17.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,17.135000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,17.135000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,17.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,16.500000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,20.310000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.056000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,20.056000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.056000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,18.024000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,18.024000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,18.024000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,17.770000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,17.770000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,17.770000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,17.770000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,17.770000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,20.056000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<62.947000,0.000000,20.056000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,20.056000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,20.056000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,20.056000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,20.056000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,18.024000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<62.947000,0.000000,18.024000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,18.024000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,17.770000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<62.947000,0.000000,18.024000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,18.024000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,18.024000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,18.024000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.550000,0.000000,20.310000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.550000,0.000000,17.770000>}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.540000,0.000000,7.410000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.540000,0.000000,7.029000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<56.540000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,7.029000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<57.810000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,7.029000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<56.540000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.286000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.540000,0.000000,7.029000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.286000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.270000,0.000000,7.029000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.270000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.730000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.730000,0.000000,7.029000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,-90.000000,0> translate<52.730000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.730000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.270000,0.000000,7.029000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.730000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,12.871000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<57.810000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.270000,0.000000,12.871000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.270000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.730000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.730000,0.000000,12.871000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,90.000000,0> translate<52.730000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.730000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.365000,0.000000,12.871000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.730000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.365000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.635000,0.000000,12.871000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.365000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.635000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.270000,0.000000,12.871000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.635000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.556000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.175000,0.000000,12.871000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.175000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.810000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.175000,0.000000,12.871000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<57.175000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.175000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.175000,0.000000,12.236000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<57.175000,0.000000,12.236000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.175000,0.000000,12.236000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.905000,0.000000,12.236000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.905000,0.000000,12.236000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.905000,0.000000,12.236000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.905000,0.000000,12.871000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<55.905000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.905000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.635000,0.000000,12.871000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.635000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.635000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.635000,0.000000,12.236000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.635000,0.000000,12.236000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.635000,0.000000,12.236000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.365000,0.000000,12.236000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<53.365000,0.000000,12.236000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.365000,0.000000,12.236000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.365000,0.000000,12.871000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<53.365000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.365000,0.000000,12.871000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.730000,0.000000,12.871000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<52.730000,0.000000,12.871000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,7.029000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.540000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,8.045000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<56.286000,0.000000,8.045000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,8.045000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.254000,0.000000,8.045000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.000000,0.000000,8.045000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.000000,0.000000,8.045000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.000000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.000000,0.000000,7.029000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.000000,0.000000,7.029000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.540000,0.000000,8.045000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,8.553000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,63.430762,0> translate<56.286000,0.000000,8.553000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,8.045000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<56.286000,0.000000,8.045000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.286000,0.000000,8.553000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,8.553000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.254000,0.000000,8.553000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,8.553000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.000000,0.000000,8.045000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-63.430762,0> translate<54.000000,0.000000,8.045000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,7.029000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.254000,0.000000,8.045000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.254000,0.000000,8.045000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<56.540000,0.000000,9.950000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<54.000000,0.000000,9.950000>}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.090000,0.000000,28.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,28.970000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.090000,0.000000,28.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,30.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,30.240000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.550000,0.000000,30.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,30.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,28.970000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.471000,0.000000,28.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,28.716000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,28.970000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<64.471000,0.000000,28.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,28.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,27.700000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.471000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,25.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,25.160000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.550000,0.000000,25.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,25.160000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.471000,0.000000,27.700000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<64.471000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,30.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,30.240000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,30.240000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,30.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,27.700000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.550000,0.000000,25.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,25.160000>}
box{<0,0,-0.127000><2.921000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,25.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,25.160000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,25.795000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.629000,0.000000,25.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,25.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,27.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<58.629000,0.000000,27.065000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,27.065000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,27.700000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.629000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,29.986000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.629000,0.000000,29.605000>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.629000,0.000000,29.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,30.240000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,29.605000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,29.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,29.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,29.605000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,29.605000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,29.605000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,28.335000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.264000,0.000000,28.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,28.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,28.335000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,28.335000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,28.335000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,27.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,27.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,27.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,27.065000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,27.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,27.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,25.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.264000,0.000000,25.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.264000,0.000000,25.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,25.795000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<58.629000,0.000000,25.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,25.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.629000,0.000000,25.160000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.629000,0.000000,25.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,28.970000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,28.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.716000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,28.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.716000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.684000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,26.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.430000>}
box{<0,0,-0.127000><0.254000,0.036000,0.127000> rotate<0,-90.000000,0> translate<63.455000,0.000000,26.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,26.430000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,26.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,28.716000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,-26.563298,0> translate<62.947000,0.000000,28.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,28.716000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,28.716000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,28.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,28.716000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,26.684000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<62.947000,0.000000,26.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.947000,0.000000,26.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.430000>}
box{<0,0,-0.127000><0.567961,0.036000,0.127000> rotate<0,26.563298,0> translate<62.947000,0.000000,26.684000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.471000,0.000000,26.684000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.455000,0.000000,26.684000>}
box{<0,0,-0.127000><1.016000,0.036000,0.127000> rotate<0,0.000000,0> translate<63.455000,0.000000,26.684000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.550000,0.000000,28.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.550000,0.000000,26.430000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.290000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.290000,0.000000,36.660000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.290000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.560000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.195000,0.000000,36.660000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.560000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.830000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.100000,0.000000,36.660000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.830000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.735000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.640000,0.000000,36.660000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.735000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.275000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.545000,0.000000,36.660000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.275000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.180000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.815000,0.000000,36.660000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<30.180000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.450000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.450000,0.000000,41.740000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.450000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.450000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.815000,0.000000,41.740000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<30.815000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.180000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.910000,0.000000,41.740000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.910000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.275000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.370000,0.000000,41.740000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.370000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.735000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465000,0.000000,41.740000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.465000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.830000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.195000,0.000000,41.740000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.195000,0.000000,41.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.925000,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.290000,0.000000,41.740000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.290000,0.000000,41.740000> }
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<21.607500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<22.242500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<23.512500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<25.417500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<27.957500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<29.862500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,180.000000,360.000000,0.036000) translate<31.132500,0.000000,36.660000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<22.242500,0.000000,41.740000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<22.877500,0.000000,41.740000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<24.147500,0.000000,41.740000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<26.052500,0.000000,41.740000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<28.592500,0.000000,41.740000>}
object{ARC(0.317500,0.127000,0.000000,180.000000,0.036000) translate<30.497500,0.000000,41.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.290000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.925000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<21.290000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.925000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.560000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<21.925000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.560000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.195000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<22.560000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.195000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.830000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<23.195000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.830000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<23.830000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.100000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.735000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<25.100000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.735000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.370000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<25.735000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.640000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.275000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<27.640000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.275000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.910000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<28.275000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.545000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.180000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<29.545000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.180000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.815000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<30.180000,0.000000,36.660000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.815000,0.000000,36.660000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.450000,0.000000,41.740000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,-82.869514,0> translate<30.815000,0.000000,36.660000> }
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,22.690000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.130000,0.000000,22.690000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,23.325000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,23.325000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,24.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,25.230000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,25.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,25.865000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,27.135000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,27.135000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,27.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,29.675000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,29.675000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,30.310000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,31.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,32.215000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,32.850000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,32.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,34.120000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,35.390000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.210000,0.000000,35.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,35.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,35.390000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.130000,0.000000,35.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,35.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,34.755000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,34.755000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,33.485000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,32.850000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,32.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,32.215000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,30.945000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,30.945000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,30.310000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,28.405000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,28.405000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,27.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,26.500000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,25.865000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,25.230000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,25.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,23.960000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,22.690000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.130000,0.000000,22.690000> }
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,23.642500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,24.277500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,25.547500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,27.452500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,29.992500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,31.897500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,33.167500>}
object{ARC(0.317500,0.127000,270.000000,450.000000,0.036000) translate<55.210000,0.000000,33.802500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,24.277500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,24.912500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,26.182500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,28.087500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,30.627500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,32.532500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,33.802500>}
object{ARC(0.317500,0.127000,90.000000,270.000000,0.036000) translate<50.130000,0.000000,34.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,23.325000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,23.960000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,23.960000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,23.960000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,24.595000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,24.595000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,24.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,25.230000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,25.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,25.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,25.865000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,25.865000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,25.865000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,26.500000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,27.135000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,27.770000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,27.770000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,27.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,28.405000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,28.405000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,29.675000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,30.310000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,30.310000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,30.310000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,30.945000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,30.945000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,32.215000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,32.215000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,32.215000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,32.850000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,32.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,32.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,33.485000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,33.485000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,33.485000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,34.120000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,34.120000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.210000,0.000000,34.120000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.130000,0.000000,34.755000>}
box{<0,0,-0.063500><5.119534,0.036000,0.063500> rotate<0,7.124546,0> translate<50.130000,0.000000,34.755000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.030000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.046000,0.000000,26.500000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<12.030000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.190000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.174000,0.000000,26.500000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<21.174000,0.000000,26.500000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.031000,0.000000,25.611000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.031000,0.000000,27.389000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.189000,0.000000,27.389000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.189000,0.000000,25.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.285000,0.000000,27.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.285000,0.000000,25.611000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.285000,0.000000,25.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.031000,0.000000,25.357000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.650000,0.000000,25.357000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.650000,0.000000,25.357000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,25.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.650000,0.000000,25.357000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.523000,0.000000,25.484000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.031000,0.000000,27.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.650000,0.000000,27.643000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.650000,0.000000,27.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,27.516000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.650000,0.000000,27.643000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.523000,0.000000,27.516000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,25.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.570000,0.000000,25.357000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.570000,0.000000,25.357000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,25.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,25.484000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.697000,0.000000,25.484000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,27.516000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.570000,0.000000,27.643000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.570000,0.000000,27.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.697000,0.000000,27.516000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,27.516000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.697000,0.000000,27.516000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.189000,0.000000,25.357000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.570000,0.000000,25.357000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.189000,0.000000,25.357000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.189000,0.000000,27.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.570000,0.000000,27.643000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.189000,0.000000,27.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.935000,0.000000,27.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.935000,0.000000,25.611000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.935000,0.000000,25.611000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<13.503200,0.000000,26.500000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<20.716800,0.000000,26.500000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.220000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.236000,0.000000,31.580000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<6.220000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.380000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<15.364000,0.000000,31.580000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<15.364000,0.000000,31.580000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.221000,0.000000,30.691000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.221000,0.000000,32.469000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<8.379000,0.000000,32.469000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<8.379000,0.000000,30.691000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.475000,0.000000,32.469000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.475000,0.000000,30.691000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.475000,0.000000,30.691000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.221000,0.000000,30.437000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.840000,0.000000,30.437000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.840000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.713000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.840000,0.000000,30.437000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.713000,0.000000,30.564000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.221000,0.000000,32.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.840000,0.000000,32.723000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.840000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.713000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.840000,0.000000,32.723000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.713000,0.000000,32.596000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.887000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.760000,0.000000,30.437000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.760000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.887000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.713000,0.000000,30.564000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.887000,0.000000,30.564000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.887000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.760000,0.000000,32.723000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<8.760000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.887000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.713000,0.000000,32.596000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.887000,0.000000,32.596000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.379000,0.000000,30.437000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.760000,0.000000,30.437000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.379000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.379000,0.000000,32.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.760000,0.000000,32.723000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.379000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.125000,0.000000,32.469000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.125000,0.000000,30.691000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.125000,0.000000,30.691000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<7.693200,0.000000,31.580000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<14.906800,0.000000,31.580000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.110000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.110000,0.000000,21.674000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.110000,0.000000,21.674000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.110000,0.000000,12.530000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.110000,0.000000,13.546000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<17.110000,0.000000,13.546000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.221000,0.000000,14.689000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.999000,0.000000,14.689000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.999000,0.000000,20.531000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.221000,0.000000,20.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.999000,0.000000,14.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.221000,0.000000,14.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.221000,0.000000,14.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,14.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,15.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.967000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.094000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,15.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.967000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,14.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,15.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.253000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.126000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,15.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<18.126000,0.000000,15.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.094000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,20.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.967000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.094000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.094000,0.000000,15.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.094000,0.000000,15.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.126000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,20.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.126000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.126000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.126000,0.000000,15.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.126000,0.000000,15.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,20.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.967000,0.000000,20.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.967000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,20.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.253000,0.000000,20.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.253000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.999000,0.000000,20.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.221000,0.000000,20.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.221000,0.000000,20.785000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.110000,0.000000,21.216800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<17.110000,0.000000,14.003200>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.150000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.134000,0.000000,31.580000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<29.134000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.990000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.006000,0.000000,31.580000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<19.990000,0.000000,31.580000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<22.149000,0.000000,32.469000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<22.149000,0.000000,30.691000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.991000,0.000000,30.691000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.991000,0.000000,32.469000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.895000,0.000000,30.691000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.895000,0.000000,32.469000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.895000,0.000000,32.469000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.149000,0.000000,32.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.530000,0.000000,32.723000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.149000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.657000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.530000,0.000000,32.723000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.530000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.149000,0.000000,30.437000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.530000,0.000000,30.437000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.149000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.657000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.530000,0.000000,30.437000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.530000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.483000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.610000,0.000000,32.723000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.483000,0.000000,32.596000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.483000,0.000000,32.596000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.657000,0.000000,32.596000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.657000,0.000000,32.596000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.483000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.610000,0.000000,30.437000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.483000,0.000000,30.564000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.483000,0.000000,30.564000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.657000,0.000000,30.564000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.657000,0.000000,30.564000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.991000,0.000000,32.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.610000,0.000000,32.723000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.610000,0.000000,32.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.991000,0.000000,30.437000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.610000,0.000000,30.437000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.610000,0.000000,30.437000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.245000,0.000000,30.691000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.245000,0.000000,32.469000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.245000,0.000000,32.469000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<28.676800,0.000000,31.580000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<21.463200,0.000000,31.580000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.860000,0.000000,9.990000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.860000,0.000000,11.006000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<48.860000,0.000000,11.006000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.860000,0.000000,20.150000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.860000,0.000000,19.134000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.860000,0.000000,19.134000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.749000,0.000000,17.991000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<47.971000,0.000000,17.991000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<47.971000,0.000000,12.149000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.749000,0.000000,12.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.971000,0.000000,18.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.749000,0.000000,18.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.971000,0.000000,18.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,17.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,17.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.003000,0.000000,17.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.876000,0.000000,17.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,17.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.876000,0.000000,17.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,17.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,17.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.717000,0.000000,17.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.844000,0.000000,17.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,17.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<47.717000,0.000000,17.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.876000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,12.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.876000,0.000000,12.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.876000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.876000,0.000000,17.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.876000,0.000000,17.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.844000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,12.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.717000,0.000000,12.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.844000,0.000000,12.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.844000,0.000000,17.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.844000,0.000000,17.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,12.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,12.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.003000,0.000000,12.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,12.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.717000,0.000000,12.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.717000,0.000000,12.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.971000,0.000000,11.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.749000,0.000000,11.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.971000,0.000000,11.895000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<48.860000,0.000000,11.463200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<48.860000,0.000000,18.676800>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.350000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.334000,0.000000,22.690000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<31.334000,0.000000,22.690000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.190000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.206000,0.000000,22.690000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<22.190000,0.000000,22.690000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<24.349000,0.000000,23.579000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<24.349000,0.000000,21.801000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.191000,0.000000,21.801000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.191000,0.000000,23.579000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.095000,0.000000,21.801000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.095000,0.000000,23.579000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.095000,0.000000,23.579000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.349000,0.000000,23.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.730000,0.000000,23.833000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.349000,0.000000,23.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.857000,0.000000,23.706000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.730000,0.000000,23.833000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.730000,0.000000,23.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.349000,0.000000,21.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.730000,0.000000,21.547000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.349000,0.000000,21.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.857000,0.000000,21.674000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.730000,0.000000,21.547000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.730000,0.000000,21.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.683000,0.000000,23.706000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.810000,0.000000,23.833000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.683000,0.000000,23.706000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.683000,0.000000,23.706000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.857000,0.000000,23.706000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.857000,0.000000,23.706000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.683000,0.000000,21.674000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.810000,0.000000,21.547000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.683000,0.000000,21.674000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.683000,0.000000,21.674000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.857000,0.000000,21.674000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.857000,0.000000,21.674000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.191000,0.000000,23.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.810000,0.000000,23.833000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.810000,0.000000,23.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.191000,0.000000,21.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.810000,0.000000,21.547000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.810000,0.000000,21.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.445000,0.000000,21.801000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.445000,0.000000,23.579000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.445000,0.000000,23.579000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<30.876800,0.000000,22.690000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.663200,0.000000,22.690000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.300000,0.000000,12.530000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.300000,0.000000,13.546000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<13.300000,0.000000,13.546000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.300000,0.000000,22.690000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.300000,0.000000,21.674000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<13.300000,0.000000,21.674000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<14.189000,0.000000,20.531000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.411000,0.000000,20.531000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.411000,0.000000,14.689000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<14.189000,0.000000,14.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.411000,0.000000,20.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.189000,0.000000,20.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.411000,0.000000,20.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,20.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,20.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.443000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,20.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.316000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,20.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,20.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.157000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,0.000000,20.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,20.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.157000,0.000000,20.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,15.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.316000,0.000000,15.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,20.023000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.316000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,15.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.157000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,0.000000,15.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,0.000000,20.023000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.284000,0.000000,20.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,14.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,15.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.443000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,14.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.157000,0.000000,15.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.157000,0.000000,15.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.411000,0.000000,14.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.189000,0.000000,14.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.411000,0.000000,14.435000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<13.300000,0.000000,14.003200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<13.300000,0.000000,21.216800>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.990000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.990000,0.000000,26.266000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<32.990000,0.000000,26.266000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.990000,0.000000,35.410000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.990000,0.000000,34.394000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<32.990000,0.000000,34.394000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.879000,0.000000,33.251000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.101000,0.000000,33.251000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.101000,0.000000,27.409000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.879000,0.000000,27.409000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.101000,0.000000,33.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.879000,0.000000,33.505000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.101000,0.000000,33.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,33.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,32.870000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.133000,0.000000,32.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.006000,0.000000,32.743000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,32.870000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.006000,0.000000,32.743000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,33.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,32.870000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.847000,0.000000,32.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974000,0.000000,32.743000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,32.870000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.847000,0.000000,32.870000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.006000,0.000000,27.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,27.790000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.006000,0.000000,27.917000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.006000,0.000000,27.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.006000,0.000000,32.743000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.006000,0.000000,32.743000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974000,0.000000,27.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,27.790000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.847000,0.000000,27.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974000,0.000000,27.917000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974000,0.000000,32.743000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.974000,0.000000,32.743000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,27.409000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.133000,0.000000,27.790000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.133000,0.000000,27.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,27.409000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.847000,0.000000,27.790000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.847000,0.000000,27.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.101000,0.000000,27.155000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.879000,0.000000,27.155000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.101000,0.000000,27.155000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<32.990000,0.000000,26.723200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<32.990000,0.000000,33.936800>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.350000,0.000000,8.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.350000,0.000000,9.736000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<32.350000,0.000000,9.736000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.350000,0.000000,18.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.350000,0.000000,17.864000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<32.350000,0.000000,17.864000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.239000,0.000000,16.721000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.461000,0.000000,16.721000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.461000,0.000000,10.879000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.239000,0.000000,10.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,0.000000,16.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.239000,0.000000,16.975000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.461000,0.000000,16.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,16.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,16.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.493000,0.000000,16.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.366000,0.000000,16.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,16.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.366000,0.000000,16.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,16.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,16.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.207000,0.000000,16.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.334000,0.000000,16.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,16.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.207000,0.000000,16.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.366000,0.000000,11.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,11.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.366000,0.000000,11.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.366000,0.000000,11.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.366000,0.000000,16.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.366000,0.000000,16.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.334000,0.000000,11.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,11.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.207000,0.000000,11.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.334000,0.000000,11.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.334000,0.000000,16.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.334000,0.000000,16.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,10.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.493000,0.000000,11.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.493000,0.000000,11.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,10.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.207000,0.000000,11.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.207000,0.000000,11.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,0.000000,10.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.239000,0.000000,10.625000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.461000,0.000000,10.625000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<32.350000,0.000000,10.193200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<32.350000,0.000000,17.406800>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.050000,0.000000,9.990000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.034000,0.000000,9.990000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.034000,0.000000,9.990000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.890000,0.000000,9.990000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.906000,0.000000,9.990000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.890000,0.000000,9.990000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.049000,0.000000,10.879000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.049000,0.000000,9.101000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.891000,0.000000,9.101000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.891000,0.000000,10.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.795000,0.000000,9.101000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.795000,0.000000,10.879000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.795000,0.000000,10.879000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.049000,0.000000,11.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,11.133000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.049000,0.000000,11.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.557000,0.000000,11.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,11.133000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<37.430000,0.000000,11.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.049000,0.000000,8.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,8.847000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.049000,0.000000,8.847000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.557000,0.000000,8.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,8.847000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.430000,0.000000,8.847000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.383000,0.000000,11.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.510000,0.000000,11.133000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.383000,0.000000,11.006000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.383000,0.000000,11.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.557000,0.000000,11.006000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.557000,0.000000,11.006000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.383000,0.000000,8.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.510000,0.000000,8.847000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.383000,0.000000,8.974000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.383000,0.000000,8.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.557000,0.000000,8.974000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.557000,0.000000,8.974000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.891000,0.000000,11.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.510000,0.000000,11.133000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.510000,0.000000,11.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.891000,0.000000,8.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.510000,0.000000,8.847000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.510000,0.000000,8.847000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.145000,0.000000,9.101000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.145000,0.000000,10.879000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.145000,0.000000,10.879000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<43.576800,0.000000,9.990000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<36.363200,0.000000,9.990000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.480000,0.000000,39.200000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.464000,0.000000,39.200000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<55.464000,0.000000,39.200000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<46.320000,0.000000,39.200000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.336000,0.000000,39.200000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<46.320000,0.000000,39.200000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.479000,0.000000,40.089000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.479000,0.000000,38.311000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.321000,0.000000,38.311000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.321000,0.000000,40.089000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.225000,0.000000,38.311000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.225000,0.000000,40.089000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.225000,0.000000,40.089000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.479000,0.000000,40.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.860000,0.000000,40.343000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.479000,0.000000,40.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.987000,0.000000,40.216000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.860000,0.000000,40.343000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.860000,0.000000,40.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.479000,0.000000,38.057000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.860000,0.000000,38.057000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.479000,0.000000,38.057000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.987000,0.000000,38.184000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.860000,0.000000,38.057000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.860000,0.000000,38.057000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.813000,0.000000,40.216000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,40.343000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.813000,0.000000,40.216000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.813000,0.000000,40.216000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.987000,0.000000,40.216000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.987000,0.000000,40.216000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.813000,0.000000,38.184000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,38.057000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.813000,0.000000,38.184000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.813000,0.000000,38.184000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.987000,0.000000,38.184000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.987000,0.000000,38.184000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.321000,0.000000,40.343000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,40.343000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.940000,0.000000,40.343000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.321000,0.000000,38.057000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.940000,0.000000,38.057000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.940000,0.000000,38.057000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.575000,0.000000,38.311000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.575000,0.000000,40.089000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.575000,0.000000,40.089000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<55.006800,0.000000,39.200000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<47.793200,0.000000,39.200000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  RX_MIXER_BALANCED_MODULATOR(-34.425000,0,-24.675000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//L1	T37_INDUCTOR	T37_INDUCTOR
//L2	T50_TRIFILAR_TRANSFORMER	T50_TRIFILAR_TRANSFORMER
