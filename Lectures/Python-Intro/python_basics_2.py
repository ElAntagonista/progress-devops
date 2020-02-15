""" Scope
    The scope of a variable refers to the places
    that you can see or access a variable.
"""
# Global scope - top level of the script!
#
# This means that it could be accessed by functions, classes inside this package
# or other packages
x = 1

# Local scope


def local_scope():
    x = 5
    return x

# If we want to update a global scope variable inside a local scope
# we need to use the global keyword


def global_scope():
    # increment global with 1
    global x
    x = x + 1
    return x


print(x)
print(local_scope())
print(global_scope())
print(x)
