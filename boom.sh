# a hundreds commits
Y=2019
mkdir $Y
cd $Y
for M in {1..12}
do
  mkdir $M
  cd $M
  #KK=31 #$((( RANDOM % 31 )  + 1))
  for D in {01..31}
  do
    mkdir $D
    cd $D
    Rep=$((RANDOM % 16 ))
#    for i in {01.."$Rep"}
    for (( i=1; i<=$Rep; i++ ))
    do
      echo "$i on $M/$D/$Y" > commit.md
      export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
      export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
      git add commit.md -f
      git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"
    done
    cd ../
  done
  cd ../
done
git push origin master
git rm -rf 20**
git commit -am "cleanup"
git push origin master