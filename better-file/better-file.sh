#! /bin/bash
IFS=$'\n'

function betterFileName (){
  if [ -z $1 ];
  then
    echo "first param is required, path"
    return
  fi
  for file in `ls $1`
  do
    new=`tr '[A-Z]' '[a-z]' <<<"$file" | sed s/[[:space:]]//g`
    if [ "$file" != "$new" ];
    then
      cd $1
      mv $file $new
      file=$new
      echo "Rename file [$file] to [$new]"
    fi

    if [ -d "$1/$file" ];
    then
      betterFileName $1/$file
    fi
  done
}

betterFileName $1 
