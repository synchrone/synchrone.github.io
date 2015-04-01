#!/bin/bash
composer install -d vendor/synchrone/markdown-resume/

php vendor/synchrone/markdown-resume/md2resume_dev.php html -t "`pwd`/template/" index.md .
sed -i 's|href="http|target="_blank" href="http|g' index.html

php vendor/synchrone/markdown-resume/md2resume_dev.php pdf -t "`pwd`/template/" index.md .
mv index.pdf aleksandr\ bogdanov\ software\ developer.pdf
