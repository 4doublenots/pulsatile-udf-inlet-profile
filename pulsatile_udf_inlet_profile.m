% pulsatile_udf_inlet_profile
%
% PURPOSE: produce a UDF-formatted mathematical model describing the pulsatile linear velocity
% (constant across the full inlet face) boundary condition for CFD simulation through a vessel
% ORIGIN: The model is predicated on the work presented by Stevens et al.(2002) @
% https://pdfs.semanticscholar.org/ffa9/7e13dfe447e08db1700b603dbcaa744ed8a5.pdf

clear all; close all; clc;

% General Input Parameters
vfr = input('Volumetric Flow Rate (mL/min): ');         % volumetric flow rate (mL/min)
bpm = input('Cycles per Minute (bpm): ');               % cardiac cycles per minute (bpm)
r = input('Mean Vessel Radius at Inlet (mm): ');        % radius of the vessel at inlet (mm)
cycles = input('Number of Cycles to Plot: ');           % number of cardiac cycles to display (does not affect the model)

% Timing Parameters
p = 1/bpm;                          % calculate period as a fraction of a minute
dur = cycles*p;                     % duration over which to plot
t = linspace(0,dur,cycles*100);     % time variable

% Model Parameters
n = 13;                 % degree --- n=13 results in systole 1/3 of cycle
phi = pi/10;            % phase angle

v = vfr*p;              % volume of flow that occurs in a period
w = pi/p;               % frequency

% Geometric Parameters
area = pi*r^2;          % area of inlet face

% Model Equation for Volumetric Flow Rate
A = (sqrt(pi)*gamma(1+(n/2))*sin(phi))/(w*gamma((3+n)/2));
Q_vol = (v/A).*((sin(w.*t)).^n).*(cos((w.*t)-phi));             % units [mL/min]

% convert VFR to linear velocity-FR
Q_lv = Q_vol./(60*area);                                        % units [m/s]

max = max(Q_lv);        % maximum velocity
avg = mean(Q_lv);       % average velocity

% Preview the waveform
plot(t,Q_lv)
xlabel('Time(s)')
ylabel('Flow Velocity (m/s)')

% Generate text of model for Fluent UDF in C-language for direct import
% into ANSYS UDF interpreter, write to new .txt file

% Equation for the desired pulsatility case, readable in Fluent
model_text = '\t\tF_PROFILE(f,th,i) = (%f/(%f*60.0*%f))*pow(sin(%f*t),13.0)*(cos((%f*t)-(PI/10.0)));\n';

fileID = fopen('pulse_profile.c','w');

% Print Header Text
fprintf(fileID,'/* PULSATILE FLOW DEFINITION UDF */\n');
fprintf(fileID,'#include "udf.h"\n');
fprintf(fileID,'#define PI 3.141592654\n\n');

% Print Body Text
fprintf(fileID,'DEFINE_PROFILE(inlet_x_velocity,th, i)\n');
fprintf(fileID,'{\n');
fprintf(fileID,'\tface_t f\n');
fprintf(fileID,'\treal t = CURRENT_TIME;\n');
fprintf(fileID,'\tbegin_f_loop(f,th)\n');
fprintf(fileID,'\t{\n');
fprintf(fileID,model_text,v,A,area,w,w);
fprintf(fileID,'\t}\n');
fprintf(fileID,'\tend_f_loop(f,th)\n');
fprintf(fileID,'}');