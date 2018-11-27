# pulsatile-udf-inlet-profile
<b><i>MATLAB program that creates an ANSYS UDF (user-defined function) in C specifying a time-dependent cardiac velocity profile at a vessel inlet, for use in computational fluid dynamics simulations.</b></i>

<b>Input Parameters:</b><br>
Mean Volumetric Flow Rate (in mL/min)<br>
BPM (cardiac cycles per minute)<br>
Mean Vessel Radius (in mm)<br>
Number of Cycles to Display<br><br>
    
<b>Output:</b><br>
Code in C to be interpreted by ANSYS FLUENT/CFX for definition of the x-velocity at the vessel inlet
