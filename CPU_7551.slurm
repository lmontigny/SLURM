#!/bin/bash
#SBATCH --time=08:00:00
#SBATCH --job-name="UoI"
#SBATCH --output="stdout"
#SBATCH --error="stderr"
#SBATCH --export=all
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=2
#SBATCH --partition=CPU_7551

source /etc/profile.d/modules.sh

cd $SLURM_SUBMIT_DIR
export MPI_EXEC=srun

module load   bench/jube-2.2.0        mpi/intelmpi/2018       lib/intel/hdf5/1.8.15   comp/gcc/7.3.0
source /cluster/intel/compilers_and_libraries_2018/linux/bin/compilervars.sh intel64

export OMP_NUM_THREADS=2
export KMP_AFFINITY=granularity=fine,verbose,compact,1,0
export KMP_SETTINGS=1

#I_MPI_DEBUG=5 mpirun -n 8  

command="$MPI_EXEC /home/lmontigny/git/UoI-HPDBSCAN/bin/hybrid/dbscan -m 40 -e 10 /home/lmontigny/git/UoI-HPDBSCAN/input/bremenSmall.h5.h5"
$command
