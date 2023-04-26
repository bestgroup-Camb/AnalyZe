results_CCTfit = runtests("AnalyZeCircuitFitTest.m");
results_TxFnfit = runtests("AnalyZeTransferFnFitTest.m");

TestResults = [results_CCTfit,results_TxFnfit]