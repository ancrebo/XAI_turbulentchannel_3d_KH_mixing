#!/usr/bin/env bash
#SBATCH -A NAISS2024-5-129 -p alvis
#SBATCH --nodes 2 
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=A40:4
#SBATCH --cpus-per-task=64
#SBATCH --hint=nomultithread
#SBATCH --distribution=block:block
#SBATCH --time=10:00:00
#SBATCH --mail-type ALL
#SBATCH --mail-user andrescb@kth.se
#SBATCH --output ./testMW.out
#SBATCH --error  ./testMW.error

cd ./
module load  TensorFlow/2.11.0-foss-2022a-CUDA-11.7.0

unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
set -x
cd ${SLURM_SUBMIT_DIR}

srun python testmultiwork.py
