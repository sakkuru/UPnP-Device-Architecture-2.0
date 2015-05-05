#!/bin/sh

dir=jekyll-files/_posts

echo $dir
rm -rf $dir/*
cp *.md $dir/
cd $dir
ls -1  | xargs -I {} mv {} `date "+%Y-%m-%d-"{}`
