#!/bin/bash 
#SBATCH -o /home/hpc/.../.../myjob.%j.%N.out 
#SBATCH -D /home/hpc/.../.../mydir 
#SBATCH -J Jobname 
#SBATCH --get-user-env 
#SBATCH --clusters=mpp3
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=16
#SBATCH --mail-type=end 
#SBATCH --mail-user=xyz@xyz.de 
#SBATCH --export=NONE 
#SBATCH --time=08:00:00 
source /etc/profile.d/modules.sh 
cd $SCRATCH/mydata 
export OMP_NUM_THREADS=4
mpiexec $HOME/exedir/myprog.exe
# will start 128 MPI tasks with 4 threads each
