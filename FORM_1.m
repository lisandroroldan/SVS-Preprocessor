function [SVS] = FORM_1(SVS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GENERAL DATA INPUT
%For more information of each element, check FORM 1A to FORM 1H in the SVS
%User manual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1A

%System identification
PROP.sys_id='SAMPLE SES INPUT FILE FOR NORMAL OPERATIONS SIMULATION';

%Additional title
PROP.add_tit='ONE STATION SYSTEM WITH SINGLE BORE TUNNELS AND DOUBLE-TRACK TUNNEL';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1B

%Design hour
PROP.design_hour=17;

%Design month
PROP.design_month=7;

%Design year
PROP.design_year=2014;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1C

%Train performance option
    %0 - Bypass train simulation
    %1 - Implicit
    %2 - Explicit(Train heat rejection computed)
    %3 - Explicit(Train heat rejection input)
PROP.train_perf_opt=1;

%Temperature/Humidity Simulation option
    %0 - Bypass
    %1 - Yes
    %2 - Yes - evaporation
PROP.temp_hum_sim_opt=2;

%Humidity display option
    %1 - Humidity ratio
    %2 - Wet-bulb temperature
    %3 - Relative humidity(N/A if Temp/Humid = 0)
PROP.hum_disp_opt=1;

%Environmental control load evaluation option
    %0 - Bypass
    %1 - Yes - evening or morning rush hour
    %2 - Off hour(N/A if Temp/Humid = 0)
PROP.env_control_load_eval_opt=1;

%Heat sink summary print option
    %0 - Bypass
    %1 - Heat sink summary output
    %2 - Heat sink summary output and heat sink arrays (N/A if Temp/Humid = 0)
PROP.heat_sink_summary_print_opt=0;

%Supplementary output option
    %0 - Designer Oriented output only
    %1 - Level 1 (Input Verification)
    %2 - Level 2 (Train Sim.)
    %3 - Level 3 (Aerodynamic Sim.)
    %4 - Level 4 (Thermodynamic Sim.)
    %5 - Level 5 (All of the Above)
PROP.sup_output_opt=0;

%Allowable simulation errors
    %0 - Stop simulation if any simulation errors are found
    %N - Allow up to "N" simulation errors 0<= N <= 50
PROP.allowable_sim_err=0;

%Allowable input errors
    %+N - Allow up to “N” input errors
    %0 - Simulate system if no input errors are found
    %-1 - Input verification
PROP.allowable_inp_err=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1D

%Number of line segments (0<=N<=620)
PROP.n_line_segments=[]; %automatic

%Number of sections (0<=N<=900)
PROP.n_sections=[]; %automatic

%Number of ventilation shafts sections (0<=N<=406)
PROP.n_vents=[]; %automatic

%Number of nodes (2<=N<=Number of sections +1)
PROP.n_nodes=[]; %automatic

%Number of branched junctions (0<=N<=Number of nodes)
PROP.n_br_junct=[]; %automatic

%Number of unsteady heat sources (0<=N<=50)
PROP.n_unst_heat_sources=0;

%Number of fan types (0<=N<=75)
PROP.n_fan_types=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1E

%Number of train routes (0<=N<=20)
PROP.n_train_routes=2;

%Number of train types (0<=N<=16) 
PROP.n_train_types=2;

%Numer of environmental control zones  (0<=N<=75)
PROP.n_env_control_zones=5;

%Fan stopping/windmilling option
    %1 - In fan limits exceded the simulation will stop
    %2 - In fan limits exceded the fan is turned off and the simulation will continue
PROP.fan_stop_wmill_option=1;

%Number of trains in operation at initialization (0<=N<=75)
PROP.n_trains_op_init=2;

%Number of impulse fan types (0<=N<=6)
PROP.n_imp_fan_types=2;

%Initialization file writing option
    %0 - None
    %1 - Aerodynamic initialization only
    %2 - Train initialization only
    %3 - Thermodynamic initialization only
    %4 - Aerodynamic and train initialization
    %5 - Aerodynamic, train, and thermodynamic initialization (0<=N<=5)
PROP.init_file_wr_opt=5;

%Initialization file reading option
    %0 - None
    %1 - Aerodynamic initialization only
    %2 - Train initialization only
    %3 - Thermodynamic initialization only
    %4 - Aerodynamic and train initialization
    %5 - Aerodynamic, train, and thermodynamic initialization (0<=N<=5)
PROP.init_file_wr_opt=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1F

%Outside ambient air dry-bulb temperature (-50°C<X<60°C)
PROP.amb_air_dry_bulb_temp=32.2;

%Outside ambient air wet-bulb temperature (-50°C<X<dry_bulb)
PROP.amb_air_wet_bulb_temp=26.7;

%Outside ambient barometric pressure (-65kPa<X<110kPa)
PROP.amb_bar_press=99.90;

%Outside morning ambient air dry-bulb temperautre (-50°C<X<60°C)
PROP.morning_amb_dry_bulb_temp=26.7;

%Outside morning ambient air wet-bulb temperautre (-50°C<X<dry_bulb)
PROP.morning_amb_wet_bulb_temp=21.1;

%Outside evening or off hour ambient air dry-bulb temperature (-50°C<X<60°C)
PROP.evening_amb_dry_bulb_temp=32.2;

%Outside evening or off hour ambient air wet-bulb temperature (-50°C<X<dry_bulb)
PROP.evening_amb_wet_bulb_temp=26.7;

%Amplitude of annual temperature fluctuation
PROP.anual_temp_amp=11.1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1G

%Average patron weight (20kg<X<100kg)
PROP.avg_patron_weight=68;

%Percent of heat from train propulsion / breaking system captured by the
%TES when the train stopped (0<X<100)
PROP.tes_heat_percentage_stop=40;

%Percent of heay from train propulsion /breaking system campured bi the
%TES when the train is moving (0<X<100)
PROP.tes_heat_percentage_move=20;

%Percent of sensible heay from train auxiliaries and passenger captured by
%the TES when train is stopped (0<X<100)
PROP.tes_sensheat_percentage_stop=0;

%Percent of sensible heay from train auxiliaries and passenger captured by
%the TES when train is moving (0<X<100)
PROP.tes_sensheat_percentage_move=0;

%Maximum train speed at which the TES operates (0<X<400km/h)
PROP.tes_max_speed=96;

%Fire simulation option
    %1 - if a fire is being simulated
    %0 - if a fire is not being simulated
PROP.fire_sim_opt=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%FORM 1H

%Number of air curtain fan types (0<N<4)
PROP.n_air_curt_fan_type=0;

%Number of years to use in the heat sink calculations (0<Y<30), 0=30
PROP.n_years_heat_sink_calc=30;

%Heat sink attenuation factor (0.3<X<1)
PROP.heat_sink_attenuation=0.5;

%Night time cooling option
    %0 - if night time cooling is not being simulated
    %1 - if night time cooling is being simulated
PROP.night_cooling_option=0;

%Number of cooling pipes (0<N<20)
PROP.n_cooling_pipes=0;
    
%-------------------------------------------------------------------------%
%DO NOT EDIT UNDER THIS LINE

%STORE
SVS.GENERAL_DATA=PROP;