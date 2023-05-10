
# AnalyZe

A MATLAB application for handling and analyzing Electrochemical Impedance Spectroscopy (EIS) data in biological (barrier) applications. In particular, biological models, such as epithelial monolayers, organotypic 3D tissue analogues and supported lipid biliayers, are commonly interrogated non-destructively by some re-imagining of the application of an electrochemical potential accross the model and the measurement of the flux/current of ionic species through said model. EIS is a small-signal linearlization which follows this general approach, the output of which is the frequency domain transfer function of the linear approximation of the system about some operating point. The objective of this application is to provide a platform for the collation of MATLAB-based tools to extract information pertaining to the biological system from this frequency-domain data. While the inital focus of the toolkit is variations on the system identification theme, the hope is for the app to be continually extended with different tools by the community. 

![Schematic of a gerneralised biological barrier being elechtrochemically interrogated alongside the standard equivalent circuit](/images/Equivalent_circuit_Barrier.png)


## Features

- Import .txt (.csv) and label impedance data.
- Write .mat files for future analysis.
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

## MATLAB Dependencies

- \>= MATLAB 2022b
- Control System Toolbox
- System Identification Toolbox
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox
- Global Optimization Toolbox
- Econometrics Toolbox

Check for up-to-date dependencies using 
```
[fList, pList] = matlab.codetools.requiredFilesAndProducts('.\AnalyZe.mlapp')
pList.Name
```

## Contributing to the App

Tracking changes in the .mlapp file is tricky as it is essentially a .zip format, however, the startup callback of AnalyZe is set to mirror the app code in the AnalyZe.m file, which behaves more like a text file. The corollary being that changes to the tracked code base is only updated when the app is run. 

In order to merge updates into the main repo, the matlab [Compare and Merge Tool](https://www.mathworks.com/help/matlab/matlab_env/compare-and-merge-apps.html) will need to be used. The proto-workflow for contributing to the app is therefore as follows:
    - Fork the respoistory and modify the .mlapp within the MATLAB App Designer tool as desired, running the app to update AnalyZe.m and commiting as per usual.
    - Instead of a pull request, create an issue with the tag (TBD) outlining the changes made and including a link to your fork.
    - Admins will pull down your .mlapp file and the current .mlapp and merge within MATLAB.
    
This workflow needs testing.

In general, the design philosphy of this app is to make use of tab-groups wherever possible - a particular tab group takes responsibility for a specific module/sub-functionality and each tab within the group takes responsibility for variants of that abstracted (sub)utility. Ideally, each tab should have an "Off/On" switch to enforce a degree of modularity and separation of concerns onto the code-base. 

To avoid tightly coupling the code, create new tabs within the master tab for your added functionality where possible, unless your contribution fits well witin the purview of an existing tool within the toolbox. 

## App Publishing Procedure

For sufficiently significant updates to the app funcitonality, the app is published to an .mlappinstall file, which can be installed to the MATLAB App Tab so that the app can be run from within MATLAB proper.

In the MATLAB App Designer, update the app sharing details (lower right corner)
 - Name = AnalyZe
 - Version = {version number}++ e.g. '4.2'
 
Initiate the share utility (Share->MATLAB App)
 - Within the 'Describe your app' section
    - Name = AnalyZe_{version string} e.g. 'AnalyZe_4v2'
    - Version = {version number}++ e.g. '4.2'
    - Update App descriptions.
 - Within the 'Package into installation file' section
    - Output Folder = ./Packaged App
    - Click 'Package'

## Testing

From the MATLAB command window, run /test/AnalyZeTestWrapper.m to execute all tests.
