# pulsatile-udf-inlet-profile
<b><i>MATLAB program that creates an ANSYS UDF (user-defined function) in C specifying a time-dependent cardiac velocity profile at a vessel inlet, for use in computational fluid dynamics simulations.</b></i><br>

<b>Input Parameters:</b><br>
Mean Volumetric Flow Rate (in mL/min)<br>
BPM (cardiac cycles per minute)<br>
Mean Vessel Radius (in mm)<br>
Number of Cycles to Display<br><br>
    
<b>Output:</b><br>
Code in C to be interpreted by ANSYS FLUENT/CFX for definition of the x-velocity at the vessel inlet<br><br>

Based on the work of Stevens et al. (2002) presented here:<br>
https://pdfs.semanticscholar.org/ffa9/7e13dfe447e08db1700b603dbcaa744ed8a5.pdf
