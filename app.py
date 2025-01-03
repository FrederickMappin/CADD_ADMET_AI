import streamlit as st
import os

def main():
    st.title("ADMET Pipeline Command Generator")

    # Input for SMILES strings file
    input_file = st.text_input('Input File (path to SMILES strings file)', value='')
    
    # Input for output directory
    output_dir = st.text_input('Output Directory (path to save ADMET predictions)', value='')

    # Construct the command
    command = f"nextflow run ADMETPipeline.nf --inputfile {input_file} --outdir {output_dir}"
    st.write(f"Generated Command: `{command}`")

    # RUN button
    if st.button("RUN"):
        # Execute the command
        os.system(command)
        st.success('Command executed!')

if __name__ == "__main__":
    main()