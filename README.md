<table align="center">
  <tr>
    <td align="center">
      <img src="https://github.com/FrederickMappin/CADD_ADMET_AI/blob/main/logo1.png" alt="Centered image" />
      <br/>
      <h1>TargetIDwithOT</h1>
    </td>
  </tr>
</table>



# NF-ADMET-AI
nf-admet-ai is nextflow workflow designed to allow robust usage of admet-ai.
ADMET: The evaluation of pharmacokinetics and toxicity is crucial for the design of new therapeutic candidates. In silico virtual screens and generative AI output a vast number of molecules that must be filtered to a tractable number for synthesis and experimental validation. An effective primary filter is to evaluate candidate compounds based on their Absorption, Distribution, Metabolism, Excretion, and Toxicity (ADMET) properties.

References: The ADMET-AI code can be found at (https://github.com/swansonk14/admet_ai), and ADMET-AI is described in detail in this paper: ADMET-AI: A machine learning ADMET platform for evaluation of large-scale chemical libraries. Please cite us if ADMET-AI is useful in your work.


## Dependencies 
Nf-ADMET-AI require running in an environment containing the listed programs. The required docker images will be automatically pulled when initating first run.   Please go to source for installation instructions:

- Nextflow
- Docker

## Usage
Nf-ADMET-AI take an input file containing chemical smiles and output ADMET metrics. An example of the proper formatted input file can be found in the test folder.
```
 nextflow run ADMETPipeline.nf --inputfile <path_to_input_file> --outdir <path_to_output_directory>
```

## Testing and Set-up
If first time running we recommend running test data.
Provided in sample Test folder is an input.csv file containing chemical smiles. To run command:

```
nextflow run ADMETPipeline.nf --inputfile ./test/input.csv --outdir ./results/
```


