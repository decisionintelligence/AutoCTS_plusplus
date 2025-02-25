#!/bin/bash

export PYTHONPATH=../
export CUDA_VISIBLE_DEVICES=6
seq_len=12
sample_num=20
exp_id=1
epochs=5
in_dim=1
datatype="subset"
base="ETT-small/ETTm1"
dataset=("2" "5" "14")
mode="noisy_seeds"
train_script="../exps/generate_seeds.py"
for set in "${dataset[@]}"; do
    python  $train_script --dataset "${base}_${set}" \
                          --datatype $datatype \
                          --in_dim $in_dim \
                          --seq_len $seq_len \
                          --mode $mode \
                          --epochs $epochs \
                          --exp_id $exp_id \
                          --sample_num $sample_num
done