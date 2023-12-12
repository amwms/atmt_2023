#!/bin/bash

python translate_beam.py \
        --data data/en-fr/prepared \
        --dicts data/en-fr/prepared \
        --checkpoint-path assignments/03/lexical/checkpoints10/checkpoint_last.pt \
        --output assignments/05/task4/translations/original_translations_n_3.txt \
        --beam-size 4 \
        --N 3 

bash scripts/postprocess.sh assignments/05/task4/translations/original_translations_n_3.txt assignments/05/task4/translations/original_translations_n_3.p.txt en

cat assignments/05/task4/translations/original_translations_n_3.p.txt | sacrebleu data/en-fr/raw/test.en > assignments/05/task4/results/original_results_n_3.txt


for c in 0.5 1.0 1.5 2.0 3.0 4.0 5.0
do
    python translate_beam.py \
        --data data/en-fr/prepared \
        --dicts data/en-fr/prepared \
        --checkpoint-path assignments/03/lexical/checkpoints10/checkpoint_last.pt \
        --output assignments/05/task4/translations/translations_n_3_g_$c.txt \
        --beam-size 4 \
        --N 3 \
        --gamma $c

    bash scripts/postprocess.sh assignments/05/task4/translations/translations_n_3_g_$c.txt assignments/05/task4/translations/translations_n_3_g_$c.p.txt en

    cat assignments/05/task4/translations/translations_n_3_g_$c.p.txt | sacrebleu data/en-fr/raw/test.en > assignments/05/task4/results/results_n_3_g_$c.txt
done