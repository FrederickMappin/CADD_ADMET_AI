// Enable DSL 2 syntax
nextflow.enable.dsl = 2

/*
========================================================================================
             ADMET-AI-NF PIPELINE - ADMET-AI PIPELINE
========================================================================================
ADMET-AI-NF PIPELINE Started 2025-01-02.
 #### Homepage / Documentation
https://github.com/FrederickMappin/CADD_ADMET_AI
 #### Authors
 FrederickMappin<https://github.com/FrederickMappin>
========================================================================================
========================================================================================

Pipeline steps:

    1. ADMET Prediction using ADMET-AI 
        - inputfile: File containing SMILES strings
        - outputfile: File containing ADMET predictions
*/

// Define parameters with defaults
params {
    inputfile = null
    outputfile = null
    outdir = 'results'  // Added default output directory
}

// Show help message
params.help = false
if (params.help){
    helpMessage()
    exit 0
}

// Print startup message
log.info """
===================================
Pocket Prediction Pipeline Started
===================================
Input directory : ${params.inputfile}
Output directory: ${params.outputfile}
Working directory: ${workflow.workDir}
===================================
"""

// Validate required inputs
if (!params.inputfile) {
    error "Input file parameter is required: --inputfile"
}

if (!params.outputfile) {
    error "Output file parameter is required: --outputfile"
}

/*
========================================================================================
             Channel Creation either from input directory or dataset file
========================================================================================
*/
// Create input channel from CSV file
input_ch = Channel.fromPath(params.inputfile)
    .ifEmpty { error "Cannot find input file: ${params.inputfile}" }


/*
========================================================================================
             Process 1A: ADMET Prediction using ADMET-AI
========================================================================================
*/

process ADMET_AI {
    tag "ADMET Prediction using ADMET-AI"
    publishDir "${params.outdir}", mode: 'copy'
    
    input:
    path csv_file
    
    output:
    path "preds.csv"
    
    script:
    """
    echo "Predicting ADMET properties using ADMET-AI"
    admet_predict \\
        --data_path ${csv_file} \\
        --save_path preds.csv \\
        --smiles_column smiles
    """
}

/*
========================================================================================
             Workflow Definition
========================================================================================
*/

workflow {
    // Run ADMET prediction
    ADMET_AI(input_ch)
}





