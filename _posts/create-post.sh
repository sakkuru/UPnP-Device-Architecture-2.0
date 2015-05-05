#!/bin/sh

src_dir=..
dst_dir=.

rm -rf $dst_dir/*
cp $src_dir/*.md $dst_dir/
cd $dst_dir
ls -1  | xargs -I {} mv {} `date "+%Y-%m-%d-"{}`
