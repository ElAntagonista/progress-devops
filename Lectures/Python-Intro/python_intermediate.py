from collections import Counter

# Lambda functions
lambda_func = lambda x :  x ** 2 

# Expressions evaluted to either True or False
empty_stirng = ""
empty_list = []
none_value = None
print(
    f"Empty stirng - {bool(empty_stirng)},\nEmpty list - {bool(empty_list)},\nNone value - {bool(none_value)}")

# List comprehension
print([x for x in range(1, 40) if x % 2 == 0])
