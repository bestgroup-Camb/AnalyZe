%% Add Project Root folder to Session Path
    addpath('../../AnalyZe/')

%% Run Tests    

    results_CCTfit = runtests("AnalyZeCircuitFitTest.m");
    results_TxFnfit = runtests("AnalyZeTransferFnFitTest.m");
    results_MagCrossSection = runtests("AnalyZeMagCrossSectionTest");

%% Collate Results
    TestResults = [results_CCTfit,results_TxFnfit,results_MagCrossSection];
    display(TestResults)
    %generatePDFReport(TestResults,'./TestResults.pdf')