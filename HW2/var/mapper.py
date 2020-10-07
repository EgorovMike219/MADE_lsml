import sys


sum_x_1 = 0
sum_x_2 = 0
count = 0

for line in sys.stdin:
    line = line.strip()
    try:
        line = line.split(",")
        price = int(line[-7])
    except Exception as e:
        continue
    sum_x_1 += price
    sum_x_2 += price**2
    count += 1

key = 0  # only one reducer
print(f"{key}\t{sum_x_1},{sum_x_2},{count}")
