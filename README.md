
# Django-setup

This repository contains a couple of Bash functions for setting up a basic Django project.  

## What does it do?

- Creates and activates a Python virtual environment using venv.
- Installs Django and creates a Django project named "core" in the current working directory.
- Provides options to install mod_wsgi.
- Initializes Git and creates a .gitignore file for Django.

## How to use?

1. Clone this repository or download the 'Django-base.sh' file.
2. Create an alias in your .bashrc file to source this script.  
    For example, add the following line:  
    `alias my-django-setup='source /path/to/django-base.sh'`
   
It is advisable to source this script instead of executing it as a standalone Bash script.  
Otherwise, you would need to activate the environment manually.
