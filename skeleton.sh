#!/bin/bash

#this is a script

set -e

#echo "Creating project skeleton for your new project <$project_name>...."

echo -e '\0033\0143'
echo -e " \e[1m
=======================================================
             *** WELCOME TO pyProSkel! ***             
=======================================================
 \e[21m"

echo '
 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  
\                                                     /
 \  This is a simple bash script, which creates a    /
  \  complete project structure for you, ready to   / 
   \       use on your new python project!         /
   / In order to proceed, execute this script from \   
  / the directory where you want to start your new  \
 /        project, and you are ready to go.          \   
/_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _\ 

'

echo -e "Please enter a name for your new python project!
"

# keep reading a new project name while the given one is already taken
while :
do

  while read -p '> project name: ' project_name && [[ -z "$project_name" ]] ; do
    echo "Please no blank names..."
  done

  if [ -d "$project_name" ]; then  
      echo ""
      echo -e "\e[91m$project_name already exists! Please enter another name: \e[0m" 
      echo
  else
    break
  fi
done

mkdir -p $project_name
mkdir -p $project_name/$project_name
mkdir -p $project_name/$project_name
mkdir -p $project_name/tests
mkdir -p $project_name/bin
mkdir -p $project_name/docs
mkdir -p $project_name/logs

# project's setup file
echo "from setuptools import setup

setup(name='$project_name',
      version=0.0,
      url='http://$project_name.org',
      description='',
      author='',
      license='',
      packages=[],
      zip_safe=False,
      install_requires=[])" > $project_name/setup.py

# project's readme
echo "# you should add your project's requirements here" >> $project_name/requirements.txt
echo "# add instructions for your projects installation here" >> $project_name/INSTALL.txt
echo "**This is your readme file!**
*add your documentation here...*" >> $project_name/readme.md
echo >> $project_name/$project_name/__init__.py
echo "start coding!! " >> $project_name/$project_name/get_started.py

# project's gitignore
echo "# you will probably want to have some stuff here! Like logs..." >> $project_name/.gitignore
echo "/logs" >> $project_name/.gitignore


#TODO: create project skeleton here

echo ""
echo -e "\e[1m--------- Your new project skeleton is ready! ---------\e[21m

The following file structure has been created:"

echo -e "\e[90m"

pwd=$project_name
find $pwd -print | sed -e "s;$pwd;\.;g;s;[^/]*\/;|__;g;s;__|; |;g"

# TODO: project name is being repalced by dots?

echo ""
echo -e "
\e[0mHave fun with it :)
\e[1m
=======================================================
=======================================================
\e[21m"


