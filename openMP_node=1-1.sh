# Source: https://www.lrz.de/services/compute/linux-cluster/batch_parallel/example_jobs/

#!/bin/bash
#SBATCH -o /home/hpc/.../.../myjob.%j.%N.out 
#SBATCH -D /home/hpc/.../.../mydir 
#SBATCH -J jobname 
#SBATCH --get-user-env 
#SBATCH --clusters=myri
#SBATCH --nodes=1-1 
#SBATCH --cpus-per-task=32 
#SBATCH --mail-type=end 
#SBATCH --mail-user=xyz@xyz.de 
#SBATCH --export=NONE 
#SBATCH --time=08:00:00 
source /etc/profile.d/modules.sh
cd mydir
export OMP_NUM_THREADS=32
# up to 32 threads can be configured on the Myrinet nodes (see below) 
# The used value should be consistent 
# with --cpus-per-task above
./myprog.exe
