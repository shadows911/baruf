#!/bin/bash

temp=

function redirect_top {
  cat <<- EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">

EOF
}

function redirect_bottom {
  cat <<- EOF

</head>
<body>
</html>

EOF
}

for page in "$@"
do
    # http://stackoverflow.com/a/2664746
    file=`basename "$page"`

    echo -e "$(tput setaf 2)Updating $page ...$(tput sgr0)"
    name=`basename -s .html "$file"`
    redirect_top > temp.html
    echo "<title>$file has moved!</title>" >> "$path$file"
    echo "<meta http-equiv=\"refresh\" content=\"0;url=http://sbshit.com/nonsense/$name/index.html\">"  >> temp.html
    redirect_bottom >> temp.html
    mv temp.html $file
done
