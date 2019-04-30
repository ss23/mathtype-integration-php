# This deploy file synchronizes the PHP library branches with it's Moodle dependencies.
#
# The structure among the API and it's dependencies is the following:
#                 PHP library                              Dependency
# master          x---x---x                 master         o---o---o
# feature branch  x---x---x---X     -->     feature branch o---o---o---O

# Steps to synchronize:
# 1.- Create a new branch - if needed - in the dependency repository with the same name.
# 2.- In case of changes in the library - or a new branch - push the changes to de dependent repository.

# Dependencies:
# - Filter
#   * GitHub repository: moodle-filter_wiris.git/
#   * Version file: version.php

# Set GitHub environment
git config --global user.email "travis@travis-ci.org";
git config --global user.name "Travis CI";

git clone https://github.com/wiris/moodle-filter_wiris.git;
cd moodle-filter_wiris;
git checkout -B $BRANCH
if [[ `git branch --list $BRANCH` ]]
then
    echo "Branch name $BRANCH already exists... pull content."
    git pull origin $BRANCH
fi
# Copy library files, excluding .travis, scripts, readme...
cp -rf ../integration/ .
cp ../configuration.ini.dist .
if [[ `git status --porcelain` ]]
then
    git add $(git diff --name-only);
    git commit -m "$BRANCH: Update PHP library";
    git push https://$GH_TOKEN@github.com/wiris/moodle-filter_wiris.git $BRANCH > /dev/null 2>&1;
else
    echo "No changes. Skiping deploy in moodle-filter_wiris repository".
fi
