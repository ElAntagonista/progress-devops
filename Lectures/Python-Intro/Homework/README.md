
# Prerequisites
1. Your github repo where you'd commit your work
2. From the master branch create a branch called `DEVOPS-Python-Intro`
3. Work in the newly created branch
4. When ready create a pull request and invite me as a reviewer
5. Please check the notes on the github setup [here](../../Bash-Intro/Homework/README.md)

----------

# Tasks

## Get-Process
You are tasked to write a simple CLI tool that would help you determine if a processes with a matching name are running on the machine. The CLI tool should take only one argument (**process_name**) and this argument should be positional(no need to specify the argument name when calling the CLI). If there's no match the script should error out with a message "_No processes matching your criteria have been found_"

`get-process.py Chrome`
**Example Output**

    Process id -> 18601 - Process name -> Google Chrome
    Process id -> 18606 - Process name -> Google Chrome Helper (GPU)
    Process id -> 18607 - Process name -> Google Chrome Helper
    Process id -> 18613 - Process name -> Google Chrome Helper (Renderer)
    Process id -> 18614 - Process name -> Google Chrome Helper (Renderer)
    Process id -> 18615 - Process name -> Google Chrome Helper (Renderer)
    Process id -> 18616 - Process name -> Google Chrome Helper (Renderer)


**Hints**
- use the [psutil](https://psutil.readthedocs.io/en/latest/) library
    - The library has a function called __process_iter()__
    - Your job would be to iterate over it using a loop construct ()
- using string interpolation such as `f'Process id -> {process.name}'` to format your output string
    - read more about string formatting and interpolation [here](https://www.programiz.com/python-programming/string-interpolation)
- if using venv do not commit the venv directory
- I've already setup a scafold of the script so that argument parsing has been handled for you
- if you'd like to use the value of the 

