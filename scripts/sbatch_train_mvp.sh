#!/bin/bash

#SBATCH -J VOXELPOSE_PAN_TRAIN
#SBATCH -p p-V100
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:2
#SBATCH -o /mntnfs/med_data5/wangjiong/3dpose_school/xrmocap/slurm_logs/train_%j.out
#SBATCH -e /mntnfs/med_data5/wangjiong/3dpose_school/xrmocap/slurm_logs/train_%j.out
#SBATCH --mail-type=ALL  # BEGIN,END,FAIL,ALL
#SBATCH --mail-user=yandq2020@mail.sustech.edu.cn

# export MASTER_PORT=$((12000 + $RANDOM % 2000))
set -x

# CFG_FILE="configs/mvp/campus_config/mvp_campus.py"
# CFG_FILE="configs/mvp/shelf_config/mvp_shelf.py"
# CFG_FILE="configs/mvp/panoptic_config/mvp_panoptic.py"
# CFG_FILE="configs/mvp/panoptic_config/mvp_panoptic_3cam.py"
CFG_FILE="configs/mvp/h36m_config/mvp_h36m.py"

# PYTHONPATH="$(dirname ./scripts/sbatch_train_mvp.sh)/..":$PYTHONPATH \
which python

python -m torch.distributed.launch --nproc_per_node=2 --use_env tools/train_model.py --cfg $CFG_FILE