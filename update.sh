#!/bin/sh
# 生成静态文件并部署到 GitHub Pages。将 source 分支推送到 hexo 分支。
hexo g
git add *
git commit -m "update"
git push origin hexo
hexo d