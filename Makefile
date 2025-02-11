current_date := $(shell date "+%Y/%m/%d")
filename := $(shell date "+%H%M%S")

# 在 source/_posts 目录下创建一个新的 markdown 文件。目录为当前日期，文件名为当前时刻。
n:
	mkdir -p "$(current_date)"
	hexo new post -p "$(current_date)/$(filename)"
	echo "hexo creates a post at: $(current_date)/$(filename).md"

# 生成静态文件并部署到 GitHub Pages。将 source 分支推送到 hexo 分支。
u:
	hexo g
	git add .
	git commit -m "update"
	git push origin hexo
	hexo d

# 安装依赖
i:
	npm install

# 本地运行
r:
	hexo s

