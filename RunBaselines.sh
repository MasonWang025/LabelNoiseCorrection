#!/bin/bash

# bash RunBaselines.sh

# static mixup with hard bootstrapping (M-DYR-H)
# for noise levels 0, 20, 50, 80 (CIFAR-10)
# reproducing M-DYR-H row in Table 2

tensorboard --logdir=runs &

for i in 0 20 50 80
do
    echo "\n\tM-DYR-H WITH NOISE LEVEL OF $i\n" 
    python3 train.py --Mixup 'Static' --BootBeta 'Hard' --experiment-name 'M-DYR-H' \
	    --epochs 300 --M 100 250 --noise-level $i --reg-term 1.0 --dataset CIFAR10 --root-dir "datasets/cifar10"
done