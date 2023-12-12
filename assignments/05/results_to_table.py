import json
array = ""
for i in range(1, 26):
    with open(f"lexical/results/results_k_{i}.txt", "r") as f:
        with open(f"baseline/results/results_k_{i}.txt", "r") as g:
            json_data_l = json.load(f)
            json_data_b = json.load(g)
            array += f"{i} & {json_data_l['score']} & {json_data_b['score']} \\\ \n \\hline \n"

print(array)