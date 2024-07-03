#!/bin/sh

   git filter-branch --env-filter '
   OLD_EMAIL="rich.paredes@suse.com"
   CORRECT_NAME="DailyDoseofDevops"
   CORRECT_EMAIL="dosedevops@gmail.com"
   if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_COMMITTER_NAME="$CORRECT_NAME"
       export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
   fi
   if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_AUTHOR_NAME="$CORRECT_NAME"
       export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
   fi
   ' --tag-name-filter cat -- --branches --tags   

git filter-repo --commit-callback '
   if commit.author_email == b"rich.paredes@suse.com":
       commit.author_name = b"DailyDoseofDevops"
       commit.author_email = b"dosedevops@gmail.com"
   if commit.committer_email == b"rich.paredes@suse.com":
       commit.committer_name = b"DailyDoseofDevops"
       commit.committer_email = b"dosedevops@gmail.com"
'
