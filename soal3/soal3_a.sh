# https://www.geeksforgeeks.org/wget-command-in-linux-unix/
# !/bin/bash
for ((num=1; num<=28; num=num+1))
do
  # echo $num
  # wget -O pdkt_kusuma_$num "https://loremflickr.com/320/240/cat"
  wget -a wget.log -O pdkt_kusuma_$num "https://loremflickr.com/320/240/cat"
done
