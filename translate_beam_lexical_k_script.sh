#!/bin/bash

for (( c=1; c<=25; c++ ))
do
    python translate_beam.py \
        --data data/en-fr/prepared \
        --dicts data/en-fr/prepared \
        --checkpoint-path assignments/03/lexical/checkpoints10/checkpoint_last.pt \
        --output assignments/05/lexical/translations/translations_k_$c.txt \
        --beam-size $c

    bash scripts/postprocess.sh assignments/05/lexical/translations/translations_k_$c.txt assignments/05/lexical/translations/translations_k_$c.p.txt en

    cat assignments/05/lexical/translations/translations_k_$c.p.txt | sacrebleu data/en-fr/raw/test.en > assignments/05/lexical/results/results_k_$c.txt
done