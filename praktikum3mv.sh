#!/bash/bin
echo "cat ls > name.log"
readarray line < wget.log
readarray filename < name.log
for ((i=0;i<28;i++))
  do
    a=${line[$i]}
    array[$i]=$a
    flag=0
    for ((j=0;j<i;j++))
    do
      if [[ "${array[$j]}" = "${array[$i]}" ]]
      then
        let flag++
      fi
    done
    if [[ "$flag" -gt 0 ]]
    then
      cd /home/feinard/Praktikum/.duplicate
      temp=1
      if [[ -e "duplicate_$temp" ]]
      then
        while [[ -e "duplicate_$temp" ]] ;
          do
            let  temp++
          done
          name=duplicate_$temp
      else
        name="duplicate_1"
      fi
      echo "$name"
      cd -
      a="${filename[$i]}"
      a="${a//[$'\n\r ']}"
      echo $a
      mv $a $name
      echo "MOVING DUPLICATE"
      mv "$name" /home/feinard/Praktikum/.duplicate
    elif [[ "$flag" -eq 0 ]]
    then
      cd /home/feinard/Praktikum/.kenangan
      temp=1
      if [[ -e "kenangan_$temp" ]]
        then
          while [[ -e "kenangan_$temp" ]] ;
            do
              let  temp++
            done
          name="kenangan_$temp"
      else
        name="kenangan_1"
      fi
      echo "$name"
      cd -
      b="${filename[$i]}"
      b="${b//[$s'\n\r ']}"
      echo $b
      mv $b $name
      echo "MOVING KENANGAN"
      mv "$name" /home/feinard/Praktikum/.kenangan
    fi
  done
  rm name.log
