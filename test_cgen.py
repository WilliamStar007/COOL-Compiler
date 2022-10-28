import glob
import itertools
import subprocess
import os
import sys


# global variables for testing
test_name = "*.cl"
test_f = "*.cl-type"
output_f = "*.s"
correct_f = "*.s-correct"
correct_result = ""
our_result = ""
file_created = False


def test_arith():
    cool_f = "tests/arith.cl"
    set_globals(cool_f)

    # terminate program if error found
    if not is_valid():
        assert False


def test_arithmetic():
    for cool_f in itertools.chain(glob.glob("tests/arithmetic*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_assignment():
    for cool_f in itertools.chain(glob.glob("tests/assignment*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_atoi():
    for cool_f in itertools.chain(glob.glob("tests/atoi*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_attributes():
    for cool_f in itertools.chain(glob.glob("tests/attributes*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_basic():
    for cool_f in itertools.chain(glob.glob("tests/basic*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_block():
    for cool_f in itertools.chain(glob.glob("tests/block*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_case():
    for cool_f in itertools.chain(glob.glob("tests/case*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_cell():
    cool_f = "tests/cell.cl"
    set_globals(cool_f)

    # terminate program if error found
    if not is_valid():
        assert False


def test_class():
    for cool_f in itertools.chain(glob.glob("tests/class*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_compare():
    cool_f = "tests/compare.cl"
    set_globals(cool_f)

    # terminate program if error found
    if not is_valid():
        assert False


def test_conditional():
    for cool_f in itertools.chain(glob.glob("tests/conditionals*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_dispatch():
    for cool_f in itertools.chain(glob.glob("tests/dispatch*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_eq():
    for cool_f in itertools.chain(glob.glob("tests/eq*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_features():
    for cool_f in itertools.chain(glob.glob("tests/features*.cl")):
        set_globals(cool_f)

        # terminate program if error found
        if not is_valid():
            assert False


def test_fib():
    cool_f = "tests/fib.cl"
    set_globals(cool_f)

    # terminate program if error found
    if not is_valid():
        assert False


def test_graph():
    cool_f = "tests/graph.cl"
    set_globals(cool_f)

    # terminate program if error found
    if not is_valid():
        assert False


def is_valid():
    global test_name, test_f, output_f, correct_f, correct_result, our_result, file_created

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

        print("Stdout:")
        subprocess.run(["icdiff", "tests/our.stdout", "tests/correct.stdout"])
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
            return False
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
        subprocess.run(["icdiff", output_f, correct_f])
        return False
    else:
        print("PASS:", test_name)

    return True


def set_globals(cool_f):
    global test_name, test_f, output_f, correct_f, correct_result, our_result, file_created

    test_name = os.path.basename(cool_f)
    test_f = cool_f + "-type"
    output_f = cool_f[:len(cool_f) - 3] + ".s"
    correct_f = output_f + "-correct"

    # generate "*.cl-type" file
    subprocess.run(["./cool-osx", "--type", cool_f])
