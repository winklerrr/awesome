# Python Awesome List

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
The virtual environment shouldn't be commited to version control, 
to avoid problems when developing on Windows and Linux systems simillarly.

To keep track of the installed Python modules and dependencies,
use a `requirenments.txt` which is then commited to the version control.

```
# save all installed modules and their currently installed version
pip freeze > requirements.txt

# to install them again
pip install -r requirements.txt
```


