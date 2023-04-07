
classdef AnalyZe < matlab.apps.AppBase
    %ANALYZE EIS (Impedance) data analysis toolbox
    %   Copyright <2023> <Douglas van Niekerk>
    %   
    %   Permission is hereby granted, free of charge, to any person
    %   obtaining a copy of this software and associated documentation
    %   files (the “Software”), to deal in the Software without
    %   restriction, including without limitation the rights to use, copy,
    %   modify, merge, publish, distribute, sublicense, and/or sell copies
    %   of the Software, and to permit persons to whom the Software is
    %   furnished to do so, subject to the following conditions:
    %   
    %   The above copyright notice and this permission notice shall be
    %   included in all copies or substantial portions of the Software.
    %   
    %   THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
    %   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    %   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    %   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
    %   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
    %   ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    %   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    %   SOFTWARE.

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        HomeTab                         matlab.ui.container.Tab
        ExplainerModeSwitch             matlab.ui.control.Switch
        ExplainerModeSwitchLabel        matlab.ui.control.Label
        FitTransferFunctionButton       matlab.ui.control.Button
        TimeSeriesMagnitudeCrossSectionButton  matlab.ui.control.Button
        FitEquivalentCircuitButton      matlab.ui.control.Button
        ImportDataButton                matlab.ui.control.Button
        DouglasvanNiekerkVersion4March2023Label  matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        BioImpedanceDataAnalysisToolLabel  matlab.ui.control.Label
        AnalyZeLabel                    matlab.ui.control.Label
        Image2                          matlab.ui.control.Image
        InportDataTab                   matlab.ui.container.Tab
        PlotSelectedButton              matlab.ui.control.Button
        CLEARLASTDATAPOINTButton        matlab.ui.control.Button
        CLEARDATAButton                 matlab.ui.control.Button
        HOMEButton                      matlab.ui.control.Button
        SaveForLaterButton              matlab.ui.control.Button
        LoadFromPreviousSaveButton      matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        LoadDataPanel                   matlab.ui.container.Panel
        HoldPlotSwitchLoad              matlab.ui.control.ToggleSwitch
        HoldPlotSwitchLabel             matlab.ui.control.Label
        WellNumberEditField             matlab.ui.control.EditField
        WellNumberEditFieldLabel        matlab.ui.control.Label
        ExperimentNumberEditField       matlab.ui.control.NumericEditField
        ExperimentNumberEditFieldLabel  matlab.ui.control.Label
        LOADButton                      matlab.ui.control.Button
        FindFileButton                  matlab.ui.control.Button
        FilePathEditField               matlab.ui.control.EditField
        FilePathEditFieldLabel          matlab.ui.control.Label
        TimePointAUEditField            matlab.ui.control.NumericEditField
        ConditionEditField              matlab.ui.control.EditField
        ConditionEditFieldLabel         matlab.ui.control.Label
        TimePointAUEditFieldLabel       matlab.ui.control.Label
        LoadEISDat                      matlab.ui.control.UIAxes
        AnalysisCCTFITTab               matlab.ui.container.Tab
        LoadResultsButton               matlab.ui.control.Button
        HOMEButton_2                    matlab.ui.control.Button
        ClearResultsButton              matlab.ui.control.Button
        SaveResultsButton               matlab.ui.control.Button
        TabGroup2                       matlab.ui.container.TabGroup
        PlotsTab                        matlab.ui.container.Tab
        PlotResultsSelectionButton      matlab.ui.control.Button
        HoldPlotsSwitch                 matlab.ui.control.ToggleSwitch
        HoldPlotsSwitchLabel            matlab.ui.control.Label
        NyqResults                      matlab.ui.control.UIAxes
        BodeResults                     matlab.ui.control.UIAxes
        ResultsTab                      matlab.ui.container.Tab
        ResultsTable                    matlab.ui.control.Table
        FitDiagnosticTab                matlab.ui.container.Tab
        HoldPlotsSwitch_FitDiagnostics  matlab.ui.control.ToggleSwitch
        HoldPlotsSwitch_2Label          matlab.ui.control.Label
        TabGroup3                       matlab.ui.container.TabGroup
        ResidualsTab                    matlab.ui.container.Tab
        Residuals                       matlab.ui.control.UIAxes
        DensityTab                      matlab.ui.container.Tab
        PlotStyleSwitch                 matlab.ui.control.Switch
        PlotStyleSwitchLabel            matlab.ui.control.Label
        GranularityEditField            matlab.ui.control.NumericEditField
        GranularityEditFieldLabel       matlab.ui.control.Label
        ImagAxisWidthEditField          matlab.ui.control.NumericEditField
        ImagAxisWidthEditFieldLabel     matlab.ui.control.Label
        RealAxisWidthEditField          matlab.ui.control.NumericEditField
        RealAxisWidthEditFieldLabel     matlab.ui.control.Label
        KDensity                        matlab.ui.control.UIAxes
        UpdateDiagnosticPlotsButton     matlab.ui.control.Button
        ImagQQ                          matlab.ui.control.UIAxes
        RealQQ                          matlab.ui.control.UIAxes
        SeriesPlotTab                   matlab.ui.container.Tab
        PlotMultiSeriesMeanSwitch       matlab.ui.control.Switch
        PlotMultiSeriesMeanSwitchLabel  matlab.ui.control.Label
        FlipAxesSwitch                  matlab.ui.control.Switch
        FlipAxesSwitchLabel             matlab.ui.control.Label
        OptionsPanel                    matlab.ui.container.Panel
        NormalizationSchemeListBox_2    matlab.ui.control.ListBox
        NormalizationSchemeListBox_2Label  matlab.ui.control.Label
        SwitchAreaNormType              matlab.ui.control.Switch
        AreaNormalizeSwitch             matlab.ui.control.Switch
        AreaNormalizeSwitchLabel        matlab.ui.control.Label
        Areacm2EditField                matlab.ui.control.NumericEditField
        Areacm2EditFieldLabel           matlab.ui.control.Label
        ZScoreNormalizeSwitch_FitSeries  matlab.ui.control.Switch
        ZScoreNormalizeLabel            matlab.ui.control.Label
        HoldPlotsSwitch_FitSeries       matlab.ui.control.ToggleSwitch
        HoldPlotsSwitch_2Label_2        matlab.ui.control.Label
        PlotFromTableSelectionButton    matlab.ui.control.Button
        FitSeriesPlot                   matlab.ui.control.UIAxes
        RefreshDataOptionsButton        matlab.ui.control.Button
        FittingParams                   matlab.ui.container.Panel
        TabGroup7                       matlab.ui.container.TabGroup
        SeriesResistanceEstimateTab     matlab.ui.container.Tab
        AlternateRestimationListBox     matlab.ui.control.ListBox
        AlternateRestimationListBoxLabel  matlab.ui.control.Label
        RSeriesResistanceSwitch         matlab.ui.control.Switch
        RSeriesResistanceSwitchLabel    matlab.ui.control.Label
        SequentialBarrierFittingTab     matlab.ui.container.Tab
        FitBlankOnlyExcludeBarrierSwitch  matlab.ui.control.Switch
        FitBlankOnlyExcludeBarrierLabel  matlab.ui.control.Label
        FitSequentiallySwitch           matlab.ui.control.Switch
        FitSequentiallySwitchLabel      matlab.ui.control.Label
        BlankFitMultiStartsEditField    matlab.ui.control.NumericEditField
        BlankFitMultiStartsEditFieldLabel  matlab.ui.control.Label
        ProgressGuage                   matlab.ui.control.SemicircularGauge
        CircuitToFit                    matlab.ui.container.TabGroup
        SelectACircuitTab               matlab.ui.container.Tab
        SelectaCircuitBarrierInclusiveListBox  matlab.ui.control.ListBox
        SelectaCircuitBarrierInclusiveListBoxLabel  matlab.ui.control.Label
        BuildACircuitTab                matlab.ui.container.Tab
        IncludeBarrierSwitch            matlab.ui.control.Switch
        IncludeBarrierSwitchLabel       matlab.ui.control.Label
        CircuitBuilderTable             matlab.ui.control.Table
        BuildACircuitMaxValuesTab       matlab.ui.container.Tab
        CircuitBuilderTable_MaxVals     matlab.ui.control.Table
        WriteACircuitTab                matlab.ui.container.Tab
        IncludeBarrierSwitch_2          matlab.ui.control.RockerSwitch
        IncludeBarrierSwitch_2Label     matlab.ui.control.Label
        RLabel                          matlab.ui.control.Label
        DoubleClicktoAddElementListBox  matlab.ui.control.ListBox
        DoubleClicktoAddElementListBoxLabel  matlab.ui.control.Label
        MaxValuesEditField              matlab.ui.control.EditField
        MaxValuesEditFieldLabel         matlab.ui.control.Label
        CircuitStringEditField          matlab.ui.control.EditField
        CircuitStringEditFieldLabel     matlab.ui.control.Label
        RunningLamp                     matlab.ui.control.Lamp
        RunningLampLabel                matlab.ui.control.Label
        GoButton                        matlab.ui.control.Button
        MultiStartsEditField            matlab.ui.control.NumericEditField
        MultiStartsEditFieldLabel       matlab.ui.control.Label
        TrimData                        matlab.ui.container.Panel
        TimeListBox                     matlab.ui.control.ListBox
        TimeListBoxLabel                matlab.ui.control.Label
        ChooseButton                    matlab.ui.control.Button
        ChosenDataTable                 matlab.ui.control.Table
        WellNumberListBox               matlab.ui.control.ListBox
        WellNumberListBoxLabel          matlab.ui.control.Label
        ExperimentNumberListBox         matlab.ui.control.ListBox
        ExperimentNumberListBoxLabel    matlab.ui.control.Label
        ConditionListBox                matlab.ui.control.ListBox
        ConditionListBoxLabel           matlab.ui.control.Label
        AnalysisTimeSeriesMagnitudeCrossSectionTab  matlab.ui.container.Tab
        HOMEButton_3                    matlab.ui.control.Button
        RefreshDataOptionsButton_2      matlab.ui.control.Button
        TabGroup4                       matlab.ui.container.TabGroup
        PlotsTab_2                      matlab.ui.container.Tab
        LoadDataIntoResultsTableButton  matlab.ui.control.Button
        CSDataPlot                      matlab.ui.control.UIAxes
        CSResultsPlot                   matlab.ui.control.UIAxes
        ResultsTab_2                    matlab.ui.container.Tab
        SaveResultsButton_2             matlab.ui.control.Button
        ClearResultsButton_2            matlab.ui.control.Button
        ResultsTable_2                  matlab.ui.control.Table
        CrossSectionParametersPanel     matlab.ui.container.Panel
        CrossSectionOptions             matlab.ui.container.TabGroup
        NormalizationTab_2              matlab.ui.container.Tab
        Panel_3                         matlab.ui.container.Panel
        ModulobeforeafternormalizingSwitch  matlab.ui.control.Switch
        NormalizationSchemeListBox_5    matlab.ui.control.ListBox
        NormalizationSchemeListBox_5Label  matlab.ui.control.Label
        NormalizeSwitch                 matlab.ui.control.Switch
        NormalizeSwitchLabel            matlab.ui.control.Label
        OutlierRemovalTab               matlab.ui.container.Tab
        DetectionSchemeListBox          matlab.ui.control.ListBox
        DetectionSchemeListBoxLabel     matlab.ui.control.Label
        OutlierRemovalSwitch            matlab.ui.control.Switch
        OutlierRemovalSwitchLabel       matlab.ui.control.Label
        Panel_2                         matlab.ui.container.Panel
        PlotMeanSwitch                  matlab.ui.control.Switch
        PlotMeanSwitchLabel             matlab.ui.control.Label
        WaterFallSwitch                 matlab.ui.control.Switch
        WaterFallSwitchLabel            matlab.ui.control.Label
        OverlayTimeSeriesSwitch         matlab.ui.control.ToggleSwitch
        OverlayTimeSeriesSwitchLabel    matlab.ui.control.Label
        HzEditField                     matlab.ui.control.NumericEditField
        HzEditFieldLabel                matlab.ui.control.Label
        CrossSectionFrequencySlider     matlab.ui.control.Slider
        CrossSectionFrequencySliderLabel  matlab.ui.control.Label
        OffsetRemovalSwitch             matlab.ui.control.Switch
        OffsetRemovalSwitchLabel        matlab.ui.control.Label
        TrimData_2                      matlab.ui.container.Panel
        ChooseandPlotButton             matlab.ui.control.Button
        ChosenDataTable_2               matlab.ui.control.Table
        WellNumberListBox_2             matlab.ui.control.ListBox
        WellNumberListBox_2Label        matlab.ui.control.Label
        ExperimentNumberListBox_2       matlab.ui.control.ListBox
        ExperimentNumberListBox_2Label  matlab.ui.control.Label
        ConditionListBox_2              matlab.ui.control.ListBox
        ConditionListBox_2Label         matlab.ui.control.Label
        AnalysisEstimateTransferFunctionTab  matlab.ui.container.Tab
        RunningLamp_2                   matlab.ui.control.Lamp
        RunningLamp_2Label              matlab.ui.control.Label
        ProgressGuage_2                 matlab.ui.control.SemicircularGauge
        GoButton_2                      matlab.ui.control.Button
        LoadResultsButton_2             matlab.ui.control.Button
        HOMEButton_4                    matlab.ui.control.Button
        ClearResultsButton_3            matlab.ui.control.Button
        SaveResultsButton_3             matlab.ui.control.Button
        TabGroup5                       matlab.ui.container.TabGroup
        EstimateTransferFunctionoptionsTab  matlab.ui.container.Tab
        AutoNumberofZerosSwitch         matlab.ui.control.Switch
        AutoNumberofZerosSwitchLabel    matlab.ui.control.Label
        AuxillaryOptionsPanel           matlab.ui.container.Panel
        SearchMethodListBox             matlab.ui.control.ListBox
        SearchMethodListBoxLabel        matlab.ui.control.Label
        WeightingFilterListBox          matlab.ui.control.ListBox
        WeightingFilterListBoxLabel     matlab.ui.control.Label
        MaxiterationsEditField          matlab.ui.control.NumericEditField
        MaxiterationsEditFieldLabel     matlab.ui.control.Label
        NumberofZerosSpinner            matlab.ui.control.Spinner
        NumberofZerosSpinnerLabel       matlab.ui.control.Label
        SystemOrderNumberofPolesSpinner  matlab.ui.control.Spinner
        SystemOrderNumberofPolesSpinnerLabel  matlab.ui.control.Label
        estTfResultsTab                 matlab.ui.container.TabGroup
        PlotsTab_3                      matlab.ui.container.Tab
        AuxResultsPlots                 matlab.ui.container.TabGroup
        NyquistTab                      matlab.ui.container.Tab
        NyqResults_2                    matlab.ui.control.UIAxes
        PoleZeroTab                     matlab.ui.container.Tab
        PoleZeroPanel                   matlab.ui.container.Panel
        PoleZeroResults                 matlab.ui.control.UIAxes
        PlotResultsSelectionButton_2    matlab.ui.control.Button
        HoldPlotsSwitch_3               matlab.ui.control.ToggleSwitch
        HoldPlotsSwitch_3Label          matlab.ui.control.Label
        BodeResults_2                   matlab.ui.control.UIAxes
        ResultsTab_3                    matlab.ui.container.Tab
        ResultsTable_3                  matlab.ui.control.Table
        SeriesPlotTab_2                 matlab.ui.container.Tab
        TabGroup6                       matlab.ui.container.TabGroup
        NormalizationTab                matlab.ui.container.Tab
        NormalizationSchemeListBox_4Label  matlab.ui.control.Label
        ZScoreNormalizeSwitch_FitSeries_2  matlab.ui.control.Switch
        ZScoreNormalizeLabel_2          matlab.ui.control.Label
        NormalizationSchemeListBox_4    matlab.ui.control.ListBox
        PolePlottingTab                 matlab.ui.container.Tab
        PlotTypeListBox                 matlab.ui.control.ListBox
        PlotTypeListBoxLabel            matlab.ui.control.Label
        EnablePolePlottingvsTimeSwitch  matlab.ui.control.Switch
        EnablePolePlottingvsTimeSwitchLabel  matlab.ui.control.Label
        SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner  matlab.ui.control.Spinner
        SelectPoletoPlotFastesttoSlowestSpinnerLabel  matlab.ui.control.Label
        PlotMultiSeriesMeanSwitch_2     matlab.ui.control.Switch
        PlotMultiSeriesMeanSwitch_2Label  matlab.ui.control.Label
        FlipAxesSwitch_2                matlab.ui.control.Switch
        FlipAxesSwitch_2Label           matlab.ui.control.Label
        HoldPlotsSwitch_FitSeries_2     matlab.ui.control.ToggleSwitch
        HoldPlotsSwitch_2Label_4        matlab.ui.control.Label
        PlotFromTableSelectionButton_2  matlab.ui.control.Button
        FitSeriesPlot_2                 matlab.ui.control.UIAxes
        RefreshDataOptionsButton_3      matlab.ui.control.Button
        TrimData_3                      matlab.ui.container.Panel
        TimeListBox_2                   matlab.ui.control.ListBox
        TimeListBox_2Label              matlab.ui.control.Label
        ChooseButton_2                  matlab.ui.control.Button
        ChosenDataTable_3               matlab.ui.control.Table
        WellNumberListBox_3             matlab.ui.control.ListBox
        WellNumberListBox_3Label        matlab.ui.control.Label
        ExperimentNumberListBox_3       matlab.ui.control.ListBox
        ExperimentNumberListBox_3Label  matlab.ui.control.Label
        ConditionListBox_3              matlab.ui.control.ListBox
        ConditionListBox_3Label         matlab.ui.control.Label
    end

    
    properties (Access = private)
        CurrentFileName % Description
        DatToFit % Description
        DatToCrossSection % Description
    end
    
    properties (Access = public)
        CurrentEISMeasurement % Description
        CurrentEISTime = NaN;
        CurrentEISName = 'Null Condition';
        CurrentExpNumber = NaN;
        CurrentWell = 'Null Well';
        Data = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); % Description
        Fits = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'FitsResults', {},'RawData', {});% Description
        ResultTableRowSelected = NaN; % Description
        CrossSectionResultsCumulative = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {},'Indexes',{});% Description
        CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});
 % Description
        CrossSectionIndex = NaN; % Description
        ChosenFreq = NaN % Description
        CS_xline % Description
        CrossSectionResultsLoaded = struct('CSFreq',{},'Name',{'Start'},'ExperimentNumber',{-1},'Well',{'A0'},'Time',{-1},'Mod',{-1},'Arg',{-1});
        ResultTableCellsSelected = NaN; % Description
        FitDiagnosticQQColourCounter = 1; % Description
         % Description
        KDensityFits_ColourMapCounter = 1;
        cct_builder_init = [' ',' ','W','R',' ',' ';' ','R',' ',' ',' ',' ';' ',' ','C',' ',' ',' '];
        cct_builder_MaxVals_init =  [0,0,1,1e6,0,0;0,1000,0,0,0,0;0,0,1,0,0,0];
        WaitForInput = false; % Description
        Rinfty = 0;
        DataTableRowSelected = 1; % Description
        CumulativeCCTfitSeriesPlot; % Description
        CumulativeCCTfitSeriesDomain; % Description
        CumulativeCCTfitSeriesPlotRaw; % Description
        DatToFit_TFest; % Description
        Fits_TFest = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'FitsResults', {},'RawData', {},'FitOpts',{});% Description
        ResultTable_SysID_RowSelected;
        ResultTable_SysID_CellsSelected; % Description
        CumulativeSysIDSeriesPlotRaw;
        CumulativeSysIDSeriesDomain; % Description
        CumulativeSysIDSeriesPlot; % Description
        TutorialMode = true; % Description
    end
    
    methods (Access = private)
        
        
        function out = MultistartFit(app, y_z,freq,multi_starts,cct_type,sequential_Fit,blank_fit, varargin)
            %UNTITLED12 Summary of this function goes here
            %   Detailed explanation goes here
            % Variable Arguments:
            %                   y_z_blank
            %                   multi_starts_blank
            %                   UpperBounds
            %                   LowerBounds
            %                   Beta Zero
                        
                    %% Sequential Fitting
                    
                        Blank_Fits = [];
                        if (sequential_Fit)
                                
                            y_z_blank = varargin{1};
                            multi_starts_blank = varargin{2};
                            
                            selectedTab = app.CircuitToFit.SelectedTab;
                            if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.CircuitBuilderTable_MaxVals)
                                
