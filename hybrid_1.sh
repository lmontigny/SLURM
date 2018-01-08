#!/bin/bash 
#SBATCH -o /home/hpc/..../.../myjob.%j.%N.out 
#SBATCH -D /home/hpc/.../.../mydir 
#SBATCH -J Jobname 
#SBATCH --get-user-env 
#SBATCH --clusters=mpp2
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=7
# the above is a good match for the
# CooLMUC2 architecture.
#SBATCH --mail-type=end 
#SBATCH --mail-user=xyz@xyz.de 
#SBATCH --export=NONE 
#SBATCH --time=08:00:00
source /etc/profile.d/modules.sh

cd $SCRATCH/mydata
export OMP_NUM_THREADS=7
mpiexec -n 16 --perhost 4 $HOME/exedir/myprog.exe
# will start 16 MPI tasks with 7 threads each. Note that
# each node has 28 cores, so 4 tasks must be started 
# per host.
