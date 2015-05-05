#!/bin/sh

src_dir=.
dst_dir=_posts

rm -rf $dst_dir/*.md
cp $src_dir/*.md $dst_dir/
cd $dst_dir
ls -1 *.md  | xargs -I {} mv {} `date "+%Y-%m-%d-"{}`
