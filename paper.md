---
title: 'AnalyZe: A MATLAB Application GUI for Visualizing and Analyzing Electrical Impedance Spectroscopy data in Biological Applications'
tags:
  - Electrical Impedance Spectroscopy
  - Equivalent Circuit
  - Bioimpedance
  - System Identification
  - MATLAB
authors:
  - name: Douglas C. van Niekerk
    orcid: 0000-0002-6449-7808
    equal-contrib: true
    affiliation: 1
  - name: Róisín M. Owens
	orcid: 0000-0001-7856-2108
    corresponding: true 
    affiliation: 1
affiliations:
   index: 1
 - name: Dept. Chemical Engineering & Biotechnology, University of Cambridge, UK
date: 25 March 2024
bibliography: paper.bib
---

# Introduction
Electrical currents in the biological context are almost exclusively realised as ionic flux and therefore, in order to monitor (and stimulate) biological systems using electronics, electronic flow needs to be coupled ionic flow; this is the province of electrochemistry. Electrodes, inserted into the ionic conducting phase (inhabited by the biology), serve as the interface between ionic flow and electronic flow. However, the voltage-curent relationship in electrochemical systems is notoriously non-linear - in particular, the measured current is a non-linear combination of the current (modulations) contributions from each physical process within the electrochemical cell, including the biological system [REF]. 

Small-signal linearization is a common technique when treating with non-linear systems, wherein a small (sinusoidal) perterbation is applied to the system. If the perterbation (i.e. the applied voltage in a potentiostatic scenario) is sufficiently small, relative to the non-linearity of the system, then the corresponding output of the system can be approximated as linearly related to the input perterbation. A linear approximation of the system, in the region of an operating (bias) point, can therefore be measured. For a sinusoidal voltage-current, input-output pair, the the ratio of the voltage to current yields the impedance of the net system. The impedance is a linear combination of the physical phenomena in the system, and can therefore be more easily decomposed into its constituent parts. In the field of electrochemistry, this measurement is known as electrical impedance spectroscopy (EIS) [REF] and the process of decomposing the measurement using an appropriate model of the system, is known as system identification. The most common form of system identification involves modelling the linear system as an equivalent circuit, where each circuit element models the voltage-current relaitonship exhibited by the linear approximation of one of the physical processes participating in the measurment. 

# Statement of Need

Fiting equivalent circuits to impedance data is a common exercise and various software solutions exist to meet this need, incuding paid (or 'freemium') software, such as 'EC-lab', 'ZView', 'Nova' and 'PSTrace' as well as open-source solutions such as 'impedance.py' and 'ZFit' [REFS]. In general, the GUI-based solutions are proprietary and closed-source, while open source solutions are implemented as software packages. There therefore exists an accessiblity concern, wherein researchers with a preference for graphical software are limited to the use of inflexible, proprietary solutions, while those with the prerequisite coding skillset, who wish to develop bespoke variations of the impedance post-processing process, are limited to implementing sripted solutions which have a reduced apeal to other researchers in the field. We believe that, in order to democratize the knowledge being developed in the field of impedance data processing and minimize the barrier to adoption of community-driven advancement is the field, a flexible, open-source, GUI based solution is needed. 

'AnalyZe' was initially developed specifically for bioimpedance applications, although the design flexiblity is such that it can be retooled or extended for a variety of applications. In order to maximize utility of this first iteration of the software, the most common bioimpedance scenario is targeted, wherein a collection of biological cells mediate the ionic flux; the flow of ions is considered to follow two paths, the paracellular path (flow between cells) which is primarily resistive, and the trancellular path (flow through cells) which is primarily capactive [REF]. This biological barrier (to current flow) is commonly modelled as a parallel resitance and capactiance. as shown in \autoref{fig:Intro_BarrierImpedance }, the net impedance is, in the most general case, a linear combination of this barrier, the series (electrolyte) resistance of the system, and the impedance contribution of the electrode-electrolyte interfaces. 

![In an generic bioimpedance scenario, ionic flux is induced between two electrodes (conventionally reffered to as the counter and working electodes), such that the flux is impeded by the biological system situated within the applied field. The ionic current flows between the cells, via the paracellular pathway and accross the cells, via the trancellular pathway. Ionic flux in the case of the former is impeded by intercellular junctions resistively, while current flow via the trancellular pathway is impeded primarily capacitvely due to the low permittivity (and subsequent polarization) of the cell membranes. \label{fig:Intro_BarrierImpedance }](PaperFigures/Intro_BarrierImpedance .png)

# Current Functionality of 'AnalyZe'



## Data Handling

## Equivalent Circuit Fitting

## Transfer Function System Identification

## 
