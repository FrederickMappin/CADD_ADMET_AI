# NF-ADMET-AI
nf-admet-ai is nextflow workflow designed to allow robust usage of admet-ai.

ADMET: The evaluation of pharmacokinetics and toxicity is crucial for the design of new therapeutic candidates. In silico virtual screens and generative AI output a vast number of molecules that must be filtered to a tractable number for synthesis and experimental validation. An effective primary filter is to evaluate candidate compounds based on their Absorption, Distribution, Metabolism, Excretion, and Toxicity (ADMET) properties.

Models: ADMET-AI predicts ADMET properties using a graph neural network architecture called Chemprop-RDKit (see the Chemprop package for details). ADMET-AI's Chemprop-RDKit models were trained on 41 ADMET datasets from the Therapeutics Data Commons (TDC). ADMET-AI’s Chemprop-RDKit models have the highest average rank on the TDC ADMET Benchmark Group leaderboard. ADMET-AI is also currently the fastest web-based ADMET predictor.

References: The ADMET-AI code can be found at github.com/swansonk14/admet_ai, and ADMET-AI is described in detail in this paper: ADMET-AI: A machine learning ADMET platform for evaluation of large-scale chemical libraries. Please cite us if ADMET-AI is useful in your work.


# In Progress
