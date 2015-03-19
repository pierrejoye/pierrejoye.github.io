if [ $# -ne 1 ]; then
echo "usage: ./publish.sh \"commit message\""
exit 1;
fi

git stash
git checkout master

cp -R output_prod/* .
rm -rf output_*

git add *
git commit -m "$1"
git push origin --all

git checkout gh-pages
git stash pop
