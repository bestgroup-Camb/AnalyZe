classdef AnalyZeCircuitFitTest < matlab.uitest.TestCase
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
        function testCCTFitDataRefresh(testCase)
           %tc = matlab.uitest.TestCase.forInteractiveUse;

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
            Data_TestCase(end+1) = struct('Name', {'TestCaseBlank'},...
                                     'Time', {1},...
                                     'ExperimentNumber', {2},...
                                     'Well', {'D1'} ,...
                                     'Data', (Data_cct_blank)...
                                     );

            testCase.App.Data = Data_TestCase;

            %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                 testCase.verifyEqual( ...
                                    testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

           %% Refresh Data
            testCase.press(testCase.App.RefreshDataOptionsButton)

           %% Choose Data
            testCase.press(testCase.App.ChooseButton)

            ChosenData = testCase.App.ChosenDataTable.Data;
            testCase.verifyEqual(ChosenData{1},TestCaseName)


        end

        function testDafaultCircuitFit(testCase)
           
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
              testCase.App.Data = Data_TestCase;

             %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                 testCase.assertEqual( ...
                                    testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

               %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
               %% Choose Data
                testCase.press(testCase.App.ChooseButton)
            
            %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,500)
                testCase.choose(testCase.App.SelectaCircuitBarrierInclusiveListBox,'R--(R//C)--Q')
                testCase.press(testCase.App.GoButton)

            %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1);
                Cb_Result = Beta_result(2);

                R_tolerance = 0.01*(R_b);
                C_tolerance = 0.01*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )



        end

        function testBuildACircuitFit(testCase)
           
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
 
            Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
            
            TestCaseName = 'TestCase';
            Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                     'Time', {0},...
                                     'ExperimentNumber', {1},...
                                     'Well', {'A1'} ,...
                                     'Data', (Data_cct)...
                                     );
              testCase.App.Data = Data_TestCase;

             %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                testCase.assertEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

               %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
               %% Choose Data
                testCase.press(testCase.App.ChooseButton)
            
            %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,500)
            
            %% Rebuild Circuit
                BuildACircuitTab = testCase.App.BuildACircuitTab;
                testCase.choose(BuildACircuitTab)
                selectedTab = testCase.App.CircuitToFit.SelectedTab;
                testCase.assertEqual(selectedTab,BuildACircuitTab)
           
                testCase.type(testCase.App.CircuitBuilderTable, [1 3], '');
                testCase.type(testCase.App.CircuitBuilderTable, [2 3], 'Q');
                testCase.type(testCase.App.CircuitBuilderTable, [3 3], '');

                testCase.type(testCase.App.CircuitBuilderTable, [1 4], '');
                testCase.type(testCase.App.CircuitBuilderTable, [2 4], '');
                testCase.type(testCase.App.CircuitBuilderTable, [3 4], '');


           %% Add in Barrier
                testCase.press(testCase.App.IncludeBarrierSwitch)

           %% Run fitting procedure

                testCase.press(testCase.App.GoButton)

           %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1);
                Cb_Result = Beta_result(2);

                R_tolerance = 0.01*(R_b);
                C_tolerance = 0.01*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )



        end

        function testWriteACircuit(testCase)
            
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
 
            Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
            
            TestCaseName = 'TestCase';
            Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                     'Time', {0},...
                                     'ExperimentNumber', {1},...
                                     'Well', {'A1'} ,...
                                     'Data', (Data_cct)...
                                     );
              testCase.App.Data = Data_TestCase;

           %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                testCase.assertEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

           %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
           %% Choose Data
                testCase.press(testCase.App.ChooseButton)
            
           %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,500)

           %% Write Circuit
                WriteACircuitTab = testCase.App.WriteACircuitTab;
                testCase.choose(WriteACircuitTab)
                selectedTab = testCase.App.CircuitToFit.SelectedTab;
                testCase.assertEqual(selectedTab,WriteACircuitTab)
           
               testCase.type(testCase.App.CircuitStringEditField,'Q2')
               testCase.type(testCase.App.MaxValuesEditField,'1,1')

           %% Add in Barrier
                testCase.press(testCase.App.IncludeBarrierSwitch_2)

           %% Run fitting procedure

                testCase.press(testCase.App.GoButton)

           %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1);
                Cb_Result = Beta_result(2);

                R_tolerance = 0.01*(R_b);
                C_tolerance = 0.01*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )

        end

        function testSeriesResistanceFreeRFit(testCase)
           
            testCase.App.TutorialMode = false; %Disable Explainer Pop-ups
            TruncationFreq = 5000; %Hz

            %% Generate test data
                R_inf = 100;
                R_b = 250;
                C_b = 0.5e-6;
                Q_CE = 1e-5;
                alpha_CE = 0.9;
                freq_Fwd = logspace(0.1,6,100);
                freq = freq_Fwd(end:-1:1);
                   ind = find(freq<=5000);
                   freq = freq(ind(1):end);
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
     
                Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
                
                TestCaseName = 'TestCase';
                Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                         'Time', {0},...
                                         'ExperimentNumber', {1},...
                                         'Well', {'A1'} ,...
                                         'Data', (Data_cct)...
                                         );
                  testCase.App.Data = Data_TestCase;

             %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                 testCase.assertEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

             %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
            %% Choose Data
                testCase.press(testCase.App.ChooseButton)
            
            %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,500)
                testCase.choose(testCase.App.SelectaCircuitBarrierInclusiveListBox,'R--(R//C)--Q')

                testCase.press(testCase.App.RSeriesResistanceSwitch)
                testCase.choose(testCase.App.AlternateRestimationListBox,'Free R Fit')

            %% Run fitting procedure    
                testCase.press(testCase.App.GoButton)

            %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1);
                Cb_Result = Beta_result(2);

                R_tolerance = 0.05*(R_b);
                C_tolerance = 0.05*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )

        end

        function testSeriesResistanceImagMinFit(testCase)
           
            testCase.App.TutorialMode = false; %Disable Explainer Pop-ups

            %% Generate test data
                R_inf = 100;
                R_b = 250;
                C_b = 0.5e-6;
                Q_CE = 1e-5;
                alpha_CE = 0.9;
                freq_Fwd = logspace(0.1,6,100);
                freq = freq_Fwd(end:-1:1);

                Z_cct = ((  (1./(0.1*R_b)) + (1j.*0.05*C_b.*(2*pi.*freq))  ).^(-1)) + 1./(Q_CE.*( (1j.*(2*pi.*freq)).^alpha_CE )) + ((  (1./(R_b)) + (1j.*C_b.*(2*pi.*freq))  ).^(-1)) + R_inf;
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
     
                Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
                
                TestCaseName = 'TestCase';
                Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                         'Time', {0},...
                                         'ExperimentNumber', {1},...
                                         'Well', {'A1'} ,...
                                         'Data', (Data_cct)...
                                         );
                  testCase.App.Data = Data_TestCase;

             %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                 testCase.assertEqual(testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

             %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
            %% Choose Data
                testCase.press(testCase.App.ChooseButton)
            
            %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,1000)
                testCase.choose(testCase.App.SelectaCircuitBarrierInclusiveListBox,'R--(R//C)--Q')

                testCase.press(testCase.App.RSeriesResistanceSwitch)
                testCase.choose(testCase.App.AlternateRestimationListBox,'Im(Z) Local Min')

            %% Run fitting procedure    
                testCase.press(testCase.App.GoButton)

            %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1)
                Cb_Result = Beta_result(2)

                R_tolerance = 0.05*(R_b);
                C_tolerance = 0.05*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )

        end

        function testSequentialCircuitFit(testCase)
            
              testCase.App.TutorialMode = false; %Disable Explainer Pop-ups
            
           %% Generate test data
             R_inf = 100;
            R_b = 50;
            C_b = 1e-6;
            C_CE = 1e-5;
            W_CE = 3e-5;
            R_CE = 1;
            freq_Fwd = logspace(0.1,6,100);
            freq = freq_Fwd(end:-1:1);
            Z_cct = ((  (1./(R_CE + (1./(W_CE.*(1j.*2*pi.*freq).^0.5) ) )) + (1j.*C_CE.*(2*pi.*freq))  ).^(-1)) + ((  (1./(R_b)) + (1j.*C_b.*(2*pi.*freq))  ).^(-1)) + R_inf;
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

 
            Data_TestCase = struct('Name', {'Start'}, 'Time', {-1}, 'ExperimentNumber', {-1}, 'Well', {'A0'} , 'Data', {}); 
            
            TestCaseName = 'TestCase';
            Data_TestCase(end+1) = struct('Name', {TestCaseName},...
                                     'Time', {0},...
                                     'ExperimentNumber', {1},...
                                     'Well', {'A1'} ,...
                                     'Data', (Data_cct)...
                                     );
              testCase.App.Data = Data_TestCase;

             %% Navigate To CCT Fit Tab
                testCase.press(testCase.App.FitEquivalentCircuitButton)

                 testCase.assertEqual( ...
                                    testCase.App.TabGroup.SelectedTab.Title,'Analysis CCT FIT')

               %% Refresh Data
                testCase.press(testCase.App.RefreshDataOptionsButton)
    
               %% Choose Data
                testCase.press(testCase.App.ChooseButton)

            %% Engage Sequential Fit
                SequentualFitTab = testCase.App.SequentialBarrierFittingTab;
                testCase.choose(SequentualFitTab)
                testCase.press(testCase.App.FitSequentiallySwitch)
                testCase.type(testCase.App.BlankFitMultiStartsEditField,1000)
            
            %% Adjust Fit Params
                testCase.type(testCase.App.MultiStartsEditField,1000)
                testCase.choose(testCase.App.SelectaCircuitBarrierInclusiveListBox,'R--(R//C)--((R--W)//C)')

           %% Run fitting procedure
                testCase.press(testCase.App.GoButton)

            %% Verify barrier parameters have been fit properly
                FitResultsStruct = testCase.App.Fits;
                FitParams = FitResultsStruct.FitsResults;
                Beta_result = FitParams{1};
                Rb_Result = Beta_result(1);
                Cb_Result = Beta_result(2);

                R_tolerance = 0.1*(R_b);
                C_tolerance = 0.1*(C_b);

                testCase.verifyTrue( abs(R_b-Rb_Result) <= R_tolerance )
                testCase.verifyTrue( abs(C_b-Cb_Result) <= C_tolerance )

        end



    end

end