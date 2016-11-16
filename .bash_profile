for file in ~/.dotprofile/profile/*
do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
  echo $file;
done