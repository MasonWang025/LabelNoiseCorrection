#!/bin/bash

# bash RunHiddenMIxupTests.sh

# static latent rep mixup with hard bootstrapping (LRM-DYR-H)
# for noise levels 0, 20, 50, 80 (CIFAR-10)
# comparing with M-DYR-H row in Table 2

# tensorboard --logdir=runs &

for i in 0 50 20 0 80
do
    printf "\n\tLLRM-DYR-H WITH NOISE LEVEL OF $i\n\n" 
    python3 train.py --Mixup 'Hidden' --BootBeta 'Hard' --experiment-name 'LLRM-DYR-H' \
	    --epochs 300 --M 50 100 150 250 --noise-level $i --reg-term 2 --dataset CIFAR10 --tb-dir "runs-${i}" --root-dir "datasets/cifar10"
done