""" Control flow and functions
"""
# If statements
is_winter = False
if is_winter:
    # both ' and ". pick one when coding for consistency
    print("Borovets here I come")
else:
    print("Greece here I come")

"""Loops
"""
# For loop

# lists hold multiple values
groceries = []
groceries.append("beer")
groceries.append("tomato")
print(groceries)  # will print ["birichka", "hlqb"]
# we can iterate lists by using for-loop
# the below for-loop will iterate over the groceries list.
# there will be as many iteration of this loop as there are elements in the list
# at each iteration, the variable `x` will be assigned with the currently iterated element
# within the body of the loop (the indented block below the "for") the variable `x` will
# have the currently iterated element. When the body finishes, the next element will
# assigned to x and the body will be executed again.
for x in groceries:
    print(x)


# While loop
x = 0
while x < len(groceries):
    print(groceries[x])
    x += x + 1


"""Functions
   Structuring our code is of at most importance.
   Python let's us structure(encapsulate) our code using functions.
   Other encapsulation structures are classes(out of the scope of this course)
"""
# Functions are declared with the def keyword
# A function strcture looks like this 'def functionname(params):'


def sum_two_numbers(a, b):
    return a + b


print(sum_two_numbers(1, 2))
