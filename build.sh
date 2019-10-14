#!/bin/bash
php composer.phar install -d vendor/synchrone/markdown-resume/

php vendor/synchrone/markdown-resume/md2resume_dev.php html -t "`pwd`/template/" index.md .
sed -i 's|href="http|target="_blank" href="http|g' index.html

[ "$1" == "nopdf" ] && exit 0
#running wkhtmltopdf in xvfb in xorgless env
php vendor/synchrone/markdown-resume/md2resume_dev.php pdf -t "`pwd`/template/" index.md .
mv index.pdf "cv aleksandr bogdanov.pdf"
