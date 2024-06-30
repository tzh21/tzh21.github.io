#!/bin/sh
# 在 source/_posts 目录下创建一个新的 markdown 文件。目录为当前日期，文件名为随机字符串。
current_date=$(date "+%Y/%m/%d")
mkdir -p "$current_date"
random_filename=$(openssl rand -base64 6 | head -c 8)
hexo new post -p "${current_date}/${random_filename}"
echo "hexo creates a post at: ${current_date}/${random_filename}.md"