import glob
import itertools
import subprocess
import os
import sys
import pytest


# set executable conditions
subprocess.run(["chmod", "a+x", "./cool-osx"])
local_debug = False

# global variables for testing
test_name = "*.cl"
test_f = "*.cl-type"
output_f = "*.s"
correct_f = "*.s-correct"
cool_list = itertools.chain(glob.glob("tests/*.cl"))


# pytest function to test code generation
@pytest.mark.parametrize("cool_f", cool_list)
def test_cgen(cool_f):
    set_globals(cool_f)
    if not is_valid():
        assert False


# check output consistency (x86 assembly)
def is_valid():
    global test_name, test_f, output_f, correct_f

    # use compiler to generate correct output
    correct_result = subprocess.run(["./cool-osx", "--x86", test_f], capture_output=True, text=True)

    # save correct output generated by compiler
    file_created = os.path.isfile(output_f)
    if file_created:
        with open(output_f) as f:
            correct_answer = f.read().strip()
        os.replace(output_f, correct_f)

    # save our output
    our_result = subprocess.run([sys.executable, "src/main.py", test_f], capture_output=True, text=True)

    if our_result.stdout != correct_result.stdout or our_result.stderr != correct_result.stderr:
        print("FAIL:", test_name)
        with open("tests/our.stdout", "w") as f:
            f.write(our_result.stdout)
        with open("tests/our.stderr", "w") as f:
            f.write(our_result.stderr)
        with open("tests/correct.stdout", "w") as f:
            f.write(correct_result.stdout)
        with open("tests/correct.stderr", "w") as f:
            f.write(correct_result.stderr)

        if local_debug:
            print("Stdout:")
            subprocess.run(["icdiff", "tests/our.stdout", "tests/correct.stdout"])
        if local_debug:
            print("Stderr:")
            subprocess.run(["icdiff", "tests/our.stderr", "tests/correct.stderr"])
        os.remove("tests/our.stdout")
        os.remove("tests/our.stderr")
        os.remove("tests/correct.stdout")
        os.remove("tests/correct.stderr")
        return False

    if not file_created:
        if os.path.isfile(output_f):
            os.remove(output_f)
            print("FAIL:", test_name)
            print(f"Output file: {output_f} should not have been created")
            assert False
        # If the file wasn't created, there's nothing else to check
        print("PASS:", test_name)
        return True

    if not os.path.isfile(output_f):
        print("FAIL:", test_name)
        print(f"Output file: {output_f} was not created")
        return False

    with open(output_f) as f:
        our_answer = f.read().strip()

    if our_answer != correct_answer:
        print("FAIL:", test_name)
        if local_debug:
            subprocess.run(["icdiff", output_f, correct_f])
        return False
    else:
        print("PASS:", test_name)

    return True


# set filenames
def set_globals(cool_f):
    global test_name, test_f, output_f, correct_f

    test_name = os.path.basename(cool_f)
    test_f = cool_f + "-type"
    output_f = cool_f[:len(cool_f) - 3] + ".s"
    correct_f = output_f + "-correct"

    # generate "*.cl-type" file
    subprocess.run(["./cool-osx", "--type", cool_f])
