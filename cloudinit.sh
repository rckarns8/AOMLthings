#!/bin/bash
#SBATCH --job-name=TEST      # Job name 
#SBATCH --output=TEST.log     # Standard output and error log     

#Install Miniconda

mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash

~/miniconda3/bin/conda init zsh

exec bash

conda install mamba -y -n base -c conda-forge 
 
mamba create -n mg-qc -y -c bioconda fastqc multiqc fastp seqkit

mamba create -n mg-coverage -y -c bioconda -c agbiome nonpareil bbtools seqkit

mamba create -n mg-diversity -y -c bioconda -c biobakery sourmash krona humann metaphlan seqkit

mamba create -n mg-assembly -y -c bioconda spades prodigal prokka kofamscan seqkit

mamba create -n mg-binning -y -c bioconda bowtie2 minimap2 maxbin2 metabat2 drep gtdbtk seqkit

mamba create -n mg-checkm -y -c auto checkm
