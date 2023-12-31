#!/bin/bash

# Function to create a Python virtual environment
create_virtualenv() {
    echo "Creating a Python virtual environment..."
    python3 -m venv venv
    echo "Virtual environment 'venv' created."
}

# Function to activate the virtual environment
activate_virtualenv() {
    echo "Activating the virtual environment..."
    source venv/bin/activate
    echo "Virtual environment activated."
}

# Function to install Django
install_django() {
    echo "Installing Django..."
    pip install django
    echo "Django installed."
}

#Function to instal mod_wsgi and apache
install_mod_wsgi() {
    read -p "Do you want to use Apache server with Django? (y/n): " choice

    if [[ $choice == "y" || $choice == "Y" ]]; then
        echo "Installing mod_wsgi-httpd and mod_wsgi..."

        # Install mod_wsgi-httpd
        pip install -v mod_wsgi-httpd

        # Install mod_wsgi
        pip install mod_wsgi

        echo "mod_wsgi-httpd and mod_wsgi installed successfully."
    else
        echo "Skipping mod_wsgi installation."
    fi
}

# Function to create a new Django project
create_django_project() {
    echo "Creating a new Django project named 'core'..."
    django-admin startproject core .
    echo "Django project 'core' created."
}

# Function to initialize Git and create .gitignore file
initialize_git() {
    echo "Initializing Git repository..."
    git init 
    echo "Git repository initialized."
    
    echo "Creating .gitignore file..."
    echo -e "# Ignore files generated by Django\n*.pyc\n*.pyo\n__pycache__/\n\n# Ignore the virtual environment directory\nvenv/\n\n# Ignore the Django secret key\ncore/secret_key.txt\n\n# Ignore static files collected by collectstatic\nstaticfiles/\n\n# Ignore media files\nmedia/\n\n# Ignore database file\ndb.sqlite3\n\n# Ignore IDE-specific files\n.vscode/\n.idea/\n\n# Ignore log files\n*.log\n\n# Ignore environment-specific files\n.env\n.env.local\n.env.*.local\n\n# Ignore other generated or temporary files\n*.swp\n*.swo\n*~\n\n# Ignore local development configuration files\nlocal_settings.py\n\n# Ignore deployment-specific files and directories\ndeployment/" > .gitignore
    echo ".gitignore file created."
}
# Main function to execute the script
main() {
    create_virtualenv
    activate_virtualenv
    install_django
    install_mod_wsgi
    create_django_project
    initialize_git
}

# Call the main function
main
