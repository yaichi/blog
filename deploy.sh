#!/bin/bash

echo 
echo -e "\033[0;32m部署更新到 GitHub（共 2 步）\033[0m"

echo 
echo -e "\033[0;32m1. 生成网站文件...\033[0m"
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
echo
# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

echo
echo -e "\033[0;32m2. 推送网站文件到 Github...\033[0m"
echo
git push origin master

echo
echo -e "\033[0;32m恭喜宝宝，网站更新成功。\033[0m"
echo
# Come Back up to the Project Root
cd ..
echo
echo -e "\033[0;32m 更新源码...\033[0m"
echo
git add .
git commit -m 'update blog'
git push origin master
echo
echo -e "\033[0;32m Done \033[0m"
echo