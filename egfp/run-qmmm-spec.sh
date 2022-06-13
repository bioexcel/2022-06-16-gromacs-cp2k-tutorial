#!/bin/bash
#SBATCH -J egfp-qmmm-spec
#SBATCH --time=00:20:00
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --account=ta072
#SBATCH --reservation=ta072_1840222
#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=4

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module purge
module use /work/ta072/ta072/shared/modulefiles/gromacs2022
module load gmx_cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun gmx_mpi_d mdrun -s egfp-qmmm-spec.tpr -deffnm egfp-qmmm-spec
