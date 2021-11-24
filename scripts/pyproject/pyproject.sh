help()
{
   # Display Help
   echo "Create a new best practices python project, using poetry!"
   echo
   echo "Syntax: pyproject name"
   echo "required:"
   echo "   name:   The name of the project and project folder."
   echo "options:"
   echo "   v:      The python version:: TODO"
   echo "   h:      Print this Help."
   echo
}

# Help if -h is set
while getopts ":h" option; do
   case $option in
      h) # display Help
         help
         exit;;
   esac
done

# Location of the script and the python project initialisers
SCRIPT_DIR=~/scripts/bash/pyproject
PROJECT_DIR=$1

# New project with poetry and cd in
poetry new ${PROJECT_DIR}
cd ${PROJECT_DIR}


# Copy over the python stuff
cp ${SCRIPT_DIR}/.gitignore ./
cp ${SCRIPT_DIR}/setup.cfg ./
cp ${SCRIPT_DIR}/.pre-commit-config.yaml ./
cat ${SCRIPT_DIR}/pyproject.toml >> ./pyproject.toml
poetry install 
git init
pre-commit install
