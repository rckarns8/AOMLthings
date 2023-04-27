#!/bin/bash
#SBATCH --job-name=INIT      # Job name 
#SBATCH --output=INIT.log     # Standard output and error log     

#Install Miniconda

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

  
conda install mamba -n base -c conda-forge
 
mamba create -n mg-qc -c bioconda fastqc multiqc fastp seqkit

mamba create -n mg-coverage -c bioconda -c agbiome nonpareil bbtools seqkit

mamba create -n mg-diversity -c bioconda -c biobakery sourmash krona humann metaphlan seqkit

mamba create -n mg-assembly -c bioconda spades prodigal prokka kofamscan seqkit

mamba create -n mg-binning -c bioconda bowtie2 minimap2 maxbin2 metabat2 drep gtdbtk seqkit

mamba create -n mg-checkm -c auto checkm
