#!/bin/bash

# Script to deploy changes made to robshomelab.net

# build Jekyll for production

JEKYLL_ENV=production bundle exec jekyll b

# commit changes to Git and use deploy hook to push changes to the server

git add .
read -p 'Commit message: ' message
git commit -m "$message"
git push
git push production master