#!/bin/bash
#SBATCH --time=08:00:00
#SBATCH --job-name="dlmos-knl"
#SBATCH --output="stdout.64"
#SBATCH --error="stderr.64"
#SBATCH --export=all
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --partition=knl

cd $SLURM_SUBMIT_DIR
export MPI_EXEC=srun

module load anaconda3/5.0.0.1
source activate testenv

export OMP_NUM_THREADS=1

command="$MPI_EXEC python test_dst.py"
$command
