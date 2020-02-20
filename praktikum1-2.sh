#!bin/bash

Password=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
v="$1"
tempFile_name=${v::-4}
if [[ $tempFile_name =~ [0-9] ]]
  then
  fixFile_name=${tempFile_name//[0-9]/}
else
  fixFile_name=$tempFile_name
fi
now=`date +"%H"`;
case "$now" in
  "0")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[a-zA-Z]')
  ;;
  "1")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[b-zaB-ZA]')
  ;;
  "2")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[c-za-bC-ZA-B]')
  ;;
  "3")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[d-za-cD-ZA-C]')
  ;;
  "4")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[e-za-dE-ZA-D]')
  ;;
  "5")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[f-za-eF-ZA-E]')
  ;;
  "6")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[g-za-fG-ZA-F]')
  ;;
  "7")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[h-za-gH-ZA-G]')
  ;;
  "8")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[i-za-hI-ZA-H]')
  ;;
  "9")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[j-za-iJ-ZA-I]')
  ;;
  "10")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[k-za-jK-ZA-J]')
  ;;
  "11")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[l-za-kL-ZA-K]')
  ;;
  "12")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[m-za-lM-ZA-L]')
  ;;
  "13")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[n-za-mN-ZA-M')
  ;;
  "14")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[o-za-nO-ZA-N]')
  ;;
  "15")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[p-za-oP-ZA-O]')
  ;;
  "16")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[q-za-pQ-ZA-P]')
  ;;
  "17")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[r-za-qR-ZA-Q]')
  ;;
  "18")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[s-za-rS-ZA-R]')
  ;;
  "19")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[t-za-sT-ZA-S]')
  ;;
  "20")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[u-za-tU-ZA-T]')
  ;;
  "21")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[v-za-uV-ZA-U]')
  ;;
  "22")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[w-za-vW-ZA-V]')
  ;;
  "23")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[x-za-wX-ZA-W]')
  ;;
esac
echo $Password > $nameFile.txt
echo "Real Name is: $fixFile_name" >> $nameFile.txt
echo "Build in: " $(date +"%H:%M") >> $nameFile.txt
