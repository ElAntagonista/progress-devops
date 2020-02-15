""" File I/O
    Using python for File I/O is a relatievly straight-forward
"""

# Write to file
# Let's make simple list
groceries = ["beer", "pasta", "bread"]
with open("sample.txt", 'w+') as file_:
    for item in groceries:
        file_.writelines(item + "\n")


# Read from a file
with open("sample.txt", 'r') as filer_:
    for line in filer_.readlines():
        print(line)
