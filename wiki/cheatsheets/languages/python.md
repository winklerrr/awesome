# Awesome Python Cheatsheet

## Basics

**Installing PIP**

```
sudo apt update && sudo apt install python3-pip
```

## Relative Imports

In Python3 relative import DO NOT work!
Let's assume we have the following project structure:

```
package/
  __init__.py
  main.py

  subpackage_1/
    __init__.py
    module_1.py

  subpackage_2/
    __init__.py
    module_2.py

```

So, in order to test code from a single file, say `module2.py`, which imports code from a file in a sibling package, say `module1.py`, do:

```
# in module2.py
from package.subpackage1.module_1 import a_function
```

Now `cd` back to `package` and call Python like so:

```
python3 -m package.subpackage2.module_2
```

## Fine Tuning

**Make Python scripts executable**

By adding the following shebang to the beginning of your Python script,
the script can be executed with `. script-name.py`:

```
#!/usr/bin/env python3
```

## Virtual Env

Create a virtual environment `venv`:

1. Inside your project folder or
2. Above all your projects using that venv.

To create the virtual environment for Python3 projects use the `venv` module 
(the `virtualenv` module was used for Python2):

```
python3 -m venv my_project_folder/venv

# activate your venv
my_project_folder\Scripts\activate.bat  # Windows
source my_project_folder/bin/activate  # Linux
```

After setting up and activating the virtual environment, 
install all necessary modules needed for the project(s).

**Hint:** 
The virtual environment shouldn't be commited to version control 
to avoid problems when developing on Windows and Linux systems simillarly.
So add the virtual environment to your `.gitignore` file.

To keep track of the installed Python modules and dependencies,
use a `requirenments.txt` which is then commited to the version control.

```
# save all installed modules and their currently installed version
pip freeze > requirements.txt

# to install them again
pip install -r requirements.txt
```


