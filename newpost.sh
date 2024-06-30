#!/bin/sh
# 在 source/_posts 目录下创建一个新的 markdown 文件。目录为当前日期，文件名为当前时刻。
current_date=$(date "+%Y/%m/%d")
filename=$(date "+%H%M%S")
mkdir -p "$current_date"
hexo new post -p "${current_date}/${filename}"
echo "hexo creates a post at: ${current_date}/${filename}.md"