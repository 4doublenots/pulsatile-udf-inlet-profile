# pulsatile-udf-inlet-profile
<b><i>MATLAB (.m) program that generates an ANSYS UDF (user-defined function) in C-language specifying a time-dependent cardiac velocity profile at a vessel inlet, for use in computational fluid dynamics (CFD) simulations in FLUENT/CFX.</b></i><br>

<b>Input Parameters:</b><br>
Mean Volumetric Flow Rate (in mL/min)<br>
BPM (cardiac cycles per minute)<br>
Mean Vessel Radius (in mm)<br>
Number of Cycles to Display<br><br>
    
<b>Output:</b><br>
Code in C to be interpreted by ANSYS FLUENT/CFX for definition of the x-velocity at the vessel inlet<br>
Figure displaying the case-specific mathematic function with linear velocity (m/s) versus time (s) over the desired number of cycles<br><br>

Based on the mathematical models of Stevens et al. (2002) presented here:<br>
https://pdfs.semanticscholar.org/ffa9/7e13dfe447e08db1700b603dbcaa744ed8a5.pdf
