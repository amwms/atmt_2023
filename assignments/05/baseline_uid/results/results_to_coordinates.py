import json
array = []
bp = []
for i in range(1, 26):
    with open(f"results_k_{i}.txt", "r") as f:
        json_data = json.load(f)
        array.append((i, float(json_data["verbose_score"][24:30])))
        # array.append((i, json_data["score"]))

str = " \\addplot[ \
    color=blue, \
    mark=dot,\
    ]\
    coordinates {" + str(array).replace("),", ")").replace("]", "").replace("[", "") + "};"

print(str)