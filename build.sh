pandoc index.md > index.html

rm -rf _posts

mkdir _posts

for post in $(ls posts);do
  html_file=$(echo $post|sed "s/.md/.html/g")
  pandoc posts/$post > _posts/$html_file
done
