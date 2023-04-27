classdef AnalyZeMagCrossSectionTest < matlab.uitest.TestCase
    properties
        App
    end

    methods (TestMethodSetup)
        function launchApp(testCase)
            testCase.App = AnalyZe;
            testCase.addTeardown(@delete,testCase.App)
        end
    end

    methods (Test)
        
        function testMagCrossSectionDataSelection(testCase)
            testCase.App.TutorialMode = false; %Disable Explainer Pop-ups
            
           %% Generate test data
            R_inf = 100;
            R_b = 250;
            C_b = 0.5e-6;
            Q_CE = 1e-5;
            alpha_CE = 0.9;
            freq_Fwd = logspace(0.1,6,100);
            freq = freq_Fwd(end:-1:1);
            Z_cct = 1./(Q_CE.*( (1j.*(2*pi.*freq)).^alpha_CE )) + ((  (1./(R_b)) + (1j.*C_b.*(2*pi.*freq))  ).^(-1)) + R_inf;
            Z_cct = Z_cct.';
            
                Index = 1:length(Z_cct);
                Index = Index';
                FrequencyHz = freq';
                Z = real(Z_cct);
                Z1 = -1.*imag(Z_cct);
                Z2 = abs(Z_cct);
                Phase = -1.*(180/pi).*(angle(Z_cct));
                Times = Index;
                Data_cct = table(Index,FrequencyHz,Z,Z1,Z2,Phase,Times);

            z_cct_blank = (Z_cct.*0) + (1+1j);
                Index = 1:length(z_cct_blank);
                Index = Index';
                FrequencyHz = freq';
                Z = real(z_cct_blank);
                Z1 = -1.*imag(z_cct_blank);
                Z2 = abs(z_cct_blank);
                Phase = -1.*(180/pi).*(angle(z_cct_blank));
                Times = Index;
                Data_cct_blank = table(Index,FrequencyHz,Z,Z1,Z2,Phase,Times);
 
            Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
            
            TestCaseName = 'TestCase';
            Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                     'Time', {0},...
                                     'ExperimentNumber', {1},...
                                     'Well', {'A1'} ,...
                                     'Data', (Data_cct)...
                                     );
            Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                     'Time', {1},...
                                     'ExperimentNumber', {1},...
                                     'Well', {'A1'} ,...
                                     'Data', (Data_cct_blank)...
                                     );

            testCase.App.Data = Data_TestCase;


             %% Navigate To Transfer Fn Fit Tab
                testCase.press(testCase.App.TimeSeriesMagnitudeCrossSectionButton)

                 testCase.verifyEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis Time Series Magnitude Cross Section')

           %% Refresh Data
            testCase.press(testCase.App.RefreshDataOptionsButton_2)

           
           %% Choose Data
            testCase.press(testCase.App.ChooseandPlotButton)

            ChosenData = testCase.App.ChosenDataTable_2.Data;
            testCase.verifyEqual(ChosenData{1},TestCaseName)


        end


        function testMagCrossSectionBasicDataExtractionFromTimeSeries(testCase)
            testCase.App.TutorialMode = false; %Disable Explainer Pop-ups
            
           %% Generate test data time series
            R_inf = 100;
            R_b = 250.*linspace(1,2,10);
            C_b = 0.5e-6;
            Q_CE = 1e-5;
            alpha_CE = 0.9;
            freq_Fwd = logspace(0.1,6,100);
            freq = freq_Fwd(end:-1:1);

             Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
            
            for i = 1:length(R_b)

                Z_cct = ((  (1./(R_b(i))) + (1j.*C_b.*(2*pi.*freq))  ).^(-1)) + R_inf;
                Z_cct = Z_cct.';
                
                    Index = 1:length(Z_cct);
                    Index = Index';
                    FrequencyHz = freq';
                    Z = real(Z_cct);
                    Z1 = -1.*imag(Z_cct);
                    Z2 = abs(Z_cct);
                    Phase = -1.*(180/pi).*(angle(Z_cct));
                    Times = Index;
                    Data_cct = table(Index,FrequencyHz,Z,Z1,Z2,Phase,Times);
     
                               
                TestCaseName = 'TestCase';
                Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                         'Time', {i},...
                                         'ExperimentNumber', {1},...
                                         'Well', {'A1'} ,...
                                         'Data', (Data_cct)...
                                         );
            end


            testCase.App.Data = Data_TestCase;


             %% Navigate To Transfer Fn Fit Tab
                testCase.press(testCase.App.TimeSeriesMagnitudeCrossSectionButton)

                 testCase.assertEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis Time Series Magnitude Cross Section')

           %% Refresh Data
            testCase.press(testCase.App.RefreshDataOptionsButton_2)

           
           %% Choose Data
            testCase.press(testCase.App.ChooseandPlotButton)

            ChosenData = testCase.App.ChosenDataTable_2.Data;
            testCase.assertEqual(ChosenData{1},TestCaseName)

           %Choose Frequency
               testFreq = 0.1;
               testCase.choose(testCase.App.CrossSectionFrequencySlider,testFreq)

           %Load Data into results table
                testCase.press(testCase.App.LoadDataIntoResultsTableButton)
                Results = testCase.App.ResultsTable_2.Data;
                CrossSection = cell2mat(Results(:,6));

                tolerance = 0.01*R_b(1);

                for i = 1:length(R_b)
                    testCase.verifyTrue( abs( (CrossSection(i)-R_inf) - R_b(i) ) <= tolerance)
                end


        end




    end

end