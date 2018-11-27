# pulsatile-udf-inlet-profile
<b><i>MATLAB program that creates an ANSYS UDF (user-defined function) in C specifying a time-dependent cardiac velocity profile at a vessel inlet, for use in computational fluid dynamics simulations.</b></i>

<b>Input Parameters:</b> Mean Volumetric Flow Rate (in mL/min), BPM (cardiac cycles per minute), Mean Vessel Radius (in mm), Number of Cycles to Display
    
<b>Output:</b> Code in C to be interpreted by ANSYS FLUENT/CFX for definition of the x-velocity at the vessel inlet
