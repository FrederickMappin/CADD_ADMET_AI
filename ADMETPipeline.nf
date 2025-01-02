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
        - outdir: Directory to save ADMET predictions
*/

// Define parameters with defaults
params.inputfile = null
params.outdir = "$projectDir/results/" // Added default output directory


// Help message function
def helpMessage() {
    log.info """
========================================================================================
                ADMET-AI-NF PIPELINE - Help Message
========================================================================================

    Usage:
The typical command for running the pipeline is as follows:
nf-Pocket Prediction has four different modes that differ based on input type, protein model, and pocket predictor.
========================================================================================
# Run P2Rank Predictor on a Directory of PDB files 

    nextflow run ADMETPipeline.nf --inputfile <path_to_input_file> --outdir <path_to_output_directory>

""".stripIndent()
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
Input file       : ${params.inputfile}
Output directory : ${params.outdir}
Working directory: ${workflow.workDir}
===================================
"""

// Validate required inputs
if (!params.inputfile) {
    error "Input file parameter is required: --inputfile"
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

process ADMET_PRED {
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
    ADMET_PRED(input_ch)
}





