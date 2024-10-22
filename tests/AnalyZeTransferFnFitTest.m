classdef AnalyZeTransferFnFitTest < matlab.uitest.TestCase
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
        function testTxFnFitDataRefresh(testCase)
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

            %% Navigate To Transfer Fn Fit Tab
                testCase.press(testCase.App.FitTransferFunctionButton)

                 testCase.verifyEqual( ...
                                    testCase.App.TabGroup.SelectedTab.Title,'Analysis Estimate Transfer Function')

           %% Refresh Data
            testCase.press(testCase.App.RefreshData_3)

           %% Choose Data
            testCase.press(testCase.App.ChooseButton_2)

            ChosenData = testCase.App.ChosenDataTable_3.Data;
            testCase.verifyEqual(ChosenData{1},TestCaseName)


        end

        function testTxFnFitSimpleCircuitFit(testCase)
           %tc = matlab.uitest.TestCase.forInteractiveUse;

           testCase.App.TutorialMode = false; %Disable Explainer Pop-ups
            
           %% Generate test data
            R_inf = 100;
            R_b = 250;
            C_b = 0.5e-6;
            C_CE = 1e-5;
            R_CE = 1e5;
            freq_Fwd = logspace(0.1,6,100);
            freq = freq_Fwd(end:-1:1);
            Z_cct = ((  (1./(R_CE)) + (1j.*C_CE.*(2*pi.*freq))  ).^(-1)) + ((  (1./(R_b)) + (1j.*C_b.*(2*pi.*freq))  ).^(-1)) + R_inf;
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

            %% Navigate To Transfer Fn Fit Tab
                testCase.press(testCase.App.FitTransferFunctionButton)

                 testCase.verifyEqual( ...
                                    testCase.App.TabGroup.SelectedTab.Title,'Analysis Estimate Transfer Function')

           %% Refresh Data
            testCase.press(testCase.App.RefreshData_3)

           %% Choose Data
            testCase.press(testCase.App.ChooseButton_2)

            ChosenData = testCase.App.ChosenDataTable_3.Data;
            testCase.verifyEqual(ChosenData{1},TestCaseName)

           %% Modify fitting params
            testCase.type(testCase.App.SystemOrderNumberofPolesSpinner,2)
            testCase.type(testCase.App.NumberofZerosSpinner,2)

           %% Initiate Fitting Procedure
            testCase.press(testCase.App.GoButton_2)

           %% Get Result
             FitResultStruct = testCase.App.Fits_TFest;
             FitResult = FitResultStruct.FitsResults;
             OrderedPole = sort(pole(FitResult));
             FastestTau = -1/OrderedPole(1);
             
             Tau_b = R_b*C_b;
             Tau_tolerance = 0.01*(Tau_b);

              testCase.verifyTrue( abs(Tau_b-FastestTau) <= Tau_tolerance )

        end




    end

end