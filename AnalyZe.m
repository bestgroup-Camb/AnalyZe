
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
        AnalyZeMenu                     matlab.ui.container.Menu
        NavigatetoHomePageMenu          matlab.ui.container.Menu
        CloseApplicationMenu            matlab.ui.container.Menu
        QuitMATLABMenu                  matlab.ui.container.Menu
        ForceQuitMATLABMenu             matlab.ui.container.Menu
        DataMenu                        matlab.ui.container.Menu
        ImportDataMenu                  matlab.ui.container.Menu
        ClearAllDataMenu                matlab.ui.container.Menu
        DumpDataToMATLABWorkspaceMenu   matlab.ui.container.Menu
        ImpedanceDataMenu               matlab.ui.container.Menu
        CircuitFitResultsMenu           matlab.ui.container.Menu
        TrasferFnFitResultsMenu         matlab.ui.container.Menu
        VisualizeDataMenu               matlab.ui.container.Menu
        SaveFigureMenu_2                matlab.ui.container.Menu
        ToolboxMenu                     matlab.ui.container.Menu
        CircuitFittingMenu              matlab.ui.container.Menu
        FitaCircuitMenu                 matlab.ui.container.Menu
        SaveMenu                        matlab.ui.container.Menu
        ResultsMenu                     matlab.ui.container.Menu
        FigureMenu                      matlab.ui.container.Menu
        TimeSeriesMagnitudeCrossSectionMenu  matlab.ui.container.Menu
        ExamineMagCrossSectionMenu      matlab.ui.container.Menu
        SaveMenu_3                      matlab.ui.container.Menu
        LoadDisplayedDataintoTableMenu  matlab.ui.container.Menu
        SaveDatainTableMenu             matlab.ui.container.Menu
        SaveFigureMenu                  matlab.ui.container.Menu
        TransferFunctionEstimationMenu  matlab.ui.container.Menu
        FitLaplaceTransferFunctionsMenu  matlab.ui.container.Menu
        SaveMenu_2                      matlab.ui.container.Menu
        ResultsMenu_2                   matlab.ui.container.Menu
        FigureMenu_2                    matlab.ui.container.Menu
        HelpMenu                        matlab.ui.container.Menu
        ToggleExplainerPopupsMenu       matlab.ui.container.Menu
        GithubRepositoryMenu            matlab.ui.container.Menu
        RaiseNewGithubIssueMenu         matlab.ui.container.Menu
        TabGroup                        matlab.ui.container.TabGroup
        HomeTab                         matlab.ui.container.Tab
        VisualizeDataButton             matlab.ui.control.Button
        Image5                          matlab.ui.control.Image
        Hyperlink                       matlab.ui.control.Hyperlink
        ExplainerModeSwitch             matlab.ui.control.Switch
        ExplainerModeSwitchLabel        matlab.ui.control.Label
        FitTransferFunctionButton       matlab.ui.control.Button
        TimeSeriesMagnitudeCrossSectionButton  matlab.ui.control.Button
        FitEquivalentCircuitButton      matlab.ui.control.Button
        ImportDataButton                matlab.ui.control.Button
        DouglasvanNiekerkVersion5March2024Label  matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        BioImpedanceDataAnalysisToolLabel  matlab.ui.control.Label
        AnalyZeLabel                    matlab.ui.control.Label
        Image2                          matlab.ui.control.Image
        Image2_2                        matlab.ui.control.Image
        InportDataTab                   matlab.ui.container.Tab
        OrLabel                         matlab.ui.control.Label
        PlotSelectedButton              matlab.ui.control.Button
        CLEARLASTDATAPOINTButton        matlab.ui.control.Button
        CLEARALLDATAButton              matlab.ui.control.Button
        SaveDataForLaterButton          matlab.ui.control.Button
        LoadFromPreviousSaveButton      matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        LoadDataPanel                   matlab.ui.container.Panel
        ThenLabel                       matlab.ui.control.Label
        FirstLabel                      matlab.ui.control.Label
        AutoIncrementTimePointperfileSwitch  matlab.ui.control.Switch
        AutoIncrementTimePointperfileLabel  matlab.ui.control.Label
        FileFinderTab                   matlab.ui.container.TabGroup
        ImportUtilitiesTab              matlab.ui.container.Tab
        DropDown                        matlab.ui.control.DropDown
        ModifythedataimportworkflowusingvariedutilitiesLabel  matlab.ui.control.Label
        FileSUBTRINGFilterTab           matlab.ui.container.Tab
        FilterFilenamesbyLabel          matlab.ui.control.Label
        SubstringLabel                  matlab.ui.control.Label
        KnobSubtringFilter              matlab.ui.control.DiscreteKnob
        FindFilesSubtringFilter         matlab.ui.control.EditField
        MultiSelectTab                  matlab.ui.container.Tab
        SelectMultipleFilesandautoincrementafieldperfileLabel  matlab.ui.control.Label
        KnobMultiSelect                 matlab.ui.control.DiscreteKnob
        AlternativeFileFormatTab        matlab.ui.container.Tab
        CsvOrSpreadsheetSwitch          matlab.ui.control.RockerSwitch
        RowdatastartsonSpinner          matlab.ui.control.Spinner
        RowdatastartsonSpinnerLabel     matlab.ui.control.Label
        SpecifytargetfilecolumnorderLabel  matlab.ui.control.Label
        ArbFileFormatSpecTable          matlab.ui.control.Table
        ArbFileFormatSwitch             matlab.ui.control.Switch
        MultisheetSpreadhseetTab        matlab.ui.container.Tab
        ReaddatafromspreadsheetincrementingLabel  matlab.ui.control.Label
        KnobMultiSelect_SpreadsheetMultisheet  matlab.ui.control.DiscreteKnob
        HoldPlotSwitchLoad              matlab.ui.control.ToggleSwitch
        HoldPlotSwitchLabel             matlab.ui.control.Label
        WellNumberEditField             matlab.ui.control.EditField
        ExperimentNumberEditField       matlab.ui.control.NumericEditField
        ExperimentNumberEditFieldLabel  matlab.ui.control.Label
        WellNumberEditFieldLabel        matlab.ui.control.Label
        LOADButton                      matlab.ui.control.Button
        FindFileButton                  matlab.ui.control.Button
        OrEnterFilePathEditField        matlab.ui.control.EditField
        OrEnterFilePathEditFieldLabel   matlab.ui.control.Label
        TimePointAUEditField            matlab.ui.control.NumericEditField
        ConditionEditField              matlab.ui.control.EditField
        ConditionEditFieldLabel         matlab.ui.control.Label
        TimePointAUEditFieldLabel       matlab.ui.control.Label
        LoadEISDat                      matlab.ui.control.UIAxes
        VisualizeDataTab                matlab.ui.container.Tab
        SaveFigureButton_4              matlab.ui.control.Button
        HoldReleaseButton               matlab.ui.control.StateButton
        PlotButton                      matlab.ui.control.Button
        VizDataPlotParamsTabGroup       matlab.ui.container.TabGroup
        PlotTypeTab                     matlab.ui.container.Tab
        DimsSwitch_2                    matlab.ui.control.Switch
        BodeTypeLabel                   matlab.ui.control.Label
        BodeTypeSwitch                  matlab.ui.control.Switch
        IndependentVariableKnob         matlab.ui.control.DiscreteKnob
        IndependentVariableKnobLabel    matlab.ui.control.Label
        DimsSwitchLabel                 matlab.ui.control.Label
        DimsSwitch                      matlab.ui.control.Switch
        PlotTypeSwitch                  matlab.ui.control.Switch
        PlotTypeSwitchLabel             matlab.ui.control.Label
        ModifyPlotTab                   matlab.ui.container.Tab
        SurfaceTypeDropDown             matlab.ui.control.DropDown
        SurfaceTypeLabel                matlab.ui.control.Label
        ymaxEditField                   matlab.ui.control.NumericEditField
        ymaxEditFieldLabel              matlab.ui.control.Label
        ReZLabel                        matlab.ui.control.Label
        OffsetAlignSwitch               matlab.ui.control.Switch
        LegendSwitchLabel               matlab.ui.control.Label
        LegendSwitch                    matlab.ui.control.Switch
        SurfaceColourDropDown           matlab.ui.control.DropDown
        SurfaceColourDropDownLabel      matlab.ui.control.Label
        SpecifyPlotLimitsSwitchLabel    matlab.ui.control.Label
        SpecifyPlotLimitsSwitch         matlab.ui.control.Switch
        zminEditField                   matlab.ui.control.NumericEditField
        zminEditFieldLabel              matlab.ui.control.Label
        yminEditField                   matlab.ui.control.NumericEditField
        yminEditFieldLabel              matlab.ui.control.Label
        zmaxEditField                   matlab.ui.control.NumericEditField
        zmaxEditFieldLabel              matlab.ui.control.Label
        OffsetEditField                 matlab.ui.control.NumericEditField
        OffsetEditFieldLabel            matlab.ui.control.Label
        xmaxEditField                   matlab.ui.control.NumericEditField
        xmaxEditFieldLabel              matlab.ui.control.Label
        xminEditField                   matlab.ui.control.NumericEditField
        xminEditFieldLabel              matlab.ui.control.Label
        TrimData_4                      matlab.ui.container.Panel
        RefreshData_4                   matlab.ui.control.Button
        TimeListBox_3                   matlab.ui.control.ListBox
        TimeListBox_3Label              matlab.ui.control.Label
        ChooseButton_3                  matlab.ui.control.Button
        ChosenDataTable_4               matlab.ui.control.Table
        WellNumberListBox_4             matlab.ui.control.ListBox
        WellNumberLabel                 matlab.ui.control.Label
        ExperimentNumberListBox_4       matlab.ui.control.ListBox
        ExperimentNumberLabel           matlab.ui.control.Label
        ConditionListBox_4              matlab.ui.control.ListBox
        ConditionListBox_4Label         matlab.ui.control.Label
        VisualiseDataAxes               matlab.ui.control.UIAxes
        AnalysisCCTFITTab               matlab.ui.container.Tab
        SaveFigureButton                matlab.ui.control.Button
        LoadResultsButton               matlab.ui.control.Button
        ClearResultsButton              matlab.ui.control.Button
        SaveResultsButton               matlab.ui.control.Button
        TabGroup2                       matlab.ui.container.TabGroup
        PlotsTab                        matlab.ui.container.Tab
        PlotAndExportZSwitch            matlab.ui.control.RockerSwitch
        AuxCCTFitResults                matlab.ui.container.TabGroup
        Nyquist                         matlab.ui.container.Tab
        NyqResults                      matlab.ui.control.UIAxes
        ProblemSetuplogTab              matlab.ui.container.Tab
        CCTFitProblemLog                matlab.ui.control.TextArea
        RecursiveTimeReg                matlab.ui.container.Tab
        RecursiveTimeRegLogSwitch_2     matlab.ui.control.Switch
        RecursiveTimeRegLogSwitch       matlab.ui.control.Switch
        RecursiveTimeRegPlot            matlab.ui.control.UIAxes
        PlotResultsfromTableSelectionButton  matlab.ui.control.Button
        HoldPlotsSwitch                 matlab.ui.control.ToggleSwitch
        HoldPlotsSwitchLabel            matlab.ui.control.Label
        BodeResults                     matlab.ui.control.UIAxes
        ResultsTab                      matlab.ui.container.Tab
        PlotAndExportZSwitch_2          matlab.ui.control.RockerSwitch
        PlotResultsfromTableSelectionButton_2  matlab.ui.control.Button
        AutoMarkButton                  matlab.ui.control.Button
        ResultsTable                    matlab.ui.control.Table
        FitDiagnosticTab                matlab.ui.container.Tab
        LabelPlotsSwitch                matlab.ui.control.Switch
        LabelPlotsSwitchLabel           matlab.ui.control.Label
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
        RefreshPlotButton_2             matlab.ui.control.Button
        LabelDataSeriesSwitch           matlab.ui.control.Switch
        LabelDataSeriesSwitchLabel      matlab.ui.control.Label
        SeriesPlotcctFitTabGroup        matlab.ui.container.TabGroup
        NormalizationTab_3              matlab.ui.container.Tab
        NormOptionListBox               matlab.ui.control.ListBox
        NormOptionLabel                 matlab.ui.control.Label
        NormalizationSchemeListBox_6    matlab.ui.control.ListBox
        NormalizationSchemeListBox_6Label  matlab.ui.control.Label
        AreaNormalizeSwitch             matlab.ui.control.Switch
        AreaNormalizeSwitchLabel        matlab.ui.control.Label
        Areacm2EditField                matlab.ui.control.NumericEditField
        Areacm2EditFieldLabel           matlab.ui.control.Label
        ZScoreNormalizeSwitch_FitSeries_3  matlab.ui.control.Switch
        ZScoreNormalizeLabel_3          matlab.ui.control.Label
        SwitchAreaNormType              matlab.ui.control.Switch
        OutlierRemovalTab_2             matlab.ui.container.Tab
        DetectionSchemeListBox_2        matlab.ui.control.ListBox
        DetectionSchemeListBox_2Label   matlab.ui.control.Label
        OutlierRemovalSwitch_2          matlab.ui.control.Switch
        OutlierRemovalSwitch_2Label     matlab.ui.control.Label
        ResampleTab_2                   matlab.ui.container.Tab
        qEditField_2                    matlab.ui.control.NumericEditField
        qEditField_2Label               matlab.ui.control.Label
        pEditField_2                    matlab.ui.control.NumericEditField
        pEditField_2Label               matlab.ui.control.Label
        Label_2                         matlab.ui.control.Label
        ResampleFrequencyEditField_2    matlab.ui.control.NumericEditField
        ResampleFrequencyEditField_2Label  matlab.ui.control.Label
        ResampleSwitch_2                matlab.ui.control.Switch
        ResampleSwitch_2Label           matlab.ui.control.Label
        ResampleFactorLabel_2           matlab.ui.control.Label
        PlotMultiSeriesMeanSwitch       matlab.ui.control.Switch
        PlotMultiSeriesMeanSwitchLabel  matlab.ui.control.Label
        FlipAxesSwitch                  matlab.ui.control.Switch
        FlipAxesSwitchLabel             matlab.ui.control.Label
        HoldPlotsSwitch_FitSeries       matlab.ui.control.ToggleSwitch
        HoldPlotsSwitch_2Label_2        matlab.ui.control.Label
        PlotFromTableSelectionButton    matlab.ui.control.Button
        FitSeriesPlot                   matlab.ui.control.UIAxes
        FittingParams                   matlab.ui.container.Panel
        AbortButton                     matlab.ui.control.StateButton
        CCTFitOptionsTabGroup           matlab.ui.container.TabGroup
        HyperparamsTab                  matlab.ui.container.Tab
        DropDown_2                      matlab.ui.control.DropDown
        Label_4                         matlab.ui.control.Label
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
        BlankFitIterationsEditField     matlab.ui.control.NumericEditField
        BlankFitIterationsEditFieldLabel  matlab.ui.control.Label
        RecursiveTimeRegularizationTab  matlab.ui.container.Tab
        RegSchemeListBox                matlab.ui.control.ListBox
        RegSchemeListBoxLabel           matlab.ui.control.Label
        NumIterationsSpinner            matlab.ui.control.Spinner
        NumIterationsSpinnerLabel       matlab.ui.control.Label
        LambdaEditField                 matlab.ui.control.NumericEditField
        LambdaEditFieldLabel            matlab.ui.control.Label
        RecursiveTimeRegularizationSwitch  matlab.ui.control.Switch
        RecursiveTimeRegularizationLabel  matlab.ui.control.Label
        ErrorCorrectionTab              matlab.ui.container.Tab
        ParamMaxValsLabel               matlab.ui.control.Label
        FixedFreeParams                 matlab.ui.control.RockerSwitch
        MaxParamErrValsEditField        matlab.ui.control.EditField
        ZmeasuredZtrueEditField         matlab.ui.control.EditField
        ZmeasuredZtrueEditFieldLabel    matlab.ui.control.Label
        ErrorCorrectionSwitch           matlab.ui.control.Switch
        ErrorCorrectionLabel            matlab.ui.control.Label
        ProgressGuage                   matlab.ui.control.SemicircularGauge
        CircuitToFit                    matlab.ui.container.TabGroup
        EquivalentCircuitTab            matlab.ui.container.Tab
        DropDown_3                      matlab.ui.control.DropDown
        MoreInfoCCTFitButton            matlab.ui.control.Button
        Label_3                         matlab.ui.control.Label
        Image4                          matlab.ui.control.Image
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
        SelectACircuitTab               matlab.ui.container.Tab
        ParallelConnectionLabel         matlab.ui.control.Label
        SeriesConnectionLabel           matlab.ui.control.Label
        WWarburgElementLabel            matlab.ui.control.Label
        QConstantPhaseElementLabel      matlab.ui.control.Label
        CCapacitanceLabel               matlab.ui.control.Label
        RResistanceLabel                matlab.ui.control.Label
        SelectaCircuitModelBarrierInclusiveListBox  matlab.ui.control.ListBox
        SelectaCircuitModelBarrierInclusiveListBoxLabel  matlab.ui.control.Label
        BuildACircuitTab                matlab.ui.container.Tab
        IncludeBarrierSwitch            matlab.ui.control.Switch
        IncludeBarrierSwitchLabel       matlab.ui.control.Label
        CircuitBuilderTable             matlab.ui.control.Table
        BuildACircuitMaxValuesTab       matlab.ui.container.Tab
        CircuitBuilderTable_MaxVals     matlab.ui.control.Table
        Tab                             matlab.ui.container.Tab
        RunningLamp                     matlab.ui.control.Lamp
        RunningLampLabel                matlab.ui.control.Label
        GoButton                        matlab.ui.control.Button
        GlobalOptimizationIterationsEditField  matlab.ui.control.NumericEditField
        GlobalOptimizationIterationsLabel  matlab.ui.control.Label
        TrimData                        matlab.ui.container.Panel
        RefreshData                     matlab.ui.control.Button
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
        SaveFigureButton_2              matlab.ui.control.Button
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
        RefreshPlotButton               matlab.ui.control.Button
        CrossSectionOptions             matlab.ui.container.TabGroup
        NormalizationTab_2              matlab.ui.container.Tab
        Panel_3                         matlab.ui.container.Panel
        NormOptionListBox_2             matlab.ui.control.ListBox
        NormOptionListBox_2Label        matlab.ui.control.Label
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
        ResampleTab                     matlab.ui.container.Tab
        IntermediateResampleFactorLabel  matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        qEditField                      matlab.ui.control.NumericEditField
        qEditFieldLabel                 matlab.ui.control.Label
        pEditField                      matlab.ui.control.NumericEditField
        pEditFieldLabel                 matlab.ui.control.Label
        FinalResampleFrequencyEditField  matlab.ui.control.NumericEditField
        FinalResampleFrequencyEditFieldLabel  matlab.ui.control.Label
        ResampleSwitch                  matlab.ui.control.Switch
        ResampleSwitchLabel             matlab.ui.control.Label
        ClipTimeVectorTab               matlab.ui.container.Tab
        NumTailValuesToClipSpinner      matlab.ui.control.Spinner
        NumTailValuesToClipSpinnerLabel  matlab.ui.control.Label
        NumStartValuesToClipSpinner     matlab.ui.control.Spinner
        NumStartValuesToClipSpinnerLabel  matlab.ui.control.Label
        ClipTimeVectorSwitch            matlab.ui.control.Switch
        ClipTimeVectorSwitchLabel       matlab.ui.control.Label
        Panel_2                         matlab.ui.container.Panel
        ResetAccumulatorButton          matlab.ui.control.Button
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
        RefreshData_2                   matlab.ui.control.Button
        ChooseandPlotButton             matlab.ui.control.Button
        ChosenDataTable_2               matlab.ui.control.Table
        WellNumberListBox_2             matlab.ui.control.ListBox
        WellNumberListBox_2Label        matlab.ui.control.Label
        ExperimentNumberListBox_2       matlab.ui.control.ListBox
        ExperimentNumberListBox_2Label  matlab.ui.control.Label
        ConditionListBox_2              matlab.ui.control.ListBox
        ConditionListBox_2Label         matlab.ui.control.Label
        AnalysisEstimateTransferFunctionTab  matlab.ui.container.Tab
        SaveFigureButton_3              matlab.ui.control.Button
        RunningLamp_2                   matlab.ui.control.Lamp
        RunningLamp_2Label              matlab.ui.control.Label
        ProgressGuage_2                 matlab.ui.control.SemicircularGauge
        GoButton_2                      matlab.ui.control.Button
        LoadResultsButton_2             matlab.ui.control.Button
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
        RefreshPlotButton_3             matlab.ui.control.Button
        TabGroup6                       matlab.ui.container.TabGroup
        NormalizationTab                matlab.ui.container.Tab
        NormalizationOptionListBox      matlab.ui.control.ListBox
        NormalizationOptionListBoxLabel  matlab.ui.control.Label
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
        TrimData_3                      matlab.ui.container.Panel
        RefreshData_3                   matlab.ui.control.Button
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
        CurrentFileName = {} % Description
        DatToFit % Description
        DatToCrossSection % Description
         % Description
        Pax % Description
        
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
        CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});% Description
        CrossSectionIndex = NaN; % Description
        ChosenFreq = NaN % Description
        CS_xline % Description
        CrossSectionResultsLoaded = struct('CSFreq',{},'Name',{'Start'},'ExperimentNumber',{-1},'Well',{'A0'},'Time',{-1},'Mod',{-1},'Arg',{-1});
        ResultTableCellsSelected = NaN; % Description
        FitDiagnosticQQColourCounter = 1; % Description
        KDensityFits_ColourMapCounter = 1;
        cct_builder_init = [' ',' ','W','R',' ',' ';' ','R',' ',' ',' ',' ';' ',' ','C',' ',' ',' '];
        cct_builder_MaxVals_init =  [0,0,1,1e6,0,0;0,1000,0,0,0,0;0,0,1,0,0,0];
        WaitForInput = false; % Description
        Rinfty = 0;
        DataTableRowSelected = 1; % Description
        CumulativeCCTfitSeriesPlot; % Description
        CumulativeCCTfitSeriesDomainPlot;
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
        BetaRecursiveSeries = struct('Rb',[],'Cb',[]); % Description
        FitsResultsTableMarkings = {}; % Description
        CumulativeCCTFitDisplayNames; % Description
        CumulativeCCTFitDiagnosticDisplayNames = []; % Description
        CustomElementFunctions = {}; % Description
        MultiFileSelectAutoIncrementArray = {}; % Description
        MultiFileSelectAutoIncrementLastInput = [];
        AutoFileTimeIncrementArray = {};
        AutoFileTimeIncremementPosition = 0;
        csv_file_arbitrary_format_init = [-1,-1,-1,-1,-1,-1,-1,-1];
        DatToViz;
    end
    
    methods (Access = private)
        
        
        function out = MultistartFit(app, y_z,freq,multi_starts,cct_type,sequential_Fit,blank_fit, recursive_regression, varargin)
            %MultistartFit Equivalent Circuit regression using multistart
            %global optimization
            %   Given the supplied form the the equivalent circuit, perform
            %   nonlinear regression to estimate the circuit model
            %   parameters; the function handles auxillary fitting
            %   procedures such as sequential fitting, recursive
            %   regularization, series reistance estimation and the
            %   multistart global optimization.
            % Variable Arguments:
            %        1           y_z_blank
            %        2           multi_starts_blank
            %        3           UpperBounds
            %        4           LowerBounds
            %        5           Beta Zero
            %        6           Recursive settings - R.Lambda,
            %                                         R.NumIterations
            %                                         R.CurrentIteration
            %                                         R.CurrentTimePoint
            %                                         R.TimeVector
                    
                    %% Sequential Fitting
                    
                        Blank_Fits = [];
                        if (sequential_Fit)
                                
                            y_z_blank = varargin{1};
                            multi_starts_blank = varargin{2};
                            
                            selectedTab = app.CircuitToFit.SelectedTab;
                            if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.CircuitBuilderTable_MaxVals)
                               

                                Blank_Fits = app.MultistartFit(y_z_blank,...
                                                        freq,...
                                                        multi_starts_blank,...
                                                        cct_type,...
                                                        false,... %sequetial fit
                                                        true,... %blank fit
                                                        false,... %recursive regression fit
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
                                                        true,... %blank fit
                                                        false... %recursive regression
                                                        ); 
                            end
                           
            
                            Blank_beta = Blank_Fits{1};
                        end
                        
            
                        %% Fit data setup
                            %% R_inf estimate
                           
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
                                            try
                                                local_min = islocalmin(nI,'SamplePoints',R);
                                            catch
                                                local_min = islocalmin(nI);
                                            end
                                            local_min_locs = find(local_min==true);            
                                            First_min = local_min_locs(1);
                                
                                            R_inf = real(y_z(First_min));

                                    end
                                
                                case 'Re(Z)_final'
                                    R_inf = real(y_z(1));
                            end

                            %% Circuit function definition
                                %Eval custom fns
                                    for fns = 1:length(app.CustomElementFunctions)
                                        Customfn = app.CustomElementFunctions{fns};
                                        eval(Customfn{1})
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
                    
               %%% Error Correction

                    ErrCorrParams = [];
                    value = app.ErrorCorrectionSwitch.Value;
                    switch value
                        case 'On'

                            valueFixedParams = app.FixedFreeParams.Value;
                            switch valueFixedParams
                                case 'Free Params'
                                    CCT_Fn_Chosen = CCT_Fn;
                                    NumParams = length(beta0);
                                    CorrectionStr = app.ZmeasuredZtrueEditField.Value;
                                    CorrectionMaxValStr = app.MaxParamErrValsEditField.Value;
                                    CorrectionMaxValsStr =['[',CorrectionMaxValStr,']'];
                                    CorrectionMaxVals = eval(CorrectionMaxValsStr);
                                    NumNewParams = length(CorrectionMaxVals);
                                    for param = 1:NumNewParams
                                        expression = ['b(',int2str(param)];
                                        NewExpression = ['b(',int2str(NumParams+param)];
                                        CorrectionStr = regexprep(CorrectionStr,expression,NewExpression);
                                        
                                        ub = [ub;CorrectionMaxVals(param)];
                                        lb = [lb;0];
                                        beta0 = [beta0;1];
                                    end
                                    
                                    CorrectionStr = ['@(b,x) ',CorrectionStr];
                                    Correction_Fn = eval(CorrectionStr);
                                    CCT_Fn = @(b,x) CCT_Fn_Chosen(b,x) ./ Correction_Fn(b,x);

                                case 'Fixed Params'
                                    CCT_Fn_Chosen = CCT_Fn;
                                    NumParams = length(beta0);
                                    CorrectionStr = app.ZmeasuredZtrueEditField.Value;
                                    CorrectionMaxValStr = app.MaxParamErrValsEditField.Value;
                                    CorrectionMaxValsStr =['[',CorrectionMaxValStr,']'];
                                    ErrCorrParams = eval(CorrectionMaxValsStr);
                                        ErrCorrParams = ErrCorrParams.';
                                    
                                        expression = 'b(';
                                        NewExpression = 'ErrCorrParams(';
                                        CorrectionStr = regexprep(CorrectionStr,expression,NewExpression);
                                                                        
                                    CorrectionStr = ['@(x) ',CorrectionStr];
                                    Correction_Fn = eval(CorrectionStr);
                                    CCT_Fn = @(b,x) CCT_Fn_Chosen(b,x) ./ Correction_Fn(x);
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
                        
                        if recursive_regression

                                        %        6           Recursive settings - R.Lambda,
                                        %                                         R.NumIterations
                                        %                                         R.CurrentIteration
                                        %                                         R.CurrentTimePoint
                                        %                                         R.TimeVector

                                   
                            Beta_series = app.BetaRecursiveSeries;
                            Beta_Rb = Beta_series.Rb;
                            Beta_Cb = Beta_series.Cb;

                            RecursiveSettings = varargin{6};

                            Recursive_Lambda_progression = linspace(0,RecursiveSettings.Lambda,RecursiveSettings.NumIterations);
                            Beta_swap_i = @(Iter,b,Beta,index) normalize([Beta(1:Iter-1), b(index), Beta(Iter+1:end)],'range');  
                            Beta_TimeSorted = @(b) (sortrows([RecursiveSettings.TimeVector',b'], 1));
                            dBeta_dt = @(b_sorted) diff(b_sorted(:,2))./diff(b_sorted(:,1));
                            
                            %%%%%%%%%%%%%%%
                            % Local d/dt Smoothness
                                FOH_pad = @(b) [b(1);b(:);b(end)];  
                                Time_pad = @(Time,dt) [Time(1)-dt;Time(:);Time(end)+dt];
                                Pad_Beta_TimeSorted = @(TimeBeta) [Time_pad(TimeBeta(:,1), abs(TimeBeta(2,1)-TimeBeta(1,1)) ) FOH_pad(TimeBeta(:,2))] ;
                                Local_dBeta_dt = @(b_sorted_padded,tIter) abs(diff(b_sorted_padded(tIter:tIter+2,2))./diff(b_sorted_padded(tIter:tIter+2,1)));
                                
                                Local_dBeta_dt_Rb = @(b,TimeIter)   Local_dBeta_dt(...
                                                                        Pad_Beta_TimeSorted(...
                                                                            Beta_TimeSorted(...
                                                                                Beta_swap_i( TimeIter,b, Beta_Rb(:).' ,1)...
                                                                            )...
                                                                        )...
                                                                    ,TimeIter);
                                Local_dBeta_dt_Cb = @(b,TimeIter)   Local_dBeta_dt(...
                                                                        Pad_Beta_TimeSorted(...
                                                                            Beta_TimeSorted(...
                                                                                Beta_swap_i( TimeIter,b, Beta_Cb(:).' ,2)...
                                                                            )...
                                                                        )...
                                                                    ,TimeIter);
                            %%%%%%%%%%%%%%

                            switch app.RegSchemeListBox.Value
                                case 'Smoothness'
                                    CCT_Regularization = @(Iter,b,TimeIter) Recursive_Lambda_progression(Iter).*( norm(Beta_swap_i(TimeIter,b,Beta_Rb(:).',1) ,2) + norm(Beta_swap_i(TimeIter,b,Beta_Cb(:).',2) ,2) );
                                case 'Sparsity'
                                    CCT_Regularization = @(Iter,b,TimeIter) Recursive_Lambda_progression(Iter).*( norm(Beta_swap_i(TimeIter,b,Beta_Rb(:).',1) ,1) + norm(Beta_swap_i(TimeIter,b,Beta_Cb(:).',2) ,1));
                                case 'd/dt Smoothness'
                                    CCT_Regularization = @(Iter,b,TimeIter) Recursive_Lambda_progression(Iter).*( norm( dBeta_dt(Beta_TimeSorted(Beta_swap_i( TimeIter,b, Beta_Rb(:).' ,1))) ,2) + norm( dBeta_dt(Beta_TimeSorted(Beta_swap_i( TimeIter,b, Beta_Cb(:).' ,2))) ,2) );
                                case 'd/dt Sparsity'
                                    CCT_Regularization = @(Iter,b,TimeIter) Recursive_Lambda_progression(Iter).*( norm( dBeta_dt(Beta_TimeSorted(Beta_swap_i( TimeIter,b, Beta_Rb(:).' ,1))) ,1) + norm( dBeta_dt(Beta_TimeSorted(Beta_swap_i( TimeIter,b, Beta_Cb(:).' ,2))) ,1) );
                                case 'Local d/dt Smoothness'
                                    CCT_Regularization = @(Iter,b,TimeIter) Recursive_Lambda_progression(Iter).*( norm( Local_dBeta_dt_Rb(b,TimeIter) ,1) + norm( Local_dBeta_dt_Cb(b,TimeIter) ,1) );

                            end

                            CCT_Fn_Regularized = @(b) CCT_Fn_Lik(b) + CCT_Regularization(RecursiveSettings.CurrentIteration,b,RecursiveSettings.CurrentTimePoint);
                            problem = createOptimProblem('fmincon','objective',...
                                    CCT_Fn_Regularized,'x0',beta0,'lb',lb,'ub',ub);

                        end


                    %%%%%%%%%%%%%%%%%%%%% Run regression optimization
                            [bet,fval] = run(ms,problem,multi_starts)
                    %%%%%%%%%%%%%%%%%%%%%
                        
                    if recursive_regression
                        Beta_Rb(RecursiveSettings.CurrentTimePoint) = bet(1);
                        Beta_Cb(RecursiveSettings.CurrentTimePoint) = bet(2);
                        Beta_series.Rb = Beta_Rb;
                        Beta_series.Cb = Beta_Cb;
                        app.BetaRecursiveSeries = Beta_series;

                    end


            
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


            %% Setup

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

                                      % app.CrossSectionResultsCurrentCondition(end+1) = struct('Name', {Dat_i.Name},...
                                      %     'ExperimentNumber', {Dat_i.ExperimentNumber},...
                                      %     'Well', {Dat_i.Well} ,...
                                      %     'CSResults', (CS_local)...
                                      %     );

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
                                    
                                        Disp_Name_i = Dat_i.Name + ", Exp " + Dat_i.ExperimentNumber + ", Well " + Dat_i.Well;
                                        waterfall(app.CSResultsPlot,X,Y,Z)
                                        legend(app.CSResultsPlot,Disp_Name_i,'Location','best')
                                        xlabel(app.CSResultsPlot,'Time')
                                        ylabel(app.CSResultsPlot,'Frequency (Hz)')
                                        set(app.CSResultsPlot,'YScale','log')
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
                                            
                                            try
                                                CrossSectionCollated = [CrossSectionCollated; CS_i.CSResults.y_z];
                                            catch
                                                errordlg("Time Series Mismatch - You may need to engage to Resampling Utility")
                                                return
                                            end
                                            
                                            Disp_Name_i = CS_i.Name + ", Exp " + CS_i.ExperimentNumber + ", Well " + CS_i.Well;
                                            if isreal(CS_i.CSResults.y_z)
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, (CS_i.CSResults.y_z), '-*', 'LineWidth',2, 'DisplayName',Disp_Name_i)
                                            else
                                                plot(app.CSResultsPlot, CS_i.CSResults.Time, abs(CS_i.CSResults.y_z), '-*', 'LineWidth',2, 'DisplayName',Disp_Name_i)
                                            end
                                            hold(app.CSResultsPlot, 'on');
                                            legend(app.CSResultsPlot)
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
                                                                                                                       'LineWidth',3,...
                                                                                                                       'DisplayName','\mu ({\pm}1\sigma)')
                                                legend(app.CSResultsPlot)
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
                                Dat = Dat(Indexes{4});
                                    Dat = Dat(Indexes{5});
                                        Dat = Dat(Indexes{6});

                Dat_full = Dat;
                
            end

                  %% Time clipping
                    switch app.ClipTimeVectorSwitch.Value
                        case 'On'
                            HeadClip = app.NumStartValuesToClipSpinner.Value;
                            TailClip = app.NumTailValuesToClipSpinner.Value;
                        case 'Off'
                            HeadClip = 0;
                            TailClip = 0;
                    end

            %% Loop through Selected Data
            T = struct2table(Dat_full); % convert the struct array to a table
             sortedT = sortrows(T, 'Time'); % sort the table by 'time'
             Dat_full = table2struct(sortedT) ;

            NumDays = length(Dat_full);

            CS_local = [];
            i = 0;
            for time = (HeadClip+1):(NumDays-TailClip)
                i=i+1;
                Dat_i = Dat_full(time);
                Dat_i_EIS = Dat_i.Data;
                y_z_i = Dat_i_EIS.Z - 1j*Dat_i_EIS.Z1;
                freq_i = Dat_i_EIS.FrequencyHz;

                
                index = find(freq_i>=CS_Freq);
                index = index(end);
                y_z_CS_i = y_z_i(index);


                switch (app.OffsetRemovalSwitch.Value)
                    case 'On'
                        MaxFreqInd = find(freq_i == max(freq_i));

                        y_z_CS_i = y_z_CS_i - real(y_z_i(MaxFreqInd(1)));
                    case 'Off'
                end

                CS_local.y_z(i) = y_z_CS_i;
                CS_local.CSFreq(i) = CS_Freq;
                CS_local.Time(i) = Dat_i.Time;

            end

            switch (app.OutlierRemovalSwitch.Value)
                case 'On'
                    scheme =  string(app.DetectionSchemeListBox.Value);
                    
                    Outliers = isoutlier(abs(CS_local.y_z),scheme);
                    
                    CS_local.y_z(Outliers) = missing; 
                      
            end

            switch (app.NormalizeSwitch.Value)
                case 'On'
                    Scheme = string(app.NormalizationSchemeListBox_5.Value);

                    scheme_option = string(app.NormOptionListBox_2.Value);

                            switch Scheme
                                case 'norm'
                                    scheme_option = str2num(scheme_option);
                            end

                          if ~isempty(scheme_option)
                              Scheme = {Scheme,scheme_option};
                          else
                              Scheme = {Scheme};
                          end
                    
                    if (Scheme{1} == "range")
                        CS_local.y_z = normalize(abs(CS_local.y_z),Scheme{:});
                    else
                        
                        switch (app.ModulobeforeafternormalizingSwitch.Value)
                            case '|Z|'
                                CS_local.y_z = normalize(abs(CS_local.y_z),Scheme{:});
                                
                            case 'Z'
                                CS_local.y_z = normalize((CS_local.y_z),Scheme{:});
                        end
                       
                    end
                case 'Off'
            end

             switch (app.ResampleSwitch.Value)
                case 'On'
                    fs = app.FinalResampleFrequencyEditField.Value;
                    p = app.pEditField.Value;
                    q = app.qEditField.Value;

                    [CS_local.y_z, CS_local.Time] = resample(CS_local.y_z,CS_local.Time,fs,p,q);

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

            app.CustomElementFunctions = {};

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
                        otherwise
                            % Custom Element
                            FnCallStr = [element(i),'('];
                            for paramNum = 1:nlp
                                if paramNum == 1
                                    FnCallStr = [FnCallStr,'b(',num2str(ParamCounter),',:)'];
                                else
                                    FnCallStr = [FnCallStr,',b(',num2str(ParamCounter),',:)'];
                                end
                                ParamCounter = ParamCounter +1;
                            end
                            FnCallStr = [FnCallStr,',x)'];
                            circuit=regexprep(circuit,element(i:i+1),FnCallStr,'once');

                            CustomElementFn = inputdlg({['Enter impedance function for your custom element, Z(jw)', newline,...
                                                        '',newline,...
                                                        'For a CPE, a valid entry is of the form: Q = @(c1,c2,x) ( c1.*( (1i.*x(:,1)).^(c2) ) ).^(-1);',newline,...
                                                        'Where c1 is the Q value/Capacitance, c2 is the alpha value, x(:,1) is the angular frequency vector, w, and 1i is the imaginary constant, sqrt(-1).',newline,...
                                                         'Thus equivalent to Q(jw)=1/c1(jw)^c2',newline,newline,...
                                                        'NOTE: You have entered ',element(i),int2str(floor(nlp)),'. Make sure to match the number of circuit parameters @(z1,z2,...,x) to be equal to ',int2str(floor(nlp)),'!']},...
                                                        'Custom Circuit Element'...
                                                        ,[1 100],...
                                                        {[element(i),' = @(z1,x) 1j.*sin(z1.*x(:,1))']});
                            
                            app.CustomElementFunctions{end+1} = CustomElementFn;
                            
     
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
        
        function results = UpdateRecursiveFitButton(app)


            selectedTab = app.CCTFitOptionsTabGroup.SelectedTab;
            switch selectedTab
                case app.RecursiveTimeRegularizationTab
                    BuildACircuitBarrier = false;
                        switch app.IncludeBarrierSwitch.Value
                            case 'On'
                                BuildACircuitBarrier = true;
                            case 'Off'
                                BuildACircuitBarrier = false;
                        end
                    WriteACircuitBarrier = false;
                        switch app.IncludeBarrierSwitch_2.Value
                                case 'On'
                                    WriteACircuitBarrier = true;
                                case 'Off'
                                    WriteACircuitBarrier = false;
                        end
                    FitBlankOnly = false;
                        switch app.FitBlankOnlyExcludeBarrierSwitch.Value
                                case 'On'
                                    FitBlankOnly = true;
                                case 'Off'
                                    FitBlankOnly = false;
                        end

                    switch app.CircuitToFit.SelectedTab
                        case app.SelectACircuitTab
                            if FitBlankOnly
                                app.RecursiveTimeRegularizationSwitch.Value = 'Off';
                                app.RecursiveTimeRegularizationSwitch.Enable = false;
                            else
                                app.RecursiveTimeRegularizationSwitch.Enable = true;
                            end
                        case app.BuildACircuitTab
                            if ~BuildACircuitBarrier
                                app.RecursiveTimeRegularizationSwitch.Value = 'Off';
                                app.RecursiveTimeRegularizationSwitch.Enable = false;
                            else
                                app.RecursiveTimeRegularizationSwitch.Enable = true;
                            end
                        case app.BuildACircuitMaxValuesTab
                            if ~BuildACircuitBarrier
                                app.RecursiveTimeRegularizationSwitch.Value = 'Off';
                                app.RecursiveTimeRegularizationSwitch.Enable = false;
                            else
                                app.RecursiveTimeRegularizationSwitch.Enable = true;
                            end
                        case app.WriteACircuitTab
                            if ~WriteACircuitBarrier
                                app.RecursiveTimeRegularizationSwitch.Value = 'Off';
                                app.RecursiveTimeRegularizationSwitch.Enable = false;
                            else
                                app.RecursiveTimeRegularizationSwitch.Enable = true;
                            end
                        
                    end
            end
            
        end
        
        function CurrentEISMeasurement_temp = fillOutArbColumnFormatData(app,ColumnOrder,CurrentEISMeasurement_temp)
              %% Fill out data
                 %1          2               3       4   5       6       7               8   
                %Index (AU),Frequency (Hz),Re(Z),-Im(Z),Im(Z),Mag(Z),-Phase(Z) (deg),Phase(Z) (deg)

                %["Index", "FrequencyHz", "Z", "Z1", "Z2", "Phase", "Times"];

                if ColumnOrder{1,5} > 0
                    CurrentEISMeasurement_temp.Z1 = CurrentEISMeasurement_temp.Z1.*-1; 
                end
                if ColumnOrder{1,8} > 0
                    CurrentEISMeasurement_temp.Phase = CurrentEISMeasurement_temp.Phase.*-1; 
                end
                
                if ColumnOrder{1,3} > 0 %Has imaginary components

                    Z = CurrentEISMeasurement_temp.Z - 1j.*CurrentEISMeasurement_temp.Z1;
                    CurrentEISMeasurement_temp.Z2 = abs(Z);
                    CurrentEISMeasurement_temp.Phase = -1.*rad2deg(angle(Z));

                elseif ColumnOrder{1,6} > 0 %Has mod/arg

                    CurrentEISMeasurement_temp.Z = CurrentEISMeasurement_temp.Z2.*cos(deg2rad(-1.*CurrentEISMeasurement_temp.Phase));
                    CurrentEISMeasurement_temp.Z1 = -1.*CurrentEISMeasurement_temp.Z2.*sin(deg2rad(-1.*CurrentEISMeasurement_temp.Phase));

                else
                    errordlg({'Oops! Dataset has no real component or magnitude!',newline,FileName},'Invalid Dataset')
                    return
                end

                if ColumnOrder{1,1} <0
                    CurrentEISMeasurement_temp.Index = transpose(1:length(CurrentEISMeasurement_temp.FrequencyHz));
                end

                CurrentEISMeasurement_temp.Times = ones(length(CurrentEISMeasurement_temp.FrequencyHz),1);
            
        end
        
        function saveNewDataEntryAndPlot(app,varargin)
            %Varargin{1} = {EIS Measurements}
            %varargin{2} = {Field Names}
           %varargin{3} = Field = E{Condition, Time Point, Well Number, Exp Number}
            
            if ~isempty(varargin)
                numEntries = length(varargin{2});
            else
                numEntries = 1;
            end

            for e = 1:numEntries
                if ~isempty(varargin)
                    EISMeasurement_temp = varargin{1};
                    FieldNames_temp = varargin{2};
                    Field = varargin{3};

                    app.CurrentEISMeasurement = EISMeasurement_temp{e};
                    switch Field
                        case 'Condition'
                            app.CurrentEISName = FieldNames_temp{e};
                        case 'Time Point'
                            app.CurrentEISTime = FieldNames_temp{e};

                            if ~all(isstrprop(app.CurrentEISTime,'digit'))
                                errordlg({'Time point read from sheetname non-numeric'},'Invalid Timepoint')
                                return
                            end
                        case 'Well Number'
                            app.CurrentWell = FieldNames_temp{e};
                    end
                end

                %% Save Data
    
                    app.Data(end+1) = struct('Name', {app.CurrentEISName}, 'Time', {app.CurrentEISTime}, 'ExperimentNumber', {app.CurrentExpNumber},...
                        'Well', {app.CurrentWell} ,  'Data', (app.CurrentEISMeasurement));

    
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
            
        end
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

        
        function results = UpdateCCTFitResultsTableStyles(app)

            removeStyle(app.ResultsTable);

                     
            %s_unmark = uistyle('FontColor','black','BackgroundColor','white');
            s_marked = uistyle('FontColor','black','BackgroundColor','red');
            s_accept = uistyle('FontColor',"#77AC30",'BackgroundColor','white');
            s_query = uistyle('FontColor',	"#EDB120",'BackgroundColor','white');
            s_default1 = uistyle('BackgroundColor','white','FontColor','black');
            s_default2 = uistyle('BackgroundColor',[0.94 0.94 0.94],'FontColor','black');

            CatResultsMarkings = categorical(app.FitsResultsTableMarkings);
    
            for i = 1:length(app.Fits)
                
                switch CatResultsMarkings(i)
                    case 'marked'
                        addStyle(app.ResultsTable,s_marked,'row',i);
                    case 'unmarked'
                        if mod(i,2)
                            addStyle(app.ResultsTable,s_default1,'row',i);
                        else
                            addStyle(app.ResultsTable,s_default2,'row',i);
                        end
                    case 'approved'
                         addStyle(app.ResultsTable,s_accept,'row',i); 
                    case 'query'
                         addStyle(app.ResultsTable,s_query,'row',i); 
                end
            end

            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            writelines(evalc('type(mfilename(''fullpath'')+".mlapp")'),mfilename('fullpath')+".m");

            PictureCoinFlip = round(rand(1));
           %pathToMLAPP = fileparts(mfilename('fullpath'));

            if PictureCoinFlip
                app.Image2.Visible = true;
                app.Image2_2.Visible = false;
            else
                app.Image2.Visible = false;
                app.Image2_2.Visible = true;
            end

            %%Programmatic elements
            app.Pax = polaraxes(app.VisualizeDataTab);
            app.Pax.Units = "pixels";
            app.Pax.Position = [419,19,576,682];
            app.Pax.Visible = false;
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
                                 '.',...
                                 '',...
                                 'Optinally, Enter part of the file name in the field adjascent to see only filenames containing that string.'},...
                                    'Select EIS Data To Load',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end

            %% File name filtering
            value = app.KnobSubtringFilter.Value;
            switch value
                case 'Condition'
                    FilterValue = app.ConditionEditField.Value;
                case 'Well Number'
                    FilterValue = app.WellNumberEditField.Value;
                case 'Time Point'
                    FilterValue = int2str(app.TimePointAUEditField.Value);
                case 'Substring'
                    FilterValue = app.FindFilesSubtringFilter.Value;

                otherwise
                    FilterValue = '';
            end

            %% MultiSelect Util
            
            value = app.KnobMultiSelect.Value;
            MultiSelectString = 'off';
                
                dlgtitle = 'MultiSelect Array';
                dims = [1 100];
             
            
                
            switch value
                case 'Condition'
                    prompt = {'Enter a delimited list of Conditions','Enter a list delimiter'};
                    if isempty(app.MultiFileSelectAutoIncrementLastInput), definput = {'control,test',','}; else, definput = {app.MultiFileSelectAutoIncrementLastInput,','}; end
                    answer = inputdlg(prompt,dlgtitle,dims,definput); 
                    app.MultiFileSelectAutoIncrementArray = regexp(answer{1},answer{2},'split');
                    app.MultiFileSelectAutoIncrementLastInput = answer{1};

                    MultiSelectString = 'on';
                    app.HoldPlotSwitchLoad.Value = 'Off';
                case 'Well Number'
                    prompt = {'Enter a delimited list of Well numbers','Enter a list delimiter'};
                    if isempty(app.MultiFileSelectAutoIncrementLastInput), definput = {'A1,D6',','}; else, definput = {app.MultiFileSelectAutoIncrementLastInput,','}; end
                    answer = inputdlg(prompt,dlgtitle,dims,definput); 
                    app.MultiFileSelectAutoIncrementArray = regexp(answer{1},answer{2},'split');
                    app.MultiFileSelectAutoIncrementLastInput = answer{1};

                    MultiSelectString = 'on';
                    app.HoldPlotSwitchLoad.Value = 'Off';
                case 'Time Point'
                    prompt = {'Enter a delimited list of Time Points','Enter a list delimiter'};
                    if isempty(app.MultiFileSelectAutoIncrementLastInput), definput = {'1,2',','}; else, definput = {app.MultiFileSelectAutoIncrementLastInput,','}; end
                    answer = inputdlg(prompt,dlgtitle,dims,definput); 
                    app.MultiFileSelectAutoIncrementArray = regexp(answer{1},answer{2},'split');
                    app.MultiFileSelectAutoIncrementLastInput = answer{1};

                    MultiSelectString = 'on';
                    app.HoldPlotSwitchLoad.Value = 'Off';
                otherwise
                    app.MultiFileSelectAutoIncrementArray = {};
                    app.MultiFileSelectAutoIncrementLastInput = [];

                    SelectPrompt = 'Please Select A File';
                    
                    MultiSelectString = 'off';
                    
            end
            
            %% Select files

            if ~isempty(app.MultiFileSelectAutoIncrementArray)
                    
                    selpath = uigetdir('.','First Select Directory (Folder)');
                    file = {};
                    path = {};
                    if string(selpath)=="0"
                        selpath = '.';
                    end
                    
                for multSel = 1:length(app.MultiFileSelectAutoIncrementArray)
                    
                    %%%Synergistic subtring filtering
                        if string(app.KnobSubtringFilter.Value) == string(app.KnobMultiSelect.Value)
                            FilterValue = convertStringsToChars(string(app.MultiFileSelectAutoIncrementArray{multSel}));
                        end

                    SelectPrompt = ['NOW SELECT: ',app.MultiFileSelectAutoIncrementArray{multSel}];
                    if isempty(FilterValue)
                        [file_temp,path_temp] = uigetfile([selpath,'\*'],SelectPrompt,'MultiSelect',MultiSelectString);
                    else
                        [file_temp,path_temp] = uigetfile([selpath,'\*',FilterValue,'*'],SelectPrompt,'MultiSelect',MultiSelectString);
                    end

                    file = [file,{file_temp}];
                    path = [path,{path_temp}];
 
                end

            else
                
                if isempty(FilterValue)
                    [file,path] = uigetfile('*',SelectPrompt,'MultiSelect',MultiSelectString);
                else
                    [file,path] = uigetfile(['*',FilterValue,'*'],SelectPrompt,'MultiSelect',MultiSelectString);
                end

            end

            switch app.KnobMultiSelect.Value
                case 'Off'
                otherwise
                    if length(file) ~= length(app.MultiFileSelectAutoIncrementArray)
                        errordlg('Please select the same number of files as items in the auto-increment list supplied','Multiselect autoincrement error')
                        return
                    end
            end
            
            if ~isempty(app.MultiFileSelectAutoIncrementArray)
                for selection = 1:length(path)
                    if string(path{selection}) == "0"
                        errordlg('Oops! It looks like a file name was not read properly','Invalid File Selection')
                        return
                    end
                end
            else
                if string(path) == "0"
                        errordlg('Oops! It looks like a file name was not read properly','Invalid File Selection')
                        return
                end
            end
            
            app.CurrentFileName = string(fullfile(path,file));

            if length(app.CurrentFileName) > 1
                app.OrEnterFilePathEditField.Value = selpath;
            else
                app.OrEnterFilePathEditField.Value =  fullfile(path,file) ;
            end


            
             %% Bring UI back to top
              drawnow;
              figure(app.UIFigure)



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            flag = app.TutorialMode;
           if flag
                
               answer = msgbox({'Now press LOAD to import the selected file (or files), tagging it with the Condition, Well Number, Experiment Number and Time Point entered.'},...
                                    'Select EIS Data To Load','help');
           end


        end

        % Button pushed function: LOADButton
        function LOADButtonPushed(app, event)

            if isempty(app.CurrentFileName)
                value = app.OrEnterFilePathEditField.Value;
                app.CurrentFileName = string(value);
            end

            %% Time AutoIncrementer

                value = app.AutoIncrementTimePointperfileSwitch.Value;
                switch value
                    case 'On'
                        app.AutoFileTimeIncremementPosition = app.AutoFileTimeIncremementPosition+1;
                        app.TimePointAUEditField.Value  = app.AutoFileTimeIncrementArray(app.AutoFileTimeIncremementPosition);
                        app.CurrentEISTime =app.AutoFileTimeIncrementArray(app.AutoFileTimeIncremementPosition);
                        
                        if app.AutoFileTimeIncremementPosition == length(app.AutoFileTimeIncrementArray)
                            app.AutoIncrementTimePointperfileSwitch.Value = 'Off';
                            app.TimePointAUEditField.Enable = true;
                            app.AutoFileTimeIncrementArray = [];
                            app.AutoFileTimeIncremementPosition = 0;

                            app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment','Time Point','per file'};
                            app.AutoIncrementTimePointperfileLabel.FontColor = '0.49,0.18,0.56';

                            msgbox('All Time Points Loaded! Noice :)','Auto-Time Incrementer','help')
                        else
                            app.AutoIncrementTimePointperfileLabel.Text = {'NEXT TIME', ['POINT: ' ,convertStringsToChars(string(app.AutoFileTimeIncrementArray(app.AutoFileTimeIncremementPosition+1)))]};
                            app.AutoIncrementTimePointperfileLabel.FontColor = 'red';
                        end 
                end
        
            for MSelct = 1:length(app.CurrentFileName)
                
                if length(app.CurrentFileName) > 1
                    FileName = app.CurrentFileName(MSelct);
                else
                    FileName = app.CurrentFileName;
                end

                if ~isfile(FileName)
                   
                    errordlg({'Oops! We couldn''t find that file!',newline,FileName},'Invalid File')
                    return
                end

                %% Multiselect
                    value = app.KnobMultiSelect.Value;

                    switch value
                        case 'Condition'
                            app.CurrentEISName = app.MultiFileSelectAutoIncrementArray{MSelct};
                        case 'Well Number'
                            app.CurrentWell = app.MultiFileSelectAutoIncrementArray{MSelct};
                        case 'Time Point'
                            app.CurrentEISTime = app.MultiFileSelectAutoIncrementArray{MSelct};
                        otherwise
                    end

  
                %% Set up the Import Options and import the data
                value = app.ArbFileFormatSwitch.Value;
                switch value
                    case 'Off'
                        opts = delimitedTextImportOptions("NumVariables", 7);
                
                        % Specify range and delimiter
                        opts.DataLines = [2, Inf];
                        opts.Delimiter = "\t";
            
                            %Auto-detect_delimeter
                               AutoOpts = detectImportOptions(FileName);
                               opts.Delimiter = string(AutoOpts.Delimiter{1});
                        
                        % Specify column names and types
                        opts.VariableNames = ["Index", "FrequencyHz", "Z", "Z1", "Z2", "Phase", "Times"];
                        opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double"];
                        
                        % Specify file level properties
                        opts.ExtraColumnsRule = "ignore";
                        opts.EmptyLineRule = "read";
                        
                        % Import the data
                        app.CurrentEISMeasurement = readtable(FileName, opts);
                        
                        
                        %% Clear temporary variables
                        clear opts

                    case 'On'
                        ColumnOrder = app.ArbFileFormatSpecTable.Data;
                        %1          2               3       4   5       6       7               8   
                        %Index (AU),Frequency (Hz),Re(Z),-Im(Z),Im(Z),Mag(Z),-Phase(Z) (deg),Phase(Z) (deg)

                        if (ColumnOrder{1,4}>0) && (ColumnOrder{1,5} > 0)
                            errordlg({'Include either Im(Z) OR -Im(Z)',newline,FileName},'Invalid Column Arrangement')
                            return
                        end 

                        if (ColumnOrder{1,7}>0) && (ColumnOrder{1,8} > 0)
                            errordlg({'Include either Phase(Z) OR -Phase(Z)',newline,FileName},'Invalid Column Arrangement')
                            return
                        end
                        
                        if (ColumnOrder{1,3} < 0) && (ColumnOrder{1,6} < 0)
                            errordlg({'Data must include Re(Z) or Mag(Z)',newline,FileName},'Invalid Dataset')
                            return
                        end

                        if ColumnOrder{1,2} < 0
                            errordlg({'Data must include Frequency',newline,FileName},'Invalid Dataset')
                            return
                        end

                        if (((ColumnOrder{1,3}*ColumnOrder{1,4}) < 0) && ((ColumnOrder{1,3}*ColumnOrder{1,5}) < 0)) && (((ColumnOrder{1,6}*ColumnOrder{1,7}) < 0) && ((ColumnOrder{1,6}*ColumnOrder{1,8}) < 0))
                            errordlg({'Data must include either {Re(Z) AND Im(Z)} OR {Mag(Z) AND Phase(Z)}  ',newline,FileName},'Invalid Dataset')
                            return
                        end

                        ColOrderMat = cell2mat(ColumnOrder);
                        AllowedVariableNames =  ["Index", "FrequencyHz", "Z", "Z1", "Z1", "Z2", "Phase", "Phase"] ;
                        AllowedVarTypes = ["double", "double", "double", "double", "double", "double", "double", "double"];
                        
                        VarsInFile = AllowedVariableNames(ColOrderMat>0);
                        TypesInFile = AllowedVarTypes(ColOrderMat>0);

                        [~,SortedIndices] = sort(ColOrderMat(ColOrderMat>0));
                        VarsInFile = VarsInFile(SortedIndices);
                        TypesInFile = TypesInFile(SortedIndices);

                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
                       
                        filetypeval = app.CsvOrSpreadsheetSwitch.Value;
                        switch filetypeval
                            case 'csv (txt)'
                                %% Set up the Import Options and import the data
                                opts = delimitedTextImportOptions("NumVariables", length(VarsInFile));

                                 % Specify column names and types
                                opts.VariableNames = VarsInFile;
                                opts.VariableTypes = TypesInFile;
                                
                                % Specify range and delimiter
                                opts.DataLines =  app.RowdatastartsonSpinner.Value;
                                    %Auto-detect_delimeter
                                       % AutoOpts = detectImportOptions(FileName);
                                       % opts.Delimiter = string(AutoOpts.Delimiter{1});
                                       opts.Delimiter = ",";
                                
                                % Specify file level properties
                                opts.ExtraColumnsRule = "ignore";
                                opts.EmptyLineRule = "read";
                                
                                % Import the data
                                CurrentEISMeasurement_temp = readtable(FileName, opts);

                                %Fill out data
                                app.CurrentEISMeasurement = app.fillOutArbColumnFormatData(ColumnOrder,CurrentEISMeasurement_temp);

                                                            
                            case 'Spreadsheet'

                              
                                %% Set up the Import Options and import the data
                                opts = spreadsheetImportOptions("NumVariables", length(VarsInFile));

                                 % Specify column names and types
                                opts.VariableNames = VarsInFile;
                                opts.VariableTypes = TypesInFile;
                                
                                % Specify sheet and range
                                opts.DataRange = app.RowdatastartsonSpinner.Value;
                                opts.MissingRule = 'omitrow';
                                
                                 % Import the data
                                val_multisheetfield = app.KnobMultiSelect_SpreadsheetMultisheet.Value;
                                switch val_multisheetfield
                                    case 'Off'
                                         CurrentEISMeasurement_temp = readtable(FileName, opts,"UseExcel", false);
                                         %Fill out data
                                            app.CurrentEISMeasurement = app.fillOutArbColumnFormatData(ColumnOrder,CurrentEISMeasurement_temp);

                                         SheetNames = "";
                                    otherwise
                                        [~,SheetNames] = xlsfinfo(FileName);
                                        SheetEISMeasurement_temp = [];

                                        for s = 1:length(SheetNames)
                                            
                                            opts.Sheet = s;
                                            SheetEISMeasurement_temp{s} = readtable(FileName, opts,"UseExcel", false);

                                            %Fill out data
                                            SheetEISMeasurement_temp{s} = app.fillOutArbColumnFormatData(ColumnOrder,SheetEISMeasurement_temp{s});
                                        end
                                end
                                
                        end
                        
                        %% Clear temporary variables
                        clear opts

                end

                
                %% Save and plot
                val_multisheetfield = app.KnobMultiSelect_SpreadsheetMultisheet.Value;
                switch val_multisheetfield
                    case 'Off'
                         app.saveNewDataEntryAndPlot()
                    otherwise
                         app.saveNewDataEntryAndPlot(SheetEISMeasurement_temp,SheetNames,val_multisheetfield)
                            %Varargin{1} = {EIS Measurements}
                            %varargin{2} = {Field Names}
                            %varargin{3} = Field = E{Condition, Time Point, Well Number}
                end

        
            end

          %% Clear filename
                app.CurrentFileName = '';
                app.OrEnterFilePathEditField.Value = '';
        end

        % Value changed function: OrEnterFilePathEditField
        function OrEnterFilePathEditFieldValueChanged(app, event)
            
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

        % Button pushed function: SaveDataForLaterButton
        function SaveDataForLaterButtonPushed(app, event)
           UserFileName = inputdlg("Enter File Name:");

            selpath = uigetdir();
            SavedData = app.Data;
            save(selpath + "\AnalyZeData_" + string(UserFileName) + ".mat","SavedData",'-mat');

            f = msgbox("Data Saved as AnalyZeData_" + string(UserFileName) + ".mat :)",'Data Saved Successfully','help');
        end

        % Button pushed function: LoadFromPreviousSaveButton
        function LoadFromPreviousSaveButtonPushed(app, event)
             [file,path] = uigetfile('AnalyZeData*');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);
                    [~,~,anExt]=fileparts(file);
                    idx = find(strcmp(anExt,{'.mat'})) ;
                    if isempty(idx)
                        errordlg("Please select a .mat file","Unsupported File Type")
                        return
                    end
                    
                                
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

              %% Bring UI back to top
              drawnow;
              figure(app.UIFigure)

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

            app.ArbFileFormatSpecTable.Data = num2cell(app.csv_file_arbitrary_format_init);
            

         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                
                   flag = app.TutorialMode;
                   TabTag = selectedTab.Tag;
                   if flag

                       switch TabTag
                           case 'ImportData'
                                 msgbox(['Enter Data Descriptiors (Time in Arb. Units) -> Select Find File to search for .txt (.csv) data file using explorer -> Select Load to Read data (-> Select Save For Later to save all loaded data as a .mat file to be recalled in a different session)' ,...
                                            newline, 'Alternatively, Select Load From Prvious Save to reload a set of labelled, data points saved in a previous session.'],...
                                            'Workflow','help');
                           case 'CCTFit'
                                msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for circuit fitting -> Choose circuit fitting parameters -> Select Go! to fit slected circuit to all chosen data.' ,...
                                            'Workflow','help');
                           case 'CrossSection'
                                msgbox('Refresh Data to load data options for selection -> Select Choose and Plot to define subset of the full dataset for analysis and plot the time series of the magnitude cross section -> Explore the spectrum by slecting different frequencies.' ,...
                                            'Workflow','help');
                           case 'TransferFnFit'
                               msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for Transfer function estimation -> Choose the Number of poles and zeros -> Select Go! to fit an nth order transfer dunction to all chosen data.' ,...
                                            'Workflow','help');
                       end
                        


                   end
                       
                        
        end

        % Button pushed function: RefreshData
        function RefreshDataPushed(app, event)
                Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = [];
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i) = Dat(i).Time;
                end

                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = sort(unique(Time));
                    Time = string((Time'));
                    Time(end+1) = "Select All";

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
                        msgbox('You can now select a subset of time points by holding CTRL and multi-selecting from the Time list box','Heads-Up','help')
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
               switch Condition{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = [];
                       for j = 1:length(Condition)
                            Ind_j = find(ConditionsAll == Condition(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(ConditionsAll == Condition);
               end
                 Dat = Dat(Indexes);
                 ExpAll = ExpAll(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);


             Indexes = [];
               switch Exp{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Exp)
                            Ind_j = find(ExpAll == Exp(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(ExpAll == Exp);
               end
                 Dat = Dat(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Well{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Well)
                            Ind_j = find(WellAll == Well(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(WellAll == Well);
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

             %% Cluster data
                DatToFit_temp = Dat;
                DatToFit_Clustered  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
        

                while length(DatToFit_temp) >= 1
                    
                    basecase = DatToFit_temp(1);
                    temp  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                    indexes = [];
                    var = DatToFit_temp;
                    for i = 1:length(var) 
                        var_i = var(i);
                        if (string(basecase.Name) == string(var_i.Name)) && (basecase.ExperimentNumber == var_i.ExperimentNumber) && (string(basecase.Well) == string(var_i.Well))
                            temp(end+1) = var_i;
                            indexes = [indexes,i];
                        end
                        
                    end
                    DatToFit_temp(indexes) = [];

                    % Sort Cluster By Time
                            Time_Sorted_Clustered = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                           while length(temp) >= 1
                               
                               min_ind = 1;
                               min_t = temp(1).Time;

                               for i = 1:length(temp)
                                    if temp(i).Time < min_t
                                        min_ind = i;
                                        min_t = temp(i).Time;
                                    end
                               end
                               Time_Sorted_Clustered = [Time_Sorted_Clustered, temp(min_ind)];
                               temp(min_ind) = [];

                           end


                    
                    DatToFit_Clustered = [DatToFit_Clustered, Time_Sorted_Clustered];

                end



            %% Load into table
             app.ChosenDataTable.Data = [];
            for (i = 1:length(DatToFit_Clustered))
                var = DatToFit_Clustered;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable.Data = [app.ChosenDataTable.Data; newData];
            end

           app.DatToFit = DatToFit_Clustered;

        end

        % Button pushed function: GoButton
        function GoButtonPushed(app, event)

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg({'The circuit fitting algorithm relies primarily on the Multi-Start optimization routine.',...
                                        'The routine optimizes the circuit model fit by simultaneously varying all supplied circuit parameters in the usual way.',...
                                        '     - The general form of the objective function is sum((Re(Resid)/(|Z|^2))^2)+sum((Im(Resid)/(|Z|^2))^2)',...
                                        'An initial condition space is defined by the origin and the max values provided; the MultiStart algorithm minimizes the objective function N times, where N is the number of MultiStarts provided and each iteration uses an intial condition for a set of N uniformly distributed points in the intitial condition space.',...
                                        'An exception is made for the irreducible series resistance, which is estimated from the highst frequency datapoint by default and held constant during the optimization - alternative approaches are selectable.',...
                                        '',...
                                        'The results table and plots are populated with the fitting output. To mark and unmark a result, click a cell in the row and press the ''m'' or ''u'' keys respectively. Marked rows are excluded from the time series plot. Use ''a''  (accept) to mark a cell with green text and ''q'' for orange text (query) - no effect ',...
                                        'The combinations of options used to run a particular fitting opereration is stored as text in the ''Problem Setup log'' sub-tab in the Plots tab.',...
                                        '',...
                                        'NOTE: If included, the barrier model (R//C) parameters R and C are split into independent columns (if included in the model, otherwise marked as NaN). The remaining parameters are are stored as a character array in the Device CCT Params column in the order that they appear in the circuit string. The irreducible series resistance is always the last value, irrespective of its position in the circuit string',...
                                        'For Example,',...
                                        '     The circuit string R--(R//C)--C--Q (Or equivalently R+p(R,C)+C+Q  ) models the irreducible series/electrolyte resistance, a barrier, R//C, and two additional parameters in series, C and Q, which model the remainder of the system.',...
                                        '     The Device CCT Params column will contain the values [C,Q,alpha,R], where alpha is the secondary parameter for the constant phase element, Q, and R is the series resistance. The barrier parameters will be stored in Rb and Cb columns respectively.'},...
                                        'Fit an Equivalent Circuit',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end
             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
            app.AbortButton.Value = false;

            %% Assemble Parameters
         

            Dat_full = app.DatToFit;

            NumDays = length(Dat_full);
            NumDevices =1;

            if NumDays == 0;
                msgbox('We couldn''t find that data! Make sure to use the CHOOSE button to select a subset of your dataset for fitting.','No Data Selected To Fit','warn')
                return
            end


            app.ProgressGuage.Value = 0;
            app.ProgressGuage.Limits = [0,NumDays];

            multi_starts = app.GlobalOptimizationIterationsEditField.Value;
            multi_starts_blank = app.BlankFitIterationsEditField.Value;
           
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
            CircuitUsed = [];

            selectedTab = app.CircuitToFit.SelectedTab;

            if selectedTab == app.SelectACircuitTab

                switch app.SelectaCircuitModelBarrierInclusiveListBox.Value
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

                CircuitUsed = app.SelectaCircuitModelBarrierInclusiveListBox.Value;

            elseif (selectedTab == app.BuildACircuitTab) || (selectedTab == app.BuildACircuitMaxValuesTab)

               
                CCTTable = cell2mat(app.CircuitBuilderTable.Data);
                MaxValTable = cell2mat(app.CircuitBuilderTable_MaxVals.Data);
                
                [fit_cct, Upper_bound, Lower_Bound, Beta_Zero, CircuitUsed] = app.BuildACircuit(CCTTable,MaxValTable) ;

               CircuitUsed = convertStringsToChars(CircuitUsed);

                app.FitSequentiallySwitch.Value = 'Off';
                fit_sequentially = false;
                
                
            elseif selectedTab == app.WriteACircuitTab

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
                                        if ~(CurrentCct(1:2) == 'p(') % Allow parallel parasisitcs
                                            errorflag = true;
                                        end
                                end
                            end
        
                            if errorflag
                                msgbox('The app is expecting a leading p(R1,C1) as the Include Barrier Switch is turned on. Please revise circuit string.','Abnormal Barrier Circuit','warn')
                                return
                            end
        
                    end
                
                    
                [fit_cct, Upper_bound, Lower_Bound, Beta_Zero, CircuitUsed] = app.getWrittenCircuit();

                app.FitSequentiallySwitch.Value = 'Off';
                fit_sequentially = false;
            
            end

            if isempty(CircuitUsed)
                msgbox('Looks like we skipped a step! First Set the Circuit to be Fit.','No Circuit Model','warn')
                return
            end

            %% Recursive Regularization Fit
                                        %        6           Recursive settings - R.Lambda,
                                        %                                         R.NumIterations
                                        %                                         R.CurrentIteration
                                        %                                         R.CurrentTimePoint
                                        %                                         R.TimeVector

            switch app.RecursiveTimeRegularizationSwitch.Value
                case 'On'
                    fit_recursive_regularization = true;
                    Recursive_Settings = [];
                    Recursive_Settings.Lambda = app.LambdaEditField.Value;
                    Recursive_Settings.NumIterations = app.NumIterationsSpinner.Value;
                    Recursive_Settings.CurrentIteration = 1;
                    Recursive_Settings.CurrentTimePoint = 1;
                    app.BetaRecursiveSeries.Rb = zeros(NumDays,1);
                    app.BetaRecursiveSeries.Cb = zeros(NumDays,1);
                    
                    for t = 1:NumDays
                        Dat_i = Dat_full(t);
                        Recursive_Settings.TimeVector(t) = Dat_i.Time;
                    end

                    cla(app.RecursiveTimeRegPlot,"reset")
                    hold(app.RecursiveTimeRegPlot,"on")
                    yyaxis(app.RecursiveTimeRegPlot,'right')
                    cla(app.RecursiveTimeRegPlot,"reset")
                    hold(app.RecursiveTimeRegPlot,"on")
                    yyaxis(app.RecursiveTimeRegPlot,'left')
                    
                case 'Off'
                    fit_recursive_regularization = false;
                    Recursive_Settings = [];
                    Recursive_Settings.Lambda = 0;
                    Recursive_Settings.NumIterations = 1;
                    Recursive_Settings.CurrentIteration = 1;
                    Recursive_Settings.CurrentTimePoint = 1;
                    app.BetaRecursiveSeries.Rb = zeros(NumDays,1);
                    app.BetaRecursiveSeries.Cb = zeros(NumDays,1);
                    Recursive_Settings.TimeVector = [];

                    cla(app.RecursiveTimeRegPlot,"reset")
                    hold(app.RecursiveTimeRegPlot,"off")
                    yyaxis(app.RecursiveTimeRegPlot,'right')
                    cla(app.RecursiveTimeRegPlot,"reset")
                    hold(app.RecursiveTimeRegPlot,"off")
                    yyaxis(app.RecursiveTimeRegPlot,'left')
            end

                BetaRecursiveSeriesLog = [];
                BetaRecursiveSeriesLog.Rb = [];
                BetaRecursiveSeriesLog.Cb = [];
                %BetaRecursiveSeriesLog.Rb = zeros(NumDays,1,1);
                %BetaRecursiveSeriesLog.Cb = zeros(NumDays,1,1);
               %% Build Problem string
                ProblemSetUpString_i = "";
                ProblemSetUpString_i = ProblemSetUpString_i + CircuitUsed + newline +...
                                            "     User Set MaxVals: " + num2str(Upper_bound) + newline +...
                                            "MultiStarts: " + num2str(multi_starts) + newline + ...
                                            "Sequential Fit (" + string(fit_sequentially) + "), " + "Fit Blank Only (" + string(fit_blank_only) + ") " + newline + ...
                                            "     Blank Fit MultiStarts: " + num2str(multi_starts_blank) + newline;

                selectedTab = app.CircuitToFit.SelectedTab;
                    if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.CircuitBuilderTable_MaxVals) 
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Build-A-Circuit: True" + newline;
                    else
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Build-A-Circuit: False" + newline;
                    end
                    if (selectedTab == app.WriteACircuitTab)
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Write-A-Circuit: True" + newline;
                    else
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Write-A-Circuit: False" + newline;
                    end
                    if (selectedTab == app.SelectACircuitTab)
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Select-A-Circuit: True" + newline;
                    else
                        ProblemSetUpString_i = ProblemSetUpString_i + "Engage Select-A-Circuit: False"  + newline;
                    end
                      
                    ProblemSetUpString_i = ProblemSetUpString_i + "Recusive Time Regularization (" + string(fit_recursive_regularization) + ") " + newline;
                    if fit_recursive_regularization
                        ProblemSetUpString_i = ProblemSetUpString_i + ...
                                                "     Lambda: " + string(Recursive_Settings.Lambda) + newline +...
                                                "     Number of Iterations: " + string(Recursive_Settings.NumIterations) + newline +...
                                                "     Regularization Scheme: " + string(app.RegSchemeListBox.Value) + newline +...
                                                "     Time Vector: " + num2str(Recursive_Settings.TimeVector) + newline;
                    end  
                    
                    ProblemSetUpString_i = ProblemSetUpString_i + "Series Resistance Estimate: ";
                    switch app.RSeriesResistanceSwitch.Value
                        case 'Re(Z)_final'
                            ProblemSetUpString_i = ProblemSetUpString_i + "Re(Z)_final" + newline;
                        case 'Alternate'
                             ProblemSetUpString_i = ProblemSetUpString_i + app.AlternateRestimationListBox.Value + newline;
                    end

                    if ~isempty(app.CustomElementFunctions)
                        ProblemSetUpString_i = ProblemSetUpString_i + "Custom Elements Used: " + newline;
                        for CstmFns = 1:length(app.CustomElementFunctions) 
                            CustomFn = app.CustomElementFunctions{CstmFns};
                            ProblemSetUpString_i = ProblemSetUpString_i + convertCharsToStrings(CustomFn{1}) + newline;
                        end
                    end

                               
                    switch app.ErrorCorrectionSwitch.Value
                        case 'On'
                            ProblemSetUpString_i = ProblemSetUpString_i + " Potentiostat Error Correction Engaged (true) " + newline;
                            ProblemSetUpString_i = ProblemSetUpString_i + "     Z_meas/Z_true = " + string(app.ZmeasuredZtrueEditField.Value) + newline;
                            switch app.FixedFreeParams.Value
                                case 'Free Params'
                                    ProblemSetUpString_i = ProblemSetUpString_i + "     Max Vals = " + string(app.MaxParamErrValsEditField.Value) + newline;
                                case 'Fixed Params'
                                    ProblemSetUpString_i = ProblemSetUpString_i + "     Fixed Vals = " + string(app.MaxParamErrValsEditField.Value) + newline;
                            end
                        case 'Off'
                            ProblemSetUpString_i = ProblemSetUpString_i + "Potentiostat Error Correction Engaged (false) " + newline;
                    end


        
            %% Fit CCT
       

            app.RunningLamp.Color = 'green';
            drawnow()

            Fits_local = [];
            %ProblemSetUpString_i = "";
            
            for r = 1:Recursive_Settings.NumIterations

                Recursive_Settings.CurrentIteration = r;
                
                for (i = 1:NumDays)

                    
                if app.AbortButton.Value
                    break
                end

                app.ProgressGuage.Value = i;

                Dat_i = Dat_full(i);
                Dat_i_EIS = Dat_i.Data;
                y_z_i = Dat_i_EIS.Z - 1j*Dat_i_EIS.Z1;
                freq_i = Dat_i_EIS.FrequencyHz;
               
                Recursive_Settings.CurrentTimePoint = i;
                Recursive_Settings.TimeVector(i) = Dat_i.Time;


                %% Run MultiStart

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
                                            fit_recursive_regularization,...
                                            y_z_i,... %y_z blank
                                            multi_starts_blank,... %multi starts
                                            Upper_bound,...
                                            Lower_Bound,...
                                            Beta_Zero,...
                                            Recursive_Settings...
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
                                            fit_recursive_regularization,...
                                            y_z_i,... %y_z blank
                                            multi_starts_blank,... %multi starts
                                            Upper_bound,...
                                            Lower_Bound,...
                                            Beta_Zero,...
                                            Recursive_Settings...
                                            ); 

                else
                    Fits_local{i} = app.MultistartFit( y_z_i,... %y_z
                                            freq_i,... %freq
                                            multi_starts,... %multi_starts
                                            fit_cct,... %cct type
                                            fit_sequentially,... %fit blank first
                                            fit_blank_only, ... %fit blank now
                                            fit_recursive_regularization,...
                                            y_z_i,... %y_z blank
                                            multi_starts_blank,... %multi starts
                                            [],...
                                            [],...
                                            [],...
                                            Recursive_Settings...
                                            ); 

                    
                end

                 

                 if r == Recursive_Settings.NumIterations
                    
                     %% Store Results
                        
                      Fits_local{i} = [Fits_local{i},{ProblemSetUpString_i}];

                      app.Fits(end+1) = struct('Name', {Dat_i.Name},...
                          'Time', {Dat_i.Time},...
                          'ExperimentNumber', {Dat_i.ExperimentNumber},...
                          'Well', {Dat_i.Well} ,...
                          'FitsResults', (Fits_local(i)),...
                          'RawData', [y_z_i freq_i]...
                          );

                      app.FitsResultsTableMarkings(end+1) = {'unmarked'};

                      
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
                    

                 end


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
                        plot(app.BodeResults,Freq, Mod, '*','Color',"#0072BD",'LineWidth',1)
                        set(app.BodeResults,'YScale','log')
                        set(app.BodeResults,'XScale','log')
                        xlabel(app.BodeResults,'Frequency (Hz)');
                        ylabel(app.BodeResults,'Magnitude, |Z|, (\Omega)');
                        hold(app.BodeResults, 'on')
                        plot(app.BodeResults,Freq, Mod_Results, '-','Color',"#D95319",'LineWidth',1)

                        yyaxis(app.BodeResults, 'right')
                        ylabel(app.BodeResults,'-Phase, \angleZ (deg)');
                        plot(app.BodeResults,Freq, Arg, '*','Color',	"#EDB120",'LineWidth',1)
                        plot(app.BodeResults,Freq, Arg_Results, '-','Color',"#77AC30",'LineWidth',1)
                        set(app.BodeResults,'YScale','linear')
                        hold(app.BodeResults, 'off')

                        f=allchild(app.BodeResults);
                        legend([f(end),f(end-1),f(2),f(1)],'Measured |Z|','Fit |Z|','Measured -\angleZ','Fit -\angle Z')
                    
       
                    plot(app.NyqResults ,  Dat_i_EIS.Z, Dat_i_EIS.Z1, '*','Color',"#D95319",'LineWidth',1)
                        hold(app.NyqResults, 'on')
                        plot(app.NyqResults , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                        hold(app.NyqResults, 'off')
                        xlabel(app.NyqResults,'Real(Z)');
                        ylabel( app.NyqResults, '-Imag(Z)');
    
                        f=allchild(app.NyqResults);
                        legend([f(end),f(1)],'Measured Z','Fit Z')

                    drawnow()
                    
                end

                        if app.AbortButton.Value
                            break
                        end
                            
                     if fit_recursive_regularization
                        app.BetaRecursiveSeries.Rb = app.BetaRecursiveSeries.Rb(:);
                        app.BetaRecursiveSeries.Cb = app.BetaRecursiveSeries.Cb(:);
                        
                         sorted = (sortrows([Recursive_Settings.TimeVector',app.BetaRecursiveSeries.Rb,app.BetaRecursiveSeries.Cb], 1))';
                        % reassigning sorted values
                        Recursive_Settings.TimeVector = sorted(1,:);
                        app.BetaRecursiveSeries.Rb = sorted(2,:);
                        app.BetaRecursiveSeries.Cb = sorted(3,:);

                        BetaRecursiveSeriesLog.Rb = [BetaRecursiveSeriesLog.Rb;app.BetaRecursiveSeries.Rb];
                        BetaRecursiveSeriesLog.Cb = [BetaRecursiveSeriesLog.Cb;app.BetaRecursiveSeries.Cb];
                        
                        cla(app.RecursiveTimeRegPlot,"reset")
                        yyaxis(app.RecursiveTimeRegPlot,'right')
                        cla(app.RecursiveTimeRegPlot,"reset")
                        yyaxis(app.RecursiveTimeRegPlot,'left')
                        cla(app.RecursiveTimeRegPlot,"reset")
                    
                        switch app.RecursiveTimeRegLogSwitch.Value
                            case 'Overlay'
                                hold(app.RecursiveTimeRegPlot,'on')
                                for r_plot = 1:r
                                    yyaxis(app.RecursiveTimeRegPlot,'left')
                                    plot(app.RecursiveTimeRegPlot,Recursive_Settings.TimeVector,BetaRecursiveSeriesLog.Rb(r_plot,:), '*-','LineWidth',5*(r/Recursive_Settings.NumIterations))
                                    ylabel(app.RecursiveTimeRegPlot,"Rb")
                                    xlabel(app.RecursiveTimeRegPlot,"Time")
            
                                    yyaxis(app.RecursiveTimeRegPlot,'right')
                                    plot(app.RecursiveTimeRegPlot,Recursive_Settings.TimeVector,BetaRecursiveSeriesLog.Cb(r_plot,:), '*-','LineWidth',5*(r/Recursive_Settings.NumIterations))
                                    ylabel(app.RecursiveTimeRegPlot,"Cb")
                                    yyaxis(app.RecursiveTimeRegPlot,'left')
                                end
                                hold(app.RecursiveTimeRegPlot,'off')
                            case 'Ribbon'
                                
                                switch app.RecursiveTimeRegLogSwitch_2.Value
                                    case 'Rb'
                                        ribbon(app.RecursiveTimeRegPlot,Recursive_Settings.TimeVector,BetaRecursiveSeriesLog.Rb')
                                        zlabel(app.RecursiveTimeRegPlot,'R_b')
                                    case 'Cb'
                                        ribbon(app.RecursiveTimeRegPlot,Recursive_Settings.TimeVector,BetaRecursiveSeriesLog.Cb')
                                        zlabel(app.RecursiveTimeRegPlot,'R_b')
                                end
                                view(app.RecursiveTimeRegPlot,[60,30])
                                xlabel(app.RecursiveTimeRegPlot,'Iteration')
                                ylabel(app.RecursiveTimeRegPlot,'Time')
                                %colormap(app.RecursiveTimeRegPlot,turbo)
                        end
                     end
            end
            app.RunningLamp.Color = 'red';
            drawnow()

     
            %% Update Problem log
            
            CurrentLog = app.CCTFitProblemLog.Value;
            app.CCTFitProblemLog.Value = [string(CurrentLog); newline + ProblemSetUpString_i]; 
            
            beep


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
             cla(app.BodeResults,"reset")
             yyaxis(app.BodeResults, 'left')
             cla(app.BodeResults,"reset")
             cla(app.NyqResults,"reset")
             cla(app.FitSeriesPlot,"reset")
             app.ResultsTable.Data = [];
             app.ProgressGuage.Limits = [0,1];
             app.ProgressGuage.Value = 0;

             cla(app.RecursiveTimeRegPlot,"reset")
             yyaxis(app.RecursiveTimeRegPlot,"left")
             cla(app.RecursiveTimeRegPlot)
             yyaxis(app.RecursiveTimeRegPlot,"right")
             cla(app.RecursiveTimeRegPlot)
             yyaxis(app.RecursiveTimeRegPlot,"left")

             app.CCTFitProblemLog.Value = "";
             
             app.Fits = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'FitsResults', {},'RawData', {});
             app.FitsResultsTableMarkings = {};
             removeStyle(app.ResultsTable);
             f = msgbox("All Results Cleared Successfully!",'Clear Results','help');
       
             
        end

        % Button pushed function: SaveResultsButton
        function SaveResultsButtonPushed(app, event)
            if isempty(app.Fits)
                errordlg('No results to save!','Results Not Found')
                return
            end

            UserFileName = inputdlg("Enter File Name: ");
            
            selpath = uigetdir();
            SavedDataResults = app.Fits;
            SavedTableMarkings = app.FitsResultsTableMarkings;
            
            T_c =  app.ResultsTable.Data;
            SavedResultsTable = cell2table(T_c, 'VariableNames', {'circuit','Condition','exp','cell','Time','Rb','Cb','Device CCT Params','mse','rmse','nmse','aic','bic'});

            save(selpath + "\AnalyZeResults_" + string(UserFileName) + ".mat","SavedDataResults","SavedResultsTable","SavedTableMarkings",'-mat');

            filename= selpath + "\AnalyZeResults_wIC_" + string(UserFileName) + ".csv";
            writetable(SavedResultsTable,filename);

            f = msgbox("Data Saved as AnalyZeResults_" + string(UserFileName) + ".mat and AnalyZeResults_wIC_"  + string(UserFileName) + ".csv :D",'Save Results','help');
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
                    
                   answer = questdlg('Select any cell in the results table - the fit diagnostic associated with that row will be plotted. Select multiple cells to perform statics over multiple fits. Use the keys ''m'' and ''u'' while selecting a single cell in the results table to mark (and unmark) a row for exclusion from the analysis. ',...
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
                   msgbox('Select a cell (or cells across multiple rows) in the results table to plot the fit diagnostics result associated with that row.','Result Not Found','error')
                   error('No result selected.')
               end
            
            SelectedRows = unique(app.ResultTableCellsSelected(:,1));
            
                row_count = 1;
                SelectedRows_temp = SelectedRows;
                for r = 1:length(SelectedRows)
                    row = SelectedRows(r);
                    CatTabMarkings = categorical(app.FitsResultsTableMarkings);
                    if (CatTabMarkings(row) ~= 'marked')
                        SelectedRows_temp(row_count) = row;
                        row_count = row_count+1;
                    end
                end
                SelectedRows = SelectedRows_temp;
            

            SelectedFits = app.Fits(SelectedRows);
                
            Res = [];

            for rows = 1:length(SelectedRows)
                LocalResults = SelectedFits.FitsResults;
                Fits_y_z = LocalResults{4};
                Data_Raw = SelectedFits.RawData;
                Data_y_z = Data_Raw(:,1);
                Res_temp = Data_y_z - Fits_y_z;

                Res = [Res;Res_temp];
            end
            
            switch app.HoldPlotsSwitch_FitDiagnostics.Value
                case 'On'
                    definput = {[num2str(length(app.CumulativeCCTFitDiagnosticDisplayNames)+1)]};
                case 'Off'
                    definput = {[num2str(length(app.CumulativeCCTFitDiagnosticDisplayNames))]};
            end
            switch app.LabelPlotsSwitch.Value
                case 'On'
                    prompt = {'Enter the data series display name'};
                                dlgtitle = 'Label Data Series';
                                dims = [1 40];
                                
                                answer = inputdlg(prompt,dlgtitle,dims,definput);
                                DisplayName_temp = answer;
                case 'Off'
                    DisplayName_temp = definput;
            end
            
            switch app.HoldPlotsSwitch_FitDiagnostics.Value
                case 'On'
                    app.CumulativeCCTFitDiagnosticDisplayNames = [app.CumulativeCCTFitDiagnosticDisplayNames DisplayName_temp];

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
                    app.CumulativeCCTFitDiagnosticDisplayNames = DisplayName_temp;

                    hold(app.RealQQ, 'off');
                    cla(app.RealQQ,"reset");
                    hold(app.ImagQQ, 'off');
                    cla(app.ImagQQ,"reset");
                    hold(app.KDensity, 'off');
                    cla(app.KDensity,"reset");
                    hold(app.Residuals, 'off');
                    cla(app.Residuals,"reset");

                    app.FitDiagnosticQQColourCounter = 1;
                    app.KDensityFits_ColourMapCounter = 1;
            end


            scatter(app.Residuals, real(Res) ,imag(Res),'*');
            grid(app.Residuals,'on');

            cmap = hsv(6);
                
            qq1 = qqplot(app.RealQQ, real(Res) );
            title(app.RealQQ, 'QQ Plot Re(Residuals)')
            qq1(1).MarkerEdgeColor = cmap(end-app.FitDiagnosticQQColourCounter,:);
                qq1(1).DisplayName = convertStringsToChars( DisplayName_temp{:});
                qq1(2).HandleVisibility ="off";
                qq1(3).HandleVisibility ="off";

            qq2 = qqplot(app.ImagQQ, imag(Res) );
            title(app.ImagQQ, 'QQ Plot Im(Residuals)')
            qq2(1).MarkerEdgeColor = cmap(end-app.FitDiagnosticQQColourCounter,:);
                qq2(1).DisplayName = convertStringsToChars( DisplayName_temp{:} );
                qq2(2).HandleVisibility ="off";
                qq2(3).HandleVisibility ="off";

            gridx1 = -app.RealAxisWidthEditField.Value:app.GranularityEditField.Value:app.RealAxisWidthEditField.Value;
            gridx2 = -app.ImagAxisWidthEditField.Value:app.GranularityEditField.Value:app.ImagAxisWidthEditField.Value;
            [x1,x2] = meshgrid(gridx1, gridx2);
            x1 = x1(:);
            x2 = x2(:);
            xi = [x1 x2];

            
            %FaceAlfa = 1 - (1/app.KDensityFits_ColourMapCounter);
            switch app.PlotStyleSwitch.Value
                case 'Surface'
                    ksdensity(app.KDensity, [ real(Res) imag(Res) ], xi)
                case 'Contour'
                    ksdensity(app.KDensity, [ real(Res) imag(Res) ], xi,  'PlotFcn','contour')
            end
%             ColourMaps  = {colormap(app.KDensity,parula),...
%                 colormap(app.KDensity,autumn),...
%                 colormap(app.KDensity,hsv),...
%                 colormap(app.KDensity,spring),...
%                 colormap(app.KDensity,summer),...
%                 colormap(app.KDensity,hot)...
%                 };
%             colormap(app.KDensity,ColourMaps{app.KDensityFits_ColourMapCounter})
                
            %colormap(app.KDensity,app.ColourMapListBox.Value);
 

            switch app.LabelPlotsSwitch.Value
                case 'On'
                    legend(app.Residuals,app.CumulativeCCTFitDiagnosticDisplayNames);
                    legend(app.RealQQ);
                    legend(app.ImagQQ);
                    legend(app.KDensity,app.CumulativeCCTFitDiagnosticDisplayNames);

                case 'Off'
                    legend(app.Residuals,'off');
                    legend(app.RealQQ,'off');
                    legend(app.ImagQQ,'off');
                    legend(app.KDensity,'off');
            end

        end

        % Button pushed function: ChooseandPlotButton
        function ChooseandPlotButtonPushed(app, event)

            answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg('Select the time series to examine. Use the slider or the edit box to interactively change the frequency of cross section. Enable Overlay Time Series to iteratively overlay different series at the same frequency. Only new data is added to the multi-series mean. When using the Select All feature, all data series will be added to the mean calculation, when the Overly Series switch is On. If the Overly switch is already engaged, using the Select All feature may duplicate data which already contributes to the mean (the mean calculation DOES NOT check for uniqueness of the data entries). Toggle the Overlay Switch to reset the mean calculation.' ,...
                                        'Plot a Time Series of single frequency impedance magnitudes',...
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
               switch Well{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = [];
                       for j = 1:length(Well)
                            Ind_j = find(WellAll == Well(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(WellAll == Well);
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

            %% Process and Plot

                Conditions = "";
                Exp = "";
                Well = "";
                for (i=1:length(Dat))
                    Conditions(i) = {Dat(i).Name};
                    Exp(i) = {Dat(i).ExperimentNumber};
                    Well(i) = {Dat(i).Well};
                end
                Conditions_u = unique(Conditions);
                Exp_u = unique(Exp);
                Well_u = unique(Well);


           for c = 1:length(Conditions_u)
               for e = 1:length(Exp_u)
                   for w = 1:length(Well_u)

                       Conditions = "None";
                        Exp = "None";
                        Well = "None";
                        for (i=1:length(Dat))
                            Conditions(i) = {Dat(i).Name};
                            Exp(i) = {Dat(i).ExperimentNumber};
                            Well(i) = {Dat(i).Well};
                        end

                       Dat_n = Dat;
                       Indexes = find(Conditions == Conditions_u(c));
                       Dat_n = Dat_n(Indexes);
                       Exp = Exp(Indexes);
                       Well = Well(Indexes);
                       IndexRecord{4} = Indexes;
                       Indexes = find(Exp == Exp_u(e));
                       Dat_n = Dat_n(Indexes);
                       Well = Well(Indexes);
                       IndexRecord{5} = Indexes;
                       Indexes = find(Well == Well_u(w));
                       Dat_n = Dat_n(Indexes);
                       IndexRecord{6} = Indexes;
                        

                        
                       if (length(Dat_n)>0)
                            app.DatToCrossSection = Dat_n;
                            app.CrossSectionIndex = IndexRecord;

                            Dat_1 = Dat_n(1);
                            Dat_1_EIS = Dat_1.Data;
                            Dat_1_Freq = Dat_1_EIS.FrequencyHz;
                            app.ChosenFreq = Dat_1_Freq;
                            
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
            
                            app.CrossSectionFrequencySlider.Value = 0.5;
                            app.HzEditField.Value = app.getSliderValue(0.5);
                            val = app.getSliderValue(0.5);
                     
                            CrossSection(app,val,true);
            
            
                            %%Plot
            
                             cla(app.CSDataPlot,'reset')
            
                            for (i = 1:length(Dat_n))
                                Dat_i = Dat_n(i);
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
                                     set(app.CSDataPlot,'YScale','linear')
                                %hold(app.CSDataPlot, 'off')
                            end
                       end

                   end %for w
               end %for e
           end %for c

           
        end

        % Value changed function: CrossSectionFrequencySlider
        function CrossSectionFrequencySliderValueChanged(app, event)
            value = app.CrossSectionFrequencySlider.Value;
            
            value = app.getSliderValue(value);

            app.HzEditField.Value = value;

            if ~isempty(app.CrossSectionResultsCumulative)
                CrossSection(app,value,false);
            else
                msgbox('First run Choose and Plot to create new plot','No Current Plot to Refresh','warn')
            end
            
        end

        % Value changed function: HzEditField
        function HzEditFieldValueChanged(app, event)
            value = app.HzEditField.Value;
            app.setSliderVal(value);
            
            
            if ~isempty(app.CrossSectionResultsCumulative)
                CrossSection(app,value,false);
            else
                msgbox('First run Choose and Plot to create new plot','No Current Plot to Refresh','warn')
            end
                

        end

        % Button pushed function: RefreshData_2
        function RefreshData_2Pushed(app, event)
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
             
             f = msgbox("Results Cleared Successfully!",'Clear Results','help');
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

            f = msgbox("Data Saved as AnalyZeCrossSectionResults_" + string(UserFileName) + ".mat and AnalyZeCrossSectionResults_"  + string(UserFileName) + ".csv :D",'Save Results','help');
        end

        % Button pushed function: PlotFromTableSelectionButton
        function PlotFromTableSelectionButtonPushed(app, event)
                
               answer = 'Continue';
               flag = app.TutorialMode;
               if flag
                    
                   answer = questdlg("Highlight a series of cells in a column of the results table to plot (or two series in different columns to plot against each other). Select Hold Plots to overlay plots - with each plot command the currently selected series will be added to the mean. Select a single cell to continue to replot the currently overlayed series (with different plot options) without adding additional data" + newline +...
                                        "To exclude a row from plotting, click on a cell in the row and press the 'm' key to mark the row for exclusion and the 'u' key to unmark a marked row.",...
                                        'Plot a Fitting Result',...
                                       'Continue','Cancel','Continue');
               end
                   switch answer
                       case 'Cancel'
                           return
                   end

                
                ind = app.ResultTableCellsSelected;
                ind_temp = ind;
                row_count = 1;
                for r = 1:length(ind(:,1))
                    row = ind(r,1);
                    CatTabMarkings = categorical(app.FitsResultsTableMarkings);
                    if (CatTabMarkings(row) ~= 'marked')
                        ind_temp(row_count,:) = ind(r,:);
                        row_count = row_count+1;
                    end
                end
                ind = ind_temp;
                
                
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
                        
                        if var_x == 'Time'
                            Tab = T(unique(ind(:,1)),[var_x, var_y]);
                            Tab = sortrows(Tab,'Time'); 
                        else
                            Tab = T(unique(ind(:,1)),[var_x, var_y]); 
                        end

                        switch var_y
                            case 'Device CCT Params'
                                DatToPlot = table2array(T(unique(ind(:,1)),var_y)) ;
                                y = DatToPlot(:,1);

                                FirstRowCCT = T(unique(ind(1,1)),['circuit']);
                                CCTToPlot = table2array(FirstRowCCT);
                                first_y = eval(y{1});
                                NumParams = length(first_y);

                                prompt = {['The circuit parameters, excluding the barrier parameters, Rb and Cb, are listed in this column. The parameters are listed in order of appearance in the circuit string, with the exception of the series resisitance, which is always the last parameter. ',...
                                    newline,...
                                    newline,...
                                    'The circuit string for the first entry is: ',CCTToPlot{1},...
                                    newline,... 
                                    newline,...
                                    'There are ', num2str(NumParams), ' Parameters available to plot, index =', num2str(NumParams), ' corresponds to the final parameter, the series system (electrolyte) resistance. ',...
                                    newline,...
                                    newline,...
                                    'Enter the Index of the Parameter you wish to plot (Indexes start at 1):'] };
                                dlgtitle = 'Choose Param';
                                dims = [1 40];
                                definput = {'1'};
                                
                                answer = inputdlg(prompt,dlgtitle,dims,definput);
                                if isempty(answer)
                                    return
                                end
                                Index = round(str2double(answer));

                                                               
                                y_temp = [];
                                for i = 1:length(y)
                                    temp = eval(y{i});
                                    y_temp(i) = temp(Index);
                                end
                                y = y_temp';

                                DatToPlot = table2array(T(unique(ind(:,1)),var_x)) ;
                                x = DatToPlot(:,1);

                            otherwise
                                DatToPlot = table2array( Tab ) ;
                                x = DatToPlot(:,1);
                                y = DatToPlot(:,2);
                        end
     
                    else
                        var_y = string(Names(columns(1)));
                            
                        xlabel(app.FitSeriesPlot,"Indexes");
                        ylabel(app.FitSeriesPlot,var_y);
                        
                        DatToPlot = table2array(T(ind(:,1),var_y)) ;
                        
                        y = DatToPlot(:,1);
                        x = 1:length(y);
                        x = x';

                        switch var_y
                            case 'Device CCT Params'
                                 FirstRowCCT = T(unique(ind(1,1)),['circuit']);
                                CCTToPlot = table2array(FirstRowCCT);
                                first_y = eval(y{1});
                                NumParams = length(first_y);

                                prompt = {['The circuit parameters, excluding the barrier parameters, Rb and Cb, are listed in this column. The parameters are listed in order of appearance in the circuit string, with the exception of the series resisitance, which is always the last parameter. ',...
                                    newline,...
                                    newline,...
                                    'The circuit string for the first entry is: ',CCTToPlot{1},...
                                    newline,... 
                                    newline,...
                                    'There are ', num2str(NumParams), ' Parameters available to plot, index =', num2str(NumParams), ' corresponds to the final parameter, the series system (electrolyte) resistance. ',...
                                    newline,...
                                    newline,...
                                    'Enter the Index of the Parameter you wish to plot (Indexes start at 1):'] };
                                dlgtitle = 'Choose Param';
                                dims = [1 40];
                                definput = {'1'};
                                
                                answer = inputdlg(prompt,dlgtitle,dims,definput);
                                if isempty(answer)
                                    return
                                end
                                Index = round(str2double(answer));
                                
                                y_temp = [];
                                for i = 1:length(y)
                                    temp = eval(y{i});
                                    y_temp(i) = temp(Index);
                                end
                                y = y_temp';
                                
                        end
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
                    
                    DisplayName_temp = [];
                    switch app.HoldPlotsSwitch_FitSeries.Value
                        case 'On'
                            definput = {['Data Series: ' , num2str(length(app.CumulativeCCTfitSeriesPlotRaw)+1)]};
                        case 'Off'
                            definput = {['Data Series: ' , num2str(length(app.CumulativeCCTfitSeriesPlotRaw))]};
                    end
                    switch app.LabelDataSeriesSwitch.Value
                        case 'On'
                                prompt = {'Enter the data series display name'};
                                dlgtitle = 'Label Data Series';
                                dims = [1 40];
                                
                                
                                answer = inputdlg(prompt,dlgtitle,dims,definput);
                                DisplayName_temp = answer;
                                
                        case 'Off'
                               DisplayName_temp = definput;
                    end
                        
                    switch app.HoldPlotsSwitch_FitSeries.Value
    
                        case 'On'
                            
                            app.CumulativeCCTfitSeriesPlotRaw = [app.CumulativeCCTfitSeriesPlotRaw {y}];
                            app.CumulativeCCTfitSeriesDomain = [app.CumulativeCCTfitSeriesDomain {x}];

                            app.CumulativeCCTFitDisplayNames = [app.CumulativeCCTFitDisplayNames DisplayName_temp];
                            
                        case 'Off'
                            
                            app.CumulativeCCTfitSeriesPlotRaw = {y};
                            app.CumulativeCCTfitSeriesDomain = {x};

                            app.CumulativeCCTFitDisplayNames = DisplayName_temp;
    
                    end


                end

               app.CumulativeCCTfitSeriesPlot = app.CumulativeCCTfitSeriesPlotRaw;
               app.CumulativeCCTfitSeriesDomainPlot = app.CumulativeCCTfitSeriesDomain;

               switch (app.ResampleSwitch_2.Value)
                    case 'On'
                        fs = app.ResampleFrequencyEditField_2.Value;
                        p = app.pEditField_2.Value;
                        q = app.qEditField_2.Value;
                        
                        temp_y = app.CumulativeCCTfitSeriesPlot;
                        temp_x = app.CumulativeCCTfitSeriesDomainPlot;
                        y_resampled = [];
                        x_resampled = [];
                    
                          for i =1:length(temp_y)
                                [y_resampled_temp, x_resampled_temp] = resample(temp_y{i},temp_x{i},fs,p,q);
                                y_resampled = [y_resampled {y_resampled_temp}];
                                x_resampled = [x_resampled {x_resampled_temp}];
                          end

                       app.CumulativeCCTfitSeriesPlot = y_resampled;
                       app.CumulativeCCTfitSeriesDomainPlot = x_resampled;
    
               end
               
               try
                    app.CumulativeCCTfitSeriesPlot = cell2mat(app.CumulativeCCTfitSeriesPlot);
                    app.CumulativeCCTfitSeriesDomainPlot = cell2mat(app.CumulativeCCTfitSeriesDomainPlot);
               catch
                   if length(ind(:,1)) >= 2
                        app.CumulativeCCTfitSeriesPlotRaw = app.CumulativeCCTfitSeriesPlotRaw(1:end-1);
                        app.CumulativeCCTfitSeriesDomain = app.CumulativeCCTfitSeriesDomain(1:end-1);
                   end
                   errordlg("Time Series Mismatch - You may need to engage the resampling utility.")
                   return
               end

                
                if length(app.CumulativeCCTfitSeriesPlot(:,1)) >= 2

                     switch (app.OutlierRemovalSwitch_2.Value)
                        case 'On'
                            scheme =  string(app.DetectionSchemeListBox_2.Value);
                            temp_y = app.CumulativeCCTfitSeriesPlot;
                            Outliers = isoutlier(temp_y,scheme);
                            
                            temp_y(Outliers) = missing; 

                            app.CumulativeCCTfitSeriesPlot = temp_y;
                              
                    end

                     switch app.ZScoreNormalizeSwitch_FitSeries_3.Value
                        case 'On'
                          Scheme = string(app.NormalizationSchemeListBox_6.Value);

                          scheme_option = string(app.NormOptionListBox.Value);

                            switch Scheme
                                case 'norm'
                                    scheme_option = str2num(scheme_option);
                            end

                          if ~isempty(scheme_option)
                              Scheme = {Scheme,scheme_option};
                          else
                              Scheme = {Scheme};
                          end

                          temp_y = app.CumulativeCCTfitSeriesPlot;
                              for i =1:length(temp_y(1,:))
                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                            plot(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomainPlot , app.CumulativeCCTfitSeriesPlot , '*-','LineWidth',3)
    
                            switch (app.PlotMultiSeriesMeanSwitch.Value)
                                case 'On'
                                    lines = findobj(app.FitSeriesPlot,'Type','Line');
                                        for i = 1:numel(lines)
                                          lines(i).LineWidth = 1.0;
                                        end
            
                                        Mean = mean(app.CumulativeCCTfitSeriesPlot',"omitnan");
                                        Std = std(app.CumulativeCCTfitSeriesPlot',"omitnan");
                                        errorbar(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomainPlot(:,1), Mean,  Std,...
                                                                               "-s","MarkerSize",10,...
                                                                               "MarkerEdgeColor","blue",...
                                                                               "MarkerFaceColor",[0.65 0.85 0.90],...
                                                                               'LineWidth',3);
                            end
                            
                        case 'Off'
                            hold(app.FitSeriesPlot, 'off');
                            plot(app.FitSeriesPlot, app.CumulativeCCTfitSeriesDomainPlot(:,1) , app.CumulativeCCTfitSeriesPlot(:,1) , '*-','LineWidth',3)
    
                    end

                    switch app.LabelDataSeriesSwitch.Value
                        case 'On'
                            legend(app.FitSeriesPlot,app.CumulativeCCTFitDisplayNames)
                        case 'Off'
                            legend(app.FitSeriesPlot,'off')
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
                                            'Workflow','help');
            end
        end

        % Button pushed function: FitEquivalentCircuitButton
        function FitEquivalentCircuitButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisCCTFITTab;
            app.RefreshData.ButtonPushedFcn(app,event);

        
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
                                            'Workflow','help');

                   end
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        end

        % Button pushed function: TimeSeriesMagnitudeCrossSectionButton
        function TimeSeriesMagnitudeCrossSectionButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisTimeSeriesMagnitudeCrossSectionTab;
            app.RefreshData_2.ButtonPushedFcn(app,event);


            flag = app.TutorialMode;
                   if flag

                       msgbox('Refresh Data to load data options for selection -> Select Choose and Plot to define subset of the full dataset for analysis and plot the time series of the magnitude cross section -> Explore the spectrum by slecting different frequencies.' ,...
                                            'Workflow','help');
                   end

        end

        % Callback function
        function HOMEButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Callback function
        function HOMEButton_2Pushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Callback function
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

            if (selectedTab == app.BuildACircuitTab) || (selectedTab == app.BuildACircuitMaxValuesTab)
                warndlg('Build-A-Circuit is deprecated and will be removed in subsequent versions! Write-A-Circuit or Select-A-Circuit are recommended.','Deprecation Warning')
            end

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
            
                        elseif (selectedTab == app.BuildACircuitTab) || (selectedTab == app.BuildACircuitMaxValuesTab)
                            msgbox({'Enter the circuit parameters according to the circuit layout by selecting an element and entering the corresponding symbol. Series elements along the middle row, parallel elements in rows one and three. Columns one and two are protected.',...
                                    '',...
                                    'Allowed circuit elements are:',...
                                        'R - Resistance',...
                                        'C - Capacitance',...
                                        'L - Inductance',...
                                        'Q - Constant Phase Element',...
                                        'W - Warburg Element',...
                                        'Each Circuit value needs to be assigned a maximum in the Max Values tab!',...
                                        'Enter the maximum allowed values for each circuit parameter. Use the same locations as the Build-A-Circuit table',...
                                        '',...
                                        'The R in column two is uneditable and models the irreducible series resistance.',...
                                        'Engage the Include Barrier switch to add in the R//C circuit modelling the biological barrier.'},'Explainer')
                        end
                   end

             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                app.UpdateRecursiveFitButton();

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


            
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

                app.UpdateRecursiveFitButton();
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

            %SavedResultsTable = cell2table(T_c, 'VariableNames', {'circuit','Condition','exp','cell','Time','Rb','Cb','Device CCT Params','mse','rmse','nmse','aic','bic'});

            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'Navigate to the .mat file containing the desired fitting results',...
                                    newline,...
                                'NOTE (DEPRECTAED): In older versions of the app or for results saved by older versions - Immediately after selecting the .mat file, you will be asked to select the corresponding .csv file.', ...
                                 'Please ensure that the selected pair of files correspond to the same result set.'},...
                                    'Loading a Fitting Result',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       return
               end


            [file,path] = uigetfile('AnalyZeResults*','Select AnalyZe Results MAT file:');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);
                    [~,~,anExt]=fileparts(file);
                    idx = find(strcmp(anExt,{'.mat'})) ;
                    if isempty(idx)
                        errordlg("Please select a .mat file","Unsupported File Type")
                        return
                    end

                    %%Read in .mat file
                    var = load(fullfile(path,file));
                    if length(fieldnames(var)) == 1
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %% Read AnalyZe Results from table (DEPRECATED)
                            [file2,path2] = uigetfile(convertStringsToChars(string(path) + "\AnalyZeResults*" ),'Now Select AnalyZe Results CSV file:');

                           if isequal(file2,0)
                               %disp('User selected Cancel')
                           else
                               %disp(['User Selected ', fullfile(path2,file2)]);
                                   
                              
                               %%Read in .mat file
                                    app.Fits = [app.Fits, var.SavedDataResults];
            
            
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
            
                                            app.FitsResultsTableMarkings(end+1) = {'unmarked'};
              
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
            
                                            app.FitsResultsTableMarkings(end+1) = {'unmarked'};
                                           
                                        
                                    end
            
                               end
            
            
                           end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
                    else %% Read results table from mat file

                        app.Fits = [app.Fits, var.SavedDataResults];
                        
                        %SavedResultsTable = cell2table(T_c, 'VariableNames', {'circuit','Condition','exp','cell','Time','Rb','Cb','Device CCT Params','mse','rmse','nmse','aic','bic'});
                        SavedResultsTable = var.SavedResultsTable;
                        SavedTableMarkings = var.SavedTableMarkings;
                        
                        %Populate Results Table
                          %%Add data back into table
        
                            for (j = 1:length(SavedResultsTable.circuit))
        
                                    newData = {cell2mat(SavedResultsTable.circuit(j)) ...
                                        cell2mat(SavedResultsTable.Condition(j)) ...
                                        SavedResultsTable.exp(j) ...
                                        cell2mat(SavedResultsTable.cell(j)) ...
                                        SavedResultsTable.Time(j) ...
                                        SavedResultsTable.Rb(j) ...
                                        SavedResultsTable.Cb(j) ...
                                        cell2mat(SavedResultsTable.('Device CCT Params')(j)) ...
                                        SavedResultsTable.mse(j) ...
                                        SavedResultsTable.rmse(j) ...
                                        SavedResultsTable.nmse(j) ...
                                        SavedResultsTable.aic(j) ...
                                        SavedResultsTable.bic(j)...
                                        };
                                    
                                    %display(newData)
        
                                    if isempty(app.ResultsTable.Data)
                                        app.ResultsTable.Data = newData;
                                    else
                                        DataToAddToTable = [app.ResultsTable.Data; newData];
                                        app.ResultsTable.Data = DataToAddToTable;
                                    end
    
                                    app.FitsResultsTableMarkings(end+1) = SavedTableMarkings(j);
                                   
                                
                            end

                                app.UpdateCCTFitResultsTableStyles();

                    end



              
            end

            
            msgbox('Results Loaded Successfully!','Load Results','help')

        
        end

        % Button pushed function: CLEARALLDATAButton
        function CLEARALLDATAButtonPushed(app, event)
            
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


            %% Time auto incrementer
                    app.TimePointAUEditField.Enable = true;
                    app.AutoFileTimeIncrementArray = [];
                    app.AutoFileTimeIncremementPosition = 0;
                    app.AutoIncrementTimePointperfileSwitch.Value = 'Off';
                    app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment','Time Point','per file'};
                    app.AutoIncrementTimePointperfileLabel.FontColor = '0.49,0.18,0.56';

                    
           

             f = msgbox("Data Cleared Successfully!",'Clear Data','help');
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
                   
                   f = msgbox("Data entry purged :)",'Clear Last Data Point','help');


               else
                   app.Data = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                   app.UITable.Data = [];

                   f = msgbox("All Data purged :)",'Clear Last Data Point','help');
               end

               value = app.AutoIncrementTimePointperfileSwitch.Value;
               switch value
                   case 'On'
                        answer = 'No';
                        answer = questdlg('Roll back Time Point Auto Increment by one?','Time Auto-Incrementer Enabled','Yes','No','No');
                        switch answer
                            case 'Yes'
                                if (app.AutoFileTimeIncremementPosition > 0)
                                    app.AutoFileTimeIncremementPosition = app.AutoFileTimeIncremementPosition-1;
                                    msgbox('Time Point auto incrementer rolled back by one','Clear Last Data Point','help')
                                end
                                    app.AutoIncrementTimePointperfileLabel.Text = {'NEXT TIME', ['POINT: ' ,convertStringsToChars(string(app.AutoFileTimeIncrementArray(app.AutoFileTimeIncremementPosition+1)))]};
                                    app.AutoIncrementTimePointperfileLabel.FontColor = 'red';
                            end
                        
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

        % Button pushed function: PlotResultsfromTableSelectionButton
        function PlotResultsfromTableSelectionButtonPushed(app, event)
              
           answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg('Select any cell in the results table - the result associated with that row will be plotted. Use the Plot & Export rocker switch to export the impedance data and overlayed fits.',...
                                    'Plot a Fitting Result',...
                                   'Continue','Cancel','Continue');
           end
           switch answer
               case 'Cancel'
                   return
           end

                     
            %% Plot
            
              ind = app.ResultTableCellsSelected;
              ind = ind(1);

               try 
                   Fit_to_plot = app.Fits(ind);
               catch
                   msgbox('Select a cell in the results table to plot the result associated with that row.','Result Not Found','error')
                   error('No result selected.')
               end

               Fit_to_plot = app.Fits(ind);
               Results = Fit_to_plot.FitsResults;
               Dat_EIS = Fit_to_plot.RawData;
               Dat_EIS_yz = Dat_EIS(:,1);

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
                        plot(app.BodeResults,freq, Mod, '*','Color',"#0072BD",'LineWidth',1)
                        set(app.BodeResults,'YScale','log')
                        set(app.BodeResults,'XScale','log')
                        xlabel(app.BodeResults,'Frequency (Hz)');
                        ylabel(app.BodeResults,'Magnitude, |Z|, (\Omega)');
                        hold(app.BodeResults, 'on')
                        plot(app.BodeResults,freq, Mod_Results, '-','Color',"#D95319",'LineWidth',1)

                        yyaxis(app.BodeResults, 'right')
                        ylabel(app.BodeResults,'-Phase, \angleZ (deg)');
                        plot(app.BodeResults,freq, Arg, '*','Color',	"#EDB120",'LineWidth',1)
                        plot(app.BodeResults,freq, Arg_Results, '-','Color',"#77AC30",'LineWidth',1)
                        set(app.BodeResults,'YScale','linear')
                        hold(app.BodeResults, 'off')


                        f=allchild(app.BodeResults);
                        legend([f(end),f(end-1),f(2),f(1)],'Measured |Z|','Fit |Z|','Measured -\angleZ','Fit -\angle Z')
                    end
                    
       
                    plot(app.NyqResults , real(Dat_EIS_yz), -1.*imag(Dat_EIS_yz), '*','Color',"#D95319",'LineWidth',1)
                    hold(app.NyqResults, 'on')
                    plot(app.NyqResults , real(Results_yz), -1.*imag(Results_yz), '-k','LineWidth',1)
                    hold(app.NyqResults, 'off')
                    xlabel(app.NyqResults,'Real(Z)');
                    ylabel( app.NyqResults, '-Imag(Z)');

                    f=allchild(app.NyqResults);
                    legend([f(end),f(1)],'Measured Z','Fit Z')

                    drawnow()

                    %% Check if export requested
                       PlotAndExport = false;
                       value = app.PlotAndExportZSwitch.Value;
                       switch value
                           case 'Plot & Export Z'
                               PlotAndExport = true;
                           otherwise
                               PlotAndExport = false;
                       end

                       if PlotAndExport
                             UserFileName = inputdlg("Enter File Name: ","Export plotted impedance data and fit");
                             selpath = uigetdir();

                             if isempty(UserFileName) || isempty(selpath)
                                  msgbox('Oops! We didn''t get a filename and save directory for that!','Export Data Aborted','error')
                                  %error('No Filename or save directory entered.')
                             else
                                ReZ = real(Dat_EIS_yz);
                                negImZ = -1.*imag(Dat_EIS_yz);
                                ReZ_results = real(Results_yz);
                                negImZ_results = -1.*imag(Results_yz);
    
                                SelectedImpedanceFitsTable = table(freq(:),Dat_EIS_yz(:),Mod(:),Arg(:),ReZ(:),negImZ(:),...
                                                                          Results_yz(:),Mod_Results(:),Arg_Results(:),ReZ_results(:),negImZ_results(:),...
                                                                          'VariableNames',{'Frequency (Hz)', 'Measured Imedance (Z)','Measured |Z| (Ohms)','Measured -Arg(Z) (deg)','Measured Re(Z) (Ohms)','Measured -Im(Z) (Ohms)',...
                                                                                            'Fit Imedance (Z)','Fit |Z| (Ohms)','Fit -Arg(Z) (deg)','Fit Re(Z) (Ohms)','Fit -Im(Z) (Ohms)'});
    
    
                                save(selpath + "\SelectedAnalyZeImpedanceFits_" + string(UserFileName) + ".mat","SelectedImpedanceFitsTable",'-mat');
    
                                filename= selpath + "\SelectedAnalyZeImpedanceFits_" + string(UserFileName) + ".csv";
                                writetable(SelectedImpedanceFitsTable,filename);

                                f = msgbox("Success! Impedance plot data and fits for Results Table entry "+ string(ind) +" saved as SelectedAnalyZeImpedanceFits_" + string(UserFileName) + ".mat and SelectedAnalyZeImpedanceFits_"  + string(UserFileName) + ".csv :D",'Save Impedance Plot Data','help');
                             end

                       end

                    %% Update Log
                                    
                    if (isstring(Results{end}))
                                    CurrentLog = app.CCTFitProblemLog.Value;
                                    
                                    LoadedResult = Results{end};
                                    LoadedResult = "LOADED RESULT: " + num2str(ind) + newline + LoadedResult;
                                    app.CCTFitProblemLog.Value = [string(CurrentLog); newline + LoadedResult]; 
                    end
  
        end

        % Button pushed function: RefreshData_3
        function RefreshData_3Pushed(app, event)
             Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = [];
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i) = Dat(i).Time;
                end

                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = sort(unique(Time));
                    Time = string((Time'));
                    Time(end+1) = "Select All";

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
            Time = string(app.TimeListBox_2.Value);

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
               switch Well{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Well)
                            Ind_j = find(WellAll == Well(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(WellAll == Well);
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

             %% Cluster data
                DatToFit_temp = Dat;
                DatToFit_Clustered  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
        

                while length(DatToFit_temp) >= 1
                    
                    basecase = DatToFit_temp(1);
                    temp  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                    indexes = [];
                    var = DatToFit_temp;
                    for i = 1:length(var) 
                        var_i = var(i);
                        if (string(basecase.Name) == string(var_i.Name)) && (basecase.ExperimentNumber == var_i.ExperimentNumber) && (string(basecase.Well) == string(var_i.Well))
                            temp(end+1) = var_i;
                            indexes = [indexes,i];
                        end
                        
                    end
                    DatToFit_temp(indexes) = [];

                    % Sort Cluster By Time
                            Time_Sorted_Clustered = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                           while length(temp) >= 1
                               
                               min_ind = 1;
                               min_t = temp(1).Time;

                               for i = 1:length(temp)
                                    if temp(i).Time < min_t
                                        min_ind = i;
                                        min_t = temp(i).Time;
                                    end
                               end
                               Time_Sorted_Clustered = [Time_Sorted_Clustered, temp(min_ind)];
                               temp(min_ind) = [];

                           end


                    
                    DatToFit_Clustered = [DatToFit_Clustered, Time_Sorted_Clustered];

                end

             %% Load into table

             app.ChosenDataTable_3.Data = [];
            for (i = 1:length(DatToFit_Clustered))
                var = DatToFit_Clustered;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable_3.Data = [app.ChosenDataTable_3.Data; newData];
            end

           app.DatToFit_TFest = DatToFit_Clustered;
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
                        
                        try
                        FRD_i = frd(y_z_i,2*pi.*freq_i, 'FrequencyUnit', 'rad/s');
                        catch
                            errordlg("Frequency Response Model Creation Failed. Data Entry: Condition-"+string(Dat_i.Name)+", Time-"+string({Dat_i.Time})+", Exp-"+string(Dat_i.ExperimentNumber)+", Well-"+string(Dat_i.Well))
                            continue
                        end
    
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
                            
                        if ~isempty(sdmag)
                            plot(app.BodeResults_2, wout./(2*pi), Mod_Results, '-r',...
                                wout./(2*pi),Mod_Results+3*sdmag,'k:',wout./(2*pi),Mod_Results-3*sdmag,'k:',...
                                'LineWidth',1);
                        else
                            plot(app.BodeResults_2, wout./(2*pi), Mod_Results, '-r',...
                                'LineWidth',1);
                        end
    
                             yyaxis(app.BodeResults_2, 'right')
                               ylabel(app.BodeResults_2,'-Phase, \angle Z (deg)');
                             plot(app.BodeResults_2, Freq, Arg, '*g','LineWidth',1)
                        if ~isempty(sdphase)
                            plot(app.BodeResults_2, wout./(2*pi), Arg_Results, '-g',...
                                 wout./(2*pi),Arg_Results+3*sdphase,'k:',wout./(2*pi),Arg_Results-3*sdphase,'k:',...
                                 'LineWidth',1)
                        else
                            plot(app.BodeResults_2, wout./(2*pi), Arg_Results, '-g',...
                                 'LineWidth',1)
                        end

                             
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
                   msgbox('Select a cell in the results table to plot the result associated with that row.','Result Not Found','error')
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

                          scheme_option = string(app.NormalizationOptionListBox.Value);

                            switch Scheme
                                case 'norm'
                                    scheme_option = str2num(scheme_option);
                            end

                          if ~isempty(scheme_option)
                              Scheme = {Scheme,scheme_option};
                          else
                              Scheme = {Scheme};
                          end
                            
                          if ~PolePlottingActive
                              temp_y = app.CumulativeSysIDSeriesPlot;
                              for i =1:length(temp_y(1,:))
                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end

                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end
                                                  temp_x = plot_dat_x;
                                                  temp_y = plot_dat_y;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
                                                        temp_x(:,i) = normalize(temp_x(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                switch Scheme
                                                    case 'norm'
                                                        scheme_option = str2num(scheme_option);
                                                end
                    
                                              if ~isempty(scheme_option)
                                                  Scheme = {Scheme,scheme_option};
                                              else
                                                  Scheme = {Scheme};
                                              end
                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                                          scheme_option = string(app.NormalizationOptionListBox.Value);

                                                                switch Scheme
                                                                    case 'norm'
                                                                        scheme_option = str2num(scheme_option);
                                                                end
                                    
                                                              if ~isempty(scheme_option)
                                                                  Scheme = {Scheme,scheme_option};
                                                              else
                                                                  Scheme = {Scheme};
                                                              end

                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                                          scheme_option = string(app.NormalizationOptionListBox.Value);

                                                                switch Scheme
                                                                    case 'norm'
                                                                        scheme_option = str2num(scheme_option);
                                                                end
                                    
                                                              if ~isempty(scheme_option)
                                                                  Scheme = {Scheme,scheme_option};
                                                              else
                                                                  Scheme = {Scheme};
                                                              end

                                                              temp_x = plot_dat_x;
                                                              temp_y = plot_dat_y;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
                                                                    temp_x(:,i) = normalize(temp_x(:,i),Scheme{:});
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
                                                          scheme_option = string(app.NormalizationOptionListBox.Value);

                                                            switch Scheme
                                                                case 'norm'
                                                                    scheme_option = str2num(scheme_option);
                                                            end
                                
                                                          if ~isempty(scheme_option)
                                                              Scheme = {Scheme,scheme_option};
                                                          else
                                                              Scheme = {Scheme};
                                                          end

                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                                          scheme_option = string(app.NormalizationOptionListBox.Value);

                                                                switch Scheme
                                                                    case 'norm'
                                                                        scheme_option = str2num(scheme_option);
                                                                end
                                    
                                                              if ~isempty(scheme_option)
                                                                  Scheme = {Scheme,scheme_option};
                                                              else
                                                                  Scheme = {Scheme};
                                                              end

                                                              temp_y = plot_dat;
                                                              for i =1:length(temp_y(1,:))
                                                                    temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end

                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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

                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end

                                                  temp_x = plot_dat_x;
                                                  temp_y = plot_dat_y;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
                                                        temp_x(:,i) = normalize(temp_x(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end

                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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
                                              scheme_option = string(app.NormalizationOptionListBox.Value);

                                                    switch Scheme
                                                        case 'norm'
                                                            scheme_option = str2num(scheme_option);
                                                    end
                        
                                                  if ~isempty(scheme_option)
                                                      Scheme = {Scheme,scheme_option};
                                                  else
                                                      Scheme = {Scheme};
                                                  end

                                                  temp_y = plot_dat;
                                                  for i =1:length(temp_y(1,:))
                                                        temp_y(:,i) = normalize(temp_y(:,i),Scheme{:});
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

             f = msgbox("Results Cleared Successfully!",'Clear Results','help');
        end

        % Button pushed function: SaveResultsButton_3
        function SaveResultsButton_3Pushed(app, event)
            if isempty(app.Fits_TFest)
                errordlg('No results to save!','Results Not Found')
                return
            end
            
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

            f = msgbox("Data Saved as AnalyZeSysIDResults_" + string(UserFileName) + ".mat and AnalyZeSysIDResults_"  + string(UserFileName) + ".csv :D",'Save Results','help');

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
            
            
            [file,path] = uigetfile('AnalyZeSysIDResults*','Select AnalyZe Results MAT file:');
            if isequal(file,0)
               %disp('User selected Cancel');
            else
               %disp(['User selected ', fullfile(path,file)]);
                    [~,~,anExt]=fileparts(file);
                    idx = find(strcmp(anExt,{'.mat'})) ;
                    if isempty(idx)
                        errordlg("Please select a .mat file","Unsupported File Type")
                        return
                    end

               [file2,path2] = uigetfile(convertStringsToChars(string(path) + "\AnalyZeSysIDResults*"),'Now Select AnalyZe Results CSV file:');

               if isequal(file2,0)
                   %disp('User selected Cancel')
               else
                   %disp(['User Selected ', fullfile(path2,file2)]);
                        [~,~,anExt]=fileparts(file2);
                        idx = find(strcmp(anExt,{'.csv'})) ;
                        if isempty(idx)
                            errordlg("Please select the .csv file corresponding to the previously selected .mat file","Unsupported File Type")
                            return
                        end
                  
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

        % Callback function
        function HOMEButton_4Pushed(app, event)
            app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Button pushed function: FitTransferFunctionButton
        function FitTransferFunctionButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.AnalysisEstimateTransferFunctionTab;
            app.RefreshData_3.ButtonPushedFcn(app,event);

            flag = app.TutorialMode;
                   if flag

                         msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for Transfer function estimation -> Choose the Number of poles and zeros -> Select Go! to fit an nth order transfer dunction to all chosen data.' ,...
                                            'Workflow','help');

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
                    msgbox('Keep this switch On to recieve tutorial pop-ups as you use the App.','Heads Up!','help')
                    
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
                               return
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

                case 'Add Custom Element'
                    prompt = {['Enter the symbol for your custom element.',newline,...
                                    'This is a single, unique, (capital) character',newline,...
                                    'Reserved characters (predefined elements) are forbidden (Symbol|R,C,Q,W,L,p), as are any previously used custom characters.',newline,...
                                    'You will be requested to enter the impedance function of this element after you initiate the circuit fit. This function is of the form Z = Z(param1,param2,....,jw).',newline,...
                                    'For example, a capacitive impedance is defined by Zc = Zc(C,jw) = (C*jw)^(-1) '],...
                               ['Enter the number of parameters (excluding frequency).',newline,...
                                    'This is the number of real valued parameters of which the elmenent impedance function is comprised, barring frequency.',newline,...
                                    'A CPE element, for example, is defined by two parameters.']};
                    dlgtitle = 'Add a custom circuit element!';
                    dims = [1 100];
                    definput = {'X','2'};
                    answer = inputdlg(prompt,dlgtitle,dims,definput);
                    
                    if isempty(answer), msgbox("Add Custom Element Operation Cancelled","Custom Circuit Element",'error'); return; end

                    Elem = answer{1};
                    NumParams = answer{2};

                    if length(Elem) > 1
                        errordlg('A Symbol name must be a single character.');
                        return
                    elseif (Elem == 'R') || (Elem == 'C') || (Elem == 'Q') || (Elem == 'W') || (Elem == 'L') || (Elem == 'p')
                        errordlg('Please refrain from using reserved element symbols.');
                        return
                    end
                    
                    CurrentCCTstring = CurrentCCTstring + convertCharsToStrings([Elem,NumParams]);
                    for nps = 1:eval(NumParams)
                        if nps == 1
                            CurrentMaxVals = CurrentMaxVals + "1";
                        else
                            CurrentMaxVals = CurrentMaxVals + ",1";
                        end
                    end

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

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                app.UpdateRecursiveFitButton();

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
                                if ~(CurrentCct(1:2) == 'p(') % Allow parallel parasisitcs
                                    errorflag = true;
                                end
                        end
                    end

                    if errorflag
                        msgbox('The app is expecting a leading p(R1,C1) as the Include Barrier Switch is turned on. Please revise circuit string.')
                    end

            end
        end

        % Button pushed function: SaveFigureButton
        function SaveFigureButtonPushed(app, event)
            plotlist = {'Bode Fits','Nyquist Fits','QQ Imaginary','QQ Real','Residuals','K-Density Estimate','Time Series','Recursive Time Regularisation'};

             [indx,tf] = listdlg('PromptString',{'Select a Plot To Save',...
            'Only one plot can be selected at a time.',''},...
            'SelectionMode','single','ListString',plotlist);

             if isempty(indx), msgbox('Operation Cancelled','Save Fig','warn'); return; end 

            %Choose plot to save
                plotName = plotlist{indx};

                UserFileName = inputdlg("Enter File Name: ");
                selpath = uigetdir();

                
                switch plotName
                    case 'Bode Fits'
                        axs = app.BodeResults;
                        FullFileName = selpath + "\AnalyZeResults_BodePlot_" + string(UserFileName);
                        yyaxis(axs,"left")
                   case 'Nyquist Fits'
                        axs = app.NyqResults;
                        FullFileName = selpath + "\AnalyZeResults_NyqPlot_" + string(UserFileName);
                        
                    case 'QQ Imaginary'
                        axs = app.ImagQQ;
                        FullFileName = selpath + "\AnalyZeResults_ImagQQPlot_" + string(UserFileName);
                    case 'QQ Real'
                        axs = app.RealQQ;
                        FullFileName = selpath + "\AnalyZeResults_RealQQPlot_" + string(UserFileName);
                    case 'Residuals'
                        axs = app.Residuals;
                        FullFileName = selpath + "\AnalyZeResults_ResidualsPlot_" + string(UserFileName);
                    case 'K-Density Estimate'
                        axs = app.KDensity;
                        FullFileName = selpath + "\AnalyZeResults_KdensityPlot_" + string(UserFileName);
                    case 'Time Series'
                        axs = app.FitSeriesPlot;
                        FullFileName = selpath + "\AnalyZeResults_TimeSeriesPlot_" + string(UserFileName);

                    case 'Recursive Time Regularisation'
                        axs = app.RecursiveTimeRegPlot;
                        FullFileName = selpath + "\AnalyZeResults_RecursiveTimeRegularizationPlot_" + string(UserFileName);

                end

            % Get File Type

                 FileTypeList = {'jpeg','png','tiff','tiffn','meta','pdf','eps','epsc','eps2','epsc2','meta','svg'};
                 [indx,tf] = listdlg('PromptString',{'Select a File Type',...
                'Only one plot can be selected at a time.',''},...
                'SelectionMode','single','ListString',FileTypeList);
                 if isempty(indx), msgbox('Operation Cancelled','Save Fig','warn'); return; end 
                FileType = FileTypeList{indx};


            
           % Create a temporary figure with axes.
                fig_temp = figure;
                fig_temp.Visible = 'off';
                figAxes = axes(fig_temp);
                 

            % Copy all UIAxes children, take over axes limits and aspect ratio.            
                % Copy all UIAxes children, take over axes limits and aspect ratio.
                    allChildren = findall(axs,'Type','Line');
                    switch plotName
                        case 'Time Series'
                             %Check if mean only required
                                answer = questdlg('Copy only series mean?', ...
                                    'Isolate Mean Plot', ...
                                    'Yes','No','No');
                                switch answer
                                    case 'Yes'
                                        allChildren = findall(axs,'Type','ErrorBar'); %axs.XAxis.Parent.Children;
                                    otherwise
                                        allChildren = [findall(axs,'Type','ErrorBar');findall(axs,'Type','Line')]; %axs.XAxis.Parent.Children;
                                end
                    end

                
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Scatter');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Contour');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Surface');
                    end
    
                copyobj(allChildren, figAxes)
                figAxes.XLim = axs.XLim;
                figAxes.XScale = axs.XScale;
                figAxes.YLim = axs.YLim;
                figAxes.YScale = axs.YScale;
                figAxes.ZLim = axs.ZLim;
                %figAxes.DataAspectRatio = axs.DataAspectRatio;
                try
                    lgnd_names= [];
                    for l= 1:length(axs.Legend.String)
                        lgndName_l = axs.Legend.String{l};
                        lgnd_names = [lgnd_names;{lgndName_l}];
                    end
                    %lgndName1 = axs.Legend.String{1};
                    lgd = legend(figAxes,lgnd_names);
                    lgd.Box = axs.Legend.Box;
                    lgd.Position = axs.Legend.Position;
                    lgd.Visible = "on";
                end
                fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;
                fig_temp.CurrentAxes.XLabel.String = axs.XLabel.String;
                fig_temp.CurrentAxes.XLabel.FontSize = axs.XLabel.FontSize;
                fig_temp.CurrentAxes.Title.String = axs.Title.String;
                fig_temp.CurrentAxes.Title.FontSize = axs.Title.FontSize;

                switch PlotName
                    case 'Bode Fits'
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        yyaxis(axs,"right")
                        yyaxis(figAxes,"right")
                        
                        allChildren = findall(axs,'Type','Line'); %axs.XAxis.Parent.Children;
                        copyobj(allChildren, figAxes)
                        figAxes.XLim = axs.XLim;
                        figAxes.XScale = axs.XScale;
                        figAxes.YLim = axs.YLim;
                        figAxes.YScale = axs.YScale;
                        figAxes.ZLim = axs.ZLim;
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;

                    case 'K-Density Estimate'
                        figAxes.CameraPosition = axs.CameraPosition;
                        figAxes.CameraViewAngle = axs.CameraViewAngle;

                end
            % Save as png and fig files.
                saveas(fig_temp, FullFileName, FileType);
                %saveas(fig_temp, FullFileName, 'fig');
                fig_temp.Visible = 'on';
                savefig(fig_temp, FullFileName);
            % Delete the temporary figure.
                delete(fig_temp);


                msgbox("File Saved as " + "\AnalyZeResults_<PlotType>_" + string(UserFileName))
             
        end

        % Value changed function: PlotStyleSwitch
        function PlotStyleSwitchValueChanged(app, event)
            value = app.PlotStyleSwitch.Value;
            
            switch value
                case 'Surface'
                    view(app.KDensity,-37.5 , 30);
                case 'Contour'
                    view(app.KDensity,0 , 90);
            end
        end

        % Button pushed function: SaveFigureButton_2
        function SaveFigureButton_2Pushed(app, event)
             plotlist = {'Magnitude Cross Section','Bode Plot'};
             [indx,tf] = listdlg('PromptString',{'Select a Plot To Save',...
            'Only one plot can be selected at a time.',''},...
            'SelectionMode','single','ListString',plotlist);

            %Choose plot to save
                plotName = plotlist{indx};

                UserFileName = inputdlg("Enter File Name: ");
                selpath = uigetdir();

                
                switch plotName
                    case 'Bode Plot'
                        axs = app.CSDataPlot;
                        FullFileName = selpath + "\AnalyZeCrossSectionResults_BodePlot_" + string(UserFileName);
                        yyaxis(axs,"left")
                   case 'Magnitude Cross Section'
                        axs = app.CSResultsPlot;
                        FullFileName = selpath + "\AnalyZeCrossSectionResults_ResultsPlot_" + string(UserFileName);
                        
                end

            % Get File Type

                 FileTypeList = {'jpeg','png','tiff','tiffn','meta','pdf','eps','epsc','eps2','epsc2','meta','svg'};
                 [indx,tf] = listdlg('PromptString',{'Select a File Type',...
                'Only one plot can be selected at a time.',''},...
                'SelectionMode','single','ListString',FileTypeList);
                FileType = FileTypeList{indx};


            
           % Create a temporary figure with axes.
                fig_temp = figure;
                fig_temp.Visible = 'off';
                figAxes = axes(fig_temp);
                 

            % Copy all UIAxes children, take over axes limits and aspect ratio.            
                % Copy all UIAxes children, take over axes limits and aspect ratio. 
                  allChildren = findall(axs,'Type','Line');
                  switch plotName
                        case 'Magnitude Cross Section'
                             %Check if mean only required
                                answer = questdlg('Copy only series mean?', ...
                                    'Isolate Mean Plot', ...
                                    'Yes','No','No');
                                switch answer
                                    case 'Yes'
                                        allChildren = findall(axs,'Type','ErrorBar'); %axs.XAxis.Parent.Children;
                                    otherwise
                                        allChildren = [findall(axs,'Type','ErrorBar');findall(axs,'Type','Line')]; %axs.XAxis.Parent.Children;
                                end
                  end

                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Scatter');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Contour');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Surface');
                    end
                copyobj(allChildren, figAxes)
                figAxes.XLim = axs.XLim;
                figAxes.XScale = axs.XScale;
                figAxes.YLim = axs.YLim;
                figAxes.YScale = axs.YScale;
                figAxes.ZLim = axs.ZLim;
                %figAxes.DataAspectRatio = axs.DataAspectRatio;
                try
                    lgnd_names= [];
                    for l= 1:length(axs.Legend.String)
                        lgndName_l = axs.Legend.String{l};
                        lgnd_names = [lgnd_names;{lgndName_l}];
                    end
                    %lgndName1 = axs.Legend.String{1};
                    lgd = legend(figAxes,lgnd_names);
                    lgd.Box = axs.Legend.Box;
                    lgd.Position = axs.Legend.Position;
                    lgd.Visible = "on";
                end
                fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;
                fig_temp.CurrentAxes.XLabel.String = axs.XLabel.String;
                fig_temp.CurrentAxes.XLabel.FontSize = axs.XLabel.FontSize;
                fig_temp.CurrentAxes.Title.String = axs.Title.String;
                fig_temp.CurrentAxes.Title.FontSize = axs.Title.FontSize;

                switch plotName
                    case 'Bode Plot'
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        yyaxis(axs,"right")
                        yyaxis(figAxes,"right")
                        
                        allChildren = findall(axs,'Type','Line'); %axs.XAxis.Parent.Children;
                        copyobj(allChildren, figAxes)
                        figAxes.XLim = axs.XLim;
                        figAxes.XScale = axs.XScale;
                        figAxes.YLim = axs.YLim;
                        figAxes.YScale = axs.YScale;
                        figAxes.ZLim = axs.ZLim;
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;

                end
            % Save as png and fig files.
                saveas(fig_temp, FullFileName, FileType);
                %saveas(fig_temp, FullFileName, 'fig');
                fig_temp.Visible = 'on';
                savefig(fig_temp, FullFileName);
            % Delete the temporary figure.
                delete(fig_temp);


                msgbox("File Saved as " + "\AnalyZeCrossSectionResults_<PlotType>_" + string(UserFileName))
        end

        % Button pushed function: SaveFigureButton_3
        function SaveFigureButton_3Pushed(app, event)
            plotlist = {'Bode Fits','Nyquist Fits','Pole-Zero','Time Series'};
             [indx,tf] = listdlg('PromptString',{'Select a Plot To Save',...
            'Only one plot can be selected at a time.',''},...
            'SelectionMode','single','ListString',plotlist);

              if isempty(indx), msgbox('Operation Cancelled','Save Fig','warn'); return; end 

            %Choose plot to save
                plotName = plotlist{indx};

                UserFileName = inputdlg("Enter File Name: ");
                selpath = uigetdir();

                
                switch plotName
                    case 'Bode Fits'
                        axs = app.BodeResults_2;
                        FullFileName = selpath + "\AnalyZeSysIDResults_BodePlot_" + string(UserFileName);
                        yyaxis(axs,"left")
                   case 'Nyquist Fits'
                        axs = app.NyqResults_2;
                        FullFileName = selpath + "\AnalyZeSysIDResults_NyqPlot_" + string(UserFileName);
                   
                    case 'Pole-Zero'
                        axs = app.PoleZeroResults;
                        FullFileName = selpath + "\AnalyZeSysIDResults_PoleZeroPlot_" + string(UserFileName);
                        
                    case 'Time Series'
                        axs = app.FitSeriesPlot_2;
                        FullFileName = selpath + "\AnalyZeSysIDResults_TimeSeriesPlot_" + string(UserFileName);
                end

            % Get File Type

                 FileTypeList = {'jpeg','png','tiff','tiffn','meta','pdf','eps','epsc','eps2','epsc2','meta','svg'};
                 [indx,tf] = listdlg('PromptString',{'Select a File Type',...
                'Only one plot can be selected at a time.',''},...
                'SelectionMode','single','ListString',FileTypeList);
                 if isempty(indx), msgbox('Operation Cancelled','Save Fig','warn'); return; end 
                FileType = FileTypeList{indx};


            
           % Create a temporary figure with axes.
                fig_temp = figure;
                fig_temp.Visible = 'off';
                figAxes = axes(fig_temp);
                 

            % Copy all UIAxes children, take over axes limits and aspect ratio.            
                % Copy all UIAxes children, take over axes limits and aspect ratio.
                    allChildren = findall(axs,'Type','Line');
                    switch plotName
                        case 'Time Series'
                             %Check if mean only required
                                answer = questdlg('Copy only series mean?', ...
                                    'Isolate Mean Plot', ...
                                    'Yes','No','No');
                                switch answer
                                    case 'Yes'
                                        allChildren = findall(axs,'Type','ErrorBar'); %axs.XAxis.Parent.Children;
                                    otherwise
                                        allChildren = [findall(axs,'Type','ErrorBar');findall(axs,'Type','Line')]; %axs.XAxis.Parent.Children;
                                end
                     end
                    
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Scatter');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Contour');
                    end
                    if isempty(allChildren)
                        allChildren = findall(axs,'Type','Surface');
                    end
    
                copyobj(allChildren, figAxes)
                figAxes.XLim = axs.XLim;
                figAxes.XScale = axs.XScale;
                figAxes.YLim = axs.YLim;
                figAxes.YScale = axs.YScale;
                figAxes.ZLim = axs.ZLim;
                %figAxes.DataAspectRatio = axs.DataAspectRatio;
                try
                    lgnd_names= [];
                    for l= 1:length(axs.Legend.String)
                        lgndName_l = axs.Legend.String{l};
                        lgnd_names = [lgnd_names;{lgndName_l}];
                    end
                    %lgndName1 = axs.Legend.String{1};
                    lgd = legend(figAxes,lgnd_names);
                    lgd.Box = axs.Legend.Box;
                    lgd.Position = axs.Legend.Position;
                    lgd.Visible = "on";
                end
                fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;
                fig_temp.CurrentAxes.XLabel.String = axs.XLabel.String;
                fig_temp.CurrentAxes.XLabel.FontSize = axs.XLabel.FontSize;
                fig_temp.CurrentAxes.Title.String = axs.Title.String;
                fig_temp.CurrentAxes.Title.FontSize = axs.Title.FontSize;

                switch plotName
                    case 'Bode Fits'
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        yyaxis(axs,"right")
                        yyaxis(figAxes,"right")
                        
                        allChildren = findall(axs,'Type','Line'); %axs.XAxis.Parent.Children;
                        copyobj(allChildren, figAxes)
                        figAxes.XLim = axs.XLim;
                        figAxes.XScale = axs.XScale;
                        figAxes.YLim = axs.YLim;
                        figAxes.YScale = axs.YScale;
                        figAxes.ZLim = axs.ZLim;
                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;


                end
            % Save as png and fig files.
                saveas(fig_temp, FullFileName, FileType);
                %saveas(fig_temp, FullFileName, 'fig');
                fig_temp.Visible = 'on';
                savefig(fig_temp, FullFileName);
            % Delete the temporary figure.
                delete(fig_temp);

                msgbox("File Saved as " + "\AnalyZeSysIDResults_<PlotType>_" + string(UserFileName))
        end

        % Value changed function: OverlayTimeSeriesSwitch
        function OverlayTimeSeriesSwitchValueChanged(app, event)
            value = app.OverlayTimeSeriesSwitch.Value;
            switch value
                case 'On'
                    %msgbox("Series Mean Calculation Reset - Toggle the overlay switch to reset data contributing to mean.",'Data Accumulator Cleared!','help')
                    cla(app.CSDataPlot,'reset')
                    cla(app.CSResultsPlot,'reset')
                    app.CrossSectionResultsCumulative = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {},'Indexes',{});% Description
                    app.CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});
                case 'Off'
                    cla(app.CSDataPlot,'reset')
                    cla(app.CSResultsPlot,'reset')
                    app.CrossSectionResultsCumulative = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {},'Indexes',{});% Description
                    app.CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});
            end
        end

        % Selection change function: CCTFitOptionsTabGroup
        function CCTFitOptionsTabGroupSelectionChanged(app, event)
            selectedTab = app.CCTFitOptionsTabGroup.SelectedTab;
            app.UpdateRecursiveFitButton();
        end

        % Value changed function: RecursiveTimeRegularizationSwitch
        function RecursiveTimeRegularizationSwitchValueChanged(app, event)
            value = app.RecursiveTimeRegularizationSwitch.Value;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox("EXPERIMENTAL: Regularisation adds a priori information into the regression and should be used with care." + newline +...
                            "Regularisation adds an additional penalty (superimposed on the fitness) to impose a priori information onto the problem. In this case, penalize deviations from smoothness or sparsity in the time or velocity domains."+newline+...
                            "The regularisation term in the objective function is of the form Lambda*||D(Xb|_i)||n" + newline +...
                            "     - Lambda is the tuning hyperparameter and it is increased linearly from zero to the user defined value with each iteration. A smaller value of Lambda is more conservative." + newline +...
                            "     - Xb is the set of barrier parameters (Rb or Cb) Xb={xb(t)|t=1:t_end}"+newline+...
                            "     - Xb_i is the set of barrier parmeters where the ith parameter is a the free parameter in the current regression and the ~ith parameters are those values from the preceeding iteration."+newline+...
                            "     - D() is either unity or the d/dt operator"+newline+...
                            "     - ||()||n is the ln-norm: n==1 for sparsity (Lasso), n==2 for smoothness (Ridge)"+newline+...
                            " The algorithm iterates m times over the entire time set; the set Xb is updated element-wise as each element is re-fit.",'Heads-Up - Regularisation')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        end

        % Value changed function: RecursiveTimeRegLogSwitch
        function RecursiveTimeRegLogSwitchValueChanged(app, event)
            value = app.RecursiveTimeRegLogSwitch.Value;
            switch value
                case 'Ribbon'
                    app.RecursiveTimeRegLogSwitch_2.Enable = true;
                    
                case 'Overlay'
                    app.RecursiveTimeRegLogSwitch_2.Enable = false;
            end
        end

        % Double-clicked callback: ResultsTable
        function ResultsTableDoubleClicked(app, event)
            displayRow = event.InteractionInformation.DisplayRow;
            displayColumn = event.InteractionInformation.DisplayColumn;
            
        end

        % Key press function: ResultsTable
        function ResultsTableKeyPress(app, event)
            key = event.Key;

            ind = app.ResultTableCellsSelected;

            ind = app.ResultTableCellsSelected;
            rows = ind(:,1);

            updateFlag = false;

            for r = 1:length(rows)
                
                switch key
                    case 'm'
                        app.FitsResultsTableMarkings(rows(r)) = {'marked'};
                        updateFlag = true;
                    case 'u'
                        app.FitsResultsTableMarkings(rows(r)) = {'unmarked'};
                        updateFlag = true;
                    case 'a'
                        app.FitsResultsTableMarkings(rows(r)) = {'approved'};
                        updateFlag = true;
                    case 'q'
                        app.FitsResultsTableMarkings(rows(r)) = {'query'};
                        updateFlag = true;
                end
            end

            if updateFlag
                app.UpdateCCTFitResultsTableStyles();
            end

            
        end

        % Button down function: ResultsTable
        function ResultsTableButtonDown(app, event)
            
        end

        % Selection change function: TabGroup2
        function TabGroup2SelectionChanged(app, event)
            selectedTab = app.TabGroup2.SelectedTab;
            switch selectedTab
                case app.ResultsTab
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    flag = app.TutorialMode;
                       
                       if flag
                            msgbox({'The Results of the ciruit fitting are stored in this table. If a barrier (R//C) was included in the model, the resistance and capacitance will be stored in the Rb and Cb columns respectively',...
                                '',...
                                'The remainder of the circuit parameters (i.e. those modelling the device and not the biological barrier) are stored as a comma-serparated list in the Device CCT Params column (this is necessary to accomodate circuits with arbitrary many parameters).',...
                                '',...
                                'The order of the Device Params follows that of the circuit string, barring the series resistance, which is always the final parameter.',...
                                '',...
                                '',...
                                'For Example, for arbitrary circuit elements Xm where {X|R,C,W,Q,...} and {m|a,b,c,d,e,f,...} and m==b denotes a barrier and m==s denotes the series resistance:',...
                                '',...
                                '',...
                                'Circuit                                   |...| Rb  | Cb  | Device CCT P',...
                                '--------------------------------------------------------------------------',...
                                'Rs--(Rb//Cb)-((Ra--Wa)//Ca)|...| Rb  | Cb  | [Ra,Wa,Ca,Rs]',...
                                'Rs--(Rb//Cb)--Qa--Qb          |...| Rb  | Cb  | [Qa,alpha_a,Qb,alpha_b,Rs]',...
                                'Rs--(Ra//Ca)--Qa                 |...|NaN|NaN| [Ra,Ca,Qa,alpha_a,Rs]',...
                                'Rs--Qa--Qb                          |...|NaN|NaN|[Qa,alpha_a,Qb, alpha_b, Rs]',...
                                'Rs+p(Rb,Cb)+p(Ra,Qa+Ca)|...| Rb  | Cb  | [Ra,Qa,alpha_a,Ca,Rs]'},'Heads-Up! Circuit Parameter Results')

                            msgbox({'The marking system is currently primarily for visual tagging of individual results. Tag a result by slecting a cell, followed by a single key press corresponding to the marking action. Available actions are: ',...
                                '   -> m - Mark for exclusion (Red cell background). ',...
                                '   -> a - Mark for accepted fit (Green font colour). ',...
                                '   -> u - Undo marking. ',...
                                '   -> q - Mark to query fit (Orange font colour). ',...
                                '',...
                                'NOTE: Entries marked wth ''m'' will be excluded from the Series Plotting.'},'Heads-Up! Marking System')
                       end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
        end

        % Value changed function: ErrorCorrectionSwitch
        function ErrorCorrectionSwitchValueChanged(app, event)
            value = app.ErrorCorrectionSwitch.Value;
            
            switch value
                
                case 'On'
                    
                    flag = app.TutorialMode;
                       
                       if flag
                            
                            msgbox({'The principle of this error correction module is to accomodate the scenario where the difference between the true impedance and measured impedance is expressable as a function of the measured impedance and an arbitrary number of unknown circuit elements.',...
                                    'In particular, the error factor is expressed as Z_measured/Z_true s.t. Z_measured = Circuit_To_Fit * (Z_measured/Z_true).',...
                                    '',...
                                    'As an example: Z_meas/Z_true = subplus(1+(y_z./( C(b(1,:),x) + b(2,:) )) - ( C(b(1,:),x) ./ (  C(b(1,:),x) + b(2,:)  ) ))',...
                                    'Where,'...
                                    '     y_z == Z_measured (the measured impedance data)',...
                                    '     C(a,x) == The impedance of a capacitve element with Capacitance a and angular frequency x',...
                                    '     b(1,:) == The first parameter, in this case the capacitance.',...
                                    '     b(2,:) == The second parameter, in this case a resistance.',...
                                    '     subplus() is used to clamp the function to positive values, i.e. Z_measured >= (0+)*Z_true',...
                                    '',...
                                    'Available Functions/constants are: ',...
                                    '     C(a,x) -> Capacitance',...
                                    '     L(a,x) -> Inductance',...
                                    '     Q(a,b,x) -> CPE',...
                                    '     R(a,x) or a -> Resistance',...
                                    '     W(a,x) -> Warburg Impedance',...
                                    '     p(X,Y) -> X//Y where X and Y are impedances, e.g. X = C(a,x)',...
                                    '     y_z -> Measured impedance data, Z_measured',...
                                    '',...
                                    'Each parameter must be assigned a maximum value, entered as a comma-separated list, e.g. 1,1e6'},...
                                    'Potentiostat Error Correction - Experiemntal')
                       end


            end
        end

        % Value changed function: FixedFreeParams
        function FixedFreeParamsValueChanged(app, event)
            value = app.FixedFreeParams.Value;
            switch value
                case 'Free Params'
                    app.ParamMaxValsLabel.Text = 'Param Max Vals';
                case 'Fixed Params'
                    app.ParamMaxValsLabel.Text = 'Param Fixed Vals';
            end
        end

        % Value changed function: KnobSubtringFilter
        function KnobSubtringFilterValueChanged(app, event)
            
           answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'When you enable this module, the FindFile button will filter the results in the file explorer to filenames containing the substring you select.',...
                                 newline,...
                                 'The filenames are filtered according to the pattern: (whatever)Your Substring(whatever)',...
                                 newline, newline,...
                                 'Note that this has been known to misbehave on certain platforms as it is at the mercy of the system file explorer.'},...
                                    'Filter File Names',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       app.KnobSubtringFilter.Value = 'Off';
                       return
               end
            
            
            
            
            value = app.KnobSubtringFilter.Value;
            switch value
                case 'Substring'
                    app.FindFilesSubtringFilter.Enable = true;
                otherwise
                     app.FindFilesSubtringFilter.Enable = false;
            end
        end

        % Value changed function: KnobMultiSelect
        function KnobMultiSelectValueChanged(app, event)

            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'This utility enables you to select multiple files, which all vary in one category, and have them auto labelled.',...
                                    newline,...
                                    'When you click Find File, you will be asked for a dellimited list of category values. For example, if you have four files of the same condition, time point and experiment number, you can enter the list of four different well numbers. The system will then ask you to find the root directory, and then sequentially select the four files, each data point will be assigned well numbers according to the list you provided.',...
                                    'Remember to press LOAD after each Find File!'},...
                                    'Select Multiple Files In One Go',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       app.KnobMultiSelect.Value = 'Off';
                       return
               end


            value = app.KnobMultiSelect.Value;
            switch value
                case 'Condition'
                    app.ConditionEditField.Enable = false;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = true;
                case 'Well Number'
                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = false;
                    app.TimePointAUEditField.Enable = true;
                case 'Time Point'
                    AutoTime = app.AutoIncrementTimePointperfileSwitch.Value;
                    switch AutoTime
                        case 'On'
                            errordlg('This option cannot be used concurrently with the auto-time point incrementer.')
                            app.KnobMultiSelect.Value = 'Off';
                            app.ConditionEditField.Enable = true;
                            app.WellNumberEditField.Enable = true;
                            app.TimePointAUEditField.Enable = false;
                            return
                        otherwise
                            app.AutoIncrementTimePointperfileSwitch.Enable = false;
                    end

                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = false;
                otherwise
                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = true;
                    app.AutoIncrementTimePointperfileSwitch.Enable = true;

            end

            value = app.AutoIncrementTimePointperfileSwitch.Value;
            switch value
                case 'on'
                    app.TimePointAUEditField.Enable = false;
            end
        end

        % Value changed function: AutoIncrementTimePointperfileSwitch
        function AutoIncrementTimePointperfileSwitchValueChanged(app, event)
                     answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'This utility enables you to pre-specify the time points for a series of data points. Upon activation, you will be prompted for a list of time points.',...
                                    'Each time you press LOAD, the time point will be automatically incremented and the next time point in the list you specified will be assigned to the data point (or points) being read in.'},...
                                    'Auto-Incrememnt Time Point',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       app.AutoIncrementTimePointperfileSwitch.Value = 'Off';
                       return
               end
            
            
            value = app.AutoIncrementTimePointperfileSwitch.Value;
            switch value 
                case 'Off'
                    app.TimePointAUEditField.Enable = true;
                    app.AutoFileTimeIncrementArray = [];
                    app.AutoFileTimeIncremementPosition = 0;
                    app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment','Time Point','per file'};
                    app.AutoIncrementTimePointperfileLabel.FontColor = '0.49,0.18,0.56';
                case 'On'
                    app.TimePointAUEditField.Enable = false;

                    dlgtitle = 'Time Point Array';
                    dims = [1 100];
                    prompt = 'Enter a COMMA separated list of Time Points';
                    definput = {'0,1,2'};
                    answer = inputdlg(prompt,dlgtitle,dims,definput); 

                    if isempty(answer)
                        app.TimePointAUEditField.Enable = true;
                        app.AutoIncrementTimePointperfileSwitch.Value = 'Off';
                        app.AutoFileTimeIncrementArray = [];
                        app.AutoFileTimeIncremementPosition = 0;
                        app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment','Time Point','per file'};
                        app.AutoIncrementTimePointperfileLabel.FontColor = '0.49,0.18,0.56';
                        return
                    end
                    
                    try
                        app.AutoFileTimeIncrementArray = eval(['[',answer{1},']']);
                    catch
                        errordlg('Please enter numeric values separated by commas','Invalud Time Point Array')
                    end

                    app.AutoIncrementTimePointperfileLabel.Text = {'NEXT TIME', ['POINT: ' ,convertStringsToChars(string(app.AutoFileTimeIncrementArray(app.AutoFileTimeIncremementPosition+1)))]};
                    app.AutoIncrementTimePointperfileLabel.FontColor = 'red';
            end
        end

        % Button pushed function: RefreshPlotButton
        function RefreshPlotButtonPushed(app, event)
            
            if ~isempty(app.CrossSectionResultsCumulative)
                value = app.HzEditField.Value;
                app.setSliderVal(value);
    
                CrossSection(app,value,false);
            else
                msgbox('First run Choose and Plot to create new plot','No Current Plot to Refresh','warn')
            end
        end

        % Callback function
        function UITableKeyPress(app, event)
            key = event.Key;
            
        end

        % Button pushed function: RefreshPlotButton_2
        function RefreshPlotButton_2Pushed(app, event)
            app.ResultTableCellsSelected = 1;

            app.PlotFromTableSelectionButtonPushed(app);

        end

        % Button pushed function: AutoMarkButton
        function AutoMarkButtonPushed(app, event)
          
            %% Choose Marking Scheme

            MarkingSchemeList = {'Mark Outliers','Mark Above a Threshold Value','Mark Below a Threshold Value','Mark Within Range','Unmark All'};

            [indx,~] = listdlg('PromptString',{'Select A Marking Scheme',...
            'Automatically mark data points using one of the following metrics',''},...
            'SelectionMode','single','ListString',MarkingSchemeList);

            if isempty(indx), msgbox('Operation Cancelled','Auto-Mark','warn'); return; end 

                MarkingScheme = MarkingSchemeList{indx};

                %% Clarify Metric
                    switch MarkingScheme
                        case 'Mark Outliers'
                            OutlierSchemeList = {'median','mean','quartiles','grubbs','gesd'};

                            [indx,~] = listdlg('PromptString',{'Select An Outlier Scheme',...
                            'Select an outlier detection algorithm',''},...
                            'SelectionMode','single','ListString',OutlierSchemeList);

                            if isempty(indx), msgbox('Operation Cancelled','Auto-Mark','warn'); return; end 

                            OutlierScheme = OutlierSchemeList{indx};

                        case 'Mark Above a Threshold Value'
                            answer = inputdlg('Enter a Threshold Value','Threshold',[1 30],{'0'});
                            try 
                                Threshold = eval(answer{1});
                            catch
                                errordlg('Please enter a numeric threshold value','Invalid Threshold');
                                return
                            end
                        case 'Mark Below a Threshold Value'
                            answer = inputdlg('Enter a Threshold Value','Threshold',[1 30],{'0'});
                            try 
                                Threshold = eval(answer{1});
                            catch
                                errordlg('Please enter a numeric threshold value','Invalid Threshold');
                                return
                            end
                        case 'Mark Within Range'

                            answer = inputdlg({'Enter an Upper Bound','Enter a Lower Bound'},'Interval',[1 30],{'1','0'});
                            try 
                                UpperBnd = eval(answer{1});
                                LowerBnd = eval(answer{2});
                            catch
                                errordlg('Please enter a numeric threshold value','Invalid Threshold');
                                return
                            end

                        case 'Unmark All'
                            
                             for i = 1:length(app.Fits)
                                app.FitsResultsTableMarkings(i) = {'unmark'};
                            end
            
                            app.UpdateCCTFitResultsTableStyles();

                            return
                    end

           %% Choose Mark
                MarkList = {'marked','umarked','approved','query'};
                    
                [indx,tf] = listdlg('PromptString',{'Select A Mark',...
                'Mark data points selected by the marking matric as?',''},...
                'SelectionMode','single','ListString',MarkList);

                if isempty(indx), msgbox('Operation Cancelled','Auto-Mark','warn'); return; end 

                Mark = MarkList(indx);



            %% Choose operand 
                 OperandList = {'Time','Rb','Cb','MSE','NRMSE','NMSE','AIC','BIC'};

                [indx,tf] = listdlg('PromptString',{'Select An Operand',...
                'Apply metric to which column?',''},...
                'SelectionMode','single','ListString',OperandList);

                if isempty(indx), msgbox('Operation Cancelled','Auto-Mark','warn'); return; end 
    
                    Operand = OperandList{indx};

            %% Compute Markings
                T_c =  app.ResultsTable.Data;
                    
                T = cell2table(T_c, 'VariableNames',...
                       {'circuit','Condition','exp','cell','Time',...
                      'Rb','Cb','Device CCT Params','MSE','NRMSE','NMSE','AIC','BIC'});

                OperandData = table2array(T(1:length(app.Fits),string(Operand)));

                switch MarkingScheme
                    case 'Mark Outliers'
                        MarkedIndexes = isoutlier(OperandData,OutlierScheme);
                    case 'Mark Above a Threshold Value'
                        MarkedIndexes = find(OperandData > Threshold);
                    case 'Mark Below a Threshold Value'
                        MarkedIndexes = find(OperandData < Threshold);
                    case 'Mark Within Range'
                        MarkedIndexes = find((OperandData < UpperBnd).*(OperandData < LowerBnd));
                end
    

            %% Apply Markings
                
                app.FitsResultsTableMarkings(MarkedIndexes) = Mark;


                app.UpdateCCTFitResultsTableStyles();

        end

        % Button pushed function: RefreshPlotButton_3
        function RefreshPlotButton_3Pushed(app, event)
            app.ResultTable_SysID_CellsSelected = 1;

            app.PlotFromTableSelectionButton_2Pushed(app);
        end

        % Value changed function: NormalizationSchemeListBox_6
        function NormalizationSchemeListBox_6ValueChanged(app, event)
            value = app.NormalizationSchemeListBox_6.Value;
            switch value
                case 'zscore'
                    app.NormOptionListBox.Items = {'std','robust'};
                case 'norm'
                    app.NormOptionListBox.Items = {'1','2','3','4','5','Inf'};
                case 'scale'
                    app.NormOptionListBox.Items = {'std','mad','first','iqr'};
                case 'range'
                    app.NormOptionListBox.Items = {};
                case 'center'
                    app.NormOptionListBox.Items = {'mean','median'};
                case 'medianiqr'
                    app.NormOptionListBox.Items = {};
            end
        end

        % Value changed function: NormalizationSchemeListBox_5
        function NormalizationSchemeListBox_5ValueChanged(app, event)
            value = app.NormalizationSchemeListBox_5.Value;
             switch value
                case 'zscore'
                    app.NormOptionListBox_2.Items = {'std','robust'};
                case 'norm'
                    app.NormOptionListBox_2.Items = {'1','2','3','4','5','Inf'};
                case 'scale'
                    app.NormOptionListBox_2.Items = {'std','mad','first','iqr'};
                case 'range'
                    app.NormOptionListBox_2.Items = {};
                case 'center'
                    app.NormOptionListBox_2.Items = {'mean','median'};
                case 'medianiqr'
                    app.NormOptionListBox_2.Items = {};
            end
        end

        % Value changed function: NormalizationSchemeListBox_4
        function NormalizationSchemeListBox_4ValueChanged(app, event)
            value = app.NormalizationSchemeListBox_4.Value;
            switch value
                case 'zscore'
                    app.NormalizationOptionListBox.Items = {'std','robust'};
                case 'norm'
                    app.NormalizationOptionListBox.Items = {'1','2','3','4','5','Inf'};
                case 'scale'
                    app.NormalizationOptionListBox.Items = {'std','mad','first','iqr'};
                case 'range'
                    app.NormalizationOptionListBox.Items = {};
                case 'center'
                    app.NormalizationOptionListBox.Items = {'mean','median'};
                case 'medianiqr'
                    app.NormalizationOptionListBox.Items = {};
            end
        end

        % Value changed function: ArbFileFormatSwitch
        function ArbFileFormatSwitchValueChanged(app, event)
            value = app.ArbFileFormatSwitch.Value;

            app.ArbFileFormatSpecTable.Data = num2cell(app.csv_file_arbitrary_format_init);

           answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'This utility enables you to define a set of columns other than that which AnalyZe imports by default.',...
                                    newline,...
                                    'The datafile to be read can be either a csv (delimited text file) or a spreadsheet (e.g. .xls, .xlsx)',...
                                    newline,...
                                    'The datafile must include a frequency column as well as (Real(Z) AND Imaginary(Z) ) OR (Magnitude(Z) AND Phase(Z)), where Z is the measured impedance. Which is to say, the data must include either both complex (cartesian) components or both polar (mod-arg) components. From the supplied data, the cartesian or polar values will be calculated automatically. Furthermore, the phase and imaginary component can be supplied as either positive or negative.',...
                                    newline,...
                                    'The column names in the table (within the utility tab) indicate the set of allowed columns in the datafile to be imported. Modify the table values beneath each heading with the column order, so that they reflect the columns in the datafile; the first column in the datafile is at position 1, the next at 2 and so on. Use -1 to indicate that a column is not present in the datafile.',...
                                    newline,...
                                    'Alongside, enter the row number at which the first data value appears in the datafile (if there are column headings in the file, the first data will appear at row 2).'},...
                                    'Import a Semi-Arbitrary Datafile',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       app.ArbFileFormatSwitch.Value = 'Off';
                       return
               end
        end

        % Value changed function: KnobMultiSelect_SpreadsheetMultisheet
        function KnobMultiSelect_SpreadsheetMultisheetValueChanged(app, event)
            
            answer = 'Continue';
           flag = app.TutorialMode;
           if flag
                
               answer = questdlg({'This utility allows for a single spreadsheet file (e.g. .xls) to be imported, where the spreadsheet contains multiple sheets.',...
                                   newline,...
                                   'This utility is required to work in cojunction with the arbitrary file format utility.',...
                                   newline,...
                                   'Each sheet within the file is considered to contain a single impedance spectrum, corresponding to a particular time point, well number or experimental condition. Within a spreadsheet file, all sheets are constrained to be of a single field category (e.g. all sheets are different time points but the same condition and well number.)',...
                                   'The names of each sheet are used to populate the selected field name (time point, well number or condition).'},...
                                    'Import a Spreadsheet File with multiple Sheets',...
                                   'Continue','Cancel','Continue');
           end
               switch answer
                   case 'Cancel'
                       app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                       return
               end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            value = app.KnobMultiSelect_SpreadsheetMultisheet.Value;
            
            app.CsvOrSpreadsheetSwitch.Value = 'Spreadsheet';

            switch value
                case 'Off'
                otherwise
                    val_arbFormat = app.ArbFileFormatSwitch.Value;
                    switch val_arbFormat
                        case 'Off'
                       errordlg('Engage the Alternate File Format utility and input file format parameters before using this feature');
                       app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                       return
                    end
            end


            val_MultiFileSel = app.KnobMultiSelect.Value;
            switch value
                case 'Condition'
                    switch val_MultiFileSel
                        case 'Condition'
                            errordlg('Cannot incrememnt field by file name and sheet name simultaneously.')
                            app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                            app.ConditionEditField.Enable = true;
                            app.WellNumberEditField.Enable = true;
                            app.TimePointAUEditField.Enable = false;
                            return
                    end

                    app.ConditionEditField.Enable = false;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = true;
                case 'Well Number'
                    switch val_MultiFileSel
                        case 'Well Number'
                            errordlg('Cannot incrememnt field by file name and sheet name simultaneously.')
                            app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                            app.ConditionEditField.Enable = true;
                            app.WellNumberEditField.Enable = true;
                            app.TimePointAUEditField.Enable = false;
                            return
                    end

                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = false;
                    app.TimePointAUEditField.Enable = true;
                case 'Time Point'
                    switch val_MultiFileSel
                        case 'Time Point'
                            errordlg('Cannot incrememnt field by file name and sheet name simultaneously.')
                            app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                            app.ConditionEditField.Enable = true;
                            app.WellNumberEditField.Enable = true;
                            app.TimePointAUEditField.Enable = false;
                            return
                    end

                    AutoTime = app.AutoIncrementTimePointperfileSwitch.Value;
                    switch AutoTime
                        case 'On'
                            errordlg('This option cannot be used concurrently with the auto-time point incrementer.')
                            app.KnobMultiSelect_SpreadsheetMultisheet.Value = 'Off';
                            app.ConditionEditField.Enable = true;
                            app.WellNumberEditField.Enable = true;
                            app.TimePointAUEditField.Enable = false;
                            return
                         otherwise
                            app.AutoIncrementTimePointperfileSwitch.Enable = false;
                    end

                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = false;
                otherwise
                    app.ConditionEditField.Enable = true;
                    app.WellNumberEditField.Enable = true;
                    app.TimePointAUEditField.Enable = true;
                    app.AutoIncrementTimePointperfileSwitch.Enable = true;

                    app.CsvOrSpreadsheetSwitch.Value = 'csv (txt)';

            end

            value = app.AutoIncrementTimePointperfileSwitch.Value;
            switch value
                case 'on'
                    app.TimePointAUEditField.Enable = false;
            end
        end

        % Value changed function: DropDown
        function DropDownValueChanged(app, event)
            value = app.DropDown.Value;

            switch value
                case 'Filename Filter'
                    app.FileFinderTab.SelectedTab = app.FileSUBTRINGFilterTab ;  
                case 'Auto-Increment Fieldname over many Files'
                    app.FileFinderTab.SelectedTab = app.MultiSelectTab;
                case 'Import Data from a Datafile with Alternate Format'
                    app.FileFinderTab.SelectedTab = app.AlternativeFileFormatTab;
                case 'Import Data From a Spreadsheet'
                    app.FileFinderTab.SelectedTab = app.MultisheetSpreadhseetTab;
            end

            app.DropDown.Value = 'Choose Utility';
            
        end

        % Value changed function: DropDown_2
        function DropDown_2ValueChanged(app, event)
            value = app.DropDown_2.Value;
            
            switch value
                case 'Choose Utility'
                case 'Alternate Series Resistance Estimate'
                    app.CCTFitOptionsTabGroup.SelectedTab  = app.SeriesResistanceEstimateTab;
                case 'Fit the Electrode and Barrier Sequentially (Select-A-Circuit Only)'
                    app.CCTFitOptionsTabGroup.SelectedTab  = app.SequentialBarrierFittingTab;
                case 'Regularize in the Time Domain (EXPERIMENTAL)'
                    app.CCTFitOptionsTabGroup.SelectedTab  = app.RecursiveTimeRegularizationTab;
                case 'Apply an Error Correction Factor (Zmeasured/Ztrue)'
                    app.CCTFitOptionsTabGroup.SelectedTab  = app.ErrorCorrectionTab;
            end

            app.DropDown_2.Value = 'Choose Utility';

            flag = app.TutorialMode;
                       
                       if flag
                            
                            msgbox({'The Global Optimization Iterations is the hyperparameter with the greatest impact on fit quality and computation time. This tab group contains adittional hyperparameters and algorithm modifiers.',...
                                newline,...
                                'The most pertinent setting is the fitting of the series resistance - by default it is extracted from the impedance data as the highest frequency impedance (R_inf). This assumes that a sufficiently high frequency is measured.'},...
                                    'Circuit Fit Utilities')
                       end
            
        end

        % Drop down opening function: DropDown_2
        function DropDown_2Opening(app, event)
            
        end

        % Clicked callback: DropDown_2
        function DropDown_2Clicked(app, event)
            item = event.InteractionInformation.Item;
             
        end

        % Menu selected function: NavigatetoHomePageMenu
        function NavigatetoHomePageMenuSelected(app, event)
             app.TabGroup.SelectedTab = app.HomeTab;
        end

        % Menu selected function: CloseApplicationMenu
        function CloseApplicationMenuSelected(app, event)
            
        end

        % Menu selected function: ForceQuitMATLABMenu
        function ForceQuitMATLABMenuSelected(app, event)
            quit force;
        end

        % Menu selected function: ToggleExplainerPopupsMenu
        function ToggleExplainerPopupsMenuSelected(app, event)
             value = app.ExplainerModeSwitch.Value;
             
            switch value
                case 'On'
                    app.TutorialMode = false;
                    app.ExplainerModeSwitch.Value = 'Off';
                case 'Off'
                    app.TutorialMode = true;
                    app.ExplainerModeSwitch.Value = 'On';
                    msgbox('Explainers On!','Heads Up!','help')
                    
            end
        end

        % Callback function: Hyperlink
        function HyperlinkClicked(app, event)
            
        end

        % Menu selected function: GithubRepositoryMenu
        function GithubRepositoryMenuSelected(app, event)
            web('https://github.com/bestgroup-Camb/AnalyZe');
        end

        % Menu selected function: ClearAllDataMenu
        function ClearAllDataMenuSelected(app, event)
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


            %% Time auto incrementer
                    app.TimePointAUEditField.Enable = true;
                    app.AutoFileTimeIncrementArray = [];
                    app.AutoFileTimeIncremementPosition = 0;
                    app.AutoIncrementTimePointperfileSwitch.Value = 'Off';
                    app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment','Time Point','per file'};
                    app.AutoIncrementTimePointperfileLabel.FontColor = '0.49,0.18,0.56';

                    
           

             f = msgbox("Data Cleared Successfully!",'Clear Data','help');
        end

        % Menu selected function: ImportDataMenu
        function ImportDataMenuSelected(app, event)
            app.TabGroup.SelectedTab = app.InportDataTab;

            flag = app.TutorialMode;
            if flag

                 msgbox('Enter Data Descriptiors (Time in Arb. Units) -> Select Find File to search for .txt (.csv) data file using explorer -> Select Load to Read data' ,...
                                            'Workflow','help');
            end
        end

        % Menu selected function: ImpedanceDataMenu
        function ImpedanceDataMenuSelected(app, event)
            try
            assignin('base','AnalyZeData',app.Data);
            msgbox('Data Export Sucessful!','Dump Data to Workspace','help')
            catch
                errordlg("Data Export Failed","Dump Data to Workspace")
            end
        end

        % Menu selected function: CircuitFitResultsMenu
        function CircuitFitResultsMenuSelected(app, event)
            try
            assignin('base','AnalyZeCCTFits',app.Fits);
            msgbox('Data Export Sucessful!','Dump Data to Workspace','help')
            catch
                errordlg("Data Export Failed","Dump Data to Workspace")
            end
        end

        % Menu selected function: TrasferFnFitResultsMenu
        function TrasferFnFitResultsMenuSelected(app, event)
            try
            assignin('base','AnalyZeTFEstFits',app.Fits_TFest);
            msgbox('Data Export Sucessful!','Dump Data to Workspace','help')
            catch
                errordlg("Data Export Failed","Dump Data to Workspace")
            end
        end

        % Menu selected function: FitaCircuitMenu
        function FitaCircuitMenuSelected(app, event)
            app.TabGroup.SelectedTab = app.AnalysisCCTFITTab;
            app.RefreshData.ButtonPushedFcn(app,event);


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
                                            'Workflow','help');

                   end
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end

        % Menu selected function: ExamineMagCrossSectionMenu
        function ExamineMagCrossSectionMenuSelected(app, event)
            app.TabGroup.SelectedTab = app.AnalysisTimeSeriesMagnitudeCrossSectionTab;
            app.RefreshData_2.ButtonPushedFcn(app,event);

               flag = app.TutorialMode;
                   if flag

                       msgbox('Refresh Data to load data options for selection -> Select Choose and Plot to define subset of the full dataset for analysis and plot the time series of the magnitude cross section -> Explore the spectrum by slecting different frequencies.' ,...
                                            'Workflow','help');
                   end
        end

        % Menu selected function: FitLaplaceTransferFunctionsMenu
        function FitLaplaceTransferFunctionsMenuSelected(app, event)
            app.TabGroup.SelectedTab = app.AnalysisEstimateTransferFunctionTab;
            app.RefreshData_3.ButtonPushedFcn(app,event);

             flag = app.TutorialMode;
                   if flag

                         msgbox('Refresh Data to load data options for selection -> Select Choose to define subset of the full dataset for Transfer function estimation -> Choose the Number of poles and zeros -> Select Go! to fit an nth order transfer dunction to all chosen data.' ,...
                                            'Workflow','help');

                   end
        end

        % Menu selected function: QuitMATLABMenu
        function QuitMATLABMenuSelected(app, event)
            quit;
        end

        % Menu selected function: ResultsMenu
        function ResultsMenuSelected(app, event)
            app.SaveResultsButton.ButtonPushedFcn(app,event);
        end

        % Menu selected function: FigureMenu
        function FigureMenuSelected(app, event)
            app.SaveFigureButton.ButtonPushedFcn(app,event);
        end

        % Menu selected function: ResultsMenu_2
        function ResultsMenu_2Selected(app, event)
            app.SaveResultsButton_3.ButtonPushedFcn(app,event);
        end

        % Menu selected function: FigureMenu_2
        function FigureMenu_2Selected(app, event)
            app.SaveFigureButton_3.ButtonPushedFcn(app,event);
        end

        % Menu selected function: LoadDisplayedDataintoTableMenu
        function LoadDisplayedDataintoTableMenuSelected(app, event)
            app.LoadDataIntoResultsTableButton.ButtonPushedFcn(app,event);
        end

        % Menu selected function: SaveDatainTableMenu
        function SaveDatainTableMenuSelected(app, event)
            app.SaveResultsButton_2.ButtonPushedFcn(app,event);
        end

        % Menu selected function: SaveFigureMenu
        function SaveFigureMenuSelected(app, event)
            app.SaveFigureButton_2.ButtonPushedFcn(app,event);
        end

        % Menu selected function: RaiseNewGithubIssueMenu
        function RaiseNewGithubIssueMenuSelected(app, event)
            web('https://github.com/bestgroup-Camb/AnalyZe/issues/new');
        end

        % Button pushed function: RefreshData_4
        function RefreshData_4ButtonPushed(app, event)
             Dat = app.Data;

                Conditions = "Select All";
                Exp = "Select All";
                Well = "Select All";
                Time = [];
                for (i=1:length(Dat))
                    Conditions(i+1) = Dat(i).Name;
                    Exp(i+1) = Dat(i).ExperimentNumber;
                    Well(i+1) = Dat(i).Well;
                    Time(i) = Dat(i).Time;
                end

                
                Conditions = unique(Conditions);
                Exp = unique(Exp);
                Well = unique(Well);
                Time = sort(unique(Time));
                    Time = string((Time'));
                    Time(end+1) = "Select All";

                app.ConditionListBox_4.Items = Conditions;
                app.ExperimentNumberListBox_4.Items = Exp;
                app.WellNumberListBox_4.Items = Well;
                app.TimeListBox_3.Items = Time;
        end

        % Button pushed function: ChooseButton_3
        function ChooseButton_3Pushed(app, event)
                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox('You can now select a subset of values by holding CTRL and multi-selecting from the list box','Heads-Up','help')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            Condition = app.ConditionListBox_4.Value;
            Well = app.WellNumberListBox_4.Value;
            Exp = app.ExperimentNumberListBox_4.Value;
            Time = string(app.TimeListBox_3.Value);

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
               switch Condition{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                        Indexes = [];
                       for j = 1:length(Condition)
                            Ind_j = find(ConditionsAll == Condition(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(ConditionsAll == Condition);
               end
                 Dat = Dat(Indexes);
                 ExpAll = ExpAll(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);


             Indexes = [];
               switch Exp{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Exp)
                            Ind_j = find(ExpAll == Exp(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(ExpAll == Exp);
               end
                 Dat = Dat(Indexes);
                 WellAll = WellAll(Indexes);
                 TimeAll = TimeAll(Indexes);

             Indexes = [];
               switch Well{1}
                    case 'Select All'
                        Indexes = [1:length(Dat)];
                   otherwise
                       Indexes = [];
                       for j = 1:length(Well)
                            Ind_j = find(WellAll == Well(j));
                            Indexes = [Indexes Ind_j];
                       end
                        %Indexes = find(WellAll == Well);
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

             %% Cluster data
                DatToViz_temp = Dat;
                DatToViz_Clustered  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
        

                while length(DatToViz_temp) >= 1
                    
                    basecase = DatToViz_temp(1);
                    temp  = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                    indexes = [];
                    var = DatToViz_temp;
                    for i = 1:length(var) 
                        var_i = var(i);
                        if (string(basecase.Name) == string(var_i.Name)) && (basecase.ExperimentNumber == var_i.ExperimentNumber) && (string(basecase.Well) == string(var_i.Well))
                            temp(end+1) = var_i;
                            indexes = [indexes,i];
                        end
                        
                    end
                    DatToViz_temp(indexes) = [];

                    % Sort Cluster By Time
                            Time_Sorted_Clustered = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {});
                    
                           while length(temp) >= 1
                               
                               min_ind = 1;
                               min_t = temp(1).Time;

                               for i = 1:length(temp)
                                    if temp(i).Time < min_t
                                        min_ind = i;
                                        min_t = temp(i).Time;
                                    end
                               end
                               Time_Sorted_Clustered = [Time_Sorted_Clustered, temp(min_ind)];
                               temp(min_ind) = [];

                           end


                    
                    DatToViz_Clustered = [DatToViz_Clustered, Time_Sorted_Clustered];

                end



            %% Load into table
             app.ChosenDataTable_4.Data = [];
            for (i = 1:length(DatToViz_Clustered))
                var = DatToViz_Clustered;
                var = var(i);
                newData = {var.Name var.ExperimentNumber var.Well var.Time};
                app.ChosenDataTable_4.Data = [app.ChosenDataTable_4.Data; newData];
            end

           app.DatToViz = DatToViz_Clustered;
        end

        % Value changed function: DimsSwitch
        function DimsSwitchValueChanged(app, event)
            value = app.DimsSwitch.Value;
            switch value
                case '2D'
                    app.IndependentVariableKnob.Value = 'Freq';
                    app.IndependentVariableKnob.Enable = false;
                    app.DimsSwitch_2.Enable = false;
                case '3D'
                    app.IndependentVariableKnob.Enable = true;
                    app.DimsSwitch_2.Enable = true;
            end
        end

        % Value changed function: BodeTypeSwitch
        function BodeTypeSwitchValueChanged(app, event)
            value = app.BodeTypeSwitch.Value;
             switch value
                case 'H(jw)'
                    app.DimsSwitch.Enable = true;
                    
                    cla(app.Pax,'reset')
                    app.Pax.Visible = false;
                    
                case 'Polar'
                    app.DimsSwitch.Value = '2D';
                    app.DimsSwitch.Enable = false;
                    
       
            end
        end

        % Button pushed function: VisualizeDataButton
        function VisualizeDataButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.VisualizeDataTab;
            app.RefreshData_4.ButtonPushedFcn(app,event);
        end

        % Menu selected function: VisualizeDataMenu
        function VisualizeDataMenuSelected(app, event)
            app.TabGroup.SelectedTab = app.VisualizeDataTab;
            app.RefreshData_4.ButtonPushedFcn(app,event);
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            
            Dat = app.DatToViz;
            if (length(Dat)>0)
                %% Plot

                HoldPlotVal = app.HoldReleaseButton.Value;
                switch HoldPlotVal
                    case true
                        hold(app.VisualiseDataAxes,'On')
                        Pval = app.BodeTypeSwitch.Value;
                        switch Pval
                            case 'Polar'
                                try
                                    hold(app.Pax,'On')
                                end
                        end

                    otherwise
                        cla(app.VisualiseDataAxes,'reset')
                        Pval = app.BodeTypeSwitch.Value;
                         switch Pval
                            case 'Polar'
                                try
                                    cla(app.Pax,'reset')
                                end
                        end
                end

                 X=[];
                 Y=[];
                 Z=[];
    
                for (i = 1:length(Dat))
                    Dat_i = Dat(i);
                    Dat_i_EIS = Dat_i.Data;
                    Freq = Dat_i_EIS.FrequencyHz;
                    Mod = Dat_i_EIS.Z2;
                    Arg = Dat_i_EIS.Phase;
                    Real = Dat_i_EIS.Z;
                    Imag = Dat_i_EIS.Z1;
                    Disp_name = string(Dat_i.Name) + ", Exp " + string(Dat_i.ExperimentNumber) + ", Well " + string(Dat_i.Well) + ", Time " + string(Dat_i.Time);

                    % Offset Align
                    OffsetVal = app.OffsetAlignSwitch.Value;
                    switch OffsetVal
                        case 'On'
                            
                            Real = (Real - Real(find(max(Freq)))) + app.OffsetEditField.Value;
                            Mod = sqrt((Real.^2)+(Imag.^2));
                            Arg = -1.*rad2deg( (atan((-1.*Imag)./(Real))) );
                    end

                    PlotTypeVal = app.PlotTypeSwitch.Value;
                    switch PlotTypeVal
                        case "Bode"
                            BodeTypeVal = app.BodeTypeSwitch.Value;
                            switch BodeTypeVal
                                case "H(jw)"
                                    DimsVal = app.DimsSwitch.Value;
                                    switch DimsVal
                                        case "2D"
                                            %Normal Bode
                                            yyaxis(app.VisualiseDataAxes, 'left')
                                            plot(app.VisualiseDataAxes, Freq, Mod, 'r','LineWidth',1,'DisplayName',Disp_name)
                                            set(app.VisualiseDataAxes,'YScale','log')
                                            set(app.VisualiseDataAxes,'XScale','log')
                                            xlabel(app.VisualiseDataAxes,'Frequency (Hz)');
                                            ylabel(app.VisualiseDataAxes,'Magnitude, |Z|, (\Omega )');
                                            hold(app.VisualiseDataAxes, 'on')
                                                
                                            yyaxis(app.VisualiseDataAxes, 'right')
                                            ylabel(app.VisualiseDataAxes,'-Phase, \angle Z (deg)');
                                            plot(app.VisualiseDataAxes, Freq, Arg, 'g','LineWidth',1,'DisplayName',Disp_name)
                                            set(app.VisualiseDataAxes,'YScale','linear')
                                        case "3D"
                                            %3D Bode
                                            IndepVarVal = app.IndependentVariableKnob.Value;
                                            switch IndepVarVal
                                                case 'Freq'
                                                    plot3(app.VisualiseDataAxes, Freq, Mod, Arg,'LineWidth',1,'DisplayName',Disp_name)                       
                                                    
                                                    set(app.VisualiseDataAxes,'XScale','log')
                                                    xlabel(app.VisualiseDataAxes,'Frequency (Hz)');

                                                    X = [X;Freq'];
                                                    
                                                case 'Time'
                                                    plot3(app.VisualiseDataAxes, ones(length(Mod),1).*Dat_i.Time , Mod, Arg,'LineWidth',1,'DisplayName',Disp_name)                     
    
                                                    xlabel(app.VisualiseDataAxes,'Time');
                                                   
                                                    X = [X;transpose(ones(length(Mod),1).*Dat_i.Time)];

                                                case 'Exp Num'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.ExperimentNumber)),length(Mod),1) , Mod, Arg,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Experiment Number');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.ExperimentNumber)),length(Mod),1))];
                                                    
                                                case 'Well Num'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.Well)),length(Mod),1) , Mod, Arg,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Well Number');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.Well)),length(Mod),1))];

                                                case 'Condition'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.Name)),length(Mod),1) , Mod, Arg,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Condition');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.Name)),length(Mod),1))];
                                            end
                                            set(app.VisualiseDataAxes,'YScale','log')
                                            ylabel(app.VisualiseDataAxes,'Magnitude, |Z|, (\Omega )');
                                            zlabel(app.VisualiseDataAxes,'-Phase, \angle Z (deg)');
                                            hold(app.VisualiseDataAxes, 'on')
                                            grid(app.VisualiseDataAxes,'on')
                                            Y = [Y;Mod'];
                                            Z = [Z;Arg'];

                                    end
                                        

                                case "Polar"
                                    %Polar Bode
                                    app.VisualiseDataAxes.Visible = false;
                                    app.Pax.Visible = true;
                                    hold(app.Pax,'on')
                                    polarplot(app.Pax,deg2rad(Arg),Mod,'DisplayName',Disp_name)
                            end
                        case "Nyquist"
                            DimsVal = app.DimsSwitch.Value;
                                    switch DimsVal
                                        case "2D"
                                            %Normal Nyq
                                                plot(app.VisualiseDataAxes , Real, Imag,'LineWidth',1,'DisplayName',Disp_name)
                                                xlabel(app.VisualiseDataAxes,'Real(Z)');
                                                ylabel( app.VisualiseDataAxes, '-Imag(Z)');
                                                Re_max = max(Real);
                                                Im_max = max(Imag);
                                                Re_min = min(Real);
                                                Im_min = min(Imag);
                                                NetMin = min([Re_min Im_min]);
                                                NetMax = max([Re_max Im_max]);
                                                Current_xlim = app.VisualiseDataAxes.XLim;
                                                Current_ylim = app.VisualiseDataAxes.YLim;
                                                 
                                                if Current_xlim == Current_ylim
                                                    if NetMin < Current_xlim(1)
                                                        Current_xlim(1) = NetMin;
                                                        Current_ylim(1) = NetMin;
                                                    end
                                                    if NetMax > Current_xlim(2)
                                                        Current_xlim(2) = NetMax;
                                                        Current_ylim(2) = NetMax;
                                                    end
                                                else
                                                    xlim(app.VisualiseDataAxes,[NetMin NetMax])
                                                    ylim(app.VisualiseDataAxes,[NetMin NetMax])
                                                end
                                                hold(app.VisualiseDataAxes, 'on')
                                                grid(app.VisualiseDataAxes, 'on')
                                                
                                        case "3D"
                                             %3D Nyq
                                             IndepVarVal = app.IndependentVariableKnob.Value;
                                            switch IndepVarVal
                                                case 'Freq'
                                                    plot3(app.VisualiseDataAxes, Freq, Real, Imag,'LineWidth',1,'DisplayName',Disp_name)
                                                    
                                                    set(app.VisualiseDataAxes,'XScale','log')
                                                    xlabel(app.VisualiseDataAxes,'Frequency (Hz)');

                                                    X = [X;Freq'];
                                                    
                                                case 'Time'
                                                    plot3(app.VisualiseDataAxes, ones(length(Mod),1).*Dat_i.Time , Real, Imag,'LineWidth',1,'DisplayName',Disp_name)                     
    
                                                    xlabel(app.VisualiseDataAxes,'Time');
                                                   
                                                    X = [X;transpose(ones(length(Mod),1).*Dat_i.Time)];

                                                case 'Exp Num'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.ExperimentNumber)),length(Mod),1) , Real, Imag,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Experiment Number');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.ExperimentNumber)),length(Mod),1))];
                                                    
                                                case 'Well Num'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.Well)),length(Mod),1) , Real, Imag,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Well Number');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.Well)),length(Mod),1))];

                                                case 'Condition'
                                                    plot3(app.VisualiseDataAxes, repmat(categorical(string(Dat_i.Name)),length(Mod),1) , Real, Imag,'LineWidth',1,'DisplayName',Disp_name)

                                                    xlabel(app.VisualiseDataAxes,'Condition');
                                                   
                                                    X = [X;transpose(repmat(categorical(string(Dat_i.Name)),length(Mod),1))];
                                            end
                                            ylabel(app.VisualiseDataAxes,'Real(Z)');
                                            zlabel(app.VisualiseDataAxes,'-Imag(Z)');
                                            hold(app.VisualiseDataAxes, 'on')
                                            grid(app.VisualiseDataAxes, 'on')
                                            Y = [Y;Real'];
                                            Z = [Z;Imag'];
                                    end          
                    end
    
                end
            else
                errordlg({'No Data Selected!'},'Choose Data')
            end

            legendVal = app.LegendSwitch.Value;
            switch legendVal
                case 'On'
                    PolarVal = app.BodeTypeSwitch.Value;
                    switch PolarVal
                        case 'Polar'
                            legend(app.Pax,'Location','best');
                        otherwise
                            legend(app.VisualiseDataAxes,'Location','best')
                    end
                    
            end

            %% Surface plots
            switch (app.DimsSwitch.Value)
                case '3D'
                    SurfVal = app.DimsSwitch_2.Value;
                    switch SurfVal
                        case 'Surface'
                            hold(app.VisualiseDataAxes,'Off')
                            legend(app.VisualiseDataAxes, 'Off')
                            
                            SurfTypeVal = app.SurfaceTypeDropDown.Value;
                            switch SurfTypeVal
                                case 'mesh'
                                    mesh(app.VisualiseDataAxes,X,Y,Z)
                                case 'surf'
                                    surf(app.VisualiseDataAxes,X,Y,Z)
                                case 'waterfall'
                                    waterfall(app.VisualiseDataAxes,X,Y,Z)
                                case 'contour'
                                    contour(app.VisualiseDataAxes,X,Y,Z)
                            end
                            colormap(app.VisualiseDataAxes, app.SurfaceColourDropDown.Value);
                    end
            end

            %% Mod plot
            BodeTypeVal = app.BodeTypeSwitch.Value;
            switch BodeTypeVal
                case 'Polar'
                otherwise
                    DimsVal = app.DimsSwitch.Value;

                    PlotLimsVal = app.SpecifyPlotLimitsSwitch.Value;
                    
                    switch PlotLimsVal
                        case 'On'
                            yyaxis(app.VisualiseDataAxes, 'left')
                            xlim(app.VisualiseDataAxes,[app.xminEditField.Value app.xmaxEditField.Value]);
                            ylim(app.VisualiseDataAxes,[app.yminEditField.Value app.ymaxEditField.Value]);
                            switch DimsVal
                                case '3D'
                                    zlim(app.VisualiseDataAxes,[app.zminEditField.Value app.zmaxEditField.Value]);
                            end
                    end
            end

            

        end

        % Value changed function: PlotTypeSwitch
        function PlotTypeSwitchValueChanged(app, event)
            value = app.PlotTypeSwitch.Value;
            switch value
                case "Nyquist"
                    app.BodeTypeSwitch.Enable = false;
                case "Bode"
                    app.BodeTypeSwitch.Enable = true;
            end
        end

        % Value changed function: HoldReleaseButton
        function HoldReleaseButtonValueChanged(app, event)
            
            value = app.HoldReleaseButton.Value;
            switch value
                case true
                    TabGroupChildren = allchild(app.VizDataPlotParamsTabGroup);
                    for tgc = 1:length(TabGroupChildren)
                       children = allchild(TabGroupChildren(tgc));
                        for c = 1:length(children)
                            temp_component = children(c);
                            temp_component.Enable = false;
                        end
                    end
                case false
                    TabGroupChildren = allchild(app.VizDataPlotParamsTabGroup);
                    for tgc = 1:length(TabGroupChildren)
                       children = allchild(TabGroupChildren(tgc));
                        for c = 1:length(children)
                            temp_component = children(c);
                            temp_component.Enable = true;
                        end
                    end

                    %Clear plots
                    cla(app.VisualiseDataAxes,'reset')
                         try
                            cla(app.Pax,'reset')
                            
                         end

                    %Additional active/inactive rules
                    dVal = app.DimsSwitch.Value;
                    switch dVal
                        case '2D'
                            app.IndependentVariableKnob.Enable = false;
                            app.DimsSwitch_2.Enable = false;
                    end
                    pvalue = app.BodeTypeSwitch.Value;
                     switch pvalue
                        case 'Polar'
                            app.DimsSwitch.Value = '2D';
                            app.DimsSwitch.Enable = false;
                         otherwise
                             app.Pax.Visible = false;
                     end

            end
        end

        % Button pushed function: SaveFigureButton_4
        function SaveFigureButton_4Pushed(app, event)
             % Get File Type

                 FileTypeList = {'jpeg','png','tiff','tiffn','meta','pdf','eps','epsc','eps2','epsc2','meta','svg'};
                 [indx,tf] = listdlg('PromptString',{'Select a File Type',''},...
                'SelectionMode','single','ListString',FileTypeList);
                 if isempty(indx), msgbox('Operation Cancelled','Save Fig','warn'); return; end 
                FileType = FileTypeList{indx};


            
           % Create a temporary figure with axes.
                fig_temp = figure;
                fig_temp.Visible = 'off';
                fig_temp.Position = app.UIFigure.Position;
                switch (app.BodeTypeSwitch.Value)
                    case 'Polar'
                        figAxes = polaraxes(fig_temp);
                    otherwise
                        figAxes = axes(fig_temp);
                end
                 
          
            % Copy all UIAxes children, take over axes limits and aspect ratio.            
                % Copy all UIAxes children, take over axes limits and aspect ratio.
                    % Polar or Cartesian axes
                        UserFileName = inputdlg("Enter File Name: ");
                        selpath = uigetdir();

                        %% Bring UI back to top
                          drawnow;
                          figure(app.UIFigure)
        
                        BodeTypeVal = app.BodeTypeSwitch.Value;
                        switch BodeTypeVal
                            case 'Polar'
                                axs = app.Pax;
                                FullFileName = selpath + "\AnalyZeVisualizer_Polar_" + string(UserFileName);
                                allChildren = findall(axs,'Type','Line')
                            case 'H(jw)'
                                axs = app.VisualiseDataAxes;
                                FullFileName = selpath + "\AnalyZeVisualizer_" + string(UserFileName);
                                
                                 allChildren = findall(axs,'Type','Line');
                                 if isempty(allChildren)
                                    allChildren = findall(axs,'Type','Scatter');
                                end
                                if isempty(allChildren)
                                    allChildren = findall(axs,'Type','Contour');
                                end
                                if isempty(allChildren)
                                    allChildren = findall(axs,'Type','Surface');
                                end
                        end

                switch (app.BodeTypeSwitch.Value)
                    case 'Polar'

                        copyobj(allChildren, figAxes)
                        figAxes.RLim = axs.RLim;
                        %figAxes.RAxis = axs.RAxis;
                        
                        figAxes.ThetaLim = axs.ThetaLim;
                        %figAxes.ThetaAxis = axs.ThetaAxis;
                        
                        
                    otherwise
                        PlotTypeVal = app.PlotTypeSwitch.Value;
                        switch PlotTypeVal
                            case 'Bode'
                                switch (app.DimsSwitch.Value)
                                    case '2D'
                                        yyaxis(axs,"right")
                                        yyaxis(figAxes,"right")
        
                                        allChildren = findall(axs,'Type','Line');
        
                                        copyobj(allChildren(1:(length(allChildren)/2)), figAxes)
                                        figAxes.XLim = axs.XLim;
                                        figAxes.XScale = axs.XScale;
                                        figAxes.YLim = axs.YLim;
                                        figAxes.YScale = axs.YScale;
                                        figAxes.ZLim = axs.ZLim;
                                        figAxes.PlotBoxAspectRatio = axs.PlotBoxAspectRatio;
                                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize; 
                
                                        yyaxis(axs,"left")
                                        yyaxis(figAxes,"left")
                                        
                                        %allChildren = findall(axs,'Type','Line'); %axs.XAxis.Parent.Children;
                                        copyobj(allChildren((length(allChildren)/2)+1:end), figAxes)
                                        figAxes.XLim = axs.XLim;
                                        figAxes.XScale = axs.XScale;
                                        figAxes.YLim = axs.YLim;
                                        figAxes.YScale = axs.YScale;
                                        figAxes.ZLim = axs.ZLim;
                                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
                                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize; 
        
                                    otherwise %Bode 3D
                                        copyobj(allChildren, figAxes)
                                        
                                        switch (app.IndependentVariableKnob)
                                            case 'Freq'
                                                figAxes.XLim = axs.XLim;
                                                figAxes.XScale = axs.XScale;
                                            case 'Time'
                                                figAxes.XLim = axs.XLim;
                                                figAxes.XScale = axs.XScale;
                                            otherwise
                                                %figAxes.XTick = axs.XTick;
                                                figAxes.XTickLabel = axs.XTickLabel;
                                        end

                                        figAxes.YLim = axs.YLim;
                                        figAxes.YScale = axs.YScale;
                                        figAxes.ZLim = axs.ZLim;
                                        figAxes.PlotBoxAspectRatio = axs.PlotBoxAspectRatio;
                                        %figAxes.DataAspectRatio = axs.DataAspectRatio;
        
                                end
        
                            otherwise %Nyquist
                                copyobj(allChildren, figAxes)
                                switch (app.IndependentVariableKnob)
                                    case 'Freq'
                                        figAxes.XLim = axs.XLim;
                                        figAxes.XScale = axs.XScale;
                                    case 'Time'
                                        figAxes.XLim = axs.XLim;
                                        figAxes.XScale = axs.XScale;
                                    otherwise
                                        %figAxes.XTick = axs.XTick;
                                        figAxes.XTickLabel = axs.XTickLabel;
                                end
                                figAxes.YLim = axs.YLim;
                                figAxes.YScale = axs.YScale;
                                figAxes.ZLim = axs.ZLim;
                                figAxes.PlotBoxAspectRatio = axs.PlotBoxAspectRatio;
                                %figAxes.DataAspectRatio = axs.DataAspectRatio;               
        
                        end
        
                        fig_temp.CurrentAxes.YLabel.String = axs.YLabel.String;
                        fig_temp.CurrentAxes.YLabel.FontSize = axs.YLabel.FontSize;
                        fig_temp.CurrentAxes.XLabel.String = axs.XLabel.String;
                        fig_temp.CurrentAxes.XLabel.FontSize = axs.XLabel.FontSize;
                        fig_temp.CurrentAxes.Title.String = axs.Title.String;
                        fig_temp.CurrentAxes.Title.FontSize = axs.Title.FontSize;
        
                        figAxes.XGrid = axs.XGrid;
                        figAxes.YGrid = axs.YGrid;
        
                        DimsVal = app.DimsSwitch.Value;
                        switch DimsVal
                            case '3D'
                                figAxes.CameraPosition = axs.CameraPosition;
                                figAxes.CameraViewAngle = axs.CameraViewAngle;
                                figAxes.ZScale = axs.ZScale;
                                fig_temp.CurrentAxes.ZLabel.String = axs.ZLabel.String;
                                fig_temp.CurrentAxes.ZLabel.FontSize = axs.ZLabel.FontSize;
                                figAxes.PlotBoxAspectRatio = axs.PlotBoxAspectRatio;
                                figAxes.DataAspectRatio = axs.DataAspectRatio; 
                                figAxes.ZGrid = axs.ZGrid;
                        end
                end


                %%legend

                 try
                    lgnd_names= [];
                    for l= 1:length(axs.Legend.String)
                        lgndName_l = axs.Legend.String{l};
                        lgnd_names = [lgnd_names;{lgndName_l}];
                    end
                    %lgndName1 = axs.Legend.String{1};
                    lgd = legend(figAxes,lgnd_names);
                    lgd.Box = axs.Legend.Box;
                    lgd.Position = axs.Legend.Position;
                        answer = questdlg('Move legend outside of plot area if present?', ...
	                    'Legend location', ...
	                    'Yes','No','No');
                        switch answer
                            case 'Yes'
                                lgd.Location = 'bestoutside' ;
                                %legend(figAxes,'Location','bestoutside');
                            case 'No'
                                lgd.Position = axs.Legend.Position;
                        end
                    lgd.Visible = "on";
                end


            % Save as png and fig files.
                saveas(fig_temp, FullFileName, FileType);
                %saveas(fig_temp, FullFileName, 'fig');
                fig_temp.Visible = 'on';
                savefig(fig_temp, FullFileName);
            % Delete the temporary figure.
                delete(fig_temp);


                msgbox("File Saved as " + "\AnalyZeResults_<PlotType>_" + string(UserFileName))
 
        end

        % Menu selected function: SaveFigureMenu_2
        function SaveFigureMenu_2Selected(app, event)
            app.SaveFigureButton_4.ButtonPushedFcn(app,event);
        end

        % Button pushed function: ResetAccumulatorButton
        function ResetAccumulatorButtonPushed(app, event)
            msgbox("Data contributing to mean calculation reset.",'Data Accumulator Cleared!','help')
                    cla(app.CSDataPlot,'reset')
                    cla(app.CSResultsPlot,'reset')
                    app.CrossSectionResultsCumulative = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {},'Indexes',{});% Description
                    app.CrossSectionResultsCurrentCondition = struct('Name', {'Start'},  'ExperimentNumber', {-1}, 'Well', {'A0'} , 'CSResults', {});
        end

        % Value changed function: WaterFallSwitch
        function WaterFallSwitchValueChanged(app, event)
            value = app.WaterFallSwitch.Value;
            cla(app.CSResultsPlot,'reset')
        end

        % Value changed function: OffsetAlignSwitch
        function OffsetAlignSwitchValueChanged(app, event)
            value = app.OffsetAlignSwitch.Value;
            switch value
                case 'On'

                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                flag = app.TutorialMode;
                   
                   if flag
                        msgbox({'Uniformly subtract the real component of the highest frequency measurement (for sufficiently high frequency, corresponds to the system series resistance).',...
                                        '',...
                                        'Optionally, uniformly offset the data by a real value',...
                                        'NOTE: Bode plots are plotted on logarithmic scales and thus relatively small or large real offsets can distort the appearance of the data.',...
                                        '',...
                                        'i.e. Let Z = (Re(Z) + jIm(Z)) - Re(Z)|fmax + Offset',...
                                        'Then, |Z| = sqrt(Re(Z)^2 + Im(Z)^2)',...
                                        '    Arg(Z) = atan(Im(Z)/Re(Z))'},'Explainer','help')
                   end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
        end

        % Button pushed function: PlotResultsfromTableSelectionButton_2
        function PlotResultsfromTableSelectionButton_2Pushed(app, event)
            app.PlotResultsfromTableSelectionButton.ButtonPushedFcn(app,event);
            app.TabGroup2.SelectedTab = app.PlotsTab;
        end

        % Value changed function: PlotAndExportZSwitch
        function PlotAndExportZSwitchValueChanged(app, event)
            value = app.PlotAndExportZSwitch.Value;
            app.PlotAndExportZSwitch_2.Value = value;
        end

        % Value changed function: PlotAndExportZSwitch_2
        function PlotAndExportZSwitch_2ValueChanged(app, event)
            value = app.PlotAndExportZSwitch_2.Value;
             app.PlotAndExportZSwitch.Value = value;
        end

        % Button pushed function: MoreInfoCCTFitButton
        function MoreInfoCCTFitButtonPushed(app, event)
            msgbox({'This module is principally designed to fit impedance data which incoporates a biological barrier (commonly an epithelial barrier or lipid bilayer);',...
                    'which is modelled as a parallel resistance and capacitance (R//C) which are denoted Rb and Cb.',...
                    '',...
                    'The Write-A-Circuit submodule allows for arbitrary circuit models, and need not include a barrier (R//C) component.'},...
                    'Circuit Fitting Module Info','help')
        end

        % Value changed function: DropDown_3
        function DropDown_3ValueChanged(app, event)
            value = app.DropDown_3.Value;
            
            switch value
                case 'Input a Circuit Model to Fit'
                case 'Write an arbitrary circuit (Recommended)'
                    app.CircuitToFit.SelectedTab  = app.WriteACircuitTab;
                case 'Select from a list of commonly used circuit models'
                    app.CircuitToFit.SelectedTab  = app.SelectACircuitTab;
                case 'Block-build a circuit (Deprecated)'
                    app.CircuitToFit.SelectedTab  = app.BuildACircuitMaxValuesTab;
            end

            app.DropDown_3.Value = 'Input a Circuit Model to Fit';

            app.CircuitToFitSelectionChanged(app)
            
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

            % Create AnalyZeMenu
            app.AnalyZeMenu = uimenu(app.UIFigure);
            app.AnalyZeMenu.Text = 'AnalyZe';

            % Create NavigatetoHomePageMenu
            app.NavigatetoHomePageMenu = uimenu(app.AnalyZeMenu);
            app.NavigatetoHomePageMenu.MenuSelectedFcn = createCallbackFcn(app, @NavigatetoHomePageMenuSelected, true);
            app.NavigatetoHomePageMenu.Text = 'Navigate to Home Page';

            % Create CloseApplicationMenu
            app.CloseApplicationMenu = uimenu(app.AnalyZeMenu);
            app.CloseApplicationMenu.MenuSelectedFcn = createCallbackFcn(app, @CloseApplicationMenuSelected, true);
            app.CloseApplicationMenu.Text = 'Close Application';

            % Create QuitMATLABMenu
            app.QuitMATLABMenu = uimenu(app.CloseApplicationMenu);
            app.QuitMATLABMenu.MenuSelectedFcn = createCallbackFcn(app, @QuitMATLABMenuSelected, true);
            app.QuitMATLABMenu.Text = 'Quit MATLAB';

            % Create ForceQuitMATLABMenu
            app.ForceQuitMATLABMenu = uimenu(app.CloseApplicationMenu);
            app.ForceQuitMATLABMenu.MenuSelectedFcn = createCallbackFcn(app, @ForceQuitMATLABMenuSelected, true);
            app.ForceQuitMATLABMenu.Text = 'Force Quit MATLAB';

            % Create DataMenu
            app.DataMenu = uimenu(app.UIFigure);
            app.DataMenu.Text = 'Data';

            % Create ImportDataMenu
            app.ImportDataMenu = uimenu(app.DataMenu);
            app.ImportDataMenu.MenuSelectedFcn = createCallbackFcn(app, @ImportDataMenuSelected, true);
            app.ImportDataMenu.Text = 'Import Data';

            % Create ClearAllDataMenu
            app.ClearAllDataMenu = uimenu(app.DataMenu);
            app.ClearAllDataMenu.MenuSelectedFcn = createCallbackFcn(app, @ClearAllDataMenuSelected, true);
            app.ClearAllDataMenu.Text = 'Clear All Data';

            % Create DumpDataToMATLABWorkspaceMenu
            app.DumpDataToMATLABWorkspaceMenu = uimenu(app.DataMenu);
            app.DumpDataToMATLABWorkspaceMenu.Text = 'Dump Data To MATLAB Workspace';

            % Create ImpedanceDataMenu
            app.ImpedanceDataMenu = uimenu(app.DumpDataToMATLABWorkspaceMenu);
            app.ImpedanceDataMenu.MenuSelectedFcn = createCallbackFcn(app, @ImpedanceDataMenuSelected, true);
            app.ImpedanceDataMenu.Text = 'Impedance Data';

            % Create CircuitFitResultsMenu
            app.CircuitFitResultsMenu = uimenu(app.DumpDataToMATLABWorkspaceMenu);
            app.CircuitFitResultsMenu.MenuSelectedFcn = createCallbackFcn(app, @CircuitFitResultsMenuSelected, true);
            app.CircuitFitResultsMenu.Text = 'Circuit Fit Results';

            % Create TrasferFnFitResultsMenu
            app.TrasferFnFitResultsMenu = uimenu(app.DumpDataToMATLABWorkspaceMenu);
            app.TrasferFnFitResultsMenu.MenuSelectedFcn = createCallbackFcn(app, @TrasferFnFitResultsMenuSelected, true);
            app.TrasferFnFitResultsMenu.Text = 'Trasfer Fn Fit Results';

            % Create VisualizeDataMenu
            app.VisualizeDataMenu = uimenu(app.DataMenu);
            app.VisualizeDataMenu.MenuSelectedFcn = createCallbackFcn(app, @VisualizeDataMenuSelected, true);
            app.VisualizeDataMenu.Text = 'Visualize Data';

            % Create SaveFigureMenu_2
            app.SaveFigureMenu_2 = uimenu(app.VisualizeDataMenu);
            app.SaveFigureMenu_2.MenuSelectedFcn = createCallbackFcn(app, @SaveFigureMenu_2Selected, true);
            app.SaveFigureMenu_2.Text = 'Save Figure';

            % Create ToolboxMenu
            app.ToolboxMenu = uimenu(app.UIFigure);
            app.ToolboxMenu.Text = 'Toolbox';

            % Create CircuitFittingMenu
            app.CircuitFittingMenu = uimenu(app.ToolboxMenu);
            app.CircuitFittingMenu.Text = 'Circuit Fitting';

            % Create FitaCircuitMenu
            app.FitaCircuitMenu = uimenu(app.CircuitFittingMenu);
            app.FitaCircuitMenu.MenuSelectedFcn = createCallbackFcn(app, @FitaCircuitMenuSelected, true);
            app.FitaCircuitMenu.Text = 'Fit a Circuit!';

            % Create SaveMenu
            app.SaveMenu = uimenu(app.CircuitFittingMenu);
            app.SaveMenu.Text = 'Save';

            % Create ResultsMenu
            app.ResultsMenu = uimenu(app.SaveMenu);
            app.ResultsMenu.MenuSelectedFcn = createCallbackFcn(app, @ResultsMenuSelected, true);
            app.ResultsMenu.Text = 'Results';

            % Create FigureMenu
            app.FigureMenu = uimenu(app.SaveMenu);
            app.FigureMenu.MenuSelectedFcn = createCallbackFcn(app, @FigureMenuSelected, true);
            app.FigureMenu.Text = 'Figure';

            % Create TimeSeriesMagnitudeCrossSectionMenu
            app.TimeSeriesMagnitudeCrossSectionMenu = uimenu(app.ToolboxMenu);
            app.TimeSeriesMagnitudeCrossSectionMenu.Text = 'Time Series Magnitude Cross Section';

            % Create ExamineMagCrossSectionMenu
            app.ExamineMagCrossSectionMenu = uimenu(app.TimeSeriesMagnitudeCrossSectionMenu);
            app.ExamineMagCrossSectionMenu.MenuSelectedFcn = createCallbackFcn(app, @ExamineMagCrossSectionMenuSelected, true);
            app.ExamineMagCrossSectionMenu.Text = 'Examine Mag Cross Section';

            % Create SaveMenu_3
            app.SaveMenu_3 = uimenu(app.TimeSeriesMagnitudeCrossSectionMenu);
            app.SaveMenu_3.Text = 'Save';

            % Create LoadDisplayedDataintoTableMenu
            app.LoadDisplayedDataintoTableMenu = uimenu(app.SaveMenu_3);
            app.LoadDisplayedDataintoTableMenu.MenuSelectedFcn = createCallbackFcn(app, @LoadDisplayedDataintoTableMenuSelected, true);
            app.LoadDisplayedDataintoTableMenu.Text = 'Load Displayed Data into Table';

            % Create SaveDatainTableMenu
            app.SaveDatainTableMenu = uimenu(app.SaveMenu_3);
            app.SaveDatainTableMenu.MenuSelectedFcn = createCallbackFcn(app, @SaveDatainTableMenuSelected, true);
            app.SaveDatainTableMenu.Text = 'Save Data in Table';

            % Create SaveFigureMenu
            app.SaveFigureMenu = uimenu(app.SaveMenu_3);
            app.SaveFigureMenu.MenuSelectedFcn = createCallbackFcn(app, @SaveFigureMenuSelected, true);
            app.SaveFigureMenu.Text = 'Save Figure';

            % Create TransferFunctionEstimationMenu
            app.TransferFunctionEstimationMenu = uimenu(app.ToolboxMenu);
            app.TransferFunctionEstimationMenu.Text = 'Transfer Function Estimation';

            % Create FitLaplaceTransferFunctionsMenu
            app.FitLaplaceTransferFunctionsMenu = uimenu(app.TransferFunctionEstimationMenu);
            app.FitLaplaceTransferFunctionsMenu.MenuSelectedFcn = createCallbackFcn(app, @FitLaplaceTransferFunctionsMenuSelected, true);
            app.FitLaplaceTransferFunctionsMenu.Text = 'Fit Laplace Transfer Functions';

            % Create SaveMenu_2
            app.SaveMenu_2 = uimenu(app.TransferFunctionEstimationMenu);
            app.SaveMenu_2.Text = 'Save';

            % Create ResultsMenu_2
            app.ResultsMenu_2 = uimenu(app.SaveMenu_2);
            app.ResultsMenu_2.MenuSelectedFcn = createCallbackFcn(app, @ResultsMenu_2Selected, true);
            app.ResultsMenu_2.Text = 'Results';

            % Create FigureMenu_2
            app.FigureMenu_2 = uimenu(app.SaveMenu_2);
            app.FigureMenu_2.MenuSelectedFcn = createCallbackFcn(app, @FigureMenu_2Selected, true);
            app.FigureMenu_2.Text = 'Figure';

            % Create HelpMenu
            app.HelpMenu = uimenu(app.UIFigure);
            app.HelpMenu.Text = 'Help';

            % Create ToggleExplainerPopupsMenu
            app.ToggleExplainerPopupsMenu = uimenu(app.HelpMenu);
            app.ToggleExplainerPopupsMenu.MenuSelectedFcn = createCallbackFcn(app, @ToggleExplainerPopupsMenuSelected, true);
            app.ToggleExplainerPopupsMenu.Text = 'Toggle Explainer Pop-ups';

            % Create GithubRepositoryMenu
            app.GithubRepositoryMenu = uimenu(app.HelpMenu);
            app.GithubRepositoryMenu.MenuSelectedFcn = createCallbackFcn(app, @GithubRepositoryMenuSelected, true);
            app.GithubRepositoryMenu.Text = 'Github Repository';

            % Create RaiseNewGithubIssueMenu
            app.RaiseNewGithubIssueMenu = uimenu(app.GithubRepositoryMenu);
            app.RaiseNewGithubIssueMenu.MenuSelectedFcn = createCallbackFcn(app, @RaiseNewGithubIssueMenuSelected, true);
            app.RaiseNewGithubIssueMenu.Text = 'Raise New Github Issue';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.TabLocation = 'bottom';
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Position = [2 1 1021 734];

            % Create HomeTab
            app.HomeTab = uitab(app.TabGroup);
            app.HomeTab.Title = 'Home';
            app.HomeTab.Tag = 'Home';

            % Create Image2_2
            app.Image2_2 = uiimage(app.HomeTab);
            app.Image2_2.ScaleMethod = 'fill';
            app.Image2_2.Visible = 'off';
            app.Image2_2.Position = [1 0 1020 709];
            app.Image2_2.ImageSource = fullfile(pathToMLAPP, 'images', 'Bioelectroneress.png');

            % Create Image2
            app.Image2 = uiimage(app.HomeTab);
            app.Image2.ScaleMethod = 'fill';
            app.Image2.Position = [-1 1 1020 709];
            app.Image2.ImageSource = fullfile(pathToMLAPP, 'images', 'Bioelectronicist.png');

            % Create AnalyZeLabel
            app.AnalyZeLabel = uilabel(app.HomeTab);
            app.AnalyZeLabel.FontName = 'Garamond';
            app.AnalyZeLabel.FontSize = 200;
            app.AnalyZeLabel.FontWeight = 'bold';
            app.AnalyZeLabel.FontColor = [0 1 1];
            app.AnalyZeLabel.Position = [161 394 733 266];
            app.AnalyZeLabel.Text = 'AnalyZe';

            % Create BioImpedanceDataAnalysisToolLabel
            app.BioImpedanceDataAnalysisToolLabel = uilabel(app.HomeTab);
            app.BioImpedanceDataAnalysisToolLabel.FontSize = 36;
            app.BioImpedanceDataAnalysisToolLabel.FontColor = [0 1 1];
            app.BioImpedanceDataAnalysisToolLabel.Position = [473 374 550 47];
            app.BioImpedanceDataAnalysisToolLabel.Text = 'BioImpedance Data Analysis Tool';

            % Create Image
            app.Image = uiimage(app.HomeTab);
            app.Image.Position = [739 -3 264 265];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'images', 'BEST_Logo.png');

            % Create DouglasvanNiekerkVersion5March2024Label
            app.DouglasvanNiekerkVersion5March2024Label = uilabel(app.HomeTab);
            app.DouglasvanNiekerkVersion5March2024Label.FontSize = 14;
            app.DouglasvanNiekerkVersion5March2024Label.FontColor = [0 0.4471 0.7412];
            app.DouglasvanNiekerkVersion5March2024Label.Position = [734 9 286 26];
            app.DouglasvanNiekerkVersion5March2024Label.Text = 'Douglas van Niekerk Version 5 - March 2024';

            % Create ImportDataButton
            app.ImportDataButton = uibutton(app.HomeTab, 'push');
            app.ImportDataButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataButtonPushed, true);
            app.ImportDataButton.Icon = fullfile(pathToMLAPP, 'images', 'import_icon.png');
            app.ImportDataButton.FontSize = 24;
            app.ImportDataButton.FontWeight = 'bold';
            app.ImportDataButton.FontColor = [0.4667 0.6745 0.1882];
            app.ImportDataButton.Position = [25 244 141 88];
            app.ImportDataButton.Text = {'Import'; 'Data'};

            % Create FitEquivalentCircuitButton
            app.FitEquivalentCircuitButton = uibutton(app.HomeTab, 'push');
            app.FitEquivalentCircuitButton.ButtonPushedFcn = createCallbackFcn(app, @FitEquivalentCircuitButtonPushed, true);
            app.FitEquivalentCircuitButton.Icon = fullfile(pathToMLAPP, 'images', 'circuit_icon.png');
            app.FitEquivalentCircuitButton.FontSize = 18;
            app.FitEquivalentCircuitButton.FontWeight = 'bold';
            app.FitEquivalentCircuitButton.FontColor = [0.851 0.3255 0.098];
            app.FitEquivalentCircuitButton.Position = [191 258 303 60];
            app.FitEquivalentCircuitButton.Text = 'Fit Equivalent Circuit';

            % Create TimeSeriesMagnitudeCrossSectionButton
            app.TimeSeriesMagnitudeCrossSectionButton = uibutton(app.HomeTab, 'push');
            app.TimeSeriesMagnitudeCrossSectionButton.ButtonPushedFcn = createCallbackFcn(app, @TimeSeriesMagnitudeCrossSectionButtonPushed, true);
            app.TimeSeriesMagnitudeCrossSectionButton.Icon = fullfile(pathToMLAPP, 'images', 'Section_icon.png');
            app.TimeSeriesMagnitudeCrossSectionButton.FontSize = 18;
            app.TimeSeriesMagnitudeCrossSectionButton.FontWeight = 'bold';
            app.TimeSeriesMagnitudeCrossSectionButton.FontColor = [0.851 0.3255 0.098];
            app.TimeSeriesMagnitudeCrossSectionButton.Position = [370 107 307 67];
            app.TimeSeriesMagnitudeCrossSectionButton.Text = {'Time Series'; 'Magnitude Cross Section'};

            % Create FitTransferFunctionButton
            app.FitTransferFunctionButton = uibutton(app.HomeTab, 'push');
            app.FitTransferFunctionButton.ButtonPushedFcn = createCallbackFcn(app, @FitTransferFunctionButtonPushed, true);
            app.FitTransferFunctionButton.Icon = fullfile(pathToMLAPP, 'images', 'TransferFn_icon.png');
            app.FitTransferFunctionButton.FontSize = 18;
            app.FitTransferFunctionButton.FontWeight = 'bold';
            app.FitTransferFunctionButton.FontColor = [0.851 0.3255 0.098];
            app.FitTransferFunctionButton.Position = [277 188 270 57];
            app.FitTransferFunctionButton.Text = 'Fit Transfer Function';

            % Create ExplainerModeSwitchLabel
            app.ExplainerModeSwitchLabel = uilabel(app.HomeTab);
            app.ExplainerModeSwitchLabel.HorizontalAlignment = 'center';
            app.ExplainerModeSwitchLabel.FontSize = 18;
            app.ExplainerModeSwitchLabel.FontWeight = 'bold';
            app.ExplainerModeSwitchLabel.FontColor = [0 1 1];
            app.ExplainerModeSwitchLabel.Position = [22 32 138 23];
            app.ExplainerModeSwitchLabel.Text = 'Explainer Mode';

            % Create ExplainerModeSwitch
            app.ExplainerModeSwitch = uiswitch(app.HomeTab, 'slider');
            app.ExplainerModeSwitch.ValueChangedFcn = createCallbackFcn(app, @ExplainerModeSwitchValueChanged, true);
            app.ExplainerModeSwitch.FontSize = 18;
            app.ExplainerModeSwitch.FontColor = [0 1 1];
            app.ExplainerModeSwitch.Position = [49 60 90 40];
            app.ExplainerModeSwitch.Value = 'On';

            % Create Hyperlink
            app.Hyperlink = uihyperlink(app.HomeTab);
            app.Hyperlink.HyperlinkClickedFcn = createCallbackFcn(app, @HyperlinkClicked, true);
            app.Hyperlink.FontSize = 24;
            app.Hyperlink.FontColor = [0 1 1];
            app.Hyperlink.Tooltip = {'Navigate to our Github project page'};
            app.Hyperlink.URL = 'https://github.com/bestgroup-Camb/AnalyZe';
            app.Hyperlink.Position = [861 557 154 47];
            app.Hyperlink.Text = 'Lend a hand!';

            % Create Image5
            app.Image5 = uiimage(app.HomeTab);
            app.Image5.Position = [857 586 151 129];
            app.Image5.ImageSource = fullfile(pathToMLAPP, 'images', 'github_icon_2.png');

            % Create VisualizeDataButton
            app.VisualizeDataButton = uibutton(app.HomeTab, 'push');
            app.VisualizeDataButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeDataButtonPushed, true);
            app.VisualizeDataButton.Icon = fullfile(pathToMLAPP, 'images', 'search_icon.png');
            app.VisualizeDataButton.FontSize = 18;
            app.VisualizeDataButton.FontWeight = 'bold';
            app.VisualizeDataButton.FontColor = [0.4667 0.6745 0.1882];
            app.VisualizeDataButton.Position = [17 160 156 75];
            app.VisualizeDataButton.Text = {'Visualize'; 'Data'};

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
            app.LoadEISDat.Position = [38 57 409 284];

            % Create TimePointAUEditFieldLabel
            app.TimePointAUEditFieldLabel = uilabel(app.LoadDataPanel);
            app.TimePointAUEditFieldLabel.HorizontalAlignment = 'right';
            app.TimePointAUEditFieldLabel.FontSize = 14;
            app.TimePointAUEditFieldLabel.Position = [31 530 104 22];
            app.TimePointAUEditFieldLabel.Text = 'Time Point (AU)';

            % Create ConditionEditFieldLabel
            app.ConditionEditFieldLabel = uilabel(app.LoadDataPanel);
            app.ConditionEditFieldLabel.HorizontalAlignment = 'right';
            app.ConditionEditFieldLabel.FontSize = 14;
            app.ConditionEditFieldLabel.Position = [22 625 64 22];
            app.ConditionEditFieldLabel.Text = 'Condition';

            % Create ConditionEditField
            app.ConditionEditField = uieditfield(app.LoadDataPanel, 'text');
            app.ConditionEditField.ValueChangedFcn = createCallbackFcn(app, @ConditionEditFieldValueChanged, true);
            app.ConditionEditField.Position = [101 621 352 30];

            % Create TimePointAUEditField
            app.TimePointAUEditField = uieditfield(app.LoadDataPanel, 'numeric');
            app.TimePointAUEditField.ValueChangedFcn = createCallbackFcn(app, @TimePointAUEditFieldValueChanged, true);
            app.TimePointAUEditField.FontSize = 18;
            app.TimePointAUEditField.Position = [140 524 51 34];
            app.TimePointAUEditField.Value = -1;

            % Create OrEnterFilePathEditFieldLabel
            app.OrEnterFilePathEditFieldLabel = uilabel(app.LoadDataPanel);
            app.OrEnterFilePathEditFieldLabel.HorizontalAlignment = 'right';
            app.OrEnterFilePathEditFieldLabel.FontSize = 14;
            app.OrEnterFilePathEditFieldLabel.FontWeight = 'bold';
            app.OrEnterFilePathEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OrEnterFilePathEditFieldLabel.Position = [17 398 123 22];
            app.OrEnterFilePathEditFieldLabel.Text = 'Or Enter File Path';

            % Create OrEnterFilePathEditField
            app.OrEnterFilePathEditField = uieditfield(app.LoadDataPanel, 'text');
            app.OrEnterFilePathEditField.ValueChangedFcn = createCallbackFcn(app, @OrEnterFilePathEditFieldValueChanged, true);
            app.OrEnterFilePathEditField.Position = [144 393 313 32];

            % Create FindFileButton
            app.FindFileButton = uibutton(app.LoadDataPanel, 'push');
            app.FindFileButton.ButtonPushedFcn = createCallbackFcn(app, @FindFileButtonPushed, true);
            app.FindFileButton.FontSize = 18;
            app.FindFileButton.FontWeight = 'bold';
            app.FindFileButton.FontColor = [0.4667 0.6745 0.1882];
            app.FindFileButton.Tooltip = {'Find file from local storage'};
            app.FindFileButton.Position = [58 431 131 34];
            app.FindFileButton.Text = 'Find File';

            % Create LOADButton
            app.LOADButton = uibutton(app.LoadDataPanel, 'push');
            app.LOADButton.ButtonPushedFcn = createCallbackFcn(app, @LOADButtonPushed, true);
            app.LOADButton.FontSize = 24;
            app.LOADButton.FontWeight = 'bold';
            app.LOADButton.FontColor = [0.4667 0.6745 0.1882];
            app.LOADButton.Tooltip = {'Add selected file to AnalyZe for processing'};
            app.LOADButton.Position = [187 347 118 38];
            app.LOADButton.Text = 'LOAD';

            % Create WellNumberEditFieldLabel
            app.WellNumberEditFieldLabel = uilabel(app.LoadDataPanel);
            app.WellNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.WellNumberEditFieldLabel.FontSize = 14;
            app.WellNumberEditFieldLabel.Position = [211 585 86 22];
            app.WellNumberEditFieldLabel.Text = 'Well Number';

            % Create ExperimentNumberEditFieldLabel
            app.ExperimentNumberEditFieldLabel = uilabel(app.LoadDataPanel);
            app.ExperimentNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.ExperimentNumberEditFieldLabel.FontSize = 14;
            app.ExperimentNumberEditFieldLabel.Position = [4 578 130 22];
            app.ExperimentNumberEditFieldLabel.Text = 'Experiment Number';

            % Create ExperimentNumberEditField
            app.ExperimentNumberEditField = uieditfield(app.LoadDataPanel, 'numeric');
            app.ExperimentNumberEditField.ValueChangedFcn = createCallbackFcn(app, @ExperimentNumberEditFieldValueChanged, true);
            app.ExperimentNumberEditField.FontSize = 18;
            app.ExperimentNumberEditField.Position = [139 569 50 40];
            app.ExperimentNumberEditField.Value = -1;

            % Create WellNumberEditField
            app.WellNumberEditField = uieditfield(app.LoadDataPanel, 'text');
            app.WellNumberEditField.ValueChangedFcn = createCallbackFcn(app, @WellNumberEditFieldValueChanged, true);
            app.WellNumberEditField.FontSize = 18;
            app.WellNumberEditField.Position = [312 583 141 32];

            % Create HoldPlotSwitchLabel
            app.HoldPlotSwitchLabel = uilabel(app.LoadDataPanel);
            app.HoldPlotSwitchLabel.HorizontalAlignment = 'center';
            app.HoldPlotSwitchLabel.FontSize = 18;
            app.HoldPlotSwitchLabel.Position = [26 3 78 23];
            app.HoldPlotSwitchLabel.Text = 'Hold Plot';

            % Create HoldPlotSwitchLoad
            app.HoldPlotSwitchLoad = uiswitch(app.LoadDataPanel, 'toggle');
            app.HoldPlotSwitchLoad.Orientation = 'horizontal';
            app.HoldPlotSwitchLoad.FontSize = 18;
            app.HoldPlotSwitchLoad.Position = [35 27 78 35];

            % Create FileFinderTab
            app.FileFinderTab = uitabgroup(app.LoadDataPanel);
            app.FileFinderTab.Position = [196 430 277 149];

            % Create ImportUtilitiesTab
            app.ImportUtilitiesTab = uitab(app.FileFinderTab);
            app.ImportUtilitiesTab.Title = 'Import Utilities →';

            % Create ModifythedataimportworkflowusingvariedutilitiesLabel
            app.ModifythedataimportworkflowusingvariedutilitiesLabel = uilabel(app.ImportUtilitiesTab);
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.HorizontalAlignment = 'center';
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.FontSize = 14;
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.FontWeight = 'bold';
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.Position = [25 82 226 34];
            app.ModifythedataimportworkflowusingvariedutilitiesLabel.Text = {'Modify the data import workflow '; 'using varied utilities:'};

            % Create DropDown
            app.DropDown = uidropdown(app.ImportUtilitiesTab);
            app.DropDown.Items = {'Choose Utility', 'Filename Filter', 'Auto-Increment Fieldname over many Files', 'Import Data from a Datafile with Alternate Format', 'Import Data From a Spreadsheet'};
            app.DropDown.ValueChangedFcn = createCallbackFcn(app, @DropDownValueChanged, true);
            app.DropDown.FontSize = 14;
            app.DropDown.Position = [15 12 246 61];
            app.DropDown.Value = 'Choose Utility';

            % Create FileSUBTRINGFilterTab
            app.FileSUBTRINGFilterTab = uitab(app.FileFinderTab);
            app.FileSUBTRINGFilterTab.Title = 'File SUBTRING Filter';

            % Create FindFilesSubtringFilter
            app.FindFilesSubtringFilter = uieditfield(app.FileSUBTRINGFilterTab, 'text');
            app.FindFilesSubtringFilter.Enable = 'off';
            app.FindFilesSubtringFilter.Position = [75 10 186 25];

            % Create KnobSubtringFilter
            app.KnobSubtringFilter = uiknob(app.FileSUBTRINGFilterTab, 'discrete');
            app.KnobSubtringFilter.Items = {'Off', 'Condition', 'Well Number', 'Time Point', 'Substring'};
            app.KnobSubtringFilter.ValueChangedFcn = createCallbackFcn(app, @KnobSubtringFilterValueChanged, true);
            app.KnobSubtringFilter.Position = [128 42 53 53];

            % Create SubstringLabel
            app.SubstringLabel = uilabel(app.FileSUBTRINGFilterTab);
            app.SubstringLabel.FontWeight = 'bold';
            app.SubstringLabel.Position = [11 12 65 22];
            app.SubstringLabel.Text = 'Substring:';

            % Create FilterFilenamesbyLabel
            app.FilterFilenamesbyLabel = uilabel(app.FileSUBTRINGFilterTab);
            app.FilterFilenamesbyLabel.HorizontalAlignment = 'center';
            app.FilterFilenamesbyLabel.WordWrap = 'on';
            app.FilterFilenamesbyLabel.FontWeight = 'bold';
            app.FilterFilenamesbyLabel.FontColor = [0.4667 0.6745 0.1882];
            app.FilterFilenamesbyLabel.Position = [9 48 59 64];
            app.FilterFilenamesbyLabel.Text = 'Filter File names by:';

            % Create MultiSelectTab
            app.MultiSelectTab = uitab(app.FileFinderTab);
            app.MultiSelectTab.Title = 'MultiSelect';

            % Create KnobMultiSelect
            app.KnobMultiSelect = uiknob(app.MultiSelectTab, 'discrete');
            app.KnobMultiSelect.Items = {'Off', 'Condition', 'Well Number', 'Time Point'};
            app.KnobMultiSelect.ValueChangedFcn = createCallbackFcn(app, @KnobMultiSelectValueChanged, true);
            app.KnobMultiSelect.FontSize = 14;
            app.KnobMultiSelect.Position = [119 20 64 64];

            % Create SelectMultipleFilesandautoincrementafieldperfileLabel
            app.SelectMultipleFilesandautoincrementafieldperfileLabel = uilabel(app.MultiSelectTab);
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.HorizontalAlignment = 'center';
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.WordWrap = 'on';
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.FontWeight = 'bold';
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.Position = [4 20 81 89];
            app.SelectMultipleFilesandautoincrementafieldperfileLabel.Text = 'Select Multiple Files and auto-increment a field (per file)';

            % Create AlternativeFileFormatTab
            app.AlternativeFileFormatTab = uitab(app.FileFinderTab);
            app.AlternativeFileFormatTab.Title = 'Alternative File Format';

            % Create ArbFileFormatSwitch
            app.ArbFileFormatSwitch = uiswitch(app.AlternativeFileFormatTab, 'slider');
            app.ArbFileFormatSwitch.Orientation = 'vertical';
            app.ArbFileFormatSwitch.ValueChangedFcn = createCallbackFcn(app, @ArbFileFormatSwitchValueChanged, true);
            app.ArbFileFormatSwitch.Position = [5 41 20 45];

            % Create ArbFileFormatSpecTable
            app.ArbFileFormatSpecTable = uitable(app.AlternativeFileFormatTab);
            app.ArbFileFormatSpecTable.ColumnName = {'Index (AU)'; 'Freq (Hz)'; 'Re(Z)'; '-Im(Z)'; 'Im(Z)'; 'Mag(Z)'; '-Phase(Z) (deg)'; 'Phase(Z) (deg)'};
            app.ArbFileFormatSpecTable.RowName = {};
            app.ArbFileFormatSpecTable.ColumnEditable = true;
            app.ArbFileFormatSpecTable.Tooltip = {'Column Number starting at 1 (-1 for excluded columns)'};
            app.ArbFileFormatSpecTable.Position = [34 28 186 70];

            % Create SpecifytargetfilecolumnorderLabel
            app.SpecifytargetfilecolumnorderLabel = uilabel(app.AlternativeFileFormatTab);
            app.SpecifytargetfilecolumnorderLabel.HorizontalAlignment = 'center';
            app.SpecifytargetfilecolumnorderLabel.FontWeight = 'bold';
            app.SpecifytargetfilecolumnorderLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SpecifytargetfilecolumnorderLabel.Position = [32 1 190 24];
            app.SpecifytargetfilecolumnorderLabel.Text = 'Specify target file column order';

            % Create RowdatastartsonSpinnerLabel
            app.RowdatastartsonSpinnerLabel = uilabel(app.AlternativeFileFormatTab);
            app.RowdatastartsonSpinnerLabel.HorizontalAlignment = 'center';
            app.RowdatastartsonSpinnerLabel.FontWeight = 'bold';
            app.RowdatastartsonSpinnerLabel.Position = [220 24 58 30];
            app.RowdatastartsonSpinnerLabel.Text = {'Row data'; 'starts on'};

            % Create RowdatastartsonSpinner
            app.RowdatastartsonSpinner = uispinner(app.AlternativeFileFormatTab);
            app.RowdatastartsonSpinner.Limits = [1 Inf];
            app.RowdatastartsonSpinner.FontSize = 14;
            app.RowdatastartsonSpinner.Position = [228 57 43 41];
            app.RowdatastartsonSpinner.Value = 2;

            % Create CsvOrSpreadsheetSwitch
            app.CsvOrSpreadsheetSwitch = uiswitch(app.AlternativeFileFormatTab, 'rocker');
            app.CsvOrSpreadsheetSwitch.Items = {'csv (txt)', 'Spreadsheet'};
            app.CsvOrSpreadsheetSwitch.Orientation = 'horizontal';
            app.CsvOrSpreadsheetSwitch.Position = [107 101 43 19];
            app.CsvOrSpreadsheetSwitch.Value = 'csv (txt)';

            % Create MultisheetSpreadhseetTab
            app.MultisheetSpreadhseetTab = uitab(app.FileFinderTab);
            app.MultisheetSpreadhseetTab.Title = 'Multi-sheet Spreadhseet';

            % Create KnobMultiSelect_SpreadsheetMultisheet
            app.KnobMultiSelect_SpreadsheetMultisheet = uiknob(app.MultisheetSpreadhseetTab, 'discrete');
            app.KnobMultiSelect_SpreadsheetMultisheet.Items = {'Off', 'Condition', 'Well Number', 'Time Point'};
            app.KnobMultiSelect_SpreadsheetMultisheet.ValueChangedFcn = createCallbackFcn(app, @KnobMultiSelect_SpreadsheetMultisheetValueChanged, true);
            app.KnobMultiSelect_SpreadsheetMultisheet.FontSize = 14;
            app.KnobMultiSelect_SpreadsheetMultisheet.Position = [128 17 64 64];

            % Create ReaddatafromspreadsheetincrementingLabel
            app.ReaddatafromspreadsheetincrementingLabel = uilabel(app.MultisheetSpreadhseetTab);
            app.ReaddatafromspreadsheetincrementingLabel.HorizontalAlignment = 'center';
            app.ReaddatafromspreadsheetincrementingLabel.WordWrap = 'on';
            app.ReaddatafromspreadsheetincrementingLabel.FontWeight = 'bold';
            app.ReaddatafromspreadsheetincrementingLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ReaddatafromspreadsheetincrementingLabel.Position = [5 19 81 89];
            app.ReaddatafromspreadsheetincrementingLabel.Text = 'Read data from spreadsheet using sheet name as field entry';

            % Create AutoIncrementTimePointperfileLabel
            app.AutoIncrementTimePointperfileLabel = uilabel(app.LoadDataPanel);
            app.AutoIncrementTimePointperfileLabel.HorizontalAlignment = 'center';
            app.AutoIncrementTimePointperfileLabel.FontWeight = 'bold';
            app.AutoIncrementTimePointperfileLabel.FontColor = [0.4941 0.1843 0.5569];
            app.AutoIncrementTimePointperfileLabel.Position = [7 474 97 44];
            app.AutoIncrementTimePointperfileLabel.Text = {'Auto-Increment '; 'Time Point '; 'per file'};

            % Create AutoIncrementTimePointperfileSwitch
            app.AutoIncrementTimePointperfileSwitch = uiswitch(app.LoadDataPanel, 'slider');
            app.AutoIncrementTimePointperfileSwitch.ValueChangedFcn = createCallbackFcn(app, @AutoIncrementTimePointperfileSwitchValueChanged, true);
            app.AutoIncrementTimePointperfileSwitch.FontColor = [0.4902 0.1804 0.5608];
            app.AutoIncrementTimePointperfileSwitch.Position = [124 486 45 20];

            % Create FirstLabel
            app.FirstLabel = uilabel(app.LoadDataPanel);
            app.FirstLabel.FontSize = 18;
            app.FirstLabel.FontWeight = 'bold';
            app.FirstLabel.FontColor = [0 0.4471 0.7412];
            app.FirstLabel.Position = [9 436 44 23];
            app.FirstLabel.Text = 'First';

            % Create ThenLabel
            app.ThenLabel = uilabel(app.LoadDataPanel);
            app.ThenLabel.FontSize = 18;
            app.ThenLabel.FontWeight = 'bold';
            app.ThenLabel.FontColor = [0 0.4471 0.7412];
            app.ThenLabel.Position = [133 356 48 23];
            app.ThenLabel.Text = 'Then';

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
            app.LoadFromPreviousSaveButton.FontColor = [0.4667 0.6745 0.1882];
            app.LoadFromPreviousSaveButton.Position = [554 17 198 35];
            app.LoadFromPreviousSaveButton.Text = 'Load From Previous Save';

            % Create SaveDataForLaterButton
            app.SaveDataForLaterButton = uibutton(app.InportDataTab, 'push');
            app.SaveDataForLaterButton.ButtonPushedFcn = createCallbackFcn(app, @SaveDataForLaterButtonPushed, true);
            app.SaveDataForLaterButton.FontSize = 24;
            app.SaveDataForLaterButton.FontWeight = 'bold';
            app.SaveDataForLaterButton.FontColor = [0.4667 0.6745 0.1882];
            app.SaveDataForLaterButton.Position = [513 59 241 46];
            app.SaveDataForLaterButton.Text = 'Save Data For Later';

            % Create CLEARALLDATAButton
            app.CLEARALLDATAButton = uibutton(app.InportDataTab, 'push');
            app.CLEARALLDATAButton.ButtonPushedFcn = createCallbackFcn(app, @CLEARALLDATAButtonPushed, true);
            app.CLEARALLDATAButton.FontSize = 18;
            app.CLEARALLDATAButton.FontWeight = 'bold';
            app.CLEARALLDATAButton.FontColor = [0.851 0.3255 0.098];
            app.CLEARALLDATAButton.Position = [835 10 168 30];
            app.CLEARALLDATAButton.Text = 'CLEAR ALL DATA';

            % Create CLEARLASTDATAPOINTButton
            app.CLEARLASTDATAPOINTButton = uibutton(app.InportDataTab, 'push');
            app.CLEARLASTDATAPOINTButton.ButtonPushedFcn = createCallbackFcn(app, @CLEARLASTDATAPOINTButtonPushed, true);
            app.CLEARLASTDATAPOINTButton.FontSize = 10;
            app.CLEARLASTDATAPOINTButton.FontWeight = 'bold';
            app.CLEARLASTDATAPOINTButton.FontColor = [0.6353 0.0784 0.1843];
            app.CLEARLASTDATAPOINTButton.Position = [905 88 95 35];
            app.CLEARLASTDATAPOINTButton.Text = {'CLEAR LAST '; 'DATA POINT'};

            % Create PlotSelectedButton
            app.PlotSelectedButton = uibutton(app.InportDataTab, 'push');
            app.PlotSelectedButton.ButtonPushedFcn = createCallbackFcn(app, @PlotSelectedButtonPushed, true);
            app.PlotSelectedButton.FontSize = 14;
            app.PlotSelectedButton.FontWeight = 'bold';
            app.PlotSelectedButton.FontColor = [0 0 1];
            app.PlotSelectedButton.Position = [785 88 103 35];
            app.PlotSelectedButton.Text = 'Plot Selected';

            % Create OrLabel
            app.OrLabel = uilabel(app.InportDataTab);
            app.OrLabel.FontSize = 18;
            app.OrLabel.FontWeight = 'bold';
            app.OrLabel.FontColor = [0 0.4471 0.7412];
            app.OrLabel.Position = [522 23 26 23];
            app.OrLabel.Text = 'Or';

            % Create VisualizeDataTab
            app.VisualizeDataTab = uitab(app.TabGroup);
            app.VisualizeDataTab.Title = 'Visualize Data';

            % Create VisualiseDataAxes
            app.VisualiseDataAxes = uiaxes(app.VisualizeDataTab);
            title(app.VisualiseDataAxes, 'Title')
            xlabel(app.VisualiseDataAxes, 'X')
            ylabel(app.VisualiseDataAxes, 'Y')
            zlabel(app.VisualiseDataAxes, 'Z')
            app.VisualiseDataAxes.Position = [419 19 576 682];

            % Create TrimData_4
            app.TrimData_4 = uipanel(app.VisualizeDataTab);
            app.TrimData_4.Title = 'Select Data';
            app.TrimData_4.Position = [15 214 388 490];

            % Create ConditionListBox_4Label
            app.ConditionListBox_4Label = uilabel(app.TrimData_4);
            app.ConditionListBox_4Label.HorizontalAlignment = 'right';
            app.ConditionListBox_4Label.FontSize = 14;
            app.ConditionListBox_4Label.Position = [38 405 64 22];
            app.ConditionListBox_4Label.Text = 'Condition';

            % Create ConditionListBox_4
            app.ConditionListBox_4 = uilistbox(app.TrimData_4);
            app.ConditionListBox_4.Multiselect = 'on';
            app.ConditionListBox_4.Position = [110 406 222 61];
            app.ConditionListBox_4.Value = {'Item 1'};

            % Create ExperimentNumberLabel
            app.ExperimentNumberLabel = uilabel(app.TrimData_4);
            app.ExperimentNumberLabel.HorizontalAlignment = 'right';
            app.ExperimentNumberLabel.FontSize = 14;
            app.ExperimentNumberLabel.Position = [4 346 81 43];
            app.ExperimentNumberLabel.Text = {'Experiment '; 'Number'};

            % Create ExperimentNumberListBox_4
            app.ExperimentNumberListBox_4 = uilistbox(app.TrimData_4);
            app.ExperimentNumberListBox_4.Multiselect = 'on';
            app.ExperimentNumberListBox_4.Position = [96 343 90 58];
            app.ExperimentNumberListBox_4.Value = {'Item 1'};

            % Create WellNumberLabel
            app.WellNumberLabel = uilabel(app.TrimData_4);
            app.WellNumberLabel.HorizontalAlignment = 'right';
            app.WellNumberLabel.FontSize = 14;
            app.WellNumberLabel.Position = [28 289 55 34];
            app.WellNumberLabel.Text = {'Well '; 'Number'};

            % Create WellNumberListBox_4
            app.WellNumberListBox_4 = uilistbox(app.TrimData_4);
            app.WellNumberListBox_4.Multiselect = 'on';
            app.WellNumberListBox_4.Position = [97 279 88 59];
            app.WellNumberListBox_4.Value = {'Item 1'};

            % Create ChosenDataTable_4
            app.ChosenDataTable_4 = uitable(app.TrimData_4);
            app.ChosenDataTable_4.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable_4.RowName = {};
            app.ChosenDataTable_4.Position = [12 10 366 260];

            % Create ChooseButton_3
            app.ChooseButton_3 = uibutton(app.TrimData_4, 'push');
            app.ChooseButton_3.ButtonPushedFcn = createCallbackFcn(app, @ChooseButton_3Pushed, true);
            app.ChooseButton_3.FontSize = 18;
            app.ChooseButton_3.FontWeight = 'bold';
            app.ChooseButton_3.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseButton_3.Tooltip = {'Select the Data subset to be fit'};
            app.ChooseButton_3.Position = [240 279 88 30];
            app.ChooseButton_3.Text = 'Choose';

            % Create TimeListBox_3Label
            app.TimeListBox_3Label = uilabel(app.TrimData_4);
            app.TimeListBox_3Label.HorizontalAlignment = 'right';
            app.TimeListBox_3Label.FontSize = 14;
            app.TimeListBox_3Label.Position = [179 363 48 23];
            app.TimeListBox_3Label.Text = 'Time';

            % Create TimeListBox_3
            app.TimeListBox_3 = uilistbox(app.TrimData_4);
            app.TimeListBox_3.Multiselect = 'on';
            app.TimeListBox_3.Position = [242 327 89 75];
            app.TimeListBox_3.Value = {'Item 1'};

            % Create RefreshData_4
            app.RefreshData_4 = uibutton(app.TrimData_4, 'push');
            app.RefreshData_4.ButtonPushedFcn = createCallbackFcn(app, @RefreshData_4ButtonPushed, true);
            app.RefreshData_4.Icon = fullfile(pathToMLAPP, 'images', 'Refresh_icon.png');
            app.RefreshData_4.FontWeight = 'bold';
            app.RefreshData_4.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshData_4.Tooltip = {'Refresh Data Options'};
            app.RefreshData_4.Position = [6 431 41 36];
            app.RefreshData_4.Text = '';

            % Create VizDataPlotParamsTabGroup
            app.VizDataPlotParamsTabGroup = uitabgroup(app.VisualizeDataTab);
            app.VizDataPlotParamsTabGroup.Position = [18 40 383 167];

            % Create PlotTypeTab
            app.PlotTypeTab = uitab(app.VizDataPlotParamsTabGroup);
            app.PlotTypeTab.Title = 'Plot Type';

            % Create PlotTypeSwitchLabel
            app.PlotTypeSwitchLabel = uilabel(app.PlotTypeTab);
            app.PlotTypeSwitchLabel.HorizontalAlignment = 'center';
            app.PlotTypeSwitchLabel.FontSize = 18;
            app.PlotTypeSwitchLabel.FontWeight = 'bold';
            app.PlotTypeSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.PlotTypeSwitchLabel.Position = [2 12 85 23];
            app.PlotTypeSwitchLabel.Text = 'Plot Type';

            % Create PlotTypeSwitch
            app.PlotTypeSwitch = uiswitch(app.PlotTypeTab, 'slider');
            app.PlotTypeSwitch.Items = {'Bode', 'Nyquist'};
            app.PlotTypeSwitch.Orientation = 'vertical';
            app.PlotTypeSwitch.ValueChangedFcn = createCallbackFcn(app, @PlotTypeSwitchValueChanged, true);
            app.PlotTypeSwitch.FontSize = 18;
            app.PlotTypeSwitch.Position = [31 60 20 45];
            app.PlotTypeSwitch.Value = 'Bode';

            % Create DimsSwitch
            app.DimsSwitch = uiswitch(app.PlotTypeTab, 'slider');
            app.DimsSwitch.Items = {'2D', '3D'};
            app.DimsSwitch.Orientation = 'vertical';
            app.DimsSwitch.ValueChangedFcn = createCallbackFcn(app, @DimsSwitchValueChanged, true);
            app.DimsSwitch.Position = [169 60 20 45];
            app.DimsSwitch.Value = '2D';

            % Create DimsSwitchLabel
            app.DimsSwitchLabel = uilabel(app.PlotTypeTab);
            app.DimsSwitchLabel.HorizontalAlignment = 'center';
            app.DimsSwitchLabel.FontWeight = 'bold';
            app.DimsSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.DimsSwitchLabel.Position = [163 13 34 22];
            app.DimsSwitchLabel.Text = 'Dims';

            % Create IndependentVariableKnobLabel
            app.IndependentVariableKnobLabel = uilabel(app.PlotTypeTab);
            app.IndependentVariableKnobLabel.HorizontalAlignment = 'center';
            app.IndependentVariableKnobLabel.FontWeight = 'bold';
            app.IndependentVariableKnobLabel.FontColor = [0.4667 0.6745 0.1882];
            app.IndependentVariableKnobLabel.Enable = 'off';
            app.IndependentVariableKnobLabel.Position = [218 124 126 22];
            app.IndependentVariableKnobLabel.Text = 'Independent Variable';

            % Create IndependentVariableKnob
            app.IndependentVariableKnob = uiknob(app.PlotTypeTab, 'discrete');
            app.IndependentVariableKnob.Items = {'Freq', 'Exp Num', 'Well Num', 'Condition', 'Time'};
            app.IndependentVariableKnob.Enable = 'off';
            app.IndependentVariableKnob.Position = [250 43 60 60];
            app.IndependentVariableKnob.Value = 'Freq';

            % Create BodeTypeSwitch
            app.BodeTypeSwitch = uiswitch(app.PlotTypeTab, 'slider');
            app.BodeTypeSwitch.Items = {'H(jw)', 'Polar'};
            app.BodeTypeSwitch.Orientation = 'vertical';
            app.BodeTypeSwitch.ValueChangedFcn = createCallbackFcn(app, @BodeTypeSwitchValueChanged, true);
            app.BodeTypeSwitch.Position = [112 61 20 45];
            app.BodeTypeSwitch.Value = 'H(jw)';

            % Create BodeTypeLabel
            app.BodeTypeLabel = uilabel(app.PlotTypeTab);
            app.BodeTypeLabel.HorizontalAlignment = 'center';
            app.BodeTypeLabel.FontWeight = 'bold';
            app.BodeTypeLabel.FontColor = [0.4667 0.6745 0.1882];
            app.BodeTypeLabel.Position = [105 6 35 30];
            app.BodeTypeLabel.Text = {'Bode'; 'Type'};

            % Create DimsSwitch_2
            app.DimsSwitch_2 = uiswitch(app.PlotTypeTab, 'slider');
            app.DimsSwitch_2.Items = {'Line', 'Surface'};
            app.DimsSwitch_2.Enable = 'off';
            app.DimsSwitch_2.Position = [255 15 45 20];
            app.DimsSwitch_2.Value = 'Line';

            % Create ModifyPlotTab
            app.ModifyPlotTab = uitab(app.VizDataPlotParamsTabGroup);
            app.ModifyPlotTab.Title = 'Modify Plot';

            % Create xminEditFieldLabel
            app.xminEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.xminEditFieldLabel.HorizontalAlignment = 'right';
            app.xminEditFieldLabel.Position = [8 78 34 22];
            app.xminEditFieldLabel.Text = 'x-min';

            % Create xminEditField
            app.xminEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.xminEditField.Position = [45 78 52 22];

            % Create xmaxEditFieldLabel
            app.xmaxEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.xmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.xmaxEditFieldLabel.Position = [100 78 38 22];
            app.xmaxEditFieldLabel.Text = 'x-max';

            % Create xmaxEditField
            app.xmaxEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.xmaxEditField.Position = [141 78 52 22];

            % Create OffsetEditFieldLabel
            app.OffsetEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.OffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.OffsetEditFieldLabel.Position = [253 2 57 22];
            app.OffsetEditFieldLabel.Text = 'Offset (Ω)';

            % Create OffsetEditField
            app.OffsetEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.OffsetEditField.Position = [312 2 52 22];

            % Create zmaxEditFieldLabel
            app.zmaxEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.zmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.zmaxEditFieldLabel.Position = [98 22 38 22];
            app.zmaxEditFieldLabel.Text = 'z-max';

            % Create zmaxEditField
            app.zmaxEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.zmaxEditField.Position = [141 22 52 22];

            % Create yminEditFieldLabel
            app.yminEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.yminEditFieldLabel.HorizontalAlignment = 'right';
            app.yminEditFieldLabel.Position = [9 49 34 22];
            app.yminEditFieldLabel.Text = 'y-min';

            % Create yminEditField
            app.yminEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.yminEditField.Position = [45 49 52 22];

            % Create zminEditFieldLabel
            app.zminEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.zminEditFieldLabel.HorizontalAlignment = 'right';
            app.zminEditFieldLabel.Position = [7 22 34 22];
            app.zminEditFieldLabel.Text = 'z-min';

            % Create zminEditField
            app.zminEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.zminEditField.Position = [45 22 52 22];

            % Create SpecifyPlotLimitsSwitch
            app.SpecifyPlotLimitsSwitch = uiswitch(app.ModifyPlotTab, 'slider');
            app.SpecifyPlotLimitsSwitch.Items = {'On', 'Off'};
            app.SpecifyPlotLimitsSwitch.Position = [119 116 45 20];

            % Create SpecifyPlotLimitsSwitchLabel
            app.SpecifyPlotLimitsSwitchLabel = uilabel(app.ModifyPlotTab);
            app.SpecifyPlotLimitsSwitchLabel.HorizontalAlignment = 'center';
            app.SpecifyPlotLimitsSwitchLabel.FontWeight = 'bold';
            app.SpecifyPlotLimitsSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SpecifyPlotLimitsSwitchLabel.Position = [21 109 66 30];
            app.SpecifyPlotLimitsSwitchLabel.Text = {'Specify'; 'Plot Limits'};

            % Create SurfaceColourDropDownLabel
            app.SurfaceColourDropDownLabel = uilabel(app.ModifyPlotTab);
            app.SurfaceColourDropDownLabel.HorizontalAlignment = 'right';
            app.SurfaceColourDropDownLabel.FontWeight = 'bold';
            app.SurfaceColourDropDownLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SurfaceColourDropDownLabel.Position = [210 112 49 30];
            app.SurfaceColourDropDownLabel.Text = {'Surface'; 'Colour'};

            % Create SurfaceColourDropDown
            app.SurfaceColourDropDown = uidropdown(app.ModifyPlotTab);
            app.SurfaceColourDropDown.Items = {'parula', 'turbo', 'hsv', 'hot', 'cool', 'summer', 'winter', 'jet'};
            app.SurfaceColourDropDown.Position = [265 114 112 25];
            app.SurfaceColourDropDown.Value = 'parula';

            % Create LegendSwitch
            app.LegendSwitch = uiswitch(app.ModifyPlotTab, 'slider');
            app.LegendSwitch.Items = {'On', 'Off'};
            app.LegendSwitch.Position = [296 55 45 20];
            app.LegendSwitch.Value = 'On';

            % Create LegendSwitchLabel
            app.LegendSwitchLabel = uilabel(app.ModifyPlotTab);
            app.LegendSwitchLabel.HorizontalAlignment = 'center';
            app.LegendSwitchLabel.FontWeight = 'bold';
            app.LegendSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.LegendSwitchLabel.Position = [219 54 48 22];
            app.LegendSwitchLabel.Text = 'Legend';

            % Create OffsetAlignSwitch
            app.OffsetAlignSwitch = uiswitch(app.ModifyPlotTab, 'slider');
            app.OffsetAlignSwitch.Items = {'On', 'Off'};
            app.OffsetAlignSwitch.ValueChangedFcn = createCallbackFcn(app, @OffsetAlignSwitchValueChanged, true);
            app.OffsetAlignSwitch.Position = [297 30 45 20];

            % Create ReZLabel
            app.ReZLabel = uilabel(app.ModifyPlotTab);
            app.ReZLabel.HorizontalAlignment = 'center';
            app.ReZLabel.FontWeight = 'bold';
            app.ReZLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ReZLabel.Position = [225 22 40 30];
            app.ReZLabel.Text = {'Offset'; 'Align'};

            % Create ymaxEditFieldLabel
            app.ymaxEditFieldLabel = uilabel(app.ModifyPlotTab);
            app.ymaxEditFieldLabel.HorizontalAlignment = 'right';
            app.ymaxEditFieldLabel.Position = [100 50 38 22];
            app.ymaxEditFieldLabel.Text = 'y-max';

            % Create ymaxEditField
            app.ymaxEditField = uieditfield(app.ModifyPlotTab, 'numeric');
            app.ymaxEditField.Position = [141 50 52 22];

            % Create SurfaceTypeLabel
            app.SurfaceTypeLabel = uilabel(app.ModifyPlotTab);
            app.SurfaceTypeLabel.HorizontalAlignment = 'right';
            app.SurfaceTypeLabel.FontWeight = 'bold';
            app.SurfaceTypeLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SurfaceTypeLabel.Position = [211 79 49 30];
            app.SurfaceTypeLabel.Text = {'Surface'; 'Type'};

            % Create SurfaceTypeDropDown
            app.SurfaceTypeDropDown = uidropdown(app.ModifyPlotTab);
            app.SurfaceTypeDropDown.Items = {'mesh', 'surf', 'waterfall', 'contour'};
            app.SurfaceTypeDropDown.Position = [266 82 112 25];
            app.SurfaceTypeDropDown.Value = 'mesh';

            % Create PlotButton
            app.PlotButton = uibutton(app.VisualizeDataTab, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.FontSize = 22;
            app.PlotButton.FontWeight = 'bold';
            app.PlotButton.FontColor = [0.4667 0.6745 0.1882];
            app.PlotButton.Tooltip = {'Select the Data subset to be fit'};
            app.PlotButton.Position = [156 2 82 36];
            app.PlotButton.Text = 'Plot';

            % Create HoldReleaseButton
            app.HoldReleaseButton = uibutton(app.VisualizeDataTab, 'state');
            app.HoldReleaseButton.ValueChangedFcn = createCallbackFcn(app, @HoldReleaseButtonValueChanged, true);
            app.HoldReleaseButton.Text = 'Hold/Release';
            app.HoldReleaseButton.FontSize = 14;
            app.HoldReleaseButton.FontWeight = 'bold';
            app.HoldReleaseButton.FontColor = [0 0.4471 0.7412];
            app.HoldReleaseButton.Position = [45 8 103 25];

            % Create SaveFigureButton_4
            app.SaveFigureButton_4 = uibutton(app.VisualizeDataTab, 'push');
            app.SaveFigureButton_4.ButtonPushedFcn = createCallbackFcn(app, @SaveFigureButton_4Pushed, true);
            app.SaveFigureButton_4.FontSize = 14;
            app.SaveFigureButton_4.FontWeight = 'bold';
            app.SaveFigureButton_4.FontColor = [0 0 1];
            app.SaveFigureButton_4.Position = [301 7 100 26];
            app.SaveFigureButton_4.Text = 'Save Figure';

            % Create AnalysisCCTFITTab
            app.AnalysisCCTFITTab = uitab(app.TabGroup);
            app.AnalysisCCTFITTab.Title = 'Analysis CCT FIT';
            app.AnalysisCCTFITTab.Tag = 'CCTFit';

            % Create TrimData
            app.TrimData = uipanel(app.AnalysisCCTFITTab);
            app.TrimData.Title = 'Select Data';
            app.TrimData.Position = [15 352 476 352];

            % Create ConditionListBoxLabel
            app.ConditionListBoxLabel = uilabel(app.TrimData);
            app.ConditionListBoxLabel.HorizontalAlignment = 'right';
            app.ConditionListBoxLabel.FontSize = 14;
            app.ConditionListBoxLabel.Position = [38 267 64 22];
            app.ConditionListBoxLabel.Text = 'Condition';

            % Create ConditionListBox
            app.ConditionListBox = uilistbox(app.TrimData);
            app.ConditionListBox.Multiselect = 'on';
            app.ConditionListBox.Position = [110 268 356 61];
            app.ConditionListBox.Value = {'Item 1'};

            % Create ExperimentNumberListBoxLabel
            app.ExperimentNumberListBoxLabel = uilabel(app.TrimData);
            app.ExperimentNumberListBoxLabel.HorizontalAlignment = 'right';
            app.ExperimentNumberListBoxLabel.FontSize = 14;
            app.ExperimentNumberListBoxLabel.Position = [-32 209 165 43];
            app.ExperimentNumberListBoxLabel.Text = 'Experiment Number';

            % Create ExperimentNumberListBox
            app.ExperimentNumberListBox = uilistbox(app.TrimData);
            app.ExperimentNumberListBox.Multiselect = 'on';
            app.ExperimentNumberListBox.Position = [144 206 122 58];
            app.ExperimentNumberListBox.Value = {'Item 1'};

            % Create WellNumberListBoxLabel
            app.WellNumberListBoxLabel = uilabel(app.TrimData);
            app.WellNumberListBoxLabel.HorizontalAlignment = 'right';
            app.WellNumberListBoxLabel.FontSize = 14;
            app.WellNumberListBoxLabel.Position = [45 164 86 22];
            app.WellNumberListBoxLabel.Text = 'Well Number';

            % Create WellNumberListBox
            app.WellNumberListBox = uilistbox(app.TrimData);
            app.WellNumberListBox.Multiselect = 'on';
            app.WellNumberListBox.Position = [145 142 120 59];
            app.WellNumberListBox.Value = {'Item 1'};

            % Create ChosenDataTable
            app.ChosenDataTable = uitable(app.TrimData);
            app.ChosenDataTable.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable.RowName = {};
            app.ChosenDataTable.Position = [11 9 450 130];

            % Create ChooseButton
            app.ChooseButton = uibutton(app.TrimData, 'push');
            app.ChooseButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseButtonPushed, true);
            app.ChooseButton.FontSize = 18;
            app.ChooseButton.FontWeight = 'bold';
            app.ChooseButton.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseButton.Tooltip = {'Select the Data subset to be fit'};
            app.ChooseButton.Position = [289 149 146 30];
            app.ChooseButton.Text = 'Choose';

            % Create TimeListBoxLabel
            app.TimeListBoxLabel = uilabel(app.TrimData);
            app.TimeListBoxLabel.HorizontalAlignment = 'right';
            app.TimeListBoxLabel.FontSize = 14;
            app.TimeListBoxLabel.Position = [281 224 48 23];
            app.TimeListBoxLabel.Text = 'Time';

            % Create TimeListBox
            app.TimeListBox = uilistbox(app.TrimData);
            app.TimeListBox.Multiselect = 'on';
            app.TimeListBox.Position = [344 188 121 75];
            app.TimeListBox.Value = {'Item 1'};

            % Create RefreshData
            app.RefreshData = uibutton(app.TrimData, 'push');
            app.RefreshData.ButtonPushedFcn = createCallbackFcn(app, @RefreshDataPushed, true);
            app.RefreshData.Icon = fullfile(pathToMLAPP, 'images', 'Refresh_icon.png');
            app.RefreshData.FontWeight = 'bold';
            app.RefreshData.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshData.Tooltip = {'Refresh Data Options'};
            app.RefreshData.Position = [6 293 41 36];
            app.RefreshData.Text = '';

            % Create FittingParams
            app.FittingParams = uipanel(app.AnalysisCCTFITTab);
            app.FittingParams.Position = [15 14 476 333];

            % Create GlobalOptimizationIterationsLabel
            app.GlobalOptimizationIterationsLabel = uilabel(app.FittingParams);
            app.GlobalOptimizationIterationsLabel.HorizontalAlignment = 'center';
            app.GlobalOptimizationIterationsLabel.FontSize = 22;
            app.GlobalOptimizationIterationsLabel.FontWeight = 'bold';
            app.GlobalOptimizationIterationsLabel.FontColor = [0.4667 0.6745 0.1882];
            app.GlobalOptimizationIterationsLabel.Position = [8 245 138 81];
            app.GlobalOptimizationIterationsLabel.Text = {'Global'; 'Optimization'; 'Iterations'};

            % Create GlobalOptimizationIterationsEditField
            app.GlobalOptimizationIterationsEditField = uieditfield(app.FittingParams, 'numeric');
            app.GlobalOptimizationIterationsEditField.HorizontalAlignment = 'center';
            app.GlobalOptimizationIterationsEditField.FontSize = 36;
            app.GlobalOptimizationIterationsEditField.Tooltip = {'This is the primary fitting tuning parameter = the number of fitting attempts made for different initial condition candidates. In general, fitness increases with this parameter. Performance may be sensitive to the exact value.'};
            app.GlobalOptimizationIterationsEditField.Position = [16 209 120 35];
            app.GlobalOptimizationIterationsEditField.Value = 3000;

            % Create GoButton
            app.GoButton = uibutton(app.FittingParams, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.FontSize = 24;
            app.GoButton.FontWeight = 'bold';
            app.GoButton.FontColor = [0.4667 0.6745 0.1882];
            app.GoButton.Position = [142 6 123 38];
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

            % Create EquivalentCircuitTab
            app.EquivalentCircuitTab = uitab(app.CircuitToFit);
            app.EquivalentCircuitTab.Title = 'Equivalent Circuit →';

            % Create Image4
            app.Image4 = uiimage(app.EquivalentCircuitTab);
            app.Image4.Position = [254 6 197 116];
            app.Image4.ImageSource = fullfile(pathToMLAPP, 'images', 'Equivalent_circuit_Barrier_2.png');

            % Create Label_3
            app.Label_3 = uilabel(app.EquivalentCircuitTab);
            app.Label_3.HorizontalAlignment = 'center';
            app.Label_3.FontSize = 18;
            app.Label_3.FontWeight = 'bold';
            app.Label_3.FontColor = [0.4667 0.6745 0.1882];
            app.Label_3.Position = [32 71 197 44];
            app.Label_3.Text = {'Choose an equivalent '; 'circuit model to fit'};

            % Create MoreInfoCCTFitButton
            app.MoreInfoCCTFitButton = uibutton(app.EquivalentCircuitTab, 'push');
            app.MoreInfoCCTFitButton.ButtonPushedFcn = createCallbackFcn(app, @MoreInfoCCTFitButtonPushed, true);
            app.MoreInfoCCTFitButton.Icon = fullfile(pathToMLAPP, 'images', 'Light_Bulb_or_Idea_Flat_Icon_Vector.svg');
            app.MoreInfoCCTFitButton.Position = [416 84 39 38];
            app.MoreInfoCCTFitButton.Text = '';

            % Create DropDown_3
            app.DropDown_3 = uidropdown(app.EquivalentCircuitTab);
            app.DropDown_3.Items = {'Input a Circuit Model to Fit', 'Write an arbitrary circuit (Recommended)', 'Select from a list of commonly used circuit models', 'Block-build a circuit (Deprecated)'};
            app.DropDown_3.ValueChangedFcn = createCallbackFcn(app, @DropDown_3ValueChanged, true);
            app.DropDown_3.FontSize = 14;
            app.DropDown_3.Position = [8 29 244 35];
            app.DropDown_3.Value = 'Input a Circuit Model to Fit';

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
            app.DoubleClicktoAddElementListBox.Items = {'Add New Parallel Branch', 'Edit Adjacent Branch', 'End Parallel Branch', 'R', 'C', 'Q', 'W', 'L', 'Add Custom Element'};
            app.DoubleClicktoAddElementListBox.ValueChangedFcn = createCallbackFcn(app, @DoubleClicktoAddElementListBoxValueChanged, true);
            app.DoubleClicktoAddElementListBox.DoubleClickedFcn = createCallbackFcn(app, @DoubleClicktoAddElementListBoxDoubleClicked, true);
            app.DoubleClicktoAddElementListBox.Position = [301 24 151 98];
            app.DoubleClicktoAddElementListBox.Value = 'R';

            % Create RLabel
            app.RLabel = uilabel(app.WriteACircuitTab);
            app.RLabel.FontSize = 18;
            app.RLabel.FontWeight = 'bold';
            app.RLabel.FontColor = [0.6353 0.0784 0.1843];
            app.RLabel.Position = [259 91 41 23];
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

            % Create SelectACircuitTab
            app.SelectACircuitTab = uitab(app.CircuitToFit);
            app.SelectACircuitTab.Title = 'Select-A-Circuit';

            % Create SelectaCircuitModelBarrierInclusiveListBoxLabel
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel = uilabel(app.SelectACircuitTab);
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel.HorizontalAlignment = 'right';
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel.FontWeight = 'bold';
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel.Position = [0 51 130 59];
            app.SelectaCircuitModelBarrierInclusiveListBoxLabel.Text = {'Select a Circuit Model'; '(Barrier Inclusive)'};

            % Create SelectaCircuitModelBarrierInclusiveListBox
            app.SelectaCircuitModelBarrierInclusiveListBox = uilistbox(app.SelectACircuitTab);
            app.SelectaCircuitModelBarrierInclusiveListBox.Items = {'R--(R//C)--((R--W)//C)', 'R--(R//C)--C', 'R--(R//C)--C--Q', 'R--(R//C)--Q'};
            app.SelectaCircuitModelBarrierInclusiveListBox.Position = [136 19 139 93];
            app.SelectaCircuitModelBarrierInclusiveListBox.Value = 'R--(R//C)--((R--W)//C)';

            % Create RResistanceLabel
            app.RResistanceLabel = uilabel(app.SelectACircuitTab);
            app.RResistanceLabel.Position = [300 102 84 22];
            app.RResistanceLabel.Text = 'R - Resistance';

            % Create CCapacitanceLabel
            app.CCapacitanceLabel = uilabel(app.SelectACircuitTab);
            app.CCapacitanceLabel.Position = [300 83 91 22];
            app.CCapacitanceLabel.Text = 'C - Capacitance';

            % Create QConstantPhaseElementLabel
            app.QConstantPhaseElementLabel = uilabel(app.SelectACircuitTab);
            app.QConstantPhaseElementLabel.Position = [300 63 158 22];
            app.QConstantPhaseElementLabel.Text = 'Q - Constant Phase Element';

            % Create WWarburgElementLabel
            app.WWarburgElementLabel = uilabel(app.SelectACircuitTab);
            app.WWarburgElementLabel.Position = [300 43 120 22];
            app.WWarburgElementLabel.Text = 'W - Warburg Element';

            % Create SeriesConnectionLabel
            app.SeriesConnectionLabel = uilabel(app.SelectACircuitTab);
            app.SeriesConnectionLabel.Position = [300 23 114 22];
            app.SeriesConnectionLabel.Text = '-- Series Connection';

            % Create ParallelConnectionLabel
            app.ParallelConnectionLabel = uilabel(app.SelectACircuitTab);
            app.ParallelConnectionLabel.Position = [300 3 119 22];
            app.ParallelConnectionLabel.Text = '// Parallel Connection';

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

            % Create Tab
            app.Tab = uitab(app.CircuitToFit);
            app.Tab.Title = 'Tab';

            % Create ProgressGuage
            app.ProgressGuage = uigauge(app.FittingParams, 'semicircular');
            app.ProgressGuage.FontSize = 9;
            app.ProgressGuage.Position = [7 7 70 38];

            % Create CCTFitOptionsTabGroup
            app.CCTFitOptionsTabGroup = uitabgroup(app.FittingParams);
            app.CCTFitOptionsTabGroup.SelectionChangedFcn = createCallbackFcn(app, @CCTFitOptionsTabGroupSelectionChanged, true);
            app.CCTFitOptionsTabGroup.Position = [152 205 317 121];

            % Create HyperparamsTab
            app.HyperparamsTab = uitab(app.CCTFitOptionsTabGroup);
            app.HyperparamsTab.Title = 'Hyperparams →';

            % Create Label_4
            app.Label_4 = uilabel(app.HyperparamsTab);
            app.Label_4.HorizontalAlignment = 'center';
            app.Label_4.FontSize = 14;
            app.Label_4.FontWeight = 'bold';
            app.Label_4.FontColor = [0.0745 0.6235 1];
            app.Label_4.Position = [38 54 238 34];
            app.Label_4.Text = {'(OPTIONAL) Adjust aspects of the '; 'equivalent circuit fitting'};

            % Create DropDown_2
            app.DropDown_2 = uidropdown(app.HyperparamsTab);
            app.DropDown_2.Items = {'Choose Utility', 'Alternate Series Resistance Estimate', 'Fit the Electrode and Barrier Sequentially (Select-A-Circuit Only)', 'Regularize in the Time Domain (EXPERIMENTAL)', 'Apply an Error Correction Factor (Zmeasured/Ztrue)'};
            app.DropDown_2.DropDownOpeningFcn = createCallbackFcn(app, @DropDown_2Opening, true);
            app.DropDown_2.ValueChangedFcn = createCallbackFcn(app, @DropDown_2ValueChanged, true);
            app.DropDown_2.FontSize = 14;
            app.DropDown_2.ClickedFcn = createCallbackFcn(app, @DropDown_2Clicked, true);
            app.DropDown_2.Position = [7 11 301 35];
            app.DropDown_2.Value = 'Choose Utility';

            % Create SeriesResistanceEstimateTab
            app.SeriesResistanceEstimateTab = uitab(app.CCTFitOptionsTabGroup);
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
            app.SequentialBarrierFittingTab = uitab(app.CCTFitOptionsTabGroup);
            app.SequentialBarrierFittingTab.Title = 'Sequential Barrier Fitting';

            % Create BlankFitIterationsEditFieldLabel
            app.BlankFitIterationsEditFieldLabel = uilabel(app.SequentialBarrierFittingTab);
            app.BlankFitIterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.BlankFitIterationsEditFieldLabel.FontColor = [0.4667 0.6745 0.1882];
            app.BlankFitIterationsEditFieldLabel.Position = [157 59 54 30];
            app.BlankFitIterationsEditFieldLabel.Text = {'Blank Fit'; 'Iterations'};

            % Create BlankFitIterationsEditField
            app.BlankFitIterationsEditField = uieditfield(app.SequentialBarrierFittingTab, 'numeric');
            app.BlankFitIterationsEditField.Position = [216 63 68 26];
            app.BlankFitIterationsEditField.Value = 1000;

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

            % Create RecursiveTimeRegularizationTab
            app.RecursiveTimeRegularizationTab = uitab(app.CCTFitOptionsTabGroup);
            app.RecursiveTimeRegularizationTab.Title = 'Recursive Time Regularization';

            % Create RecursiveTimeRegularizationLabel
            app.RecursiveTimeRegularizationLabel = uilabel(app.RecursiveTimeRegularizationTab);
            app.RecursiveTimeRegularizationLabel.HorizontalAlignment = 'center';
            app.RecursiveTimeRegularizationLabel.FontSize = 14;
            app.RecursiveTimeRegularizationLabel.FontWeight = 'bold';
            app.RecursiveTimeRegularizationLabel.FontColor = [0.4667 0.6745 0.1882];
            app.RecursiveTimeRegularizationLabel.Position = [33 4 102 52];
            app.RecursiveTimeRegularizationLabel.Text = {'Recursive'; 'Time '; 'Regularization'};

            % Create RecursiveTimeRegularizationSwitch
            app.RecursiveTimeRegularizationSwitch = uiswitch(app.RecursiveTimeRegularizationTab, 'slider');
            app.RecursiveTimeRegularizationSwitch.Orientation = 'vertical';
            app.RecursiveTimeRegularizationSwitch.ValueChangedFcn = createCallbackFcn(app, @RecursiveTimeRegularizationSwitchValueChanged, true);
            app.RecursiveTimeRegularizationSwitch.Tooltip = {'Fit the data with the circuit sans barrier first, then refit the data by fitting only the barrier parameters and keeping the pre-fit non-barrier parameters constant.'};
            app.RecursiveTimeRegularizationSwitch.Position = [10 25 21 48];

            % Create LambdaEditFieldLabel
            app.LambdaEditFieldLabel = uilabel(app.RecursiveTimeRegularizationTab);
            app.LambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.LambdaEditFieldLabel.Position = [67 69 48 22];
            app.LambdaEditFieldLabel.Text = 'Lambda';

            % Create LambdaEditField
            app.LambdaEditField = uieditfield(app.RecursiveTimeRegularizationTab, 'numeric');
            app.LambdaEditField.Limits = [0 Inf];
            app.LambdaEditField.Position = [121 69 44 22];
            app.LambdaEditField.Value = 0.01;

            % Create NumIterationsSpinnerLabel
            app.NumIterationsSpinnerLabel = uilabel(app.RecursiveTimeRegularizationTab);
            app.NumIterationsSpinnerLabel.HorizontalAlignment = 'right';
            app.NumIterationsSpinnerLabel.Position = [165 69 83 22];
            app.NumIterationsSpinnerLabel.Text = 'Num Iterations';

            % Create NumIterationsSpinner
            app.NumIterationsSpinner = uispinner(app.RecursiveTimeRegularizationTab);
            app.NumIterationsSpinner.Limits = [1 Inf];
            app.NumIterationsSpinner.Position = [252 69 60 22];
            app.NumIterationsSpinner.Value = 5;

            % Create RegSchemeListBoxLabel
            app.RegSchemeListBoxLabel = uilabel(app.RecursiveTimeRegularizationTab);
            app.RegSchemeListBoxLabel.HorizontalAlignment = 'right';
            app.RegSchemeListBoxLabel.Position = [130 18 49 30];
            app.RegSchemeListBoxLabel.Text = {'Reg'; 'Scheme'};

            % Create RegSchemeListBox
            app.RegSchemeListBox = uilistbox(app.RecursiveTimeRegularizationTab);
            app.RegSchemeListBox.Items = {'Smoothness', 'Sparsity', 'd/dt Smoothness', 'd/dt Sparsity', 'Local d/dt Smoothness'};
            app.RegSchemeListBox.Position = [187 4 121 60];
            app.RegSchemeListBox.Value = 'Smoothness';

            % Create ErrorCorrectionTab
            app.ErrorCorrectionTab = uitab(app.CCTFitOptionsTabGroup);
            app.ErrorCorrectionTab.Title = 'Error Correction';

            % Create ErrorCorrectionLabel
            app.ErrorCorrectionLabel = uilabel(app.ErrorCorrectionTab);
            app.ErrorCorrectionLabel.HorizontalAlignment = 'center';
            app.ErrorCorrectionLabel.FontWeight = 'bold';
            app.ErrorCorrectionLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ErrorCorrectionLabel.Position = [1 78 99 22];
            app.ErrorCorrectionLabel.Text = 'Error Correction';

            % Create ErrorCorrectionSwitch
            app.ErrorCorrectionSwitch = uiswitch(app.ErrorCorrectionTab, 'slider');
            app.ErrorCorrectionSwitch.Orientation = 'vertical';
            app.ErrorCorrectionSwitch.ValueChangedFcn = createCallbackFcn(app, @ErrorCorrectionSwitchValueChanged, true);
            app.ErrorCorrectionSwitch.Tooltip = {''};
            app.ErrorCorrectionSwitch.Position = [16 19 19 43];

            % Create ZmeasuredZtrueEditFieldLabel
            app.ZmeasuredZtrueEditFieldLabel = uilabel(app.ErrorCorrectionTab);
            app.ZmeasuredZtrueEditFieldLabel.HorizontalAlignment = 'right';
            app.ZmeasuredZtrueEditFieldLabel.FontWeight = 'bold';
            app.ZmeasuredZtrueEditFieldLabel.Position = [143 75 103 22];
            app.ZmeasuredZtrueEditFieldLabel.Text = 'Zmeasured/Ztrue';

            % Create ZmeasuredZtrueEditField
            app.ZmeasuredZtrueEditField = uieditfield(app.ErrorCorrectionTab, 'text');
            app.ZmeasuredZtrueEditField.Position = [107 46 193 30];

            % Create MaxParamErrValsEditField
            app.MaxParamErrValsEditField = uieditfield(app.ErrorCorrectionTab, 'text');
            app.MaxParamErrValsEditField.Position = [201 7 99 30];

            % Create FixedFreeParams
            app.FixedFreeParams = uiswitch(app.ErrorCorrectionTab, 'rocker');
            app.FixedFreeParams.Items = {'Free Params', 'Fixed Params'};
            app.FixedFreeParams.ValueChangedFcn = createCallbackFcn(app, @FixedFreeParamsValueChanged, true);
            app.FixedFreeParams.FontSize = 9;
            app.FixedFreeParams.Position = [65 21 14 31];
            app.FixedFreeParams.Value = 'Free Params';

            % Create ParamMaxValsLabel
            app.ParamMaxValsLabel = uilabel(app.ErrorCorrectionTab);
            app.ParamMaxValsLabel.FontWeight = 'bold';
            app.ParamMaxValsLabel.Position = [94 11 109 22];
            app.ParamMaxValsLabel.Text = 'Param Max Vals';

            % Create AbortButton
            app.AbortButton = uibutton(app.FittingParams, 'state');
            app.AbortButton.Tooltip = {'Abort circuit fitting after completion of the current time point'};
            app.AbortButton.Text = 'Abort';
            app.AbortButton.FontSize = 18;
            app.AbortButton.FontWeight = 'bold';
            app.AbortButton.FontColor = [0.6353 0.0784 0.1843];
            app.AbortButton.Position = [277 7 63 30];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.AnalysisCCTFITTab);
            app.TabGroup2.SelectionChangedFcn = createCallbackFcn(app, @TabGroup2SelectionChanged, true);
            app.TabGroup2.Position = [511 51 486 623];

            % Create PlotsTab
            app.PlotsTab = uitab(app.TabGroup2);
            app.PlotsTab.Title = 'Plots';

            % Create BodeResults
            app.BodeResults = uiaxes(app.PlotsTab);
            xlabel(app.BodeResults, 'X')
            ylabel(app.BodeResults, 'Y')
            zlabel(app.BodeResults, 'Z')
            app.BodeResults.Position = [10 335 470 265];

            % Create HoldPlotsSwitchLabel
            app.HoldPlotsSwitchLabel = uilabel(app.PlotsTab);
            app.HoldPlotsSwitchLabel.HorizontalAlignment = 'center';
            app.HoldPlotsSwitchLabel.FontSize = 18;
            app.HoldPlotsSwitchLabel.FontWeight = 'bold';
            app.HoldPlotsSwitchLabel.Position = [8 302 94 23];
            app.HoldPlotsSwitchLabel.Text = 'Hold Plots';

            % Create HoldPlotsSwitch
            app.HoldPlotsSwitch = uiswitch(app.PlotsTab, 'toggle');
            app.HoldPlotsSwitch.FontSize = 18;
            app.HoldPlotsSwitch.Position = [36 200 32 72];

            % Create PlotResultsfromTableSelectionButton
            app.PlotResultsfromTableSelectionButton = uibutton(app.PlotsTab, 'push');
            app.PlotResultsfromTableSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @PlotResultsfromTableSelectionButtonPushed, true);
            app.PlotResultsfromTableSelectionButton.FontSize = 14;
            app.PlotResultsfromTableSelectionButton.FontWeight = 'bold';
            app.PlotResultsfromTableSelectionButton.FontColor = [0.302 0.7451 0.9333];
            app.PlotResultsfromTableSelectionButton.Position = [14 94 81 77];
            app.PlotResultsfromTableSelectionButton.Text = {'Plot'; 'Results'; 'from Table'; 'Selection'};

            % Create AuxCCTFitResults
            app.AuxCCTFitResults = uitabgroup(app.PlotsTab);
            app.AuxCCTFitResults.Position = [109 4 370 316];

            % Create Nyquist
            app.Nyquist = uitab(app.AuxCCTFitResults);
            app.Nyquist.Title = 'Nyquist';

            % Create NyqResults
            app.NyqResults = uiaxes(app.Nyquist);
            xlabel(app.NyqResults, 'X')
            ylabel(app.NyqResults, 'Y')
            zlabel(app.NyqResults, 'Z')
            app.NyqResults.Position = [7 9 355 276];

            % Create ProblemSetuplogTab
            app.ProblemSetuplogTab = uitab(app.AuxCCTFitResults);
            app.ProblemSetuplogTab.Title = 'Problem Setup log';

            % Create CCTFitProblemLog
            app.CCTFitProblemLog = uitextarea(app.ProblemSetuplogTab);
            app.CCTFitProblemLog.Editable = 'off';
            app.CCTFitProblemLog.Position = [10 11 349 274];

            % Create RecursiveTimeReg
            app.RecursiveTimeReg = uitab(app.AuxCCTFitResults);
            app.RecursiveTimeReg.Title = 'Recursive Time Regularization';

            % Create RecursiveTimeRegPlot
            app.RecursiveTimeRegPlot = uiaxes(app.RecursiveTimeReg);
            xlabel(app.RecursiveTimeRegPlot, 'X')
            ylabel(app.RecursiveTimeRegPlot, 'Y')
            zlabel(app.RecursiveTimeRegPlot, 'Z')
            app.RecursiveTimeRegPlot.Position = [7 33 359 255];

            % Create RecursiveTimeRegLogSwitch
            app.RecursiveTimeRegLogSwitch = uiswitch(app.RecursiveTimeReg, 'slider');
            app.RecursiveTimeRegLogSwitch.Items = {'Ribbon', 'Overlay'};
            app.RecursiveTimeRegLogSwitch.ValueChangedFcn = createCallbackFcn(app, @RecursiveTimeRegLogSwitchValueChanged, true);
            app.RecursiveTimeRegLogSwitch.Position = [103 6 45 20];
            app.RecursiveTimeRegLogSwitch.Value = 'Ribbon';

            % Create RecursiveTimeRegLogSwitch_2
            app.RecursiveTimeRegLogSwitch_2 = uiswitch(app.RecursiveTimeReg, 'slider');
            app.RecursiveTimeRegLogSwitch_2.Items = {'Rb', 'Cb'};
            app.RecursiveTimeRegLogSwitch_2.Position = [291 8 45 20];
            app.RecursiveTimeRegLogSwitch_2.Value = 'Rb';

            % Create PlotAndExportZSwitch
            app.PlotAndExportZSwitch = uiswitch(app.PlotsTab, 'rocker');
            app.PlotAndExportZSwitch.Items = {'Plot Only', 'Plot & Export Z'};
            app.PlotAndExportZSwitch.ValueChangedFcn = createCallbackFcn(app, @PlotAndExportZSwitchValueChanged, true);
            app.PlotAndExportZSwitch.Tooltip = {'Select Plot & Export to save the impedance data and fits from the table selection.'};
            app.PlotAndExportZSwitch.Position = [42 23 20 45];
            app.PlotAndExportZSwitch.Value = 'Plot Only';

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup2);
            app.ResultsTab.Title = 'Results';

            % Create ResultsTable
            app.ResultsTable = uitable(app.ResultsTab);
            app.ResultsTable.ColumnName = {'Circuit'; 'Condition'; 'Exp'; 'Well'; 'Time'; 'Rb'; 'Cb'; 'Device CCT Params'; 'MSE'; 'NRMSE'; 'NMSE'; 'AIC'; 'BIC'};
            app.ResultsTable.RowName = {};
            app.ResultsTable.CellSelectionCallback = createCallbackFcn(app, @ResultsTableCellSelection, true);
            app.ResultsTable.DoubleClickedFcn = createCallbackFcn(app, @ResultsTableDoubleClicked, true);
            app.ResultsTable.Tooltip = {'''m'' - mark for exclusion'; '''a'' - mark to accept'; '''u'' - unmark'; '''q'' - mark for query'};
            app.ResultsTable.ButtonDownFcn = createCallbackFcn(app, @ResultsTableButtonDown, true);
            app.ResultsTable.KeyPressFcn = createCallbackFcn(app, @ResultsTableKeyPress, true);
            app.ResultsTable.Position = [11 43 461 547];

            % Create AutoMarkButton
            app.AutoMarkButton = uibutton(app.ResultsTab, 'push');
            app.AutoMarkButton.ButtonPushedFcn = createCallbackFcn(app, @AutoMarkButtonPushed, true);
            app.AutoMarkButton.FontSize = 14;
            app.AutoMarkButton.FontWeight = 'bold';
            app.AutoMarkButton.FontColor = [0.4941 0.1843 0.5569];
            app.AutoMarkButton.Position = [13 6 90 30];
            app.AutoMarkButton.Text = 'Auto-Mark';

            % Create PlotResultsfromTableSelectionButton_2
            app.PlotResultsfromTableSelectionButton_2 = uibutton(app.ResultsTab, 'push');
            app.PlotResultsfromTableSelectionButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotResultsfromTableSelectionButton_2Pushed, true);
            app.PlotResultsfromTableSelectionButton_2.FontWeight = 'bold';
            app.PlotResultsfromTableSelectionButton_2.FontColor = [0.302 0.7451 0.9333];
            app.PlotResultsfromTableSelectionButton_2.Position = [181 3 107 38];
            app.PlotResultsfromTableSelectionButton_2.Text = {'Plot Results from '; 'Table Selection'};

            % Create PlotAndExportZSwitch_2
            app.PlotAndExportZSwitch_2 = uiswitch(app.ResultsTab, 'rocker');
            app.PlotAndExportZSwitch_2.Items = {'Plot Only', 'Plot & Export Z'};
            app.PlotAndExportZSwitch_2.Orientation = 'horizontal';
            app.PlotAndExportZSwitch_2.ValueChangedFcn = createCallbackFcn(app, @PlotAndExportZSwitch_2ValueChanged, true);
            app.PlotAndExportZSwitch_2.Tooltip = {'Select Plot & Export to save the impedance data and fits from the table selection.'};
            app.PlotAndExportZSwitch_2.Position = [347 12 45 20];
            app.PlotAndExportZSwitch_2.Value = 'Plot Only';

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
            app.UpdateDiagnosticPlotsButton.Position = [153 552 176 38];
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
            app.PlotStyleSwitchLabel.FontWeight = 'bold';
            app.PlotStyleSwitchLabel.Position = [365 62 59 22];
            app.PlotStyleSwitchLabel.Text = 'Plot Style';

            % Create PlotStyleSwitch
            app.PlotStyleSwitch = uiswitch(app.DensityTab, 'slider');
            app.PlotStyleSwitch.Items = {'Surface', 'Contour'};
            app.PlotStyleSwitch.ValueChangedFcn = createCallbackFcn(app, @PlotStyleSwitchValueChanged, true);
            app.PlotStyleSwitch.Position = [371 89 45 20];
            app.PlotStyleSwitch.Value = 'Surface';

            % Create HoldPlotsSwitch_2Label
            app.HoldPlotsSwitch_2Label = uilabel(app.FitDiagnosticTab);
            app.HoldPlotsSwitch_2Label.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_2Label.FontWeight = 'bold';
            app.HoldPlotsSwitch_2Label.Position = [376 536 64 22];
            app.HoldPlotsSwitch_2Label.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_FitDiagnostics
            app.HoldPlotsSwitch_FitDiagnostics = uiswitch(app.FitDiagnosticTab, 'toggle');
            app.HoldPlotsSwitch_FitDiagnostics.Orientation = 'horizontal';
            app.HoldPlotsSwitch_FitDiagnostics.Position = [373 557 67 30];

            % Create LabelPlotsSwitchLabel
            app.LabelPlotsSwitchLabel = uilabel(app.FitDiagnosticTab);
            app.LabelPlotsSwitchLabel.HorizontalAlignment = 'center';
            app.LabelPlotsSwitchLabel.FontWeight = 'bold';
            app.LabelPlotsSwitchLabel.Position = [56 537 69 22];
            app.LabelPlotsSwitchLabel.Text = 'Label Plots';

            % Create LabelPlotsSwitch
            app.LabelPlotsSwitch = uiswitch(app.FitDiagnosticTab, 'slider');
            app.LabelPlotsSwitch.Position = [67 561 45 20];

            % Create SeriesPlotTab
            app.SeriesPlotTab = uitab(app.TabGroup2);
            app.SeriesPlotTab.Title = 'Series Plot';

            % Create FitSeriesPlot
            app.FitSeriesPlot = uiaxes(app.SeriesPlotTab);
            xlabel(app.FitSeriesPlot, 'X')
            ylabel(app.FitSeriesPlot, 'Y')
            zlabel(app.FitSeriesPlot, 'Z')
            app.FitSeriesPlot.Position = [10 87 470 341];

            % Create PlotFromTableSelectionButton
            app.PlotFromTableSelectionButton = uibutton(app.SeriesPlotTab, 'push');
            app.PlotFromTableSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @PlotFromTableSelectionButtonPushed, true);
            app.PlotFromTableSelectionButton.FontSize = 14;
            app.PlotFromTableSelectionButton.FontWeight = 'bold';
            app.PlotFromTableSelectionButton.FontColor = [0.4667 0.6745 0.1882];
            app.PlotFromTableSelectionButton.Tooltip = {'First highlight two columns in the Results table - clicking ''Plot From Table Selection'' will plot one data series against the other.'};
            app.PlotFromTableSelectionButton.Position = [19 537 94 58];
            app.PlotFromTableSelectionButton.Text = {'Plot From '; 'Table'; ' Selection'};

            % Create HoldPlotsSwitch_2Label_2
            app.HoldPlotsSwitch_2Label_2 = uilabel(app.SeriesPlotTab);
            app.HoldPlotsSwitch_2Label_2.HorizontalAlignment = 'center';
            app.HoldPlotsSwitch_2Label_2.FontSize = 18;
            app.HoldPlotsSwitch_2Label_2.FontWeight = 'bold';
            app.HoldPlotsSwitch_2Label_2.FontColor = [0.4667 0.6745 0.1882];
            app.HoldPlotsSwitch_2Label_2.Position = [37 16 94 23];
            app.HoldPlotsSwitch_2Label_2.Text = 'Hold Plots';

            % Create HoldPlotsSwitch_FitSeries
            app.HoldPlotsSwitch_FitSeries = uiswitch(app.SeriesPlotTab, 'toggle');
            app.HoldPlotsSwitch_FitSeries.Orientation = 'horizontal';
            app.HoldPlotsSwitch_FitSeries.FontSize = 18;
            app.HoldPlotsSwitch_FitSeries.Position = [35 43 97 43];

            % Create FlipAxesSwitchLabel
            app.FlipAxesSwitchLabel = uilabel(app.SeriesPlotTab);
            app.FlipAxesSwitchLabel.HorizontalAlignment = 'center';
            app.FlipAxesSwitchLabel.FontWeight = 'bold';
            app.FlipAxesSwitchLabel.Position = [202 23 58 22];
            app.FlipAxesSwitchLabel.Text = 'Flip Axes';

            % Create FlipAxesSwitch
            app.FlipAxesSwitch = uiswitch(app.SeriesPlotTab, 'slider');
            app.FlipAxesSwitch.Position = [208 48 45 20];

            % Create PlotMultiSeriesMeanSwitchLabel
            app.PlotMultiSeriesMeanSwitchLabel = uilabel(app.SeriesPlotTab);
            app.PlotMultiSeriesMeanSwitchLabel.HorizontalAlignment = 'center';
            app.PlotMultiSeriesMeanSwitchLabel.FontSize = 14;
            app.PlotMultiSeriesMeanSwitchLabel.FontWeight = 'bold';
            app.PlotMultiSeriesMeanSwitchLabel.FontColor = [0.4941 0.1843 0.5569];
            app.PlotMultiSeriesMeanSwitchLabel.Position = [303 18 155 22];
            app.PlotMultiSeriesMeanSwitchLabel.Text = 'Plot Multi-Series Mean';

            % Create PlotMultiSeriesMeanSwitch
            app.PlotMultiSeriesMeanSwitch = uiswitch(app.SeriesPlotTab, 'slider');
            app.PlotMultiSeriesMeanSwitch.FontSize = 18;
            app.PlotMultiSeriesMeanSwitch.Position = [346 47 68 30];

            % Create SeriesPlotcctFitTabGroup
            app.SeriesPlotcctFitTabGroup = uitabgroup(app.SeriesPlotTab);
            app.SeriesPlotcctFitTabGroup.Position = [131 446 343 150];

            % Create NormalizationTab_3
            app.NormalizationTab_3 = uitab(app.SeriesPlotcctFitTabGroup);
            app.NormalizationTab_3.Title = 'Normalization';

            % Create SwitchAreaNormType
            app.SwitchAreaNormType = uiswitch(app.NormalizationTab_3, 'slider');
            app.SwitchAreaNormType.Items = {'*A', '*sqrt(A)'};
            app.SwitchAreaNormType.Position = [244 6 45 20];
            app.SwitchAreaNormType.Value = '*A';

            % Create ZScoreNormalizeLabel_3
            app.ZScoreNormalizeLabel_3 = uilabel(app.NormalizationTab_3);
            app.ZScoreNormalizeLabel_3.HorizontalAlignment = 'center';
            app.ZScoreNormalizeLabel_3.FontSize = 14;
            app.ZScoreNormalizeLabel_3.FontWeight = 'bold';
            app.ZScoreNormalizeLabel_3.FontColor = [0.4667 0.6745 0.1882];
            app.ZScoreNormalizeLabel_3.Position = [-2 0 76 34];
            app.ZScoreNormalizeLabel_3.Text = {''; ' Normalize'};

            % Create ZScoreNormalizeSwitch_FitSeries_3
            app.ZScoreNormalizeSwitch_FitSeries_3 = uiswitch(app.NormalizationTab_3, 'slider');
            app.ZScoreNormalizeSwitch_FitSeries_3.Orientation = 'vertical';
            app.ZScoreNormalizeSwitch_FitSeries_3.FontWeight = 'bold';
            app.ZScoreNormalizeSwitch_FitSeries_3.Position = [22 36 29 65];

            % Create Areacm2EditFieldLabel
            app.Areacm2EditFieldLabel = uilabel(app.NormalizationTab_3);
            app.Areacm2EditFieldLabel.HorizontalAlignment = 'right';
            app.Areacm2EditFieldLabel.Position = [216 31 70 22];
            app.Areacm2EditFieldLabel.Text = 'Area (cm^2)';

            % Create Areacm2EditField
            app.Areacm2EditField = uieditfield(app.NormalizationTab_3, 'numeric');
            app.Areacm2EditField.Position = [289 30 54 22];
            app.Areacm2EditField.Value = 1;

            % Create AreaNormalizeSwitchLabel
            app.AreaNormalizeSwitchLabel = uilabel(app.NormalizationTab_3);
            app.AreaNormalizeSwitchLabel.HorizontalAlignment = 'center';
            app.AreaNormalizeSwitchLabel.FontSize = 14;
            app.AreaNormalizeSwitchLabel.FontWeight = 'bold';
            app.AreaNormalizeSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.AreaNormalizeSwitchLabel.Position = [223 99 107 22];
            app.AreaNormalizeSwitchLabel.Text = 'Area Normalize';

            % Create AreaNormalizeSwitch
            app.AreaNormalizeSwitch = uiswitch(app.NormalizationTab_3, 'slider');
            app.AreaNormalizeSwitch.FontWeight = 'bold';
            app.AreaNormalizeSwitch.Position = [244 66 70 31];

            % Create NormalizationSchemeListBox_6Label
            app.NormalizationSchemeListBox_6Label = uilabel(app.NormalizationTab_3);
            app.NormalizationSchemeListBox_6Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_6Label.Position = [78 104 126 22];
            app.NormalizationSchemeListBox_6Label.Text = 'Normalization Scheme';

            % Create NormalizationSchemeListBox_6
            app.NormalizationSchemeListBox_6 = uilistbox(app.NormalizationTab_3);
            app.NormalizationSchemeListBox_6.Items = {'zscore', 'norm', 'scale', 'range', 'center', 'medianiqr'};
            app.NormalizationSchemeListBox_6.ValueChangedFcn = createCallbackFcn(app, @NormalizationSchemeListBox_6ValueChanged, true);
            app.NormalizationSchemeListBox_6.Position = [81 54 122 53];
            app.NormalizationSchemeListBox_6.Value = 'zscore';

            % Create NormOptionLabel
            app.NormOptionLabel = uilabel(app.NormalizationTab_3);
            app.NormOptionLabel.HorizontalAlignment = 'right';
            app.NormOptionLabel.Position = [80 15 40 30];
            app.NormOptionLabel.Text = {'Norm.'; 'Option'};

            % Create NormOptionListBox
            app.NormOptionListBox = uilistbox(app.NormalizationTab_3);
            app.NormOptionListBox.Items = {'std', 'robust'};
            app.NormOptionListBox.Position = [129 10 73 37];
            app.NormOptionListBox.Value = 'std';

            % Create OutlierRemovalTab_2
            app.OutlierRemovalTab_2 = uitab(app.SeriesPlotcctFitTabGroup);
            app.OutlierRemovalTab_2.Title = 'Outlier Removal';

            % Create OutlierRemovalSwitch_2Label
            app.OutlierRemovalSwitch_2Label = uilabel(app.OutlierRemovalTab_2);
            app.OutlierRemovalSwitch_2Label.HorizontalAlignment = 'center';
            app.OutlierRemovalSwitch_2Label.FontSize = 14;
            app.OutlierRemovalSwitch_2Label.FontWeight = 'bold';
            app.OutlierRemovalSwitch_2Label.FontColor = [0.4667 0.6745 0.1882];
            app.OutlierRemovalSwitch_2Label.Position = [22 28 112 22];
            app.OutlierRemovalSwitch_2Label.Text = 'Outlier Removal';

            % Create OutlierRemovalSwitch_2
            app.OutlierRemovalSwitch_2 = uiswitch(app.OutlierRemovalTab_2, 'slider');
            app.OutlierRemovalSwitch_2.FontWeight = 'bold';
            app.OutlierRemovalSwitch_2.Position = [45 55 65 29];

            % Create DetectionSchemeListBox_2Label
            app.DetectionSchemeListBox_2Label = uilabel(app.OutlierRemovalTab_2);
            app.DetectionSchemeListBox_2Label.HorizontalAlignment = 'right';
            app.DetectionSchemeListBox_2Label.Position = [183 10 103 22];
            app.DetectionSchemeListBox_2Label.Text = 'Detection Scheme';

            % Create DetectionSchemeListBox_2
            app.DetectionSchemeListBox_2 = uilistbox(app.OutlierRemovalTab_2);
            app.DetectionSchemeListBox_2.Items = {'median', 'mean', 'quartiles', 'grubbs', 'gesd'};
            app.DetectionSchemeListBox_2.Position = [171 36 131 56];
            app.DetectionSchemeListBox_2.Value = 'median';

            % Create ResampleTab_2
            app.ResampleTab_2 = uitab(app.SeriesPlotcctFitTabGroup);
            app.ResampleTab_2.Title = 'Resample';

            % Create ResampleFactorLabel_2
            app.ResampleFactorLabel_2 = uilabel(app.ResampleTab_2);
            app.ResampleFactorLabel_2.FontWeight = 'bold';
            app.ResampleFactorLabel_2.Position = [90 35 102 22];
            app.ResampleFactorLabel_2.Text = 'Resample Factor';

            % Create ResampleSwitch_2Label
            app.ResampleSwitch_2Label = uilabel(app.ResampleTab_2);
            app.ResampleSwitch_2Label.HorizontalAlignment = 'center';
            app.ResampleSwitch_2Label.FontSize = 14;
            app.ResampleSwitch_2Label.FontWeight = 'bold';
            app.ResampleSwitch_2Label.FontColor = [0.4667 0.6745 0.1882];
            app.ResampleSwitch_2Label.Position = [8 6 71 22];
            app.ResampleSwitch_2Label.Text = 'Resample';

            % Create ResampleSwitch_2
            app.ResampleSwitch_2 = uiswitch(app.ResampleTab_2, 'slider');
            app.ResampleSwitch_2.Orientation = 'vertical';
            app.ResampleSwitch_2.Position = [31 51 20 45];

            % Create ResampleFrequencyEditField_2Label
            app.ResampleFrequencyEditField_2Label = uilabel(app.ResampleTab_2);
            app.ResampleFrequencyEditField_2Label.HorizontalAlignment = 'right';
            app.ResampleFrequencyEditField_2Label.FontWeight = 'bold';
            app.ResampleFrequencyEditField_2Label.Position = [103 77 126 22];
            app.ResampleFrequencyEditField_2Label.Text = 'Resample Frequency';

            % Create ResampleFrequencyEditField_2
            app.ResampleFrequencyEditField_2 = uieditfield(app.ResampleTab_2, 'numeric');
            app.ResampleFrequencyEditField_2.Limits = [0 Inf];
            app.ResampleFrequencyEditField_2.FontSize = 14;
            app.ResampleFrequencyEditField_2.FontWeight = 'bold';
            app.ResampleFrequencyEditField_2.Position = [240 77 38 22];
            app.ResampleFrequencyEditField_2.Value = 1;

            % Create Label_2
            app.Label_2 = uilabel(app.ResampleTab_2);
            app.Label_2.FontSize = 36;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.Position = [257 25 16 47];
            app.Label_2.Text = '/';

            % Create pEditField_2Label
            app.pEditField_2Label = uilabel(app.ResampleTab_2);
            app.pEditField_2Label.HorizontalAlignment = 'right';
            app.pEditField_2Label.Position = [184 37 25 22];
            app.pEditField_2Label.Text = 'p';

            % Create pEditField_2
            app.pEditField_2 = uieditfield(app.ResampleTab_2, 'numeric');
            app.pEditField_2.Limits = [0 Inf];
            app.pEditField_2.FontSize = 14;
            app.pEditField_2.Position = [214 37 38 22];
            app.pEditField_2.Value = 1;

            % Create qEditField_2Label
            app.qEditField_2Label = uilabel(app.ResampleTab_2);
            app.qEditField_2Label.HorizontalAlignment = 'right';
            app.qEditField_2Label.Position = [252 38 25 22];
            app.qEditField_2Label.Text = 'q';

            % Create qEditField_2
            app.qEditField_2 = uieditfield(app.ResampleTab_2, 'numeric');
            app.qEditField_2.Limits = [0 Inf];
            app.qEditField_2.FontSize = 14;
            app.qEditField_2.Position = [282 38 38 22];
            app.qEditField_2.Value = 1;

            % Create LabelDataSeriesSwitchLabel
            app.LabelDataSeriesSwitchLabel = uilabel(app.SeriesPlotTab);
            app.LabelDataSeriesSwitchLabel.HorizontalAlignment = 'center';
            app.LabelDataSeriesSwitchLabel.FontWeight = 'bold';
            app.LabelDataSeriesSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.LabelDataSeriesSwitchLabel.Position = [13 480 105 22];
            app.LabelDataSeriesSwitchLabel.Text = 'Label Data Series';

            % Create LabelDataSeriesSwitch
            app.LabelDataSeriesSwitch = uiswitch(app.SeriesPlotTab, 'slider');
            app.LabelDataSeriesSwitch.Position = [42 505 45 20];

            % Create RefreshPlotButton_2
            app.RefreshPlotButton_2 = uibutton(app.SeriesPlotTab, 'push');
            app.RefreshPlotButton_2.ButtonPushedFcn = createCallbackFcn(app, @RefreshPlotButton_2Pushed, true);
            app.RefreshPlotButton_2.FontSize = 14;
            app.RefreshPlotButton_2.FontWeight = 'bold';
            app.RefreshPlotButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshPlotButton_2.Position = [15 446 100 26];
            app.RefreshPlotButton_2.Text = 'Refresh Plot';

            % Create SaveResultsButton
            app.SaveResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.SaveResultsButton.ButtonPushedFcn = createCallbackFcn(app, @SaveResultsButtonPushed, true);
            app.SaveResultsButton.FontSize = 14;
            app.SaveResultsButton.FontWeight = 'bold';
            app.SaveResultsButton.FontColor = [0.4667 0.6745 0.1882];
            app.SaveResultsButton.Position = [759 12 114 30];
            app.SaveResultsButton.Text = 'Save Results';

            % Create ClearResultsButton
            app.ClearResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.ClearResultsButton.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButtonPushed, true);
            app.ClearResultsButton.FontSize = 14;
            app.ClearResultsButton.FontWeight = 'bold';
            app.ClearResultsButton.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton.Position = [511 13 108 30];
            app.ClearResultsButton.Text = 'Clear Results';

            % Create LoadResultsButton
            app.LoadResultsButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.LoadResultsButton.ButtonPushedFcn = createCallbackFcn(app, @LoadResultsButtonPushed, true);
            app.LoadResultsButton.FontSize = 14;
            app.LoadResultsButton.FontColor = [0.4667 0.6745 0.1882];
            app.LoadResultsButton.Position = [881 13 114 30];
            app.LoadResultsButton.Text = 'Load Results';

            % Create SaveFigureButton
            app.SaveFigureButton = uibutton(app.AnalysisCCTFITTab, 'push');
            app.SaveFigureButton.ButtonPushedFcn = createCallbackFcn(app, @SaveFigureButtonPushed, true);
            app.SaveFigureButton.FontSize = 14;
            app.SaveFigureButton.FontWeight = 'bold';
            app.SaveFigureButton.FontColor = [0 0 1];
            app.SaveFigureButton.Position = [897 679 100 26];
            app.SaveFigureButton.Text = 'Save Figure';

            % Create AnalysisTimeSeriesMagnitudeCrossSectionTab
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab = uitab(app.TabGroup);
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab.Title = 'Analysis Time Series Magnitude Cross Section';
            app.AnalysisTimeSeriesMagnitudeCrossSectionTab.Tag = 'CrossSection';

            % Create TrimData_2
            app.TrimData_2 = uipanel(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.TrimData_2.Title = 'Select Time Series';
            app.TrimData_2.Position = [15 376 476 328];

            % Create ConditionListBox_2Label
            app.ConditionListBox_2Label = uilabel(app.TrimData_2);
            app.ConditionListBox_2Label.HorizontalAlignment = 'right';
            app.ConditionListBox_2Label.FontSize = 14;
            app.ConditionListBox_2Label.Position = [62 252 64 22];
            app.ConditionListBox_2Label.Text = 'Condition';

            % Create ConditionListBox_2
            app.ConditionListBox_2 = uilistbox(app.TrimData_2);
            app.ConditionListBox_2.Position = [134 229 324 73];

            % Create ExperimentNumberListBox_2Label
            app.ExperimentNumberListBox_2Label = uilabel(app.TrimData_2);
            app.ExperimentNumberListBox_2Label.HorizontalAlignment = 'right';
            app.ExperimentNumberListBox_2Label.FontSize = 14;
            app.ExperimentNumberListBox_2Label.Position = [207 111 130 43];
            app.ExperimentNumberListBox_2Label.Text = 'Experiment Number';

            % Create ExperimentNumberListBox_2
            app.ExperimentNumberListBox_2 = uilistbox(app.TrimData_2);
            app.ExperimentNumberListBox_2.Position = [215 145 119 74];

            % Create WellNumberListBox_2Label
            app.WellNumberListBox_2Label = uilabel(app.TrimData_2);
            app.WellNumberListBox_2Label.HorizontalAlignment = 'right';
            app.WellNumberListBox_2Label.FontSize = 14;
            app.WellNumberListBox_2Label.Position = [360 121 86 22];
            app.WellNumberListBox_2Label.Text = 'Well Number';

            % Create WellNumberListBox_2
            app.WellNumberListBox_2 = uilistbox(app.TrimData_2);
            app.WellNumberListBox_2.Multiselect = 'on';
            app.WellNumberListBox_2.Position = [354 145 104 75];
            app.WellNumberListBox_2.Value = {'Item 1'};

            % Create ChosenDataTable_2
            app.ChosenDataTable_2 = uitable(app.TrimData_2);
            app.ChosenDataTable_2.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable_2.RowName = {};
            app.ChosenDataTable_2.Position = [14 10 450 109];

            % Create ChooseandPlotButton
            app.ChooseandPlotButton = uibutton(app.TrimData_2, 'push');
            app.ChooseandPlotButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseandPlotButtonPushed, true);
            app.ChooseandPlotButton.FontSize = 18;
            app.ChooseandPlotButton.FontWeight = 'bold';
            app.ChooseandPlotButton.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseandPlotButton.Tooltip = {'Select Data subset to process'};
            app.ChooseandPlotButton.Position = [28 159 157 30];
            app.ChooseandPlotButton.Text = 'Choose and Plot';

            % Create RefreshData_2
            app.RefreshData_2 = uibutton(app.TrimData_2, 'push');
            app.RefreshData_2.ButtonPushedFcn = createCallbackFcn(app, @RefreshData_2Pushed, true);
            app.RefreshData_2.Icon = fullfile(pathToMLAPP, 'images', 'Refresh_icon.png');
            app.RefreshData_2.FontWeight = 'bold';
            app.RefreshData_2.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshData_2.Tooltip = {'Refresh Data Options'};
            app.RefreshData_2.Position = [5 271 41 33];
            app.RefreshData_2.Text = '';

            % Create CrossSectionParametersPanel
            app.CrossSectionParametersPanel = uipanel(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.CrossSectionParametersPanel.Title = 'Cross Section Parameters';
            app.CrossSectionParametersPanel.Position = [15 12 478 359];

            % Create OffsetRemovalSwitchLabel
            app.OffsetRemovalSwitchLabel = uilabel(app.CrossSectionParametersPanel);
            app.OffsetRemovalSwitchLabel.HorizontalAlignment = 'center';
            app.OffsetRemovalSwitchLabel.FontSize = 14;
            app.OffsetRemovalSwitchLabel.FontWeight = 'bold';
            app.OffsetRemovalSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OffsetRemovalSwitchLabel.Position = [121 285 107 22];
            app.OffsetRemovalSwitchLabel.Text = 'Offset Removal';

            % Create OffsetRemovalSwitch
            app.OffsetRemovalSwitch = uiswitch(app.CrossSectionParametersPanel, 'slider');
            app.OffsetRemovalSwitch.Position = [151 312 45 20];

            % Create CrossSectionFrequencySliderLabel
            app.CrossSectionFrequencySliderLabel = uilabel(app.CrossSectionParametersPanel);
            app.CrossSectionFrequencySliderLabel.HorizontalAlignment = 'right';
            app.CrossSectionFrequencySliderLabel.FontSize = 18;
            app.CrossSectionFrequencySliderLabel.FontWeight = 'bold';
            app.CrossSectionFrequencySliderLabel.FontColor = [0.4667 0.6745 0.1882];
            app.CrossSectionFrequencySliderLabel.Position = [113 85 224 23];
            app.CrossSectionFrequencySliderLabel.Text = 'Cross Section Frequency';

            % Create CrossSectionFrequencySlider
            app.CrossSectionFrequencySlider = uislider(app.CrossSectionParametersPanel);
            app.CrossSectionFrequencySlider.ValueChangedFcn = createCallbackFcn(app, @CrossSectionFrequencySliderValueChanged, true);
            app.CrossSectionFrequencySlider.ValueChangingFcn = createCallbackFcn(app, @CrossSectionFrequencySliderValueChanging, true);
            app.CrossSectionFrequencySlider.FontColor = [0.4667 0.6745 0.1882];
            app.CrossSectionFrequencySlider.Position = [6 79 449 3];

            % Create HzEditFieldLabel
            app.HzEditFieldLabel = uilabel(app.CrossSectionParametersPanel);
            app.HzEditFieldLabel.HorizontalAlignment = 'right';
            app.HzEditFieldLabel.FontSize = 18;
            app.HzEditFieldLabel.Position = [322 17 27 23];
            app.HzEditFieldLabel.Text = 'Hz';

            % Create HzEditField
            app.HzEditField = uieditfield(app.CrossSectionParametersPanel, 'numeric');
            app.HzEditField.ValueChangedFcn = createCallbackFcn(app, @HzEditFieldValueChanged, true);
            app.HzEditField.FontSize = 18;
            app.HzEditField.Position = [205 10 105 35];

            % Create Panel_2
            app.Panel_2 = uipanel(app.CrossSectionParametersPanel);
            app.Panel_2.Position = [327 121 138 213];

            % Create OverlayTimeSeriesSwitchLabel
            app.OverlayTimeSeriesSwitchLabel = uilabel(app.Panel_2);
            app.OverlayTimeSeriesSwitchLabel.HorizontalAlignment = 'center';
            app.OverlayTimeSeriesSwitchLabel.FontSize = 14;
            app.OverlayTimeSeriesSwitchLabel.FontWeight = 'bold';
            app.OverlayTimeSeriesSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OverlayTimeSeriesSwitchLabel.Position = [-2 140 139 22];
            app.OverlayTimeSeriesSwitchLabel.Text = 'Overlay Time Series';

            % Create OverlayTimeSeriesSwitch
            app.OverlayTimeSeriesSwitch = uiswitch(app.Panel_2, 'toggle');
            app.OverlayTimeSeriesSwitch.Orientation = 'horizontal';
            app.OverlayTimeSeriesSwitch.ValueChangedFcn = createCallbackFcn(app, @OverlayTimeSeriesSwitchValueChanged, true);
            app.OverlayTimeSeriesSwitch.FontSize = 14;
            app.OverlayTimeSeriesSwitch.FontWeight = 'bold';
            app.OverlayTimeSeriesSwitch.Position = [33 166 72 32];

            % Create WaterFallSwitchLabel
            app.WaterFallSwitchLabel = uilabel(app.Panel_2);
            app.WaterFallSwitchLabel.HorizontalAlignment = 'center';
            app.WaterFallSwitchLabel.FontSize = 14;
            app.WaterFallSwitchLabel.FontWeight = 'bold';
            app.WaterFallSwitchLabel.Position = [32 41 68 22];
            app.WaterFallSwitchLabel.Text = 'WaterFall';

            % Create WaterFallSwitch
            app.WaterFallSwitch = uiswitch(app.Panel_2, 'slider');
            app.WaterFallSwitch.ValueChangedFcn = createCallbackFcn(app, @WaterFallSwitchValueChanged, true);
            app.WaterFallSwitch.FontSize = 14;
            app.WaterFallSwitch.Position = [43 70 45 20];

            % Create PlotMeanSwitchLabel
            app.PlotMeanSwitchLabel = uilabel(app.Panel_2);
            app.PlotMeanSwitchLabel.HorizontalAlignment = 'center';
            app.PlotMeanSwitchLabel.FontSize = 14;
            app.PlotMeanSwitchLabel.FontWeight = 'bold';
            app.PlotMeanSwitchLabel.Position = [31 91 71 22];
            app.PlotMeanSwitchLabel.Text = 'Plot Mean';

            % Create PlotMeanSwitch
            app.PlotMeanSwitch = uiswitch(app.Panel_2, 'slider');
            app.PlotMeanSwitch.FontSize = 14;
            app.PlotMeanSwitch.Position = [43 115 45 20];

            % Create ResetAccumulatorButton
            app.ResetAccumulatorButton = uibutton(app.Panel_2, 'push');
            app.ResetAccumulatorButton.ButtonPushedFcn = createCallbackFcn(app, @ResetAccumulatorButtonPushed, true);
            app.ResetAccumulatorButton.FontWeight = 'bold';
            app.ResetAccumulatorButton.FontColor = [0.6353 0.0784 0.1843];
            app.ResetAccumulatorButton.Position = [7 5 124 23];
            app.ResetAccumulatorButton.Text = 'Reset Accumulator';

            % Create CrossSectionOptions
            app.CrossSectionOptions = uitabgroup(app.CrossSectionParametersPanel);
            app.CrossSectionOptions.Position = [16 119 300 167];

            % Create NormalizationTab_2
            app.NormalizationTab_2 = uitab(app.CrossSectionOptions);
            app.NormalizationTab_2.Title = 'Normalization';

            % Create Panel_3
            app.Panel_3 = uipanel(app.NormalizationTab_2);
            app.Panel_3.Position = [9 8 280 130];

            % Create NormalizeSwitchLabel
            app.NormalizeSwitchLabel = uilabel(app.Panel_3);
            app.NormalizeSwitchLabel.HorizontalAlignment = 'center';
            app.NormalizeSwitchLabel.FontSize = 14;
            app.NormalizeSwitchLabel.FontWeight = 'bold';
            app.NormalizeSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.NormalizeSwitchLabel.Position = [31 98 72 22];
            app.NormalizeSwitchLabel.Text = 'Normalize';

            % Create NormalizeSwitch
            app.NormalizeSwitch = uiswitch(app.Panel_3, 'slider');
            app.NormalizeSwitch.FontWeight = 'bold';
            app.NormalizeSwitch.Position = [31 64 68 30];

            % Create NormalizationSchemeListBox_5Label
            app.NormalizationSchemeListBox_5Label = uilabel(app.Panel_3);
            app.NormalizationSchemeListBox_5Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_5Label.Position = [141 104 126 22];
            app.NormalizationSchemeListBox_5Label.Text = 'Normalization Scheme';

            % Create NormalizationSchemeListBox_5
            app.NormalizationSchemeListBox_5 = uilistbox(app.Panel_3);
            app.NormalizationSchemeListBox_5.Items = {'zscore', 'norm', 'scale', 'range', 'center', 'medianiqr'};
            app.NormalizationSchemeListBox_5.ValueChangedFcn = createCallbackFcn(app, @NormalizationSchemeListBox_5ValueChanged, true);
            app.NormalizationSchemeListBox_5.Position = [141 51 131 55];
            app.NormalizationSchemeListBox_5.Value = 'zscore';

            % Create ModulobeforeafternormalizingSwitch
            app.ModulobeforeafternormalizingSwitch = uiswitch(app.Panel_3, 'slider');
            app.ModulobeforeafternormalizingSwitch.Items = {'|Z|', 'Z'};
            app.ModulobeforeafternormalizingSwitch.FontSize = 14;
            app.ModulobeforeafternormalizingSwitch.FontWeight = 'bold';
            app.ModulobeforeafternormalizingSwitch.FontColor = [0.6353 0.0784 0.1843];
            app.ModulobeforeafternormalizingSwitch.Position = [44 24 45 20];
            app.ModulobeforeafternormalizingSwitch.Value = '|Z|';

            % Create NormOptionListBox_2Label
            app.NormOptionListBox_2Label = uilabel(app.Panel_3);
            app.NormOptionListBox_2Label.HorizontalAlignment = 'right';
            app.NormOptionListBox_2Label.Position = [149 14 40 30];
            app.NormOptionListBox_2Label.Text = {'Norm.'; 'Option'};

            % Create NormOptionListBox_2
            app.NormOptionListBox_2 = uilistbox(app.Panel_3);
            app.NormOptionListBox_2.Items = {'std', 'robust'};
            app.NormOptionListBox_2.Position = [198 9 73 37];
            app.NormOptionListBox_2.Value = 'std';

            % Create OutlierRemovalTab
            app.OutlierRemovalTab = uitab(app.CrossSectionOptions);
            app.OutlierRemovalTab.Title = 'Outlier Removal';

            % Create OutlierRemovalSwitchLabel
            app.OutlierRemovalSwitchLabel = uilabel(app.OutlierRemovalTab);
            app.OutlierRemovalSwitchLabel.HorizontalAlignment = 'center';
            app.OutlierRemovalSwitchLabel.FontSize = 14;
            app.OutlierRemovalSwitchLabel.FontWeight = 'bold';
            app.OutlierRemovalSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.OutlierRemovalSwitchLabel.Position = [9 63 112 22];
            app.OutlierRemovalSwitchLabel.Text = 'Outlier Removal';

            % Create OutlierRemovalSwitch
            app.OutlierRemovalSwitch = uiswitch(app.OutlierRemovalTab, 'slider');
            app.OutlierRemovalSwitch.Position = [41 90 45 20];

            % Create DetectionSchemeListBoxLabel
            app.DetectionSchemeListBoxLabel = uilabel(app.OutlierRemovalTab);
            app.DetectionSchemeListBoxLabel.HorizontalAlignment = 'right';
            app.DetectionSchemeListBoxLabel.Position = [160 35 103 22];
            app.DetectionSchemeListBoxLabel.Text = 'Detection Scheme';

            % Create DetectionSchemeListBox
            app.DetectionSchemeListBox = uilistbox(app.OutlierRemovalTab);
            app.DetectionSchemeListBox.Items = {'median', 'mean', 'quartiles', 'grubbs', 'gesd'};
            app.DetectionSchemeListBox.Position = [148 61 131 56];
            app.DetectionSchemeListBox.Value = 'median';

            % Create ResampleTab
            app.ResampleTab = uitab(app.CrossSectionOptions);
            app.ResampleTab.Title = 'Resample';

            % Create ResampleSwitchLabel
            app.ResampleSwitchLabel = uilabel(app.ResampleTab);
            app.ResampleSwitchLabel.HorizontalAlignment = 'center';
            app.ResampleSwitchLabel.FontSize = 14;
            app.ResampleSwitchLabel.FontWeight = 'bold';
            app.ResampleSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ResampleSwitchLabel.Position = [6 14 71 22];
            app.ResampleSwitchLabel.Text = 'Resample';

            % Create ResampleSwitch
            app.ResampleSwitch = uiswitch(app.ResampleTab, 'slider');
            app.ResampleSwitch.Orientation = 'vertical';
            app.ResampleSwitch.Position = [29 59 20 45];

            % Create FinalResampleFrequencyEditFieldLabel
            app.FinalResampleFrequencyEditFieldLabel = uilabel(app.ResampleTab);
            app.FinalResampleFrequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalResampleFrequencyEditFieldLabel.FontWeight = 'bold';
            app.FinalResampleFrequencyEditFieldLabel.Position = [64 89 157 22];
            app.FinalResampleFrequencyEditFieldLabel.Text = 'Final Resample Frequency';

            % Create FinalResampleFrequencyEditField
            app.FinalResampleFrequencyEditField = uieditfield(app.ResampleTab, 'numeric');
            app.FinalResampleFrequencyEditField.Limits = [0 Inf];
            app.FinalResampleFrequencyEditField.FontSize = 14;
            app.FinalResampleFrequencyEditField.FontWeight = 'bold';
            app.FinalResampleFrequencyEditField.Position = [232 89 38 22];
            app.FinalResampleFrequencyEditField.Value = 1;

            % Create pEditFieldLabel
            app.pEditFieldLabel = uilabel(app.ResampleTab);
            app.pEditFieldLabel.HorizontalAlignment = 'right';
            app.pEditFieldLabel.Position = [157 51 25 22];
            app.pEditFieldLabel.Text = 'p';

            % Create pEditField
            app.pEditField = uieditfield(app.ResampleTab, 'numeric');
            app.pEditField.Limits = [0 Inf];
            app.pEditField.FontSize = 14;
            app.pEditField.Position = [187 51 38 22];
            app.pEditField.Value = 1;

            % Create qEditFieldLabel
            app.qEditFieldLabel = uilabel(app.ResampleTab);
            app.qEditFieldLabel.HorizontalAlignment = 'right';
            app.qEditFieldLabel.Position = [225 52 25 22];
            app.qEditFieldLabel.Text = 'q';

            % Create qEditField
            app.qEditField = uieditfield(app.ResampleTab, 'numeric');
            app.qEditField.Limits = [0 Inf];
            app.qEditField.FontSize = 14;
            app.qEditField.Position = [255 52 38 22];
            app.qEditField.Value = 1;

            % Create Label
            app.Label = uilabel(app.ResampleTab);
            app.Label.FontSize = 36;
            app.Label.FontWeight = 'bold';
            app.Label.Position = [230 43 16 47];
            app.Label.Text = '/';

            % Create IntermediateResampleFactorLabel
            app.IntermediateResampleFactorLabel = uilabel(app.ResampleTab);
            app.IntermediateResampleFactorLabel.FontWeight = 'bold';
            app.IntermediateResampleFactorLabel.Position = [70 46 102 30];
            app.IntermediateResampleFactorLabel.Text = {'Intermediate'; 'Resample Factor'};

            % Create ClipTimeVectorTab
            app.ClipTimeVectorTab = uitab(app.CrossSectionOptions);
            app.ClipTimeVectorTab.Title = 'Clip Time Vector';

            % Create ClipTimeVectorSwitchLabel
            app.ClipTimeVectorSwitchLabel = uilabel(app.ClipTimeVectorTab);
            app.ClipTimeVectorSwitchLabel.HorizontalAlignment = 'center';
            app.ClipTimeVectorSwitchLabel.FontSize = 14;
            app.ClipTimeVectorSwitchLabel.FontWeight = 'bold';
            app.ClipTimeVectorSwitchLabel.FontColor = [0.4667 0.6745 0.1882];
            app.ClipTimeVectorSwitchLabel.Position = [8 59 115 22];
            app.ClipTimeVectorSwitchLabel.Text = 'Clip Time Vector';

            % Create ClipTimeVectorSwitch
            app.ClipTimeVectorSwitch = uiswitch(app.ClipTimeVectorTab, 'slider');
            app.ClipTimeVectorSwitch.Position = [41 86 45 20];

            % Create NumStartValuesToClipSpinnerLabel
            app.NumStartValuesToClipSpinnerLabel = uilabel(app.ClipTimeVectorTab);
            app.NumStartValuesToClipSpinnerLabel.HorizontalAlignment = 'right';
            app.NumStartValuesToClipSpinnerLabel.Position = [142 109 138 22];
            app.NumStartValuesToClipSpinnerLabel.Text = 'Num Start Values To Clip';

            % Create NumStartValuesToClipSpinner
            app.NumStartValuesToClipSpinner = uispinner(app.ClipTimeVectorTab);
            app.NumStartValuesToClipSpinner.Limits = [0 Inf];
            app.NumStartValuesToClipSpinner.FontSize = 18;
            app.NumStartValuesToClipSpinner.Position = [184 86 67 24];

            % Create NumTailValuesToClipSpinnerLabel
            app.NumTailValuesToClipSpinnerLabel = uilabel(app.ClipTimeVectorTab);
            app.NumTailValuesToClipSpinnerLabel.HorizontalAlignment = 'right';
            app.NumTailValuesToClipSpinnerLabel.Position = [149 57 131 22];
            app.NumTailValuesToClipSpinnerLabel.Text = 'Num Tail Values To Clip';

            % Create NumTailValuesToClipSpinner
            app.NumTailValuesToClipSpinner = uispinner(app.ClipTimeVectorTab);
            app.NumTailValuesToClipSpinner.Limits = [0 Inf];
            app.NumTailValuesToClipSpinner.FontSize = 18;
            app.NumTailValuesToClipSpinner.Position = [184 36 67 24];

            % Create RefreshPlotButton
            app.RefreshPlotButton = uibutton(app.CrossSectionParametersPanel, 'push');
            app.RefreshPlotButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshPlotButtonPushed, true);
            app.RefreshPlotButton.FontSize = 14;
            app.RefreshPlotButton.FontWeight = 'bold';
            app.RefreshPlotButton.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshPlotButton.Position = [96 15 100 26];
            app.RefreshPlotButton.Text = 'Refresh Plot';

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.AnalysisTimeSeriesMagnitudeCrossSectionTab);
            app.TabGroup4.Position = [501 48 501 656];

            % Create PlotsTab_2
            app.PlotsTab_2 = uitab(app.TabGroup4);
            app.PlotsTab_2.Title = 'Plots';

            % Create CSResultsPlot
            app.CSResultsPlot = uiaxes(app.PlotsTab_2);
            title(app.CSResultsPlot, 'Title')
            xlabel(app.CSResultsPlot, 'X')
            ylabel(app.CSResultsPlot, 'Y')
            zlabel(app.CSResultsPlot, 'Z')
            app.CSResultsPlot.Position = [6 261 493 362];

            % Create CSDataPlot
            app.CSDataPlot = uiaxes(app.PlotsTab_2);
            xlabel(app.CSDataPlot, 'X')
            ylabel(app.CSDataPlot, 'Y')
            zlabel(app.CSDataPlot, 'Z')
            app.CSDataPlot.Position = [5 47 493 225];

            % Create LoadDataIntoResultsTableButton
            app.LoadDataIntoResultsTableButton = uibutton(app.PlotsTab_2, 'push');
            app.LoadDataIntoResultsTableButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataIntoResultsTableButtonPushed, true);
            app.LoadDataIntoResultsTableButton.FontSize = 14;
            app.LoadDataIntoResultsTableButton.FontWeight = 'bold';
            app.LoadDataIntoResultsTableButton.FontColor = [0.4667 0.6745 0.1882];
            app.LoadDataIntoResultsTableButton.Position = [152 8 208 33];
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
            app.ResultsTable_2.Position = [16 112 461 509];

            % Create ClearResultsButton_2
            app.ClearResultsButton_2 = uibutton(app.ResultsTab_2, 'push');
            app.ClearResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButton_2Pushed, true);
            app.ClearResultsButton_2.FontSize = 18;
            app.ClearResultsButton_2.FontWeight = 'bold';
            app.ClearResultsButton_2.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton_2.Position = [21 14 156 51];
            app.ClearResultsButton_2.Text = 'Clear Results';

            % Create SaveResultsButton_2
            app.SaveResultsButton_2 = uibutton(app.ResultsTab_2, 'push');
            app.SaveResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @SaveResultsButton_2Pushed, true);
            app.SaveResultsButton_2.FontSize = 18;
            app.SaveResultsButton_2.FontWeight = 'bold';
            app.SaveResultsButton_2.Position = [320 10 156 51];
            app.SaveResultsButton_2.Text = 'Save Results';

            % Create SaveFigureButton_2
            app.SaveFigureButton_2 = uibutton(app.AnalysisTimeSeriesMagnitudeCrossSectionTab, 'push');
            app.SaveFigureButton_2.ButtonPushedFcn = createCallbackFcn(app, @SaveFigureButton_2Pushed, true);
            app.SaveFigureButton_2.FontSize = 14;
            app.SaveFigureButton_2.FontWeight = 'bold';
            app.SaveFigureButton_2.FontColor = [0 0 1];
            app.SaveFigureButton_2.Position = [703 9 100 26];
            app.SaveFigureButton_2.Text = 'Save Figure';

            % Create AnalysisEstimateTransferFunctionTab
            app.AnalysisEstimateTransferFunctionTab = uitab(app.TabGroup);
            app.AnalysisEstimateTransferFunctionTab.Title = 'Analysis Estimate Transfer Function';
            app.AnalysisEstimateTransferFunctionTab.Tag = 'TransferFnFit';

            % Create TrimData_3
            app.TrimData_3 = uipanel(app.AnalysisEstimateTransferFunctionTab);
            app.TrimData_3.Title = 'Select Data';
            app.TrimData_3.Position = [15 352 476 353];

            % Create ConditionListBox_3Label
            app.ConditionListBox_3Label = uilabel(app.TrimData_3);
            app.ConditionListBox_3Label.HorizontalAlignment = 'right';
            app.ConditionListBox_3Label.FontSize = 14;
            app.ConditionListBox_3Label.Position = [33 257 64 22];
            app.ConditionListBox_3Label.Text = 'Condition';

            % Create ConditionListBox_3
            app.ConditionListBox_3 = uilistbox(app.TrimData_3);
            app.ConditionListBox_3.Position = [110 257 356 72];

            % Create ExperimentNumberListBox_3Label
            app.ExperimentNumberListBox_3Label = uilabel(app.TrimData_3);
            app.ExperimentNumberListBox_3Label.HorizontalAlignment = 'right';
            app.ExperimentNumberListBox_3Label.FontSize = 14;
            app.ExperimentNumberListBox_3Label.Position = [4 198 130 43];
            app.ExperimentNumberListBox_3Label.Text = 'Experiment Number';

            % Create ExperimentNumberListBox_3
            app.ExperimentNumberListBox_3 = uilistbox(app.TrimData_3);
            app.ExperimentNumberListBox_3.Position = [146 195 114 58];

            % Create WellNumberListBox_3Label
            app.WellNumberListBox_3Label = uilabel(app.TrimData_3);
            app.WellNumberListBox_3Label.HorizontalAlignment = 'right';
            app.WellNumberListBox_3Label.FontSize = 14;
            app.WellNumberListBox_3Label.Position = [46 151 86 22];
            app.WellNumberListBox_3Label.Text = 'Well Number';

            % Create WellNumberListBox_3
            app.WellNumberListBox_3 = uilistbox(app.TrimData_3);
            app.WellNumberListBox_3.Multiselect = 'on';
            app.WellNumberListBox_3.Position = [146 135 114 54];
            app.WellNumberListBox_3.Value = {'Item 1'};

            % Create ChosenDataTable_3
            app.ChosenDataTable_3 = uitable(app.TrimData_3);
            app.ChosenDataTable_3.ColumnName = {'Condition'; 'Experiment Number'; 'Well'; 'Time Point'};
            app.ChosenDataTable_3.RowName = {};
            app.ChosenDataTable_3.Position = [11 9 456 116];

            % Create ChooseButton_2
            app.ChooseButton_2 = uibutton(app.TrimData_3, 'push');
            app.ChooseButton_2.ButtonPushedFcn = createCallbackFcn(app, @ChooseButton_2Pushed, true);
            app.ChooseButton_2.FontSize = 18;
            app.ChooseButton_2.FontWeight = 'bold';
            app.ChooseButton_2.FontColor = [0.4667 0.6745 0.1882];
            app.ChooseButton_2.Tooltip = {'Select the Data subset to be fit'};
            app.ChooseButton_2.Position = [291 137 146 30];
            app.ChooseButton_2.Text = 'Choose';

            % Create TimeListBox_2Label
            app.TimeListBox_2Label = uilabel(app.TrimData_3);
            app.TimeListBox_2Label.HorizontalAlignment = 'right';
            app.TimeListBox_2Label.FontSize = 14;
            app.TimeListBox_2Label.Position = [282 205 48 22];
            app.TimeListBox_2Label.Text = 'Time';

            % Create TimeListBox_2
            app.TimeListBox_2 = uilistbox(app.TrimData_3);
            app.TimeListBox_2.Multiselect = 'on';
            app.TimeListBox_2.Position = [345 178 122 75];
            app.TimeListBox_2.Value = {'Item 1'};

            % Create RefreshData_3
            app.RefreshData_3 = uibutton(app.TrimData_3, 'push');
            app.RefreshData_3.ButtonPushedFcn = createCallbackFcn(app, @RefreshData_3Pushed, true);
            app.RefreshData_3.Icon = fullfile(pathToMLAPP, 'images', 'Refresh_icon.png');
            app.RefreshData_3.FontWeight = 'bold';
            app.RefreshData_3.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshData_3.Tooltip = {'Refresh Data Options'};
            app.RefreshData_3.Position = [5 292 42 37];
            app.RefreshData_3.Text = '';

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
            app.PlotFromTableSelectionButton_2.Position = [15 494 93 74];
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
            app.NormalizationSchemeListBox_4.ValueChangedFcn = createCallbackFcn(app, @NormalizationSchemeListBox_4ValueChanged, true);
            app.NormalizationSchemeListBox_4.Position = [143 30 100 89];
            app.NormalizationSchemeListBox_4.Value = 'zscore';

            % Create ZScoreNormalizeLabel_2
            app.ZScoreNormalizeLabel_2 = uilabel(app.NormalizationTab);
            app.ZScoreNormalizeLabel_2.HorizontalAlignment = 'center';
            app.ZScoreNormalizeLabel_2.FontSize = 18;
            app.ZScoreNormalizeLabel_2.FontWeight = 'bold';
            app.ZScoreNormalizeLabel_2.FontColor = [0.4667 0.6745 0.1882];
            app.ZScoreNormalizeLabel_2.Position = [21 29 96 44];
            app.ZScoreNormalizeLabel_2.Text = {''; ' Normalize'};

            % Create ZScoreNormalizeSwitch_FitSeries_2
            app.ZScoreNormalizeSwitch_FitSeries_2 = uiswitch(app.NormalizationTab, 'slider');
            app.ZScoreNormalizeSwitch_FitSeries_2.FontSize = 18;
            app.ZScoreNormalizeSwitch_FitSeries_2.FontWeight = 'bold';
            app.ZScoreNormalizeSwitch_FitSeries_2.Position = [47 65 45 20];

            % Create NormalizationSchemeListBox_4Label
            app.NormalizationSchemeListBox_4Label = uilabel(app.NormalizationTab);
            app.NormalizationSchemeListBox_4Label.HorizontalAlignment = 'right';
            app.NormalizationSchemeListBox_4Label.FontWeight = 'bold';
            app.NormalizationSchemeListBox_4Label.Position = [122 6 134 22];
            app.NormalizationSchemeListBox_4Label.Text = 'Normalization Scheme';

            % Create NormalizationOptionListBoxLabel
            app.NormalizationOptionListBoxLabel = uilabel(app.NormalizationTab);
            app.NormalizationOptionListBoxLabel.HorizontalAlignment = 'center';
            app.NormalizationOptionListBoxLabel.Position = [258 88 78 30];
            app.NormalizationOptionListBoxLabel.Text = {'Normalization'; 'Option'};

            % Create NormalizationOptionListBox
            app.NormalizationOptionListBox = uilistbox(app.NormalizationTab);
            app.NormalizationOptionListBox.Items = {'std', 'robust'};
            app.NormalizationOptionListBox.Position = [260 30 73 55];
            app.NormalizationOptionListBox.Value = 'std';

            % Create PolePlottingTab
            app.PolePlottingTab = uitab(app.TabGroup6);
            app.PolePlottingTab.Title = 'Pole Plotting';

            % Create SelectPoletoPlotFastesttoSlowestSpinnerLabel
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel = uilabel(app.PolePlottingTab);
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.HorizontalAlignment = 'center';
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.FontWeight = 'bold';
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.FontColor = [0.4667 0.6745 0.1882];
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.Position = [99 16 119 59];
            app.SelectPoletoPlotFastesttoSlowestSpinnerLabel.Text = {'Select Pole to Plot'; '(Fastest to Slowest)'; 'Assume Consistent'; 'Ordering'};

            % Create SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner = uispinner(app.PolePlottingTab);
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Limits = [1 Inf];
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.FontSize = 24;
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Position = [133 81 58 38];
            app.SelectPoletoPlotFastesttoSlowestAssumeConsistentOrderingSpinner.Value = 1;

            % Create EnablePolePlottingvsTimeSwitchLabel
            app.EnablePolePlottingvsTimeSwitchLabel = uilabel(app.PolePlottingTab);
            app.EnablePolePlottingvsTimeSwitchLabel.HorizontalAlignment = 'center';
            app.EnablePolePlottingvsTimeSwitchLabel.FontSize = 14;
            app.EnablePolePlottingvsTimeSwitchLabel.FontWeight = 'bold';
            app.EnablePolePlottingvsTimeSwitchLabel.Position = [6 26 91 52];
            app.EnablePolePlottingvsTimeSwitchLabel.Text = {'Enable'; 'Pole Plotting'; '(vs Time)'};

            % Create EnablePolePlottingvsTimeSwitch
            app.EnablePolePlottingvsTimeSwitch = uiswitch(app.PolePlottingTab, 'slider');
            app.EnablePolePlottingvsTimeSwitch.ValueChangedFcn = createCallbackFcn(app, @EnablePolePlottingvsTimeSwitchValueChanged, true);
            app.EnablePolePlottingvsTimeSwitch.Position = [29 87 45 20];

            % Create PlotTypeListBoxLabel
            app.PlotTypeListBoxLabel = uilabel(app.PolePlottingTab);
            app.PlotTypeListBoxLabel.HorizontalAlignment = 'right';
            app.PlotTypeListBoxLabel.FontWeight = 'bold';
            app.PlotTypeListBoxLabel.Position = [251 13 58 22];
            app.PlotTypeListBoxLabel.Text = 'Plot Type';

            % Create PlotTypeListBox
            app.PlotTypeListBox = uilistbox(app.PolePlottingTab);
            app.PlotTypeListBox.Items = {'Mag Time Series', 'Nyquist', 'Tau Time Series', 'Real Time Series'};
            app.PlotTypeListBox.Position = [220 42 123 77];
            app.PlotTypeListBox.Value = 'Mag Time Series';

            % Create RefreshPlotButton_3
            app.RefreshPlotButton_3 = uibutton(app.SeriesPlotTab_2, 'push');
            app.RefreshPlotButton_3.ButtonPushedFcn = createCallbackFcn(app, @RefreshPlotButton_3Pushed, true);
            app.RefreshPlotButton_3.FontSize = 14;
            app.RefreshPlotButton_3.FontWeight = 'bold';
            app.RefreshPlotButton_3.FontColor = [0.4667 0.6745 0.1882];
            app.RefreshPlotButton_3.Position = [12 459 100 26];
            app.RefreshPlotButton_3.Text = 'Refresh Plot';

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
            app.AuxillaryOptionsPanel.Position = [162 9 299 228];

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
            app.MaxiterationsEditField.Position = [155 169 102 32];
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
            app.WeightingFilterListBox.Position = [146 95 111 66];
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
            app.SearchMethodListBox.Position = [146 13 110 74];
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
            app.SaveResultsButton_3.Position = [751 13 114 30];
            app.SaveResultsButton_3.Text = 'Save Results';

            % Create ClearResultsButton_3
            app.ClearResultsButton_3 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.ClearResultsButton_3.ButtonPushedFcn = createCallbackFcn(app, @ClearResultsButton_3Pushed, true);
            app.ClearResultsButton_3.FontSize = 14;
            app.ClearResultsButton_3.FontWeight = 'bold';
            app.ClearResultsButton_3.FontColor = [0.851 0.3255 0.098];
            app.ClearResultsButton_3.Position = [511 13 108 30];
            app.ClearResultsButton_3.Text = 'Clear Results';

            % Create LoadResultsButton_2
            app.LoadResultsButton_2 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.LoadResultsButton_2.ButtonPushedFcn = createCallbackFcn(app, @LoadResultsButton_2Pushed, true);
            app.LoadResultsButton_2.FontSize = 14;
            app.LoadResultsButton_2.Position = [873 14 114 30];
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

            % Create SaveFigureButton_3
            app.SaveFigureButton_3 = uibutton(app.AnalysisEstimateTransferFunctionTab, 'push');
            app.SaveFigureButton_3.ButtonPushedFcn = createCallbackFcn(app, @SaveFigureButton_3Pushed, true);
            app.SaveFigureButton_3.FontSize = 14;
            app.SaveFigureButton_3.FontWeight = 'bold';
            app.SaveFigureButton_3.FontColor = [0 0 1];
            app.SaveFigureButton_3.Position = [887 679 100 26];
            app.SaveFigureButton_3.Text = 'Save Figure';

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