%                                 cct_char = convertStringsToChars(cct_type);
%                                 plusses = find(cct_char == '+');
%                                 cct_blank = [cct_char(1:plusses(1)-1) cct_char(plusses(3):end)];
%                                 cct_blank_str = convertCharsToStrings(cct_blank);

                                Blank_Fits = app.MultistartFit(y_z_blank,...
                                                        freq,...
                                                        multi_starts_blank,...
                                                        cct_type,...
                                                        false,... %sequetial fit
                                                        true,...
                                                        [],...
                                                        [],...
                                                        varargin{3},...
                                                        varargin{4},...
                                                        varargin{5}...
                                                        ); %blank fit

                            else
                                Blank_Fits = app.MultistartFit(y_z_blank,...
                                                        freq,...
                                                        multi_starts_blank,...
                                                        cct_type,...
                                                        false,... %sequetial fit
                                                        true); %blank fit
                            end
                           
            
                            Blank_beta = Blank_Fits{1};
                        end
                        
            
                        %% Fit data setup
                           
                            R_inf = 0;
                            
                            value = app.RSeriesResistanceSwitch.Value;
                            switch value
                                case 'Alternate'

                                    switch app.AlternateRestimationListBox.Value
                                        case 'Semi-circle Fit'
                                            f = figure;
                                            ax = axes(f);
                                            ax.Units = 'pixels';
                                            ax.Position = [125 100 325 280];
                                                    x = real(y_z);
                                                    y = -1.*imag(y_z);
                                                    plot(ax,x,y,'*r')
                                                    grid minor
     
                                            c = uicontrol;
                                            c.String = 'Select Three Points on Semi-Circle';
                                            c.Position = [30 10 500 50];
                                            c.FontSize = 20;
                                            c.Callback = @app.plotButtonPushed;
                                            c.Tooltip = 'Click this button when ready. Select three points on the plot (each click is registered, but won''t reflect on the plot until the last click).';
                                           
                                            app.WaitForInput = true;
                                           while (app.WaitForInput == true)
                                               drawnow()
                                           end
                                           app.WaitForInput = false; 
                                           r_opt = app.Rinfty;
                                           hold on
                                            xvals = linspace(0,1000,2000);
                                            plot(ax,xvals, sqrt(r_opt(2)^2 - (xvals-r_opt(1)).^2), 'r')
                                            
                                           hold off

                                           R_inf = r_opt(1) - r_opt(2);
                                           %display(R_inf)
        
                                           drawnow()
                                           m = msgbox("R_inf = " + num2str(R_inf));
                                           pause(5)
                                          try 
                                           close(f)
                                          end
                                          try
                                           close(m)
                                          end

                                        case 'Im(Z) Local Min'
                                            
                                            nI = -1.*imag(y_z);
                                            R = real(y_z);
                                            local_min = islocalmin(nI,'SamplePoints',R);
                                            local_min_locs = find(local_min==true);            
                                            First_min = local_min_locs(1);
                                
                                            R_inf = real(y_z(First_min));

                                    end
                                
                                case 'Re(Z)_final'
                                    R_inf = real(y_z(1));
                            end
                            
                
                             C = @(c1,x) ( 1i.*x(:,1).*c1 ).^(-1);
                             L = @(l1,x) 1i.*x(:,1).*l1;
                             Q = @(c1,c2,x) ( c1.*( (1i.*x(:,1)).^(c2) ) ).^(-1);

                             R = @(r1,x) r1;
                             W = @(w1,x) Q(w1,0.5,x);

                             p = @(p1,p2) ( (1./p1) + (1./p2) ).^(-1);
                             
                            Bilayer = @(b,x) ( (1./b(1,:)) + (1./C(b(2,:),x)) ).^(-1);
                            Counter =  @(b,x) ( (1./b(3,:)) + (1./Q(b(4,:),b(5,:),x)) ).^(-1);
                            RandleCounter = @(b,x) ( (1./( b(3,:) + Q(b(4,:),0.5,x)  )) + (1./( C(b(5),x)  )) ).^(-1);
                            RandleCounter_BLANK = @(b,x) ( (1./( b(1,:) + Q(b(2,:),0.5,x)  )) + (1./( C(b(3),x)  )) ).^(-1);
                                
                                %%%%%%%%%%%%
                                     R_RNDL_UB = 1e6; %1e-6
                                %%%%%%%%%%%%
                    
                            CCT_Fn_2E = @(b,x)  R_inf + Bilayer(b,x) + RandleCounter(b,x);
                                beta0_2E = [1;1;1;1;1];
                                lb_2E = [1e-12;1e-12;1e-12;1e-12;1e-12];
                                ub_2E = [1e3;1;R_RNDL_UB;1;1]; 
                                %b(1) = R_bilayer
                                %b(2) = C_bilayer
                              
                                %b(3) = R_Counter
                                %b(4) = W_Counter
                                %b(5) = C_counter
                                CCT_Fn_2E_BLANK = @(b,x)  R_inf + RandleCounter_BLANK(b,x);
                                    beta0_2E_BLANK = [1;1;1];
                                    lb_2E_BLANK = [1e-12;1e-12;1e-12];
                                    ub_2E_BLANK = [R_RNDL_UB;1;1]; 
                                if (sequential_Fit)
                                    CCT_Fn_2E_SEQUENTIAL = @(b,x)  R_inf + Bilayer(b,x) + RandleCounter_BLANK(Blank_beta,x);
                                        beta0_2E_SEQUENTIAL = [1;1];
                                        lb_2E_SEQUENTIAL = [1e-12;1e-12];
                                        ub_2E_SEQUENTIAL = [1e3;1]; 
                                end
                                
            
                            CCT_Fn_3E = @(b,x)  R_inf + Bilayer(b,x) + Q(b(3),1,x);
                                beta0_3E = [1;1;1];
                                lb_3E = [1e-12;1e-12;1e-3];
                                ub_3E = [1e3;1;1]; 
                                %b(1) = R_bilayer
                                %b(2) = C_bilayer
                
                                %b(3) = C_PEDOT:PSS
                                %b(4) = alpha_counter
                                CCT_Fn_3E_BLANK = @(b,x)  R_inf +  Q(b(1),1,x);
                                    beta0_3E_BLANK = [1];
                                    lb_3E_BLANK = [1e-3];
                                    ub_3E_BLANK = [1]; 
                                if (sequential_Fit)
                                    CCT_Fn_3E_SEQUENTIAL = @(b,x)  R_inf + Bilayer(b,x) + Q(Blank_beta(1),1,x);
                                        beta0_3E_SEQUENTIAL = [1;1];
                                        lb_3E_SEQUENTIAL = [1e-12;1e-12];
                                        ub_3E_SEQUENTIAL = [1e3;1]; 
                                end
            
            
                          CCT_Fn_3E_SS = @(b,x)  R_inf + Bilayer(b,x) + Q(b(3),1,x) + Q(b(4),b(5),x);
                                beta0_3E_SS = [1;1;1;1;1];
                                lb_3E_SS = [1e-12;1e-12;1e-3;0;0];
                                ub_3E_SS = [1e3;1;1;1;1]; 
                                %b(1) = R_bilayer
                                %b(2) = C_bilayer
                
                                %b(3) = C_PEDOT:PSS
            
                                %b(4) = Q_RE
                                %b(5) = alpha_RE
                                CCT_Fn_3E_SS_BLANK = @(b,x)  R_inf + Q(b(1),1,x);
                                    beta0_3E_SS_BLANK = [1;1;1];
                                    lb_3E_SS_BLANK = [1e-3;0;0];
                                    ub_3E_SS_BLANK = [1;1;1];
                               if (sequential_Fit)
                                   CCT_Fn_3E_SS_SEQUENTIAL = @(b,x)  R_inf + Bilayer(b,x) + Q(Blank_beta(1),1,x) +  + Q(b(3),b(4),x);
                                        beta0_3E_SS_SEQUENTIAL = [1;1;1;1];
                                        lb_3E_SS_SEQUENTIAL = [1e-12;1e-12;0;0];
                                        ub_3E_SS_SEQUENTIAL = [1e3;1;1;1];  
                               end
            
            
            
                                CCT_Fn_2E_SS = @(b,x)  R_inf + Bilayer(b,x) + Q(b(3),b(4),x);
                                beta0_2E_SS = [1;1;1;1];
                                lb_2E_SS = [1e-12;1e-12;0;0];
                                ub_2E_SS = [1e3;1;1;1]; 
                                %b(1) = R_bilayer
                                %b(2) = C_bilayer
                
                                %b(3) = C_PEDOT:PSS
            
                                %b(4) = Q_RE
                                %b(5) = alpha_RE
                                CCT_Fn_2E_SS_BLANK = @(b,x)  R_inf + Q(b(1),b(2),x);
                                    beta0_2E_SS_BLANK = [1;1;1];
                                    lb_2E_SS_BLANK = [0;0;0];
                                    ub_2E_SS_BLANK = [1;1;1];
                               if (sequential_Fit)
                                   CCT_Fn_2E_SS_SEQUENTIAL = @(b,x)  R_inf + Bilayer(b,x) + Q(Blank_beta(1),Blank_beta(2),x);
                                        beta0_2E_SS_SEQUENTIAL = [1;1;1;1];
                                        lb_2E_SS_SEQUENTIAL = [1e-12;1e-12;0;0];
                                        ub_2E_SS_SEQUENTIAL = [1e3;1;1;1];  
                               end
            
          
            
                           
                        if (cct_type == "3E")
            
                            if (sequential_Fit)
                                CCT_Fn = CCT_Fn_3E_SEQUENTIAL;
                                beta0 = beta0_3E_SEQUENTIAL;
                                lb = lb_3E_SEQUENTIAL;
                                ub = ub_3E_SEQUENTIAL;
                            elseif (blank_fit)
                                CCT_Fn = CCT_Fn_3E_BLANK;
                                beta0 = beta0_3E_BLANK;
                                lb = lb_3E_BLANK;
                                ub = ub_3E_BLANK;
                            else
                                CCT_Fn = CCT_Fn_3E;
                                beta0 = beta0_3E;
                                lb = lb_3E;
                                ub = ub_3E;
                            end
                            
                        elseif (cct_type == "2E")
            
                            if (sequential_Fit)
                                CCT_Fn = CCT_Fn_2E_SEQUENTIAL;
                                beta0 = beta0_2E_SEQUENTIAL;
                                lb = lb_2E_SEQUENTIAL;
                                ub = ub_2E_SEQUENTIAL;
                            elseif (blank_fit)
                                CCT_Fn = CCT_Fn_2E_BLANK;
                                beta0 = beta0_2E_BLANK;
                                lb = lb_2E_BLANK;
                                ub = ub_2E_BLANK;
                            else
                                CCT_Fn = CCT_Fn_2E;
                                beta0 = beta0_2E;
                                lb = lb_2E;
                                ub = ub_2E;
                            end
            
                        elseif (cct_type == "3E_SS")
            
                            if (sequential_Fit)
                                CCT_Fn = CCT_Fn_3E_SS_SEQUENTIAL;
                                beta0 = beta0_3E_SS_SEQUENTIAL;
                                lb = lb_3E_SS_SEQUENTIAL;
                                ub = ub_3E_SS_SEQUENTIAL;
            
                            elseif (blank_fit)
                                CCT_Fn = CCT_Fn_3E_SS_BLANK;
                                beta0 = beta0_3E_SS_BLANK;
                                lb = lb_3E_SS_BLANK;
                                ub = ub_3E_SS_BLANK;
            
                            else
                                CCT_Fn = CCT_Fn_3E_SS;
                                beta0 = beta0_3E_SS;
                                lb = lb_3E_SS;
                                ub = ub_3E_SS;
            
                            end
            
                            elseif (cct_type == "2E_SS")
            
                            if (sequential_Fit)
                                CCT_Fn = CCT_Fn_2E_SS_SEQUENTIAL;
                                beta0 = beta0_2E_SS_SEQUENTIAL;
                                lb = lb_2E_SS_SEQUENTIAL;
                                ub = ub_2E_SS_SEQUENTIAL;
            
                            elseif (blank_fit)
                                CCT_Fn = CCT_Fn_2E_SS_BLANK;
                                beta0 = beta0_2E_SS_BLANK;
                                lb = lb_2E_SS_BLANK;
                                ub = ub_2E_SS_BLANK;
            
                            else
                                CCT_Fn = CCT_Fn_2E_SS;
                                beta0 = beta0_2E_SS;
                                lb = lb_2E_SS;
                                ub = ub_2E_SS;
            
                            end
                        else
  
                            CCT_Fn = eval(cct_type);
                            ub = varargin{3};
                            ub = ub';
                            lb = varargin{4};
                            lb = lb';
                            beta0 = varargin{5};
                            beta0 = beta0';
                        end
            
                %%% Free R Fitting
                    value = app.RSeriesResistanceSwitch.Value;
                    switch value
                                case 'Alternate'

                                    switch app.AlternateRestimationListBox.Value
                                        case 'Free R Fit'
                                            R_inf = 0;
                                            CCT_Fn_Chosen = CCT_Fn;
                                            NumParams = length(beta0);
                                            CCT_Fn = @(b,x) CCT_Fn_Chosen(b,x) + b(NumParams+1);
                                            ub = [ub;1e3];
                                            lb = [lb;0];
                                            beta0 = [beta0;1];
                                    end
                    end

            
                %% FIT Data
                
                        freq_Scale = 1;
                        weighting = 1./( (real(y_z)).^2 + (imag(y_z)).^2 );
                        Real_Scale = weighting; % 1./real(y_z);
                        Imag_Scale = weighting; % 1./imag(y_z);
                        CCT_Fn_Lik = @(b) (sum( Real_Scale.*freq_Scale.*(real(y_z) - real(CCT_Fn(b,2*pi.*freq))).^2 ) ) + (sum( Imag_Scale.*freq_Scale.*(imag(y_z) - imag(CCT_Fn(b,2*pi.*freq))).^2 ) );% - 100.*log10(Upper-b(1))+ 1e3*norm(b-MaxLik,2)^2 %+ 0.001*(b(1)-500)^2
            
                            A = [];
                            b = [];
                            Aeq = [];
                            beq = [];
            
            
                        rng default % For reproducibility
                        problem = createOptimProblem('fmincon','objective',...
                            CCT_Fn_Lik,'x0',beta0,'lb',lb,'ub',ub);
            
                        ms = MultiStart;
                        ms.UseParallel = true;
                        ms.Display = 'iter';
                        ms.PlotFcn = @gsplotbestf;
                       % ms.StartPointsToRun = 'bounds';
            
                        [bet,fval] = run(ms,problem,multi_starts)
            
            %% OUTPUT
            
                        GoF_MSE = goodnessOfFit(CCT_Fn(bet,2*pi*freq),y_z,'MSE');
                        GoF_NRMSE = goodnessOfFit(CCT_Fn(bet,2*pi*freq),y_z,'NRMSE');
                        GoF_NMSE = goodnessOfFit(CCT_Fn(bet,2*pi*freq),y_z,'NMSE');
            
                        GoF = [GoF_MSE, GoF_NRMSE, GoF_NMSE];
            
                        out{1} = [bet; R_inf];
                        out{2} = fval;
                        out{3} = GoF;
                        out{4} = CCT_Fn(bet,2*pi.*freq);
            
                        if (sequential_Fit)
            
                            out{5} = Blank_Fits;
            
                        end

                        
          
            
            
            end
        
            function [] = CrossSection(app,CS_val,LoadNew)

            CS_Freq = CS_val;

            Dat_full = app.DatToCrossSection;
            
            CurrentSelection = true;
            CS_local = app.getCS(CurrentSelection,CS_Freq);

            %% Store Results
                    Dat_i = Dat_full(1);
                    
                    

                      switch (app.OverlayTimeSeriesSwitch.Value)
                          case 'On'
                             
                              if LoadNew
                                        app.CrossSectionResultsCumulative(end+1) = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local),...
                                          'Indexes', {app.CrossSectionIndex}...
                                          );

                                        app.CrossSectionResultsCurrentCondition = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local)...
                                          );
                              else
                                                                   
                                  app.CrossSectionResultsCumulative(end) = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local),...
                                          'Indexes', {app.CrossSectionIndex}...
                                          );
                                  app.CrossSectionResultsCurrentCondition(end+1) = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local)...
                                          );
              
                              end
                               
                                
                              switch (app.WaterFallSwitch.Value)
                                  case 'On'
                                        
                                        app.CS_xline = xline(app.CSDataPlot,CS_Freq,'LineWidth',3);

                                      app.CrossSectionResultsCurrentCondition(end+1) = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local)...
                                          );

                                      if (length(app.CrossSectionResultsCurrentCondition) == 1 )
                                            app.CrossSectionResultsCurrentCondition(end+1) = struct('Name', {Dat_i.Name},...
                                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                          'Well', {Dat_i.Well} ,...
                                          'CSResults', (CS_local)...
                                          );
                                      end
                                        
                                        CS_last = app.CrossSectionResultsCurrentCondition(end);
                                        Time_last = CS_last.CSResults.Time;
                                        Freqs = [1:length(app.CrossSectionResultsCurrentCondition)];


                                        Z = [];
                                        
                                        for (j = 1:length(app.CrossSectionResultsCurrentCondition))
                                            temp = app.CrossSectionResultsCurrentCondition(j);
                                            Z = [Z;abs(temp.CSResults.y_z)];

                                            Freqs(j) =  temp.CSResults.CSFreq(1);
                                        end

                                        [X,Y] = meshgrid(Time_last,Freqs);
                                        
                                      
                                      cla(app.CSResultsPlot,'reset')
                                 
                                        waterfall(app.CSResultsPlot,X,Y,Z)
                                        xlabel(app.CSResultsPlot,'Time')
                                        ylabel(app.CSResultsPlot,'Frequency (Hz)')
                                        zlabel(app.CSResultsPlot,'|Z|')

                                  case 'Off'

                                                                           
                                    if (length(app.CrossSectionResultsCumulative) > 1)
                                       
                                        hold(app.CSResultsPlot, 'off');
                                        
                                        delete(app.CS_xline)
                                        app.CS_xline = xline(app.CSDataPlot,CS_Freq,'LineWidth',3);

                                        CrossSectionCollated = [];

                                        for (i=1:length(app.CrossSectionResultsCumulative))
                                            CS_i = app.CrossSectionResultsCumulative(i);
                                            
                                            Ind = CS_i.Indexes;
                                          
                                            CS_i.CSResults = app.getCS(false,CS_Freq,(Ind));
                                            app.CrossSectionResultsCumulative(i) = CS_i;

                                            CrossSectionCollated = [CrossSectionCollated; CS_i.CSResults.y_z];

                                            if isreal(CS_i.CSResults.y_z)
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, (CS_i.CSResults.y_z), '-*', 'LineWidth',2)
                                            else
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, abs(CS_i.CSResults.y_z), '-*', 'LineWidth',2)
                                            end
                                            hold(app.CSResultsPlot, 'on');
                                        end
                                        
                                        switch (app.PlotMeanSwitch.Value)
                                            case 'On'

                                                lines = findobj(app.CSResultsPlot,'Type','Line');
                                                for i = 1:numel(lines)
                                                  lines(i).LineWidth = 1.0;
                                                end

                                                CrossSectionMean = mean(CrossSectionCollated,"omitnan");
                                                CrossSectionStd = std(CrossSectionCollated,"omitnan");
                                                errorbar(app.CSResultsPlot, CS_i.CSResults.Time, CrossSectionMean,  CrossSectionStd,...
                                                                                                                       "-s","MarkerSize",10,...
                                                                                                                       "MarkerEdgeColor","blue",...
                                                                                                                       "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                                                       'LineWidth',3)
                                        end

                                    else
                                        app.CS_xline = xline(app.CSDataPlot,CS_Freq,'LineWidth',3);

                                        for (i=1:length(app.CrossSectionResultsCumulative))
                                            CS_i = app.CrossSectionResultsCumulative(i);
                                             if isreal(CS_i.CSResults.y_z)
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, (CS_i.CSResults.y_z), '-*', 'LineWidth',2)
                                            else
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, abs(CS_i.CSResults.y_z), '-*', 'LineWidth',2)
                                            end
                                            hold(app.CSResultsPlot, 'on');
                                        end
                                    end
                              end
                                

                          case 'Off'
                               delete(app.CS_xline)
                              app.CS_xline = xline(app.CSDataPlot,CS_Freq,'LineWidth',3);

                              app.CrossSectionResultsCumulative = [];
                              app.CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});

                              app.CrossSectionResultsCumulative = struct('Name', {Dat_i.Name},...
                                  'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                  'Well', {Dat_i.Well} ,...
                                  'CSResults', (CS_local),...
                                  'Indexes', {app.CrossSectionIndex}...
                                  );

                              
                                
                              hold(app.CSResultsPlot, 'off');
                              cla(app.CSResultsPlot,'reset')


                              if isreal(CS_local.y_z)
                                plot(app.CSResultsPlot, CS_local.Time, (CS_local.y_z), '-*', 'LineWidth',2)
                            else
                                plot(app.CSResultsPlot, CS_local.Time, abs(CS_local.y_z), '-*', 'LineWidth',2)
                            end

                              

                              xlabel(app.CSResultsPlot,'Time')
                            ylabel(app.CSResultsPlot,'|Z|')

                      end

                  
            
        end
        
        function results = getCS(app,CurrentSelection,CS_Freq,varargin)

           
            if CurrentSelection
                Dat_full = app.DatToCrossSection;
            else
                Indexes = varargin{1};
                Dat = app.Data;
                    Dat = Dat(Indexes{1});
                        Dat = Dat(Indexes{2});
                            Dat = Dat(Indexes{3});

                Dat_full = Dat;
                
            end

            T = struct2table(Dat_full); % convert the struct array to a table
             sortedT = sortrows(T, 'Time'); % sort the table by 'DOB'
             Dat_full = table2struct(sortedT) ;

            NumDays = length(Dat_full);

            CS_local = [];
            for (i = 1:NumDays)
                
                Dat_i = Dat_full(i);
                Dat_i_EIS = Dat_i.Data;
                y_z_i = Dat_i_EIS.Z - 1j*Dat_i_EIS.Z1;
                freq_i = Dat_i_EIS.FrequencyHz;

                
                index = find(freq_i>=CS_Freq);
                
                index = index(end);

                y_z_CS_i = y_z_i(index);

                switch (app.OffsetRemovalSwitch.Value)
                    case 'On'
                        y_z_CS_i = y_z_CS_i - abs(y_z_i(1));
                    case 'Off'
                end

                CS_local.y_z(i) = y_z_CS_i;
                CS_local.CSFreq(i) = CS_Freq;
                CS_local.Time(i) = Dat_i.Time;

            end

            switch (app.NormalizeSwitch.Value)
                case 'On'
                    Scheme = string(app.NormalizationSchemeListBox_5.Value);
                    
                    if (Scheme == "range")
                        CS_local.y_z = normalize(abs(CS_local.y_z),Scheme);
                    else
                        
                        switch (app.ModulobeforeafternormalizingSwitch.Value)
                            case '|Z|'
                                CS_local.y_z = normalize(abs(CS_local.y_z),Scheme);
                                
                            case 'Z'
                                CS_local.y_z = normalize((CS_local.y_z),Scheme);
                        end
                       
                    end
                case 'Off'
            end

            switch (app.OutlierRemovalSwitch.Value)
                case 'On'
                    scheme =  string(app.DetectionSchemeListBox.Value);
                    
                    Outliers = isoutlier(abs(CS_local.y_z),scheme);
                    
                    CS_local.y_z(Outliers) = missing; 
                      
            end

            results = CS_local;
            
        end

        
        
        function results = getSliderValue(app,val)

            min_f = min(app.ChosenFreq);
            max_f = max(app.ChosenFreq);

           
            results = (10^(val*log10(max_f)))+min_f-1;

            
        end
        
        function [] = setSliderVal(app,val)

            min_f = min(app.ChosenFreq);
            max_f = max(app.ChosenFreq);

            value = (log10((val+1-min_f)))/log10(max_f);
            
            if(value>1)
                value = 1;
            end

            app.CrossSectionFrequencySlider.Value =  value;
            
        end
        
        function [CCT_Func_Str,UpperBound,LowerBound,Beta_zero,DisplayStr] = BuildACircuit(app,cct,MaxVals)
            
            
            
            value = app.IncludeBarrierSwitch.Value;
            switch value
                case 'Off'
                    StartColumn = 3;
                case 'On'
                    StartColumn = 1;        
            end

            pos = [2,StartColumn];
            max_x = 6;
            
                       
                C = @(c1,x) ( 1i.*x(:,1).*c1 ).^(-1);
                L = @(l1,x) 1i.*x(:,1).*l1;
                Q = @(c1,c2,x) ( c1.*( (1i.*x(:,1)).^(c2) ) ).^(-1);
                R = @(r1,x) r1;
                W = @(w1,x) Q(w1,0.5,x);
            
                CCT_Func_Str = "@(b,x) R_inf + ";
                DisplayStr = "R";
                beta_counter = 1;
                UpperBound = 0;
                LowerBound = 0;
                Beta_zero = 0;
            
            while (pos(2) <= max_x)

                if pos(2) == 2
                        pos(2) = pos(2) +1;
                    end
            
                CurrentElement = cct(pos(1),pos(2));
            
                if (CurrentElement == ' ') && (cct(pos(1)-1,pos(2)) ~= ' ') && ( cct(pos(1)+1,pos(2)) ~= ' ' )

                    DisplayStrBranch1 = "";
                    DisplayStrBranch2 = "";
                    
                    cct_branch1 = "";
                    cct_branch2 = "";
                    
                    pos_start = pos;
                    pos(1) = pos_start(1) -1;
                    BranchEnd = pos(2);
                    NextElement = '_';
                    
                    while (NextElement ~= ' ')
                        
                        CurrentElement = cct(pos(1),pos(2));
            
                         if (pos(2)>pos_start(2)) && (CurrentElement ~= ' ')
                            cct_branch1 = cct_branch1 + " + ";
                        end
            
                        [cct_branch1,beta_counter,DisplayStrBranch1] = appendCCTStr(CurrentElement,cct_branch1,beta_counter,DisplayStrBranch1);
                        [UpperBound,LowerBound,Beta_zero] = updateFitParams(CurrentElement,beta_counter-1,UpperBound,LowerBound,Beta_zero,MaxVals,pos);
            
                        pos(2) = pos(2) + 1;
                        NextElement = cct(pos(1),pos(2));
            
                        BranchEnd = pos(2);
            
                    end
            
                    
                    pos = pos_start;
                    pos(1) = pos(1)+1;
                    NextElement = '_';

                    while (NextElement ~= ' ')
                        
                        CurrentElement = cct(pos(1),pos(2));
            
                         if (pos(2)>pos_start(2)) && (CurrentElement ~= ' ')
                            cct_branch2 = cct_branch2 + " + ";
                        end
                    
                       [cct_branch2,beta_counter,DisplayStrBranch2] =  appendCCTStr(CurrentElement,cct_branch2,beta_counter,DisplayStrBranch2);
                       [UpperBound,LowerBound,Beta_zero] = updateFitParams(CurrentElement,beta_counter-1,UpperBound,LowerBound,Beta_zero,MaxVals,pos);
            
                        pos(2) = pos(2) + 1;
                        NextElement = cct(pos(1),pos(2));
            
                        if pos(2) > BranchEnd
                            BranchEnd = pos(2);
                        end
            
                    end
            
                    pos = pos_start;
                    if (pos(2)>1)
                        CCT_Func_Str = CCT_Func_Str + " + ";
                    end
                    
                        temp = convertStringsToChars(DisplayStrBranch1);
                        temp = temp(3:end);
                        DisplayStrBranch1 = convertCharsToStrings(temp);
                        temp = convertStringsToChars(DisplayStrBranch2);
                        temp = temp(3:end);
                        DisplayStrBranch2 = convertCharsToStrings(temp);
                                       
                    CCT_Func_Str = CCT_Func_Str + "( ( (1./(" + cct_branch1 + ")) + (1./(" + cct_branch2 + ")) ).^(-1) )";

                    DisplayStr = DisplayStr + "--(" + DisplayStrBranch1 + "//" + DisplayStrBranch2 + ")";
            
                    pos(2) = BranchEnd;
            
                else
            
                    if (pos(2)>StartColumn) && (CurrentElement ~= ' ')
                        CCT_Func_Str = CCT_Func_Str + " + ";
                    end
                
                    [CCT_Func_Str,beta_counter,DisplayStr] =  appendCCTStr(CurrentElement,CCT_Func_Str,beta_counter,DisplayStr);
            
                    [UpperBound,LowerBound,Beta_zero] = updateFitParams(CurrentElement,beta_counter-1,UpperBound,LowerBound,Beta_zero,MaxVals,pos);
            
            
                    pos(2) = pos(2) +1;

                    
            
                end
            
            
            end
            
  %display(CCT_Func_Str)
             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            function [cctstr,param_counter,disp_str] = appendCCTStr(CCTElement,CurrentStr,ParamCounter,CurrentDisplayStr)
            
                              
                switch CCTElement
                        case 'C'
                            CurrentStr = CurrentStr + "C(b(" + num2str(ParamCounter) + ",:),x)";
                            ParamCounter = ParamCounter +1;

                            CurrentDisplayStr = CurrentDisplayStr + "--C";
                        case 'L'
                            CurrentStr = CurrentStr + "L(b(" + num2str(ParamCounter) + ",:),x)";
                            ParamCounter = ParamCounter +1;

                            CurrentDisplayStr = CurrentDisplayStr + "--L";
                        case 'Q'
                            CurrentStr = CurrentStr + "Q(b(" + num2str(ParamCounter) + ",:),b(" + num2str(ParamCounter+1)  +",:),x)";
                            ParamCounter = ParamCounter +2;


                            CurrentDisplayStr = CurrentDisplayStr + "--Q";
                        case 'R'
                            CurrentStr = CurrentStr + "R(b( " + num2str(ParamCounter) + ",:),x)";
                            ParamCounter = ParamCounter +1;


                            CurrentDisplayStr = CurrentDisplayStr + "--R";
                        case 'W'
                            CurrentStr = CurrentStr + "W(b(" + num2str(ParamCounter) + ",:),x)";
                            ParamCounter = ParamCounter +1;


                            CurrentDisplayStr = CurrentDisplayStr + "--W";
                end
            
                cctstr = CurrentStr;
                param_counter = ParamCounter;
                disp_str = CurrentDisplayStr;
            
            end
            
            
            function [upper,lower,bet_0] = updateFitParams(CCTElement,ParamCounter,CurrentUpper,CurrentLower,CurrentBeta_Zero,MaxValTable,CurrentPos)
            
                
                
                switch CCTElement
                        case 'C'
                            CurrentUpper(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                            CurrentLower(ParamCounter) = 1e-12;
                                if MaxValTable(CurrentPos(1),CurrentPos(2)) > 1
                                    CurrentBeta_Zero(ParamCounter) = 1;
                                else
                                    CurrentBeta_Zero(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                                end
                        case 'L'
                            CurrentUpper(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                            CurrentLower(ParamCounter) = 1e-12;
                            
                                if MaxValTable(CurrentPos(1),CurrentPos(2)) > 1
                                    CurrentBeta_Zero(ParamCounter) = 1;
                                else
                                    CurrentBeta_Zero(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                                end
                            
                        case 'Q'
                            
                            CurrentUpper(ParamCounter-1) = MaxValTable(CurrentPos(1),CurrentPos(2));
                            
                            CurrentUpper(ParamCounter) = 1;
                            
                            CurrentLower(ParamCounter-1) = 1e-12;
                            CurrentLower(ParamCounter) = 1e-12;
                            
                                if MaxValTable(CurrentPos(1),CurrentPos(2)) > 1
                                    CurrentBeta_Zero(ParamCounter-1) = 1;
                                else
                                    CurrentBeta_Zero(ParamCounter-1) = MaxValTable(CurrentPos(1),CurrentPos(2));
                                end
            
                                CurrentBeta_Zero(ParamCounter) = 1;
                            
                        case 'R'
            
                            
                            CurrentUpper(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                            CurrentLower(ParamCounter) = 1e-12;
                            
                                if MaxValTable(CurrentPos(1),CurrentPos(2)) > 1
                                    CurrentBeta_Zero(ParamCounter) = 1;
                                else
                                    CurrentBeta_Zero(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                                end
                         case 'W'
                            CurrentUpper(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                            CurrentLower(ParamCounter) = 1e-12;
                                if MaxValTable(CurrentPos(1),CurrentPos(2)) > 1
                                    CurrentBeta_Zero(ParamCounter) = 1;
                                else
                                    CurrentBeta_Zero(ParamCounter) = MaxValTable(CurrentPos(1),CurrentPos(2));
                                end
                            
                end
            
                upper = CurrentUpper;
                lower = CurrentLower;
                bet_0 = CurrentBeta_Zero;
            
            end

        end
        
        
        
        function [CCT_Func_Str,UpperBound,LowerBound,Beta_zero,DisplayStr] = getWrittenCircuit(app)

%             Modifed from ZFit
%             Jean-Luc Dellis (2023). Zfit (https://www.mathworks.com/matlabcentral/fileexchange/19460-zfit), MATLAB Central File Exchange. Retrieved April 6, 2023. 

            circuit = app.CircuitStringEditField.Value;
            MaxValsStr = app.MaxValuesEditField.Value;
            MaxValsStr = ['[',MaxValsStr,']'];
            MaxVals = eval(MaxValsStr);

            A=circuit~='p' & circuit~='+' & circuit~='(' & circuit~=')' & circuit~=',';
            element=circuit(A);
            CCT_Func_Str = "@(b,x) R_inf + ";
            DisplayStr = ['R+',circuit];
            UpperBound = [];
            LowerBound = [];
            Beta_zero = [];
            ParamCounter = 1;
            
            k=0;
            % for each element
            for i=1:2:length(element-2)
                k=k+1;
                nlp=str2num(element(i+1));% idendify its numeral
                localmaxvals=MaxVals(1:nlp);% get its parameter values
                MaxVals=MaxVals(nlp+1:end);% remove them from param
            
                DisplayStr = regexprep(DisplayStr,element(i:i+1),element(i),'once');
            
                UpperBound = [UpperBound localmaxvals];
                LowerVals = 1e-12.*ones(nlp,1);
                LowerBound = [LowerBound LowerVals'];
                bet_i =ones(nlp,1);
                Beta_zero = [Beta_zero bet_i'];
            
                    switch element(i)
                        case 'C'
                            circuit=regexprep(circuit,element(i:i+1),['C(b(',num2str(ParamCounter),',:),x)'],'once');
                            ParamCounter = ParamCounter +1;
      
                        case 'L'
                            circuit=regexprep(circuit,element(i:i+1),['L(b(',num2str(ParamCounter),',:),x)'],'once');
                            ParamCounter = ParamCounter +1;
          
                        case 'Q'
                            circuit=regexprep(circuit,element(i:i+1),['Q(b(',num2str(ParamCounter),',:),b(',num2str(ParamCounter+1),',:),x)'],'once');
                            ParamCounter = ParamCounter +2;
     
                        case 'R'
                            circuit=regexprep(circuit,element(i:i+1),['R(b(',num2str(ParamCounter),',:),x)'],'once');
                            ParamCounter = ParamCounter +1;
    
                        case 'W'
                            circuit=regexprep(circuit,element(i:i+1),['R(b(',num2str(ParamCounter),',:),x)'],'once');
                            ParamCounter = ParamCounter +1;
     
                    end
            end
            
            CCT_Func_Str = CCT_Func_Str + convertCharsToStrings(circuit);
            %DisplayStr = convertCharsToStrings(DisplayStr);

            
        end
        
%         function z=p(app,varargin) % more zp in parallel
%             %             From ZFit
%             %             Jean-Luc Dellis (2023). Zfit (https://www.mathworks.com/matlabcentral/fileexchange/19460-zfit), MATLAB Central File Exchange. Retrieved April 6, 2023. 
%             temp_size_varargin=size(varargin{1},1);
%             temp_n=ones(temp_size_varargin,nargin-1);
%             temp_sum=ones(temp_size_varargin,1);
%             for iii=1:(nargin-1)
%                 temp_n(:,iii)=varargin{iii};
%             end
%             for iii=1:temp_size_varargin
%                 temp_sum(iii)=sum(1./temp_n(iii,:));
%             end
%             z=1./(temp_sum);
%         end
    end
    
    methods (Access = public)
        
        function results = plotButtonPushed(app,src,event)

                       [x,y] = ginput(3);
                                    
                        circ =@(r)sum(((x-r(1)).^2 + y.^2 - r(2)^2).^2);
                        r_opt = fminunc(circ, [1 1]);
                
                                     
                                  
                        app.Rinfty = r_opt;
                        app.WaitForInput = false; 
                                               
            
                        results = r_opt;
                        
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            writelines(evalc('type(mfilename(''fullpath'')+".mlapp")'),mfilename('fullpath')+".m");
        end

        % Button pushed function: FindFileButton
        function FindFileButtonPushed(app, event)
            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'Select a text file containing the EIS data. The file should be formatted as follows: ',...
                                'Index,Frequency (Hz),Z'' (Ω),-Z'''' (Ω),Z (Ω),-Phase (°),Time (s)',...
                                 '1,100000,1.00,1.00,1.4142,45.0001,0.00',...
                                 '2,10000,3.00,4.00,5.00,53.1301,2.00',...
                                 '.',...
                                 '.', ...
                                 '.'},...
                                    'Select EIS Data To Load',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end
            
            [file,path] = uigetfile('*');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);
            end

            app.FilePathEditField.Value =  fullfile(path,file) ;
            app.CurrentFileName = fullfile(path,file);
        end

        % Button pushed function: LOADButton
        function LOADButtonPushed(app, event)
        
          

            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 7);
            
            % Specify range and delimiter
            opts.DataLines = [2, Inf];
            opts.Delimiter = "\t";

                %Auto-detect_delimeter
                   AutoOpts = detectImportOptions(app.CurrentFileName);
                   opts.Delimiter = string(AutoOpts.Delimiter{1});
            
            % Specify column names and types
            opts.VariableNames = ["Index", "FrequencyHz", "Z", "Z1", "Z2", "Phase", "Times"];
            opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double"];
            
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            
            % Import the data
            app.CurrentEISMeasurement = readtable(app.CurrentFileName, opts);
            
            
            %% Clear temporary variables
            clear opts

            %% Save Data

            %struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});

                app.Data(end+1) = struct('Name', {app.CurrentEISName}, 'Time', {app.CurrentEISTime}, 'ExperimentNumber', {app.CurrentExpNumber},...
                    'Well', {app.CurrentWell} ,  'Data', (app.CurrentEISMeasurement));
                %Data2Save = app.Data;
                %save("Test.mat","Data2Save")



            %% Plot
                EISDat = app.CurrentEISMeasurement;
                Freq = EISDat.FrequencyHz;
                Mod = EISDat.Z2;
                Arg = EISDat.Phase;

                switch app.HoldPlotSwitchLoad.Value
                        case 'On'
                            hold(app.LoadEISDat, 'on');

                        case 'Off'
                            hold(app.LoadEISDat, 'off');
                            cla(app.LoadEISDat)
                    end
                
                yyaxis(app.LoadEISDat, 'left')
                plot(app.LoadEISDat, Freq, Mod,'LineWidth',3)
                set(app.LoadEISDat,'YScale','log')
                set(app.LoadEISDat,'XScale','log')
                hold(app.LoadEISDat, 'on')
                     yyaxis(app.LoadEISDat, 'right')
                     plot(app.LoadEISDat, Freq, Arg,'LineWidth',3)
                     set(app.LoadEISDat,'YScale','linear')
                hold(app.LoadEISDat, 'on')

           %% Add Table Entry
                 newData = {app.CurrentEISName app.CurrentExpNumber app.CurrentWell app.CurrentEISTime};
                 app.UITable.Data = [app.UITable.Data; newData];
        end

        % Value changed function: FilePathEditField
        function FilePathEditFieldValueChanged(app, event)
            value = app.FilePathEditField.Value;
            app.CurrentFileName = value;
        end

        % Value changed function: TimePointAUEditField
        function TimePointAUEditFieldValueChanged(app, event)
            value = app.TimePointAUEditField.Value;
            app.CurrentEISTime = value;
        end

        % Value changed function: ConditionEditField
        function ConditionEditFieldValueChanged(app, event)
            value = app.ConditionEditField.Value;
            app.CurrentEISName = value;
        end

        % Value changed function: ExperimentNumberEditField
        function ExperimentNumberEditFieldValueChanged(app, event)
            value = app.ExperimentNumberEditField.Value;
            app.CurrentExpNumber = value;
        end

        % Value changed function: WellNumberEditField
        function WellNumberEditFieldValueChanged(app, event)
            value = app.WellNumberEditField.Value;
            app.CurrentWell = value;
        end

        % Button pushed function: SaveForLaterButton
        function SaveForLaterButtonPushed(app, event)
           UserFileName = inputdlg("Enter File Name:");

            selpath = uigetdir();
            SavedData = app.Data;
            save(selpath + "\AnalyZeData_" + string(UserFileName) + ".mat","SavedData",'-mat');

            f = msgbox("Data Saved as AnalyZeData_" + string(UserFileName) + ".mat :)");
        end

        % Button pushed function: LoadFromPreviousSaveButton
        function LoadFromPreviousSaveButtonPushed(app, event)
             [file,path] = uigetfile('AnalyZeData*.mat');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);

               var = load(fullfile(path,file));
               app.Data = [app.Data var.SavedData];
            end
            
            app.UITable.Data = [];
            for (i = 1:length(app.Data))
                var = app.Data;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.UITable.Data = [app.UITable.Data; newData];
            end
        

            cla(app.LoadEISDat)
            hold(app.LoadEISDat, 'on');
                            
             for (i = 1:length(app.Data))
                EISDat = app.Data(i);
                EISDat = EISDat.Data;
                Freq = EISDat.FrequencyHz;
                Mod = EISDat.Z2;
                Arg = EISDat.Phase;
                
                yyaxis(app.LoadEISDat, 'left')
                plot(app.LoadEISDat, Freq, Mod,'LineWidth',3)
                set(app.LoadEISDat,'YScale','log')
                set(app.LoadEISDat,'XScale','log')
                
                     yyaxis(app.LoadEISDat, 'right')
                     plot(app.LoadEISDat, Freq, Arg,'LineWidth',3)
                     set(app.LoadEISDat,'YScale','linear')
                
             end
              hold(app.LoadEISDat, 'off');

        end

        % Selection change function: TabGroup
        function TabGroupSelectionChanged(app, event)
            selectedTab = app.TabGroup.SelectedTab;
         
                app.CircuitBuilderTable.Data = num2cell(app.cct_builder_init);
                app.CircuitBuilderTable_MaxVals.Data = num2cell(app.cct_builder_MaxVals_init);
            
            app.IncludeBarrierSwitch.Value = 'Off';

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    TableSize = size(app.CircuitBuilderTable.Data);

                    s_empty = uistyle('BackgroundColor','white');
                    s_full = uistyle('BackgroundColor','green');
                    

                        for (i = 1:TableSize(1))
                            for (j = 1:TableSize(2))
                                  value = app.CircuitBuilderTable.Data(i,j);
                                  value = value{1};
            
                                  if value == ' '
                                      addStyle(app.CircuitBuilderTable,s_empty,'cell',[i,j]);
                                      addStyle(app.CircuitBuilderTable_MaxVals,s_empty,'cell',[i,j]);
                                  else
                                      addStyle(app.CircuitBuilderTable,s_full,'cell',[i,j]);
                                      addStyle(app.CircuitBuilderTable_MaxVals,s_full,'cell',[i,j]);
                                  end
            
            
                            end
                        end
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                
                   flag = app.TutorialMode;
                   TabTag = selectedTab.Tag;
                   if flag

                       switch TabTag
                           case 'ImportData'
                                 msgbox('Enter Data Descriptiors (Time in Arb. Units) -> Select Find File to search for .txt (.csv) data file using explorer -> Select Load to Read data' ,...
                                            'Workflow');
                           case 'CCTFit'
                                msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for circuit fitting -> Choose circuit fitting parameters -> Select Go! to fit slected circuit to all chosen data.' ,...
                                            'Workflow');
                           case 'CrossSection'
                                msgbox('Refresh Data to load data options for selection -> Select Choose and Plot to define subset of the full dataset for analysis and plot the time series of the magnitude cross section -> Explore the spectrum by slecting different frequencies.' ,...
                                            'Workflow');
                           case 'TransferFnFit'
                               msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for Transfer function estimation -> Choose the Number of poles and zeros -> Select Go! to fit an nth order transfer dunction to all chosen data.' ,...
                                            'Workflow');
                       end
                        


                   end
                       
                        
        end

        % Button pushed function: RefreshDataOptionsButton
        function RefreshDataOptionsButtonPushed(app, event)
                Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = "Select All";
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i+1) = Dat(i).Time;
                end
                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = unique(Time);

                app.ConditionListBox.Items = Conditions;
                app.ExperimentNumberListBox.Items = Exp;
                app.WellNumberListBox.Items = Well;
                app.TimeListBox.Items = Time;
        end

        % Button pushed function: ChooseButton
        function ChooseButtonPushed(app, event)

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox('You can now select a subset of time points by holding CTRL and multi-selecting from the Time list box','Heads-Up')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            Condition = app.ConditionListBox.Value;
            Well = app.WellNumberListBox.Value;
            Exp = app.ExperimentNumberListBox.Value;
            Time = string(app.TimeListBox.Value);

            Dat = app.Data;

                ConditionsAll = "";
                ExpAll = "";
                WellAll = "";
                TimeAll = "";
                for (i=1:length(Dat))
                    ConditionsAll(i) = Dat(i).Name;
                    ExpAll(i) = Dat(i).ExperimentNumber;
                    WellAll(i) = Dat(i).Well;
                    TimeAll(i) = Dat(i).Time;
                end
                
               Indexes = [];
               switch Condition
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ConditionsAll == Condition);
               end
                 Dat = Dat(Indexes);
                 ExpAll = ExpAll(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);


             Indexes = [];
               switch Exp
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ExpAll == Exp);
               end
                 Dat = Dat(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Well
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(WellAll == Well);
               end
                 Dat = Dat(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Time
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Time)
                            Ind_j = find(TimeAll == Time(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(TimeAll == Time);
               end
                Dat = Dat(Indexes);

             app.ChosenDataTable.Data = [];
            for (i = 1:length(Dat))
                var = Dat;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable.Data = [app.ChosenDataTable.Data; newData];
            end

           app.DatToFit = Dat;

        end

        % Button pushed function: GoButton
        function GoButtonPushed(app, event)
    
           %% Assemble Parameters
         

            Dat_full = app.DatToFit;

            NumDays = length(Dat_full);
            NumDevices =1;

            app.ProgressGuage.Value = 0;
            app.ProgressGuage.Limits = [0,NumDays];

            multi_starts = app.MultiStartsEditField.Value;
            multi_starts_blank = app.BlankFitMultiStartsEditField.Value;
           
            %fit_sequentially = true;

            switch app.FitSequentiallySwitch.Value
                case 'On'
                    fit_sequentially = true;
                case 'Off'
                    fit_sequentially = false;
            end

           switch app.FitBlankOnlyExcludeBarrierSwitch.Value
                case 'On'
                    fit_blank_only = true;
                    fit_sequentially = false;
                    multi_starts = multi_starts_blank;

                case 'Off'
                    fit_blank_only = false;
            end

            fit_cct = [];
            Upper_bound = [];
            Lower_Bound = [];
            Beta_Zero = [];

            selectedTab = app.CircuitToFit.SelectedTab;

            if selectedTab == app.SelectACircuitTab

                switch app.SelectaCircuitBarrierInclusiveListBox.Value
                    case 'R--(R//C)--((R--W)//C)' 
                        fit_cct = "2E";
                    case 'R--(R//C)--C'
                        fit_cct = "3E";
                    case 'R--(R//C)--C--Q'
                        fit_cct = "3E_SS";
                    case 'R--(R//C)--Q'
                        fit_cct = "2E_SS";
                    otherwise
                        warning('Unexpected circuit type. No plot created.')
                end

                CircuitUsed = app.SelectaCircuitBarrierInclusiveListBox.Value;

            elseif (selectedTab == app.BuildACircuitTab) || (selectedTab == app.BuildACircuitMaxValuesTab)

               
                CCTTable = cell2mat(app.CircuitBuilderTable.Data);
                MaxValTable = cell2mat(app.CircuitBuilderTable_MaxVals.Data);
                
                [fit_cct, Upper_bound, Lower_Bound, Beta_Zero, CircuitUsed] = app.BuildACircuit(CCTTable,MaxValTable) ;

               CircuitUsed = convertStringsToChars(CircuitUsed);

                app.FitSequentiallySwitch.Value = 'Off';
                fit_sequentially = false;
                
                
            elseif selectedTab == app.WriteACircuitTab

                [fit_cct, Upper_bound, Lower_Bound, Beta_Zero, CircuitUsed] = app.getWrittenCircuit();

                app.FitSequentiallySwitch.Value = 'Off';
                fit_sequentially = false;
            
            end
        
            %% Fit CCT
       

            app.RunningLamp.Color = 'green';
            drawnow()

            Fits_local = [];
            for (i = 1:NumDays)

                app.ProgressGuage.Value = i;

                Dat_i = Dat_full(i);
                Dat_i_EIS = Dat_i.Data;
                y_z_i = Dat_i_EIS.Z - 1j*Dat_i_EIS.Z1;
                freq_i = Dat_i_EIS.FrequencyHz;
               
                selectedTab = app.CircuitToFit.SelectedTab;

                if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.CircuitBuilderTable_MaxVals) 
                    
                   value = app.IncludeBarrierSwitch.Value;
                   switch value
                       case 'On'
                           fit_blank_only = false;
                       case 'Off'
                           fit_blank_only = true;
                   end

                    Fits_local{i} = app.MultistartFit( y_z_i,... %y_z
                                            freq_i,... %freq
                                            multi_starts,... %multi_starts
                                            fit_cct,... %cct type
                                            fit_sequentially,... %fit blank first
                                            fit_blank_only, ... %fit blank now
                                            y_z_i,... %y_z blank
                                            multi_starts_blank,... %multi starts
                                            Upper_bound,...
                                            Lower_Bound,...
                                            Beta_Zero...
                                            ); 

                elseif (selectedTab == app.WriteACircuitTab)
                    
                    value = app.IncludeBarrierSwitch_2.Value;
                   switch value
                       case 'On'
                           fit_blank_only = false;
                       case 'Off'
                           fit_blank_only = true;
                   end

                    Fits_local{i} = app.MultistartFit( y_z_i,... %y_z
                                            freq_i,... %freq
                                            multi_starts,... %multi_starts
                                            fit_cct,... %cct type
                                            fit_sequentially,... %fit blank first
                                            fit_blank_only, ... %fit blank now
                                            y_z_i,... %y_z blank
                                            multi_starts_blank,... %multi starts
                                            Upper_bound,...
                                            Lower_Bound,...
                                            Beta_Zero...
                                            ); 

                else
                    Fits_local{i} = app.MultistartFit( y_z_i,... %y_z
                                            freq_i,... %freq
                                            multi_starts,... %multi_starts
                                            fit_cct,... %cct type
                                            fit_sequentially,... %fit blank first
                                            fit_blank_only, ... %fit blank now
                                            y_z_i,... %y_z blank
                                            multi_starts_blank... %multi starts
                                            ); 

                    
                end

                 

                 %% Store Results
                      app.Fits(end+1) = struct('Name', {Dat_i.Name},...
                          'Time', {Dat_i.Time},...
                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                          'Well', {Dat_i.Well} ,...
                          'FitsResults', (Fits_local(i)),...
                          'RawData', [y_z_i freq_i]...
                          );

                  %% Add Table Entry
                        Results = Fits_local{i};
                        GoF_results = Results{3};
                        Beta_result = Results{1};

                       
                     %%%%%%%%% Calculate Information Criterion

                            Fits_y_z = Results{4};
                            Data_y_z = y_z_i;
                
                            Res = Data_y_z - Fits_y_z;
                            Res_pair = [real(Res) imag(Res)];
                            Res_pair = Res_pair(1:end-1,:);
                            
                            mu = zeros(1,2);
                            sigma = eye(2);
                            
                            MvLik = mvnpdf(Res_pair,mu,sigma);
                            idx= MvLik~=0;
                            LogLikelihood = sum(log(MvLik(idx)));
                            numObs = length(Res);
                            numParams = 1;
                            if (fit_blank_only)
                               numParams = length(Beta_result);
                            else      
                                if (fit_sequentially)
                                    Sequential_Blank_Result = Results{5};
                                    numParams = length(cell2mat(Sequential_Blank_Result(1))) + 2;
                                else
                                    numParams = length(Beta_result(3:end)) + 2;
                                end
                            end
                            
                           [aic,bic] = aicbic(LogLikelihood,numParams,numObs);

                            
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                   

                        if (fit_blank_only)
                            Rb_Result = NaN;
                            Cb_Result = NaN;

                           Beta_device_results = Beta_result;

                        else
                            Rb_Result = Beta_result(1);
                            Cb_Result = Beta_result(2);

                            if (fit_sequentially)
                                Sequential_Blank_Result = Results{5};
                                Beta_device_results = cell2mat(Sequential_Blank_Result(1));
                            else
                                Beta_device_results = (Beta_result(3:end));
                            end
                        end

                        Beta_device_results = mat2str(Beta_device_results,4);

                                                                   
                     newData = {CircuitUsed Dat_i.Name Dat_i.ExperimentNumber Dat_i.Well Dat_i.Time Rb_Result Cb_Result Beta_device_results GoF_results(1) GoF_results(2) GoF_results(3) aic bic};
                                    
                     DataToAddToTable = [app.ResultsTable.Data; newData];
                     app.ResultsTable.Data = DataToAddToTable;


                  %% plot Results
                    
                    Results = Fits_local{i};

                    Results_yz = Results{4};
                    Mod_Results = abs(Results_yz);
                    Arg_Results = -1.*angle(Results_yz)*(180/pi);
                    
                    Freq = Dat_i_EIS.FrequencyHz;
                    Mod = Dat_i_EIS.Z2;
                    Arg = Dat_i_EIS.Phase;

                    switch app.HoldPlotsSwitch.Value
                        case 'On'
                            hold(app.BodeResults, 'on');

                            hold(app.NyqResults,'on' );
                        case 'Off'
                            yyaxis(app.BodeResults, 'right')
                            hold(app.BodeResults, 'off');
                            cla(app.BodeResults)
                             yyaxis(app.BodeResults, 'left')
                            hold(app.BodeResults, 'off');
                            cla(app.BodeResults)

                            hold(app.NyqResults,'off' );
                            cla(app.NyqResults)
                    end
                                    
                    yyaxis(app.BodeResults, 'left')
                    plot(app.BodeResults, Freq, Mod, '*r','LineWidth',1)
                    set(app.BodeResults,'YScale','log')
                    set(app.BodeResults,'XScale','log')
                    xlabel(app.BodeResults,'Frequency (Hz)');
                    ylabel(app.BodeResults,'Magnitude, |Z|, (\Omega )');
                    hold(app.BodeResults, 'on')
                        plot(app.BodeResults, Freq, Mod_Results, '-r','LineWidth',1)

                         yyaxis(app.BodeResults, 'right')
                           ylabel(app.BodeResults,'-Phase, \angle Z (deg)');
                         plot(app.BodeResults, Freq, Arg, '*g','LineWidth',1)
                         plot(app.BodeResults, Freq, Arg_Results, '-g','LineWidth',1)
                         set(app.BodeResults,'YScale','linear')
                    hold(app.BodeResults, 'off')
                    
       
                    plot(app.NyqResults , Dat_i_EIS.Z, Dat_i_EIS.Z1, '*r','LineWidth',1)
                    hold(app.NyqResults, 'on')
                        plot(app.NyqResults , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                    hold(app.NyqResults, 'off')
                    xlabel(app.NyqResults,'Real(Z)');
                    ylabel( app.NyqResults, '-Imag(Z)');

                    drawnow()
                    
            end
            
            app.RunningLamp.Color = 'red';
            drawnow()

     

            



        end

        % Button pushed function: ClearResultsButton
        function ClearResultsButtonPushed(app, event)
            answer = 'Continue';

               answer = questdlg('Are you sure that you want to delete all Circuit Fitting Results from the App (saved files are unaffected)?',...
                                    'Clear Data',...
                                   'Continue','Cancel','Continue');
               switch answer
                   case 'Cancel'
                       return
               end 
            
            yyaxis(app.BodeResults, 'right')
             cla(app.BodeResults)
             yyaxis(app.BodeResults, 'left')
             cla(app.BodeResults)
             cla(app.NyqResults)
             cla(app.FitSeriesPlot)
             app.ResultsTable.Data = [];
             app.ProgressGuage.Limits = [0,1];
             app.ProgressGuage.Value = 0;
             

             app.Fits = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'FitsResults', {},'RawData', {});
             
             f = msgbox("Results Cleared!");
       
             
        end

        % Button pushed function: SaveResultsButton
        function SaveResultsButtonPushed(app, event)
            UserFileName = inputdlg("Enter File Name: ");
            
            selpath = uigetdir();
            SavedDataResults = app.Fits;
            save(selpath + "\AnalyZeResults_" + string(UserFileName) + ".mat","SavedDataResults",'-mat');

            T_c =  app.ResultsTable.Data;
            T = cell2table(T_c, 'VariableNames', {'circuit','Condition','exp','cell','Time','Rb','Cb','Device CCT Params','mse','rmse','nmse','aic','bic'});

            filename= selpath + "\AnalyZeResults_wIC_" + string(UserFileName) + ".csv";
            writetable(T,filename);

            f = msgbox("Data Saved as AnalyZeResults_" + string(UserFileName) + ".mat and AnalyZeResults_wIC_"  + string(UserFileName) + ".csv :D");
        end

        % Value changed function: FitBlankOnlyExcludeBarrierSwitch
        function FitBlankOnlyExcludeBarrierSwitchValueChanged(app, event)
            value = app.FitBlankOnlyExcludeBarrierSwitch.Value;

            switch value
                case 'On'
                    app.FitSequentiallySwitch.Value = 'Off';
                    app.IncludeBarrierSwitch.Value = 'Off';
                case 'Off'
                   
            end


            value = app.IncludeBarrierSwitch.Value;
            
            switch value
                case 'On'
                    
                    app.CircuitBuilderTable.Data(1,1) = {'R'};
                    app.CircuitBuilderTable.Data(3,1) = {'C'};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {1000};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {1};
                    
                case 'Off'
                    app.CircuitBuilderTable.Data(1,1) = {' '};
                    app.CircuitBuilderTable.Data(3,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {0};
            end

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             TableSize = size(app.CircuitBuilderTable.Data);

            s_empty = uistyle('BackgroundColor','white');
            s_full = uistyle('BackgroundColor','green');

            for (i = 1:TableSize(1))
                for (j = 1:TableSize(2))
                      value = app.CircuitBuilderTable.Data(i,j);
                      value = value{1};

                      if value == ' '
                          addStyle(app.CircuitBuilderTable,s_empty,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_empty,'cell',[i,j]);
                      else
                        addStyle(app.CircuitBuilderTable,s_full,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_full,'cell',[i,j]);
                      end


                end
            end



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
        end

        % Cell selection callback: ResultsTable
        function ResultsTableCellSelection(app, event)
            indices = event.Indices;
            
            if (length(indices) >= 1)
                %display(indices)
                app.ResultTableRowSelected = indices(1);
                app.ResultTableCellsSelected = indices;
            end

            
        end

        % Button pushed function: UpdateDiagnosticPlotsButton
        function UpdateDiagnosticPlotsButtonPushed(app, event)
               answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Select any cell in the results table - the fit diagnostic associated with that row will be plotted.',...
                                        'Plot a Fitting Diagnostic',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end

              try 
                    SelectedFits = app.Fits(app.ResultTableRowSelected);
               catch
                   msgbox('Select a cell in the results table to plot the fit diagnostics result associated with that row.')
                   error('No result selected.')
               end

            SelectedFits = app.Fits(app.ResultTableRowSelected);

            LocalResults = SelectedFits.FitsResults;
            Fits_y_z = LocalResults{4};
            Data_Raw = SelectedFits.RawData;
            Data_y_z = Data_Raw(:,1);

            Res = Data_y_z - Fits_y_z;

            switch app.HoldPlotsSwitch_FitDiagnostics.Value
                case 'On'
                    hold(app.RealQQ, 'on');
                    hold(app.ImagQQ, 'on');
                    hold(app.KDensity, 'on');
                    hold(app.Residuals, 'on');

                    app.FitDiagnosticQQColourCounter = app.FitDiagnosticQQColourCounter +1;
                        if app.FitDiagnosticQQColourCounter > 5
                            app.FitDiagnosticQQColourCounter = 1;
                        end
                    app.KDensityFits_ColourMapCounter = app.KDensityFits_ColourMapCounter +1;
                        if app.KDensityFits_ColourMapCounter > 6
                            app.KDensityFits_ColourMapCounter =1;
                        end
                    
                case 'Off'
                    hold(app.RealQQ, 'off');
                    hold(app.ImagQQ, 'off');
                    hold(app.KDensity, 'off');
                    hold(app.Residuals, 'off');

                    app.FitDiagnosticQQColourCounter = 1;
                    app.KDensityFits_ColourMapCounter = 1;
            end


            scatter(app.Residuals, real(Res) ,imag(Res),'*');

            cmap = hsv(6);

            qq1 = qqplot(app.RealQQ, real(Res) );
            title(app.RealQQ, 'QQ Plot Re(Residuals)')
            qq1(1).MarkerEdgeColor = cmap(end-app.FitDiagnosticQQColourCounter,:);
            qq2 = qqplot(app.ImagQQ, imag(Res) );
            title(app.ImagQQ, 'QQ Plot Im(Residuals)')
            qq2(1).MarkerEdgeColor = cmap(end-app.FitDiagnosticQQColourCounter,:);

            gridx1 = -app.RealAxisWidthEditField.Value:app.GranularityEditField.Value:app.RealAxisWidthEditField.Value;
            gridx2 = -app.ImagAxisWidthEditField.Value:app.GranularityEditField.Value:app.ImagAxisWidthEditField.Value;
            [x1,x2] = meshgrid(gridx1, gridx2);
            x1 = x1(:);
            x2 = x2(:);
            xi = [x1 x2];

            FaceAlfa = 1 - (1/app.KDensityFits_ColourMapCounter);
            switch app.PlotStyleSwitch.Value
                case 'Surface'
                    ksdensity(app.KDensity, [ real(Res) imag(Res) ], xi)
                case 'Contour'
                    ksdensity(app.KDensity, [ real(Res) imag(Res) ], xi, 'PlotFcn','contour')
            end
%             ColourMaps  = {colormap(app.KDensity,parula),...
%                 colormap(app.KDensity,autumn),...
%                 colormap(app.KDensity,hsv),...
%                 colormap(app.KDensity,spring),...
%                 colormap(app.KDensity,summer),...
%                 colormap(app.KDensity,hot)...
%                 };
%             colormap(app.KDensity,ColourMaps{app.KDensityFits_ColourMapCounter})



        end

        % Button pushed function: ChooseandPlotButton
        function ChooseandPlotButtonPushed(app, event)

            answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Select the time series to examine. Use the slider or the edit box to interactively change the frequency of cross section. Enable Overlay Time Series to iteratively overlay different series at the same frequency. Only new data is added to the multi-series mean.' ,...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end

            IndexRecord = [];

            Condition = app.ConditionListBox_2.Value;
            Well = app.WellNumberListBox_2.Value;
            Exp = app.ExperimentNumberListBox_2.Value;

            Dat = app.Data;

                ConditionsAll = "";
                ExpAll = "";
                WellAll = "";
                for (i=1:length(Dat))
                    ConditionsAll(i) = Dat(i).Name;
                    ExpAll(i) = Dat(i).ExperimentNumber;
                    WellAll(i) = Dat(i).Well;
                end
                
               Indexes = [];
               switch Condition
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ConditionsAll == Condition);
               end
                 Dat = Dat(Indexes);
                 ExpAll = ExpAll(Indexes);
                 WellAll = WellAll(Indexes);

                 IndexRecord{1} = Indexes;


             Indexes = [];
               switch Exp
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ExpAll == Exp);
               end
                 Dat = Dat(Indexes);
                 WellAll = WellAll(Indexes);

                 IndexRecord{2} = Indexes;

             Indexes = [];
               switch Well
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(WellAll == Well);
               end
                 Dat = Dat(Indexes);

                 IndexRecord{3} = Indexes;

             app.ChosenDataTable_2.Data = [];
            for (i = 1:length(Dat))
                var = Dat;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable_2.Data = [app.ChosenDataTable_2.Data; newData];
            end

           app.DatToCrossSection = Dat;
           app.CrossSectionIndex = IndexRecord;
            
           if (length(Dat)>0)
                Dat_1 = Dat(1);
                Dat_1_EIS = Dat_1.Data;
                Dat_1_Freq = Dat_1_EIS.FrequencyHz;
                app.ChosenFreq = Dat_1_Freq;

                %app.CrossSectionFrequencySlider.Limits = [min(Dat_1_Freq), max(Dat_1_Freq)];
%                 app.CrossSectionFrequencySlider.Limits = [0, 1];
%                 app.CrossSectionFrequencySlider.MajorTicksMode = 'manual';
%                 app.CrossSectionFrequencySlider.MajorTicks = linspace(0,1,5);
%                 app.CrossSectionFrequencySlider.MajorTickLabelsMode = 'manual';
%                 a = (log10(min(Dat_1_Freq)));
%                 b = (log10(max(Dat_1_Freq)));
%                 app.CrossSectionFrequencySlider.MajorTickLabels =  compose("%5.0e",logspace(a,b,5));
                
                app.CrossSectionFrequencySlider.Limits = [0, 1];
                app.CrossSectionFrequencySlider.MajorTicksMode = 'manual';
                app.CrossSectionFrequencySlider.MajorTicks = linspace(0,1,5);
                app.CrossSectionFrequencySlider.MajorTickLabelsMode = 'manual';
                min_f = min(Dat_1_Freq);
                max_f = max(Dat_1_Freq);
                a = (log10(min(Dat_1_Freq)));
                b = (log10(max(Dat_1_Freq)));
                lin_vals = linspace(0,1,5);
                app.CrossSectionFrequencySlider.MajorTickLabels =  compose("%5.0e", ( (10.^(lin_vals.*log10(max_f)))+min_f-1 ) );

                %app.CrossSectionFrequencySlider.Value = (max(Dat_1_Freq)+min(Dat_1_Freq))/2;
                 app.CrossSectionFrequencySlider.Value = 0.5;
                app.HzEditField.Value = app.getSliderValue(0.5);
                val = app.getSliderValue(0.5);
                CrossSection(app,val,true);


                %%Plot

                 cla(app.CSDataPlot,'reset')

                for (i = 1:length(Dat))
                    Dat_i = Dat(i);
                    Dat_i_EIS = Dat_i.Data;
                    Freq = Dat_i_EIS.FrequencyHz;
                    Mod = Dat_i_EIS.Z2;
                    Arg = Dat_i_EIS.Phase;

                   
                    
                                    
                    yyaxis(app.CSDataPlot, 'left')
                    plot(app.CSDataPlot, Freq, Mod, '-r','LineWidth',1)
                    set(app.CSDataPlot,'YScale','log')
                    set(app.CSDataPlot,'XScale','log')
                    xlabel(app.CSDataPlot,'Frequency (Hz)');
                    ylabel(app.CSDataPlot,'Magnitude, |Z|, (\Omega )');
                    hold(app.CSDataPlot, 'on')
                        
                         yyaxis(app.CSDataPlot, 'right')
                           ylabel(app.CSDataPlot,'-Phase, \angle Z (deg)');
                         plot(app.CSDataPlot, Freq, Arg, '-g','LineWidth',1)
                         set(app.BodeResults,'YScale','linear')
                    %hold(app.CSDataPlot, 'off')
                end
           end

           
        end

        % Value changed function: CrossSectionFrequencySlider
        function CrossSectionFrequencySliderValueChanged(app, event)
            value = app.CrossSectionFrequencySlider.Value;
            
            value = app.getSliderValue(value);

            app.HzEditField.Value = value;

            CrossSection(app,value,false);
        end

        % Value changed function: HzEditField
        function HzEditFieldValueChanged(app, event)
            value = app.HzEditField.Value;
            app.setSliderVal(value);
            
            
            CrossSection(app,value,false);
                

        end

        % Button pushed function: RefreshDataOptionsButton_2
        function RefreshDataOptionsButton_2Pushed(app, event)
            Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = "Select All";
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i+1) = Dat(i).Time;
                end
                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = unique(Time);

                app.ConditionListBox_2.Items = Conditions;
                app.ExperimentNumberListBox_2.Items = Exp;
                app.WellNumberListBox_2.Items = Well;
                
        end

        % Value changing function: CrossSectionFrequencySlider
        function CrossSectionFrequencySliderValueChanging(app, event)
            changingValue = event.Value;
            
            value = app.getSliderValue(changingValue);

            app.HzEditField.Value = value;

            %CrossSection(app,changingValue,false);
        end

        % Button pushed function: LoadDataIntoResultsTableButton
        function LoadDataIntoResultsTableButtonPushed(app, event)
          answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Load currently plotted data into the results table to be (temporarily) saved.' ,...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end

            switch (app.OverlayTimeSeriesSwitch.Value)
                case 'On'
                        switch (app.WaterFallSwitch.Value)
                            case 'On'
                               LoopLen = length(app.CrossSectionResultsCurrentCondition);
                               ResultsToStore = app.CrossSectionResultsCurrentCondition ;

                               %display("Waterfall")
                            otherwise
                                LoopLen = length(app.CrossSectionResultsCumulative);
                                ResultsToStore = app.CrossSectionResultsCumulative ;
                                if (LoopLen == 1)
                                    LoopLen = length(app.CrossSectionResultsCurrentCondition);
                                    ResultsToStore = app.CrossSectionResultsCurrentCondition ;
                                end
                                
                        end  
                otherwise
                     LoopLen = length(app.CrossSectionResultsCumulative);
                     ResultsToStore = app.CrossSectionResultsCumulative ;
            end

            %display(LoopLen)

            for (i = 1:LoopLen)
                CSRes_i = ResultsToStore(i);
    
                Name = CSRes_i.Name;
                Exp = CSRes_i.ExperimentNumber;
                Well = CSRes_i.Well;
                CSFreq = CSRes_i.CSResults.CSFreq(1);
    
                y_z_i = CSRes_i.CSResults.y_z;
                Time_i = CSRes_i.CSResults.Time;
    
                for (j=1:length(Time_i))
                    y_z = y_z_i(j);
                    time = Time_i(j);
    
                    app.CrossSectionResultsLoaded(end+i) = struct(...
                         'CSFreq', CSFreq,...
                         'Name', Name,...
                         'ExperimentNumber', Exp,...
                         'Well',Well,...
                         'Time',time,...
                         'Mod',abs(y_z),...
                         'Arg',(angle(y_z)*(180/pi))...
                    );

                    newData = {CSFreq,...
                                Name,...
                                Exp,...
                                Well,...
                                time,...
                                abs(y_z),...
                                (angle(y_z)*(180/pi))...
                    };

                    DataToAddToTable = [app.ResultsTable_2.Data; newData];
                    app.ResultsTable_2.Data = DataToAddToTable;

               end
                                        
            end

        end

        % Button pushed function: ClearResultsButton_2
        function ClearResultsButton_2Pushed(app, event)
            answer = 'Continue';

               answer = questdlg('Are you sure that you want to delete all Cross Section Results from this table (saved files are unaffected)?',...
                                    'Clear Data',...
                                   'Continue','Cancel','Continue');
               switch answer
                   case 'Cancel'
                       return
               end 
            
            yyaxis(app.CSDataPlot, 'right')
             cla(app.CSDataPlot)
             yyaxis(app.CSDataPlot, 'left')
             cla(app.CSDataPlot)
             cla(app.CSResultsPlot)
             app.ResultsTable_2.Data = [];

            app.CrossSectionResultsCumulative = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {},'Indexes',{});% Description
            app.CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});
            app.CrossSectionResultsLoaded = struct('CSFreq',{},'Name',{'Start'},'ExperimentNumber',{-1},'Well',{'A0'},'Time',{-1},'Mod',{-1},'Arg',{-1});
             
             f = msgbox("Results Cleared!");
        end

        % Button pushed function: SaveResultsButton_2
        function SaveResultsButton_2Pushed(app, event)
            UserFileName = inputdlg("Enter File Name: ");
            
            selpath = uigetdir();
            SavedDataResults = app.CrossSectionResultsLoaded;
            save(selpath + "\AnalyZeCrossSectionResults_" + string(UserFileName) + ".mat","SavedDataResults",'-mat');

            T_c =  app.ResultsTable_2.Data;
            T = cell2table(T_c, 'VariableNames', {'CrossSectionFreq','Condition','exp','well','Time','MagZ','AngleZ'});

            filename= selpath + "\AnalyZeCrossSectionResults_" + string(UserFileName) + ".csv";
            writetable(T,filename);

            f = msgbox("Data Saved as AnalyZeCrossSectionResults_" + string(UserFileName) + ".mat and AnalyZeCrossSectionResults_"  + string(UserFileName) + ".csv :D");
        end

        % Button pushed function: PlotFromTableSelectionButton
        function PlotFromTableSelectionButtonPushed(app, event)
                
               answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Highlight a series of cells in a column of the results table to plot (or two series in different columns to plot against each other). Select Hold Plots to overlay plots - with each plot command the currently selected series will be added to the mean. Select a single cell to continue to replot the currently overlayed series (with different plot options) without adding additional data' ,...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end

                ind = app.ResultTableCellsSelected;
                
                
                if length(ind(:,1)) >= 2

                    
                    T_c =  app.ResultsTable.Data;
                
                    T = cell2table(T_c, 'VariableNames',...
                       {'circuit','Condition','exp','cell','Time',...
                      'Rb','Cb','Device CCT Params','MSE','NRMSE','NMSE','AIC','BIC'});
    
                    Names = app.ResultsTable.ColumnName;
                    columns = unique(ind(:,2));
    
                    x = [];
                    y = [];
                    var_y = [];
    
                    if length(columns) >=2 
                        var_x = string(Names(columns(1)));
                        var_y = string(Names(columns(2)));
        
                        xlabel(app.FitSeriesPlot,var_x);
                        ylabel(app.FitSeriesPlot,var_y);
                        
                        DatToPlot = table2array(T(unique(ind(:,1)),[var_x, var_y])) ;
                        x = DatToPlot(:,1);
                        y = DatToPlot(:,2);
                    else
                        var_y = string(Names(columns(1)));
                            
                        xlabel(app.FitSeriesPlot,"Indexes");
                        ylabel(app.FitSeriesPlot,var_y);
                        
                        DatToPlot = table2array(T(ind(:,1),var_y)) ;
                        
                        y = DatToPlot(:,1);
                        x = 1:length(y);
                        x = x';
                    end

                    switch var_y
                        case 'Device CCT Params'
                            prompt = {'Enter the Index of the Parameter you wish to plot (Indexes start at 1):'};
                            dlgtitle = 'Choose Param';
                            dims = [1 40];
                            definput = {'1'};
                            
                            answer = inputdlg(prompt,dlgtitle,dims,definput);
                            Index = round(str2double(answer));
                            
                            y_temp = [];
                            for i = 1:length(y)
                                temp = eval(y{i});
                                y_temp(i) = temp(Index);
                            end
                            y = y_temp';
                            assignin('base','y',y)
                    end


    
                    switch app.FlipAxesSwitch.Value
                        case 'On'
                            temp = y;
                            y = x;
                            x = temp;
    
                            xlab = app.FitSeriesPlot.XLabel;
                            xlab = xlab.String;
                            ylab = app.FitSeriesPlot.YLabel;
                            ylab = ylab.String;
                            xlabel(app.FitSeriesPlot, ylab);
                            ylabel(app.FitSeriesPlot, xlab);
                    end
    
                    switch app.HoldPlotsSwitch_FitSeries.Value
    
                        case 'On'
                            %hold(app.FitSeriesPlot, 'on');
                            app.CumulativeCCTfitSeriesPlotRaw = [app.CumulativeCCTfitSeriesPlotRaw y];
                            app.CumulativeCCTfitSeriesDomain = [app.CumulativeCCTfitSeriesDomain x];
                            
                        case 'Off'
                            %hold(app.FitSeriesPlot, 'off');
                            app.CumulativeCCTfitSeriesPlotRaw = y;
                            app.CumulativeCCTfitSeriesDomain = x;
    
                    end


                end
                
                app.CumulativeCCTfitSeriesPlot = app.CumulativeCCTfitSeriesPlotRaw;
                
                if length(app.CumulativeCCTfitSeriesPlot(:,1)) >= 2

                     switch app.ZScoreNormalizeSwitch_FitSeries.Value
                        case 'On'
                          Scheme = string(app.NormalizationSchemeListBox_2.Value);
    
                          temp_y = app.CumulativeCCTfitSeriesPlot;
                              for i =1:length(temp_y(1,:))
                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                              end
    
                           app.CumulativeCCTfitSeriesPlot = temp_y;
    
                        case 'Off'
                    end
    
                    switch app.AreaNormalizeSwitch.Value
                        case 'On'
                            Area = app.Areacm2EditField.Value;
                            temp_y = app.CumulativeCCTfitSeriesPlot;
                            switch app.SwitchAreaNormType.Value
                                case '*A'
                                    for i=1:length(temp_y(1,:))
                                        temp_y(:,i) = temp_y(:,i).*Area;
                                    end

                                        ylab = app.FitSeriesPlot.YLabel;
                                        ylab = ylab.String;
                                        if ~contains(ylab,"cm") && ~contains(ylab,"cm^2") 
                                            ylabel(app.FitSeriesPlot,ylab + " cm^2");
                                        elseif contains(ylab,"cm") && ~contains(ylab,"cm^2")
                                            ylab = ylab + "^2";
                                            ylabel(app.FitSeriesPlot,ylab);
                                        end
                                case '*sqrt(A)'
                                    for i=1:length(temp_y(1,:))
                                        temp_y(:,i) = temp_y(:,i).*sqrt(Area);
                                    end
    
                                    ylab = app.FitSeriesPlot.YLabel;
                                    ylab = ylab.String;
                                    if ~contains(ylab,"cm") && ~contains(ylab,"cm^2") 
                                        ylabel(app.FitSeriesPlot,ylab + " cm");
                                    
                                    elseif contains(ylab,"cm^2")
                                        ylab = convertStringsToChars(ylab);
                                        ylab = ylab(1:end-2);
                                        ylab = convertCharsToStrings(ylab);
                                        ylabel(app.FitSeriesPlot,ylab);
                                    end
                            end
                            app.CumulativeCCTfitSeriesPlot = temp_y;

                        case 'Off'
                            ylab = app.FitSeriesPlot.YLabel;
                            ylab = ylab.String;
                            if contains(ylab,"cm^2")
                                ylab = convertStringsToChars(ylab);
                                ylab = ylab(1:end-5);
                                ylab = convertCharsToStrings(ylab);
                                 ylabel(app.FitSeriesPlot,ylab);
                            elseif contains(ylab,"cm")
                                ylab = convertStringsToChars(ylab);
                                ylab = ylab(1:end-3);
                                ylab = convertCharsToStrings(ylab);
                                 ylabel(app.FitSeriesPlot,ylab);
                            end

                    end
    
    
                    %% Plot
                    %display(app.CumulativeCCTfitSeriesPlot)
    
                    switch app.HoldPlotsSwitch_FitSeries.Value
                        case 'On'
                            cla(app.FitSeriesPlot)
                            hold(app.FitSeriesPlot, 'On');
                            plot(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomain , app.CumulativeCCTfitSeriesPlot , '*-','LineWidth',3)
    
                            switch (app.PlotMultiSeriesMeanSwitch.Value)
                                case 'On'
                                    lines = findobj(app.FitSeriesPlot,'Type','Line');
                                        for i = 1:numel(lines)
                                          lines(i).LineWidth = 1.0;
                                        end
            
                                        Mean = mean(app.CumulativeCCTfitSeriesPlot' );
                                        Std = std(app.CumulativeCCTfitSeriesPlot');
                                        errorbar(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomain(:,1), Mean,  Std,...
                                                                               "-s","MarkerSize",10,...
                                                                               "MarkerEdgeColor","blue",...
                                                                               "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                               'LineWidth',3);
                            end
                            
                        case 'Off'
                            hold(app.FitSeriesPlot, 'off');
                            plot(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomain(:,1) , app.CumulativeCCTfitSeriesPlot(:,1) , '*-','LineWidth',3)
    
                    end
    
                    grid(app.FitSeriesPlot, 'on')

                end
        end

        % Button pushed function: ImportDataButton
        function ImportDataButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.InportDataTab;
            
            flag = app.TutorialMode;
            if flag

                 msgbox('Enter Data Descriptiors (Time in Arb. Units) -> Select Find File to search for .txt (.csv) data file using explorer -> Select Load to Read data' ,...
                                            'Workflow');
            end
        end

        % Button pushed function: FitEquivalentCircuitButton
        function FitEquivalentCircuitButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisCCTFITTab;

        
                app.CircuitBuilderTable.Data = num2cell(app.cct_builder_init);
                app.CircuitBuilderTable_MaxVals.Data = num2cell(app.cct_builder_MaxVals_init);
           

            app.IncludeBarrierSwitch.Value = 'Off';

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                    TableSize = size(app.CircuitBuilderTable.Data);

                    s_empty = uistyle('BackgroundColor','white');
                    s_full = uistyle('BackgroundColor','green');
                    

                        for (i = 1:TableSize(1))
                            for (j = 1:TableSize(2))
                                  value = app.CircuitBuilderTable.Data(i,j);
                                  value = value{1};
            
                                  if value == ' '
                                      addStyle(app.CircuitBuilderTable,s_empty,'cell',[i,j]);
                                      addStyle(app.CircuitBuilderTable_MaxVals,s_empty,'cell',[i,j]);
                                  else
                                    addStyle(app.CircuitBuilderTable,s_full,'cell',[i,j]);
                                      addStyle(app.CircuitBuilderTable_MaxVals,s_full,'cell',[i,j]);
                                  end
            
            
                            end
                        end
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   if flag

                      msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for circuit fitting -> Choose circuit fitting parameters -> Select Go! to fit slected circuit to all chosen data.' ,...
                                            'Workflow');

                   end
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        end

        % Button pushed function: TimeSeriesMagnitudeCrossSectionButton
        function TimeSeriesMagnitudeCrossSectionButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisTimeSeriesMagnitudeCrossSectionTab;


            flag = app.TutorialMode;
                   if flag

                       msgbox('Refresh Data to load data options for selection -> Select Choose and Plot to define subset of the full dataset for analysis and plot the time series of the magnitude cross section -> Explore the spectrum by slecting different frequencies.' ,...
                                            'Workflow');
                   end

        end

        % Button pushed function: HOMEButton
        function HOMEButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Button pushed function: HOMEButton_2
        function HOMEButton_2Pushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Button pushed function: HOMEButton_3
        function HOMEButton_3Pushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Selection change function: CircuitToFit
        function CircuitToFitSelectionChanged(app, event)
            
            value = app.IncludeBarrierSwitch.Value;
            
            switch value
                case 'On'
                   
                    app.CircuitBuilderTable.Data(1,1) = {'R'};
                    app.CircuitBuilderTable.Data(3,1) = {'C'};
                    app.CircuitBuilderTable.Data(2,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {1000};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {1};
                    app.CircuitBuilderTable_MaxVals.Data(2,1) = {0};
                    
                case 'Off'
                    app.CircuitBuilderTable.Data(1,1) = {' '};
                    app.CircuitBuilderTable.Data(3,1) = {' '};
                    app.CircuitBuilderTable.Data(2,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(2,1) = {0};
            end

            selectedTab = app.CircuitToFit.SelectedTab;

            if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.BuildACircuitMaxValuesTab) || (selectedTab == app.WriteACircuitTab)
                app.FitSequentiallySwitch.Value = 'Off';
                app.FitSequentiallySwitch.Enable = 'off';
            else
                 app.FitSequentiallySwitch.Enable = 'on';
            end
    

            flag = app.TutorialMode;
                   if flag
                        if selectedTab == app.WriteACircuitTab

                            msgbox({'Write-A-Circuit allows you to enter an arbitrary circuit to fit (where the series resistance is included implicitly)',...
                                'The circuit format is as follows:',...
                                '-> Series Connection A--B = '' A + B''',...
                                '-> Parallel Connection (A//B) = '' p(A,B) '' ',...
                                '-> An Arbitrary Element A = Xn, where X is the symbol for that circuit element and n is the number of free parameters for an element of that type',...
                                '-> Available elements are:',...
                                '          --> R1 (Resistance)',...
                                '          --> C1 (Capacitance)',...
                                '          --> L1 (Inductance)',...
                                '          --> Q2 (Constant Phase Element)',...
                                '          --> W1 (Warburg Element)',...
                                'An example circuit is thus given by: R--(R//C)--((R--W)//Q) == R1+p(R1,C1)+p(R1+W1,Q2)',...
                                'The series resistance is included implicitly.',...
                                '',...
                                'Each free parameter must be assigned an absolute maximum value, in a comma separated list in the order that they appear in the circuit string.',...
                                '',...
                                'As an alternative to writing out the string, elements and parallel branches can be added by double clicking the appropriate entry in the list box alongside.',...
                                '',...
                                'To fit a measurement with a barrier, click the include barrier switch. A barrier modell will be automatically inserted. Note, when this switch is on, the app will expect the circuit string to have a leading p(R1,C1), which will be treated as the barrier.'},'Explainer')
            
                        end
                   end


            
        end

        % Cell edit callback: CircuitBuilderTable
        function CircuitBuilderTableCellEdit(app, event)
            indices = event.Indices;
            newData = event.NewData;
            
            TableSize = size(app.CircuitBuilderTable.Data);

            s_empty = uistyle('BackgroundColor','white');
            s_full = uistyle('BackgroundColor','green');
            

            for (i = 1:TableSize(1))
                for (j = 1:TableSize(2))
                    value = app.CircuitBuilderTable.Data(i,j);
                    value = value{1};
                    
                    if isempty(value)
                        app.CircuitBuilderTable.Data(i,j) = {' '};
                        app.CircuitBuilderTable_MaxVals.Data(i,j) = {0};

                                               
                    else
                        valueMax = app.CircuitBuilderTable_MaxVals.Data(i,j);
                        valueMax = valueMax{1};
                        if (valueMax == 0) && (value ~= ' ')
                            app.CircuitBuilderTable_MaxVals.Data(i,j) = {1};
                        end

                    end
                end
            end

            app.CircuitBuilderTable.Data(2,2) = {'R'};
                value = app.CircuitBuilderTable_MaxVals.Data(2,2);
                value = value{1};
            if ( value < 1)
                app.CircuitBuilderTable_MaxVals.Data(2,2) = {1000};
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            TableSize = size(app.CircuitBuilderTable.Data);

            s_empty = uistyle('BackgroundColor','white');
            s_full = uistyle('BackgroundColor','green');

            for (i = 1:TableSize(1))
                for (j = 1:TableSize(2))
                      value = app.CircuitBuilderTable.Data(i,j);
                      value = value{1};

                      if value == ' '
                          addStyle(app.CircuitBuilderTable,s_empty,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_empty,'cell',[i,j]);
                      else
                        addStyle(app.CircuitBuilderTable,s_full,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_full,'cell',[i,j]);
                      end


                end
            end



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            value = app.IncludeBarrierSwitch.Value;
            
            switch value
                case 'On'
                    
                    app.CircuitBuilderTable.Data(1,1) = {'R'};
                    app.CircuitBuilderTable.Data(3,1) = {'C'};
                    app.CircuitBuilderTable.Data(2,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {1000};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {1};
                    app.CircuitBuilderTable_MaxVals.Data(2,1) = {0};
                    
                case 'Off'
                    app.CircuitBuilderTable.Data(1,1) = {' '};
                    app.CircuitBuilderTable.Data(3,1) = {' '};
                    app.CircuitBuilderTable.Data(2,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(2,1) = {0};
            end

        end

        % Value changed function: IncludeBarrierSwitch
        function IncludeBarrierSwitchValueChanged(app, event)
            value = app.IncludeBarrierSwitch.Value;
            
            switch value
                case 'On'
                    
                    app.CircuitBuilderTable.Data(1,1) = {'R'};
                    app.CircuitBuilderTable.Data(3,1) = {'C'};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {1000};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {1};
                    
                case 'Off'
                    app.CircuitBuilderTable.Data(1,1) = {' '};
                    app.CircuitBuilderTable.Data(3,1) = {' '};

                    app.CircuitBuilderTable_MaxVals.Data(1,1) = {0};
                    app.CircuitBuilderTable_MaxVals.Data(3,1) = {0};
            end


            %%%%%%%%%%%%%%%%%%%

            value = app.FitBlankOnlyExcludeBarrierSwitch.Value;

            switch value
                case 'On'
                    app.FitSequentiallySwitch.Value = 'Off';
                    app.FitBlankOnlyExcludeBarrierSwitch.Value = 'Off';
                case 'Off'
                   
            end

             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             TableSize = size(app.CircuitBuilderTable.Data);

            s_empty = uistyle('BackgroundColor','white');
            s_full = uistyle('BackgroundColor','green');

            for (i = 1:TableSize(1))
                for (j = 1:TableSize(2))
                      value = app.CircuitBuilderTable.Data(i,j);
                      value = value{1};

                      if value == ' '
                          addStyle(app.CircuitBuilderTable,s_empty,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_empty,'cell',[i,j]);
                      else
                        addStyle(app.CircuitBuilderTable,s_full,'cell',[i,j]);
                          addStyle(app.CircuitBuilderTable_MaxVals,s_full,'cell',[i,j]);
                      end


                end
            end



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    
        end

        % Cell edit callback: CircuitBuilderTable_MaxVals
        function CircuitBuilderTable_MaxValsCellEdit(app, event)
            indices = event.Indices;
            newData = event.NewData;
            
                value = app.CircuitBuilderTable_MaxVals.Data(2,2);
                value = value{1};
            if ( value < 1)
                app.CircuitBuilderTable_MaxVals.Data(2,2) = {1000};
            end
        end

        % Button pushed function: LoadResultsButton
        function LoadResultsButtonPushed(app, event)
            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'Navigate to the .mat file containing the desired fitting results',...
                                'NOTE: Immediately after selecting the .mat file, you will be asked to select the corresponding .csv file.', ...
                                 'Please ensure that the selected pair of files correspond to the same result set.'},...
                                    'Loading a Fitting Result',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end


            [file,path] = uigetfile('AnalyZeResults*.mat','Select AnalyZe Results MAT file:');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);

               [file2,path2] = uigetfile(convertStringsToChars(string(path) + "\AnalyZeResults*.csv"),'Now Select AnalyZe Results CSV file:');

               if isequal(file2,0)
                   %disp('User selected Cancel')
               else
                   %disp(['User Selected ', fullfile(path2,file2)]);
                  
                   %%Read in .mat file
                    var = load(fullfile(path,file));
                    app.Fits = [app.Fits; var.SavedDataResults];

                   if isempty(strfind(file2,"wIC"))
                        %% Read in CSV file
                        %% Set up the Import Options and import the data
                        opts = delimitedTextImportOptions("NumVariables", 11);
                        
                        % Specify range and delimiter
                        opts.DataLines = [2, Inf];
                        opts.Delimiter = ",";
                        
                        % Specify column names and types
                        opts.VariableNames = ["circuit", "Condition", "exp", "cell", "Time", "Rb", "Cb", "DeviceCCTParams", "mse", "rmse", "nmse"];
                        opts.VariableTypes = ["char", "char", "double", "char", "double", "double", "double", "char", "double", "double", "double"];
                        
                        % Specify file level properties
                        opts.ExtraColumnsRule = "ignore";
                        opts.EmptyLineRule = "read";
                        
                        % Specify variable properties
                        opts = setvaropts(opts, "DeviceCCTParams", "WhitespaceRule", "preserve");
                        opts = setvaropts(opts, ["circuit", "Condition", "DeviceCCTParams"], "EmptyFieldRule", "auto");
                        %opts = setvaropts(opts, "cell", "TrimNonNumeric", true);
                        %opts = setvaropts(opts, "cell", "ThousandsSeparator", ",");
                        
                        % Import the data
                        AnalyZeResultsCSVTable = readtable(fullfile(path2,file2), opts);
                        
                        
                        %% Clear temporary variables
                        clear opts
    
                        %%Add data back into table
    
                        for (j = 1:length(AnalyZeResultsCSVTable.circuit))
    
                                newData = {cell2mat(AnalyZeResultsCSVTable.circuit(j)) ...
                                    cell2mat(AnalyZeResultsCSVTable.Condition(j)) ...
                                    AnalyZeResultsCSVTable.exp(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.cell(j)) ...
                                    AnalyZeResultsCSVTable.Time(j) ...
                                    AnalyZeResultsCSVTable.Rb(j) ...
                                    AnalyZeResultsCSVTable.Cb(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.DeviceCCTParams(j)) ...
                                    AnalyZeResultsCSVTable.mse(j) ...
                                    AnalyZeResultsCSVTable.rmse(j) ...
                                    AnalyZeResultsCSVTable.nmse(j) ...
                                    NaN ...
                                    NaN...
                                    };
                                
                                %display(newData)
    
                                if isempty(app.ResultsTable.Data)
                                    app.ResultsTable.Data = newData;
                                else
                                    DataToAddToTable = [app.ResultsTable.Data; newData];
                                    app.ResultsTable.Data = DataToAddToTable;
                                end
  
                        end

                   else

                       %% Read in CSV file
                        %% Set up the Import Options and import the data
                        opts = delimitedTextImportOptions("NumVariables", 13);
                        
                        % Specify range and delimiter
                        opts.DataLines = [2, Inf];
                        opts.Delimiter = ",";
                        
                        % Specify column names and types
                        opts.VariableNames = ["circuit", "Condition", "exp", "cell", "Time", "Rb", "Cb", "DeviceCCTParams", "mse", "rmse", "nmse", "aic", "bic"];
                        opts.VariableTypes = ["char", "char", "double", "char", "double", "double", "double", "char", "double", "double", "double", "double", "double"];
                        
                        % Specify file level properties
                        opts.ExtraColumnsRule = "ignore";
                        opts.EmptyLineRule = "read";
                        
                        % Specify variable properties
                        opts = setvaropts(opts, "DeviceCCTParams", "WhitespaceRule", "preserve");
                        opts = setvaropts(opts, ["circuit", "Condition", "DeviceCCTParams"], "EmptyFieldRule", "auto");
                        %opts = setvaropts(opts, "cell", "TrimNonNumeric", true);
                        %opts = setvaropts(opts, "cell", "ThousandsSeparator", ",");
                        
                        % Import the data
                        AnalyZeResultsCSVTable = readtable(fullfile(path2,file2), opts);
                        
                        
                        %% Clear temporary variables
                        clear opts
    
                        %%Add data back into table
    
                        for (j = 1:length(AnalyZeResultsCSVTable.circuit))
    
                                newData = {cell2mat(AnalyZeResultsCSVTable.circuit(j)) ...
                                    cell2mat(AnalyZeResultsCSVTable.Condition(j)) ...
                                    AnalyZeResultsCSVTable.exp(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.cell(j)) ...
                                    AnalyZeResultsCSVTable.Time(j) ...
                                    AnalyZeResultsCSVTable.Rb(j) ...
                                    AnalyZeResultsCSVTable.Cb(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.DeviceCCTParams(j)) ...
                                    AnalyZeResultsCSVTable.mse(j) ...
                                    AnalyZeResultsCSVTable.rmse(j) ...
                                    AnalyZeResultsCSVTable.nmse(j) ...
                                    AnalyZeResultsCSVTable.aic(j) ...
                                    AnalyZeResultsCSVTable.bic(j)...
                                    };
                                
                                %display(newData)
    
                                if isempty(app.ResultsTable.Data)
                                    app.ResultsTable.Data = newData;
                                else
                                    DataToAddToTable = [app.ResultsTable.Data; newData];
                                    app.ResultsTable.Data = DataToAddToTable;
                                end
                               
                            
                        end

                   end


               end

              
            end
            

        
        end

        % Button pushed function: CLEARDATAButton
        function CLEARDATAButtonPushed(app, event)
            
             answer = 'Continue';

               answer = questdlg('Are you sure that you want to delete all loaded data from the App (saved files are unaffected)?',...
                                    'Clear Data',...
                                   'Continue','Cancel','Continue');
               switch answer
                   case 'Cancel'
                       return
               end
            
            app.Data = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
            app.UITable.Data = [];
            
            yyaxis(app.LoadEISDat, 'right')
            cla(app.LoadEISDat)
            yyaxis(app.LoadEISDat, 'left')
            cla(app.LoadEISDat)
           

             f = msgbox("Data Cleared!");
        end

        % Button pushed function: CLEARLASTDATAPOINTButton
        function CLEARLASTDATAPOINTButtonPushed(app, event)
            
               if (length(app.Data)>1)
                   app.Data = app.Data(1:end-1);
                   app.UITable.Data = app.UITable.Data(1:end-1);
                   app.UITable.Data = [];
                   for (i = 1:length(app.Data))
                        
                        Data_i = app.Data(i);

                        newData = {Data_i.Name ...
                            Data_i.ExperimentNumber ...
                            Data_i.Well ...
                            Data_i.Time...
                            };
                        app.UITable.Data = [app.UITable.Data; newData];
                   
                   end
                   
                   f = msgbox("Data entry purged :)");


               else
                   app.Data = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                   app.UITable.Data = [];

                   f = msgbox("All Data purged :)");
               end

               
      
        end

        % Button pushed function: PlotSelectedButton
        function PlotSelectedButtonPushed(app, event)
            SelectedData = app.Data(app.DataTableRowSelected);
           
            %% Plot
                EISDat = SelectedData.Data;
                Freq = EISDat.FrequencyHz;
                Mod = EISDat.Z2;
                Arg = EISDat.Phase;

                switch app.HoldPlotSwitchLoad.Value
                        case 'On'
                            hold(app.LoadEISDat, 'on');

                        case 'Off'
                            hold(app.LoadEISDat, 'off');
                            cla(app.LoadEISDat)
                    end
                
                yyaxis(app.LoadEISDat, 'left')
                plot(app.LoadEISDat, Freq, Mod,'LineWidth',3)
                set(app.LoadEISDat,'YScale','log')
                set(app.LoadEISDat,'XScale','log')
                hold(app.LoadEISDat, 'on')
                     yyaxis(app.LoadEISDat, 'right')
                     plot(app.LoadEISDat, Freq, Arg,'LineWidth',3)
                     set(app.LoadEISDat,'YScale','linear')
                hold(app.LoadEISDat, 'on')
        end

        % Cell selection callback: UITable
        function UITableCellSelection(app, event)
            indices = event.Indices;
                        
            if (length(indices) >= 1)
                %display(indices)
                app.DataTableRowSelected = indices(1);
                app.DataTableRowSelected = indices;
            end
        end

        % Button pushed function: PlotResultsSelectionButton
        function PlotResultsSelectionButtonPushed(app, event)
              
           answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg('Select any cell in the results table - the result associated with that row will be plotted.',...
                                    'Plot a Fitting Result',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end
           
            
            
              ind = app.ResultTableCellsSelected;
               ind = ind(1);

               try 
                   Fit_to_plot = app.Fits(ind);
               catch
                   msgbox('Select a cell in the results table to plot the result associated with that row.')
                   error('No result selected.')
               end

               Fit_to_plot = app.Fits(ind);
               Results = Fit_to_plot.FitsResults;
               Dat_EIS = Fit_to_plot.RawData;
               Dat_EIS_yz = Dat_EIS(:,1);

                  %assignin('base','Fit_i',Fit_to_plot);

                    Results_yz = Results{4};
                    Mod_Results = abs(Results_yz);
                    Arg_Results = -1.*angle(Results_yz)*(180/pi);
                    
                    Mod = abs(Dat_EIS_yz);
                    Arg = -1.*angle(Dat_EIS_yz)*(180/pi);

                    switch app.HoldPlotsSwitch.Value
                        case 'On'
                            hold(app.BodeResults, 'on');

                            hold(app.NyqResults,'on' );
                        case 'Off'
                             yyaxis(app.BodeResults, 'right')
                            hold(app.BodeResults, 'off');
                            cla(app.BodeResults)
                             yyaxis(app.BodeResults, 'left')
                            hold(app.BodeResults, 'off');
                            cla(app.BodeResults)

                            hold(app.NyqResults,'off' );
                            cla(app.NyqResults)
                    end
                          
                    if length(Dat_EIS(1,:)) > 1

                        freq = Dat_EIS(:,2);
                    
                        yyaxis(app.BodeResults, 'left')
                        plot(app.BodeResults,freq, Mod, '*r','LineWidth',1)
                        set(app.BodeResults,'YScale','log')
                        set(app.BodeResults,'XScale','log')
                        xlabel(app.BodeResults,'Frequency (Hz)');
                        ylabel(app.BodeResults,'Magnitude, |Z|, (\Omega )');
                        hold(app.BodeResults, 'on')
                            plot(app.BodeResults,freq, Mod_Results, '-r','LineWidth',1)
    
                             yyaxis(app.BodeResults, 'right')
                               ylabel(app.BodeResults,'-Phase, \angle Z (deg)');
                             plot(app.BodeResults,freq, Arg, '*g','LineWidth',1)
                             plot(app.BodeResults,freq, Arg_Results, '-g','LineWidth',1)
                             set(app.BodeResults,'YScale','linear')
                        hold(app.BodeResults, 'off')
                    end
                    
       
                    plot(app.NyqResults , real(Dat_EIS_yz), -1.*imag(Dat_EIS_yz), '*r','LineWidth',1)
                    hold(app.NyqResults, 'on')
                        plot(app.NyqResults , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                    hold(app.NyqResults, 'off')
                    xlabel(app.NyqResults,'Real(Z)');
                    ylabel( app.NyqResults, '-Imag(Z)');

                    drawnow()


               
        end

        % Button pushed function: RefreshDataOptionsButton_3
        function RefreshDataOptionsButton_3Pushed(app, event)
             Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = "Select All";
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i+1) = Dat(i).Time;
                end
                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = unique(Time);

                app.ConditionListBox_3.Items = Conditions;
                app.ExperimentNumberListBox_3.Items = Exp;
                app.WellNumberListBox_3.Items = Well;
                app.TimeListBox_2.Items = Time;
        end

        % Button pushed function: ChooseButton_2
        function ChooseButton_2Pushed(app, event)
            Condition = app.ConditionListBox_3.Value;
            Well = app.WellNumberListBox_3.Value;
            Exp = app.ExperimentNumberListBox_3.Value;
            Time = app.TimeListBox_2.Value;

            Dat = app.Data;

                ConditionsAll = "";
                ExpAll = "";
                WellAll = "";
                TimeAll = "";
                for (i=1:length(Dat))
                    ConditionsAll(i) = Dat(i).Name;
                    ExpAll(i) = Dat(i).ExperimentNumber;
                    WellAll(i) = Dat(i).Well;
                    TimeAll(i) = Dat(i).Time;
                end
                
               Indexes = [];
               switch Condition
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ConditionsAll == Condition);
               end
                 Dat = Dat(Indexes);
                 ExpAll = ExpAll(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);


             Indexes = [];
               switch Exp
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(ExpAll == Exp);
               end
                 Dat = Dat(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Well
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(WellAll == Well);
               end
                 Dat = Dat(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Time
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = find(TimeAll == Time);
               end
                Dat = Dat(Indexes);

             app.ChosenDataTable_3.Data = [];
            for (i = 1:length(Dat))
                var = Dat;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable_3.Data = [app.ChosenDataTable_3.Data; newData];
            end

           app.DatToFit_TFest = Dat;
        end

        % Button pushed function: GoButton_2
        function GoButton_2Pushed(app, event)
             %% Assemble Parameters
                Dat_full = app.DatToFit_TFest;
    
                NumDays = length(Dat_full);
              
                app.ProgressGuage_2.Value = 0;
                app.ProgressGuage_2.Limits = [0,NumDays];

                Options = tfestOptions;                   
                Options.InitialCondition = 'zero';        
                Options.EnforceStability = false; 
                Options.display = 'off';
                
                
                Options.SearchMethod = string(app.SearchMethodListBox.Value);
                Options.SearchOptions.MaxIterations = app.MaxiterationsEditField.Value;
                Weighting = string(app.WeightingFilterListBox.Value);
                if Weighting == "None"
                    Weighting = [];
                end
                Options.WeightingFilter = Weighting;

                NumPoles = app.SystemOrderNumberofPolesSpinner.Value;
                NumZeros = app.NumberofZerosSpinner.Value;
                
                FreeZeros = false;
                switch (app.AutoNumberofZerosSwitch.Value)
                    case 'On'
                        FreeZeros = true;
                    case 'Off'
                        FreeZeros = false;
                end


                %% System Identification

                    app.RunningLamp_2.Color = 'green';
                    drawnow()
        
                    Fits_local = [];
                    for (i = 1:NumDays)
    
                        app.ProgressGuage_2.Value = i;
    
                        Dat_i = Dat_full(i);
                        Dat_i_EIS = Dat_i.Data;
                        y_z_i = Dat_i_EIS.Z - 1j*Dat_i_EIS.Z1;
                        freq_i = Dat_i_EIS.FrequencyHz;
    
                        FRD_i = frd(y_z_i,2*pi.*freq_i, 'FrequencyUnit', 'rad/s');
    
                        if FreeZeros
                            SysIDresult_i = tfest( FRD_i, NumPoles, Options);
                        else
                            SysIDresult_i = tfest( FRD_i, NumPoles,NumZeros, Options);
                        end
                        
    
                        %Store Result
    
                            app.Fits_TFest(end+1) = struct('Name', {Dat_i.Name},...
                                  'Time', {Dat_i.Time},...
                                  'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                  'Well', {Dat_i.Well} ,...
                                  'FitsResults', (SysIDresult_i),...
                                  'RawData', [y_z_i freq_i],...
                                  'FitOpts', {Options}...
                                  );
    
                        %Plot Result

                        [mag,phase,wout,sdmag,sdphase] = bode(SysIDresult_i,freq_i*(2*pi)); 
                        Mod_Results = squeeze(mag);
                        sdmag = squeeze(sdmag);
                        Arg_Results = -1.*squeeze(phase);
                        sdphase = squeeze(sdphase);

                        [x,y] = pol2cart(-1.*Arg_Results.*(pi/180),Mod_Results);
                        Results_yz = complex(x,y);
                        
                        Freq = Dat_i_EIS.FrequencyHz;
                        Mod = Dat_i_EIS.Z2;
                        Arg = Dat_i_EIS.Phase;
    
                        switch app.HoldPlotsSwitch_3.Value
                            case 'On'
                                hold(app.BodeResults_2, 'on');
    
                                hold(app.NyqResults_2,'on' );

                                hold(app.PoleZeroResults,'on');
                            case 'Off'
                                yyaxis(app.BodeResults_2, 'right')
                                hold(app.BodeResults_2, 'off');
                                cla(app.BodeResults_2)
                                 yyaxis(app.BodeResults_2, 'left')
                                hold(app.BodeResults_2, 'off');
                                cla(app.BodeResults_2)
    
                                hold(app.NyqResults_2,'off' );
                                cla(app.NyqResults_2)


                                hold(app.PoleZeroResults,'off');
                                cla(app.PoleZeroResults)
                        end
                       
                        yyaxis(app.BodeResults_2, 'left')
                        plot(app.BodeResults_2, Freq, Mod, '*r','LineWidth',1)
                        set(app.BodeResults_2,'YScale','log')
                        set(app.BodeResults_2,'XScale','log')
                        xlabel(app.BodeResults_2,'Frequency (Hz)');
                        ylabel(app.BodeResults_2,'Magnitude, |Z|, (\Omega )');
                        hold(app.BodeResults_2, 'on')
                            plot(app.BodeResults_2, wout./(2*pi), Mod_Results, '-r',...
                                wout./(2*pi),Mod_Results+3*sdmag,'k:',wout./(2*pi),Mod_Results-3*sdmag,'k:',...
                                'LineWidth',1);
    
                             yyaxis(app.BodeResults_2, 'right')
                               ylabel(app.BodeResults_2,'-Phase, \angle Z (deg)');
                             plot(app.BodeResults_2, Freq, Arg, '*g','LineWidth',1)
                             plot(app.BodeResults_2, wout./(2*pi), Arg_Results, '-g',...
                                 wout./(2*pi),Arg_Results+3*sdphase,'k:',wout./(2*pi),Arg_Results-3*sdphase,'k:',...
                                 'LineWidth',1)
                             set(app.BodeResults_2,'YScale','linear')
                             set(app.BodeResults_2,'XScale','log')
                        hold(app.BodeResults_2, 'off')
                        
           
                        plot(app.NyqResults_2 , Dat_i_EIS.Z, Dat_i_EIS.Z1, '*r','LineWidth',1)
                        hold(app.NyqResults_2, 'on')
                            plot(app.NyqResults_2 , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                        hold(app.NyqResults_2, 'off')
                        xlabel(app.NyqResults_2,'Real(Z)');
                        ylabel( app.NyqResults_2, '-Imag(Z)');


                        pzplot(app.PoleZeroResults, SysIDresult_i ) 
%                        plot(app.PoleZeroResults , Dat_i_EIS.Z, Dat_i_EIS.Z1, '*r','LineWidth',1)
                        grid(app.PoleZeroResults,'on')
                        a = findobj(app.PoleZeroResults,'type','line');
                        for j = 1:length(a)
                            set(a(j),'markersize',10) %change marker size
                            set(a(j), 'linewidth',2)  %change linewidth
                        end
    
                        drawnow()
    
    
                        %Add Table entry
    
                            GoF_i(1) = SysIDresult_i.Report.Fit.FitPercent;
                            GoF_i(2) = SysIDresult_i.Report.Fit.MSE;
                            GoF_i(3) = SysIDresult_i.Report.Fit.AIC;
                            GoF_i(4) = SysIDresult_i.Report.Fit.BIC;
                            Numerator_i = SysIDresult_i.Numerator;
                            Denominator_i = SysIDresult_i.Denominator;
                            Poles_i = pole(SysIDresult_i);
                            Zeros_i = pole(SysIDresult_i);
                            FastestPole_i = sort(pole(SysIDresult_i));
                            FastestPole_i = FastestPole_i(1);
                            FastestPoleReal_i = real(FastestPole_i);
                            FastestTimeConstant_i = abs(1./real(FastestPole_i));

                                                                 
                         newData = {NumPoles ...
                             Dat_i.Name ...
                             Dat_i.ExperimentNumber ...
                             Dat_i.Well ...
                             Dat_i.Time ...
                             FastestPole_i ...
                             FastestPoleReal_i ...
                             FastestTimeConstant_i ...
                             mat2str(Poles_i,4) ...
                             mat2str(Zeros_i,4) ...
                             mat2str(Numerator_i,4) ...
                             mat2str(Denominator_i,4) ...
                             GoF_i(1) ...
                             GoF_i(2) ...
                             GoF_i(3) ...
                             GoF_i(4)...
                             };
                                        
                         DataToAddToTable = [app.ResultsTable_3.Data; newData];
                         app.ResultsTable_3.Data = DataToAddToTable;

                    end
    
                    app.RunningLamp_2.Color = 'red';
                    drawnow()

                

                
        end

        % Button pushed function: PlotResultsSelectionButton_2
        function PlotResultsSelectionButton_2Pushed(app, event)
               answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Select a single cell from the results table to plot the fitting result' ,...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end
            
            
               ind = app.ResultTable_SysID_RowSelected;
               ind = ind(1);

               try 
                   Fit_to_plot = app.Fits_TFest(ind);
               catch
                   msgbox('Select a cell in the results table to plot the result associated with that row.')
                   error('No result selected.')
               end

               Fit_to_plot = app.Fits_TFest(ind);
               SysIDresult_i = Fit_to_plot.FitsResults;
               Dat_EIS = Fit_to_plot.RawData;
                Dat_EIS_yz = Dat_EIS(:,1);
               freq_i = Dat_EIS(:,2);

                    %%Plot 
                        [mag,phase,wout,sdmag,sdphase] = bode(SysIDresult_i,freq_i*(2*pi)); 
                        Mod_Results = squeeze(mag);
                        sdmag = squeeze(sdmag);
                        Arg_Results = -1.*squeeze(phase);
                        sdphase = squeeze(sdphase);

                        [x,y] = pol2cart(-1.*Arg_Results.*(pi/180),Mod_Results);
                        Results_yz = complex(x,y);
                        
                        Freq = freq_i;
                        Mod = abs(Dat_EIS_yz);
                        Arg = -1*(180/pi).*angle(Dat_EIS_yz);
    
                        switch app.HoldPlotsSwitch_3.Value
                            case 'On'
                                hold(app.BodeResults_2, 'on');
    
                                hold(app.NyqResults_2,'on' );

                                hold(app.PoleZeroResults,'on');
                            case 'Off'
                                yyaxis(app.BodeResults_2, 'right')
                                hold(app.BodeResults_2, 'off');
                                cla(app.BodeResults_2)
                                 yyaxis(app.BodeResults_2, 'left')
                                hold(app.BodeResults_2, 'off');
                                cla(app.BodeResults_2)
    
                                hold(app.NyqResults_2,'off' );
                                cla(app.NyqResults_2)


                                hold(app.PoleZeroResults,'off');
                                cla(app.PoleZeroResults)
                        end
                       
                        yyaxis(app.BodeResults_2, 'left')
                        plot(app.BodeResults_2, Freq, Mod, '*r','LineWidth',1)
                        set(app.BodeResults_2,'YScale','log')
                        set(app.BodeResults_2,'XScale','log')
                        xlabel(app.BodeResults_2,'Frequency (Hz)');
                        ylabel(app.BodeResults_2,'Magnitude, |Z|, (\Omega )');
                        hold(app.BodeResults_2, 'on')
                            plot(app.BodeResults_2, wout./(2*pi), Mod_Results, '-r',...
                                wout./(2*pi),Mod_Results+3*sdmag,'k:',wout./(2*pi),Mod_Results-3*sdmag,'k:',...
                                'LineWidth',1);
    
                             yyaxis(app.BodeResults_2, 'right')
                               ylabel(app.BodeResults_2,'-Phase, \angle Z (deg)');
                             plot(app.BodeResults_2, Freq, Arg, '*g','LineWidth',1)
                             plot(app.BodeResults_2, wout./(2*pi), Arg_Results, '-g',...
                                 wout./(2*pi),Arg_Results+3*sdphase,'k:',wout./(2*pi),Arg_Results-3*sdphase,'k:',...
                                 'LineWidth',1)
                             set(app.BodeResults_2,'YScale','linear')
                        hold(app.BodeResults_2, 'off')
                        
           
                        plot(app.NyqResults_2 , real(Dat_EIS_yz), -1.*imag(Dat_EIS_yz), '*r','LineWidth',1)
                        hold(app.NyqResults_2, 'on')
                            plot(app.NyqResults_2 , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                        hold(app.NyqResults_2, 'off')
                        xlabel(app.NyqResults_2,'Real(Z)');
                        ylabel( app.NyqResults_2, '-Imag(Z)');


                        pzplot(app.PoleZeroResults, SysIDresult_i ) 
                        grid(app.PoleZeroResults,'on')
                        a = findobj(app.PoleZeroResults,'type','line');
                        for j = 1:length(a)
                            set(a(j),'markersize',10) %change marker size
                            set(a(j), 'linewidth',2)  %change linewidth
                        end
    


        end

        % Cell selection callback: ResultsTable_3
        function ResultsTable_3CellSelection(app, event)
            indices = event.Indices;
                                    
            if (length(indices) >= 1)
                %display(indices)
                app.ResultTable_SysID_RowSelected = indices(1);
                app.ResultTable_SysID_CellsSelected = indices;
            end
        end

        % Button pushed function: PlotFromTableSelectionButton_2
        function PlotFromTableSelectionButton_2Pushed(app, event)
            
            answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Highlight a series of cells in a column of the results table to plot (or two series in different columns to plot against each other). Select Hold Plots to overlay plots - with each plot command the currently selected series will be added to the mean. Select a single cell to continue to replot the currently overlayed series (with different plot options) without adding additional data.' ,...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end
            
            ind = app.ResultTable_SysID_CellsSelected;

            switch app.EnablePolePlottingvsTimeSwitch.Value
                case 'Off'
                    PolePlottingActive = false;
                case 'On'
                    PolePlottingActive = true;
            end
                
                
                if length(ind(:,1)) >= 2

                    
                    T_c =  app.ResultsTable_3.Data;
                
                    T = cell2table(T_c, 'VariableNames',...
                       {'NumPoles','Condition','exp','cell','Time',...
                      'FastestPole','ReFastestPole','FastestTau','Poles','Zeros','Numerator',...
                      'Denom','FitPercent','MSE','AIC','BIC'});
    
                    Names = app.ResultsTable_3.ColumnName;
                    columns = unique(ind(:,2));
    
                    x = [];
                    y = [];
                    
                    switch app.EnablePolePlottingvsTimeSwitch.Value
                        case 'Off'
                            PolePlottingActive = false;

                            if length(columns) >=2 
                                var1 = string(Names(columns(1)));
                                var2 = string(Names(columns(2)));
                
                                xlabel(app.FitSeriesPlot_2,var1);
                                ylabel(app.FitSeriesPlot_2,var2);
                                
                                DatToPlot = table2array(T(unique(ind(:,1)),[var1, var2])) ;
                                x = DatToPlot(:,1);
                                y = DatToPlot(:,2);
                            else
                                var1 = string(Names(columns(1)));
                                    
                                xlabel(app.FitSeriesPlot_2,"Indexes");
                                ylabel(app.FitSeriesPlot_2,var1);
                                
                                DatToPlot = table2array(T(ind(:,1),var1)) ;
                                
                                y = DatToPlot(:,1);
                                x = 1:length(y);
                                x = x';
                            end

                        case 'On'
                            PolePlottingActive = true;
                            PoleNumToPlot = app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Value;
                            Time_toPlot = table2array(T(unique(ind(:,1)),"Time")) ;
                            poles_toPlot = table2array(T(unique(ind(:,1)),"Poles")) ;

                            y = [];
                            for j = 1:length(Time_toPlot)
                                pole_str = poles_toPlot(j);  
                                pole_num = str2num(pole_str{1}); 
                                pole_num = sort(pole_num); 
                                y(:,j) = pole_num; 
                                
                            end
                            x = Time_toPlot;
                            y = y';
                            
                    end
    
                    switch app.FlipAxesSwitch_2.Value
                        case 'On'
                            temp = y;
                            y = x;
                            x = temp;
    
                            xlab = app.FitSeriesPlot_2.XLabel;
                            xlab = xlab.String;
                            ylab = app.FitSeriesPlot_2.YLabel;
                            ylab = ylab.String;
                            xlabel(app.FitSeriesPlot_2, ylab);
                            ylabel(app.FitSeriesPlot_2, xlab);
                    end
    
                    switch app.HoldPlotsSwitch_FitSeries_2.Value
    
                        case 'On'
                            %hold(app.FitSeriesPlot, 'on');
                            if ~PolePlottingActive
                                app.CumulativeSysIDSeriesPlotRaw = [app.CumulativeSysIDSeriesPlotRaw y];
                            else
                               app.CumulativeSysIDSeriesPlotRaw = cat(3,app.CumulativeSysIDSeriesPlotRaw,y);
                            end
                            app.CumulativeSysIDSeriesDomain = [app.CumulativeSysIDSeriesDomain x];
                            
                        case 'Off'
                            %hold(app.FitSeriesPlot, 'off');
                            app.CumulativeSysIDSeriesPlotRaw = y;
                            app.CumulativeSysIDSeriesDomain = x;
    
                    end

                end
                
                app.CumulativeSysIDSeriesPlot = app.CumulativeSysIDSeriesPlotRaw;
                

                if PolePlottingActive
                    temp_dat = app.CumulativeSysIDSeriesPlot ;
                    NumPlots = length(temp_dat(1,1,:));
                    trimmed_dat = [];
                    PoleNumToPlot = app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Value;
                    
                    for j = 1:NumPlots
                        
                        plot_j = temp_dat(:,:,j);
                        NumPoles = length(plot_j(1,:));
                        if PoleNumToPlot > NumPoles
                            PoleNumToPlot   = NumPoles;
                        end
                        trimmed_dat = [trimmed_dat plot_j(:,PoleNumToPlot)];

                    end
                    
                    

                    app.CumulativeSysIDSeriesPlot = trimmed_dat;

                end
                

                if length(app.CumulativeSysIDSeriesPlot(:,1)) >= 2

                     switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                        case 'On'
                          Scheme = string(app.NormalizationSchemeListBox_4.Value);
                            
                          if ~PolePlottingActive
                              temp_y = app.CumulativeSysIDSeriesPlot;
                              for i =1:length(temp_y(1,:))
                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                              end
                              app.CumulativeSysIDSeriesPlot = temp_y;
                          end
    
                           
    
                        case 'Off'
                    end
     
    
                    %% Plot
                    %display(app.CumulativeCCTfitSeriesPlot)
    
                    switch app.HoldPlotsSwitch_FitSeries_2.Value
                        case 'On'
                            cla(app.FitSeriesPlot_2)
                            hold(app.FitSeriesPlot_2, 'On');
                            if ~PolePlottingActive
                                plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain , app.CumulativeSysIDSeriesPlot , '*-','LineWidth',3)
                            else
                                switch app.PlotTypeListBox.Value
                                    case 'Mag Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot;
                                        plot_dat = abs(pole_yz);
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Abs(pole)')
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                    case 'Nyquist'
                                        pole_yz = app.CumulativeSysIDSeriesPlot;
                                        pole_x = real(pole_yz);
                                        pole_y = imag(pole_yz);
                                        pole_yz = app.CumulativeSysIDSeriesPlot;
                                        plot_dat_x = pole_x;
                                        plot_dat_y = pole_y;
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_x = plot_dat_x;
                                                  temp_y = plot_dat_y;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                        temp_x(:,i) = normalize(temp_x(:,i),Scheme);
                                                  end
                                                  plot_dat_x = temp_x;
                                                  plot_dat_y = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, plot_dat_x , plot_dat_y , '*-','LineWidth',3)
%                                         dx = gradient(pole_x) ;
%                                         dy = gradient(pole_y) ;
%                                         quiver(app.FitSeriesPlot_2,pole_x(1:3:end),pole_y(1:3:end),dx(1:3:end),dy(1:3:end),0.2,'LineWidth',1)
                                        xlabel(app.FitSeriesPlot_2,'Re(pole)')
                                        ylabel(app.FitSeriesPlot_2,'Im(pole)')
%                            
%                                     case 'Polar'
%                                         pole_yz = app.CumulativeSysIDSeriesPlot;
%                                         pole_theta = abs(pole_yz);
%                                         pole_rho = angle(pole_yz);
%                                         polarplot(app.FitSeriesPlot_2,pole_theta,pole_rho,'*-','LineWidth',3)
                                    case 'Tau Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot;
                                        plot_dat = -1./(real(pole_yz));
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Time Constant (s)')
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                    case 'Real Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot;
                                        plot_dat = real(pole_yz);
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Re(Pole)')                                   
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                end

                            end
    
                            switch (app.PlotMultiSeriesMeanSwitch_2.Value)
                                case 'On'
                                    lines = findobj(app.FitSeriesPlot_2,'Type','Line');
                                        for i = 1:numel(lines)
                                          lines(i).LineWidth = 1.0;
                                        end
            
                                        Mean = mean(app.CumulativeSysIDSeriesPlot' );
                                        Std = std(app.CumulativeSysIDSeriesPlot');

                                        if ~PolePlottingActive
                                            errorbar(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1), Mean,  Std,...
                                                                                   "-s","MarkerSize",10,...
                                                                                   "MarkerEdgeColor","blue",...
                                                                                   "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                   'LineWidth',3);
                                        else
                                            
                                            switch app.PlotTypeListBox.Value
                                                case 'Mag Time Series'
                                                    pole_yz = app.CumulativeSysIDSeriesPlot;
                                                    plot_dat = abs(pole_yz);
                                                    switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                                        case 'On'
                                                          Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                              end
                                                              plot_dat = temp_y;
                                                    end

                                                    errorbar(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1), mean(plot_dat'),  std(plot_dat'),...
                                                                                   "-s","MarkerSize",10,...
                                                                                   "MarkerEdgeColor","blue",...
                                                                                   "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                   'LineWidth',3);
                                       
                                                case 'Nyquist'
                                                    pole_yz = app.CumulativeSysIDSeriesPlot;
                                                    pole_x = real(pole_yz);
                                                    pole_y = imag(pole_yz);
                                                    plot_dat_x = pole_x;
                                                    plot_dat_y = pole_y;
                                                    switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                                        case 'On'
                                                          Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                              temp_x = plot_dat_x;
                                                              temp_y = plot_dat_y;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                                    temp_x(:,i) = normalize(temp_x(:,i),Scheme);
                                                              end
                                                              plot_dat_x = temp_x;
                                                              plot_dat_y = temp_y;
                                                    end
                                                    plot(app.FitSeriesPlot_2, mean(plot_dat_x') , mean(plot_dat_y') , ...
                                                                                    "-s","MarkerSize",10,...
                                                                                   "MarkerEdgeColor","blue",...
                                                                                   "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                   'LineWidth',3);
                                                                                              
%                                                 case 'Polar'
%                                                     pole_yz = mean;
%                                                     pole_theta = abs(pole_yz);
%                                                     pole_rho = angle(pole_yz);
%                                                     polarplot(app.FitSeriesPlot_2,pole_theta,pole_rho,...
%                                                                                    "-s","MarkerSize",10,...
%                                                                                    "MarkerEdgeColor","blue",...
%                                                                                    "MarkerFaceColor",[0.65 0.85 0.90],...
%                                                                                    'LineWidth',3);
                                                case 'Tau Time Series'
                                                    pole_yz = app.CumulativeSysIDSeriesPlot;
                                                    plot_dat = -1./(real(pole_yz));
                                                    switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                                        case 'On'
                                                          Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                              end
                                                              plot_dat = temp_y;
                                                    end
                                                    errorbar(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1), mean(plot_dat'),  std(plot_dat'),...
                                                                                   "-s","MarkerSize",10,...
                                                                                   "MarkerEdgeColor","blue",...
                                                                                   "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                   'LineWidth',3);
                                                case 'Real Time Series'
                                                    pole_yz = app.CumulativeSysIDSeriesPlot;
                                                    plot_dat = (real(pole_yz));
                                                    switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                                        case 'On'
                                                          Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                              end
                                                              plot_dat = temp_y;
                                                    end
                                                    errorbar(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1), mean(plot_dat'),  std(plot_dat'),...
                                                                                   "-s","MarkerSize",10,...
                                                                                   "MarkerEdgeColor","blue",...
                                                                                   "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                                   'LineWidth',3);
                                            end
                                        end

                                        
                            end
                            
                        case 'Off'
                            hold(app.FitSeriesPlot_2, 'off');
                            if ~PolePlottingActive
                                plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1) , app.CumulativeSysIDSeriesPlot(:,1) , '*-','LineWidth',3)
                            else
                                switch app.PlotTypeListBox.Value
                                    case 'Mag Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot(:,1);
                                        plot_dat = abs(pole_yz);
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1) , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Abs(pole)')
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                    case 'Nyquist'
                                        pole_yz = app.CumulativeSysIDSeriesPlot(:,1);
                                        pole_x = real(pole_yz);
                                        pole_y = imag(pole_yz);
                                        plot_dat_x = pole_x;
                                        plot_dat_y = pole_y;
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_x = plot_dat_x;
                                                  temp_y = plot_dat_y;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                        temp_x(:,i) = normalize(temp_x(:,i),Scheme);
                                                  end
                                                  plot_dat_x = temp_x;
                                                  plot_dat_y = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, plot_dat_x , plot_dat_y , '*-','LineWidth',3)

%                                         dx = gradient(pole_x) ;
%                                         dy = gradient(pole_y) ;
%                                         hold(app.FitSeriesPlot_2,'On')
%                                         quiver(app.FitSeriesPlot_2,pole_x(1:3:end),pole_y(1:3:end),dx(1:3:end),dy(1:3:end),0.2,'LineWidth',1)
                                        xlabel(app.FitSeriesPlot_2,'Re(pole)')
                                        ylabel(app.FitSeriesPlot_2,'Im(pole)')
%                                         hold(app.FitSeriesPlot_2,'Off')
%                           
%                                     case 'Polar'
%                                         pole_yz = app.CumulativeSysIDSeriesPlot(:,1);
%                                         pole_theta = abs(pole_yz);
%                                         pole_rho = angle(pole_yz);
%                                         polarplot(app.FitSeriesPlot_2,pole_theta,pole_rho,'*-','LineWidth',3)
                                    case 'Tau Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot(:,1);
                                        plot_dat = -1./(real(pole_yz));
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1) , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Time Constant (s)')
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                    case 'Real Time Series'
                                        pole_yz = app.CumulativeSysIDSeriesPlot(:,1);
                                        plot_dat = (real(pole_yz));
                                        switch app.ZScoreNormalizeSwitch_FitSeries_2.Value
                                            case 'On'
                                              Scheme = string(app.NormalizationSchemeListBox_4.Value);
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme);
                                                  end
                                                  plot_dat = temp_y;
                                        end
                                        plot(app.FitSeriesPlot_2, app.CumulativeSysIDSeriesDomain(:,1) , plot_dat , '*-','LineWidth',3)
                                        ylabel(app.FitSeriesPlot_2,'Re(Pole)')
                                        xlabel(app.FitSeriesPlot_2,'Time')
                                end
                            end
    
                    end
    
                    grid(app.FitSeriesPlot_2, 'on')

                end
        end

        % Button pushed function: ClearResultsButton_3
        function ClearResultsButton_3Pushed(app, event)
            answer = 'Continue';

               answer = questdlg('Are you sure that you want to delete all Transfer Function Fitting Results from the App (saved files are unaffected)?',...
                                    'Clear Data',...
                                   'Continue','Cancel','Continue');
               switch answer
                   case 'Cancel'
                       return
               end 
            
            yyaxis(app.BodeResults_2, 'right')
             cla(app.BodeResults_2)
             yyaxis(app.BodeResults_2, 'left')
             cla(app.BodeResults_2)
             cla(app.NyqResults_2)
             cla(app.PoleZeroResults)
             cla(app.FitSeriesPlot_2)
             
             app.ResultsTable_3.Data = [];
             app.ProgressGuage.Limits = [0,1];
             app.ProgressGuage.Value = 0;
             

             app.Fits_TFest = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'FitsResults', {},'RawData', {},'FitOpts',{});% Description

             f = msgbox("Results Cleared!");
        end

        % Button pushed function: SaveResultsButton_3
        function SaveResultsButton_3Pushed(app, event)
            UserFileName = inputdlg("Enter File Name: ");
            
            selpath = uigetdir();
            SavedDataSysIDResults = app.Fits_TFest;
            save(selpath + "\AnalyZeSysIDResults_" + string(UserFileName) + ".mat","SavedDataSysIDResults",'-mat');

            T_c =  app.ResultsTable_3.Data;
            T = cell2table(T_c, 'VariableNames',...
                       {'NumPoles','Condition','exp','cell','Time',...
                      'FastestPole','ReFastestPole','FastestTau','Poles','Zeros','Numerator',...
                      'Denom','FitPrcnt','MSE','AIC','BIC'});

            filename= selpath + "\AnalyZeSysIDResults_" + string(UserFileName) + ".csv";
            writetable(T,filename);

            f = msgbox("Data Saved as AnalyZeSysIDResults_" + string(UserFileName) + ".mat and AnalyZeSysIDResults_"  + string(UserFileName) + ".csv :D");

        end

        % Button pushed function: LoadResultsButton_2
        function LoadResultsButton_2Pushed(app, event)
            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'Navigate to the .mat file containing the desired fitting results',...
                                'NOTE: Immediately after selecting the .mat file, you will be asked to select the corresponding .csv file.', ...
                                 'Please ensure that the selected pair of files correspond to the same result set.'},...
                                    'Loading a Fitting Result',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end
            
            
            [file,path] = uigetfile('AnalyZeSysIDResults*.mat','Select AnalyZe Results MAT file:');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);

               [file2,path2] = uigetfile(convertStringsToChars(string(path) + "\AnalyZeSysIDResults*.csv"),'Now Select AnalyZe Results CSV file:');

               if isequal(file2,0)
                   %disp('User selected Cancel')
               else
                   %disp(['User Selected ', fullfile(path2,file2)]);
                  
                   %%Read in .mat file
                    var = load(fullfile(path,file));
                    app.Fits_TFest = [app.Fits_TFest; var.SavedDataSysIDResults];
                    
                    %% Read in CSV file
                        %% Set up the Import Options and import the data
                        opts = delimitedTextImportOptions("NumVariables", 16);
                        
                        % Specify range and delimiter
                        opts.DataLines = [2, Inf];
                        opts.Delimiter = ",";

                         
                        % Specify column names and types
                        opts.VariableNames = ["NumPoles","Condition","exp","cell","Time",...
                      "FastestPole","ReFastestPole","FastestTau","Poles","Zeros","Numerator",...
                      "Denom","FitPrcnt","MSE","AIC","BIC"];
                        opts.VariableTypes = ["int64", "char", "int64", "char", "double",...
                            "double", "double", "double", "char", "char", "char",...
                            "char","double","double","double","double"];
                        
                        % Specify file level properties
                        opts.ExtraColumnsRule = "ignore";
                        opts.EmptyLineRule = "read";
                        
                        % Specify variable properties
                        %opts = setvaropts(opts, "DeviceCCTParams", "WhitespaceRule", "preserve");
                        %opts = setvaropts(opts, ["circuit", "Condition", "DeviceCCTParams"], "EmptyFieldRule", "auto");
                        %opts = setvaropts(opts, "cell", "TrimNonNumeric", true);
                        %opts = setvaropts(opts, "cell", "ThousandsSeparator", ",");
                        
                        % Import the data
                        AnalyZeResultsCSVTable = readtable(fullfile(path2,file2), opts);
                        
                        
                        %% Clear temporary variables
                        clear opts
    
                        %%Add data back into table
    
                        for (j = 1:length(AnalyZeResultsCSVTable.NumPoles))
    
                                newData = {AnalyZeResultsCSVTable.NumPoles(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.Condition(j)) ...
                                    AnalyZeResultsCSVTable.exp(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.cell(j)) ...
                                    AnalyZeResultsCSVTable.Time(j) ...
                                    AnalyZeResultsCSVTable.FastestPole(j) ...
                                    AnalyZeResultsCSVTable.ReFastestPole(j) ...
                                    AnalyZeResultsCSVTable.FastestTau(j) ...
                                    cell2mat(AnalyZeResultsCSVTable.Poles(j)) ...
                                    cell2mat(AnalyZeResultsCSVTable.Zeros(j)) ...
                                    cell2mat(AnalyZeResultsCSVTable.Numerator(j)) ...
                                    cell2mat(AnalyZeResultsCSVTable.Denom(j)) ...
                                    AnalyZeResultsCSVTable.FitPrcnt(j) ...
                                    AnalyZeResultsCSVTable.MSE(j) ...
                                    AnalyZeResultsCSVTable.AIC(j) ...
                                    AnalyZeResultsCSVTable.BIC(j)...
                                        };

                                
                                %display(newData)
    
                                if isempty(app.ResultsTable_3.Data)
                                    app.ResultsTable_3.Data = newData;
                                else
                                    DataToAddToTable = [app.ResultsTable_3.Data; newData];
                                    app.ResultsTable_3.Data = DataToAddToTable;
                                end
  
                        end

               end
            end
        end

        % Button pushed function: HOMEButton_4
        function HOMEButton_4Pushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Button pushed function: FitTransferFunctionButton
        function FitTransferFunctionButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisEstimateTransferFunctionTab;

            flag = app.TutorialMode;
                   if flag

                         msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for Transfer function estimation -> Choose the Number of poles and zeros -> Select Go! to fit an nth order transfer dunction to all chosen data.' ,...
                                            'Workflow');

                   end
        end

        % Value changed function: ExplainerModeSwitch
        function ExplainerModeSwitchValueChanged(app, event)
            value = app.ExplainerModeSwitch.Value;
            switch value
                case 'On'
                    app.TutorialMode = true;
                case 'Off'
                    app.TutorialMode = false;
            end
        end

        % Value changed function: EnablePolePlottingvsTimeSwitch
        function EnablePolePlottingvsTimeSwitchValueChanged(app, event)
            value = app.EnablePolePlottingvsTimeSwitch.Value;
            switch value
                case 'On'
                    answer = 'Continue';
                   flag = app.TutorialMode;
                   if flag
                        
                       answer = questdlg('First select a series of cells in the Time column and choose the pole index to plot. Enable Hold Plots to iteratively overlay time series and add them to the mean. Select any single cell in the results table to continue re-plotting the currently selected data set without adding additional (or duplicate) data.' ,...
                                            'Plot Poles of Fitting Result',...
                                           'Continue','Cancel','Continue');
                   end
                       switch answer
                           case 'Cancel'
                               app.EnablePolePlottingvsTimeSwitch.Value = 'Off';
                               app.NumberofZerosSpinner.Enable = true;
                           otherwise
                               app.NumberofZerosSpinner.Enable = false;
                       end
            end

           
        end

        % Value changed function: AutoNumberofZerosSwitch
        function AutoNumberofZerosSwitchValueChanged(app, event)
            value = app.AutoNumberofZerosSwitch.Value;
            
        end

        % Value changed function: RSeriesResistanceSwitch
        function RSeriesResistanceSwitchValueChanged(app, event)
            value = app.RSeriesResistanceSwitch.Value;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox({'All circuits, at a minimum, consist of some series resistance. By default this resistance is taken to be the real component of the highest frequency measurement; this assumes that the circuit is both exclusively capacitive and that the frequency is high enough that only the series resistance contributes to the impedance. Alternatively the series resitance can be determined as follows:',...
                            '- If an ideal barrier is present, a semi-circle can be fit to it by manually selecting three points on said semi-circle in the Nyquist domain. The series resistance is estimated by extrapolating the semi-circle to the Real axis at the high frequency side.',...
                            '- If the system exhibits some time constant faster than the barrier (such as the parallel circuit formed by a non-ohmic contact), then should the barrier time constant and the aforementioned time constant be well separated, then a crude estimate for the series resistance may be optained by taking the real part of the impedance at the first local minima in the Im(Z)',...
                            '- The series resistance may be fit as an additional free parameter (RECOMMENDED)'},'Explainer')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end

        % Value changed function: FitSequentiallySwitch
        function FitSequentiallySwitchValueChanged(app, event)
            value = app.FitSequentiallySwitch.Value;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox({'When a barrier is small, or a high order circuit is used (many parameters), the contribution to the residuals by the barrier can be sufficiently small that the barrier component is fit, in part, by parameters which were inteded to model the non-biological electrochemial phenema in the system',...
                            'As a crude form of regularisation, the data can be initially fit without the (R//C) barrier model - a circuit without any additional parallel current paths will preferentially fit the non-biological components of the system, ideally leaving the entirety of the barrier contribution to the impedance within the residual. This is more likely when the barrier is small.',...
                            'In the second iteration, the parameters fit prior are held constant and only the (R//C) barrier model is fit. This reduces the effective order of the fitting.',...
                            'This approach is best when the series resistance can be estimated a priori. As a means of circumventing overfitting without introducing additional prior information, this approach is potentially more conservative than conventional regularization (or frequency weighting schemes), but it is somewwhat ad hoc.',...
                            '',...
                            'USE WITH CARE',...
                            '',...
                            'Use ''Fit Blank Only'' to investigate the fit sans-barrier.'},'Explainer')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end

        % Value changed function: DoubleClicktoAddElementListBox
        function DoubleClicktoAddElementListBoxValueChanged(app, event)
            value = app.DoubleClicktoAddElementListBox.Value;
            
        end

        % Double-clicked callback: DoubleClicktoAddElementListBox
        function DoubleClicktoAddElementListBoxDoubleClicked(app, event)
            item = event.InteractionInformation.Item;

            ElemToAdd = app.DoubleClicktoAddElementListBox.Value;
            CurrentCCTstring = app.CircuitStringEditField.Value;
            CurrentMaxVals = app.MaxValuesEditField.Value;
            
            
            if (~isempty(CurrentCCTstring)) 
                temp_cctstr = convertStringsToChars(CurrentCCTstring);
                lastChar = temp_cctstr(end);
 
                Open_brackets = sum(temp_cctstr=='(');
                Closed_brackets = sum(temp_cctstr==')');
                Commas = sum(temp_cctstr==',');
                switch ElemToAdd
                    case 'Add New Parallel Branch'
                    case 'Edit Adjacent Branch'
                        if lastChar == '('
                            msgbox('First add element(s) to this branch','No Elements in Branch')
                            return
                        end

                        if Open_brackets == Commas
                            msgbox('You are already editing an Adjacent Branch','On Adjacent Branch')
                            return
                        end

                        if Open_brackets == Closed_brackets
                            msgbox('First add new parallel branch','No Open Branches Found')
                            return
                        end
                    case 'End Parallel Branch'

                        if (lastChar == ',')||(lastChar == '(')
                            msgbox('First add element(s) to this branch','No Elements in Branch')
                            return
                        end
                        
                        if Open_brackets == Closed_brackets
                            msgbox('First add new parallel branch','No Open Branches Found')
                            return
                        end

                        BranchDeficit = (Closed_brackets+1) - Commas;
                        if BranchDeficit>0
                            msgbox('First edit adjacent branch','No Adjacent Branches Found')
                            return
                        end
                        

                    otherwise
                        if ~isempty(CurrentMaxVals)
                            CurrentMaxVals = CurrentMaxVals + ",";
                        end
                end

                if (lastChar ~= '(') && (lastChar ~= ',')
                    
                    switch ElemToAdd
                        case 'Add New Parallel Branch'
                            CurrentCCTstring = CurrentCCTstring + "+";
                        case 'Edit Adjacent Branch'
                        case 'End Parallel Branch'
                        otherwise
                            CurrentCCTstring = CurrentCCTstring + "+";
                    end

                end
                
                

            end

            switch ElemToAdd
                case 'Add New Parallel Branch'

                    CurrentCCTstring = CurrentCCTstring + "p(";

                case 'Edit Adjacent Branch'
                    
                    CurrentCCTstring = CurrentCCTstring + ",";

                case 'End Parallel Branch'

                    CurrentCCTstring = CurrentCCTstring + ")";


                case 'R'
                    CurrentCCTstring = CurrentCCTstring + "R1";
                    CurrentMaxVals = CurrentMaxVals + "1000";             
                    
                case 'C'

                    CurrentCCTstring = CurrentCCTstring + "C1";
                    CurrentMaxVals = CurrentMaxVals + "1";

                case 'Q'

                    CurrentCCTstring = CurrentCCTstring + "Q2";
                    CurrentMaxVals = CurrentMaxVals + "1,1";

                case 'W'

                    CurrentCCTstring = CurrentCCTstring + "W1";
                    CurrentMaxVals = CurrentMaxVals + "1";

                case 'L'
                    CurrentCCTstring = CurrentCCTstring + "L1";
                    CurrentMaxVals = CurrentMaxVals + "1";
            end

            app.CircuitStringEditField.Value = CurrentCCTstring;
            app.MaxValuesEditField.Value = CurrentMaxVals;
        end

        % Value changed function: IncludeBarrierSwitch_2
        function IncludeBarrierSwitch_2ValueChanged(app, event)
            value = app.IncludeBarrierSwitch_2.Value;
            switch value
                case 'On'
                    msgbox('The barrier model p(R1,C1) must be kept as the first entry in the circuit string.','Breakable Point!')

                    BarrierStr = 'p(R1,C1)';
                    BarrierMaxVals = '1000,1';

                    if ~isempty(app.CircuitStringEditField.Value)
                        BarrierStr = [BarrierStr,'+'];
                        BarrierMaxVals = [BarrierMaxVals,','];
                    end

                    CurrentCct = app.CircuitStringEditField.Value;
                    CurrentMaxVals = app.MaxValuesEditField.Value;
                    
                    app.CircuitStringEditField.Value = [BarrierStr,CurrentCct];
                    app.MaxValuesEditField.Value = [BarrierMaxVals,CurrentMaxVals];


                case 'Off'
                    msgbox('Any leading p(R1,C1) statement will now be considered as part of the system (non-barrier) part of the model')

            end
        end

        % Value changed function: CircuitStringEditField
        function CircuitStringEditFieldValueChanged(app, event)
            value = app.CircuitStringEditField.Value;
            BarrierStr = 'p(R1,C1)';
            CurrentCct = app.CircuitStringEditField.Value;
            switch app.IncludeBarrierSwitch_2.Value
                case 'On'
                    
                    errorflag = false;

                    if length(CurrentCct) < length(BarrierStr)
                        errorflag =true;
                        
                    else
                        len = length(BarrierStr);
                        BarrierStrCurrent = CurrentCct(1:len);
            
                        switch BarrierStrCurrent
                            case BarrierStr
                                errorflag = false;
                            otherwise
                                
                                errorflag = true;
                        end
                    end

                    if errorflag
                        msgbox('The app is expecting a leading p(R1,C1) as the Include Barrier Switch is turned on. Please revise circuit string.')
                    end

            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1022 735];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Position = [2 1 1021 734];

            % Create HomeTab
            app.HomeTab = uitab(app.TabGroup);
            app.HomeTab.Title = 'Home';
            app.HomeTab.Tag = 'Home';

            % Create Image2
            app.Image2 = uiimage(app.HomeTab);
            app.Image2.ScaleMethod = 'fill';
            app.Image2.Position = [2 -2 1020 709];
            app.Image2.ImageSource = fullfile(pathToMLAPP, 'Bioelectronicist.png');

            % Create AnalyZeLabel
            app.AnalyZeLabel = uilabel(app.HomeTab);
            app.AnalyZeLabel.FontName = 'Garamond';
            app.AnalyZeLabel.FontSize = 200;
            app.AnalyZeLabel.FontWeight = 'bold';
            app.AnalyZeLabel.FontColor = [0 1 1];
            app.AnalyZeLabel.Position = [161 347 733 266];
            app.AnalyZeLabel.Text = 'AnalyZe';

            % Create BioImpedanceDataAnalysisToolLabel
            app.BioImpedanceDataAnalysisToolLabel = uilabel(app.HomeTab);
            app.BioImpedanceDataAnalysisToolLabel.FontSize = 36;
            app.BioImpedanceDataAnalysisToolLabel.FontColor = [0 1 1];
            app.BioImpedanceDataAnalysisToolLabel.Position = [473 327 550 47];
            app.BioImpedanceDataAnalysisToolLabel.Text = 'BioImpedance Data Analysis Tool';

            % Create Image
            app.Image = uiimage(app.HomeTab);
            app.Image.Position = [739 -3 264 265];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'BEST_Logo.png');

            % Create DouglasvanNiekerkVersion4March2023Label
            app.DouglasvanNiekerkVersion4March2023Label = uilabel(app.HomeTab);
            app.DouglasvanNiekerkVersion4March2023Label.FontSize = 14;
            app.DouglasvanNiekerkVersion4March2023Label.FontColor = [0 0.4471 0.7412];
            app.DouglasvanNiekerkVersion4March2023Label.Position = [747 9 278 26];
            app.DouglasvanNiekerkVersion4March2023Label.Text = 'Douglas van Niekerk Version 4 March 2023';

            % Create ImportDataButton
            app.ImportDataButton = uibutton(app.HomeTab, 'push');
            app.ImportDataButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataButtonPushed, true);
            app.ImportDataButton.FontSize = 24;
            app.ImportDataButton.FontWeight = 'bold';
            app.ImportDataButton.Position = [15 127 100 67];
            app.ImportDataButton.Text = {'Import'; 'Data'};

            % Create FitEquivalentCircuitButton
            app.FitEquivalentCircuitButton = uibutton(app.HomeTab, 'push');
            app.FitEquivalentCircuitButton.ButtonPushedFcn = createCallbackFcn(app, @FitEquivalentCircuitButtonPushed, true);
            app.FitEquivalentCircuitButton.FontSize = 18;
            app.FitEquivalentCircuitButton.FontWeight = 'bold';
            app.FitEquivalentCircuitButton.Position = [121 234 196 30];
            app.FitEquivalentCircuitButton.Text = 'Fit Equivalent Circuit';

            % Create TimeSeriesMagnitudeCrossSectionButton
            app.TimeSeriesMagnitudeCrossSectionButton = uibutton(app.HomeTab, 'push');
            app.TimeSeriesMagnitudeCrossSectionButton.ButtonPushedFcn = createCallbackFcn(app, @TimeSeriesMagnitudeCrossSectionButtonPushed, true);
            app.TimeSeriesMagnitudeCrossSectionButton.FontSize = 18;
            app.TimeSeriesMagnitudeCrossSectionButton.FontWeight = 'bold';
            app.TimeSeriesMagnitudeCrossSectionButton.Position = [146 131 234 54];
            app.TimeSeriesMagnitudeCrossSectionButton.Text = {'Time Series'; 'Magnitude Cross Section'};

            % Create FitTransferFunctionButton
            app.FitTransferFunctionButton = uibutton(app.HomeTab, 'push');
            app.FitTransferFunctionButton.ButtonPushedFcn = createCallbackFcn(app, @FitTransferFunctionButtonPushed, true);
            app.FitTransferFunctionButton.FontSize = 18;
            app.FitTransferFunctionButton.FontWeight = 'bold';
            app.FitTransferFunctionButton.Position = [111 58 196 30];
            app.FitTransferFunctionButton.Text = 'Fit Transfer Function';

            % Create ExplainerModeSwitchLabel
            app.ExplainerModeSwitchLabel = uilabel(app.HomeTab);
            app.ExplainerModeSwitchLabel.HorizontalAlignment = 'center';
            app.ExplainerModeSwitchLabel.FontSize = 18;
            app.ExplainerModeSwitchLabel.FontColor = [0 1 1];
            app.ExplainerModeSwitchLabel.Position = [456 25 130 23];
            app.ExplainerModeSwitchLabel.Text = 'Explainer Mode';

            % Create ExplainerModeSwitch
            app.ExplainerModeSwitch = uiswitch(app.HomeTab, 'slider');
            app.ExplainerModeSwitch.ValueChangedFcn = createCallbackFcn(app, @ExplainerModeSwitchValueChanged, true);
            app.ExplainerModeSwitch.FontSize = 18;
            app.ExplainerModeSwitch.FontColor = [0 1 1];
            app.ExplainerModeSwitch.Position = [479 53 90 40];
            app.ExplainerModeSwitch.Value = 'On';

            % Create InportDataTab
            app.InportDataTab = uitab(app.TabGroup);
            app.InportDataTab.Title = 'Inport Data';
            app.InportDataTab.Tag = 'ImportData';

            % Create LoadDataPanel
            app.LoadDataPanel = uipanel(app.InportDataTab);
            app.LoadDataPanel.Title = 'Load Data';
            app.LoadDataPanel.Position = [15 14 481 683];

            % Create LoadEISDat
            app.LoadEISDat = uiaxes(app.LoadDataPanel);
            title(app.LoadEISDat, 'Bode Plot')
            xlabel(app.LoadEISDat, 'Frequency (Hz)')
            app.LoadEISDat.Tag = 'LoadEIS';
            app.LoadEISDat.Position = [16 46 458 339];

            % Create TimePointAUEditFieldLabel
            app.TimePointAUEditFieldLabel = uilabel(app.LoadDataPanel);
            app.TimePointAUEditFieldLabel.HorizontalAlignment = 'right';
            app.TimePointAUEditFieldLabel.FontSize = 14;
            app.TimePointAUEditFieldLabel.Position = [31 515 104 22];
            app.TimePointAUEditFieldLabel.Text = 'Time Point (AU)';

            % Create ConditionEditFieldLabel
            app.ConditionEditFieldLabel = uilabel(app.LoadDataPanel);
            app.ConditionEditFieldLabel.HorizontalAlignment = 'right';
            app.ConditionEditFieldLabel.FontSize = 14;
            app.ConditionEditFieldLabel.Position = [22 621 64 22];
            app.ConditionEditFieldLabel.Text = 'Condition';

            % Create ConditionEditField
            app.ConditionEditField = uieditfield(app.LoadDataPanel, 'text');
            app.ConditionEditField.ValueChangedFcn = createCallbackFcn(app, @ConditionEditFieldValueChanged, true);
            app.ConditionEditField.Position = [101 617 352 30];

            % Create TimePointAUEditField
            app.TimePointAUEditField = uieditfield(app.LoadDataPanel, 'numeric');
            app.TimePointAUEditField.ValueChangedFcn = createCallbackFcn(app, @TimePointAUEditFieldValueChanged, true);
            app.TimePointAUEditField.Position = [150 509 51 34];
            app.TimePointAUEditField.Value = -1;

            % Create FilePathEditFieldLabel
            app.FilePathEditFieldLabel = uilabel(app.LoadDataPanel);
            app.FilePathEditFieldLabel.HorizontalAlignment = 'right';
            app.FilePathEditFieldLabel.Position = [174 455 52 22];
            app.FilePathEditFieldLabel.Text = 'File Path';

            % Create FilePathEditField
            app.FilePathEditField = uieditfield(app.LoadDataPanel, 'text');
            app.FilePathEditField.ValueChangedFcn = createCallbackFcn(app, @FilePathEditFieldValueChanged, true);
            app.FilePathEditField.Position = [241 450 220 32];

            % Create FindFileButton
            app.FindFileButton = uibutton(app.LoadDataPanel, 'push');
            app.FindFileButton.ButtonPushedFcn = createCallbackFcn(app, @FindFileButtonPushed, true);
            app.FindFileButton.FontSize = 18;
            app.FindFileButton.FontWeight = 'bold';
            app.FindFileButton.FontColor = [0.4667 0.6745 0.1882];
            app.FindFileButton.Tooltip = {'Find file from local storage'};
            app.FindFileButton.Position = [31 449 131 34];
            app.FindFileButton.Text = 'Find File';

            % Create LOADButton
            app.LOADButton = uibutton(app.LoadDataPanel, 'push');
            app.LOADButton.ButtonPushedFcn = createCallbackFcn(app, @LOADButtonPushed, true);
            app.LOADButton.FontSize = 18;
            app.LOADButton.FontWeight = 'bold';
            app.LOADButton.FontColor = [0.4667 0.6745 0.1882];
            app.LOADButton.Tooltip = {'Add selected file to AnalyZe for processing'};
            app.LOADButton.Position = [353 390 100 30];
            app.LOADButton.Text = 'LOAD';

            % Create ExperimentNumberEditFieldLabel
            app.ExperimentNumberEditFieldLabel = uilabel(app.LoadDataPanel);
            app.ExperimentNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.ExperimentNumberEditFieldLabel.FontSize = 14;
            app.ExperimentNumberEditFieldLabel.Position = [6 570 130 22];
            app.ExperimentNumberEditFieldLabel.Text = 'Experiment Number';

            % Create ExperimentNumberEditField
            app.ExperimentNumberEditField = uieditfield(app.LoadDataPanel, 'numeric');
            app.ExperimentNumberEditField.ValueChangedFcn = createCallbackFcn(app, @ExperimentNumberEditFieldValueChanged, true);
            app.ExperimentNumberEditField.Position = [151 561 50 40];
            app.ExperimentNumberEditField.Value = -1;

            % Create WellNumberEditFieldLabel
            app.WellNumberEditFieldLabel = uilabel(app.LoadDataPanel);
            app.WellNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.WellNumberEditFieldLabel.FontSize = 14;
            app.WellNumberEditFieldLabel.Position = [211 570 86 22];
            app.WellNumberEditFieldLabel.Text = 'Well Number';

            % Create WellNumberEditField
            app.WellNumberEditField = uieditfield(app.LoadDataPanel, 'text');
            app.WellNumberEditField.ValueChangedFcn = createCallbackFcn(app, @WellNumberEditFieldValueChanged, true);
            app.WellNumberEditField.Position = [312 561 141 39];

            % Create HoldPlotSwitchLabel
            app.HoldPlotSwitchLabel = uilabel(app.LoadDataPanel);
            app.HoldPlotSwitchLabel.HorizontalAlignment = 'center';
            app.HoldPlotSwitchLabel.Position = [50 -4 54 22];
            app.HoldPlotSwitchLabel.Text = 'Hold Plot';

            % Create HoldPlotSwitchLoad
            app.HoldPlotSwitchLoad = uiswitch(app.LoadDataPanel, 'toggle');
            app.HoldPlotSwitchLoad.Orientation = 'horizontal';
            app.HoldPlotSwitchLoad.Position = [47 19 78 35];

            % Create UITable
            app.UITable = uitable(app.InportDataTab);
            app.UITable.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.UITable.RowName = {};
            app.UITable.CellSelectionCallback = createCallbackFcn(app, @UITableCellSelection, true);
            app.UITable.Position = [511 126 491 570];

            % Create LoadFromPreviousSaveButton
            app.LoadFromPreviousSaveButton = uibutton(app.InportDataTab, 'push');
            app.LoadFromPreviousSaveButton.ButtonPushedFcn = createCallbackFcn(app, @LoadFromPreviousSaveButtonPushed, true);
            app.LoadFromPreviousSaveButton.FontSize = 14;
            app.LoadFromPreviousSaveButton.FontWeight = 'bold';
            app.LoadFromPreviousSaveButton.Position = [505 23 198 35];
            app.LoadFromPreviousSaveButton.Text = 'Load From Previous Save';

            % Create SaveForLaterButton
            app.SaveForLaterButton = uibutton(app.InportDataTab, 'push');
            app.SaveForLaterButton.ButtonPushedFcn = createCallbackFcn(app, @SaveForLaterButtonPushed, true);
            app.SaveForLaterButton.FontSize = 18;
            app.SaveForLaterButton.FontWeight = 'bold';
            app.SaveForLaterButton.Position = [530 70 140 30];
            app.SaveForLaterButton.Text = 'Save For Later';

            % Create HOMEButton
            app.HOMEButton = uibutton(app.InportDataTab, 'push');
            app.HOMEButton.ButtonPushedFcn = createCallbackFcn(app, @HOMEButtonPushed, true);
            app.HOMEButton.FontSize = 18;
            app.HOMEButton.FontWeight = 'bold';
            app.HOMEButton.FontColor = [0 0.4471 0.7412];
            app.HOMEButton.Position = [906 9 102 32];
            app.HOMEButton.Text = 'HOME';

            % Create CLEARDATAButton
            app.CLEARDATAButton = uibutton(app.InportDataTab, 'push');
            app.CLEARDATAButton.ButtonPushedFcn = createCallbackFcn(app, @CLEARDATAButtonPushed, true);
            app.CLEARDATAButton.FontSize = 18;
            app.CLEARDATAButton.FontWeight = 'bold';
            app.CLEARDATAButton.FontColor = [0.851 0.3255 0.098];
            app.CLEARDATAButton.Position = [733 25 130 30];
            app.CLEARDATAButton.Text = 'CLEAR DATA';

            % Create CLEARLASTDATAPOINTButton
            app.CLEARLASTDATAPOINTButton = uibutton(app.InportDataTab, 'push');
            app.CLEARLASTDATAPOINTButton.ButtonPushedFcn = createCallbackFcn(app, @CLEARLASTDATAPOINTButtonPushed, true);
            app.CLEARLASTDATAPOINTButton.FontSize = 10;
            app.CLEARLASTDATAPOINTButton.FontWeight = 'bold';
            app.CLEARLASTDATAPOINTButton.FontColor = [0.6353 0.0784 0.1843];
            app.CLEARLASTDATAPOINTButton.Position = [857 88 143 35];
            app.CLEARLASTDATAPOINTButton.Text = 'CLEAR LAST DATA POINT';

            % Create PlotSelectedButton
            app.PlotSelectedButton = uibutton(app.InportDataTab, 'push');
            app.PlotSelectedButton.ButtonPushedFcn = createCallbackFcn(app, @PlotSelectedButtonPushed, true);
            app.PlotSelectedButton.FontSize = 14;
            app.PlotSelectedButton.FontWeight = 'bold';
            app.PlotSelectedButton.FontColor = [0 0 1];
            app.PlotSelectedButton.Position = [747 88 103 35];
            app.PlotSelectedButton.Text = 'Plot Selected';

            % Create AnalysisCCTFITTab
            app.AnalysisCCTFITTab = uitab(app.TabGroup);
            app.AnalysisCCTFITTab.Title = 'Analysis CCT FIT';
            app.AnalysisCCTFITTab.Tag = 'CCTFit';

            % Create TrimData
            app.TrimData = uipanel(app.AnalysisCCTFITTab);
            app.TrimData.Title = 'Select Data';
            app.TrimData.Position = [15 352 476 322];

            % Create ConditionListBoxLabel
            app.ConditionListBoxLabel = uilabel(app.TrimData);
            app.ConditionListBoxLabel.HorizontalAlignment = 'right';
            app.ConditionListBoxLabel.Position = [18 254 55 22];
            app.ConditionListBoxLabel.Text = 'Condition';

            % Create ConditionListBox
            app.ConditionListBox = uilistbox(app.TrimData);
            app.ConditionListBox.Position = [88 233 356 65];

            % Create ExperimentNumberListBoxLabel
            app.ExperimentNumberListBoxLabel = uilabel(app.TrimData);
            app.ExperimentNumberListBoxLabel.HorizontalAlignment = 'right';
            app.ExperimentNumberListBoxLabel.Position = [5 167 119 43];
            app.ExperimentNumberListBoxLabel.Text = 'Experiment Number';

            % Create ExperimentNumberListBox
            app.ExperimentNumberListBox = uilistbox(app.TrimData);
            app.ExperimentNumberListBox.Position = [136 164 87 58];

            % Create WellNumberListBoxLabel
            app.WellNumberListBoxLabel = uilabel(app.TrimData);
            app.WellNumberListBoxLabel.HorizontalAlignment = 'right';
            app.WellNumberListBoxLabel.Position = [49 117 74 22];
            app.WellNumberListBoxLabel.Text = 'Well Number';

            % Create WellNumberListBox
            app.WellNumberListBox = uilistbox(app.TrimData);
            app.WellNumberListBox.Position = [137 101 87 54];

            % Create ChosenDataTable
            app.ChosenDataTable = uitable(app.TrimData);
            app.ChosenDataTable.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable.RowName = {};
            app.ChosenDataTable.Position = [28 9 417 85];

            % Create ChooseButton
            app.ChooseButton = uibutton(app.TrimData, 'push');
            app.ChooseButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseButtonPushed, true);
            app.ChooseButton.FontSize = 18;
            app.ChooseButton.FontWeight = 'bold';
            app.ChooseButton.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseButton.Tooltip = {'Select the Data subset to be fit'};
            app.ChooseButton.Position = [269 113 146 30];
            app.ChooseButton.Text = 'Choose';

            % Create TimeListBoxLabel
            app.TimeListBoxLabel = uilabel(app.TrimData);
            app.TimeListBoxLabel.HorizontalAlignment = 'right';
            app.TimeListBoxLabel.Position = [260 183 48 22];
            app.TimeListBoxLabel.Text = 'Time';

            % Create TimeListBox
            app.TimeListBox = uilistbox(app.TrimData);
            app.TimeListBox.Multiselect = 'on';
            app.TimeListBox.Position = [323 165 122 57];
            app.TimeListBox.Value = {'Item 1'};

            % Create FittingParams
            app.FittingParams = uipanel(app.AnalysisCCTFITTab);
            app.FittingParams.Position = [15 14 476 333];

            % Create MultiStartsEditFieldLabel
            app.MultiStartsEditFieldLabel = uilabel(app.FittingParams);
            app.MultiStartsEditFieldLabel.HorizontalAlignment = 'right';
            app.MultiStartsEditFieldLabel.FontSize = 24;
            app.MultiStartsEditFieldLabel.FontWeight = 'bold';
            app.MultiStartsEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.MultiStartsEditFieldLabel.Position = [15 287 129 31];
            app.MultiStartsEditFieldLabel.Text = 'MultiStarts';

            % Create MultiStartsEditField
            app.MultiStartsEditField = uieditfield(app.FittingParams, 'numeric');
            app.MultiStartsEditField.FontSize = 36;
            app.MultiStartsEditField.Tooltip = {'This is the primary fitting tuning parameter = the number of fitting attempts made for different initial condition candidates. In general, fitness increases with this parameter. Performance may be sensitive to the exact value.'};
            app.MultiStartsEditField.Position = [20 245 120 35];
            app.MultiStartsEditField.Value = 3000;

            % Create GoButton
            app.GoButton = uibutton(app.FittingParams, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.FontSize = 24;
            app.GoButton.FontWeight = 'bold';
            app.GoButton.FontColor = [0.4667 0.6745 0.1882];
            app.GoButton.Position = [169 7 123 38];
            app.GoButton.Text = 'Go!';

            % Create RunningLampLabel
            app.RunningLampLabel = uilabel(app.FittingParams);
            app.RunningLampLabel.HorizontalAlignment = 'right';
            app.RunningLampLabel.FontSize = 14;
            app.RunningLampLabel.FontWeight = 'bold';
            app.RunningLampLabel.Position = [343 14 62 22];
            app.RunningLampLabel.Text = 'Running';

            % Create RunningLamp
            app.RunningLamp = uilamp(app.FittingParams);
            app.RunningLamp.Position = [415 7 35 35];
            app.RunningLamp.Color = [1 0 0];

            % Create CircuitToFit
            app.CircuitToFit = uitabgroup(app.FittingParams);
            app.CircuitToFit.SelectionChangedFcn = createCallbackFcn(app, @CircuitToFitSelectionChanged, true);
            app.CircuitToFit.Position = [5 49 464 152];

            % Create SelectACircuitTab
            app.SelectACircuitTab = uitab(app.CircuitToFit);
            app.SelectACircuitTab.Title = 'Select-A-Circuit';

            % Create SelectaCircuitBarrierInclusiveListBoxLabel
            app.SelectaCircuitBarrierInclusiveListBoxLabel = uilabel(app.SelectACircuitTab);
            app.SelectaCircuitBarrierInclusiveListBoxLabel.HorizontalAlignment = 'right';
            app.SelectaCircuitBarrierInclusiveListBoxLabel.Position = [11 49 55 59];
            app.SelectaCircuitBarrierInclusiveListBoxLabel.Text = {'Select a'; 'Circuit'; '(Barrier '; 'Inclusive)'};

            % Create SelectaCircuitBarrierInclusiveListBox
            app.SelectaCircuitBarrierInclusiveListBox = uilistbox(app.SelectACircuitTab);
            app.SelectaCircuitBarrierInclusiveListBox.Items = {'R--(R//C)--((R--W)//C)', 'R--(R//C)--C', 'R--(R//C)--C--Q', 'R--(R//C)--Q'};
            app.SelectaCircuitBarrierInclusiveListBox.Position = [81 17 358 93];
            app.SelectaCircuitBarrierInclusiveListBox.Value = 'R--(R//C)--((R--W)//C)';

            % Create BuildACircuitTab
            app.BuildACircuitTab = uitab(app.CircuitToFit);
            app.BuildACircuitTab.Title = 'Build-A-Circuit';

            % Create CircuitBuilderTable
            app.CircuitBuilderTable = uitable(app.BuildACircuitTab);
            app.CircuitBuilderTable.ColumnName = {''; ''; ''; ''; ''; ''};
            app.CircuitBuilderTable.ColumnWidth = {59, 59, 59, 59, 59, 59};
            app.CircuitBuilderTable.RowName = {};
            app.CircuitBuilderTable.ColumnEditable = true;
            app.CircuitBuilderTable.CellEditCallback = createCallbackFcn(app, @CircuitBuilderTableCellEdit, true);
            app.CircuitBuilderTable.Multiselect = 'off';
            app.CircuitBuilderTable.Tooltip = {'Enter the circuit parameters according to the circuit layout. Series elements along the middle row, parallel elements in rows one and three. Columns one and two are protected.'; 'Allowed circuit elements are:'; 'R - Resistance'; 'C - Capacitance'; 'L - Inductance'; 'Q - Condtant Phase Element'; 'W - Warburg Element'; 'Each Circuit value needs to be assigned a maximum in the adjascent tab!'};
            app.CircuitBuilderTable.Position = [9 6 364 116];

            % Create IncludeBarrierSwitchLabel
            app.IncludeBarrierSwitchLabel = uilabel(app.BuildACircuitTab);
            app.IncludeBarrierSwitchLabel.HorizontalAlignment = 'center';
            app.IncludeBarrierSwitchLabel.Position = [379 7 83 22];
            app.IncludeBarrierSwitchLabel.Text = 'Include Barrier';

            % Create IncludeBarrierSwitch
            app.IncludeBarrierSwitch = uiswitch(app.BuildACircuitTab, 'slider');
            app.IncludeBarrierSwitch.Orientation = 'vertical';
            app.IncludeBarrierSwitch.ValueChangedFcn = createCallbackFcn(app, @IncludeBarrierSwitchValueChanged, true);
            app.IncludeBarrierSwitch.Position = [409 52 20 45];

            % Create BuildACircuitMaxValuesTab
            app.BuildACircuitMaxValuesTab = uitab(app.CircuitToFit);
            app.BuildACircuitMaxValuesTab.Title = 'Build-A-Circuit-Max Values';

            % Create CircuitBuilderTable_MaxVals
            app.CircuitBuilderTable_MaxVals = uitable(app.BuildACircuitMaxValuesTab);
            app.CircuitBuilderTable_MaxVals.ColumnName = {''; ''; ''; ''; ''; ''};
            app.CircuitBuilderTable_MaxVals.ColumnWidth = {59, 59, 59, 59, 59, 59};
            app.CircuitBuilderTable_MaxVals.RowName = {};
            app.CircuitBuilderTable_MaxVals.ColumnEditable = true;
            app.CircuitBuilderTable_MaxVals.CellEditCallback = createCallbackFcn(app, @CircuitBuilderTable_MaxValsCellEdit, true);
            app.CircuitBuilderTable_MaxVals.Multiselect = 'off';
            app.CircuitBuilderTable_MaxVals.Tooltip = {'Enter the maximum allowed values for each circuit parameter. Use the same locations as the Build-A-Circuit table'};
            app.CircuitBuilderTable_MaxVals.FontSize = 10;
            app.CircuitBuilderTable_MaxVals.Position = [55 8 364 116];

            % Create WriteACircuitTab
            app.WriteACircuitTab = uitab(app.CircuitToFit);
            app.WriteACircuitTab.Title = 'Write-A-Circuit';

            % Create CircuitStringEditFieldLabel
            app.CircuitStringEditFieldLabel = uilabel(app.WriteACircuitTab);
            app.CircuitStringEditFieldLabel.HorizontalAlignment = 'right';
            app.CircuitStringEditFieldLabel.FontWeight = 'bold';
            app.CircuitStringEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.CircuitStringEditFieldLabel.Position = [5 84 43 30];
            app.CircuitStringEditFieldLabel.Text = {'Circuit'; 'String'};

            % Create CircuitStringEditField
            app.CircuitStringEditField = uieditfield(app.WriteACircuitTab, 'text');
            app.CircuitStringEditField.ValueChangedFcn = createCallbackFcn(app, @CircuitStringEditFieldValueChanged, true);
            app.CircuitStringEditField.Position = [63 85 193 35];

            % Create MaxValuesEditFieldLabel
            app.MaxValuesEditFieldLabel = uilabel(app.WriteACircuitTab);
            app.MaxValuesEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxValuesEditFieldLabel.FontWeight = 'bold';
            app.MaxValuesEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.MaxValuesEditFieldLabel.Position = [6 41 43 30];
            app.MaxValuesEditFieldLabel.Text = {'Max'; 'Values'};

            % Create MaxValuesEditField
            app.MaxValuesEditField = uieditfield(app.WriteACircuitTab, 'text');
            app.MaxValuesEditField.Position = [64 42 230 35];

            % Create DoubleClicktoAddElementListBoxLabel
            app.DoubleClicktoAddElementListBoxLabel = uilabel(app.WriteACircuitTab);
            app.DoubleClicktoAddElementListBoxLabel.HorizontalAlignment = 'right';
            app.DoubleClicktoAddElementListBoxLabel.FontWeight = 'bold';
            app.DoubleClicktoAddElementListBoxLabel.FontColor = [0.4667 0.6745 0.1882];
            app.DoubleClicktoAddElementListBoxLabel.Position = [285 1 168 22];
            app.DoubleClicktoAddElementListBoxLabel.Text = 'Double Click to Add Element';

            % Create DoubleClicktoAddElementListBox
            app.DoubleClicktoAddElementListBox = uilistbox(app.WriteACircuitTab);
            app.DoubleClicktoAddElementListBox.Items = {'Add New Parallel Branch', 'Edit Adjacent Branch', 'End Parallel Branch', 'R', 'C', 'Q', 'W', 'L'};
            app.DoubleClicktoAddElementListBox.ValueChangedFcn = createCallbackFcn(app, @DoubleClicktoAddElementListBoxValueChanged, true);
            app.DoubleClicktoAddElementListBox.DoubleClickedFcn = createCallbackFcn(app, @DoubleClicktoAddElementListBoxDoubleClicked, true);
            app.DoubleClicktoAddElementListBox.Position = [301 24 151 98];
            app.DoubleClicktoAddElementListBox.Value = 'R';

            % Create RLabel
            app.RLabel = uilabel(app.WriteACircuitTab);
            app.RLabel.FontWeight = 'bold';
            app.RLabel.FontColor = [0.6353 0.0784 0.1843];
            app.RLabel.Position = [261 91 29 22];
            app.RLabel.Text = '+R∞';

            % Create IncludeBarrierSwitch_2Label
            app.IncludeBarrierSwitch_2Label = uilabel(app.WriteACircuitTab);
            app.IncludeBarrierSwitch_2Label.HorizontalAlignment = 'center';
            app.IncludeBarrierSwitch_2Label.FontWeight = 'bold';
            app.IncludeBarrierSwitch_2Label.FontColor = [0.6353 0.0784 0.1843];
            app.IncludeBarrierSwitch_2Label.Position = [8 9 90 22];
            app.IncludeBarrierSwitch_2Label.Text = 'Include Barrier';

            % Create IncludeBarrierSwitch_2
            app.IncludeBarrierSwitch_2 = uiswitch(app.WriteACircuitTab, 'rocker');
            app.IncludeBarrierSwitch_2.Orientation = 'horizontal';
            app.IncludeBarrierSwitch_2.ValueChangedFcn = createCallbackFcn(app, @IncludeBarrierSwitch_2ValueChanged, true);
            app.IncludeBarrierSwitch_2.Position = [127 10 45 20];

            % Create ProgressGuage
            app.ProgressGuage = uigauge(app.FittingParams, 'semicircular');
            app.ProgressGuage.FontSize = 9;
            app.ProgressGuage.Position = [42 8 70 38];

            % Create TabGroup7
            app.TabGroup7 = uitabgroup(app.FittingParams);
            app.TabGroup7.Position = [152 205 317 121];

            % Create SeriesResistanceEstimateTab
            app.SeriesResistanceEstimateTab = uitab(app.TabGroup7);
            app.SeriesResistanceEstimateTab.Title = 'Series Resistance Estimate';

            % Create RSeriesResistanceSwitchLabel
            app.RSeriesResistanceSwitchLabel = uilabel(app.SeriesResistanceEstimateTab);
            app.RSeriesResistanceSwitchLabel.HorizontalAlignment = 'center';
            app.RSeriesResistanceSwitchLabel.FontWeight = 'bold';
            app.RSeriesResistanceSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.RSeriesResistanceSwitchLabel.Position = [7 -1 136 22];
            app.RSeriesResistanceSwitchLabel.Text = 'R∞ (Series Resistance)';

            % Create RSeriesResistanceSwitch
            app.RSeriesResistanceSwitch = uiswitch(app.SeriesResistanceEstimateTab, 'slider');
            app.RSeriesResistanceSwitch.Items = {'Re(Z)_final', 'Alternate'};
            app.RSeriesResistanceSwitch.Orientation = 'vertical';
            app.RSeriesResistanceSwitch.ValueChangedFcn = createCallbackFcn(app, @RSeriesResistanceSwitchValueChanged, true);
            app.RSeriesResistanceSwitch.FontSize = 10;
            app.RSeriesResistanceSwitch.Position = [59 37 17 38];
            app.RSeriesResistanceSwitch.Value = 'Re(Z)_final';

            % Create AlternateRestimationListBoxLabel
            app.AlternateRestimationListBoxLabel = uilabel(app.SeriesResistanceEstimateTab);
            app.AlternateRestimationListBoxLabel.HorizontalAlignment = 'right';
            app.AlternateRestimationListBoxLabel.FontWeight = 'bold';
            app.AlternateRestimationListBoxLabel.Position = [148 0 141 22];
            app.AlternateRestimationListBoxLabel.Text = 'Alternate R∞ estimation';

            % Create AlternateRestimationListBox
            app.AlternateRestimationListBox = uilistbox(app.SeriesResistanceEstimateTab);
            app.AlternateRestimationListBox.Items = {'Semi-circle Fit', 'Im(Z) Local Min', 'Free R Fit'};
            app.AlternateRestimationListBox.Position = [156 24 145 64];
            app.AlternateRestimationListBox.Value = 'Semi-circle Fit';

            % Create SequentialBarrierFittingTab
            app.SequentialBarrierFittingTab = uitab(app.TabGroup7);
            app.SequentialBarrierFittingTab.Title = 'Sequential Barrier Fitting';

            % Create BlankFitMultiStartsEditFieldLabel
            app.BlankFitMultiStartsEditFieldLabel = uilabel(app.SequentialBarrierFittingTab);
            app.BlankFitMultiStartsEditFieldLabel.HorizontalAlignment = 'right';
            app.BlankFitMultiStartsEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.BlankFitMultiStartsEditFieldLabel.Position = [149 59 62 30];
            app.BlankFitMultiStartsEditFieldLabel.Text = {'Blank Fit'; 'MultiStarts'};

            % Create BlankFitMultiStartsEditField
            app.BlankFitMultiStartsEditField = uieditfield(app.SequentialBarrierFittingTab, 'numeric');
            app.BlankFitMultiStartsEditField.Position = [216 63 68 26];
            app.BlankFitMultiStartsEditField.Value = 1000;

            % Create FitSequentiallySwitchLabel
            app.FitSequentiallySwitchLabel = uilabel(app.SequentialBarrierFittingTab);
            app.FitSequentiallySwitchLabel.HorizontalAlignment = 'center';
            app.FitSequentiallySwitchLabel.FontSize = 14;
            app.FitSequentiallySwitchLabel.FontWeight = 'bold';
            app.FitSequentiallySwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.FitSequentiallySwitchLabel.Position = [13 21 108 22];
            app.FitSequentiallySwitchLabel.Text = 'Fit Sequentially';

            % Create FitSequentiallySwitch
            app.FitSequentiallySwitch = uiswitch(app.SequentialBarrierFittingTab, 'slider');
            app.FitSequentiallySwitch.ValueChangedFcn = createCallbackFcn(app, @FitSequentiallySwitchValueChanged, true);
            app.FitSequentiallySwitch.Tooltip = {'Fit the data with the circuit sans barrier first, then refit the data by fitting only the barrier parameters and keeping the pre-fit non-barrier parameters constant.'};
            app.FitSequentiallySwitch.Position = [37 52 59 26];

            % Create FitBlankOnlyExcludeBarrierLabel
            app.FitBlankOnlyExcludeBarrierLabel = uilabel(app.SequentialBarrierFittingTab);
            app.FitBlankOnlyExcludeBarrierLabel.HorizontalAlignment = 'center';
            app.FitBlankOnlyExcludeBarrierLabel.Position = [138 6 173 22];
            app.FitBlankOnlyExcludeBarrierLabel.Text = 'Fit Blank Only (Exclude Barrier)';

            % Create FitBlankOnlyExcludeBarrierSwitch
            app.FitBlankOnlyExcludeBarrierSwitch = uiswitch(app.SequentialBarrierFittingTab, 'slider');
            app.FitBlankOnlyExcludeBarrierSwitch.ValueChangedFcn = createCallbackFcn(app, @FitBlankOnlyExcludeBarrierSwitchValueChanged, true);
            app.FitBlankOnlyExcludeBarrierSwitch.Tooltip = {'Fit the circuit excluding the barrier R//C'};
            app.FitBlankOnlyExcludeBarrierSwitch.Position = [201 31 45 20];

            % Create RefreshDataOptionsButton
            app.RefreshDataOptionsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.RefreshDataOptionsButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshDataOptionsButtonPushed, true);
            app.RefreshDataOptionsButton.FontWeight = 'bold';
            app.RefreshDataOptionsButton.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshDataOptionsButton.Position = [178 679 138 27];
            app.RefreshDataOptionsButton.Text = 'Refresh Data Options';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.AnalysisCCTFITTab);
            app.TabGroup2.Position = [511 51 486 623];

            % Create PlotsTab
            app.PlotsTab = uitab(app.TabGroup2);
            app.PlotsTab.Title = 'Plots';

            % Create BodeResults
            app.BodeResults = uiaxes(app.PlotsTab);
            xlabel(app.BodeResults, 'X')
            ylabel(app.BodeResults, 'Y')
            zlabel(app.BodeResults, 'Z')
            app.BodeResults.Position = [1 285 458 315];

            % Create NyqResults
            app.NyqResults = uiaxes(app.PlotsTab);
            xlabel(app.NyqResults, 'X')
            ylabel(app.NyqResults, 'Y')
            zlabel(app.NyqResults, 'Z')
            app.NyqResults.Position = [107 6 349 281];

            % Create HoldPlotsSwitchLabel
            app.HoldPlotsSwitchLabel = uilabel(app.PlotsTab);
            app.HoldPlotsSwitchLabel.HorizontalAlignment = 'center';
            app.HoldPlotsSwitchLabel.FontSize = 18;
            app.HoldPlotsSwitchLabel.FontWeight = 'bold';
            app.HoldPlotsSwitchLabel.Position = [11 259 94 23];
            app.HoldPlotsSwitchLabel.Text = 'Hold Plots';

            % Create HoldPlotsSwitch
            app.HoldPlotsSwitch = uiswitch(app.PlotsTab, 'toggle');
            app.HoldPlotsSwitch.FontSize = 18;
            app.HoldPlotsSwitch.Position = [39 157 32 72];

            % Create PlotResultsSelectionButton
            app.PlotResultsSelectionButton = uibutton(app.PlotsTab, 'push');
            app.PlotResultsSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @PlotResultsSelectionButtonPushed, true);
            app.PlotResultsSelectionButton.FontSize = 18;
            app.PlotResultsSelectionButton.FontWeight = 'bold';
            app.PlotResultsSelectionButton.FontColor = [0.302 0.7451 0.9333];
            app.PlotResultsSelectionButton.Position = [6 33 100 74];
            app.PlotResultsSelectionButton.Text = {'Plot'; 'Results'; 'Selection'};

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup2);
            app.ResultsTab.Title = 'Results';

            % Create ResultsTable
            app.ResultsTable = uitable(app.ResultsTab);
            app.ResultsTable.ColumnName = {'Circuit'; 'Condition'; 'Exp'; 'Well'; 'Time'; 'Rb'; 'Cb'; 'Device CCT Params'; 'MSE'; 'NRMSE'; 'NMSE'; 'AIC'; 'BIC'};
            app.ResultsTable.RowName = {};
            app.ResultsTable.CellSelectionCallback = createCallbackFcn(app, @ResultsTableCellSelection, true);
            app.ResultsTable.Position = [11 20 461 570];

            % Create FitDiagnosticTab
            app.FitDiagnosticTab = uitab(app.TabGroup2);
            app.FitDiagnosticTab.Title = 'Fit Diagnostic';

            % Create RealQQ
            app.RealQQ = uiaxes(app.FitDiagnosticTab);
            title(app.RealQQ, 'Real QQ plot')
            xlabel(app.RealQQ, 'X')
            ylabel(app.RealQQ, 'Y')
            zlabel(app.RealQQ, 'Z')
            app.RealQQ.Position = [1 353 225 181];

            % Create ImagQQ
            app.ImagQQ = uiaxes(app.FitDiagnosticTab);
            title(app.ImagQQ, 'Imaginary QQ Plot')
            xlabel(app.ImagQQ, 'X')
            ylabel(app.ImagQQ, 'Y')
            zlabel(app.ImagQQ, 'Z')
            app.ImagQQ.Position = [237 353 225 181];

            % Create UpdateDiagnosticPlotsButton
            app.UpdateDiagnosticPlotsButton = uibutton(app.FitDiagnosticTab, 'push');
            app.UpdateDiagnosticPlotsButton.ButtonPushedFcn = createCallbackFcn(app, @UpdateDiagnosticPlotsButtonPushed, true);
            app.UpdateDiagnosticPlotsButton.FontSize = 14;
            app.UpdateDiagnosticPlotsButton.FontWeight = 'bold';
            app.UpdateDiagnosticPlotsButton.FontColor = [0.4667 0.6745 0.1882];
            app.UpdateDiagnosticPlotsButton.Tooltip = {'First select any cell in the Results table - by clicking ''Update Diagnostic Plots'' the fitness diagnostics for that fitting instance (row) will be added to the plots.'};
            app.UpdateDiagnosticPlotsButton.Position = [97 553 176 38];
            app.UpdateDiagnosticPlotsButton.Text = 'Update Diagnostic Plots';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.FitDiagnosticTab);
            app.TabGroup3.Position = [1 17 474 337];

            % Create ResidualsTab
            app.ResidualsTab = uitab(app.TabGroup3);
            app.ResidualsTab.Title = 'Residuals';

            % Create Residuals
            app.Residuals = uiaxes(app.ResidualsTab);
            title(app.Residuals, 'Residuals')
            xlabel(app.Residuals, 'Real')
            ylabel(app.Residuals, 'Imaginary')
            zlabel(app.Residuals, 'Z')
            app.Residuals.Position = [1 3 465 310];

            % Create DensityTab
            app.DensityTab = uitab(app.TabGroup3);
            app.DensityTab.Title = 'Density';

            % Create KDensity
            app.KDensity = uiaxes(app.DensityTab);
            title(app.KDensity, 'K-Density Estimate')
            xlabel(app.KDensity, 'Real')
            ylabel(app.KDensity, 'Imaginary')
            zlabel(app.KDensity, 'Z')
            app.KDensity.Position = [8 18 309 286];

            % Create RealAxisWidthEditFieldLabel
            app.RealAxisWidthEditFieldLabel = uilabel(app.DensityTab);
            app.RealAxisWidthEditFieldLabel.HorizontalAlignment = 'right';
            app.RealAxisWidthEditFieldLabel.Position = [315 241 89 22];
            app.RealAxisWidthEditFieldLabel.Text = 'Real Axis Width';

            % Create RealAxisWidthEditField
            app.RealAxisWidthEditField = uieditfield(app.DensityTab, 'numeric');
            app.RealAxisWidthEditField.Position = [419 235 53 33];
            app.RealAxisWidthEditField.Value = 100;

            % Create ImagAxisWidthEditFieldLabel
            app.ImagAxisWidthEditFieldLabel = uilabel(app.DensityTab);
            app.ImagAxisWidthEditFieldLabel.HorizontalAlignment = 'right';
            app.ImagAxisWidthEditFieldLabel.Position = [312 204 91 22];
            app.ImagAxisWidthEditFieldLabel.Text = 'Imag Axis Width';

            % Create ImagAxisWidthEditField
            app.ImagAxisWidthEditField = uieditfield(app.DensityTab, 'numeric');
            app.ImagAxisWidthEditField.Position = [418 198 53 33];
            app.ImagAxisWidthEditField.Value = 100;

            % Create GranularityEditFieldLabel
            app.GranularityEditFieldLabel = uilabel(app.DensityTab);
            app.GranularityEditFieldLabel.HorizontalAlignment = 'right';
            app.GranularityEditFieldLabel.Position = [339 165 63 22];
            app.GranularityEditFieldLabel.Text = 'Granularity';

            % Create GranularityEditField
            app.GranularityEditField = uieditfield(app.DensityTab, 'numeric');
            app.GranularityEditField.Position = [417 159 53 33];
            app.GranularityEditField.Value = 1;

            % Create PlotStyleSwitchLabel
            app.PlotStyleSwitchLabel = uilabel(app.DensityTab);
            app.PlotStyleSwitchLabel.HorizontalAlignment = 'center';
            app.PlotStyleSwitchLabel.Position = [367 45 55 22];
            app.PlotStyleSwitchLabel.Text = 'Plot Style';

            % Create PlotStyleSwitch
            app.PlotStyleSwitch = uiswitch(app.DensityTab, 'slider');
            app.PlotStyleSwitch.Items = {'Surface', 'Contour'};
            app.PlotStyleSwitch.Position = [371 82 45 20];
            app.PlotStyleSwitch.Value = 'Surface';

            % Create HoldPlotsSwitch_2Label
            app.HoldPlotsSwitch_2Label = uilabel(app.FitDiagnosticTab);
            app.HoldPlotsSwitch_2Label.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_2Label.FontWeight = 'bold';
            app.HoldPlotsSwitch_2Label.Position = [318 536 64 22];
            app.HoldPlotsSwitch_2Label.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_FitDiagnostics
            app.HoldPlotsSwitch_FitDiagnostics = uiswitch(app.FitDiagnosticTab, 'toggle');
            app.HoldPlotsSwitch_FitDiagnostics.Orientation = 'horizontal';
            app.HoldPlotsSwitch_FitDiagnostics.Position = [315 557 67 30];

            % Create SeriesPlotTab
            app.SeriesPlotTab = uitab(app.TabGroup2);
            app.SeriesPlotTab.Title = 'Series Plot';

            % Create FitSeriesPlot
            app.FitSeriesPlot = uiaxes(app.SeriesPlotTab);
            xlabel(app.FitSeriesPlot, 'X')
            ylabel(app.FitSeriesPlot, 'Y')
            zlabel(app.FitSeriesPlot, 'Z')
            app.FitSeriesPlot.Position = [10 97 470 341];

            % Create PlotFromTableSelectionButton
            app.PlotFromTableSelectionButton = uibutton(app.SeriesPlotTab, 'push');
            app.PlotFromTableSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @PlotFromTableSelectionButtonPushed, true);
            app.PlotFromTableSelectionButton.FontSize = 16;
            app.PlotFromTableSelectionButton.FontWeight = 'bold';
            app.PlotFromTableSelectionButton.FontColor = [0.4667 0.6745 0.1882];
            app.PlotFromTableSelectionButton.Tooltip = {'First highlight two columns in the Results table - clicking ''Plot From Table Selection'' will plot one data series against the other.'};
            app.PlotFromTableSelectionButton.Position = [19 516 93 74];
            app.PlotFromTableSelectionButton.Text = {'Plot From '; 'Table'; ' Selection'};

            % Create HoldPlotsSwitch_2Label_2
            app.HoldPlotsSwitch_2Label_2 = uilabel(app.SeriesPlotTab);
            app.HoldPlotsSwitch_2Label_2.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_2Label_2.Position = [54 17 59 22];
            app.HoldPlotsSwitch_2Label_2.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_FitSeries
            app.HoldPlotsSwitch_FitSeries = uiswitch(app.SeriesPlotTab, 'toggle');
            app.HoldPlotsSwitch_FitSeries.Orientation = 'horizontal';
            app.HoldPlotsSwitch_FitSeries.Position = [35 43 97 43];

            % Create OptionsPanel
            app.OptionsPanel = uipanel(app.SeriesPlotTab);
            app.OptionsPanel.Title = 'Options';
            app.OptionsPanel.Position = [127 442 347 153];

            % Create ZScoreNormalizeLabel
            app.ZScoreNormalizeLabel = uilabel(app.OptionsPanel);
            app.ZScoreNormalizeLabel.HorizontalAlignment = 'center';
            app.ZScoreNormalizeLabel.Position = [2 8 63 30];
            app.ZScoreNormalizeLabel.Text = {''; ' Normalize'};

            % Create ZScoreNormalizeSwitch_FitSeries
            app.ZScoreNormalizeSwitch_FitSeries = uiswitch(app.OptionsPanel, 'slider');
            app.ZScoreNormalizeSwitch_FitSeries.Orientation = 'vertical';
            app.ZScoreNormalizeSwitch_FitSeries.Position = [23 58 20 45];

            % Create Areacm2EditFieldLabel
            app.Areacm2EditFieldLabel = uilabel(app.OptionsPanel);
            app.Areacm2EditFieldLabel.HorizontalAlignment = 'right';
            app.Areacm2EditFieldLabel.Position = [198 43 70 22];
            app.Areacm2EditFieldLabel.Text = 'Area (cm^2)';

            % Create Areacm2EditField
            app.Areacm2EditField = uieditfield(app.OptionsPanel, 'numeric');
            app.Areacm2EditField.Position = [283 42 54 22];
            app.Areacm2EditField.Value = 1;

            % Create AreaNormalizeSwitchLabel
            app.AreaNormalizeSwitchLabel = uilabel(app.OptionsPanel);
            app.AreaNormalizeSwitchLabel.HorizontalAlignment = 'center';
            app.AreaNormalizeSwitchLabel.Position = [224 107 87 22];
            app.AreaNormalizeSwitchLabel.Text = 'Area Normalize';

            % Create AreaNormalizeSwitch
            app.AreaNormalizeSwitch = uiswitch(app.OptionsPanel, 'slider');
            app.AreaNormalizeSwitch.Position = [238 78 70 31];

            % Create SwitchAreaNormType
            app.SwitchAreaNormType = uiswitch(app.OptionsPanel, 'slider');
            app.SwitchAreaNormType.Items = {'*A', '*sqrt(A)'};
            app.SwitchAreaNormType.Position = [238 18 45 20];
            app.SwitchAreaNormType.Value = '*A';

            % Create NormalizationSchemeListBox_2Label
            app.NormalizationSchemeListBox_2Label = uilabel(app.OptionsPanel);
            app.NormalizationSchemeListBox_2Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_2Label.Position = [61 25 126 22];
            app.NormalizationSchemeListBox_2Label.Text = 'Normalization Scheme';

            % Create NormalizationSchemeListBox_2
            app.NormalizationSchemeListBox_2 = uilistbox(app.OptionsPanel);
            app.NormalizationSchemeListBox_2.Items = {'zscore', 'norm', 'scale', 'range', 'center', 'medianiqr'};
            app.NormalizationSchemeListBox_2.Position = [72 47 100 56];
            app.NormalizationSchemeListBox_2.Value = 'zscore';

            % Create FlipAxesSwitchLabel
            app.FlipAxesSwitchLabel = uilabel(app.SeriesPlotTab);
            app.FlipAxesSwitchLabel.HorizontalAlignment = 'center';
            app.FlipAxesSwitchLabel.Position = [39 458 54 22];
            app.FlipAxesSwitchLabel.Text = 'Flip Axes';

            % Create FlipAxesSwitch
            app.FlipAxesSwitch = uiswitch(app.SeriesPlotTab, 'slider');
            app.FlipAxesSwitch.Position = [43 483 45 20];

            % Create PlotMultiSeriesMeanSwitchLabel
            app.PlotMultiSeriesMeanSwitchLabel = uilabel(app.SeriesPlotTab);
            app.PlotMultiSeriesMeanSwitchLabel.HorizontalAlignment = 'center';
            app.PlotMultiSeriesMeanSwitchLabel.Position = [353 16 126 22];
            app.PlotMultiSeriesMeanSwitchLabel.Text = 'Plot Multi-Series Mean';

            % Create PlotMultiSeriesMeanSwitch
            app.PlotMultiSeriesMeanSwitch = uiswitch(app.SeriesPlotTab, 'slider');
            app.PlotMultiSeriesMeanSwitch.Position = [393 53 45 20];

            % Create SaveResultsButton
            app.SaveResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.SaveResultsButton.ButtonPushedFcn = createCallbackFcn(app, @SaveResultsButtonPushed, true);
            app.SaveResultsButton.FontSize = 14;
            app.SaveResultsButton.Position = [670 13 114 30];
            app.SaveResultsButton.Text = 'Save Results';

            % Create ClearResultsButton
            app.ClearResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.ClearResultsButton.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButtonPushed, true);
            app.ClearResultsButton.FontSize = 14;
            app.ClearResultsButton.FontWeight = 'bold';
            app.ClearResultsButton.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton.Position = [511 13 108 30];
            app.ClearResultsButton.Text = 'Clear Results';

            % Create HOMEButton_2
            app.HOMEButton_2 = uibutton(app.AnalysisCCTFITTab, 'push');
            app.HOMEButton_2.ButtonPushedFcn = createCallbackFcn(app, @HOMEButton_2Pushed, true);
            app.HOMEButton_2.FontSize = 18;
            app.HOMEButton_2.FontWeight = 'bold';
            app.HOMEButton_2.FontColor = [0 0.4471 0.7412];
            app.HOMEButton_2.Position = [930 14 82 30];
            app.HOMEButton_2.Text = 'HOME';

            % Create LoadResultsButton
            app.LoadResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.LoadResultsButton.ButtonPushedFcn = createCallbackFcn(app, @LoadResultsButtonPushed, true);
            app.LoadResultsButton.FontSize = 14;
            app.LoadResultsButton.Position = [792 14 114 30];
            app.LoadResultsButton.Text = 'Load Results';

            % Create AnalysisTimeSeriesMagnitudeCrossSectionTab
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab = uitab(app.TabGroup);
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab.Title = 'Analysis Time Series Magnitude Cross Section';
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab.Tag = 'CrossSection';

            % Create TrimData_2
            app.TrimData_2 = uipanel(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.TrimData_2.Title = 'Select Time Series';
            app.TrimData_2.Position = [15 376 476 295];

            % Create ConditionListBox_2Label
            app.ConditionListBox_2Label = uilabel(app.TrimData_2);
            app.ConditionListBox_2Label.HorizontalAlignment = 'right';
            app.ConditionListBox_2Label.Position = [18 247 55 22];
            app.ConditionListBox_2Label.Text = 'Condition';

            % Create ConditionListBox_2
            app.ConditionListBox_2 = uilistbox(app.TrimData_2);
            app.ConditionListBox_2.Position = [88 209 356 62];

            % Create ExperimentNumberListBox_2Label
            app.ExperimentNumberListBox_2Label = uilabel(app.TrimData_2);
            app.ExperimentNumberListBox_2Label.HorizontalAlignment = 'right';
            app.ExperimentNumberListBox_2Label.Position = [11 148 119 43];
            app.ExperimentNumberListBox_2Label.Text = 'Experiment Number';

            % Create ExperimentNumberListBox_2
            app.ExperimentNumberListBox_2 = uilistbox(app.TrimData_2);
            app.ExperimentNumberListBox_2.Position = [159 140 81 63];

            % Create WellNumberListBox_2Label
            app.WellNumberListBox_2Label = uilabel(app.TrimData_2);
            app.WellNumberListBox_2Label.HorizontalAlignment = 'right';
            app.WellNumberListBox_2Label.Position = [272 164 74 22];
            app.WellNumberListBox_2Label.Text = 'Well Number';

            % Create WellNumberListBox_2
            app.WellNumberListBox_2 = uilistbox(app.TrimData_2);
            app.WellNumberListBox_2.Position = [364 140 80 63];

            % Create ChosenDataTable_2
            app.ChosenDataTable_2 = uitable(app.TrimData_2);
            app.ChosenDataTable_2.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable_2.RowName = {};
            app.ChosenDataTable_2.Position = [28 9 417 85];

            % Create ChooseandPlotButton
            app.ChooseandPlotButton = uibutton(app.TrimData_2, 'push');
            app.ChooseandPlotButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseandPlotButtonPushed, true);
            app.ChooseandPlotButton.FontSize = 14;
            app.ChooseandPlotButton.FontWeight = 'bold';
            app.ChooseandPlotButton.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseandPlotButton.Tooltip = {'Select Data subset to process'};
            app.ChooseandPlotButton.Position = [174 103 146 28];
            app.ChooseandPlotButton.Text = 'Choose and Plot';

            % Create CrossSectionParametersPanel
            app.CrossSectionParametersPanel = uipanel(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.CrossSectionParametersPanel.Title = 'Cross Section Parameters';
            app.CrossSectionParametersPanel.Position = [15 43 478 328];

            % Create OffsetRemovalSwitchLabel
            app.OffsetRemovalSwitchLabel = uilabel(app.CrossSectionParametersPanel);
            app.OffsetRemovalSwitchLabel.HorizontalAlignment = 'center';
            app.OffsetRemovalSwitchLabel.FontSize = 14;
            app.OffsetRemovalSwitchLabel.FontWeight = 'bold';
            app.OffsetRemovalSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OffsetRemovalSwitchLabel.Position = [121 254 107 22];
            app.OffsetRemovalSwitchLabel.Text = 'Offset Removal';

            % Create OffsetRemovalSwitch
            app.OffsetRemovalSwitch = uiswitch(app.CrossSectionParametersPanel, 'slider');
            app.OffsetRemovalSwitch.Position = [151 281 45 20];

            % Create CrossSectionFrequencySliderLabel
            app.CrossSectionFrequencySliderLabel = uilabel(app.CrossSectionParametersPanel);
            app.CrossSectionFrequencySliderLabel.HorizontalAlignment = 'right';
            app.CrossSectionFrequencySliderLabel.FontSize = 18;
            app.CrossSectionFrequencySliderLabel.FontWeight = 'bold';
            app.CrossSectionFrequencySliderLabel.FontColor = [0.4667 0.6745 0.1882];
            app.CrossSectionFrequencySliderLabel.Position = [113 80 224 23];
            app.CrossSectionFrequencySliderLabel.Text = 'Cross Section Frequency';

            % Create CrossSectionFrequencySlider
            app.CrossSectionFrequencySlider = uislider(app.CrossSectionParametersPanel);
            app.CrossSectionFrequencySlider.ValueChangedFcn = createCallbackFcn(app, @CrossSectionFrequencySliderValueChanged, true);
            app.CrossSectionFrequencySlider.ValueChangingFcn = createCallbackFcn(app, @CrossSectionFrequencySliderValueChanging, true);
            app.CrossSectionFrequencySlider.FontColor = [0.4667 0.6745 0.1882];
            app.CrossSectionFrequencySlider.Position = [6 74 449 3];

            % Create HzEditFieldLabel
            app.HzEditFieldLabel = uilabel(app.CrossSectionParametersPanel);
            app.HzEditFieldLabel.HorizontalAlignment = 'right';
            app.HzEditFieldLabel.FontSize = 18;
            app.HzEditFieldLabel.Position = [289 19 27 23];
            app.HzEditFieldLabel.Text = 'Hz';

            % Create HzEditField
            app.HzEditField = uieditfield(app.CrossSectionParametersPanel, 'numeric');
            app.HzEditField.ValueChangedFcn = createCallbackFcn(app, @HzEditFieldValueChanged, true);
            app.HzEditField.FontSize = 18;
            app.HzEditField.Position = [173 5 105 35];

            % Create Panel_2
            app.Panel_2 = uipanel(app.CrossSectionParametersPanel);
            app.Panel_2.Position = [327 133 138 165];

            % Create OverlayTimeSeriesSwitchLabel
            app.OverlayTimeSeriesSwitchLabel = uilabel(app.Panel_2);
            app.OverlayTimeSeriesSwitchLabel.HorizontalAlignment = 'center';
            app.OverlayTimeSeriesSwitchLabel.FontSize = 14;
            app.OverlayTimeSeriesSwitchLabel.FontWeight = 'bold';
            app.OverlayTimeSeriesSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OverlayTimeSeriesSwitchLabel.Position = [0 101 139 22];
            app.OverlayTimeSeriesSwitchLabel.Text = 'Overlay Time Series';

            % Create OverlayTimeSeriesSwitch
            app.OverlayTimeSeriesSwitch = uiswitch(app.Panel_2, 'toggle');
            app.OverlayTimeSeriesSwitch.Orientation = 'horizontal';
            app.OverlayTimeSeriesSwitch.FontWeight = 'bold';
            app.OverlayTimeSeriesSwitch.Position = [31 127 77 34];

            % Create WaterFallSwitchLabel
            app.WaterFallSwitchLabel = uilabel(app.Panel_2);
            app.WaterFallSwitchLabel.HorizontalAlignment = 'center';
            app.WaterFallSwitchLabel.Position = [38 -1 56 22];
            app.WaterFallSwitchLabel.Text = 'WaterFall';

            % Create WaterFallSwitch
            app.WaterFallSwitch = uiswitch(app.Panel_2, 'slider');
            app.WaterFallSwitch.Position = [44 23 45 20];

            % Create PlotMeanSwitchLabel
            app.PlotMeanSwitchLabel = uilabel(app.Panel_2);
            app.PlotMeanSwitchLabel.HorizontalAlignment = 'center';
            app.PlotMeanSwitchLabel.Position = [37 50 59 22];
            app.PlotMeanSwitchLabel.Text = 'Plot Mean';

            % Create PlotMeanSwitch
            app.PlotMeanSwitch = uiswitch(app.Panel_2, 'slider');
            app.PlotMeanSwitch.Position = [44 74 45 20];

            % Create CrossSectionOptions
            app.CrossSectionOptions = uitabgroup(app.CrossSectionParametersPanel);
            app.CrossSectionOptions.Position = [16 106 300 149];

            % Create NormalizationTab_2
            app.NormalizationTab_2 = uitab(app.CrossSectionOptions);
            app.NormalizationTab_2.Title = 'Normalization';

            % Create Panel_3
            app.Panel_3 = uipanel(app.NormalizationTab_2);
            app.Panel_3.Position = [9 9 280 106];

            % Create NormalizeSwitchLabel
            app.NormalizeSwitchLabel = uilabel(app.Panel_3);
            app.NormalizeSwitchLabel.HorizontalAlignment = 'center';
            app.NormalizeSwitchLabel.FontSize = 14;
            app.NormalizeSwitchLabel.FontWeight = 'bold';
            app.NormalizeSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.NormalizeSwitchLabel.Position = [31 83 72 22];
            app.NormalizeSwitchLabel.Text = 'Normalize';

            % Create NormalizeSwitch
            app.NormalizeSwitch = uiswitch(app.Panel_3, 'slider');
            app.NormalizeSwitch.FontWeight = 'bold';
            app.NormalizeSwitch.Position = [31 49 68 30];

            % Create NormalizationSchemeListBox_5Label
            app.NormalizationSchemeListBox_5Label = uilabel(app.Panel_3);
            app.NormalizationSchemeListBox_5Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_5Label.Position = [141 9 126 22];
            app.NormalizationSchemeListBox_5Label.Text = 'Normalization Scheme';

            % Create NormalizationSchemeListBox_5
            app.NormalizationSchemeListBox_5 = uilistbox(app.Panel_3);
            app.NormalizationSchemeListBox_5.Items = {'zscore', 'norm', 'scale', 'range', 'center', 'medianiqr'};
            app.NormalizationSchemeListBox_5.Position = [140 31 131 56];
            app.NormalizationSchemeListBox_5.Value = 'zscore';

            % Create ModulobeforeafternormalizingSwitch
            app.ModulobeforeafternormalizingSwitch = uiswitch(app.Panel_3, 'slider');
            app.ModulobeforeafternormalizingSwitch.Items = {'|Z|', 'Z'};
            app.ModulobeforeafternormalizingSwitch.FontSize = 14;
            app.ModulobeforeafternormalizingSwitch.FontWeight = 'bold';
            app.ModulobeforeafternormalizingSwitch.FontColor = [0.6353 0.0784 0.1843];
            app.ModulobeforeafternormalizingSwitch.Position = [43 10 45 20];
            app.ModulobeforeafternormalizingSwitch.Value = '|Z|';

            % Create OutlierRemovalTab
            app.OutlierRemovalTab = uitab(app.CrossSectionOptions);
            app.OutlierRemovalTab.Title = 'Outlier Removal';

            % Create OutlierRemovalSwitchLabel
            app.OutlierRemovalSwitchLabel = uilabel(app.OutlierRemovalTab);
            app.OutlierRemovalSwitchLabel.HorizontalAlignment = 'center';
            app.OutlierRemovalSwitchLabel.FontSize = 14;
            app.OutlierRemovalSwitchLabel.FontWeight = 'bold';
            app.OutlierRemovalSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OutlierRemovalSwitchLabel.Position = [9 45 112 22];
            app.OutlierRemovalSwitchLabel.Text = 'Outlier Removal';

            % Create OutlierRemovalSwitch
            app.OutlierRemovalSwitch = uiswitch(app.OutlierRemovalTab, 'slider');
            app.OutlierRemovalSwitch.Position = [41 72 45 20];

            % Create DetectionSchemeListBoxLabel
            app.DetectionSchemeListBoxLabel = uilabel(app.OutlierRemovalTab);
            app.DetectionSchemeListBoxLabel.HorizontalAlignment = 'right';
            app.DetectionSchemeListBoxLabel.Position = [164 19 103 22];
            app.DetectionSchemeListBoxLabel.Text = 'Detection Scheme';

            % Create DetectionSchemeListBox
            app.DetectionSchemeListBox = uilistbox(app.OutlierRemovalTab);
            app.DetectionSchemeListBox.Items = {'median', 'mean', 'quartiles', 'grubbs', 'gesd'};
            app.DetectionSchemeListBox.Position = [152 45 131 56];
            app.DetectionSchemeListBox.Value = 'median';

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.TabGroup4.Position = [501 30 501 674];

            % Create PlotsTab_2
            app.PlotsTab_2 = uitab(app.TabGroup4);
            app.PlotsTab_2.Title = 'Plots';

            % Create CSResultsPlot
            app.CSResultsPlot = uiaxes(app.PlotsTab_2);
            title(app.CSResultsPlot, 'Title')
            xlabel(app.CSResultsPlot, 'X')
            ylabel(app.CSResultsPlot, 'Y')
            zlabel(app.CSResultsPlot, 'Z')
            app.CSResultsPlot.Position = [6 279 493 362];

            % Create CSDataPlot
            app.CSDataPlot = uiaxes(app.PlotsTab_2);
            xlabel(app.CSDataPlot, 'X')
            ylabel(app.CSDataPlot, 'Y')
            zlabel(app.CSDataPlot, 'Z')
            app.CSDataPlot.Position = [5 65 493 225];

            % Create LoadDataIntoResultsTableButton
            app.LoadDataIntoResultsTableButton = uibutton(app.PlotsTab_2, 'push');
            app.LoadDataIntoResultsTableButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataIntoResultsTableButtonPushed, true);
            app.LoadDataIntoResultsTableButton.FontSize = 14;
            app.LoadDataIntoResultsTableButton.FontWeight = 'bold';
            app.LoadDataIntoResultsTableButton.FontColor = [0.4667 0.6745 0.1882];
            app.LoadDataIntoResultsTableButton.Position = [154 12 208 42];
            app.LoadDataIntoResultsTableButton.Text = 'Load Data Into Results Table';

            % Create ResultsTab_2
            app.ResultsTab_2 = uitab(app.TabGroup4);
            app.ResultsTab_2.Title = 'Results';

            % Create ResultsTable_2
            app.ResultsTable_2 = uitable(app.ResultsTab_2);
            app.ResultsTable_2.ColumnName = {'CSFreq'; 'Condition'; 'Exp'; 'Well'; 'Time'; 'Mag'; 'Arg'};
            app.ResultsTable_2.RowName = {};
            app.ResultsTable_2.SelectionType = 'row';
            app.ResultsTable_2.Multiselect = 'off';
            app.ResultsTable_2.Position = [16 130 461 509];

            % Create ClearResultsButton_2
            app.ClearResultsButton_2 = uibutton(app.ResultsTab_2, 'push');
            app.ClearResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButton_2Pushed, true);
            app.ClearResultsButton_2.FontSize = 18;
            app.ClearResultsButton_2.FontWeight = 'bold';
            app.ClearResultsButton_2.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton_2.Position = [21 32 156 51];
            app.ClearResultsButton_2.Text = 'Clear Results';

            % Create SaveResultsButton_2
            app.SaveResultsButton_2 = uibutton(app.ResultsTab_2, 'push');
            app.SaveResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @SaveResultsButton_2Pushed, true);
            app.SaveResultsButton_2.FontSize = 18;
            app.SaveResultsButton_2.FontWeight = 'bold';
            app.SaveResultsButton_2.Position = [320 28 156 51];
            app.SaveResultsButton_2.Text = 'Save Results';

            % Create RefreshDataOptionsButton_2
            app.RefreshDataOptionsButton_2 = uibutton(app.AnalysisTimeSeriesMagnitudeCrossSectionTab, 'push');
            app.RefreshDataOptionsButton_2.ButtonPushedFcn = createCallbackFcn(app, @RefreshDataOptionsButton_2Pushed, true);
            app.RefreshDataOptionsButton_2.FontWeight = 'bold';
            app.RefreshDataOptionsButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshDataOptionsButton_2.Position = [173 676 138 27];
            app.RefreshDataOptionsButton_2.Text = 'Refresh Data Options';

            % Create HOMEButton_3
            app.HOMEButton_3 = uibutton(app.AnalysisTimeSeriesMagnitudeCrossSectionTab, 'push');
            app.HOMEButton_3.ButtonPushedFcn = createCallbackFcn(app, @HOMEButton_3Pushed, true);
            app.HOMEButton_3.FontSize = 18;
            app.HOMEButton_3.FontWeight = 'bold';
            app.HOMEButton_3.FontColor = [0 0.4471 0.7412];
            app.HOMEButton_3.Position = [176 5 131 30];
            app.HOMEButton_3.Text = 'HOME';

            % Create AnalysisEstimateTransferFunctionTab
            app.AnalysisEstimateTransferFunctionTab = uitab(app.TabGroup);
            app.AnalysisEstimateTransferFunctionTab.Title = 'Analysis Estimate Transfer Function';
            app.AnalysisEstimateTransferFunctionTab.Tag = 'TransferFnFit';

            % Create TrimData_3
            app.TrimData_3 = uipanel(app.AnalysisEstimateTransferFunctionTab);
            app.TrimData_3.Title = 'Select Data';
            app.TrimData_3.Position = [15 352 476 322];

            % Create ConditionListBox_3Label
            app.ConditionListBox_3Label = uilabel(app.TrimData_3);
            app.ConditionListBox_3Label.HorizontalAlignment = 'right';
            app.ConditionListBox_3Label.Position = [18 254 55 22];
            app.ConditionListBox_3Label.Text = 'Condition';

            % Create ConditionListBox_3
            app.ConditionListBox_3 = uilistbox(app.TrimData_3);
            app.ConditionListBox_3.Position = [88 233 356 65];

            % Create ExperimentNumberListBox_3Label
            app.ExperimentNumberListBox_3Label = uilabel(app.TrimData_3);
            app.ExperimentNumberListBox_3Label.HorizontalAlignment = 'right';
            app.ExperimentNumberListBox_3Label.Position = [5 167 119 43];
            app.ExperimentNumberListBox_3Label.Text = 'Experiment Number';

            % Create ExperimentNumberListBox_3
            app.ExperimentNumberListBox_3 = uilistbox(app.TrimData_3);
            app.ExperimentNumberListBox_3.Position = [136 164 87 58];

            % Create WellNumberListBox_3Label
            app.WellNumberListBox_3Label = uilabel(app.TrimData_3);
            app.WellNumberListBox_3Label.HorizontalAlignment = 'right';
            app.WellNumberListBox_3Label.Position = [49 117 74 22];
            app.WellNumberListBox_3Label.Text = 'Well Number';

            % Create WellNumberListBox_3
            app.WellNumberListBox_3 = uilistbox(app.TrimData_3);
            app.WellNumberListBox_3.Position = [137 101 87 54];

            % Create ChosenDataTable_3
            app.ChosenDataTable_3 = uitable(app.TrimData_3);
            app.ChosenDataTable_3.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable_3.RowName = {};
            app.ChosenDataTable_3.Position = [28 9 417 85];

            % Create ChooseButton_2
            app.ChooseButton_2 = uibutton(app.TrimData_3, 'push');
            app.ChooseButton_2.ButtonPushedFcn = createCallbackFcn(app, @ChooseButton_2Pushed, true);
            app.ChooseButton_2.FontSize = 18;
            app.ChooseButton_2.FontWeight = 'bold';
            app.ChooseButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseButton_2.Tooltip = {'Select the Data subset to be fit'};
            app.ChooseButton_2.Position = [269 113 146 30];
            app.ChooseButton_2.Text = 'Choose';

            % Create TimeListBox_2Label
            app.TimeListBox_2Label = uilabel(app.TrimData_3);
            app.TimeListBox_2Label.HorizontalAlignment = 'right';
            app.TimeListBox_2Label.Position = [260 183 48 22];
            app.TimeListBox_2Label.Text = 'Time';

            % Create TimeListBox_2
            app.TimeListBox_2 = uilistbox(app.TrimData_3);
            app.TimeListBox_2.Position = [323 165 122 57];

            % Create RefreshDataOptionsButton_3
            app.RefreshDataOptionsButton_3 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.RefreshDataOptionsButton_3.ButtonPushedFcn = createCallbackFcn(app, @RefreshDataOptionsButton_3Pushed, true);
            app.RefreshDataOptionsButton_3.FontWeight = 'bold';
            app.RefreshDataOptionsButton_3.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshDataOptionsButton_3.Position = [178 679 138 27];
            app.RefreshDataOptionsButton_3.Text = 'Refresh Data Options';

            % Create estTfResultsTab
            app.estTfResultsTab = uitabgroup(app.AnalysisEstimateTransferFunctionTab);
            app.estTfResultsTab.Position = [501 51 486 623];

            % Create PlotsTab_3
            app.PlotsTab_3 = uitab(app.estTfResultsTab);
            app.PlotsTab_3.Title = 'Plots';

            % Create BodeResults_2
            app.BodeResults_2 = uiaxes(app.PlotsTab_3);
            xlabel(app.BodeResults_2, 'X')
            ylabel(app.BodeResults_2, 'Y')
            zlabel(app.BodeResults_2, 'Z')
            app.BodeResults_2.Position = [1 320 458 280];

            % Create HoldPlotsSwitch_3Label
            app.HoldPlotsSwitch_3Label = uilabel(app.PlotsTab_3);
            app.HoldPlotsSwitch_3Label.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_3Label.FontSize = 14;
            app.HoldPlotsSwitch_3Label.FontWeight = 'bold';
            app.HoldPlotsSwitch_3Label.Position = [5 269 75 22];
            app.HoldPlotsSwitch_3Label.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_3
            app.HoldPlotsSwitch_3 = uiswitch(app.PlotsTab_3, 'toggle');
            app.HoldPlotsSwitch_3.FontSize = 14;
            app.HoldPlotsSwitch_3.Position = [33 204 20 44];

            % Create PlotResultsSelectionButton_2
            app.PlotResultsSelectionButton_2 = uibutton(app.PlotsTab_3, 'push');
            app.PlotResultsSelectionButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotResultsSelectionButton_2Pushed, true);
            app.PlotResultsSelectionButton_2.FontSize = 14;
            app.PlotResultsSelectionButton_2.FontWeight = 'bold';
            app.PlotResultsSelectionButton_2.FontColor = [0.302 0.7451 0.9333];
            app.PlotResultsSelectionButton_2.Position = [5 115 75 60];
            app.PlotResultsSelectionButton_2.Text = {'Plot'; 'Results'; 'Selection'};

            % Create AuxResultsPlots
            app.AuxResultsPlots = uitabgroup(app.PlotsTab_3);
            app.AuxResultsPlots.Position = [84 1 394 319];

            % Create NyquistTab
            app.NyquistTab = uitab(app.AuxResultsPlots);
            app.NyquistTab.Title = 'Nyquist';

            % Create NyqResults_2
            app.NyqResults_2 = uiaxes(app.NyquistTab);
            xlabel(app.NyqResults_2, 'X')
            ylabel(app.NyqResults_2, 'Y')
            zlabel(app.NyqResults_2, 'Z')
            app.NyqResults_2.Position = [30 12 333 278];

            % Create PoleZeroTab
            app.PoleZeroTab = uitab(app.AuxResultsPlots);
            app.PoleZeroTab.Title = 'Pole-Zero';

            % Create PoleZeroPanel
            app.PoleZeroPanel = uipanel(app.PoleZeroTab);
            app.PoleZeroPanel.Position = [1 1 392 295];

            % Create PoleZeroResults
            app.PoleZeroResults = uiaxes(app.PoleZeroPanel);
            xlabel(app.PoleZeroResults, 'X')
            ylabel(app.PoleZeroResults, 'Y')
            zlabel(app.PoleZeroResults, 'Z')
            app.PoleZeroResults.Position = [5 9 378 280];

            % Create ResultsTab_3
            app.ResultsTab_3 = uitab(app.estTfResultsTab);
            app.ResultsTab_3.Title = 'Results';

            % Create ResultsTable_3
            app.ResultsTable_3 = uitable(app.ResultsTab_3);
            app.ResultsTable_3.ColumnName = {'NumPoles'; 'Condition'; 'Exp'; 'Well'; 'Time'; 'FastestPole'; 'Re(FastestPole)'; 'FastestTau'; 'Poles'; 'Zeros'; 'Numerator'; 'Denominator'; 'FitPercent'; 'MSE'; 'AIC'; 'BIC'};
            app.ResultsTable_3.RowName = {};
            app.ResultsTable_3.CellSelectionCallback = createCallbackFcn(app, @ResultsTable_3CellSelection, true);
            app.ResultsTable_3.Position = [11 20 461 570];

            % Create SeriesPlotTab_2
            app.SeriesPlotTab_2 = uitab(app.estTfResultsTab);
            app.SeriesPlotTab_2.Title = 'Series Plot';

            % Create FitSeriesPlot_2
            app.FitSeriesPlot_2 = uiaxes(app.SeriesPlotTab_2);
            xlabel(app.FitSeriesPlot_2, 'X')
            ylabel(app.FitSeriesPlot_2, 'Y')
            zlabel(app.FitSeriesPlot_2, 'Z')
            app.FitSeriesPlot_2.Position = [7 90 470 341];

            % Create PlotFromTableSelectionButton_2
            app.PlotFromTableSelectionButton_2 = uibutton(app.SeriesPlotTab_2, 'push');
            app.PlotFromTableSelectionButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotFromTableSelectionButton_2Pushed, true);
            app.PlotFromTableSelectionButton_2.FontSize = 16;
            app.PlotFromTableSelectionButton_2.FontWeight = 'bold';
            app.PlotFromTableSelectionButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.PlotFromTableSelectionButton_2.Tooltip = {'First highlight two columns in the Results table - clicking ''Plot From Table Selection'' will plot one data series against the other.'};
            app.PlotFromTableSelectionButton_2.Position = [15 478 93 74];
            app.PlotFromTableSelectionButton_2.Text = {'Plot From '; 'Table'; ' Selection'};

            % Create HoldPlotsSwitch_2Label_4
            app.HoldPlotsSwitch_2Label_4 = uilabel(app.SeriesPlotTab_2);
            app.HoldPlotsSwitch_2Label_4.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_2Label_4.Position = [54 17 59 22];
            app.HoldPlotsSwitch_2Label_4.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_FitSeries_2
            app.HoldPlotsSwitch_FitSeries_2 = uiswitch(app.SeriesPlotTab_2, 'toggle');
            app.HoldPlotsSwitch_FitSeries_2.Orientation = 'horizontal';
            app.HoldPlotsSwitch_FitSeries_2.Position = [35 43 97 43];

            % Create FlipAxesSwitch_2Label
            app.FlipAxesSwitch_2Label = uilabel(app.SeriesPlotTab_2);
            app.FlipAxesSwitch_2Label.HorizontalAlignment = 'center';
            app.FlipAxesSwitch_2Label.Position = [231 24 54 22];
            app.FlipAxesSwitch_2Label.Text = 'Flip Axes';

            % Create FlipAxesSwitch_2
            app.FlipAxesSwitch_2 = uiswitch(app.SeriesPlotTab_2, 'slider');
            app.FlipAxesSwitch_2.Position = [235 49 45 20];

            % Create PlotMultiSeriesMeanSwitch_2Label
            app.PlotMultiSeriesMeanSwitch_2Label = uilabel(app.SeriesPlotTab_2);
            app.PlotMultiSeriesMeanSwitch_2Label.HorizontalAlignment = 'center';
            app.PlotMultiSeriesMeanSwitch_2Label.Position = [354 16 126 22];
            app.PlotMultiSeriesMeanSwitch_2Label.Text = 'Plot Multi-Series Mean';

            % Create PlotMultiSeriesMeanSwitch_2
            app.PlotMultiSeriesMeanSwitch_2 = uiswitch(app.SeriesPlotTab_2, 'slider');
            app.PlotMultiSeriesMeanSwitch_2.Position = [393 53 45 20];

            % Create TabGroup6
            app.TabGroup6 = uitabgroup(app.SeriesPlotTab_2);
            app.TabGroup6.Position = [124 436 348 154];

            % Create NormalizationTab
            app.NormalizationTab = uitab(app.TabGroup6);
            app.NormalizationTab.Title = 'Normalization';

            % Create NormalizationSchemeListBox_4
            app.NormalizationSchemeListBox_4 = uilistbox(app.NormalizationTab);
            app.NormalizationSchemeListBox_4.Items = {'zscore', 'norm', 'scale', 'range', 'center', 'medianiqr'};
            app.NormalizationSchemeListBox_4.Position = [185 33 100 89];
            app.NormalizationSchemeListBox_4.Value = 'zscore';

            % Create ZScoreNormalizeLabel_2
            app.ZScoreNormalizeLabel_2 = uilabel(app.NormalizationTab);
            app.ZScoreNormalizeLabel_2.HorizontalAlignment = 'center';
            app.ZScoreNormalizeLabel_2.FontSize = 18;
            app.ZScoreNormalizeLabel_2.FontWeight = 'bold';
            app.ZScoreNormalizeLabel_2.FontColor = [0.4667 0.6745 0.1882];
            app.ZScoreNormalizeLabel_2.Position = [39 30 96 44];
            app.ZScoreNormalizeLabel_2.Text = {''; ' Normalize'};

            % Create ZScoreNormalizeSwitch_FitSeries_2
            app.ZScoreNormalizeSwitch_FitSeries_2 = uiswitch(app.NormalizationTab, 'slider');
            app.ZScoreNormalizeSwitch_FitSeries_2.FontSize = 18;
            app.ZScoreNormalizeSwitch_FitSeries_2.FontWeight = 'bold';
            app.ZScoreNormalizeSwitch_FitSeries_2.Position = [65 66 45 20];

            % Create NormalizationSchemeListBox_4Label
            app.NormalizationSchemeListBox_4Label = uilabel(app.NormalizationTab);
            app.NormalizationSchemeListBox_4Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_4Label.FontWeight = 'bold';
            app.NormalizationSchemeListBox_4Label.Position = [164 7 134 22];
            app.NormalizationSchemeListBox_4Label.Text = 'Normalization Scheme';

            % Create PolePlottingTab
            app.PolePlottingTab = uitab(app.TabGroup6);
            app.PolePlottingTab.Title = 'Pole Plotting';

            % Create SelectPoletoPlotFastesttoSlowestSpinnerLabel
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel = uilabel(app.PolePlottingTab);
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.HorizontalAlignment = 'center';
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.FontWeight = 'bold';
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.Position = [109 16 119 59];
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.Text = {'Select Pole to Plot'; '(Fastest to Slowest)'; 'Assume Consistent'; 'Ordering'};

            % Create SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner = uispinner(app.PolePlottingTab);
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Limits = [1 Inf];
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.FontSize = 24;
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Position = [143 81 58 38];
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Value = 1;

            % Create EnablePolePlottingvsTimeSwitchLabel
            app.EnablePolePlottingvsTimeSwitchLabel = uilabel(app.PolePlottingTab);
            app.EnablePolePlottingvsTimeSwitchLabel.HorizontalAlignment = 'center';
            app.EnablePolePlottingvsTimeSwitchLabel.FontSize = 14;
            app.EnablePolePlottingvsTimeSwitchLabel.FontWeight = 'bold';
            app.EnablePolePlottingvsTimeSwitchLabel.Position = [9 26 91 52];
            app.EnablePolePlottingvsTimeSwitchLabel.Text = {'Enable'; 'Pole Plotting'; '(vs Time)'};

            % Create EnablePolePlottingvsTimeSwitch
            app.EnablePolePlottingvsTimeSwitch = uiswitch(app.PolePlottingTab, 'slider');
            app.EnablePolePlottingvsTimeSwitch.ValueChangedFcn = createCallbackFcn(app, @EnablePolePlottingvsTimeSwitchValueChanged, true);
            app.EnablePolePlottingvsTimeSwitch.Position = [32 87 45 20];

            % Create PlotTypeListBoxLabel
            app.PlotTypeListBoxLabel = uilabel(app.PolePlottingTab);
            app.PlotTypeListBoxLabel.HorizontalAlignment = 'right';
            app.PlotTypeListBoxLabel.FontSize = 14;
            app.PlotTypeListBoxLabel.FontWeight = 'bold';
            app.PlotTypeListBoxLabel.Position = [248 10 67 22];
            app.PlotTypeListBoxLabel.Text = 'Plot Type';

            % Create PlotTypeListBox
            app.PlotTypeListBox = uilistbox(app.PolePlottingTab);
            app.PlotTypeListBox.Items = {'Mag Time Series', 'Nyquist', 'Tau Time Series', 'Real Time Series'};
            app.PlotTypeListBox.FontSize = 14;
            app.PlotTypeListBox.Position = [237 42 106 77];
            app.PlotTypeListBox.Value = 'Mag Time Series';

            % Create TabGroup5
            app.TabGroup5 = uitabgroup(app.AnalysisEstimateTransferFunctionTab);
            app.TabGroup5.Position = [15 73 473 274];

            % Create EstimateTransferFunctionoptionsTab
            app.EstimateTransferFunctionoptionsTab = uitab(app.TabGroup5);
            app.EstimateTransferFunctionoptionsTab.Title = 'Estimate Transfer Function options';

            % Create SystemOrderNumberofPolesSpinnerLabel
            app.SystemOrderNumberofPolesSpinnerLabel = uilabel(app.EstimateTransferFunctionoptionsTab);
            app.SystemOrderNumberofPolesSpinnerLabel.HorizontalAlignment = 'center';
            app.SystemOrderNumberofPolesSpinnerLabel.FontSize = 14;
            app.SystemOrderNumberofPolesSpinnerLabel.FontWeight = 'bold';
            app.SystemOrderNumberofPolesSpinnerLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SystemOrderNumberofPolesSpinnerLabel.Position = [10 162 126 34];
            app.SystemOrderNumberofPolesSpinnerLabel.Text = {'System Order'; '(Number of Poles)'};

            % Create SystemOrderNumberofPolesSpinner
            app.SystemOrderNumberofPolesSpinner = uispinner(app.EstimateTransferFunctionoptionsTab);
            app.SystemOrderNumberofPolesSpinner.Limits = [1 Inf];
            app.SystemOrderNumberofPolesSpinner.FontSize = 36;
            app.SystemOrderNumberofPolesSpinner.Position = [36 200 74 46];
            app.SystemOrderNumberofPolesSpinner.Value = 3;

            % Create NumberofZerosSpinnerLabel
            app.NumberofZerosSpinnerLabel = uilabel(app.EstimateTransferFunctionoptionsTab);
            app.NumberofZerosSpinnerLabel.HorizontalAlignment = 'center';
            app.NumberofZerosSpinnerLabel.FontSize = 14;
            app.NumberofZerosSpinnerLabel.FontWeight = 'bold';
            app.NumberofZerosSpinnerLabel.FontColor = [0.4667 0.6745 0.1882];
            app.NumberofZerosSpinnerLabel.Position = [10 88 117 22];
            app.NumberofZerosSpinnerLabel.Text = 'Number of Zeros';

            % Create NumberofZerosSpinner
            app.NumberofZerosSpinner = uispinner(app.EstimateTransferFunctionoptionsTab);
            app.NumberofZerosSpinner.Limits = [0 Inf];
            app.NumberofZerosSpinner.FontSize = 18;
            app.NumberofZerosSpinner.Position = [47 118 51 28];
            app.NumberofZerosSpinner.Value = 3;

            % Create AuxillaryOptionsPanel
            app.AuxillaryOptionsPanel = uipanel(app.EstimateTransferFunctionoptionsTab);
            app.AuxillaryOptionsPanel.Title = 'Auxillary Options';
            app.AuxillaryOptionsPanel.Position = [162 9 316 228];

            % Create MaxiterationsEditFieldLabel
            app.MaxiterationsEditFieldLabel = uilabel(app.AuxillaryOptionsPanel);
            app.MaxiterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxiterationsEditFieldLabel.FontSize = 18;
            app.MaxiterationsEditFieldLabel.FontWeight = 'bold';
            app.MaxiterationsEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.MaxiterationsEditFieldLabel.Position = [19 174 126 23];
            app.MaxiterationsEditFieldLabel.Text = 'Max iterations';

            % Create MaxiterationsEditField
            app.MaxiterationsEditField = uieditfield(app.AuxillaryOptionsPanel, 'numeric');
            app.MaxiterationsEditField.Limits = [0 Inf];
            app.MaxiterationsEditField.ValueDisplayFormat = '%.0f';
            app.MaxiterationsEditField.FontSize = 24;
            app.MaxiterationsEditField.Position = [159 169 100 32];
            app.MaxiterationsEditField.Value = 10000;

            % Create WeightingFilterListBoxLabel
            app.WeightingFilterListBoxLabel = uilabel(app.AuxillaryOptionsPanel);
            app.WeightingFilterListBoxLabel.HorizontalAlignment = 'right';
            app.WeightingFilterListBoxLabel.FontSize = 14;
            app.WeightingFilterListBoxLabel.FontWeight = 'bold';
            app.WeightingFilterListBoxLabel.Position = [20 137 111 22];
            app.WeightingFilterListBoxLabel.Text = 'Weighting Filter';

            % Create WeightingFilterListBox
            app.WeightingFilterListBox = uilistbox(app.AuxillaryOptionsPanel);
            app.WeightingFilterListBox.Items = {'inv', 'invsqrt', 'None'};
            app.WeightingFilterListBox.FontSize = 14;
            app.WeightingFilterListBox.Position = [146 95 100 66];
            app.WeightingFilterListBox.Value = 'inv';

            % Create SearchMethodListBoxLabel
            app.SearchMethodListBoxLabel = uilabel(app.AuxillaryOptionsPanel);
            app.SearchMethodListBoxLabel.HorizontalAlignment = 'right';
            app.SearchMethodListBoxLabel.FontSize = 14;
            app.SearchMethodListBoxLabel.FontWeight = 'bold';
            app.SearchMethodListBoxLabel.Position = [26 63 105 22];
            app.SearchMethodListBoxLabel.Text = 'Search Method';

            % Create SearchMethodListBox
            app.SearchMethodListBox = uilistbox(app.AuxillaryOptionsPanel);
            app.SearchMethodListBox.Items = {'auto', 'gn', 'gna', 'lm', 'lsqnonlin', 'fmincon'};
            app.SearchMethodListBox.FontSize = 14;
            app.SearchMethodListBox.Position = [146 13 100 74];
            app.SearchMethodListBox.Value = 'auto';

            % Create AutoNumberofZerosSwitchLabel
            app.AutoNumberofZerosSwitchLabel = uilabel(app.EstimateTransferFunctionoptionsTab);
            app.AutoNumberofZerosSwitchLabel.HorizontalAlignment = 'center';
            app.AutoNumberofZerosSwitchLabel.FontWeight = 'bold';
            app.AutoNumberofZerosSwitchLabel.Position = [30 16 81 30];
            app.AutoNumberofZerosSwitchLabel.Text = {'Auto Number'; 'of Zeros'};

            % Create AutoNumberofZerosSwitch
            app.AutoNumberofZerosSwitch = uiswitch(app.EstimateTransferFunctionoptionsTab, 'slider');
            app.AutoNumberofZerosSwitch.ValueChangedFcn = createCallbackFcn(app, @AutoNumberofZerosSwitchValueChanged, true);
            app.AutoNumberofZerosSwitch.Position = [46 56 45 20];

            % Create SaveResultsButton_3
            app.SaveResultsButton_3 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.SaveResultsButton_3.ButtonPushedFcn = createCallbackFcn(app, @SaveResultsButton_3Pushed, true);
            app.SaveResultsButton_3.FontSize = 14;
            app.SaveResultsButton_3.Position = [670 13 114 30];
            app.SaveResultsButton_3.Text = 'Save Results';

            % Create ClearResultsButton_3
            app.ClearResultsButton_3 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.ClearResultsButton_3.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButton_3Pushed, true);
            app.ClearResultsButton_3.FontSize = 14;
            app.ClearResultsButton_3.FontWeight = 'bold';
            app.ClearResultsButton_3.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton_3.Position = [511 13 108 30];
            app.ClearResultsButton_3.Text = 'Clear Results';

            % Create HOMEButton_4
            app.HOMEButton_4 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.HOMEButton_4.ButtonPushedFcn = createCallbackFcn(app, @HOMEButton_4Pushed, true);
            app.HOMEButton_4.FontSize = 18;
            app.HOMEButton_4.FontWeight = 'bold';
            app.HOMEButton_4.FontColor = [0 0.4471 0.7412];
            app.HOMEButton_4.Position = [930 14 82 30];
            app.HOMEButton_4.Text = 'HOME';

            % Create LoadResultsButton_2
            app.LoadResultsButton_2 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.LoadResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @LoadResultsButton_2Pushed, true);
            app.LoadResultsButton_2.FontSize = 14;
            app.LoadResultsButton_2.Position = [792 14 114 30];
            app.LoadResultsButton_2.Text = 'Load Results';

            % Create GoButton_2
            app.GoButton_2 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.GoButton_2.ButtonPushedFcn = createCallbackFcn(app, @GoButton_2Pushed, true);
            app.GoButton_2.FontSize = 24;
            app.GoButton_2.FontWeight = 'bold';
            app.GoButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.GoButton_2.Position = [180 16 123 38];
            app.GoButton_2.Text = 'Go!';

            % Create ProgressGuage_2
            app.ProgressGuage_2 = uigauge(app.AnalysisEstimateTransferFunctionTab, 'semicircular');
            app.ProgressGuage_2.FontSize = 9;
            app.ProgressGuage_2.Position = [46 12 100 54];

            % Create RunningLamp_2Label
            app.RunningLamp_2Label = uilabel(app.AnalysisEstimateTransferFunctionTab);
            app.RunningLamp_2Label.HorizontalAlignment = 'right';
            app.RunningLamp_2Label.FontSize = 14;
            app.RunningLamp_2Label.FontWeight = 'bold';
            app.RunningLamp_2Label.Position = [354 23 62 22];
            app.RunningLamp_2Label.Text = 'Running';

            % Create RunningLamp_2
            app.RunningLamp_2 = uilamp(app.AnalysisEstimateTransferFunctionTab);
            app.RunningLamp_2.Position = [426 16 35 35];
            app.RunningLamp_2.Color = [1 0 0];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = AnalyZe

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end

