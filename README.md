
# AnalyZe

A MATLAB application for handling and analyzing Electrochemical Impedance Spectroscopy (EIS) data in biological (barrier) applications. 

![Schematic of a gerneralised biological barrier being elechtrochemically interrogated alongside the standard equivalent circuit](/Equivalent_circuit_Barrier.png)


## Features

- Import .txt (.csv) and label impedance data and write .mat files for future analysis.
- Fit equivalent circuits to EIS data
    - Equivalent circuit fitting assumes the objective is the extraction of the parameters associated with a biological barrier of the form R//C.
    - Batch processing.
    - Multi-start global optimization with parallelization.
    - Fit pre-defined or user defined circuits.
        - Sequentially fit pre-defined circuits.
    - Estimate electrolyte resistance (R_inf) by semi-circle fitting in the Nyquist domain.
    - Assess regression by residual plots, complex residual Kernel Density Estimation, real/imaginary QQ-plots and conventional goodness of fit and information metrics.
    - Plot fitted parameters over time and compare accross experimental conditions. 
    - Results can be saved and recalled between app sessions.
- Plot impedance magnitude at slected frequencies as a function of time within an experimental condition.
- Fit an arbitrary order transfer function to the data.
    - Batch processing.
    - Tunable pole order and number of zeros.
    - Plotting of fitted pole values as a function of time within an experimental condition. 
    - Model assesment by way of confidence plotted intervals, goodness of fit metrics and information criteria. 
    - Results can be saved and recalled between app sessions. 


## Installation

To install the app in the MATLAB app collection, navigate to AnalyZe/Packaged App/ and run the .mlappinstall file of your choosing.

Alternatively, to access the app code: \
In MATLAB navigate to Apps -> Design App \
Then Open -> AnalyZe/AnalyZe.mlapp

For more information refer to [Creating MATLAB GUIs](https://www.mathworks.com/help/matlab/creating_guis/). 
