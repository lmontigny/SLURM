#!/bin/bash
#SBATCH -o /home/hpc/.../.../myjob.%j.%N.out 
#SBATCH -D /home/hpc/.../.../mydir 
#SBATCH -J Jobname 
#SBATCH --get-user-env 
#SBATCH --clusters=mpp2
#SBATCH --ntasks=112
# multiples of 28 for mpp2
#SBATCH --mail-type=end 
#SBATCH --mail-user=xyz@xyz.de 
#SBATCH --export=NONE 
#SBATCH --time=08:00:00 
source /etc/profile.d/modules.sh
cd $SCRATCH/mydata
mpiexec $HOME/exedir/myprog.exe
