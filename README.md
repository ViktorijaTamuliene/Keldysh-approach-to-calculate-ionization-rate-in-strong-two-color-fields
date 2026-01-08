# Keldysh-approach-to-calculate-ionization-rate-in-strong-two-color-fields
This repository contains MATLAB scripts and data associated with the paper:

**"Keldysh approach to calculate ionization rate in strong two-color fields"**

## Overview

In this study, eight terms constituting the ionization rate $w_0$ are introduced:

$w_{0}=w_{0\alpha,\alpha}+ w_{0\alpha,-\alpha}+w_{0\beta,\beta}+w_{0\beta,-\beta}
+w_{0\alpha,\beta}+w_{0-\alpha,\beta}+w_{0\alpha,-\beta}+w_{0-\alpha,-\beta}.$

Each of them are calculated by functions the w0xx.m, where "xx" labels for instance "aa" (for $w_{0\alpha,\alpha}$ term) or "amb" (for $w_{0\alpha,-\beta}$ term).

These functions are used to calculate the ionization both in one-color limit and two-color case.

## Repository Structure

Run the Calculation_x.m programs to fill dat/ and datw/ folders with data.

Run Paint_x.m programs to draw the graphs. Data from dat/ and data/ folders will be utilized. The graphs will be stored in pngs/ folder. Graphs for saddle points as well as driving field's waveshapes are also drawn.

Functions w0xx.m are utilised to calculate the ionization rates.

dawson_m.m function calculates numerically the Dawson integral.

## Ionization rate in strong two-color field



<img src="Output_images/Fig_w0_2color_a.png " alt="Ionization rates" width="350"/>
<img src="Output_images/Fig_w0_2color_b.png " alt="Waveshapes" width="250"/>

Fig. 1: (a) Dependence of ionization rate on intensity at different fraction $g_2/g_1$ values. FH wavelength $\lambda=800$ nm. (b) Different wave shapes of the driving field (blue: $g_2=g_1$; orange: $g_2=g_1/4$).
 

## Citation
If you use this code, please cite:

Title: Keldysh approach to calculating the ionizaiton rate in strong two-color fields

Authors: V. Tamulienė and I. Babushkin  
Journal: Physical Review A   

Volume: 113

Number: 013512

Year: 2026

DOI/Link: https://doi.org/10.1103/rmdz-fdls
